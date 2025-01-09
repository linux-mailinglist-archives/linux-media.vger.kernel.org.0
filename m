Return-Path: <linux-media+bounces-24503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6628A0746E
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 12:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E1523A7080
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FFC216E10;
	Thu,  9 Jan 2025 11:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kfWz33BY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12FA216381
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421429; cv=none; b=JO7IXNfeR89xEf0+SF7HOczbZreZ8j+xY9vWgHMeaOjAhYSBcWuOHscuXCjpbiKmo+4hpFGVOAQCD0rbXuBY53cEqcpR01uKt1kqx33m1ZNVuqxS1vtCKvgdZAI2xYSEx7HpEMsgP4NQhupn4sPl/bh/1OlIsmnrbjatkYXevKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421429; c=relaxed/simple;
	bh=8ApezzYHSX83RS3QA5w54DNd1lwZdDS5MBnMXND0oLo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H/ArxKcR0Ptb0pi4Zl4V1mQHR9KffpZ4Fkc/RvWRa8UNupx8GM1ixduhymkim4cy986yvOeRpfNRWHKckeoD9Sl9DKumwQyPM+dZcnQLAcdS2apHFBDz0pRR++tMn0ZDVhiXEy6xaEnL0YAup7NBk+ZoVeJqOFwMh0sfK+uXOSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kfWz33BY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4362f61757fso8210895e9.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2025 03:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736421425; x=1737026225; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ll2c7q/HUE6mKHlwYYRK5+Gl0QpPwKqSQUEkwfzwiT4=;
        b=kfWz33BYN4l0lytRRMQOBQxWSd2GTD9R+iQ/7fAzBHcgxqs0ksTkY1nlTkEelBoHc5
         DjcaPH+ba3q3WhEGahkSiAHigV8hXocqRZT8MmryPxsTudsdpp4jmyYVKJLWrWvCarTo
         mAsfZpbfGc4+Cf3PyjPk/FW3cTnPu4hCj1dIuDUNOTb5VYrzYXQ/Da3z7gjEOYsXJLlM
         jfrl1Pg4SrpVXs3dC+sAyqbDMx+SvionflXFXW/Y1EEVriW+ruOxxkwkGJ9BtEC52xAD
         pnaF90DinPT7LWcucHDbezOMP5oEI46JGltMW6MScLZY1GS1BYEp0ZPKCa2EzmWeGezM
         pCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421425; x=1737026225;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ll2c7q/HUE6mKHlwYYRK5+Gl0QpPwKqSQUEkwfzwiT4=;
        b=M9WJDZYCr+A0uh8GLpBttAthfEWb+Psqf5Rcnp1WZ+UBMVSFutNRomLpfHKoAJFy8O
         xCvBZp0Bsb3tbKC109gmIbOQBb+abxUtSASz5CQ3MSKZntENtBVp1gmyDREX3Czafjne
         reJrVmHEuAtsOM/hrJDxFMkhY4PlKv+yKSzRxG212Ze4nMCGQYHnkhZEAWwzkkOCEJKd
         gloTl45/xLr1RNDQiWFdlnBRIsbqj7b/eAtExpfTw+cigffhSGOwml16srVmKIPaYwos
         GuyDB0NJj/icJHmqVs99BiCs2v3ygk+Z4hXq2L8WaUCOQa74fZSpMVPCshBNV4QPexsS
         iH/A==
X-Gm-Message-State: AOJu0Yy4pVM3QdJ5TwNe5wUxRZ2V2zhXszqd2aUAefNBozbKFphCMFbd
	U8bfbKZJ6YDfxRVZd6mJljwowd6fdacJvdz30M7bzqzeWFclXvXI92LinG8vRTY=
X-Gm-Gg: ASbGncvE7k91OCGF5cJeCr0C7zODyWfS1fI2Prm9KlkF964QFP378b4o7nr6BCu4qFE
	osK2qJdt3VMBBZXBIQARpZxLaU4kTsJ6M3UHCFEUQH4/6DonplQVDYbSPEp701RFwQtNXYpO6O8
	pb7vX1YLGRmUTZ7/LcRddKK7pMIi5t7FbiUSYpy3HeiIXD8WDMTsiGO6B3ltXR7SIeGZZw+nkQk
	1sWAEJLYHx/4LSCEH0soRVooZCjpVcLwt5GQoJUeJQfeX/P
X-Google-Smtp-Source: AGHT+IEv8ivtJY3iUUMo5RtX3bP8dICn8/vKWP9h360RglG/jvTj42VueZEHFWb4KLiJRdN3bkDv4w==
X-Received: by 2002:a05:6000:2aa:b0:385:fa26:f0d9 with SMTP id ffacd0b85a97d-38a87086c15mr6336508f8f.0.1736421425044;
        Thu, 09 Jan 2025 03:17:05 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0bb7sm51383635e9.16.2025.01.09.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 03:17:04 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/3] media: imx415: Improvements for framerate and link
 frequency control
Date: Thu, 09 Jan 2025 11:16:59 +0000
Message-Id: <20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuwf2cC/x2MQQqAIBAAvyJ7bkElE/pKdJBcaw9aKIQg/j3pO
 AwzDQplpgKraJDp5cJ3GqAmAcfl0knIfjBoqY1U0mIkzw451lkZ1D4s1pFWw8BInkyB67/b9t4
 /Kxesnl4AAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The driver was using reverse engineered pixel rates, and had different
values for different link frequencies.
In common with the other Starvis sensors (eg imx290), this isn't
actually the situation, and the pixel array runs off a different
PLL to the MIPI block, and there is a FIFO between the two.

It's not quite so simple as HMAX is said to be in units of INCK,
not pixel clocks. Working through the various modes that appears that
even that is slightly wrong as it is units of a scaled INCK of
either 72MHz (for INCK = 24 or 72MHz) or 74.25MHz (for INCK = 27,
37.125, or 74.25MHz).

Rework the configuration so that the pixel rate is fixed, with the
different link frequencies adjusting the minimum hmax value so that
the FIFO doesn't overflow.

Switching between 2 and 4 data lanes also only changes the MIPI data
rate, so also can be handled by altering the minimum HMAX.

Once you've got HMAX / V4L2_CID_HBLANK represented sensibly, then
frame rate control through V4L2_CID_HBLANK and V4L2_CID_VBLANK is
trivial, so add in frame rate control too.
Exposure is set in lines (as usual), so amending VBLANK changes the
range for the exposure control.

This has been tested on a Pi5 with Waveshare "IMX415-98 IR-CUT Camera"
module (SKU 28524). That uses a 24MHz clock, so only the 360MHz and
720MHz link frequencies have been tested (other frequencies require
a 27, 37.125, or 74.25MHz clock input.

It'd be nice to add support for 12bit readout and windowed mode readout,
but those are a job for another day.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (3):
      media: i2c: imx415: Add read/write control of VBLANK
      media: i2c: imx415: Make HBLANK controllable and in consistent units
      media: i2c: imx415: Link frequencies are not exclusive to num lanes

 drivers/media/i2c/imx415.c | 181 +++++++++++++++++++++++----------------------
 1 file changed, 92 insertions(+), 89 deletions(-)
---
base-commit: 40ed9e9b2808beeb835bd0ed971fb364c285d39c
change-id: 20250107-media-imx415-2df67ae21107

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


