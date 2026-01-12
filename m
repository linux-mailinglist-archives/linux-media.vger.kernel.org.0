Return-Path: <linux-media+bounces-50382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D153D10553
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 03:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F19830184F6
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 02:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F3A302750;
	Mon, 12 Jan 2026 02:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCvQIANA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4D83019A4
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 02:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768184682; cv=none; b=bBUVW2Nkcy+BsAx3waCMtSIh/YGuK+3JX1DTJOR6k7H0JczPj3NMsi/0aco+6wa9lGb3I5e3zbveK4dbvUFmK1nuQ2YQEL3jlQe1Y9mwVVohMIldnGL93V53bpDT3LzmDh1yCJR0yWmdyHaJs3Cp9cqMU3wTA5yHzKSSuf/s/xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768184682; c=relaxed/simple;
	bh=cYT+SMvmLk9QzYUeZ+qyjiFB54S0AF2o+x/bxZvEx6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WjqgrPSWtcBjx8BHv0Zt2veUW8kSxYP88qVFTcR6u+MJcqN411dI7OjyJoC/NLKqTNYoRnVSHKYy7icHVlMh6sw12w7VID9aSJqMsAXbD0ZOcX9mPIJJKHooVZt+olbycpPGA7AjSI5tV1ciLcEzxtdI4ax+JkpSA9Wyb9d3ok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCvQIANA; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-3f0cbfae787so4476015fac.3
        for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 18:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768184680; x=1768789480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SBuXWx9qOVbHe6SkWU7zF+i8FhqlJY86NhPpsYqBws=;
        b=nCvQIANAaplUB3xkgXosBol5LDGrrbyphh44x1WH9cXjxO7xLlXdBOo1V9MyAdJRX6
         flxhbaJYtje27Mz+EUDNGi9czn3McLb+1rGMR8nlfF1tO2YrR7daYOUksaXsxYGFgDFv
         ersy8gKJs9J233us5AwTLhpIH0BnqbBV/wQmFodAwOxqPZn2ck4XE6IJP/CBX51sJaz7
         8xbqItKSMDj4eZagPnEp79BtGaaz+U5xVGAejH3ILn5ikeFRGBFPl8QbdfhQlLtZo82q
         nWPFd/em6bah2XZkk2OksQ25c425nyztxXuqAe8jt0l5Y6CWqNLPudf77ER/2bsap/dn
         W1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768184680; x=1768789480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SBuXWx9qOVbHe6SkWU7zF+i8FhqlJY86NhPpsYqBws=;
        b=uCFNKuaEw3TuS6RFXksYoJd6YUz/bR+vyw8SLLpexbNITk39pJGEaC7Wr72iKQFs9n
         XKn5KN4qi5zbgi+ENH/i+BwCh7dMWdUz8jF6JHXPDFiiLfVZ7PKBDsv8hJ89R5xlrx+8
         RUyyX8/ehXSYYxNXBPhrEtytYk/AS3QWYRnTCHPOH/Oq4V3+z+Gq0zK/7aKA9lKU7r30
         M/LSAlvgVwzd1jzBDnAew6toOjO5u9HweVKV5vrXxidbTUmhtM19FPr6E13PcDIBylk7
         hWjM0qZepGbHp4ouN6HlavUtAd4siLvl3hb0LoTpFAXe8GAvcAoFx0OKw/T59DbYSPcc
         rdIg==
X-Gm-Message-State: AOJu0Ywsg6ldCymkgVCNRI5IQPBBCegnF48T/7+w2pKbsJ9tGlxABz/M
	aVggN0st2+Zpt63ilZzKDHp9KimnA/UPOE8E+FS3TbsNHFeM0KLY+TMG4z0ppA==
X-Gm-Gg: AY/fxX59zDnnpluvj07DeppcMHj2cpnLhvmOmG2CwD8j4qC/DKpLIEr5LTTBEoflqV2
	Hkq9hZlMZjk7/uy0RzjK/7GQ/HS0/EcgUqe05JOau+s312kh75FixFijvAWJIM8C0+hVYQN9Bau
	3LrbBnH355oeen7rtFIMZBlODTVOHfGT17dQe0MWxo/YvaEob24uSX+tKniOtI0aIwmEwQHB8W0
	//1uVbywWVv0WHpIo2feZrn01KvNRsBG49P0ToBRfjpxPDQR8eH3MT9jI/0SL5TAhlgxFszSYm9
	vJ34+xXEWEK+TbRPN4fNPiSzrb1Ex6hedloTfPI//nyhOSJbopLjUrvy4HvKnhE/8S/nl1GiZ+e
	YmAby/yT3GPrjGRMFvy2X71oTeQ2YYgGjwaBeEv1NUGhwtp9OuFUISJS1gpgOw/LCpfsElljsGA
	+Sfg3hmTgMci1TeOg7uJekAL7XG+IZX+O6KnEW7rcodY8F0UG6Lwz7VFBteEGdNxk=
X-Google-Smtp-Source: AGHT+IEqqt/mH86rPnI1lvdO0jDqw/Skj7W45+J3NHxzsa//hlgU9oqzhm9uty+fTl2aPHtMbXZIyA==
X-Received: by 2002:a05:6870:f71e:b0:3ec:4edf:d82e with SMTP id 586e51a60fabf-3ffc0b6b2e7mr8715652fac.35.1768184680008;
        Sun, 11 Jan 2026 18:24:40 -0800 (PST)
Received: from princess (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa50ecb58sm11293354fac.18.2026.01.11.18.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 18:24:39 -0800 (PST)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCH v1 2/2] MAINTAINERS: add entry for AVMatrix HWS driver
Date: Sun, 11 Jan 2026 21:24:20 -0500
Message-ID: <20260112022420.390854-3-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
References: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the AVMatrix HWS PCIe capture driver.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32b5e41d9849..eca97b3f3474 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4201,6 +4201,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
 F:	drivers/iio/adc/hx711.c
 
+AVMATRIX HWS CAPTURE DRIVER
+M:	Ben Hoff <hoff.benjamin.k@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/pci/hws/
+
 AWINIC AW99706 WLED BACKLIGHT DRIVER
 M:	Junjie Cao <caojunjie650@gmail.com>
 S:	Maintained
-- 
2.51.0


