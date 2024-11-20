Return-Path: <linux-media+bounces-21628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBC29D3919
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 12:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B536281A82
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 11:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC6C1AA1F2;
	Wed, 20 Nov 2024 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NIHTE7GB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374C61A3A8D;
	Wed, 20 Nov 2024 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732100672; cv=none; b=KuOIAPXmX3r0oBMVTMghaiCplDRcZOjPpSmRCuBbh9ZYFDEaG07gb49yglQezc4QPbDw4s8FS6E1Jx+N2R2tOfEzuFMFuZtvY50vcvGMY8h/4Vt1thwXxrCBxAwVFXDu+CfsFYfrgiWawkr7rG01qlvUv5p2mFcZEDmqx8M/cRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732100672; c=relaxed/simple;
	bh=PLK6KxvDQM/9LIuIjdUv/MrgtSDVPo/A9w2imdoutPM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NrjnzQhtb6LYztGDxFa7migHywEpZADwjIblC2cVuCbpCmAjs9UeRWNqSGrJretVpBbVdGcuE4TYDo60OxsIdg7ETGNWl1/1S5Kvs9l/+UguQfTu5kjqAls/L95WRDKZf/94owIjq68mvgLdh+Ye2jT2GzbGMkTctjUJH6GYD3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NIHTE7GB; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK8X5Hh000467;
	Wed, 20 Nov 2024 12:04:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=PRYNH4mrXgpLGGkA/dYqVr
	jp+qKkdlxRYRK4Gx/0a50=; b=NIHTE7GBrxeVaoKr2H8zrCSXlH458tDSItEyY2
	vqTE3unOn0ZDFocaXyXkSCINW8BMCghm2ML8ijcDF1J1PYNbsBHe/DwXnRf/o2FI
	7YbstArp6DPhxioCrGsP2HJDiajTpF00lGjSr0SNTOHIVtwwOohjFR7NBXEZKNxx
	wqp3g6qWjWHN+YG+1ULWnEdt9et2SVsJlMI8QZIm9Ax33wLQvOQw/TwtBy0MwtKI
	FmY6usRKfAw6uT1AlBVo5AiOu1lRCxeGI6OiYXhNkRzJhldlbgKtJfjcqFg001Se
	A5jkSUdykcGaw3sHhBZAG3ju/OuEZqPAb3HHOu2bsI92cYmw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkq61e9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 12:04:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E23140077;
	Wed, 20 Nov 2024 12:02:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7164027870D;
	Wed, 20 Nov 2024 12:01:34 +0100 (CET)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 20 Nov
 2024 12:01:34 +0100
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Fritz Koenig <frkoenig@chromium.org>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Daniel Almeida
	<daniel.almeida@collabora.com>,
        Andrzej Pietrasiewicz
	<andrzej.p@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>
Subject: [PATCH v2 0/3] Add WebP support to hantro decoder
Date: Wed, 20 Nov 2024 12:01:02 +0100
Message-ID: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
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


Hugues Fruchet (3):
  media: uapi: add WebP uAPI
  media: verisilicon: add WebP decoding support
  media: verisilicon: postproc: 4K support

 .../userspace-api/media/v4l/biblio.rst          |  9 +++++++++
 .../media/v4l/pixfmt-compressed.rst             | 15 +++++++++++++++
 drivers/media/platform/verisilicon/hantro.h     |  2 ++
 .../media/platform/verisilicon/hantro_g1_regs.h |  3 ++-
 .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
 .../platform/verisilicon/hantro_postproc.c      |  6 +++++-
 .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
 .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
 include/uapi/linux/videodev2.h                  |  1 +
 10 files changed, 66 insertions(+), 4 deletions(-)

-- 
2.25.1


