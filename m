Return-Path: <linux-media+bounces-4787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D64E084C6D0
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 10:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1393A1C21A05
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 09:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24C5208CB;
	Wed,  7 Feb 2024 09:03:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922EF208C4
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707296613; cv=none; b=ujiJJ8bB7orI70f8Sz2B5yaveR2vmDDU8TsaFZml6ADW56RT2n8v5mHFtm7oYvu6Ystg9dqXkIxp1/6zwwAhFGAfFeXPXi3Ms+rRVaaXtl7iqPyxiZh3MsQ5sgTwCnTlRdeIRSmH09lTEMIIAZs63J+hnL9FohossHuDyx3kRiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707296613; c=relaxed/simple;
	bh=5ocwE3L3BkIQod8W8Tsq5AaUNBaZOsOi9ugz97IO29A=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=pvpbhqQ9iJ1BIvNV9ZerFrp8QdkknYETzCmBUb2pANyagjbFtqipjaFspZ7B41sajmCZi1uCYcfWNmdF91u8Wet1UXs+1hZUmWc6vT1LQbNfHmSeegGphl+bxYVE8+JPSI0w9zJNlwhsEDQIUafFYDzKGzc+xGUIUByp+0q7zCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90E7C433C7
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 09:03:32 +0000 (UTC)
Message-ID: <1ad05817-1f75-4492-9814-937cef20c6f7@xs4all.nl>
Date: Wed, 7 Feb 2024 10:03:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: core: v4l2-ioctl.c: use is_valid_ioctl()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In most cases the is_valid_ioctl() macro is used to check if an ioctl is
valid, except in one place. Use it there as well as it makes the code
easier to read.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a172d33edd19..6ce443dafd97 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3052,7 +3052,7 @@ static long __video_do_ioctl(struct file *file,
 	if (v4l2_is_known_ioctl(cmd)) {
 		info = &v4l2_ioctls[_IOC_NR(cmd)];

-		if (!test_bit(_IOC_NR(cmd), vfd->valid_ioctls) &&
+		if (!is_valid_ioctl(vfd, cmd) &&
 		    !((info->flags & INFO_FL_CTRL) && vfh && vfh->ctrl_handler))
 			goto done;


