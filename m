Return-Path: <linux-media+bounces-21767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A149D4E96
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 15:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 584E1B2339F
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AE61D88DD;
	Thu, 21 Nov 2024 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="sbpl/LPi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D9D1369B4;
	Thu, 21 Nov 2024 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732198851; cv=none; b=fK3wRagZK836HDreDuS4oB7k7Ew+c/X6ggfUlQ/23KStMqV3+CiAkPTBVgk/TTZVBrisZ1JjvOmE0h/wStk2Erx21KnGAzDa069PsdkiAMqTYt1CnhofsbkBqU8o8YNoW/OkyDv0G/OvFs6BRq5cAd9WZUZ5UFQqD+3lQf2/0ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732198851; c=relaxed/simple;
	bh=TMcvAxcUInwde+Vl6F4hkgr/2nSkXZTrn99Ur+TK0Uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GdPRubK6hrgkmWmjUnkrdayocvzo5ImAlLr7uR2+qffvO9tJDGa1mdi5Encou7VcdKP7DpCfBbjuxKv27lgSfW4H6Oj+4NRpVZk8uBOdkfflWUj2UF0A/Q+L8GaTI/P01qc8tZ/CuRZ9paDpqgRmhUUmts9mTboPfirpR3p7gqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=sbpl/LPi; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALA95BP028349;
	Thu, 21 Nov 2024 15:20:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JAlbkjqBlD0R3FSv5bX889vfuMU5j/rR8gfcpzLu/u0=; b=sbpl/LPiBr3D4gPg
	/K8PcSO2DSu650saG5zzqbJeDCpFlqysf98wDAZP5pxSfKeqK14PEK7ZkP778mtM
	NWHfndCwMrgNgej4wfQ4OzKyNmITFvbKSu6Fb3bbnexoFvZb1ZXi2uPz4/S7XGrb
	zZMFOA6Friu12I7rzLjB8rUDO1m9SRGrmJWkaxJm2W1dU5fdpYlITvCEX7id04F4
	ccW6yQkfDlbYzacvJvVmbiKajZrhaHpKPwrWND5BAyI5CMxsFgz4nyTgFqBlhL/9
	CJV1BvgvvvPzrlJFqdmN96OxBN4ICUnYFHuslXTafavZiU1h+y6JCgiSmR0dVLP7
	VsBwxQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqf713x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 15:20:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 86B6340046;
	Thu, 21 Nov 2024 15:18:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C0A828D457;
	Thu, 21 Nov 2024 15:16:43 +0100 (CET)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 15:16:42 +0100
Message-ID: <86907cc9-5339-435a-a346-08beea21b886@foss.st.com>
Date: Thu, 21 Nov 2024 15:16:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add WebP support to hantro decoder
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi all,

The corresponding GStreamer code has been pushed here (v4l2slwebpdec):
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7939

BR,
Hugues.

On 11/21/24 14:19, Hugues Fruchet wrote:
> Add WebP image decoding support to stateless V4L2 VP8 decoder.
> 
> This have been tested on STM32MP257-EV board using GStreamer.
> 
> Simple basic test:
> $> wget https://www.gstatic.com/webp/gallery/1.webp
> $> gst-launch-1.0 filesrc location= 1.webp ! typefind ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true
> 
> Slideshow of a set of WebP pictures and WebM video files:
> $> wget https://www.gstatic.com/webp/gallery/2.webp
> $> wget https://www.gstatic.com/webp/gallery/3.webp
> $> wget https://www.gstatic.com/webp/gallery/4.webp
> $> wget https://www.gstatic.com/webp/gallery/5.webp
> $> wget https://samplemedia.linaro.org/VP8/big_buck_bunny_480p_VP8_VORBIS_25fps_1900K_short.WebM
> $> gst-play-1.0 *.webp *.webm *.WebM --wait-on-eos
> <hit key ">" to display next file >
> 
> Large WebP image > 16777215 (size > 2^24)
> $> gst-launch-1.0 fakesrc num-buffers=1 format=4 do-timestamp=true filltype=3 sizetype=2 sizemax=25165824 blocksize=25165824 ! video/x-raw, format=I420, width=4096, height=3072, framerate=1/1 ! webpenc quality=100 ! filesink location=4096x3072_HQ_random.webp
> $> ls -l 4096x3072_HQ_random.webp
> [...] 16877404 Nov 20 11:40 4096x3072_HQ_random.webp
> $> gst-launch-1.0 filesrc location= 4096x3072_HQ_random.webp blocksize=16876610 ! image/webp, width=1, height=1, framerate=0/1 ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true
> 
> Large WebP image decoding using post-processor is untested because of lack
> of hardware support on this platform, nevertheless support is provided in
> this serie for further testing on another platform having post-processor
> support.
> 
> ===========
> = history =
> ===========
> version 3:
>     - Fix remarks from Nicolas Dufresne:
>      - Document constraint about key frame only for WebP
>      - Fix rebase issue
>     - Fix typo detected by Diederik de Haas
> 
> version 2:
>     - Fix remarks from Nicolas Dufresne:
>      - Use bytesperline helper to compute chroma size
>      - Introduce a new explicit WEBP frame compressed format
>        instead of relying on VP8 + WebP flag
>      - 4K support in both decoder and post-proc
> 
> version 1:
>    - Initial submission
> 
> Hugues Fruchet (3):
>    media: uapi: add WebP uAPI
>    media: verisilicon: add WebP decoding support
>    media: verisilicon: postproc: 4K support
> 
>   .../userspace-api/media/v4l/biblio.rst          |  9 +++++++++
>   .../media/v4l/pixfmt-compressed.rst             | 17 +++++++++++++++++
>   drivers/media/platform/verisilicon/hantro.h     |  2 ++
>   .../media/platform/verisilicon/hantro_g1_regs.h |  3 ++-
>   .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
>   .../platform/verisilicon/hantro_postproc.c      |  6 +++++-
>   .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
>   .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
>   drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
>   include/uapi/linux/videodev2.h                  |  1 +
>   10 files changed, 68 insertions(+), 4 deletions(-)
> 

