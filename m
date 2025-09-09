Return-Path: <linux-media+bounces-42101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEBFB4AC2B
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 13:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F7C73A821E
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BEB322DBB;
	Tue,  9 Sep 2025 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOn8im7y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AD1322A0E;
	Tue,  9 Sep 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417547; cv=none; b=ibeffLM+0kNyup4QVCd2iWJftpNmYM+nj10K3vmkdMg+PAEF4gfq5i4JLRGKtajcCms3ECC5+Xd9veclXfYTwFGtpsgj2bNkqSi4TuTP4kzb0EwatJrNgyaU6vx55hg2uk7dQSzQMaPllaGNgAr8AE/mPH43ONMEvAu4DmRujP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417547; c=relaxed/simple;
	bh=I/zaQuiydOnPj3WHLpsr9AQZAAZHX0ydNtE3jmZgP4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ve+vtD6BkEgcbyw/jNxB1/dTVzWiFfee8gG+2Wqg367RsdO7NeAh5xycumkwsB+OZVbZcLzeLCkBOZBOO/BwngjN6M9FfuhfxeSuCCphKxO3Lajd2D86jhnhKoP/0Ir71I5XthcWE/XvYyQ8L6YrYUo7FDQ2ls30ZeXRz80gSPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOn8im7y; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b046f6fb2a9so816706966b.2;
        Tue, 09 Sep 2025 04:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757417543; x=1758022343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUfOzEVUIAt9xbGJYoEDPOS8APbEF1/hSIJ/+d4b0B0=;
        b=TOn8im7yFu6NpGWeH0aYJE21oTs1UYRC+OPGjXF/YuebOVNRNsrSFEiz35J7bSxlTN
         QKdTMu8bA/IgTudypFSYwJHY0ZPaDNuI7zXbStDSPqA05lFOCosYJOgPsm6uKClsIScv
         mjwYkoRdqanYxrjEsN3te+afx0ODV7RWSzZqT1VeSHcJXw+fxkqfqqXZD/fvobJLaiRE
         2qLmckBrsRN05Xfq9oAvi6Vw26aMv0EhhZoMRHQJGoxe0Z5eovC6b5kHuE0r4633qfXl
         td+LKSwFAIr3BqInqmsx4sDE1Q5hbu4G8P8mCtCmSBSIPn4LXhqxp1tsYM37bXNx4w0/
         36cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757417543; x=1758022343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUfOzEVUIAt9xbGJYoEDPOS8APbEF1/hSIJ/+d4b0B0=;
        b=FBI0L0pk07JDuOtUpGTnEILjvg/6QMUiFL63dbgFHQB2zEBWl9O/PM+l5CGbFt+8Qm
         NKLoVXmtA2KeF/TjFnwGWJlZU1A4sz5yJRWfeL8sMJDrUw80V2USzvtdgVsFV3fMiLEc
         aT4VsBGm0bDec8p8fh9+gr0LAu3FYEmX+SJQXJV9uSU+dAXmmFc5knuN/aLQmwxaHCvv
         cdx37/bez7u4XpmaYR2WS2Ndiz9uLwjrYsK6fNfk8ug/dy/3VkK92qB1YazoKw2Dabzz
         CM8fwtMF56IVagGwQ/kz1rtmvtOT7shXM4uKCIGUsBpEVbsVeGx1Kfw7ORPfDvCNn4ae
         EpQA==
X-Forwarded-Encrypted: i=1; AJvYcCVYDdvFzqjJrtzhQ/o8AM8DLjdEYMi6Gy5gwUSMpkrdPwtBBAkVHQiyOEzN6C7h60WKhS0qPgR+0w4GRf8t@vger.kernel.org, AJvYcCXei2f6jo/AS8KoM/kymYgjfcKzqJCpeD7qmxzi0cYT5ZjVCLBFppjhT8RKhKj/cHenXUKn9E1EpXpM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/PWVonG68cd1cfRCJFTnCrF9itOoJmqcBwP4EOlAdx6uYpQaL
	peCxVyObeJBp6qvb4pOnHa84HD2COBIWl8elcK9pBHtcRPWA+O76V1jsbZV+Mn8A
X-Gm-Gg: ASbGnctZiBqCKltW4WB9HGLc3/5m81edw557Mw8/7jMXaSfNXcORTv5gQTijOpVMIDb
	nKxZMPLaF6pK8EKVSo2q49xMrm4nvKWYSNaDxCsk96iLEcmBW3FnLpJxm5gv5djNPheFw+BGUdE
	5PruwiPhuO3yPqEHZkM1i9IgFM7D1qG4iayfixChKwVLVeBJwFV8Ss1VjpA/GGNLqNOxllCJagq
	BiLLGAXzkTOz5T2+Wa2fSdMeQ3HoKvtx9sRJ7HY/EB7qt1WDd79Kh2g9f2Fl+UdrIXe/CAShce6
	pCpIxDZExRtzoV9K5E9QuTVGmP8d6NkdoZIJ4bK0EoXeXvrVX+wPzYfn4Tq6QLkF31jHy6ijnWx
	RjfEqpvUjaDGII9UpXIBABGXXriaQ0Iwwm7c71wXY2z8=
X-Google-Smtp-Source: AGHT+IEZEVYUZIrd8kcwOJQp7VFDJjt6ne7OWGJAgr7nMsPpkxhuRiUyRJAL9Nqh2iAijr+UwTKkpg==
X-Received: by 2002:a17:906:c10c:b0:b04:6d98:cbbd with SMTP id a640c23a62f3a-b04b17a2303mr943027266b.65.1757417543436;
        Tue, 09 Sep 2025 04:32:23 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:4bd8:5793:1d49:8ea3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040f1cf4b9sm2289497066b.29.2025.09.09.04.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:32:23 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	michael.roeder@avnet.eu,
	martin.hecht@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: alvium-csi2
Date: Tue,  9 Sep 2025 13:32:16 +0200
Message-ID: <20250909113218.2595516-3-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909113218.2595516-1-mhecht73@gmail.com>
References: <20250909113218.2595516-1-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change from my company email address to gmail.com.

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 05b708bd0a64..5c1bab574394 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -2542,6 +2542,6 @@ module_i2c_driver(alvium_i2c_driver);
 
 MODULE_DESCRIPTION("Allied Vision's Alvium Camera Driver");
 MODULE_AUTHOR("Tommaso Merciai <tomm.merciai@gmail.com>");
-MODULE_AUTHOR("Martin Hecht <martin.hecht@avnet.eu>");
+MODULE_AUTHOR("Martin Hecht <mhecht73@gmail.com>");
 MODULE_AUTHOR("Avnet Silica Software & Services EMEA");
 MODULE_LICENSE("GPL");
-- 
2.43.0


