Return-Path: <linux-media+bounces-15862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67160949944
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 22:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C944281E62
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 20:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E8B158DDC;
	Tue,  6 Aug 2024 20:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b="2HJfUe7O"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB013A26F;
	Tue,  6 Aug 2024 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722976679; cv=none; b=AVmh0zkoKfgvaKBiKlo+Ws1sdapeHDmXMe8IxLkgMb0GUpkNKjIZC5XLhifO0fcMJZwwI0MgKvfGfDM1PJb5ed67EsVdUNxdL8sUf6AQeS5hgRXc00lhPxThJmQSudaFpwWeulLK8KI0ewY0aigSCQVx14n+zQbIKV896wZewa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722976679; c=relaxed/simple;
	bh=vsFEpYHY2XViD4aWqCJKAAM4n0Tzbt/Aq9LLW81Zums=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKWr+f/wIyh9IBksjMjzA3r//FPgzDxS3mk5pMX4u5JCgBu4Uf5KWBJbyn7ughfkw0mzxuNdn7S6Rswhse4C2k/5+sH65R/m5RaJZk44ejASRtnGfqlBK5Vu/tOKAc79EmgtxelQXhz2whiVkctjrwJ8PzkCpwadVNUTPNE9vI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de; spf=pass smtp.mailfrom=timsurber.de; dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b=2HJfUe7O; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4WdlVd0YSxz9sHh;
	Tue,  6 Aug 2024 22:37:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1722976665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QydbXfG0xSwudrqCsqyAXww88zo6VkjmpfrC5bazW1Q=;
	b=2HJfUe7OiV3HGAaD6mIifHGfh2CPiQcj48qQkZwLeO5LBAxldm1aJDQwqCLKw/N1fjhHOl
	7ikoJa2zlBugKt/f7dSooMlAqpeo1zxLiR5rURX9siLSzVMYp1Dq+QRGV5JV19z4uzxb66
	ov76PrB6dZAX5E0tN3GHcG86BfT8q0YtRfd6K+6HL9vwzhX8hSCnrd1DbYl4Oanf9RFh1v
	dm/wBJa7B3LocNGEsYsqxJW9vutJqL4NGCDHScpoLS93VpM4AsXpQWur3hwAaKYY63laCo
	6tCe1ZjjCkVdho68h3BssYFfysWlKdrGut6tcKTac8DIMN90vBuJiGiolyrv4A==
Message-ID: <06838f40-881c-4301-826b-e29a4277e663@timsurber.de>
Date: Tue, 6 Aug 2024 22:37:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
 <929d2f50-6b0e-4d1e-a6d3-482d615bd06a@collabora.com>
Content-Language: en-US
From: Tim Surber <me@timsurber.de>
In-Reply-To: <929d2f50-6b0e-4d1e-a6d3-482d615bd06a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4WdlVd0YSxz9sHh

Here are the results of some more debugging.
I see that in the first example the pixel format is set to RGB888 and in 
the second to NV12, I was not able to successfully change this on my 
source, nevertheless the HDMI RX should work I think.

###source set to 4k30fps####
---------------------------
v4l2-ctl --verbose -d /dev/video1 
--set-fmt-video=width=3840,height=2160,pixelformat='NV12' 
--stream-mmap=4 --stream-skip=3 --stream-count=100 --stream-poll
---------------------------
VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
The pixelformat 'NV12' is invalid
New timings found
         VIDIOC_REQBUFS returned 0 (Success)
         VIDIOC_CREATE_BUFS returned 0 (Success)
         VIDIOC_QUERYBUF returned 0 (Success)
         VIDIOC_QUERYBUF returned 0 (Success)
         VIDIOC_QUERYBUF returned 0 (Success)
         VIDIOC_QUERYBUF returned 0 (Success)
         VIDIOC_G_FMT returned 0 (Success)
         VIDIOC_QBUF returned 0 (Success)
         VIDIOC_QBUF returned 0 (Success)
         VIDIOC_QBUF returned 0 (Success)
         VIDIOC_QBUF returned 0 (Success)
         VIDIOC_STREAMON returned 0 (Success)
