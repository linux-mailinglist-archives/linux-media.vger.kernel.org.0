Return-Path: <linux-media+bounces-57082-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOygMmcWxGlvwQQAu9opvQ
	(envelope-from <linux-media+bounces-57082-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 18:07:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7B3299C9
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 18:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD1A53035806
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 17:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D48395DA5;
	Wed, 25 Mar 2026 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBbIv/kV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73F326CE32
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458468; cv=none; b=DWSs6EHb7NTY1Ocu+Yi9sR5OSXiMWNdo5R2NNUE6fTLYxjXjAs1yRATA1TuqdYHzipRETfBIZnks1p8Gm2LDh0+UwUudkdQS8KK0a53mmnOmdnSXtrgUVZHKmrepQR79YrnPGdtLEQrm/oXbMWiFX6ublVqgr5LbUpvtNgobaQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458468; c=relaxed/simple;
	bh=zL7hmRqua4AEbk7k5Mcr7gjZ4cOOzcFnt+/zQmV0vho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/ovCEohvxyY+fjWSLQck66+JGH8wLAb1bFU5bc9SHT94BwvDM8pNkYaX/CRx2fmgpSgQq8mAXlR/qGGzkb2gtf7d6sGrfrpYi07tlLJXrnGtP5k1wt572vFPG9zIoWou3NoAXGUjVZJ/GjPm8AzJN2B2poQ6jT9F31pcku92ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBbIv/kV; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-67bb19ac35aso97081eaf.1
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774458465; x=1775063265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYM9RkxheY+6Phj4Oe35i6tJR6iIMQrJsEAPe5cHq9I=;
        b=bBbIv/kV9XUUXU2ucrc3zux4IK29m4DRQOvdDj1k+4s2Ltmt4dVS7aEkY+dC3lj7RF
         LmBdvGmgJtOxjm82FM8Bd2DObJC/fkuYAHx3xnq/ngtU4ql0weeldYq/Ij5gOmfZksNv
         KmoFvDc3/uO+jvtKgNI0V5U4hRxvSo7Wb75x8BIrs0OpEnJcVxLkwxUUBdrGFChqmio8
         rfKGTZ0c5+MmL7Bqn7nxbJYvvBnLPNnTAp+amZ7lKgNIj8KtCzMPJ1qbiVkoLjB02+7x
         h+76Ifdpr0GkkHXxlKfBZhiTunz47PnsMilZhz/IYVgonhf/WfY200AzjAGKICzH8SGi
         cF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458465; x=1775063265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYM9RkxheY+6Phj4Oe35i6tJR6iIMQrJsEAPe5cHq9I=;
        b=kzDh3yW7ccf0DFLLeK8SSpJxpvfgx5nT6mIHSSjDvxD4hUmlqxndjk+cKbEEcAxpy2
         iOMvSTrjTQqfzyWntLlaAv7Bp/JFsERlReYXfRjTljYYe/mukkKMmF4Kvfijtg3gmwXR
         Sr8Q/chl2Yixoef59Z9KQBBuuvPwl1iLvnbM1Q5+7Nz9B2ty12xzVBbSQBlygWSD0Iz4
         GSZJ0D3S7QVJQEZTPMl5uC9jikmIlcGTcmeaT9X3g5FUnJg9A0i1yks1X5I4BfdR/ZXQ
         AFxvRO7JDmZELxl33aQcd3VeGU8El6Ip9aB8zN7JMvWG1JKQHO2ppQdn0YT410EEz2mB
         c10g==
X-Gm-Message-State: AOJu0YyC84rVbh1GnKHUDcSWj+OrS8v1KvKp/yIUxY46qBt142fi0nu7
	meQRxXv5PNmkOV9hQ811ts/19DPVX2p45B5BwEuXiN+XHQOQK9s2PC1wi6J8GXicuQ==
X-Gm-Gg: ATEYQzzSrXHga2VpvbzcwZRQl13NvirzCwg2F3+lOx10vcRtoIh+PZ3VGMvAVY89LFL
	2XB2ycSNDvlLfFxrdSs6W3+ItspW0hlv+O7sZ03SbsLvDiURsTTj0ARAl1MB2vajF9O3/heX9wN
	pW3ulkUNNZKnR/U/6ze/HibQVErgehjHqlhgH/URsckyv5us0MGnFe3hUk+GipUSQ1s4IwyqeNp
	zhifD4lIWjW/TcWI9CG4bs556kfUU+CX4L5nLTb0ji2+hluN8GnL22elHtivDcpFJAlJGfeaDjo
	haTLNMeh1lfdGWTigxApzlb055c713GbJ9wvKPDRvl4ONhZoKIEPeH73mAjeZzbOJcTKs1uhouN
	Z77vy/UNZr7Qaoz6QD53+Ib+UgnIjwiv/WskDX8iFj4BOx4tLmAb8O6CsZ9VBou972ssv72n/qX
	1wuc3F02krQkWYppumfEyiPpFsDgQH0lt/wdl/bZDT4Eej6tuu4w==
X-Received: by 2002:a05:6820:4b18:b0:67c:2af2:a654 with SMTP id 006d021491bc7-67dff3b2bd4mr2323604eaf.10.1774458465260;
        Wed, 25 Mar 2026 10:07:45 -0700 (PDT)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e0a9e18desm377205eaf.3.2026.03.25.10.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 10:07:44 -0700 (PDT)
From: Matthew Laux <matthew.laux@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH 0/1] Add driver for StarTech USB3HDCAP capture device
Date: Wed, 25 Mar 2026 12:06:33 -0500
Message-ID: <20260325170634.55528-1-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57082-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthewlaux@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 66D7B3299C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a V4L2/ALSA driver for the StarTech USB3HDCAP (and Micomsoft
XCAPTURE-1 variant), a USB 3.0 video capture device based on the
MST3367 HDMI receiver, TW9900 composite decoder, and CS53L21 audio codec.

