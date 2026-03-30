Return-Path: <linux-media+bounces-57540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENemF/Yhymmu5QUAu9opvQ
	(envelope-from <linux-media+bounces-57540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:10:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D00356449
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A0DD303B7C9
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 07:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4073A39E18E;
	Mon, 30 Mar 2026 07:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="NGeKwuJc"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1352494F0;
	Mon, 30 Mar 2026 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854482; cv=none; b=X8u0DbBlsAqlgAGhGOFIY6zIX60v2zieDAQbvnOrZc3QSN4b4ewh+AtyX0zEauQ8mqTpvY3ybYlK+oC5CSU5klzDXPr1kIxK45d9h9QlpIEZCMqkYaIm83Ax0tVeeffAHm2szauawG3cKTQF6Cj5sDD0ZEsbtEsizG4Vk8RmAEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854482; c=relaxed/simple;
	bh=z7HP63rbof84RWhabgW0Qe0IyRggMGT5BLfeW17x4xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QF0ZK2HiL+59+IF/dWDY1kjxzN2hTpysdT5e4OPCIYpc3/oKRfnoIYLGHQOS5aLwTNPLA8bE+GyQCQwQg+ic3zmdMKP28V5WwJKiI6Td3p0wAFpLpgCYdLr7Z5BIeftHK9OKpLV9xqYGI0/M2SSK2SKb4KNrPz4xfdLj9sN8/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=NGeKwuJc; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=F5tSkID2FDKT1ELpjTKslhUo9C8Nr5L4Tk+Md4tJy1M=; b=NGeKwuJcnv+wskFtZYHzag+T8W
	5n0WBDlYMD/j85FXPryUxLfs5Ss4ACrMXa1Xgbi4UleGk9RFFnJHRLyIdcD2GUtxutfS/BSLhJhHD
	JUY7DSGnejd9B9MZQGq7A3Khn9sBs8CMKnIvukK3/ut3toJOnI0NUDpz0kSYmtqhUcg8=;
Received: from 194-208-226-106.tele.net ([194.208.226.106]:65088 helo=[192.168.0.207])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend.oss@emfend.at>)
	id 1w76ib-00FDZY-3a; Mon, 30 Mar 2026 09:07:26 +0200
Message-ID: <605f8f6a-8853-4ab2-8b72-8e9fa5a21cbe@emfend.at>
Date: Mon, 30 Mar 2026 09:07:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] media: add Himax HM1246 image sensor
To: Matthias Fend <matthias.fend@emfend.at>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Tarang Raval <tarang.raval@siliconsignals.io>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hao Yao <hao.yao@intel.com>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
References: <20260128-hm1246-v9-0-f9c996486a95@emfend.at>
Content-Language: de-DE
From: Matthias Fend <matthias.fend.oss@emfend.at>
In-Reply-To: <20260128-hm1246-v9-0-f9c996486a95@emfend.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57540-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[emfend.at];
	FREEMAIL_TO(0.00)[emfend.at,kernel.org,linux.intel.com,chromium.org,apitzsch.eu,siliconsignals.io,foss.st.com,intel.com,linaro.org,rowland.harvard.edu,gmail.com,ideasonboard.com,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.941];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend.oss@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_WP_URI(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,himax.com.tw:url]
X-Rspamd-Queue-Id: B3D00356449
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

I wanted to ask if, from your perspective, there are any things left 
here that you would like to see changed?

Thanks
  ~Matthias

