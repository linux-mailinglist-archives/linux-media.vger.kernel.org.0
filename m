Return-Path: <linux-media+bounces-3793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D08F8304B1
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 12:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB7661C242BF
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 11:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2241DFCB;
	Wed, 17 Jan 2024 11:44:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD491DFC7
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 11:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705491846; cv=none; b=J+/lisGjX1G5Dw5jvN+BFb2ruQCLLkD4JONp7/RFQLWe91bwMFH9gnkGoojfoEmjgwaKj3nEVRHvxmyWAFqd7sNmWS2eRibM62+J2BuRU0NJnczpV+wvgHMp2Jsfb30UdKa5PASUb+u0TKMoBacd0IuKKp1kilIuJx1mgK9ocAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705491846; c=relaxed/simple;
	bh=4kIZteoUhwmJY4Qu0xfm+eyuOes5w2l8gL+QdEtNhrM=;
	h=Received:Message-ID:Date:MIME-Version:User-Agent:Content-Language:
	 To:From:Subject:Content-Type:Content-Transfer-Encoding; b=a8A/k1QtcS1Tjv4GJXeivmKSQ0boxZAAEK8WzOIebz81Xz9+GwBr1PgHECOg7p4f1+bm5GBRl+22bUi5MkWlT7V8SjTdcesFI3tdGPJCUlcESAK2iCkMeoFAgHf6IB+u+4KC1KAqkEeo8dSdKJ34vDAF6ZZ1sClImLDSPI2W7nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99962C433F1
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 11:44:05 +0000 (UTC)
Message-ID: <4abc72aa-8768-4b1c-a940-811c7a918b1d@xs4all.nl>
Date: Wed, 17 Jan 2024 12:44:03 +0100
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
Subject: [PATCH] media: cx231xx: controls are from another device, mark this
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The last argument of v4l2_ctrl_add_handler() indicates whether the controls
you add are from a control handler owned by another driver (true) or from the
same driver (false). In this case the last argument was incorrectly set to
false. The controls come from the cx25840 subdev.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 3b75d062e602..343a4433ed24 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1759,7 +1759,7 @@ int cx231xx_417_register(struct cx231xx *dev)
 	dev->mpeg_ctrl_handler.ops = &cx231xx_ops;
 	if (dev->sd_cx25840)
 		v4l2_ctrl_add_handler(&dev->mpeg_ctrl_handler.hdl,
-				dev->sd_cx25840->ctrl_handler, NULL, false);
+				dev->sd_cx25840->ctrl_handler, NULL, true);
 	if (dev->mpeg_ctrl_handler.hdl.error) {
 		err = dev->mpeg_ctrl_handler.hdl.error;
 		dprintk(3, "%s: can't add cx25840 controls\n", dev->name);

