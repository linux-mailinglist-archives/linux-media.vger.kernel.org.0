Return-Path: <linux-media+bounces-4692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61151849882
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 12:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86EB2860CA
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 11:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E054418AF6;
	Mon,  5 Feb 2024 11:10:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210418635
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707131434; cv=none; b=VKeONRumFG6+iRc2Q3eRT6NMUZrk8BedNgkvxNf4gDmlYxwa/4cA3nBOx2mWxaoepHi62uAVStLS0CEY1R/f67NTQ0Yg7t3D1yudvQkIABImXScCA7fJPsRf6+QMX0esRmDeBEtPlExR+lgyMatrrUMA42zasBmn0TD4VQDTV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707131434; c=relaxed/simple;
	bh=g7UKS1fYXijquec84dOJ0tFk5cJ2n+Qppy4AGEs3VRE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Mnh6Ppaf3FCS79TRzKVM7GJo4Sd//wgOBRZiQ43R4HspqfoYYuxBziti0p4NXgqHKOk0XrBOIy74FzNMRW79PDvVFqMCxZtE2uGeOeGL1HfNcWjwT1sEc6/aozkzAZXj5pKn+QTFjsD9AUROCr3rFeCTtRPKjHt0SuY8IEVOtHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA0BC433C7;
	Mon,  5 Feb 2024 11:10:33 +0000 (UTC)
Message-ID: <e57fb278-4808-4e12-9b61-005c3e45365e@xs4all.nl>
Date: Mon, 5 Feb 2024 12:10:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Dorcas Litunya <anonolitunya@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2] media: v4l2-ctrls-core.c: check min/max for menu, controls
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Menu controls that use the menu_skip_mask require that the min-max range is
inside 0-63.

Negative values obviously make no sense for menu controls, and the maximum
value is currently limited by the number of bits of the menu_skip_mask
value. However, if menu_skip_mask == 0, then larger menus are fine.

If we ever need to add support for larger menus that support the skip
mask, then more work is needed.

In the places where the menu_skip_mask is checked, use BIT_ULL to get the
bit to check and check if the bit number is < BITS_PER_LONG_LONG to avoid
shifting out of range. With the new check in check_range this should
never happen, but it is better to be safe and avoid static analyzer
warnings.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 002ea6588edf..d9a422017bd9 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1179,7 +1179,7 @@ int v4l2_querymenu(struct v4l2_ctrl_handler *hdl, struct v4l2_querymenu *qm)
 		return -EINVAL;

 	/* Use mask to see if this menu item should be skipped */
-	if (ctrl->menu_skip_mask & (1ULL << i))
+	if (i < BITS_PER_LONG_LONG && (ctrl->menu_skip_mask & BIT_ULL(i)))
 		return -EINVAL;
 	/* Empty menu items should also be skipped */
 	if (ctrl->type == V4L2_CTRL_TYPE_MENU) {
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 0accb96001db..c4d995f32191 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1504,11 +1504,12 @@ int check_range(enum v4l2_ctrl_type type,
 		return 0;
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_INTEGER_MENU:
-		if (min > max || def < min || def > max)
+		if (min > max || def < min || def > max ||
+		    min < 0 || (step && max >= BITS_PER_LONG_LONG))
 			return -ERANGE;
 		/* Note: step == menu_skip_mask for menu controls.
 		   So here we check if the default value is masked out. */
-		if (step && ((1 << def) & step))
+		if (def < BITS_PER_LONG_LONG && (step & BIT_ULL(def)))
 			return -EINVAL;
 		return 0;
 	case V4L2_CTRL_TYPE_STRING:
-- 
2.40.1


