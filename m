Return-Path: <linux-media+bounces-15059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB97C933420
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 00:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC8741C22EDE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 22:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D529143C6A;
	Tue, 16 Jul 2024 22:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="muyZ68k0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3536A13BAE2
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 22:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721167990; cv=none; b=sZ3BfkknzoCJ8J+V6F9QT+oPFm/y+IOYY3D6owd1QjJiE6irO5l0N6JyuFamENzOxeo+3Bb4wn1XpgOuySSuiCm+fZ+0erkq0ZZsmVGbp4XY2z+B2kgyM4LRGP2M4/G3KhYRVhCYU9KN+NI2LqKrr8WxkjqOn+HEGLs3zS4/JCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721167990; c=relaxed/simple;
	bh=kezXaT3v6LZXlObjaJmSDpR0VCdvNGV2dck36xLGu9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5C6gSLHBvBr/1cvUbTDES3MOKYr/aSUeXDwSQrYlVLgOGBjP2mgJP0Mti/hG6LL0pE14n4BSomxBWP7gj7st/53rK5nNVgCKCtLm3nCLRTp6DoWmUsIsIP0BhxTLGuibnKUiz7aNqtMHP6cfSGkGKhB4e0vOqaPsaDXZmDUE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=muyZ68k0; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eec7e43229so73111591fa.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 15:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721167986; x=1721772786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXxJu7W4ql54UYL0JTMsFKchNv7XNstoFoH6eTpHkCk=;
        b=muyZ68k08p/8rs5/4bea7a7oDg2V8WFy5+9lwPJELXJFCFRvLqqzvJDPU4szrzhphO
         xfoxoktPVVTjk8AY5yaak8MMa8XmoC7ddRj6yZ6u1FmZr9p5ISDgMSpDcgQtCUM/cWeQ
         9rMCv/AV1MqAJZdN8vWEG4FEdEUXaPa46Qfyyx41zeI3SdMxaWDCxPZuEr8tGC/QbAPX
         +G2AbqxkCqUTJhpzJ6rx4Hjh3ctqYPxsynM+NT4eHpAG1yNJzgpBJCJmIpHB+TBOJzM9
         Rx/jEJZibKicMy01LL3vcQN5CJYuHuspIUffAPLIE00tWZAi7faKHwmPsy0zxF5REwRS
         Gyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721167986; x=1721772786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXxJu7W4ql54UYL0JTMsFKchNv7XNstoFoH6eTpHkCk=;
        b=PU8unf9vsRy5Q9lUFx3CV14JEgHwH/Yb3M4pf+S0kd1/tO5pYx8KcL5wfGV5+jThG8
         f6cvUed8CpsDwxztmVILIAlkD0wJaVbg9hKbUNmboE5miy+Rud/t1F4lB4inJQuR3OkS
         HGnlm/MKmp/wDZD+qm4Kx5EKTLXBoU2s8A70anVomRxpP0VlRHq4ytwCSlv2z9FPeEp/
         le2fktfJoVqUR2QNUum75Y8EssKWaywI74eR11B1Zwjd7EjxSPB4mA6xm/jUy/LGBdBL
         oktX3iBG+dhaeZ4R8IZ+JHfTSNLyOeiiak20iYFJ7GSYRhzvXn96DO5guBFYNPkYxp0Y
         fNrQ==
X-Gm-Message-State: AOJu0YzPbZOKkb25HEcjMlNRsOcRZgFG53VBb7Ne/iZpLspNVlxbyUdH
	3y15YUCxa3Z723uBFxGJz2ywqXCS0YmhInUbRudZS848oHTtG3X1QqjvEhgqahc=
