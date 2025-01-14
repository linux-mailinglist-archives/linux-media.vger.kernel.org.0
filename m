Return-Path: <linux-media+bounces-24729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A153CA1115A
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 20:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADDC51650B8
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 19:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CBA2054E9;
	Tue, 14 Jan 2025 19:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Era+p/ot"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE9F1ADC61
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 19:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736883995; cv=none; b=lUYIIpnakA+8xT7kxMFleu9i9WG44uY4hShfRHVurRXizvuTooKUgPdw3e6x1s0XmJiIrlVYyICO69PIsgx0QdblVBFTTvN63YFA7J+Nb1fwLRF7cwHB7XuxQFArFbqE1XO6JjkyUxuJAJ94EN4svj3n713Fov9INirsWpATO6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736883995; c=relaxed/simple;
	bh=lROFVRYl41312J9Q5NCq8rjOL8SujygnCr+C0TaSscw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nEt+4I/YUmv47wqDj6gsM18emf2PxJml9zH6x3+Erhc6M6Y+aoAqTD7ZY9i8nNJdp/x6JOQ1iLFaaDTNsi6jkSiPifjWbNe4ZWB0pbAn7yyepgX2Iuz5EEkCER7QMKBKZ7Swhj0tM9ZOtX/i/ycPQIwe/JJDKFnt2OP7leddrOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Era+p/ot; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso6399335e9.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 11:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736883992; x=1737488792; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gvTDj9/AnTu2mk3hodu8mnyJn9eKCGWI5mH7NcOHqL0=;
        b=Era+p/ot7zw7VjZ+UBnNo4JS7HKrZQQ2GjjLAnodXCsPNrjh5xN0JDrwcMNZGXJdBw
         p0VdnImlbHjtVLefYAXQRB017JK2MEv5hBQHLrZVTbN751EP6D9NMW27qQWRVDX5QPbD
         PjQbJ2/no5CnP62mlLqnttWnTgvd0vAI9RLqiVoWYw0SIB2pLN7/ijuBxsVW8IIggzlN
         l3ZeYHJNSk5xClLuZ26Ld2kcvuYKN8gWUKd7XfRGCTgq6Ffrxyja9PBfALoQJDCa6FcP
         mDty8cnlQmMBh/BSSB6oLu00bqP8L87mJO9CzbedK+pJr/A6QGwuiG24JnBN9pIWk3gP
         wXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736883992; x=1737488792;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvTDj9/AnTu2mk3hodu8mnyJn9eKCGWI5mH7NcOHqL0=;
        b=ZpvXzSEHpk7CNoPFhD5D0bEN20UKNVkkY5Dp81NPabj/ROdaj3X94YedYQzEcOEleC
         kHJY1Fvx5Baj99FSqIq0lh6vvblOMOGm6p9InB4raOko37cDqh3pKUn96GhlzyKEKnnV
         w9Q/czCL9dLXOB64xfjss3YSQRRQ9BJ4tJHCrfKEn9ks9LPHYgEdk+4cCKXF3FkQG8ip
         /6+1ea+lt9ExB1E4+BXsOjXpGbR5/ifTyLUMrgdua4ion7t0yiIiPnYyVXJnDx0EAMB1
         r9/zVBxyvMSGd9sulm34sNDW5naeZF3OKYDrt82cKi8f9s5XvpsrigjYyfK9LtJKs9a+
         owIQ==
X-Gm-Message-State: AOJu0Yy7/ZOrGA3JEvZf/iEsDqMhdubGvXeofWRb6C3NsRC8+nP6gqSw
	DTG9TjSk1GRE2zHzTX8RMiDjRZJ/v3wQDHnDzC1yjmLUKgoHeBZ8h2N+FB34fl8=
X-Gm-Gg: ASbGncunOVisdOEZ1nh5LAQVV/XebBlccvlDdywqZMf1jv0zdpJiSWcgxD5TcMP0NZ4
	y/oNFVaVLonq5OvXrwr+qbzoiIvL5qR3A31j2VMySZ6IKlin/ZciH9NYQaLUGdn8NY1+bJ488pL
	fFRe7fhVBIQGZ8d4eyXXn3Z6N9jWeCvFMhNdKAXLVtL6LoNzQFf6nqikSGI1dtscLtF3AXP9BRj
	OfyS+dolMGadl6ZbhxVLanrdt4uJP7sbCASWCG+rkUFRy9IfXIz3W1I5Q1DdK2tLgfFvtll
