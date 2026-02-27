Return-Path: <linux-media+bounces-53747-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K4fDJXToWlLwgQAu9opvQ
	(envelope-from <linux-media+bounces-53747-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:25:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA23D1BB6EF
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4395B303A876
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8148243E48E;
	Fri, 27 Feb 2026 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fdAoUoQ9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195C5326952
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 17:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772212845; cv=none; b=Muj4YMIR+lH2j/Rhl8XRWu4QuP9/hCSA8TW25qWi/40QcpT28yPeOHp5URVCoBOUDWjPVOGEsVfDd7JU7do1G5HboGi8r4eW+ZtKIbvtII53rrR498LpsyBxzGeUAyhyfTqapLUQ9kVLaY4Yf3ZyVVuq13UyHGdyLE8Sql6U5kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772212845; c=relaxed/simple;
	bh=8aeYO36yBar0FpmWnUEqtGbHzW/1HbmwS47kyODI5SA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iEPDXxmGr5X3Syh+zUCBv8/Z89BKN2J2j4Hih6+J7hNOk3iVlYt4pKkhEp+SzVAU9r75s6imf8HeVsiu+XsmvDrmc68MrZfgbf2mxPkuV/sTc5wDQjj98xC7Z6aN5r91fnbFy6aJijZQiuabebXpWIvjunqBMU/BBaAhQr2huVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fdAoUoQ9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4837907f535so20326285e9.3
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 09:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772212841; x=1772817641; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DoGI02PXwBfqpUZ7z2hOj45k98Qu78FePJ4b8SZ2m+o=;
        b=fdAoUoQ9rLxIQBRMKOTMFUt+dZAz+lxVPWYm3dygQtN+HWCs/r0rI07TQP2K/+QD0X
         UkrlQRk4AosYGxwC+D2xDbbF5fojNn4E1e8H/GpXKnjEK9yQg27ZQI/o39EeBc3Bjn8K
         M1iVVdJj6/Z9nWt6u1Z2FflyuQGiy2W2Lt6jCo+6BH44U6CtUG2WSm2dempI5C+eF3VG
         pRFltXSwhZZqhTDKiRn4z449jj/MB7eCXMCgdmFQXbGkIwaG64i+WoqfFTb7qax5JeFz
         WkCNeMLIXGvMnQdQflOiGqjyD6kUdz0M49Thrbs9dIyXv3/MfTNGAb62+wEvTf0mtUbI
         tt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212841; x=1772817641;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoGI02PXwBfqpUZ7z2hOj45k98Qu78FePJ4b8SZ2m+o=;
        b=XopYVNCC+6VRKiabaDGvdC0gsQiX6AFK5iFPFlOu+IJcw/R07WHKElUO2EC0buxvw8
         zJf2J04qOLqNq7/giGQC9WfnUKaCw6hVsz05k9Zy3p2cboxuJ/91Tyn8tCYa6iK45Uhi
         bfVNBwUawPmUXVXTbBts9gzKZXrD4IMmhQhwXaidLLaW3Cn70fgNyaipOk29S/2dC/JK
         bVdJT8QORPJKao5Affuyl+s8MR2Suc7U83QYBTQl9/JD9VwJ4PT2W2AUP8djaQWlyF9T
         cYfFougfELDTCQydDd/DF2sK9NSpXTW0Z0AO1+c/zPS8887Qt7uMf0qZT0/Vfza8gTjy
         90Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUseQc0XIgygmyileJpcRu9MPzfdW5CCdnBzZ+D0Iu7JOV+VOFOHCObu7oeoYK/nAlrRliLIMv+2GqAXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygdzzjYe6kAXySR/aofV/AH4i2l/fk2Jpi5GWvS4Ie504vQdzR
	gN3GvUgbZholm/Pkj/kcMJ10X7uQCsiJskvGo1GyoLNH8xSbdJ4dIeV7KPLFzj7ucB4=
X-Gm-Gg: ATEYQzw8b2kHBo2SmEEZnKkbPHDsVfmr0bognjKt6VxjSnEPaEScVP5gJLY9hbPiXno
	D8RG2O+f6mwY1Y+jGzK+jSftPTZh0/xBX747imQ0xmxirdTpdpnOcJYMT4fjToomuxJh0YtuPYy
	2chNlYdGcAOluwErAMJo73p1hsxzAM9fjjNGcOHz+qoHkRVrdBpUwpCCwwxQo2WMNHqq5qULyup
	6tDksA23/H0QTe99JCGz+P/CFtUyz7VUgcuEU28M6fYAKJbVPwOcDg+F4XEqB9v5JsxuA5Z/v1X
	bb9Xk+zD5UJiMi0HukE/IwDkigDGuv/lRncjEJ041Va71VsKHhCItydLpMxUHOwYfAfFI5CQudc
	exeUNYHZ8FmaBRVQJV4r393++E4pwQnU0aDkE2jfJz1Ebzk3HfUoxAQxsTkcgmIqHjFTdoDlEb9
	AvMOUXltY/LEY2CA==
X-Received: by 2002:a05:600c:5289:b0:480:1c53:2085 with SMTP id 5b1f17b1804b1-483c9bbbf1amr59075775e9.19.1772212841296;
        Fri, 27 Feb 2026 09:20:41 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfeb932bsm60828075e9.28.2026.02.27.09.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:20:40 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v5 0/6] Raspberry Pi HEVC decoder driver
