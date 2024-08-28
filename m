Return-Path: <linux-media+bounces-17053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5246962F83
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 20:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66C6C280F97
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 18:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9011AAE27;
	Wed, 28 Aug 2024 18:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ken8FKMy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA41A704D;
	Wed, 28 Aug 2024 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724868821; cv=none; b=X5HA6RM/atRmqHuoaeaJ0GFGCVCjDgjXFm46Trt60mRROri9CvCMOMkruUxwW1r034l4tD2wD+OCeM9XeY7kQEYEHhiZN7YRIOq0UigfcFyc5lyQlm/oV2RaU5yeWpoBQRJVnPBiut8WNGqp5m6ef/yAtRb4vsqtE/SB/A1dojg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724868821; c=relaxed/simple;
	bh=Ujkh62xS65fdD7DPqfYgtJk/phegOEkG/IKHZBl/eH8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tTFCdKJjZCSME2Xu2CeY6Irnml3tnW05WUVHsRakCcmSW2Yw6yEI+OOjjiBkB7dp2xPSxBy+UPyEy10IZxkGGlqCssAJaPivTC6iVNPE9TqVRhQOLVFVSQjA/7oxW37+Pm/7y+VoRBPVNh3fe5shDHl0dv1p8oJfVRE/5NbvlgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ken8FKMy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5becdf7d36aso7468191a12.1;
        Wed, 28 Aug 2024 11:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724868818; x=1725473618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLUONtMI5H4voIRmPxS3490h967PuOtStPbUxNapjgw=;
        b=Ken8FKMyfOW22enPYr5ENp6sVYXG1cgbFr4+6EUGXGpAElUJfyYM1MQU8lYdBEtiI3
         LZvzMy+7DSWmh2Yv27Lbb7RLZlYndDEYfkQezFayPd7roMyJNyydB3vhK106bSFHDw1Q
         qULyRD++4Pb5+qmVLrAU7hXGgbNf8hbmzRluJIyQg1dZnDItz94cmkwE51v/rgKJZ/GO
         GmvjyOWc5VXxHeE/++P8LVmilTY92izghzlf0prwtQ1r3Y9q3lH+a2+0e8aRxTMdStDN
         eBwDfvICuir6ZnEjCMTsAM4KwBqBgXwj+M+fC3Oi9ekBcYf+LjSBo+8BN0/nL6GauEc/
         FXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724868818; x=1725473618;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLUONtMI5H4voIRmPxS3490h967PuOtStPbUxNapjgw=;
        b=K0fGWqH2CwXJhgdlTU2XTK8E5ZA4MnVxBPQbzs8Qhspil0aG8+ODPrXAp/uXVI29IZ
         roPD5VLV5/9KpI/I+9452kuogLxqMO5jnlVdW9qPs5QJwYJUzFrkGxBqAWcC77jJI2iF
         GdZRM0w6MqaYK1eH3sIRX56SOrmdIEx+z8cgGmeDKwJ1Dcn/t9UV/9YgS4c76u2Yuh1e
         2hFuuAaP7S1qE50Sr2Fn/e1oWk3TZW+9zC4WJdW4U87znadyZkZmQzdB79tiFLVZ0h9U
         XmUSa6m73HtS5DENRhqRibVYS9guXGr5HiH8t6qYzT35kEx20Z4va0QygrsDgXYuHBVY
         9znA==
X-Forwarded-Encrypted: i=1; AJvYcCVLz7QPAm6wY633TMfulTZun2eFeUXQ/ZMYfxgWwAISaaUotOmEL7G/qFRpv5dddbEcWLDd+LeHK8AFIuo=@vger.kernel.org, AJvYcCVZe/lg6mDJE0OMHgPLO9av6hon92uC+1uU+ly6UUO5wm8ObokTovqdZnANuGzCEvdMOB2LggkXCJW+Uwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC4usl2lgr1v6saXorFJbucKfoLJ+fkZ2kyBUQnEX6ajYlgWGz
	clBqG/hsKdT8G69XrFC/oR0WdHT1DXy6inn4oAeCdscfHnoZYSM5
X-Google-Smtp-Source: AGHT+IFAShZjIAr59POTs6zyqJ81olt9IHZ2nXu/YYA38CazZ+he5qRUXQiSQJmJr2jJ5gFS3GuWIQ==
X-Received: by 2002:a05:6402:2350:b0:5a2:6e1c:91e9 with SMTP id 4fb4d7f45d1cf-5c21ed37f8dmr273162a12.7.1724868817236;
        Wed, 28 Aug 2024 11:13:37 -0700 (PDT)
Received: from [127.0.1.1] (77.116.208.33.wireless.dyn.drei.com. [77.116.208.33])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb1e51c8sm2525549a12.34.2024.08.28.11.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 11:13:36 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
X-Google-Original-From: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH v2 0/2] media: i2c: imx290: check for availability in
 probe()
Date: Wed, 28 Aug 2024 20:13:06 +0200
Message-Id: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALNoz2YC/3XMSw7CIBSF4a00dyzmgpaHI/dhOiCA9kZbDDSkp
 mHvYucO/5Ocb4McEoUMl26DFAplinMLcejAjXZ+BEa+NQgUZ9SoGE2rMMhssfRiulemd0J5ozW
 0yzuFO607dxtaj5SXmD67Xvhv/QMVzpBJKR0/oVMS+TU/ydvFHl2cYKi1fgHs7OcQqgAAAA==
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

thanks & regards
Benjamin

[1] https://static6.arrow.com/aropdfconversion/c0c7efde6571c768020a72f59b226308b9669e45/sony_imx290lqr-c_datasheet.pdf
[2] https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/138/IMX327LQR_2D00_C_5F00_TechnicalDatasheet_5F00_E_5F00_Rev0.2.pdf

---
Changes in v2:
- dropped 1/2 to ignore the read value in cci_read() (old 2/2 -> new 1/2)
- 1/2: read-back standby mode instead and ensure that it is really in standby
- new 2/2: drop chip_id register definition which seems to be incorrect
- Link to v1: https://lore.kernel.org/r/20240807-imx290-avail-v1-0-666c130c7601@skidata.com

---
Benjamin Bara (2):
      media: i2c: imx290: Check for availability in probe()
      media: i2c: imx290: Remove CHIP_ID reg definition

 drivers/media/i2c/imx290.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)
---
base-commit: eec5d86d5bac6b3e972eb9c1898af3c08303c52d
change-id: 20240807-imx290-avail-85795c27d988

Best regards,
-- 
Benjamin Bara <benjamin.bara@skidata.com>