X-Google-Smtp-Source: AGHT+IHWSafOjnDcFeA2STHRKCmUZtT/yF1CiIAIlnRr5UQaTqJi/tcb3B5G4IpAlxgA9SrVv8ZTBQ==
X-Received: by 2002:a05:600c:3ba4:b0:434:fecf:cb2f with SMTP id 5b1f17b1804b1-436e26ef077mr104038535e9.5.1736883991709;
        Tue, 14 Jan 2025 11:46:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37c2esm184337515e9.28.2025.01.14.11.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:46:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] media: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:46:16 +0100
Message-Id: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAm/hmcC/x2MwQqDMBAFf0X23IUk2IP+ivQQ3Rdd0LRkSxGC/
 97gaZjDTCVDURiNXaWCn5q+cxP/6GjZYl7BKs0puPB03vds38LIcd7BonbzgGhkiQPmHk4SErX
 8U5D0vNfT67r+wTKQ/moAAAA=
X-Change-ID: 20250114-str-enable-disable-media-da9eb4e0dfef
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Olli Salonen <olli.salonen@iki.fi>, Abylay Ospan <aospan@amazon.com>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Tim Harvey <tharvey@gateworks.com>, Andy Walls <awalls@md.metrocast.net>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5149;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lROFVRYl41312J9Q5NCq8rjOL8SujygnCr+C0TaSscw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhr8MHpThMOQ4bOvdzKzgskwdEEWU9ULXdY4Fl
 mnRbICZwiSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4a/DAAKCRDBN2bmhouD
 1ziAD/9aiw75rlGkP8ce+kpTZoSCX3qpNukoRKxZTNRtsE+F9xYuNw1JT+cO91zdAYfxZo05lNX
 mL2bpaatz748dg47MMLSqqiT5wrHUE5Tg0Ny2hJRHYW+8ExeXrCQ8ydJKj3gvlT3wI5S0NohAlM
 YEKrVObyGQnxx/eH4sk4J8FV/agPTEDQkOHa3GhUs/QNLM25BxbsCzwldUuDm9R9jYHNlBnmR0n
 T9VJx7vMsMXmD/53nezvRO2CBaZ18DjPErJoCb49YCinhBu8GzOknM4dsnz4HyTlDvyPUlYInIk
 F1DRGMOB5k2ikPIOZTLAMdG/kolPJwwznJnwZQbK2/BSjqGXetL3HPWY8nq92HgOnaJF48MnOfD
 2TiVP1DGfoHVInRQW7vnKuDFCstS4KSR42b3BHUu56uQCpGmJzJGWp9k98ChIwfIp7eeAtgC9HF
 ZUuI+2EFXO8TtDxAOAMS+SbM1IY697gATR+M2zd6sWxqcCeyuATVk3MMH/sz1hfdEHQBgXJ+4kk
 PM4u11zP5mTK+0pVvclf2QD90WvDbenECYVai4uGrIUlxRW37NwMoe4g3i7epQxHlgZof62ToSj
 kC8j3vsW3J74+w0VN7zk58LKQTDd0kiv+Io6suAxlAqzZI8/rHkLKCtOtQrgqGF5enCo5pNAS/3
 u9nzYCgxK/31xqg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simple refactoring to replace ternary operator for string pairs like
