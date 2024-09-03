Return-Path: <linux-media+bounces-17481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E057296A148
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 16:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97C882870BD
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 14:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F7016F8EB;
	Tue,  3 Sep 2024 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwLQgrSk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BF63BBF0;
	Tue,  3 Sep 2024 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375278; cv=none; b=b5AMfOS6WxpA3g4LB8LRcg31cRShtxSHTVakgJlvLs+sBm/y41cpeEM05TYUhZwUt3MPwgCa+yh0cBKE1gOaEF5PvS4ODizqg27W1hpPIjj/QwCyl0OMap5dU1oqIP8hG2cJMJWWSCKIFfgrDyqjtZEgKF2zUbFCMCLdTw7+8R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375278; c=relaxed/simple;
	bh=z5Nil+abWkOorXS+Q2x8VxAxJ2+/IJgFs275tbfNslE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QR2ay3Kw1DHyLmtccZrwhT/CRg75PAZGPEAtt1+MeRLwLTLEe+i8FRMBJd/CNT1u1OAqUvrusnHehLAWpZX63hzYwfNp3U5ukq101UkEtteoLtLjTew2GljAGQkK85Jg030Xz5ZE7bd0kTS/LQ3bQoXxWJwSkd9JEVggpwI8kMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwLQgrSk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso6153886a12.0;
        Tue, 03 Sep 2024 07:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725375275; x=1725980075; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4hcNJncbJCDQHH/11Xfwau0k595XWDp12gMyQxI9R6U=;
        b=FwLQgrSkqsTAb6hXjjSDMBiCMM1wI+AGUv3aTqo8akTKSBCwQDCzrukF4fZN2PRQsE
         qwTwNJv8K9Je4/ARPn9jj0NniU5uYph+TUyI3noIUpRB4p+wr56YZ8vDziR/qOfgIeRF
         zhQEd6+c/Dei3RATWFRO05EvBW/TTR2VuRNRNnHemwAFSMoAbQVMQaXRhIxN0DJunpZr
         6DxAHgSWNirWKFuOKcFWBNj98q+xVG+EMDib/I53d0iaroyjiRpEegYo45kO8MULTYAC
         X2XDSsPJUHRwvOANCIb+GIYIrshlZVxHJn1kJ7lEN+KZ9XumyjSiOihlNe6A0iQ8/iT4
         f6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725375275; x=1725980075;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hcNJncbJCDQHH/11Xfwau0k595XWDp12gMyQxI9R6U=;
        b=K2+Fk5blUwgQF2WVgtrCYCJLYJMDTFkQUkso1yC6JF7mSsXF+RmTqhwuUDjuhpG1TD
         3WLF2QyTB/DdAkvPqveeyMwoxsgwG1hVc4SUcTsdPpgoUY14QjaJYG7avkYM6UpfnstL
         yBCJaaJ7U1szcKvEcgZdrdLzvG1Kxd8kH7NT7NDI7bcDPfLJ2GvE58QRMll/X2qB79AS
         2/CHmd/kRi++c7VLHVCq9TqIhrDqyZ9TnQ5H1JcQgGIZnpeCUtl4GS6ZldOWkBT2Rkk6
         NEPIXkoZZvjHQL6fVlm+iCPc5asornbakcIgv+WHBzFwWqU/Idg9ryD1JC2x6y6tD8Vf
         6RuA==
X-Forwarded-Encrypted: i=1; AJvYcCU963jmujhiLWt7BmXCWjRRQ+Zm51CwQHoakXG0syIvO1kBBFjlOHBx9mtp2btD9KWQ05f9JhHKOfzvXTY=@vger.kernel.org, AJvYcCWkQjXLO75dyrzOfUcrbE/JNyTlTCTo8DaED2HTlTKuIs1NN/G0Y6oLA4ZFCRC1J608vpfvrqlduO+ra/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwALW/vne5aR3ySHQbnQAGLVWe4KCf4gYGVJ7IO7JOFCYD58MmM
	czPcBHqZ4/UxAbs0aPVqiuGjickSBVo5DD8+2cP1X3v10kuzCi/1
