Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1288F239D64
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 04:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgHCCJx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Aug 2020 22:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgHCCJw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Aug 2020 22:09:52 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B92C06174A;
        Sun,  2 Aug 2020 19:09:52 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id 77so1648690qkm.5;
        Sun, 02 Aug 2020 19:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ndkPgBzuu3HavvJal2ZqB7UZeB0qupPxRyfTt2Dimg0=;
        b=FWUyEWCjQKEHwM9GiwSviNlzcEXn3fJMnwj01f3uRh/FYTKs2u56nrPhloyL51EARl
         SG0iyrN0KNUKrpveMFWRPAQGC0f+Ba3xv843q3J8cESWUdckzbp0Ck5OzS0joGn95gBf
         O1cyD8il3KiJQ+s9kFUMAP6BiZNeHyKGkcd0+HtyXZ0m+Lhto39zBZGpy9z4C13D8WYZ
         aL5qRTMyLPPejCylgjBgjLrWYjQzH5EeHLfIUDMUDJU9A4kkFbgsXQUeEblAWvlBCISF
         wwNhgUxh/5vwd3KFphd6G6PvkAWUFOUoy8UznHUkSxX+OQqMqH9+qxtKXD4i4HW399yk
         hgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ndkPgBzuu3HavvJal2ZqB7UZeB0qupPxRyfTt2Dimg0=;
        b=f/B9UurzvxIAjTQjgrfeqg7VCUs5ml1rAYqvt2TJacd8vNm5I8+TUvu2+BDPfuzE4m
         xPSCRIAunMH3WZhHrtRPlnOL/sXo4WYxQjguEv6y+1iMGcAA//nvamYbpEPcDVQTlCqa
         XcdQjf8vG6gvO0TujOmE1LjDE0A9B9W6TQeA/1iFyElm1sWTQmChLMQ92PZnm4wWRLtb
         PX74b44g54NI7YSBOLlxK1zA2o2NRLMtokE0v7UN1BTztJGdsBMUNF7KFXVIdx0dAECy
         ixNAR5Bh4/N/N8hlhH4l/RexV+y0pXUTEYhCf2KTOklTOTw6FNlpOE3RdsntoW4M5mGo
         HzWQ==
X-Gm-Message-State: AOAM532ME4j0v4LGudFtRi2j6Bu8+kn+ROEmhv6utbr7mFgdiT3lvrl0
        RVn3iNFJCFcPkkdjShFAr57M0osPH6M=
X-Google-Smtp-Source: ABdhPJxjv5KpSpY7yqnaZnmdkMxs60OPVyP14ztQV690EUnGQa9js2GzjGLQx+QV1EyBpkOjbIAphQ==
X-Received: by 2002:a37:a0c9:: with SMTP id j192mr13962339qke.134.1596420589425;
        Sun, 02 Aug 2020 19:09:49 -0700 (PDT)
Received: from localhost.localdomain ([190.189.67.136])
        by smtp.gmail.com with ESMTPSA id d124sm18458083qkg.65.2020.08.02.19.09.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2020 19:09:48 -0700 (PDT)
From:   Santiago Hormazabal <santiagohssl@gmail.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Santiago Hormazabal <santiagohssl@gmail.com>
Subject: [PATCH 0/3] KT0913 FM/AM driver
Date:   Sun,  2 Aug 2020 23:09:18 -0300
Message-Id: <20200803020921.64151-1-santiagohssl@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media: adds support for kt0913 FM/AM tuner chip

Adds a driver for the KT0913 FM/AM tuner chip from KT Micro. This chip
can be found on many low cost FM/AM radios and DVD/Home Theaters.
The chip provides two ways of usage, a manual mode (requiring only a
few buttons) or complete control via I2C. This driver uses the latter.
It exposes the minimum functionality of this chip, which includes tuning
an AM or FM station given its frequency, reading the signal strength,
setting Stereo (only on FM) or Mono (available on AM/FM), Mute, Volume
and Audio Gain.
I left some TODOs on the code, like supporting the chip's hardware seek
feature, using a RW/RO regmaps rather than a single volatile regmap,
show the FM SNR as a RO control and the FM/AM AFC deviation as another
RO control.
The module I've used comes from SZZSJDZ.com, a now defunct company.
However, it's possible to buy this chip directly from Aliexpress or
similar sites.
I tested this on two systems, the first one being a Raspberry Pi 4 with
the unstable 5.x kernel, but later I moved to a Banana Pi 2 Zero where
I used the (current at this time, 8f2a4a9) master of this repo for testing.
I've also compiled the v4l-compliance from sources (c7f0328) and it passed
all the tests. The output of that is at the end of this note.

Note: This is the second set of patches for the driver, where I (tried to)
address the comments that the reviewers added on the previous set.

v4l2-compliance SHA: c7f03287bbd64c168975e7ff3192e6fd3b507686, 32 bits, 32-bit time_t

Compliance test for kt0913-fm-am device /dev/radio0:

Driver Info:
	Driver name      : kt0913-fm-am
	Card type        : kt0913-fm-am
	Bus info         : I2C:radio0
	Driver version   : 5.8.0
	Capabilities     : 0x80250000
		Tuner
		Radio
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x00250000
		Tuner
		Radio
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/radio0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

	test invalid ioctls: OK
Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK
	test VIDIOC_LOG_STATUS: OK

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK
	test VIDIOC_G/S_FREQUENCY: OK
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 1

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK
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
	Standard Controls: 8 Private Controls: 0

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
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for kt0913-fm-am device /dev/radio0: 45, Succeeded: 45, Failed: 0, Warnings: 0

Santiago Hormazabal (3):
  dt-bindings: vendor-prefixes: Add KT Micro
  media: kt0913: device tree binding
  media: Add support for the AM/FM radio chip KT0913 from KT Micro.

 .../bindings/media/i2c/ktm,kt0913.yaml        |   56 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 drivers/media/radio/Kconfig                   |   10 +
 drivers/media/radio/Makefile                  |    1 +
 drivers/media/radio/radio-kt0913.c            | 1196 +++++++++++++++++
 5 files changed, 1265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml
 create mode 100644 drivers/media/radio/radio-kt0913.c

-- 
2.24.1

