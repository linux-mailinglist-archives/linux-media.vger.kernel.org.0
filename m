Return-Path: <linux-media+bounces-4602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D861E846E14
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 11:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DD721C2315E
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 10:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA7A13AA26;
	Fri,  2 Feb 2024 10:38:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD6A1426A
	for <linux-media@vger.kernel.org>; Fri,  2 Feb 2024 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706870310; cv=none; b=d6oAPSWHtz+HtfVD9lgROrepKuU6evzfS/udr+M12+B4j+qDlVESSqkKEJKIFlT3gjiNiB0MjnVjjsl8B/W7eiPCltoysrolJEe0S/MgAWIAEeW2MW3P2Jv7OVqmT06qSpuZxXsRUm2WOpuOeqq8ruDKyYZYafPw/AindGKOD1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706870310; c=relaxed/simple;
	bh=cr9C/7sGlW+k54565U8oITZEQkl54F44JFEPfQt1Whc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=UIx9vDI0G3rp/Sbe9aaisUPzYftr02TyvSHkyS2Amh9pYEWzik1+q5iOn4Cri2c5C/i73p0UeY3YYqU0IXt68PTgOZjOR2s/hrrNX4RVrjRxe51LEPLo40002L/xYj8aRbaAh+mS3VoipbipNB9E2kG+uK35CXgbM0HzIyLrt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC86C433C7;
	Fri,  2 Feb 2024 10:38:29 +0000 (UTC)
Message-ID: <6af38faa-a10c-40e2-873b-c4288a68c5aa@xs4all.nl>
Date: Fri, 2 Feb 2024 11:38:27 +0100
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
Subject: [PATCH] media: v4l2-ctrls-core.c: check min/max for menu controls
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Menu controls require that the min-max range is inside 0-63.

Negative values obviously make no sense for menu controls, and the maximum
value is currently limited by the number of bits of the menu_skip_mask value.

If we ever need to add support for larger menus, then more work is needed.

For now just check that everything is within range.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index a662fb60f73f..89d1e3e78563 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1504,7 +1504,8 @@ int check_range(enum v4l2_ctrl_type type,
 		return 0;
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_INTEGER_MENU:
-		if (min > max || def < min || def > max)
+		if (min > max || def < min || def > max ||
+		    min < 0 || max >= BITS_PER_LONG_LONG)
 			return -ERANGE;
 		/* Note: step == menu_skip_mask for menu controls.
 		   So here we check if the default value is masked out. */