X-Google-Smtp-Source: AGHT+IGkB54f9W0X9Q3j5ayHIMvM1eYgY1TM3sMlDk4bq79JdvWMCgTyVVQBmov3gUODkWH7DL+6xg==
X-Received: by 2002:a17:907:97c2:b0:a6f:5609:954f with SMTP id a640c23a62f3a-a89a259d127mr1507089566b.12.1725375274338;
        Tue, 03 Sep 2024 07:54:34 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d86cesm704677166b.171.2024.09.03.07.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:54:34 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
Subject: [PATCH v4 0/3] media: i2c: imx290: check for availability in
 probe()
Date: Tue, 03 Sep 2024 16:54:31 +0200
Message-Id: <20240903-imx290-avail-v4-0-e4a6c0837f0b@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcj12YC/3XMQQ7CIBCF4asY1mKGoS3gynsYFwjUTtTWFEM0T
 e8u7Uatcfle8v0Di6GnENl2NbA+JIrUtXkU6xVzjW1PgZPPmyFgARoUp+sDDXCbLF24LpUpHSp
 vtGaZ3PpQ02PO7Q95NxTvXf+c60lM759QEhx4VVVOSHCqArGLZ/L2bjeuu7IplfCDo15wzPzoJ
 YJ1Ouja/nL55gZwweXEJVqBypg6+G8+juMLtoePJigBAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

Hi!

This series introduces i2c communication with the imx290 sensor during
probe s.t. the v4l2 subdev is not initialized when the chip is not
reachable.

The datasheets show that INCKSEL* registers have a different default
value after reset on imx290[1] and imx327[2], however I am not sure if
this is a sufficient identification option - therefore I just removed
the current CHIP_ID register for now.

Thank you all for the feedback and the discussion, I updated the series
to remove the trial and errors and reduced it to the suggested parts.

thanks & regards
Benjamin

[1] https://static6.arrow.com/aropdfconversion/c0c7efde6571c768020a72f59b226308b9669e45/sony_imx290lqr-c_datasheet.pdf
[2] https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/138/IMX327LQR_2D00_C_5F00_TechnicalDatasheet_5F00_E_5F00_Rev0.2.pdf

---
Changes in v4:
- old 1/7 is dropped due to the reuse of stop_streaming()
- old 2+4/7 are dropped due to forcing the subdev into an invalid state
- old 3/7 -> new 1/3: unchanged
- old 5/7 -> new 2/3: only uses the runtime PM to avoid communication
- old 6/7 -> new 3/3: uses stop_streaming() to prepare the sensor. This
  function returns the return value of the cci_write() and is probably
  more suitable than only setting the sensor to standby.
- old 7/7 is dropped, as the regulator enable detection is not really
  suitable for the "flashing privacy LED" avoidance.
- Link to v3: https://lore.kernel.org/r/20240902-imx290-avail-v3-0-b32a12799fed@skidata.com

Changes in v3:
- probably better readable in the overview
- 1/2 -> 1+6/7
- 2/2 -> 3/7 (added R-b - thx for that)
- others are new based on the discussions/suggestions
- Link to v2: https://lore.kernel.org/r/20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com

Changes in v2:
- dropped 1/2 to ignore the read value in cci_read() (old 2/2 -> new 1/2)
- 1/2: read-back standby mode instead and ensure that it is really in standby
- new 2/2: drop chip_id register definition which seems to be incorrect
- Link to v1: https://lore.kernel.org/r/20240807-imx290-avail-v1-0-666c130c7601@skidata.com

---
Benjamin Bara (3):
      media: i2c: imx290: Remove CHIP_ID reg definition
      media: i2c: imx290: Avoid communication during probe()
      media: i2c: imx290: Check for availability in probe()

 drivers/media/i2c/imx290.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)
---
base-commit: eec5d86d5bac6b3e972eb9c1898af3c08303c52d
change-id: 20240807-imx290-avail-85795c27d988

Best regards,
-- 
Benjamin Bara <benjamin.bara@skidata.com>


