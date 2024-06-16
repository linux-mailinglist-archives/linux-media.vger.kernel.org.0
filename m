Return-Path: <linux-media+bounces-13323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19054909CED
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 12:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B4201C209EF
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 10:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C316186E44;
	Sun, 16 Jun 2024 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KXbaoDvq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57253FC0B
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718533012; cv=none; b=qTPjeJRb28ZZ6AsQ0ZA5jhEeXhcaTSCj9ipDZnmuauymA2q2OTFEqRQqhckt3JAP1wqRgWJohOMHmkNXkwblwPNAP1IcjhEyyIreiV0+mSDQE/oa7E6OUa+8wILlawrjJCDCq/1qS8prob861lAPcWgTYnk3/V57kfuIeW+DO8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718533012; c=relaxed/simple;
	bh=XfqKwUm170p6nhuLvyGhgaYX0YiVNSB7PSI6ybWZUDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TEt4ZzhjsyF0Zz16OExBsoemeZWFubZNBJv4glgrPs5zMT8eB7/yNpPJ7wxZb7uYDRxO13KcJ0mJG2sVkx+eVW5aih90PGh38DQvEELsLylfWZ0qyVm+Rf5oHRTVrtnVsR1jiw1VmpThmBUXQKA1jsh4WrBCV6I6VWp5jidIvlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KXbaoDvq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718533010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W165AROrS3Y8M0FcNCXv64IMiUkCR3Al/DUqu38ezP4=;
	b=KXbaoDvqd9OSHFMlLN4Jfg4jF/lnWoaHgvxIz6Nlb+VNQQEoSkjua4laR0rCn7N0RXJSUR
	fyhmDQh4uPxh245owQ0GjICwTbPLgi88n+IvtuFrZ00Nqr/Jg3JSH8fd721tfE1K+Fuy0k
	k4Pk7802x2mI7W/VKesli6TMVeOB6II=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-EuRgcBcsNDSX-kohOfSXVg-1; Sun, 16 Jun 2024 06:16:46 -0400
X-MC-Unique: EuRgcBcsNDSX-kohOfSXVg-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ebe82e96e4so28299121fa.0
        for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 03:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718533002; x=1719137802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W165AROrS3Y8M0FcNCXv64IMiUkCR3Al/DUqu38ezP4=;
        b=RKQKp3u1qmJu25T83QCqq3bBdLq53qhE6MEK1yeVavynNDVw53EHxbc41/gq3crSNf
         gitC/DN1csV39tr5rtWE0eOqulR7XJ2PPZkuIB/2fpvESbU4U65G5yB4Ks/Bi4N8jdEy
         oUqTa8zJWq2/zx88Oyu9ZidfZ18EtWFEykwWYpCvGXJZZ9gijLH6fyOj7Rg1aoldcsIA
         Ik/5LOPFFCdWHzqNFslM/DPno+EpVN22AojrYKd7MIQBCoiA1K5CGN8wjrbDZxhsB5ny
         xWtByCcimEmOPz4Z1/dgAOnjjdaHKO9J58JDeLPxwCehS3qfPzcZBTTZV3goVEeuu9ld
         k3gg==
X-Gm-Message-State: AOJu0YyOmpPMBuYAvpHrfI7dLBZUFpud+wK0+kmxbL0RejnRJEPLg3y8
	vr0/0UF0eRKg0BFZEpl6YbnHfwPxUE2pC7DWMDW7CK2Kc64jJYt9/U5esZGaplkGsNCuaaW2jhl
	qvAsrVmhPRnTmEXTyPAuRRDlmOREoF3+Gd8KP6U/Y59l0rwJ/Y49iPf3/cVQlOyDYgrdmr6c65z
	Y4U9Kj5cVyfF4c6/HJFMIMoCQFQUmZiKhVHx4JnCoUarnNcFhpVAGbwro=
X-Received: by 2002:a2e:3304:0:b0:2eb:e312:5af1 with SMTP id 38308e7fff4ca-2ec0e5c6e65mr48887951fa.22.1718533002595;
        Sun, 16 Jun 2024 03:16:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYDF7gBsMNTs6f490/NsXjtKypbEPzFNoGIQiCFKzoBKSWw0aeKycpyUhYGGtGsSmiy6obnQ==
X-Received: by 2002:a2e:3304:0:b0:2eb:e312:5af1 with SMTP id 38308e7fff4ca-2ec0e5c6e65mr48887771fa.22.1718533002025;
        Sun, 16 Jun 2024 03:16:42 -0700 (PDT)
Received: from toolbox.fritz.box ([2001:9e8:89a8:db00:25d8:62ef:330f:725c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104c50sm9102884f8f.108.2024.06.16.03.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 03:16:41 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: linux-media@vger.kernel.org
Cc: Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v2] edid-decode: Do not print the raw dispaly use case value
Date: Sun, 16 Jun 2024 12:16:39 +0200
Message-ID: <20240616101641.234076-1-sebastian.wick@redhat.com>
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

v2: Adjusted string

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 parse-cta-block.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git ./parse-cta-block.cpp ../parse-cta-block.cpp
index 5193b70..d68d7f6 100644
--- ./parse-cta-block.cpp
+++ ../parse-cta-block.cpp
@@ -1613,7 +1613,7 @@ static std::string display_use_case(unsigned char x)
 	default: break;
 	}
 	fail("Unknown Display product primary use case 0x%02x.\n", x);
-	return std::string("Unknown display use case (") + utohex(x) + ")";
+	return "Unknown";
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