cap dqbuf: 0 seq:      0 bytesused: 8294400 ts: 536.006261 field: Any 
(ts-monotonic, ts-src-eof)
cap dqbuf: 1 seq:      1 bytesused: 8294400 ts: 536.039574 delta: 33.313 
ms field: Any (ts-monotonic, ts-src-eof)
cap dqbuf: 2 seq:      2 bytesused: 8294400 ts: 536.072906 delta: 33.332 
ms field: Any (ts-monotonic, ts-src-eof)
cap dqbuf: 3 seq:      3 bytesused: 8294400 ts: 536.106239 delta: 33.333 
ms field: Any (ts-monotonic, ts-src-eof)
cap dqbuf: 0 seq:      4 bytesused: 8294400 ts: 536.139571 delta: 33.332 
ms fps: 30.01 field: Any (ts-monotonic, ts-src-eof)
cap dqbuf: 1 seq:      5 bytesused: 8294400 ts: 536.172903 delta: 33.332 
ms fps: 30.00 field: Any (ts-monotonic, ts-src-eof)
[...]

---------------------------
dmesg
---------------------------
[  529.266804] fdee0000.hdmi_receiver: hb
[  530.280073] fdee0000.hdmi_receiver: hb
[  531.293412] fdee0000.hdmi_receiver: hb
[  532.306716] fdee0000.hdmi_receiver: hb
[  533.319906] fdee0000.hdmi_receiver: hb
[  534.333263] fdee0000.hdmi_receiver: hb
[  535.346616] fdee0000.hdmi_receiver: hb
[  535.739795] fdee0000.hdmi_receiver: C-Plane 0 size: 24883200, Total 
imagesize: 24883200
[  535.747733] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[  535.747750] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: RGB888
[  535.747760] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[  535.747780] fdee0000.hdmi_receiver: get timings from dma
[  535.747787] fdee0000.hdmi_receiver: act:3840x2160, total:4400x2250, 
fps:30, pixclk:297016000
[  535.747799] fdee0000.hdmi_receiver: hfp:172, hs:92, hbp:296, vfp:8, 
vs:10, vbp:72
[  535.747809] fdee0000.hdmi_receiver: tmds_clk:297016000
[  535.747816] fdee0000.hdmi_receiver: interlace:0, fmt:0, vic:127, 
color:24, mode:hdmi
[  535.747825] fdee0000.hdmi_receiver: deframer_st:0x11
[  535.747833] fdee0000.hdmi_receiver: query_dv_timings: 3840x2160p30.00 
(4400x2250)
[  535.747854] fdee0000.hdmi_receiver: s_dv_timings: 3840x2160p30.00 
(4400x2250)
[  535.747875] fdee0000.hdmi_receiver: hdmirx_s_dv_timings: no change
[  535.747924] fdee0000.hdmi_receiver: vid-cap-mplane: count 4, size 8294400
[  535.752754] fdee0000.hdmi_receiver: C-Plane 0 size: 24883200, Total 
imagesize: 24883200
[  535.752884] fdee0000.hdmi_receiver: C-Plane 0 size: 24883200, Total 
imagesize: 24883200
[  535.752904] fdee0000.hdmi_receiver: hdmirx_start_streaming: 
start_stream cur_buf y_addr:0xe0ea5000, uv_addr:0xe168e000
[  535.752920] fdee0000.hdmi_receiver: hdmirx_start_streaming: enable dma
[  535.780112] fdee0000.hdmi_receiver: dma_irq st1:0x100, st13:1085
[  535.780128] fdee0000.hdmi_receiver: line_flag_int_handler: last have 
no dma_idle_irq
[  535.796093] fdee0000.hdmi_receiver: dma_irq st1:0x80, st13:2160
[  535.813435] fdee0000.hdmi_receiver: dma_irq st1:0x100, st13:1085
[  535.829423] fdee0000.hdmi_receiver: dma_irq st1:0x80, st13:2160
[...]
---------------------------

