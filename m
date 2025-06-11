Return-Path: <linux-media+bounces-34541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FE3AD5E5C
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 20:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30D461BC2247
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 18:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A96C27467F;
	Wed, 11 Jun 2025 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JyrhT81c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CE126A0AB
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667054; cv=none; b=TlF42/Wn505uqy5msCdT/xYJiLsQrkWKMckIoFJtWKkcvHrJo6AehDctK+B3csOIQgTXUmNQq2JgZHEwFyvJuxXViBjBNXgDKZTzhOgFShrIeEor5ZcUsSQxJCzvmBWE+RaqepKL4vTy0U6J8K0B6FpOWHcRmdFbXr/YSf5IN1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667054; c=relaxed/simple;
	bh=PtjcRg7r9dDYoDn4dMsR5Www73D4wiUbSHxe0flzOIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VhkKbRazslomvQjwGNwVXhiSrK1eYT2VneEXuHEykM5aTVj7fMN4GCzxgcvuLl+TsoZHLo1Bi0WNLmQgEiD76nZyN28U2QTH5TANPh2K95q/KwvA6rHUJvGYjVwfdRSotZ8IB5kHfGZCMktNl9KinRW4/0S/Wb14tbB6Z6n5+gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JyrhT81c; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32ac42bb4e4so1516321fa.0
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 11:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749667051; x=1750271851; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxFfYw7Bh3J5bDd9GOMRnGuEy6auNfpZtx05LVWHCwg=;
        b=JyrhT81cTnFOKmsweB1atlrtSkWMWPpfA4DCNVAW0WWYpm6Inmdvat010+LO2rZzip
         96EHzG43UioLoIVwKzlUuQOwqS4cWzfaG16FVJUmCI5yZ2VP/AyZp8YwUQgpU0n7gx/F
         km4B6hU8PbnKm/WIMzp4hb0yAuzx3OHtk1zc3ei/mtaXL8Jh+HwJWJAco14kCznaNQ72
         gjnC5Edv4oK4yvnTZVUq0yQegYmxWJhgpmfVWLR0N/OPLjHquSEK0uHiQMEHu7Sudror
         hvRj95TCnL+6uR4xsg4pJ4K+nu7lDOjA6tIAzsBoHKj1rg4gG4JHhQQHWc1GTs0nquvQ
         lNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667051; x=1750271851;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxFfYw7Bh3J5bDd9GOMRnGuEy6auNfpZtx05LVWHCwg=;
        b=gTZD170UAI2zVe0GnXVGsk38trH5RU1UcVDw+v9TWbpBqa4FVGxbnGliYdlhWi0nTo
         /bQWy/hi2wDr3DieO3ddKUdt1jY6IaaujpRweGQLn0tVsqgXJrn4DPC3zV19Apc746f1
         iUsYso+5bayNiBKli0bCyfH0HCBhw8TX6GkCiXwDJw3sqDYANdl5PduQagq7Ye/rUwMJ
         9i1olu4f15oVAFn1R3l4RQwLDuF5ZePOb0iJ20VvnigkIirLezmUVU3uB7OIoWVvU4Pr
         8Lcd0NtGikgfCLE6Yxun9v753uE0z5CDt9hUqfM/whHup/d+wOYTTCA1rQSRyeGzX6n3
         V+2A==
X-Forwarded-Encrypted: i=1; AJvYcCXYd0be2ujA4/ovGAXLCsGwcbm3eHpTc+VDKuGlkcwXE2qK3y6FOBco8hOLpd+tbV7jjRTxBEP1iiK1qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZy9zDMK+L8Dnb5ePesK3M2XRs211dcmNUq4jYi8R41Vktxumy
	q5d2oyVPHy9ZEHnaBhB6uefFvdoPwlrCP2Ky6BHvbmgP1jIDdqazsJ1pj+HQVI9E5JoI9Bt72vk
	ftEeB
X-Gm-Gg: ASbGncs2Euuf0Oqr5nbfL1ccjmgr0CfVwbnBdHhPuW3z3CoOOJENjbleG4m9mOTzXq5
	vqo0ygztdUtFT+Fw8O32Ilf1Y3STC07pb2LmSEP48sFmSKkfdOD11YYpiZY4nfuKE/TJ88noN/1
	2/5snNL8eyUkhvtKB25WCXwg+IjULCRY8lUEOGs+dJehyqGWcsIjz+zFRIDJcIw7E/zupdY2Ls5
	ARgMxPPT9UnsuyeVEuIS6q6tO7OGky8qDTsLPGZh3o0RDKvscsPzDRBiTrw74ggaxID7jC8Qs0Z
	yb2Z4B4UApPidpVH1wI2xXZ1Kzc8boL/BQ0+POrtZpYpqL6/aHdLBQ==
X-Google-Smtp-Source: AGHT+IFzYupa7d+ONAjulOpVhh56Bqw1ABa6/j/qgq2ciZf4MuyCJ8C6ogS1IFGo/jjRE88dc+izmg==
X-Received: by 2002:a05:6000:2c0f:b0:3a5:5149:ed1a with SMTP id ffacd0b85a97d-3a558a43b48mr3492897f8f.59.1749667040479;
        Wed, 11 Jun 2025 11:37:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a5324364d4sm16119390f8f.55.2025.06.11.11.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:37:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/4] media: tc358743: Additional link freq, and better
 validation
Date: Wed, 11 Jun 2025 19:37:12 +0100
Message-Id: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANjMSWgC/x3MQQqAIBBA0avIrBO0NKWrRAvTqWaRhUYE4d2Tl
 m/x/wsZE2GGgb2Q8KZMR6yQDQO/ubgip1ANrWi16KXkOwZy/PKdtkZ1XJiASjgr1eyhRmfChZ5
 /OE6lfLup0v1gAAAA
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Ripard <mripard@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

I've had these patches on our Raspberry Pi downstream kernel since
I tried upstreaming them back in 2017 [1].
Maxime's asked me to repost them as he's trying to use tc358743 with
mainline in RGB mode[2], and is hitting exactly the problems I had
written them to solve.

The issue from that series of get_mbus_config passing the number of
active data lanes has been resolved.

With regard updating the FIFO trigger level, from the previous
discussions[3]:
- Cisco's use doesn't use OF and therefore is unaffected.
- Philipp's original use case was only 720p60 and 1080p60 UYVY at
  594Mbps.
Both those modes still work with the updated trigger level, but
I'm happy to revise and only use the new trigger level with the
972Mbps data rate if that is deemed necessary.

The final two patches are new but relatively trivial.
The first makes probe fails if the hardware isn't present, and the
second reports the right colorspace for the format.

Hopefully that all makes sense.

  Dave

[1] https://lore.kernel.org/linux-media/cover.1505826082.git.dave.stevenson@raspberrypi.org/
[2] https://lore.kernel.org/linux-media/20250606-roaring-blue-bat-a8b2aa@houat/
[3] https://www.spinics.net/lists/linux-media/msg116360.html

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (4):
      media: tc358743: Add support for 972Mbit/s link freq
      media: tc358743: Increase FIFO trigger level to 374
      media: tc358743: Check I2C succeeded during probe
      media: tc358743: Return an appropriate colorspace from tc358743_set_fmt

 drivers/media/i2c/tc358743.c | 134 ++++++++++++++++++++++++++++---------------
 1 file changed, 87 insertions(+), 47 deletions(-)
---
base-commit: 8d441742cb6a1f1cf1d8f2c73339af27dddb7cf0
change-id: 20250611-media-tc358743-07de40a814bc

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


