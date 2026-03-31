Return-Path: <linux-media+bounces-57695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGeOAiUZy2lrDwYAu9opvQ
	(envelope-from <linux-media+bounces-57695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 02:45:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDA0362CD0
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 02:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62EE1304653B
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 00:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BD928689B;
	Tue, 31 Mar 2026 00:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5ySOu+e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B461275B03
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 00:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917560; cv=none; b=TMyKrrCGUWd52Kcr1Utnifj9sW4m0wldp1PMt2FNMHLlV0gDFklXGLVei8lCIicLbBuXdW2SDXSvtdZrmQesjXTC5OhwExWl/y4na24gUtqrZWzZLtLJKUppmLTVwizqv1lLokAksICuYPQsdPBWkDDnyCl4rr0BawSptYHQ/zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917560; c=relaxed/simple;
	bh=BNs4kWMgC4LhIpybP4JEKkM79J3ySRTrb6LS2+wEHF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qUSOJIbMSGhSMI+9nWh8E5VRTnJAgJSwciCzgAY04/LiF5j8iMbqstB9+z3pbcXqWChDuWkauevJjobb0f54yRCP465iF53qF/aRMnR/QeOH/aYpQ6zLxZrMQVqUKpjwnMcqT4sC6ypuRE0v/MqKLulXHKRtx/DD9QW2bE3XLg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5ySOu+e; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-463f00cda04so2888879b6e.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 17:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774917558; x=1775522358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMuwGDW/FgnIJbFIDzAnfdz4iDnrrYckzTA+tSv3rM0=;
        b=D5ySOu+ecCbkpYtp15hPCmAsXSVRGQyfJd5RpqtLWM7jF8LYz/konohx/VWo1pc66I
         rcjkfouKeM98p+dUE0eNMhUYfsWqqcxPfDN/80hxVuOsZH5QRIBVSM3SS2xIB64WuNkq
         iQdxaZTKSwPteZ1WpD3VcNL8i9IeO6+EA1LjtE+yjSoldTL7llspAWiWeq7jzNVlInFl
         Amnp70v9So6VTMUKqLXVX+83dmZ4CXcDUEi1vZi3EwsQ/eZvcMKiOydARp8JD4ZzUZwg
         VEFEHWJEGm+u7yY+2yg9ICEqpITJP4xIiRRIKdRoUy4a5HIZrGH1mrA9oSy9AtPCitv/
         Te8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917558; x=1775522358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMuwGDW/FgnIJbFIDzAnfdz4iDnrrYckzTA+tSv3rM0=;
        b=BR2D+KCXoFVi79TXmUZKe1024mvaU4FyE4Y/aRp8zuAejuB5psUnvc2615Dh541ttg
         enA+e0RyWn/d9INeF1/zMvnQpfiOi8szpkDmw9ZkdeqyA0HMDnFzBZYumi+Yhyuggxwi
         NU1sv39d9AfZXBYkxvyAxhBefI/IgmJ3jnZZpmDTHw3UkRH5AjxRVV3yT4P4/GHWmnSY
         IoqToNHomJ3pQy1G6WvtYGWt/BZ3Ml8Z2I+qFO/WrY3a8jr96kSQWO89a+sOQKcUBiQq
         7XusqTv3MpMr6QRUCR0JiByZQnTa2+3djFYvxvWRyOAqLtp0Yhl+D7cS6lVjKpX0Xn63
         4FXw==
X-Forwarded-Encrypted: i=1; AJvYcCVDCuAmw9AsqPStXRFNW9uYv3BDFPwCBSNFIP7661uzyl+Fsod76NY2vVIHv2dSh3TkYansDh7/uA8V8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyciar/ZbKxETukE7FEIL5+7N4dyVm82cMHpriFVLHmkV7R9rn7
	YnpW7YySnh71MxC0vJn5EBakA/z2+JNyxjJlh4JovGCOmEwNux6D4Qw=
X-Gm-Gg: ATEYQzx6Akr58OWi4N4dh/wetgGa88gN/fW+mujm1zwFT1rTkSbVR80QZIl6b8VkapT
	VUSrQUQ8laEfYp8oVj/tAwmeWfKAKb6b3lEYl5KbKfVWstc9oaUHl6/iyzOh24LBBeeXkikdA1r
	bB28GCg7J/KZu92qJUg+KXxXloM1zdg71BzezcLVuJk4PxSbjTeCIBssukeUFIog9DliNE/TlDc
	1OYgLQn66B4Hu0dJ+Om2b6rrKanhVy0ot4fYI8mPrcPSyusxqdPqf84eCYdqi/3bm8xZQ4xc0It
	wBImxPjlPd2sAjj2bpj/4ZWmuVxUP48oo74WvHSSHSDLlCS5ECP8Kn5HOKSDjWZWvFBwfiCriyU
	M/N04M8Roea8YNI+9OZTZG+PUH7+DF9yXhcqAAsISjRb+MNw/i9OKkMo1+fp9m7TB0IM6BZaMWt
	nnV7K+bi6i3yd6FWjvbXNujURJP5efX3d2O6Bvi2VbXwHQn1Zh4Z4=
X-Received: by 2002:a05:6808:ec4:b0:467:2a6e:ada8 with SMTP id 5614622812f47-46a8a436d31mr7109800b6e.25.1774917557982;
        Mon, 30 Mar 2026 17:39:17 -0700 (PDT)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46aa03b1e64sm5776254b6e.15.2026.03.30.17.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:39:16 -0700 (PDT)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v4 0/1] Add driver for StarTech USB3HDCAP capture device
Date: Mon, 30 Mar 2026 19:36:15 -0500
Message-ID: <20260331003617.3684-1-matthew.laux@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57695-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthewlaux@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EDA0362CD0
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
 drivers/staging/media/usb3hdcap/TODO          |   15 +
 .../staging/media/usb3hdcap/usb3hdcap-audio.c |  301 +++++
 .../media/usb3hdcap/usb3hdcap-composite.c     |  182 +++
 .../staging/media/usb3hdcap/usb3hdcap-core.c  | 1002 +++++++++++++++++
 .../staging/media/usb3hdcap/usb3hdcap-hdmi.c  |  802 +++++++++++++
 .../staging/media/usb3hdcap/usb3hdcap-video.c |  505 +++++++++
 drivers/staging/media/usb3hdcap/usb3hdcap.h   |  234 ++++
 12 files changed, 3069 insertions(+)
 create mode 100644 drivers/staging/media/usb3hdcap/Kconfig
 create mode 100644 drivers/staging/media/usb3hdcap/Makefile
 create mode 100644 drivers/staging/media/usb3hdcap/TODO
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-audio.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-composite.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-core.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-hdmi.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-video.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap.h


base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
-- 
2.47.3


