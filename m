Return-Path: <linux-media+bounces-6579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2C387381B
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 14:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9198E1F24960
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 13:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B8C131749;
	Wed,  6 Mar 2024 13:49:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90910130E57
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709732963; cv=none; b=SbOab9kaOoWeAiJGBCeH30+SquSQBbogiQKdwNBlniUwB7kG0ZPHhLgwFhSov6aTK3AnOFWIkZ59lebeKeFrk3VUQcF5g5lOwwHkP11yiiQ6XaNrfdtB4rFlKZH2ZMXKJkNeEShlG2mzw3j18SBKw59hJjpWnNvlMySIKr4t2Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709732963; c=relaxed/simple;
	bh=8fCDGsY6xQHgUEKbp098DLBT2t2Vzy28fVFKxOqK6YE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=RBAByhiLMsBGAkAFAkCXQ9Z0GJkqu3X2mlwt9txiVv5EewX0lkSM6MgSPHpua7UpW8QbL5hD+5X5Io0U6PnH0sNNGkQmqqi3SuHKP6ZOYXxV60TCIf/5jvw+vEk/RW/41Co/X4yFVcBP5dBka3vHvkuh+3ox7VHWUK8UxFYgD/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E927FC433C7
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 13:49:22 +0000 (UTC)
Message-ID: <4b52574e-3fc2-4007-b76c-fb353964f86c@xs4all.nl>
Date: Wed, 6 Mar 2024 14:49:21 +0100
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
Subject: [PATCH] media: v4l2-ctrls: add support for area type logging
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

A 'case V4L2_CTRL_TYPE_AREA' was missing in v4l2_ctrl_type_op_log,
which led to an 'unknown type' message in the kernel log.

Add support for controls of this type.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index c4d995f32191..9a09a981e1d9 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -295,6 +295,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_U32:
 		pr_cont("%u", (unsigned)*ptr.p_u32);
 		break;
+	case V4L2_CTRL_TYPE_AREA:
+		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
+		break;
 	case V4L2_CTRL_TYPE_H264_SPS:
 		pr_cont("H264_SPS");
 		break;

