Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15EAB22300D
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 02:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgGQAov (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 20:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbgGQAov (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 20:44:51 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC03C061755;
        Thu, 16 Jul 2020 17:44:50 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id 80so7378577qko.7;
        Thu, 16 Jul 2020 17:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGUxnMXj+mrB4zcMkacPyP3iNtpM1W8c4ZhEk/k7V8A=;
        b=PSaIj05ADJprzRlbULe2NMfeHi5eiMYwU2XhX2QQ/Y+jWXZyudWL0P2eotnBTAnedz
         g5g7hJSgv///tuBToY5wIS1xEYhlHRxP3evHdFWTVroQPZzSJrw4Xq4CzGiZUIL/1tMM
         vy/pXViEHpJTCEtPJjiczS+ZST6h3sbMMyz23qxgw1ZAsPDEqSJOhJjnZMXz+vxhXK5j
         TTxJily5UK4u4PtwhM5ciuWarPQsqzml3uKgs9StaYsnpoX88eP9/xty9ahWNBU98d2U
         PQhJNzoauFzcLPI7r5hWGhTtT4h9OpcBB5lg5JCglJiH0INIdEBQ84tHU9ks5zfyAnzT
         lwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGUxnMXj+mrB4zcMkacPyP3iNtpM1W8c4ZhEk/k7V8A=;
        b=NQlEUSzuSdDybD4j+62qeTp5pK3ETlbzTeVMljtQi9Uea/Dh5unw4p46uZOXnXq3if
         lwWtSDmjgc7HLyXLQ8yy1X6b14G5WJPGb0Lp7oyKohfGph2y42F1j3lQt85Ni4FqXKO+
         BB9DYob8fmWN2izgjAbI0WMolcu4eJf6+WtvlrbciAJv8Eg6kQASgz/xFloF1e0S8nPR
         MLELFCLc1WcbV6ngen4BzmzV0FMN/NP5PF21QECfKjYj7wCN9JQ6VkqkgaORfL4PUwQc
         ahU9zWrYY2fwvq3T0+lObpcc2LAat2pygfLzI/UaDzHqlTSbpTNv/h2Nkw/qd4v/aRsU
         FEaA==
X-Gm-Message-State: AOAM533gmGpuj0spDftoR/hVlehJajk5LiNUu4PRrccLlejPcMB8xCI3
        BjMAUnHcWN6wB99Nuw6oezDRp9ZbaUb8Dw==
X-Google-Smtp-Source: ABdhPJzZIxGmw0qdJt2BnC9UZE6lIBpepqqYjvk2UVpxvo1dmPbHuQhtsJuc21kuLfvvt+mraxBn0g==
X-Received: by 2002:a05:620a:1519:: with SMTP id i25mr6415971qkk.91.1594946689071;
        Thu, 16 Jul 2020 17:44:49 -0700 (PDT)
Received: from localhost.localdomain ([192.58.132.250])
        by smtp.gmail.com with ESMTPSA id y22sm8890042qth.46.2020.07.16.17.44.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jul 2020 17:44:48 -0700 (PDT)
From:   Santiago Hormazabal <santiagohssl@gmail.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org
Cc:     Santiago Hormazabal <santiagohssl@gmail.com>
Subject: [PATCH 0/3] KT091 FM/AM driver
Date:   Thu, 16 Jul 2020 21:44:38 -0300
Message-Id: <20200717004441.116248-1-santiagohssl@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media: adds support for kt0913 FM/AM tuner chip

Adds a driver for the KT0913 FM/AM tuner chip from KT Micro. This chip
is found on many low cost FM/AM radios and DVD/Home Theaters.
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
I tested this on two systems, the first one being a Raspberry Pi 4 with
the unstable 5.x kernel, but later I moved to a Banana Pi 2 Zero where
I used the (current at this time) master of this repo for testing.
I've also compiled the v4l-compliance from sources and it passed all the
tests. The output of that is at the end of this note.

v4l2-compliance SHA: e50041186be9f69dd94b64fb924115201726e72a, 32 bits, 32-bit time_t

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
 drivers/media/radio/radio-kt0913.c            | 1181 +++++++++++++++++
 3 files changed, 1239 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml
 create mode 100644 drivers/media/radio/radio-kt0913.c

-- 
2.24.1

