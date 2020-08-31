Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69642583E0
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 00:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730381AbgHaWGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 18:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729100AbgHaWGM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 18:06:12 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E92C061573;
        Mon, 31 Aug 2020 15:06:11 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id e7so5934742qtj.11;
        Mon, 31 Aug 2020 15:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l3JIZNqd/K1FO5Vr1RSntxeDSY8nUDumNDeazTtIJgs=;
        b=Me+zWBNGg3dOX6LCqbVal500qeVLjkfmrOLvJiCmh2ed0tKajdeWucWKN8JuoPxIQ1
         xQmhNQ4nvwacDdJ0qKT+DHfszzW4Lq2r1SMzfuwSuvX0RfeSbu/qBOhzSmN37miHSXn5
         eKL4HW9G4SmniJSjbK03NF6K7ML2x649yyLCgmIFklT9Nyu12TEAJBYNQmjekbve5NTP
         GRlU/X7wqud5zrik2O2XMn9h6jdEOGR1v+qiT6aIPWntkV8yi6y0kQuI4c/2T6GqY44g
         szku8emKiTNKkHls//1xK2fzInQsOLOz6AOOqVRzuOFB85fAapMnquHq13l/e1IN9asw
         3s1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l3JIZNqd/K1FO5Vr1RSntxeDSY8nUDumNDeazTtIJgs=;
        b=tSAogdmLpQ3rROi+74okrr8yEMF/Va5LrkkC55ePwu7oWJmRZAZAIMHdW6VSR9EjA2
         2HVF8NjNb+ZhQ6DdULQ3nbO6rxr9iMF8TIzWtjeN3hs+ajkNQLZlVz8FvTuVUn/msG1M
         SNVwd8KYP2hFPANGn9bOzuWwjruqU506+b/e+vl1LejnzlznomsUnoJHSnArfrNNtf9D
         ErrmlbURJHtHiMf3y/HqnaJ1u2/E0MgOPml1E/PotWFRR/bWF0C/SL0FJlbOA8EopyoB
         cn6fEzkGDUK+uV6Voi5AG6BrDoUltcNo+6ClfIkD6UtjgRhF7C7+KmmyEJ/EDwJHqL1i
         lLOw==
X-Gm-Message-State: AOAM531gVHjq+EKuZjIL02uJgNGMGHmkqHEkiiF3ruR+fKqJx8hk9tPJ
        rk/CxWPOvI+gjB/beRcyjT7LqKtgOiF/SjGp
X-Google-Smtp-Source: ABdhPJydBP/rNwdYgep4chcKknS/DmVXWvvxO2nWTD/IL1j3mK5QOGhoCih+mCatHTBrlgDdFs4y5w==
X-Received: by 2002:aed:25d1:: with SMTP id y17mr3504609qtc.375.1598911569871;
        Mon, 31 Aug 2020 15:06:09 -0700 (PDT)
Received: from localhost.localdomain ([190.189.67.136])
        by smtp.gmail.com with ESMTPSA id d10sm3051232qkk.1.2020.08.31.15.06.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 15:06:09 -0700 (PDT)
From:   Santiago Hormazabal <santiagohssl@gmail.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Santiago Hormazabal <santiagohssl@gmail.com>
Subject: [PATCH 0/3] KT0913 FM/AM driver
Date:   Mon, 31 Aug 2020 19:05:58 -0300
Message-Id: <20200831220601.20794-1-santiagohssl@gmail.com>
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
RO control, and supporting the KT0915 chip.
The module I've used comes from SZZSJDZ.com, a now defunct company.
However, it's possible to buy this chip directly from Aliexpress or
similar sites.
I tested this on two systems, the first one being a Raspberry Pi 4 with
the unstable 5.x kernel, but later I moved to a Banana Pi 2 Zero where
I used the (current at this time, 07d999f) master of this repo for testing.
I've also compiled the v4l-compliance from current sources (79918a59) and it
passed all the tests. The output of that is at the end of this note.

Note: This is the third set of patches for the driver, where I (tried to)
address the comments that the reviewers added on the previous sets.

Differences between v1 and v2: Fixed the logic for band selection when
running the S_FREQUENCY ioctl. Before this, it would return a -EINVAL error
when an improper frequency was selected. Now it tries to select the nearest
available band frequency.
Fixed some text alignment issues.
Difference between v2 and v3: Fixed typos (CAMUS -> CAMPUS), text alignment
fixes, converted all hex values into lowercase, renamed driver name to just
kt0913 rather than kt0913-am-fm.

v4l2-compliance SHA: 79918a591a9ad362f107795ee4046d39e6dfcb67, 32 bits, 32-bit time_t

Compliance test for kt0913 device /dev/radio0:

Driver Info:
	Driver name      : kt0913
	Card type        : kt0913
	Bus info         : I2C:radio0
	Driver version   : 5.9.0
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

Total for kt0913 device /dev/radio0: 45, Succeeded: 45, Failed: 0, Warnings: 0

Santiago Hormazabal (3):
  dt-bindings: vendor-prefixes: Add KT Micro
  media: Add support for the AM/FM radio chip KT0913 from KT Micro.
  media: kt0913: device tree binding

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

