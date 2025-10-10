Return-Path: <linux-media+bounces-44146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9612BCBCD6
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 08:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12DB53AECBF
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 06:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0852126B74D;
	Fri, 10 Oct 2025 06:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PibJAWuX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD741991D2
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 06:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760078710; cv=none; b=U8kpFR7Dp0ta18haHf5Ko33Z1NKcfvdIm4EzELiHjSqUDH31fDIQvEl9J9ZXWUStJRjnIPswq6DmlCDLucDj0jovvkELHz6zW2WQdowbY3tim4Yc7VLR4821HAF0FlJI9KFHzn64nDmq0uVuKH/Bsc+pP6e6S0VDUwH3izMNrOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760078710; c=relaxed/simple;
	bh=MMVpmzPGRBOswu3WVLtnHtqYRO+B3rjfeQ/zDhhX1S8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=FcBN0xdj7SuTgl47RYTGG7X0yl2Yq2TKjkHW/Q/2T0bW7W6GstmJhwKmU0NnU5u7LjRZ2EB4G3H3jW1eIubOEqp/Z36ywaP8ga4qrkYAqmo+QllKxgaLKw1TnMlHequc/VQk7FPKkYSwXAuqB3dGJZXGSuKUBglJNPd9NC7G5tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PibJAWuX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E383C4CEF1;
	Fri, 10 Oct 2025 06:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760078707;
	bh=MMVpmzPGRBOswu3WVLtnHtqYRO+B3rjfeQ/zDhhX1S8=;
	h=Date:From:Subject:To:Cc:From;
	b=PibJAWuXR2LGa81FlxpuZ6ODcK4llgPHT/sd1xThqym2rL5rs4jS7RhSpeS50Pa+1
	 g9qpdHCgoOTxg+7v0p2c9ZyHJfhzMNxLYRUbvwvtYLFDFErxhbAFxCs0hoKmEl5tKG
	 2ULzkF7lIUwZgatsttxTLvbc36qnnfAjIRQg0kbZdrZ+60JUfAkCcFcdwSSSZ4mcHB
	 XugJFHDWVAcdwDM0L5sFoUcyYTEFp39WIUAzNJG/0GsqjkNAy3h3EXJMNv+TVfxwwy
	 qcCXOZdEEllljJVlp7EIWwT1vR6hEV1EJ1znN8gnePhuAQXz1SC1BpZYRyoDf2BeW+
	 7aotJzjFczItA==
Message-ID: <554fb9d7-374b-4868-b91b-959b8fd69b4d@kernel.org>
Date: Fri, 10 Oct 2025 08:45:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH] media: i2c: mt9p031: support ctrl events
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The sensor subdev device was missing V4L2_SUBDEV_FL_HAS_EVENTS,
and that prevented VIDIOC_SUBSCRIBE_EVENT from working.

Fixes a v4l2-compliance error:

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
		fail: v4l2-test-controls.cpp(1128): subscribe event for control 'User Controls' failed
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 4

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/mt9p031.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 1500ee4db47e..01c5fff0f50b 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1175,7 +1175,7 @@ static int mt9p031_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto done;

-	mt9p031->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	mt9p031->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;

 	ret = mt9p031_init_state(&mt9p031->subdev, NULL);
 	if (ret)
-- 
2.51.0


