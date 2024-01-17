Return-Path: <linux-media+bounces-3794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 874D58304B9
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 12:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C16F1F23BBA
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 11:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7F31DFC9;
	Wed, 17 Jan 2024 11:46:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7680C1EB52
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705492008; cv=none; b=J85YbhQp8047S5zyB82y2bU5uL4rBUxFgkB2HY8np50mrpawRSNPOg1FVTBbjw0lzb+CXlnWqrZTrwquF+cNQGp0MKZI7WfR131CkFERgQVHhdgbV7MJByW3nLfa4wRZ54pn5QlojujrRTasVIOxlTZnaojY5DAvGaj9Xb5ycw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705492008; c=relaxed/simple;
	bh=hTAUtLxK30XTjKEdnjvSKSgNaKfrvBzEVPq/2zEY5ZY=;
	h=Received:Message-ID:Date:MIME-Version:User-Agent:Content-Language:
	 To:Cc:From:Subject:Content-Type:Content-Transfer-Encoding; b=PfLD0RCp6o1WziIHlvBgnbdktka/FMX+xVo7Ae7MtRdWJQ0qd96OpzzlR4S1sHMLWRZz/XaYr3d78UiEM+vMdzLIQpNArZ9Zayk/Za39FDG40BT/Wcbghd7mWVWexm1ikcIzRwRBYnRdONvkalmB2ePJgAyvBMifhrKfhqtBDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521FCC433C7;
	Wed, 17 Jan 2024 11:46:47 +0000 (UTC)
Message-ID: <f0b81292-3c91-4e89-86da-f31f89dfcd9a@xs4all.nl>
Date: Wed, 17 Jan 2024 12:46:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: staging: imx: controls are from another device, mark
 this
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The last argument of v4l2_ctrl_add_handler() indicates whether the controls
you add are from a control handler owned by another driver (true) or from the
same driver (false). In this case the last argument was incorrectly set to
false. The control handlers are from different devices.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index e28a33d9dec7..ccbc0371fba2 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -401,7 +401,7 @@ int imx_media_fim_add_controls(struct imx_media_fim *fim)
 {
 	/* add the FIM controls to the calling subdev ctrl handler */
 	return v4l2_ctrl_add_handler(fim->sd->ctrl_handler,
-				     &fim->ctrl_handler, NULL, false);
+				     &fim->ctrl_handler, NULL, true);
 }

 /* Called by the subdev in its subdev registered callback */