Am 28.01.2026 um 17:08 schrieb Matthias Fend:
> Hello,
> 
> this series adds support for the Himax HM1246 image sensor.
> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
> array size of 1296 x 976.
> Currently, only the native RAW mode is supported. Other modes and the
> internal image signal processing pipeline are not currently supported.
> The data sheet is available on the manufacturer's website [1].
> Tested on i.MX8MP hardware. A Toshiba TC358746 bridge was used to convert
> the sensor's parallel video output into MIPI signals for the i.MX8MP.
> 
> Best regards
>   ~Matthias
>   
> [1] https://www.himax.com.tw/wp-content/uploads/2024/03/HM1246-AWD_DS_v01.pdf
> 
> v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
> 
> Compliance test for device /dev/v4l-subdev4:
> 
> Driver Info:
>          Driver version   : 6.12.0
>          Capabilities     : 0x00000000
>          Client Capabilities: 0x0000000000000003
> streams interval-uses-which
> Required ioctls:
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/v4l-subdev4 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 15 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
> 
> Total for device /dev/v4l-subdev4: 45, Succeeded: 45, Failed: 0, Warnings: 0
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
> Changes in v9:
> - Use v4l2_rect in hm1246_mode
> - Return in default case of hm1246_get_selection()
> - Convert gpio based reset handling to use generic reset controller
> - Link to v8: https://lore.kernel.org/r/20260113-hm1246-v8-0-ea93947b192e@emfend.at
> 
> Changes in v8:
> - Adjusted copyright year (Sakari)
> - Use local var for unreferenced v4l2 controls (Sakari)
> - Return NULL instead of PTR_ERR if hm1246_find_mode_by_mbus_code() fails (Sakari)
> - Removed unnecessary parentheses (Sakari)
> - Dropped git reference in MAINTAINER entry (Sakari)
> - Added default for bus-width in bindings (Sakari)
> - Link to v7: https://lore.kernel.org/r/20260112-hm1246-v7-0-fee8587f2808@emfend.at
> 
> Changes in v7:
> - Expect the PLL to generate the exact link frequency specified in DT (Laurent, Sakari)
> - Dropped {g,s}_register functions
> - Link to v6: https://lore.kernel.org/r/20251202-hm1246-v6-0-3e96ed6b3ffa@emfend.at
> 
> Changes in v6:
> - Rework includes to follow include-what-you-use (Andy)
> - Replace 'fsleep(6000)' with 'fsleep(6 * USEC_PER_MSEC)' (Andy)
> - Simplify hm1246_get_selection() return (Andy)
> - Use explicit indexes for test pattern array (Andy)
> - Improve some line-wrappings (Andy)
> - Avoid using __maybe_unused (Andy)
> - Drop an unnecessary type cast (Andy)
> - Use '0' instead of '0x0' (Andy)
> - Reword comments about timings (Andy)
> - Simplify error handling of hm1246_init_controls() (Sakari)
> - Revert 'rework PLL calc to use goto' (Andy, Sakari)
> - Link to v5: https://lore.kernel.org/r/20251104-hm1246-v5-0-97c8f25b5419@emfend.at
> 
> Changes in v5:
> - Converted to lower case hexadecimals
> - Use consistent returns in switch of hm1246_get_selection()
> - Adjust some variable types/attributes
> - Removed redundant parentheses
> - Rework PLL calc to use goto
> - Simplified some function returns
> - Use array definition for test patterns
> - Source format adjustments
> - Properly init minimum of pixel_rate control
> - dropped hm1246_update_controls()
> - require and check DT link frequencies
> - Link to v4: https://lore.kernel.org/r/20251017-hm1246-v4-0-e3388ea2f08c@emfend.at
> 
> Changes in v4:
> - Split changes to MAINTAINERS into commits
> - Fix comma after statement (use semicolon)
> - Replace abs() with abs_diff() in PLL calculation
> - Inverse needs_cmu_update logic
> - Drop mode from hm1246_set_ctrl()
> - Return if xclk frequency is out of range
> - Fix reset_gpio dev_err_probe()
> - Rebased on media-committers/next
> - Link to v3: https://lore.kernel.org/r/20250912-hm1246-v3-0-3b89f47dfa43@emfend.at
> 
> Changes in v3:
> - Bindings: Remove bus-type and add default polarity values
> - Select V4L2_CCI_I2C
> - Convert additional macros to use HZ_PER_*
> - Replace cur_mode with v4l2_find_nearest_size()
> - Remove duplicates in the register init sequence
> - Use container_of_const
> - Check return of hm1246_update_controls()
> - Correct multi-line comments
> - Replace hm1246_cci_write_cmu()
> - Consistently use hm1246->dev
> - Use pm_runtime_put_autosuspend()
> - Remove v4l2 event handling
> - Convert to devm_v4l2_sensor_clk_get()
> - Configure PM before registering subdev
> - Link to v2: https://lore.kernel.org/r/20250526-hm1246-v2-0-6b882827a3a5@emfend.at
> - Depends-on: https://lore.kernel.org/all/20250707143253.167910-1-mehdi.djait@linux.intel.com/
> 
> Changes in v2:
> - Use macros for 64-bit division
> - Avoid compiler warnings about potentially uninitialized variables
> - Fix two uses of dev_err_probe
> - Link to v1: https://lore.kernel.org/r/20250403-hm1246-v1-0-30990d71bc42@emfend.at
> 
> ---
> Matthias Fend (2):
>        media: dt-bindings: i2c: add Himax HM1246 image sensor
>        media: i2c: add Himax HM1246 image sensor driver
> 
>   .../bindings/media/i2c/himax,hm1246.yaml           |  120 ++
>   MAINTAINERS                                        |    7 +
>   drivers/media/i2c/Kconfig                          |   10 +
>   drivers/media/i2c/Makefile                         |    1 +
>   drivers/media/i2c/hm1246.c                         | 1290 ++++++++++++++++++++
>   5 files changed, 1428 insertions(+)
> ---
> base-commit: 3aa9296a23ec41a8424e9a2346eea59fb6cb7d8c
> change-id: 20250403-hm1246-96b0cdab773c
> 
> Best regards,


