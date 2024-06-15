Return-Path: <linux-media+bounces-13312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE90E909A96
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 01:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A884A1C210B2
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 23:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14028535A4;
	Sat, 15 Jun 2024 23:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WCfdUTZ2"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28A92940D
	for <linux-media@vger.kernel.org>; Sat, 15 Jun 2024 23:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493781; cv=none; b=M+Ua9mu/NOCWWyafhJf1yTaCEtYFGJA1KmZUCYLByQLR0b2hXfSrHAoe8I94DgNWuDt9opXoB+x18hRVSRCh1UKRaVtoFBlxzsz0vEQ4WTF9UkhhDFk5Ph0nMYPxZeOrXALe+tX3n+o/B5jNge/F1q8aNjChDqNI2Ad6avUq9Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493781; c=relaxed/simple;
	bh=gfMjaNTt8migbAfVrAfTjz/91YQGBzfAiI7f2Tqy7/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCdIFPrWq0y+tUUqZ0DbPIbVZrN32ymos44ZGL3dkUlp8NRxqhsvp9OLSQobZ3ybGY8MMpzxBZC5odyRBJJxeE1s1UZjQ0kZ4YotRJ3gvASQmSnpgqScAg31Jbae1R5azkHxWyasK4zZ0zZ62fB80d/wBjqNj0d6ls7Z6kOnqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WCfdUTZ2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718493778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wQqkD92COR5rJvAMSRlpyUDbTeY35ynbemlBIpz0gtQ=;
	b=WCfdUTZ2RUyJm1+zE5WnbFhVAMG2N4yOPibTregPOvKuxQuoRSodCp04+bDcHDGRmnP1ag
	OK+pblW3Qge7gDSiM3TEBRNme5zXGkBl9Jj4nNiGtNSS/G3p3g9auY/RilPlXBbk8qggRU
	DsuqyIlxEoqOwnXVKJ7EbFX57/Txd1M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-3EaH349HO4y5Xgk2eNcplA-1; Sat, 15 Jun 2024 19:22:57 -0400
X-MC-Unique: 3EaH349HO4y5Xgk2eNcplA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42196394b72so21153835e9.0
        for <linux-media@vger.kernel.org>; Sat, 15 Jun 2024 16:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493774; x=1719098574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQqkD92COR5rJvAMSRlpyUDbTeY35ynbemlBIpz0gtQ=;
        b=p3UvN5ZnWNhsCkQmTDG9E4xOqoRJBUI1j11LAGBo1j9VwOrrbo4mAQkkIVGhmOsShi
         039yrp5ljoMroUPyWeLL3D7L7vDfewfMqTeqQ5+8IheL2xumuPRB99/jiR9O5pp6QFAP
         WlfDZe9tFNlLaUj++Wg560KERBeRtFY9W/KExv+NFQ17TzOzCypKxMLoMluBteYVjODL
         JfsH+hkKiymAZFEuijxCwN2cLOUVF2FQPXINiQtPVFm3WxVwHVKamS7fc7ttTX08+H//
         T9Laaux+kjI8EFAdbDNxrMhaMz754YORRJgE0f76YopNP1UB4rJU9UWEgBVAc1Fvtyoq
         EnTw==
X-Gm-Message-State: AOJu0YzmUz6FlpMWlBLtAl8F6VKY27S1KxYIlKsvaXVt0h+2CgRigtJk
	3sAiy1R5AWPEjA1iIj8Dx7BUp8Ooz43q6zxLYMo5CYriihqM6X3LAF+tJI1gcABLXhd6U/i4/b7
	udE5zjF/OcTgwVkXFXw13ULORP8JROX0cFGvnRxnH1bqx2zsmO87lnPFxNuHoQTqF8sAqI4FUAs
	KrtHp6tu0pZ1Zt2JBd7nC1C1pczA9u4vl6rKsrK/GbL7W5EMXGufuyBPU=
X-Received: by 2002:a05:600c:15ca:b0:421:5605:8c92 with SMTP id 5b1f17b1804b1-4230482bd1emr47619125e9.20.1718493774746;
        Sat, 15 Jun 2024 16:22:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9j8qPYsR3Y9RMrlW+qWhIgu9xRZhj5OcBinBomhIySYLdhzDcK7uOep3Wdvz5lrlgqWW4jA==
X-Received: by 2002:a05:600c:15ca:b0:421:5605:8c92 with SMTP id 5b1f17b1804b1-4230482bd1emr47619075e9.20.1718493774210;
        Sat, 15 Jun 2024 16:22:54 -0700 (PDT)
Received: from toolbox.fritz.box ([2001:9e8:898c:3000:87ec:5772:d7cf:81bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe9184sm145586515e9.13.2024.06.15.16.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:22:53 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: linux-media@vger.kernel.org
Cc: Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] edid-decode: Do not print the raw dispaly use case value
Date: Sun, 16 Jun 2024 01:22:50 +0200
Message-ID: <20240615232253.178102-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If it cannot be converted to readable string, a failure is added which
includes the raw value. In libdisplay-info we do not keep around the raw
value which makes it hard to replicate the edid-decode output.

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 parse-cta-block.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git ./parse-cta-block.cpp ../parse-cta-block.cpp
index 5193b70..3cf4eff 100644
--- ./parse-cta-block.cpp
+++ ../parse-cta-block.cpp
@@ -1613,7 +1613,7 @@ static std::string display_use_case(unsigned char x)
 	default: break;
 	}
 	fail("Unknown Display product primary use case 0x%02x.\n", x);
-	return std::string("Unknown display use case (") + utohex(x) + ")";
+	return "Unknown display use case";
 }
 
 static void cta_microsoft(const unsigned char *x, unsigned length)
@@ -1626,7 +1626,7 @@ static void cta_microsoft(const unsigned char *x, unsigned length)
 		printf("    Desktop Usage: %u\n", (x[1] >> 6) & 1);
 		printf("    Third-Party Usage: %u\n", (x[1] >> 5) & 1);
 	}
-	printf("    Display Product Primary Use Case: %u (%s)\n", x[1] & 0x1f,
+	printf("    Display Product Primary Use Case: %s\n",
 	       display_use_case(x[1] & 0x1f).c_str());
 	printf("    Container ID: %s\n", containerid2s(x + 2).c_str());
 }
-- 
2.45.1