Date: Fri, 27 Feb 2026 17:19:05 +0000
Message-Id: <20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAnSoWkC/23PzY4CIQzA8VcxnBcDBYbRk++x8cBH2elBZwKGr
 DHz7jJmNx7k+G/SX9MHK5gJCzvuHixjpULztYX52rEwuesPcoqtGQjQEiTwC0ZyPC/EJ6yBRwx
 ceePRqkNSPrK2uGRM9PtCv8+tJyq3Od9fN6rcpn8ciB5XJRdcoA9BaIwa8JRdWTzmfF9oH+YL2
 9AK/5ARIIYuBA0aDsqoMI7CeOhD6g1pUF1INWhMUSUXZRyS70P6DVkhu5DeXjM2JGe0lNZ+Quu
 6PgEu7wvslQEAAA==
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,kynesim.co.uk,gmx.net,vger.kernel.org,lists.infradead.org,raspberrypi.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-53747-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url,raspberrypi.com:mid,raspberrypi.com:dkim,raspberrypi.com:email]
X-Rspamd-Queue-Id: CA23D1BB6EF
X-Rspamd-Action: no action

Hi All

This has been in the pipeline for a while, but I've finally cleaned
up our HEVC decoder driver to be in a shape to upstream.
John Cox has done almost all of the work under contract to Raspberry
Pi, and I'm largely just doing the process of patch curation and
sending.

Thanks
  Dave

v4l2-compliance 1.33.0-5448, 64 bits, 64-bit time_t
v4l2-compliance SHA: bd0aabb96710 2026-02-09 17:38:28

Compliance test for rpi-hevc-dec device /dev/video0:

Driver Info:
	Driver name      : rpi-hevc-dec
	Card type        : rpi-hevc-dec
	Bus info         : platform:rpi-hevc-dec
	Driver version   : 6.19.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateless Decoder
Media Driver Info:
	Driver name      : rpi-hevc-dec
	Model            : rpi-hevc-dec
	Serial           : 
	Bus info         : platform:rpi-hevc-dec
	Media version    : 6.19.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.19.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : rpi-hevc-dec-source
	Function         : V4L2 I/O
	Pad 0x01000002   : 0: Source
	  Link 0x02000008: to remote pad 0x1000004 of entity 'rpi-hevc-dec-proc' (Video Decoder): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
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
		fail: v4l2-test-controls.cpp(942): try_ext_ctrls returned an error (22)
	test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 3 Private Controls: 0
	Standard Compound Controls: 5 Private Compound Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK
	test blocking wait: OK

Total for rpi-hevc-dec device /dev/video0: 49, Succeeded: 48, Failed: 1, Warnings: 0