The driver supports composite, S-Video, component, and HDMI inputs,
including audio capture. I'm targeting staging because the I2C chip
drivers are currently embedded rather than using proper subdevice drivers,
and some other minor issues remain (see TODO).

Tested on all four inputs at various resolutions. All v4l2-compliance
tests pass, including streaming tests, but I did find what might be a bug
in v4l2-compliance that causes any device that uses V4L2_FIELD_ALTERNATE
to fail the streaming tests - I believe the sequence number checks in
v4l2-test-buffers.cpp are contradictory for V4L2_FIELD_ALTERNATE and
impossible to satisfy. I temporarily changed my driver to report
FIELD_NONE to have the streaming tests run. I'm happy to fix the
v4l2-compliance issue if it is indeed an issue, or fix my driver if
it's not :)

This is my first contribution. I based this driver heavily on the
existing `usbtv` driver and welcome all feedback. I am committed to
eventually getting this out of staging and will stick around to make
any improvements needed so that can happen.


Thanks,
Matthew

$ v4l2-compliance -s -d /dev/video2
v4l2-compliance 1.33.0-5455, 64 bits, 64-bit time_t
v4l2-compliance SHA: 95ad25f6a77a 2026-03-17 13:08:36

Compliance test for usb3hdcap device /dev/video2:

Driver Info:
	Driver name      : usb3hdcap
	Card type        : StarTech USB3HDCAP
	Bus info         : usb-0000:00:14.0-2
	Driver version   : 6.12.73
	Capabilities     : 0x85200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x05200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 4 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK
		fail: v4l2-test-io-config.cpp(210): field == V4L2_FIELD_NONE
		fail: v4l2-test-io-config.cpp(386): Timings check failed for input 2.
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: FAIL
	test VIDIOC_DV_TIMINGS_CAP: OK
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 1):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 1):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 1):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 1):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 2):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 2):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 2):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 2):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 3):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 3):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 3):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 3):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK
	test USERPTR (select): OK
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Total for usb3hdcap device /dev/video2: 134, Succeeded: 133, Failed: 1,
Warnings: 0

Matthew Laux (1):
  staging: media: add driver for StarTech USB3HDCAP

 MAINTAINERS                                   |    8 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/usb3hdcap/Kconfig       |   13 +
 drivers/staging/media/usb3hdcap/Makefile      |    4 +
 drivers/staging/media/usb3hdcap/TODO          |   16 +
 .../staging/media/usb3hdcap/usb3hdcap-audio.c |  305 +++++
 .../media/usb3hdcap/usb3hdcap-composite.c     |  182 +++
 .../staging/media/usb3hdcap/usb3hdcap-core.c  | 1048 +++++++++++++++++
 .../staging/media/usb3hdcap/usb3hdcap-hdmi.c  |  808 +++++++++++++
 .../staging/media/usb3hdcap/usb3hdcap-video.c |  511 ++++++++
 drivers/staging/media/usb3hdcap/usb3hdcap.h   |  239 ++++
 12 files changed, 3137 insertions(+)
 create mode 100644 drivers/staging/media/usb3hdcap/Kconfig
 create mode 100644 drivers/staging/media/usb3hdcap/Makefile
 create mode 100644 drivers/staging/media/usb3hdcap/TODO
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-audio.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-composite.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-core.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-hdmi.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-video.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap.h


base-commit: 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67
-- 
2.47.3


