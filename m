Return-Path: <linux-media+bounces-17375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D448C968B5C
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 17:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0590E1C227E6
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 15:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A04B1A3036;
	Mon,  2 Sep 2024 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T73lyxHF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BF81A2659;
	Mon,  2 Sep 2024 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292658; cv=none; b=e0o173Ei81n1pFPxFA4rl+uajnWgD/JKM6KeGKGHzqvGb/nB7S8o715XsY0BiLXkHbW7Ce3G2pDz1miPO7S8zI5VfpK1fJxwHUIrk9QxcO/Ss8y7460WRzaXJai5ok0hGlq1dBFliOPlYgStNDLfcWospkH/StR1BfBzPQlEeao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292658; c=relaxed/simple;
	bh=D6mxSmIO8ed9aOuP3Id85S4w4i2kbdK3IswKdJ1qF7I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZghJivI/KtMDWSMc9Sq/eSUeL5Tg7i9yJnVu5sKHbaIRpO3kq07SVdYYr4tjSbnDRwaRS9qjoVTY/ytfLUje6SVi7K8Nf9gipp1v52opLrQ+qUH9Z3NE7WhIeivqaYqycD4Wso84KivTv07HL9EjYv9Ezc3UvJJBsMNqxK6DR4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T73lyxHF; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a81bd549eso370785366b.3;
        Mon, 02 Sep 2024 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292655; x=1725897455; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j6bSYqDDYKlDFIOYxgyl+5rsg5DFuxiNf/zK2931PO8=;
        b=T73lyxHFlswC4ZyN8kzsmWK7yJrydumv7LkkViQvuXgv1Ubdh2xubGK53mdyQWJWNA
         sPqH52pDlaMen/pLuVBzQBbmtUV7Z7FE4czcrWIWPCKyR69L8vGZip8tWS4q1sZaQrBs
         0JaEnju6cYLhv9XBdDfA+sK/PrLvyvTtiFLv9NU144Y6pKdWi/vLmOYcrfeCsN0M/JKO
         zMoWqt5F4Ap19qVCMYdU266La+b5oqYytb5x60ygcB9brElpGh2brKpfcQjdZvxZ2N4P
         Dd+qXsLAaEGpe/0e4TqLYX0EcXlDm8x1vyMZOM9UxNecg/yU8Piz1F9skbanUETHlpms
         Sf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292655; x=1725897455;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6bSYqDDYKlDFIOYxgyl+5rsg5DFuxiNf/zK2931PO8=;
        b=k3l9y1ULD9EzgsYdxlJCkO6NUtl7+qHF2fm4+SmVp/S8GO/ko8DqOEOsqfa6/mE+cz
         4Ejh6p/mKpXD1iYtae7a9erGALB/QnPrbvLc+8wg+//6soLO3xl4AdPiFCyadq0lBO+T
         RJgwowy8CVK4qxS9mmcEWl+kXU5NsEyFj5Wc0v3KVW1+Z6QX4qYTeRWJdLt6M32S0tmM
         fqFurNRPtuHKynqV4uGftH/zKSKZ8/fCDKlWfPdzQKkgUe8caIr7v1uXxPLhLucu3T4B
         9tVuULMbFcSOfqaA05gCZOSlxpK3ihTNlK6QcpNWBnJXIF92F2uSq11cmmoHxm6j0bOs
         UJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0tlKh5uF0uT2xtCsQ7T8HFxbUTocXZ9UIo/qLceaTQaR4TZuikyyAaviwn4cVnb9jnUNjtan5V/IGWoE=@vger.kernel.org, AJvYcCVSgj9mBVFsNYSODde4s6M7y4qpvyxpJeHpu2kYsalHAi+h1IE39Qc7IpNPrwdyl8cL4w5KK8tR9wtXuGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoiup1/DmM7zkb884v0MwndY0ctLthrKlvgTEEBYeQqfLQMXHx
	J5FmwhgRM6q64w86rSNWVwgTajLkpNHrGqZg5fKCVzH4S+jp2K6g