X-Google-Smtp-Source: AGHT+IFzUHyuPnjpUGz0IiohdSN62RZaXgipj8QdfEilZoZBDmtYvGzyUHXTF3ThfgoYDkCfoEFz6g==
X-Received: by 2002:a05:651c:4ca:b0:2ee:8ce9:3037 with SMTP id 38308e7fff4ca-2eef41d8b29mr28242261fa.37.1721167986188;
        Tue, 16 Jul 2024 15:13:06 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b268a28ddsm5582997a12.71.2024.07.16.15.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 15:13:05 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 16 Jul 2024 23:13:24 +0100
Subject: [PATCH v2 1/2] media: qcom: camss: Remove use_count guard in
 stop_streaming
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-linux-next-24-07-13-camss-fixes-v2-1-e60c9f6742f2@linaro.org>
References: <20240716-linux-next-24-07-13-camss-fixes-v2-0-e60c9f6742f2@linaro.org>
In-Reply-To: <20240716-linux-next-24-07-13-camss-fixes-v2-0-e60c9f6742f2@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hansverk@cisco.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-13183

The use_count check was introduced so that multiple concurrent Raw Data
Interfaces RDIs could be driven by different virtual channels VCs on the
CSIPHY input driving the video pipeline.

This is an invalid use of use_count though as use_count pertains to the
number of times a video entity has been opened by user-space not the number
of active streams.

If use_count and stream-on count don't agree then stop_streaming() will
break as is currently the case and has become apparent when using CAMSS
with libcamera's released softisp 0.3.

The use of use_count like this is a bit hacky and right now breaks regular
usage of CAMSS for a single stream case. As an example the "qcam"
application in libcamera will fail with an -EBUSY result on stream stop and
cannot then subsequently be restarted.

The kernel log for this fault looks like this:

[ 1265.509831] WARNING: CPU: 5 PID: 919 at drivers/media/common/videobuf2/videobuf2-core.c:2183 __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
...
[ 1265.510630] Call trace:
[ 1265.510636]  __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
[ 1265.510648]  vb2_core_streamoff+0x24/0xcc [videobuf2_common]
[ 1265.510660]  vb2_ioctl_streamoff+0x5c/0xa8 [videobuf2_v4l2]
[ 1265.510673]  v4l_streamoff+0x24/0x30 [videodev]
[ 1265.510707]  __video_do_ioctl+0x190/0x3f4 [videodev]
[ 1265.510732]  video_usercopy+0x304/0x8c4 [videodev]
[ 1265.510757]  video_ioctl2+0x18/0x34 [videodev]
[ 1265.510782]  v4l2_ioctl+0x40/0x60 [videodev]
...
[ 1265.510944] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 0 in active state
[ 1265.511175] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 1 in active state
[ 1265.511398] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 2 in active st

One CAMSS specific way to handle multiple VCs on the same RDI might be:

- Reference count each pipeline enable for CSIPHY, CSID, VFE and RDIx.
- The video buffers are already associated with msm_vfeN_rdiX so
  release video buffers when told to do so by stop_streaming.
- Only release the power-domains for the CSIPHY, CSID and VFE when
  their internal refcounts drop.

Either way refusing to release video buffers based on use_count is
erroneous and should be reverted. The silicon enabling code for selecting
VCs is perfectly fine. Its a "known missing feature" that concurrent VCs
won't work with CAMSS right now.

Initial testing with this code didn't show an error but, SoftISP and "real"
usage with Google Hangouts breaks the upstream code pretty quickly, we need
to do a partial revert and take another pass at VCs.

This commit partially reverts commit 89013969e232 ("media: camss: sm8250:
Pipeline starting and stopping for multiple virtual channels")

Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/lkml/ZoVNHOTI0PKMNt4_@hovoldconsulting.com/
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-video.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index cd72feca618c..3b8fc31d957c 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -297,12 +297,6 @@ static void video_stop_streaming(struct vb2_queue *q)
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
 
-		if (entity->use_count > 1) {
-			/* Don't stop if other instances of the pipeline are still running */
-			dev_dbg(video->camss->dev, "Video pipeline still used, don't stop streaming.\n");
-			return;
-		}
-
 		if (ret) {
 			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
 			return;

-- 
2.45.2