"enable/disable".

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      media: Use str_enable_disable-like helpers
      media: dvb: Use str_enable_disable-like helpers
      media: i2c: Use str_enable_disable-like helpers
      media: pci: Use str_enable_disable-like helpers
      media: platform: Use str_enable_disable-like helpers
      media: usb: Use str_enable_disable-like helpers

 drivers/media/cec/platform/cec-gpio/cec-gpio.c     |  5 ++-
 drivers/media/cec/usb/pulse8/pulse8-cec.c          |  5 ++-
 drivers/media/common/b2c2/flexcop-hw-filter.c      |  5 ++-
 drivers/media/common/siano/sms-cards.c             |  3 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |  6 ++-
 drivers/media/dvb-frontends/ascot2e.c              |  3 +-
 drivers/media/dvb-frontends/cx24120.c              |  5 ++-
 drivers/media/dvb-frontends/cxd2841er.c            |  3 +-
 drivers/media/dvb-frontends/drxk_hard.c            |  5 ++-
 drivers/media/dvb-frontends/helene.c               |  3 +-
 drivers/media/dvb-frontends/horus3a.c              |  3 +-
 drivers/media/dvb-frontends/sp2.c                  |  3 +-
 drivers/media/i2c/adv7511-v4l2.c                   | 10 ++---
 drivers/media/i2c/adv7604.c                        | 43 ++++++++++----------
 drivers/media/i2c/adv7842.c                        | 46 ++++++++++------------
 drivers/media/i2c/cx25840/cx25840-core.c           |  5 ++-
 drivers/media/i2c/cx25840/cx25840-ir.c             | 35 ++++++++--------
 drivers/media/i2c/max9286.c                        |  3 +-
 drivers/media/i2c/msp3400-driver.c                 |  5 ++-
 drivers/media/i2c/saa7110.c                        |  3 +-
 drivers/media/i2c/saa7115.c                        |  4 +-
 drivers/media/i2c/saa7127.c                        | 13 +++---
 drivers/media/i2c/saa717x.c                        |  3 +-
 drivers/media/i2c/tc358743.c                       | 43 +++++++++-----------
 drivers/media/i2c/tda1997x.c                       |  7 ++--
 drivers/media/i2c/ths7303.c                        |  3 +-
 drivers/media/i2c/ths8200.c                        |  9 +++--
 drivers/media/i2c/tvp7002.c                        |  4 +-
 drivers/media/i2c/vpx3220.c                        |  3 +-
 drivers/media/pci/bt8xx/bttv-cards.c               | 17 ++++----
 drivers/media/pci/bt8xx/bttv-driver.c              |  7 ++--
 drivers/media/pci/cobalt/cobalt-driver.c           |  3 +-
 drivers/media/pci/cx18/cx18-av-core.c              |  5 ++-
 drivers/media/pci/cx23885/altera-ci.c              |  3 +-
 drivers/media/pci/cx23885/cimax2.c                 |  3 +-
 drivers/media/pci/cx23885/cx23888-ir.c             | 37 ++++++++---------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  3 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c                |  3 +-
 drivers/media/pci/saa7134/saa7134-cards.c          |  4 +-
 drivers/media/pci/saa7134/saa7134-dvb.c            |  3 +-
 drivers/media/pci/saa7134/saa7134-input.c          |  7 ++--
 drivers/media/pci/saa7134/saa7134-video.c          |  3 +-
 drivers/media/platform/amphion/venc.c              |  3 +-
 drivers/media/platform/amphion/vpu_dbg.c           |  3 +-
 drivers/media/platform/aspeed/aspeed-video.c       |  5 ++-
 drivers/media/platform/chips-media/coda/coda-bit.c |  3 +-
 drivers/media/platform/chips-media/coda/imx-vdoa.c |  3 +-
 drivers/media/platform/st/sti/hva/hva-debugfs.c    |  7 ++--
 drivers/media/platform/ti/cal/cal-camerarx.c       |  3 +-
 drivers/media/platform/ti/omap3isp/ispstat.c       |  3 +-
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 19 ++++-----
 drivers/media/rc/ene_ir.c                          |  3 +-
 drivers/media/rc/mceusb.c                          |  3 +-
 drivers/media/rc/serial_ir.c                       |  5 ++-
 drivers/media/tuners/tda18250.c                    |  3 +-
 drivers/media/tuners/tda9887.c                     | 11 +++---
 drivers/media/usb/cx231xx/cx231xx-i2c.c            |  5 ++-
 drivers/media/usb/cx231xx/cx231xx-video.c          |  5 ++-
 drivers/media/usb/dvb-usb-v2/az6007.c              |  5 ++-
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c        |  5 ++-
 drivers/media/usb/dvb-usb/af9005-fe.c              |  5 ++-
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c            |  7 ++--
 drivers/media/usb/dvb-usb/opera1.c                 |  9 +++--
 drivers/media/usb/em28xx/em28xx-i2c.c              |  5 ++-
 drivers/media/usb/em28xx/em28xx-video.c            |  5 ++-
 drivers/media/usb/pvrusb2/pvrusb2-ctrl.c           |  3 +-
 drivers/media/usb/pvrusb2/pvrusb2-debugifc.c       |  3 +-
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c        |  6 +--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |  7 ++--
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c       |  4 +-
 70 files changed, 291 insertions(+), 243 deletions(-)
---
base-commit: e2911fda9771c7af657331e8073b112bdb56f0f7
change-id: 20250114-str-enable-disable-media-da9eb4e0dfef

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