X-Google-Smtp-Source: AGHT+IHj2oauRH3984Qnmxx0vmliT+qE7IYwxQwfUGCDE1wPJHM+c+1O7f90w4bXu9a82+t8Q6VmZw==
X-Received: by 2002:a17:907:7f24:b0:a86:9204:1c87 with SMTP id a640c23a62f3a-a8a1d29b729mr46257066b.11.1725292655063;
        Mon, 02 Sep 2024 08:57:35 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6f87sm570951366b.158.2024.09.02.08.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:57:34 -0700 (PDT)
From: bbara93@gmail.com
Subject: [PATCH v3 0/7] media: i2c: imx290: check for availability in
 probe()
Date: Mon, 02 Sep 2024 17:57:25 +0200
Message-Id: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXg1WYC/3XMQQ6CMBCF4auQrq2ZDtIWV97DuKhtkYkCpiUNh
 nB3Cys1cfle8v0ziz6Qj+xYzCz4RJGGPo9yVzDbmv7mObm8GQIeQIPi1E1YAzfJ0IPrStWVReV
 qrVkmz+Abmrbc+ZJ3S3EcwmurJ7G+f0JJcOBSSitKsEqCOMU7OTOavR06tqYSfnDUPxwzv7oSw
 VjtdWO++bIsb5TUGGLpAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
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
to contain some of the ideas that came up.

For now, I kept reading back the content of the STANDBY register, as
suggested by Sakari and Alexander. If not wanted (as suggested by
Laurent), I can re-add my "optional read" commit from the first version
of this series instead.

*Overview:*
Patch 1/7 is a split from the old 1/2 which defines the values of the
STANDBY register and uses them.
Patch 2/7 is new and defines the whole supported range of the controls.
Patch 3/7 is the old 2/2 to drop the CHIP_ID register.
Patch 4+5/7 are new and target the avoidable communication during
probe(). I decided to use a variant that also works on machines without
runtime PM active, and falls back to the values of 2/7 instead.
Additionally, imx290_runtime_suspend() is using v4l_subdev, and
therefore depends on the subdevice. If we move the autosuspend stuff
before the subdevice creation, we basically have a race between the
delay and the subdevice creation. Although it is not very close, I don't
think it is a good idea to potentially autosuspend before the subdev is
created.
Patch 6/7 is the old 1/2.
Patch 7/7 is a new PoC to decide to check the availability based on the
power state of the sensor during probe().

Note: dummy-regulators, which are used when no supplies are set in the
DT, are always-on.
Note2: The "off" mode is currently only active after probe(). If this
approach is of interest, I would also ensure that it is active once
streaming has stopped - need to dig deeper if it is necessary to store
the "old current" before stopping, therefore only "initial" for now.

thanks & regards
Benjamin

[1] https://static6.arrow.com/aropdfconversion/c0c7efde6571c768020a72f59b226308b9669e45/sony_imx290lqr-c_datasheet.pdf
[2] https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/138/IMX327LQR_2D00_C_5F00_TechnicalDatasheet_5F00_E_5F00_Rev0.2.pdf

---
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
Benjamin Bara (7):
      media: i2c: imx290: Define standby mode values
      media: i2c: imx290: Define absolute control ranges
      media: i2c: imx290: Remove CHIP_ID reg definition
      media: i2c: imx290: Introduce initial "off" mode & link freq
      media: i2c: imx290: Avoid communication during probe()
      media: i2c: imx290: Check for availability in probe()
      media: i2c: imx290: Implement a "privacy mode" for probe()

 drivers/media/i2c/imx290.c | 153 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 124 insertions(+), 29 deletions(-)
---
base-commit: eec5d86d5bac6b3e972eb9c1898af3c08303c52d
change-id: 20240807-imx290-avail-85795c27d988

Best regards,
-- 
Benjamin Bara <benjamin.bara@skidata.com>


