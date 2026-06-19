Return-Path: <linux-media+bounces-65281-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pt53LkY2NWrJowYAu9opvQ
	(envelope-from <linux-media+bounces-65281-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:29:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F16916A5C63
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:29:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=emfend.at header.s=mail header.b=NzVfCfM1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65281-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65281-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B00B300BE8C
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0427F385529;
	Fri, 19 Jun 2026 12:29:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC68382292;
	Fri, 19 Jun 2026 12:29:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872176; cv=none; b=qwbKE+oy+esUg8nllWcrwnpc4oFXLJMGkiZZDIw1vh/RHcMxDwHvKUB2lCiPJOcutkaaxuPtBUiH7DGIbuR58csldrqwWompvD4VOR/J3HhMH0JT8HVsajYMzlVaWGRho0XARDRGjQVKbYhpZkP8FRzq9qUlGbbGfSjtSNM3ZFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872176; c=relaxed/simple;
	bh=4Q8efa5jrx5cARoeUaq3MdJS11vOO+cKzM0yjPlm630=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fXX+uAaDQM8QP0311vUWyuTGcXwGA/+i0WvTNr4SPy/L/DEtMrdICtTShWhsr7S+62T0bp+7BWuIuFHu5cmFNWMPKBlLCJqGwFGSwYZX29mYl6A1ph8pgyLi0REiSol981VQjMuxgN7JfKa5WAUkoPNbrwtaAj4NbvPnWOgTYiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=NzVfCfM1; arc=none smtp.client-ip=168.119.41.54
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LKi0gfH7q9tO1npGqAaXnhhOHWcmV2iQoBJDkieLRNU=; b=NzVfCfM1iPhBkD+6yCPS5v4o/a
	VfWThUADMF9z0dNw77rMnFjjS+KHIWXcGiOjCUiMUYxTw6o6zOdY6wqLSJb7g7xAhfeZaVs48zj3C
	yR8tGdOu3FZh2WuWY/V8Lc+sYUf0xoflrjhlORKGGBXwWMVlwZpts1RTr+Pe+cMMnDs4=;
Received: from 194-208-226-106.tele.net ([194.208.226.106]:53791 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1waYLE-0007xL-Jt; Fri, 19 Jun 2026 14:29:01 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH v10 0/2] media: add Himax HM1246 image sensor
Date: Fri, 19 Jun 2026 14:28:53 +0200
Message-Id: <20260619-hm1246-v10-0-d88e431a6c11@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAY2NWoC/2XRzW7DIAwH8FepOC8TmC97p73HtAMQs+TQdkqqa
 FOVdx+pNJKxC5IRv7+xfBczTyPP4uV0FxMv4zxeL6VQ8ukk0hAuH9yNfbkQIMFKI3U3nBUY15G
 LMvUheq+TKI8/J87j1yPp7b3UwzjfrtP3I3hR2+2/iEV1stOSSPZexWTglc+ZL/1zuIktYoGdW
 XCVQWEuIgKCDzrYlumdkYLK9NYtImXj+xyMbpmpTEnlKzOFsdaIHCBLTC2zO1PSVGYLI58wg43
 WKGqZ21k5KnPbJ5kc9y7qnEPL/C9zUh1m84VlZrToM6DEluGR7QvAbbZAmoyPioBbRgcGWBlt3
 SgROYMu0J8FrOv6A0mo7OhVAgAA
X-Change-ID: 20250403-hm1246-96b0cdab773c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
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
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Xiaolei Wang <xiaolei.wang@windriver.com>, 
 Walter Werner Schneider <contact@schnwalter.eu>, 
 Kate Hsuan <hpa@redhat.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hao Yao <hao.yao@intel.com>, 
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[emfend.at];
	TAGGED_FROM(0.00)[bounces-65281-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:hansg@kernel.org,m:ribalda@chromium.org,m:git@apitzsch.eu,m:tarang.raval@siliconsignals.io,m:andriy.shevchenko@linux.intel.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:dongcheng.yan@intel.com,m:bryan.odonoghue@linaro.org,m:stern@rowland.harvard.edu,m:jingjing.xiong@intel.com,m:heimir.sverrisson@gmail.com,m:mehdi.djait@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:laurent.pinchart@ideasonboard.com,m:hardevsinh.palaniya@siliconsignals.io,m:clamor95@gmail.com,m:p.zabel@pengutronix.de,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:xiaolei.wang@windriver.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:miguel.vadillo@intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hao.yao@intel.com,m:himanshu.bhava
 ni@siliconsignals.io,m:matthias.fend@emfend.at,m:krzk@kernel.org,m:conor@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,chromium.org,apitzsch.eu,siliconsignals.io,foss.st.com,intel.com,linaro.org,rowland.harvard.edu,gmail.com,ideasonboard.com,pengutronix.de,oss.qualcomm.com,windriver.com,schnwalter.eu,redhat.com];
	FORGED_SENDER(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	HAS_WP_URI(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F16916A5C63

Hello,

this series adds support for the Himax HM1246 image sensor.
The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
array size of 1296 x 976.
Currently, only the native RAW mode is supported. Other modes and the
internal image signal processing pipeline are not currently supported.
The data sheet is available on the manufacturer's website [1].
Tested on i.MX8MP hardware. A Toshiba TC358746 bridge was used to convert
the sensor's parallel video output into MIPI signals for the i.MX8MP.

Best regards
 ~Matthias
 
[1] https://www.himax.com.tw/wp-content/uploads/2024/03/HM1246-AWD_DS_v01.pdf

v4l2-compliance 1.28.1, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev4:

Driver Info:
        Driver version   : 6.12.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev4 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 15 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev4: 45, Succeeded: 45, Failed: 0, Warnings: 0

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Changes in v10:
- Reordered struct hm1246 to place embedded struct first (Andy)
- Used hex format (0x01) for gain step definition (Andy)
- Marked local tables and constants as static const (Andy)
- Improved line wrapping in hm1246_cci_write_test_pattern (Andy)
- Decoupled declaration and initialization of ret in hm1246_set_ctrl (Andy)
- Rebased
- Link to v9: https://lore.kernel.org/r/20260128-hm1246-v9-0-f9c996486a95@emfend.at

Changes in v9:
- Use v4l2_rect in hm1246_mode
- Return in default case of hm1246_get_selection()
- Convert gpio based reset handling to use generic reset controller
- Link to v8: https://lore.kernel.org/r/20260113-hm1246-v8-0-ea93947b192e@emfend.at

Changes in v8:
- Adjusted copyright year (Sakari)
- Use local var for unreferenced v4l2 controls (Sakari)
- Return NULL instead of PTR_ERR if hm1246_find_mode_by_mbus_code() fails (Sakari)
- Removed unnecessary parentheses (Sakari)
- Dropped git reference in MAINTAINER entry (Sakari)
- Added default for bus-width in bindings (Sakari)
- Link to v7: https://lore.kernel.org/r/20260112-hm1246-v7-0-fee8587f2808@emfend.at

Changes in v7:
- Expect the PLL to generate the exact link frequency specified in DT (Laurent, Sakari)
- Dropped {g,s}_register functions
- Link to v6: https://lore.kernel.org/r/20251202-hm1246-v6-0-3e96ed6b3ffa@emfend.at

Changes in v6:
- Rework includes to follow include-what-you-use (Andy)
- Replace 'fsleep(6000)' with 'fsleep(6 * USEC_PER_MSEC)' (Andy)
- Simplify hm1246_get_selection() return (Andy)
- Use explicit indexes for test pattern array (Andy)
- Improve some line-wrappings (Andy)
- Avoid using __maybe_unused (Andy)
- Drop an unnecessary type cast (Andy)
- Use '0' instead of '0x0' (Andy)
- Reword comments about timings (Andy)
- Simplify error handling of hm1246_init_controls() (Sakari)
- Revert 'rework PLL calc to use goto' (Andy, Sakari)
- Link to v5: https://lore.kernel.org/r/20251104-hm1246-v5-0-97c8f25b5419@emfend.at

Changes in v5:
- Converted to lower case hexadecimals
- Use consistent returns in switch of hm1246_get_selection()
- Adjust some variable types/attributes
- Removed redundant parentheses
- Rework PLL calc to use goto
- Simplified some function returns
- Use array definition for test patterns
- Source format adjustments
- Properly init minimum of pixel_rate control
- dropped hm1246_update_controls()
- require and check DT link frequencies
- Link to v4: https://lore.kernel.org/r/20251017-hm1246-v4-0-e3388ea2f08c@emfend.at

Changes in v4:
- Split changes to MAINTAINERS into commits
- Fix comma after statement (use semicolon)
- Replace abs() with abs_diff() in PLL calculation
- Inverse needs_cmu_update logic
- Drop mode from hm1246_set_ctrl()
- Return if xclk frequency is out of range
- Fix reset_gpio dev_err_probe()
- Rebased on media-committers/next
- Link to v3: https://lore.kernel.org/r/20250912-hm1246-v3-0-3b89f47dfa43@emfend.at

Changes in v3:
- Bindings: Remove bus-type and add default polarity values
- Select V4L2_CCI_I2C
- Convert additional macros to use HZ_PER_*
- Replace cur_mode with v4l2_find_nearest_size()
- Remove duplicates in the register init sequence
- Use container_of_const
- Check return of hm1246_update_controls()
- Correct multi-line comments
- Replace hm1246_cci_write_cmu()
- Consistently use hm1246->dev
- Use pm_runtime_put_autosuspend()
- Remove v4l2 event handling
- Convert to devm_v4l2_sensor_clk_get()
- Configure PM before registering subdev
- Link to v2: https://lore.kernel.org/r/20250526-hm1246-v2-0-6b882827a3a5@emfend.at
- Depends-on: https://lore.kernel.org/all/20250707143253.167910-1-mehdi.djait@linux.intel.com/

Changes in v2:
- Use macros for 64-bit division
- Avoid compiler warnings about potentially uninitialized variables
- Fix two uses of dev_err_probe
- Link to v1: https://lore.kernel.org/r/20250403-hm1246-v1-0-30990d71bc42@emfend.at

---
Matthias Fend (2):
      media: dt-bindings: i2c: add Himax HM1246 image sensor
      media: i2c: add Himax HM1246 image sensor driver

 .../bindings/media/i2c/himax,hm1246.yaml           |  120 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   10 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/hm1246.c                         | 1291 ++++++++++++++++++++
 5 files changed, 1429 insertions(+)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20250403-hm1246-96b0cdab773c

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