Testing is with a downstream patchset to FFmpeg. I'm told FFmpeg
currently has no stateless decode support, but we will be reviewing
works that have been in progress and our downstream patches to see
whether that can be pushed onwards.
Downstream tree is at
https://github.com/jc-kynesim/rpi-ffmpeg/tree/test/7.1.2/main

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9247
adds support for the new formats to GStreamer, and runs Fluster.
Using the JCT-VC-HEVC_V1 test suite we get 142 passes out of 147 tests.
PICSIZE_[ABCD]_Bossen_1 all fail due to the image sizes being greater than
the 4096x4096 limit of this driver.
TSUNEQBD_A_MAIN10_Technicolor_2 fails as the hardware doesn't support
having a different bit depth for luma and chroma.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v5:
- Updated driver based on Nicolas' review comments of V4.
- Added NV12MT_COL128 to ./drivers/media/v4l2-core/v4l2-common.c. The
  10 bit format can't be represented with v4l2_format_info at present
  as it assumes a power of 2 block size.
- Switched to kzalloc_obj/kzalloc_objs as checkpatch now checks that.
- Link to v4: https://lore.kernel.org/r/20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com

Changes in v4:
- dt-bindings: Drop to just SoC compatibles and updated description (Krzysztof).
- dts: Corrected address in node name.
- NV12MT_COL128 format description added vertical alignment to a
  multiple of 8 (Nicolas)
- driver: Merged in driver updates based on Nicolas' review.
- driver: Added debug module parameter to avoid log spam due to some bitstreams.
- cover-letter: Added Fluster results.
- rebased and based on the updated version of 
  https://lore.kernel.org/linux-media/20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com/
- update v4l2-compliance output
- Link to v3: https://lore.kernel.org/r/20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com

Changes in v3:
- Updated the dtbinding with SoC specific compatible strings (Rob).
- Reordered hevc_dec and v3d in bcm2711.dtsi to keep them in ascending
  register order (Stefan).
- Reordered hevc_dec in bcm2711-rpi.dtsi to keep them in alphabetical
  order (Stefan).
- Tested on top of Nicolas' revised version of Hans' patch set for
  manual request completion.
  https://lore.kernel.org/all/20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com/
- Link to v2: https://lore.kernel.org/r/20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com

Changes in v2:
- Rebased to use Hans' manual request completion scheme.
  https://lore.kernel.org/linux-media/cover.1724928939.git.hverkuil-cisco@xs4all.nl/
- Require all slices for a frame to be submitted in one request.
- Added the missing header file.
- Used the full macro name for pix format docs (Sakari)
- Dropped unneeded |- from dtbinding (Rob)
- Made reg and reg-names match in order (Rob)
- Removed clock-names from dtbinding (Rob)
- Driver changed to not request the clock by name
- Dropped clock-names from DTS file
- Minor fixes for compliance failures
  fail: v4l2-test-formats.cpp(958): fmt_cap.g_colorspace() != col
  fail: v4l2-test-buffers.cpp(901): q.create_bufs(node, 1, &fmt) != EINVAL
- v4l2-compliance output added to cover letter (Nicholas)
  I believe the "fail: v4l2-test-controls.cpp(939): try_ext_ctrls
  returned an error (22)" is expected as it is validating the SPS.
  Hantro and Cedrus certainly both appear to return errors in the same place
- Link to v1: https://lore.kernel.org/r/20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com

---
Dave Stevenson (4):
      docs: uapi: media: Document Raspberry Pi NV12 column format
      media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
      dt-bindings: media: Add the Raspberry Pi HEVC decoder
      arm: dts: bcm2711-rpi: Add HEVC decoder node

John Cox (2):
      docs: uapi: media: Clarify HEVC slice_param bit_size, data_byte_offset
      media: platform: Add Raspberry Pi HEVC decoder driver

 .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
 .../media/v4l/ext-ctrls-codec-stateless.rst        |    6 +-
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
 MAINTAINERS                                        |   10 +
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    4 +
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
 drivers/media/platform/raspberrypi/Kconfig         |    1 +
 drivers/media/platform/raspberrypi/Makefile        |    1 +
 .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
 .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
 .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  326 +++
 .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  195 ++
 .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2436 ++++++++++++++++++++
 .../platform/raspberrypi/hevc_dec/hevc_d_h265.h    |   22 +
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  429 ++++
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  317 +++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  634 +++++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
 drivers/media/v4l2-core/v4l2-common.c              |    2 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/videodev2.h                     |    4 +
 21 files changed, 4570 insertions(+), 2 deletions(-)
---
base-commit: 1b3b9a66bd29f0bcc419377bdd2d1b722265f609
change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


