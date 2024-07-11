Return-Path: <linux-media+bounces-14904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6236B92E458
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 865511C2186E
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 10:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A132158DA2;
	Thu, 11 Jul 2024 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ut13nFWH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA61F14F9E5
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693205; cv=none; b=CVurK24mS67E9ugXPw/qT/QvDaB1tM/weAE0nHMhJ5Nr4sadEBfST7fEkX7kP/TXOffrTSaNDf8ThAywWnUj3keppwk3GlN8sP2c5leRKc4F7+fgyEgYRP6+S9NaewqKUHj2mNH2AJhaZNlYFi5IB7HN+cdAirKrgC5RYDitCz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693205; c=relaxed/simple;
	bh=Te0Lw1oxuPXepV/5h7IQuALOgj6ZhURsQxOt9/IHXPc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iX5rz8nf2NAL1qQeGAQXRGv0nkjPu8yfnh5qx3GCSgcy1Jsdr5A52UbP4DLaOvWJg2FTrKbMOQ5cwBwEFGbwFk7P2wVtBhTLBQCl/Vn2Mm8rmGV1Jr+Ko8sT8ZYcxUPN0csIEF7zx91LlgMEQhn6hlmLGYuTF9c92Badc1Q04Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ut13nFWH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42797289c8bso5100275e9.0
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 03:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720693201; x=1721298001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NpEPOR+4bYifIxXAHWhUoDP3ysZA8Zm0c8+Ht0LO1TA=;
        b=ut13nFWHV2SFSwyKg8eMtIyLnzLTRCi947pSOL7+KHsC5u2iDwVmceEU/6JlRjuJDe
         7BY5tGwCaMt8xF4Q3jkblU/PGGIplgIMi6tQ8GoB9f4eb+L3aUc1Ohx+LvgTfaJeo0OQ
         owuJ4zVqr/RUbYqoCpgnWL4Qf+OOHnVfnh1j4ZpNuUcSfPTqLfohIYsMwCunWl1BmG9P
         PuNCHOpi8JHYFC6I0gwtLHX06L53lZgIrVZg3jDpQjLaihUuP5vwYy8w4sJ8u8ECqJB3
         o0G5jOnxryXXYzY5iQvstsKlkUFCJAuQoullZpLhnn61XhJ4cRj9/q/UydjaV9yF7mXq
         cLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720693201; x=1721298001;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpEPOR+4bYifIxXAHWhUoDP3ysZA8Zm0c8+Ht0LO1TA=;
        b=fUGnix+mi2kcex3wFIh+4DJO+mSvrhBskGupNNpkDG3iSiUGGdWAQ7Cfvatg/Hr2UA
         qAaTZKkvbo87eYMVy4/XI6QMTf0m790lXazqJTJpNskV84vYFg5fKn5DYOWvFuUXEXQh
         S1rWvdTDNBDfiZCnfnNlJDxaUhOiJTfpn2LQqle8LCTws4Up12YAkaU9U4+z4IBwxIM+
         rF5FwP7b86//dYIX91FGStBnu1I8dahUZw2DPhRn2kh1TxfYxrSwUT+gnt68nx/ziOWd
         DJcz8owpyfyoGzZrf6HoJcIDvGLbOjsMce4kw40Kjm28txVvy8Ve2WkOc6zpuouHBVsQ
         GhLw==
X-Forwarded-Encrypted: i=1; AJvYcCVfzlVkaY9BVO46Bm/CNkgZzbidnxlQJldYhiGG6Pt/+xj0wzaTsI+xRjVgqdllvnM7Nxz0/KogFyC4mkEkQrhQtpO5vbFcT99rfF4=
X-Gm-Message-State: AOJu0YyZVW+M5tJgQG1Ioawo31GDKJWS2q7GHx9xoBP/H/IkHgVDCQRZ
	Bns5a6gGWLMJpdGigUq2y2ezH1bkPXr3W3FpKN+kjED1zg7o7DTPAWFqo/lNShc=
X-Google-Smtp-Source: AGHT+IHhAvNQpxxxtu0l2TiI7e2EheLMZqNQ9j5p+6ozwhs2ZYLmXamkgwEmDJBnpLYODpEJcUMVEQ==
X-Received: by 2002:a7b:cd1a:0:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-426707d7914mr50144105e9.19.1720693201030;
        Thu, 11 Jul 2024 03:20:01 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266e861339sm125270025e9.12.2024.07.11.03.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:20:00 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] media: ov5675: Fixup ov5675 reset failures
Date: Thu, 11 Jul 2024 11:20:00 +0100
Message-Id: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANCxj2YC/x3MSwqAMAwA0atI1gZStVa8irjwEzUgVVqVgvTuF
 pdvMfOCZyfsoc1ecPyIl8MmqDyDaRvsyihzMhRUVGQU4S72Dmg5XHg8ujYaaxqJm3Iy5aIgdaf
 jRcL/7PoYP2HfoWBjAAAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-13183

One long running saga for me on the Lenovo X13s is the occasional failure
to either probe or subsequently bring-up the ov5675 main RGB sensor on the
laptop.

Initially I suspected the PMIC for this part as the PMIC is using a new
interface on an I2C bus instead of an SPMI bus. In particular I thought
perhaps the I2C write to PMIC had completed but the regulator output hadn't
become stable from the perspective of the SoC. This however doesn't appear
to be the case - I can introduce a delay of milliseconds on the PMIC path
without resolving the sensor reset problem.

Secondly I thought about reset pin polarity or drive-strength but, again
playing about with both didn't yield decent results.

I also played with the duration of reset to no avail.

The error manifested as an I2C write timeout to the sensor which indicated
that the chip likely hadn't come out reset. An intermittent fault appearing
in perhaps 1/10 or 1/20 reset cycles.

Looking at the expression of the reset we see that there is a minimum time
expressed in XVCLK cycles between reset completion and first I2C
transaction to the sensor. The specification calls out the minimum delay @
8192 XVCLK cycles and the ov5675 driver meets that timing almost exactly.

A little too exactly - testing finally showed that we were too racy with
respect to the minimum quiescence between reset completion and first
command to the chip.

Fixing this error I choose to base the fix again on the number of clocks
but to also support any clock rate the chip could support by moving away
from a define to reading and using the XVCLK.

True enough only 19.2 MHz is currently supported but for the hypothetical
case where some other frequency is supported in the future, I wanted the
fix introduced in this series to still hold.

Hence this series:

1. Allows for any clock rate to be used in the valid range for the reset.
2. Elongates the post-reset period based on clock cycles which can now
vary.

Patch #2 can still be backported to stable irrespective of patch #1.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: ov5675: Derive delay cycles from the clock rate reported
      media: ov5675: Elongate reset to first transaction minimum gap

 drivers/media/i2c/ov5675.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)
---
base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
change-id: 20240710-linux-next-ov5675-60b0e83c73f1

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


