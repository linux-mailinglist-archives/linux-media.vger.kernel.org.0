Return-Path: <linux-media+bounces-21756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5C19D4DAD
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC97CB245EF
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822CA1D4324;
	Thu, 21 Nov 2024 13:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="xRlBS17G"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17AA1369B4;
	Thu, 21 Nov 2024 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732195336; cv=none; b=tGGzJ69UZOBCSgEf8vUgEyP5coBp4oz6n9a6GmZaWHqqwcQhe0iCeRWlTcoytULG6GQsM/Kz0h4W8LIFdqIArBQrSX9GDQLcGmClR//Eux4+d5v0PH48st1JVUO5guu9u0YscFisfPlOLBI1HMcilKKrxPnUvS6r1rPNTDGmUyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732195336; c=relaxed/simple;
	bh=6v/0RKqVbMnXGWEV+3W7S+kCO+VFmuXvCNhWbRTtjYE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TwgM74UHH15DD5VrEw5gr1AKUWQCZoSDUQ3QrmXEj0RZ8/72vh16OROjEVl7SETHkm7LW2jn3R+fnve1ut4SjkUBgnsWj3JsJMBLfNBiGFW8qVpcoVxVPmPHIeKpQCN+kQ1OpKA8762mJVOj7eDws9xllA8raMlGRZreD2Q6xYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=xRlBS17G; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL8uHZN023498;
	Thu, 21 Nov 2024 14:21:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=zcbz2RZe19TKsqJ/WRoGlA
	+GN683d7b2Sedzfexr4xs=; b=xRlBS17GulkvBcIRw2A99BQ5bQfr9VXDJCe3xv
	URB6gDpw/9bVL/bXicPoiRIphkg0g38zTXktA0KykKFIeadxXyOwvMCe7YzcgjVm
	6UBVu01ArNDlNfj+E1rkWbyqbYEWL57FQEWYzD7+AxYWsovktOdBMp8Y9p57KWUA
	wmc3XSPayp5XkFAGb+D/lStsx/IQ/vmKATVSZ1pbNbBeAPPOD8fGSvEfDU6ThGjZ
	k5LXX3DKe7jPTakMTDPXbSEzYfY3GFINArDZyK9U8Uv16ToOXaRGJrZILZzXBXVB
	gejQNNu0gv4yQ9WusAqFJNPYxRoD8v8CuFUK/F1vEoqApzlw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqf6rrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 14:21:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2697640047;
	Thu, 21 Nov 2024 14:19:56 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DB422843CB;
	Thu, 21 Nov 2024 14:19:07 +0100 (CET)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 14:19:06 +0100
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Hugues Fruchet
	<hugues.fruchet@foss.st.com>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Erling Ljunggren <hljunggr@cisco.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Benjamin
 Gaignard <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/3] Add WebP support to hantro decoder
Date: Thu, 21 Nov 2024 14:19:01 +0100
Message-ID: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add WebP image decoding support to stateless V4L2 VP8 decoder.

This have been tested on STM32MP257-EV board using GStreamer.

Simple basic test:
$> wget https://www.gstatic.com/webp/gallery/1.webp
$> gst-launch-1.0 filesrc location= 1.webp ! typefind ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true

Slideshow of a set of WebP pictures and WebM video files:
$> wget https://www.gstatic.com/webp/gallery/2.webp
$> wget https://www.gstatic.com/webp/gallery/3.webp
$> wget https://www.gstatic.com/webp/gallery/4.webp
$> wget https://www.gstatic.com/webp/gallery/5.webp
$> wget https://samplemedia.linaro.org/VP8/big_buck_bunny_480p_VP8_VORBIS_25fps_1900K_short.WebM
$> gst-play-1.0 *.webp *.webm *.WebM --wait-on-eos
<hit key ">" to display next file >

Large WebP image > 16777215 (size > 2^24)
$> gst-launch-1.0 fakesrc num-buffers=1 format=4 do-timestamp=true filltype=3 sizetype=2 sizemax=25165824 blocksize=25165824 ! video/x-raw, format=I420, width=4096, height=3072, framerate=1/1 ! webpenc quality=100 ! filesink location=4096x3072_HQ_random.webp
$> ls -l 4096x3072_HQ_random.webp
[...] 16877404 Nov 20 11:40 4096x3072_HQ_random.webp
$> gst-launch-1.0 filesrc location= 4096x3072_HQ_random.webp blocksize=16876610 ! image/webp, width=1, height=1, framerate=0/1 ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true

Large WebP image decoding using post-processor is untested because of lack
of hardware support on this platform, nevertheless support is provided in
this serie for further testing on another platform having post-processor
support.

===========
= history =
===========
version 3:
   - Fix remarks from Nicolas Dufresne:
    - Document constraint about key frame only for WebP
    - Fix rebase issue
   - Fix typo detected by Diederik de Haas

version 2:
   - Fix remarks from Nicolas Dufresne:
    - Use bytesperline helper to compute chroma size
    - Introduce a new explicit WEBP frame compressed format
      instead of relying on VP8 + WebP flag
    - 4K support in both decoder and post-proc

version 1:
  - Initial submission

Hugues Fruchet (3):
  media: uapi: add WebP uAPI
  media: verisilicon: add WebP decoding support
  media: verisilicon: postproc: 4K support

 .../userspace-api/media/v4l/biblio.rst          |  9 +++++++++
 .../media/v4l/pixfmt-compressed.rst             | 17 +++++++++++++++++
 drivers/media/platform/verisilicon/hantro.h     |  2 ++
 .../media/platform/verisilicon/hantro_g1_regs.h |  3 ++-
 .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
 .../platform/verisilicon/hantro_postproc.c      |  6 +++++-
 .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
 .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
 include/uapi/linux/videodev2.h                  |  1 +
 10 files changed, 68 insertions(+), 4 deletions(-)

-- 
2.25.1


