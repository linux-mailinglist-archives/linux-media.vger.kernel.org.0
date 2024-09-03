Return-Path: <linux-media+bounces-17482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC6196A14A
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 16:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158991C2349D
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 14:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2008E179654;
	Tue,  3 Sep 2024 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBTmler7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3571422A2;
	Tue,  3 Sep 2024 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375278; cv=none; b=YphZk9g4G3wjf37Orkz4JVPZUOVWRdwuQhAaTISCkqwUvE34Fju1GYQPn4wrqIlb3VAtxa81C/MsFKm3ISMNh4WfJQzWsiU+HqNilyqihzlFJrcXM64yPB1m9JQ+Ro6XY1hY98QFY2xnYloBY2zHiC1TzavfkKfXv1Iph76wgDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375278; c=relaxed/simple;
	bh=AMxxIDFFGOzD8cndc0dfNsONKxUWhOVS4MOatInk0UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=blC6FknxpTDekcbRQixn4qYe2QrBwKz4qU7lamMMj+sxF0j0vCVCT/lH6mtd6sopIaOlUHD/HgY8fp2Cxx96NSl7NwIkUKhGWg0fdx8xrESdI4sVKl0GjsDx4kzTyIQyGEsCQRQH+QB8gCzRD3x5KQUTXC29utVJtk6WLv2X3WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBTmler7; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a866cea40c4so623188366b.0;
        Tue, 03 Sep 2024 07:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725375275; x=1725980075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/BVYlvL4gHEUQpWXIW8F1GRsqHQBKtMin2kUg2njls=;
        b=kBTmler7KiFSOLehr7bQGk87Cp3mslLGU5qJ4VsbKHbRElbTBBswnj6sqgm7CG5/Xk
         JxZOYvYpAv4HStcuryOhnCXGGeQNRz9hG7cFUqcgYIq334mDhGJqPO1EezBtYeVhijhi
         vg3BwWB/Uws5OtkoyPnZyt5JDyWxWZeBXwU9G6txlZNOB3GoQvzhPUahN88C9c6oIRNo
         BbjN2CpsmIyjqQLeHoT9Qptm3dAWrYqWq8DiN00Ac9DAAOjagYsGfO6Ty0PiRHKIdavj
         IU+TLGAV8FbzQPFGS92pxY/8CBIgdTEJonbn/PwM5QmUlBMhLHNT9YQi2IH46w2CrGMZ
         rBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725375275; x=1725980075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/BVYlvL4gHEUQpWXIW8F1GRsqHQBKtMin2kUg2njls=;
        b=ATStXznhwe/faBb8zwU6jUNH47Cgfo6rlBkzqremBo8I82xYY2/UaH7y189e/Fz3hU
         e24kpf95CNy3W1Hqwed0NhY8JEvUX6WLIJ4agzrqVPC0oO5i4R1w7mUkISubfazMtveq
         ky2+wtmxiCdC9h2d6IC0DMom8U1OQ9yC6nznazHlKCxrvUv2RpzR+tsGDmZ9165ON3Bt
         DSVAly4FPM9yebvx2c6ShpQiJ9Ct331x3jTLtfWCnrQ4u7639NHm+6LrgZUxTeSKkUIh
         Zxl+VR1ySXwAvFZLXSAJ3jLW5X7Iineuu7Jnf5E6EeWBNc3ip/3GrQ2eCoW+Tpk3w1jh
         xWEg==
X-Forwarded-Encrypted: i=1; AJvYcCUoNTY3ioKqAn8TZziu35NrewpeuA1qi7D1XVijRlb1hOrAuFSWnyMNir99MjhfdFowHExDezJt1erlseE=@vger.kernel.org, AJvYcCWfJzrfohDra+JzBIZL8OdA8Cd+W4OmpGky/OI+zQK5rhXUzYT+RtHqXovnV5jxSMyrw0SWX5esjaIiTIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDv2k2wLMXe4zeEwybd8Xwj6Mduw45bb27A1OZtS+iB/KpvBGF
	gJaSi+SfTS1eNhk158/ITlCUvFUJcCWTxdByRc6z2RttjMGtPQEJ
X-Google-Smtp-Source: AGHT+IHzRPPVhzWwmflibJ8Nc/gGRaeiztOd3oaglIHMGZ9bX66ck3OwC6vyc5Mw5iFFG1UxbmD3eA==
X-Received: by 2002:a17:906:794f:b0:a86:7c6e:2bb9 with SMTP id a640c23a62f3a-a8a1d29bc1amr307443866b.2.1725375274821;
        Tue, 03 Sep 2024 07:54:34 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d86cesm704677166b.171.2024.09.03.07.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:54:34 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
Date: Tue, 03 Sep 2024 16:54:32 +0200
Subject: [PATCH v4 1/3] media: i2c: imx290: Remove CHIP_ID reg definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-imx290-avail-v4-1-e4a6c0837f0b@skidata.com>
References: <20240903-imx290-avail-v4-0-e4a6c0837f0b@skidata.com>
In-Reply-To: <20240903-imx290-avail-v4-0-e4a6c0837f0b@skidata.com>
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

From: Benjamin Bara <benjamin.bara@skidata.com>

This register is not described in the public available imx290 datasheet.
Additionally, a read returns '0x07d0' for an imx327lqr and also for an
imx462, which means it cannot be used to distinguish between those two
imx290 derivatives.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Changes since v3:
- no change
---
 drivers/media/i2c/imx290.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 4150e6e4b9a6..5e4aa7237152 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -78,7 +78,6 @@
 #define IMX290_ADBIT2					CCI_REG8(0x317c)
 #define IMX290_ADBIT2_10BIT				0x12
 #define IMX290_ADBIT2_12BIT				0x00
-#define IMX290_CHIP_ID					CCI_REG16_LE(0x319a)
 #define IMX290_ADBIT3					CCI_REG8(0x31ec)
 #define IMX290_ADBIT3_10BIT				0x37
 #define IMX290_ADBIT3_12BIT				0x0e

-- 
2.46.0