###source set to 4k60fps####
---------------------------
v4l2-ctl --verbose -d /dev/video1 
--set-fmt-video=width=3840,height=2160,pixelformat='NV12' 
--stream-mmap=4 --stream-skip=3 --stream-count=100 --stream-poll
---------------------------
VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Capture Multiplanar:
     Width/Height      : 3840/2160
     Pixel Format      : 'NV12' (Y/UV 4:2:0)
     Field             : None
     Number of planes  : 1
     Flags             :
     Colorspace        : sRGB
     Transfer Function : Default
     YCbCr/HSV Encoding: Default
     Quantization      : Default
     Plane 0           :
        Bytes per Line : 3840
        Size Image     : 8294400
[stuck here, have to end with ctrl c]


---------------------------
dmesg
---------------------------
[ 1520.198123] fdee0000.hdmi_receiver: hb
[ 1521.211383] fdee0000.hdmi_receiver: hb
[ 1522.224680] fdee0000.hdmi_receiver: hb
[ 1523.237936] fdee0000.hdmi_receiver: hb
[ 1524.251313] fdee0000.hdmi_receiver: hb
[ 1525.264606] fdee0000.hdmi_receiver: hb
[ 1526.277937] fdee0000.hdmi_receiver: hb
[ 1526.427540] fdee0000.hdmi_receiver: C-Plane 0 size: 8294400, Total 
imagesize: 8294400
[ 1526.427587] fdee0000.hdmi_receiver: C-Plane 0 size: 8294400, Total 
imagesize: 8294400
[ 1526.427598] fdee0000.hdmi_receiver: hdmirx_set_fmt: req(3840, 2160), 
out(3840, 2160), fmt:0x3231564e
[ 1526.435569] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[ 1526.435588] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: YUV420
[ 1526.435597] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[ 1526.435618] fdee0000.hdmi_receiver: get timings from dma
[ 1526.435626] fdee0000.hdmi_receiver: act:3840x2160, total:4400x2250, 
fps:60, pixclk:297008000
[ 1526.435637] fdee0000.hdmi_receiver: hfp:4294965460, hs:48, hbp:148, 
vfp:8, vs:10, vbp:72
[ 1526.435648] fdee0000.hdmi_receiver: tmds_clk:297008000
[ 1526.435656] fdee0000.hdmi_receiver: interlace:0, fmt:3, vic:127, 
color:24, mode:hdmi
[ 1526.435665] fdee0000.hdmi_receiver: deframer_st:0x11
[ 1527.291212] fdee0000.hdmi_receiver: hb
[ 1527.443533] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[ 1527.443550] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: YUV420
[ 1527.443560] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[ 1527.443579] fdee0000.hdmi_receiver: get timings from dma
[ 1527.443586] fdee0000.hdmi_receiver: act:3840x2160, total:4400x2250, 
fps:60, pixclk:297008000
[ 1527.443597] fdee0000.hdmi_receiver: hfp:4294965460, hs:48, hbp:148, 
vfp:8, vs:10, vbp:72
[ 1527.443608] fdee0000.hdmi_receiver: tmds_clk:297008000
[ 1527.443615] fdee0000.hdmi_receiver: interlace:0, fmt:3, vic:127, 
color:24, mode:hdmi
[ 1527.443625] fdee0000.hdmi_receiver: deframer_st:0x11
[ 1528.304515] fdee0000.hdmi_receiver: hb
[ 1528.451543] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[ 1528.451560] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: YUV420
[ 1528.451569] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[ 1528.451588] fdee0000.hdmi_receiver: get timings from dma
[ 1528.451595] fdee0000.hdmi_receiver: act:3840x2160, total:4400x2250, 
fps:60, pixclk:297008000
[ 1528.451606] fdee0000.hdmi_receiver: hfp:4294965460, hs:48, hbp:148, 
vfp:8, vs:10, vbp:72
[ 1528.451617] fdee0000.hdmi_receiver: tmds_clk:297008000
[ 1528.451624] fdee0000.hdmi_receiver: interlace:0, fmt:3, vic:127, 
color:24, mode:hdmi
[ 1528.451634] fdee0000.hdmi_receiver: deframer_st:0x11
[ 1529.317814] fdee0000.hdmi_receiver: hb
[ 1529.459549] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[ 1529.459566] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: YUV420
[ 1529.459575] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[ 1529.459593] fdee0000.hdmi_receiver: get timings from dma
[ 1529.459601] fdee0000.hdmi_receiver: act:3840x2160, total:4400x2250, 
fps:60, pixclk:297008000
[ 1529.459612] fdee0000.hdmi_receiver: hfp:4294965460, hs:48, hbp:148, 
vfp:8, vs:10, vbp:72
[ 1529.459623] fdee0000.hdmi_receiver: tmds_clk:297008000
[ 1529.459630] fdee0000.hdmi_receiver: interlace:0, fmt:3, vic:127, 
color:24, mode:hdmi
[ 1529.459640] fdee0000.hdmi_receiver: deframer_st:0x11
[ 1530.331085] fdee0000.hdmi_receiver: hb
[ 1530.467555] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[ 1530.467571] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: YUV420
[ 1530.467580] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[ 1530.467599] fdee0000.hdmi_receiver: get timings from dma
[ 1530.467606] fdee0000.hdmi_receiver: act:3840x2160, total:4400x2250, 
fps:60, pixclk:297008000
[ 1530.467618] fdee0000.hdmi_receiver: hfp:4294965460, hs:48, hbp:148, 
vfp:8, vs:10, vbp:72
[ 1530.467628] fdee0000.hdmi_receiver: tmds_clk:297008000
[ 1530.467635] fdee0000.hdmi_receiver: interlace:0, fmt:3, vic:127, 
color:24, mode:hdmi
[ 1530.467664] fdee0000.hdmi_receiver: deframer_st:0x11
[ 1531.344437] fdee0000.hdmi_receiver: hb
[ 1531.475649] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[ 1531.475665] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: YUV420
[ 1531.475674] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[ 1531.475693] fdee0000.hdmi_receiver: get timings from dma
[ 1531.475700] fdee0000.hdmi_receiver: act:3840x2160, total:4400x2250, 
fps:60, pixclk:297008000
[ 1531.475711] fdee0000.hdmi_receiver: hfp:4294965460, hs:48, hbp:148, 
vfp:8, vs:10, vbp:72
[ 1531.475722] fdee0000.hdmi_receiver: tmds_clk:297008000
[ 1531.475729] fdee0000.hdmi_receiver: interlace:0, fmt:3, vic:127, 
color:24, mode:hdmi
[ 1531.475739] fdee0000.hdmi_receiver: deframer_st:0x11
[ 1532.357695] fdee0000.hdmi_receiver: hb
[ 1532.483716] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[ 1532.483733] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: YUV420
[ 1532.483742] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[ 1532.483761] fdee0000.hdmi_receiver: get timings from dma
[ 1532.483768] fdee0000.hdmi_receiver: act:3840x2160, total:4400x2250, 
fps:60, pixclk:297008000
[ 1532.483780] fdee0000.hdmi_receiver: hfp:4294965460, hs:48, hbp:148, 
vfp:8, vs:10, vbp:72
[ 1532.483790] fdee0000.hdmi_receiver: tmds_clk:297008000
[ 1532.483797] fdee0000.hdmi_receiver: interlace:0, fmt:3, vic:127, 
color:24, mode:hdmi
[ 1532.483807] fdee0000.hdmi_receiver: deframer_st:0x11
[ 1533.370994] fdee0000.hdmi_receiver: hb
[ 1533.491726] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[ 1533.491743] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: YUV420
[ 1533.491752] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[ 1533.491770] fdee0000.hdmi_receiver: get timings from dma
[ 1533.491778] fdee0000.hdmi_receiver: act:3840x2160, total:4400x2250, 
fps:60, pixclk:297008000
[ 1533.491789] fdee0000.hdmi_receiver: hfp:4294965460, hs:48, hbp:148, 
vfp:8, vs:10, vbp:72
[ 1533.491800] fdee0000.hdmi_receiver: tmds_clk:297008000
[ 1533.491807] fdee0000.hdmi_receiver: interlace:0, fmt:3, vic:127, 
color:24, mode:hdmi
[ 1533.491816] fdee0000.hdmi_receiver: deframer_st:0x11
[ 1534.384324] fdee0000.hdmi_receiver: hb
[ 1534.499888] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[ 1534.499904] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: YUV420
[ 1534.499913] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[ 1534.499932] fdee0000.hdmi_receiver: get timings from dma
[ 1534.499939] fdee0000.hdmi_receiver: act:3840x2160, total:4400x2250, 
fps:60, pixclk:297008000
[ 1534.499950] fdee0000.hdmi_receiver: hfp:4294965460, hs:48, hbp:148, 
vfp:8, vs:10, vbp:72
[ 1534.499960] fdee0000.hdmi_receiver: tmds_clk:297008000
[ 1534.499968] fdee0000.hdmi_receiver: interlace:0, fmt:3, vic:127, 
color:24, mode:hdmi
[ 1534.499977] fdee0000.hdmi_receiver: deframer_st:0x11
[ 1535.397596] fdee0000.hdmi_receiver: hb
[ 1535.507961] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[ 1535.507977] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: YUV420
[ 1535.507986] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[ 1535.508005] fdee0000.hdmi_receiver: get timings from dma
[ 1535.508012] fdee0000.hdmi_receiver: act:3840x2160, total:4400x2250, 
fps:60, pixclk:297008000
[ 1535.508023] fdee0000.hdmi_receiver: hfp:4294965460, hs:48, hbp:148, 
vfp:8, vs:10, vbp:72
[ 1535.508034] fdee0000.hdmi_receiver: tmds_clk:297008000
[ 1535.508041] fdee0000.hdmi_receiver: interlace:0, fmt:3, vic:127, 
color:24, mode:hdmi
[ 1535.508051] fdee0000.hdmi_receiver: deframer_st:0x11
[ 1536.410933] fdee0000.hdmi_receiver: hb
[ 1537.424223] fdee0000.hdmi_receiver: hb
[ 1538.437523] fdee0000.hdmi_receiver: hb
[ 1539.450848] fdee0000.hdmi_receiver: hb

Best regards
Tim

On 06.08.24 13:58, Dmitry Osipenko wrote:
> On 8/4/24 02:57, Tim Surber wrote:
>> Hi Shreeya,
>>
>> I tested your patch and noticed problems when using 3840x2160 resolution
>> at  60fps.
>>
>> For my testing I connected an HDMI source and set it to 4k60fps. I
>> verified that this source and the cables work on a screen at this
>> resolution.
>>
>> Using
>> 'v4l2-ctl --verbose -d /dev/video1
>> --set-fmt-video=width=3840,height=2160,pixelformat='NV12'
>> --stream-mmap=4 --stream-skip=3 --stream-count=100 --stream-poll'
>> I get the video format output, but not the periodic output which shows
>> the fps.
>>
>> Using
>> 'GST_DEBUG=4 gst-launch-1.0 -v v4l2src device=/dev/video1 !
>> fpsdisplaysink text-overlay=false video-sink="fakevideosink"'
>> I get the following error message:
>>
>> (gst-launch-1.0:3231): GStreamer-CRITICAL **: 01:34:39.137:
>> gst_memory_resize: assertion 'size + mem->offset + offset <=
>> mem->maxsize' failed
>> 0:00:03.489382529  3231 0xffffa0000b90 WARN  v4l2bufferpool
>> gstv4l2bufferpool.c:2209:gst_v4l2_buffer_pool_process:<v4l2src0:pool0:src> Dropping truncated buffer, this is likely a driver bug.
>> 0:00:03.489421906  3231 0xffffa0000b90 WARN  bufferpool
>> gstbufferpool.c:1252:default_reset_buffer:<v4l2src0:pool0:src> Buffer
>> 0xffff98008e80 without the memory tag has maxsize (8294400) that is
>> smaller than the configured buffer pool size (12441600). The buffer will
>> be not be reused. This is most likely a bug in this GstBufferPool subclass
>>
>>
>> Everything works with 4k30fps or 1080p 60fps. The hardware should
>> support 4k60fps.
> Please do `echo 3 > /sys/module/synopsys_hdmirx/parameters/debug` and
> show the kernel log of capturing 4k@60 with v4l2-ctl.
>

