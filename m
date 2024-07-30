Return-Path: <linux-media+bounces-15572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C149894135E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 15:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45322B255E3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 13:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A989019FA87;
	Tue, 30 Jul 2024 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFsN1yUM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53BF19EEA1;
	Tue, 30 Jul 2024 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722346924; cv=none; b=U7k4bwrW9ZbR9qAvqWI3PmEHSEVzgFLZqYbmVFSSSXoJW4Ek46/UWJftFQNJ0kO1x/ScnAyBRh4Vma6mQmg8nBdeWkDhSBu/ScAdkiRRg98ZMGpUh1twa0LEy9B7unU6BOSoJnrvc++8crMO0gZaoWZfluSGKwitTyeTosQ580M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722346924; c=relaxed/simple;
	bh=d0Rk/kG1aoRS/YcGvNRRON/NZwovw91z+XHhTRu5vts=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ph+6FNnbnSkxgX8aNF8K+zHkT6SxO8vIzIeKfK+1IJ4OsRSK1GKcSMC2jHpTar1J2DfNJ8r/5WXOlObVaFZulbZvLLeOmTLrrXaCX5iuPH7jMVDr4NgQ1FvWLOrpKgQkKHTEFl+4XYp7cbLPqBIcENyMxADs7axkefrF3KcsBlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFsN1yUM; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so673932a12.3;
        Tue, 30 Jul 2024 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722346922; x=1722951722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjHDKFiNb/7mkPm12vALojAT4EA8gp+e8Ucm06PO4g4=;
        b=UFsN1yUMTF22EJiAbF063boMRbIHtJZiqoEnC7EFjUNuXTER8zq5Dws84eaTo+7Yug
         nVRA+ceQgYgRuavqP+3w2sCWu7W7ilisaeUksNNPU/2ziiR//z0R3cBxVzEDfpiYXla4
         WVKoLSb4iaH26UWw0MycvQh3r0JPBnxylzUqFU1oHbmtXCCu/tmQA00S4OE9UA52AHBH
         5/U41gxiYjcVLH7vKVPB1zHU0NSXrOtCpyCEZcBWWGEA6tJ6g771BOew1ivTAuErvF4o
         R+IdLSrkC2xa+ISkQWjVQPNOVocMz7l3bIpElfnflPeoVfwDn+Pq7DjtNG9e+YjT8j4+
         tXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722346922; x=1722951722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjHDKFiNb/7mkPm12vALojAT4EA8gp+e8Ucm06PO4g4=;
        b=n+4W6XbkyIpp2cF8Ofpu31MJjxb70Ob2ypyfVf52mXvxjgpd/66ejqHPJwi3kj8B9q
         M6WINexZyZIz01pPq7SQ/4HVkOzRAdA56ADhXpmyMya1n0UUygiRfjZV/YypYXyATyMb
         jhcoQFMOoQc3w5HxEEpGvFX41xT3b6pGPrvduYxldBOndm4PvuMKGN6S2X7T8XRHiz4N
         xJeP5t/BR+Tw/eoTR4pGzXMftJ0IcptKhixWe9wXQoKDODrJO8za2996zSoriisRhQYh
         V4MNrrpeV5VS8IXDsIVpPyiSMXQAt49jTCxWMLhl2EAUvnkp3Oy8+TMhhzvXwU5iJJQK
         KsfA==
X-Forwarded-Encrypted: i=1; AJvYcCVDU8IOVPsZaBLIQpnmunXWo34c/hKSupkZuFiFuGac3MjPq82g/fLNRJGTAfnv96ssxTeDfzYxURT2rdZGWJAhx9SDYdLzhya4BBWa7HyWAOQ8wHAwy+DiQ5+h1rjVgg2XyRlvqcDbpHc=
X-Gm-Message-State: AOJu0YyspAr4oxWsBPcdv4KLLCGgJ8Pvok1oqZ/HKYkt5er1hPaDrndW
	F42GJVi/NcdJmAks7tKOd+Xs3G+LW0Yzb42Lx/6R/P9XRPZZdP4X
X-Google-Smtp-Source: AGHT+IF40GQQD8Bzij3JiNBe7Z8RFZRAA4t8TX3JQnaJ7TY4M/IRNx7Qoul0MwzMCBlBt8orBk2NMw==
X-Received: by 2002:a17:90a:597:b0:2c9:63e9:845b with SMTP id 98e67ed59e1d1-2cf7e1a1dfemr8887061a91.9.1722346922058;
        Tue, 30 Jul 2024 06:42:02 -0700 (PDT)
Received: from localhost.localdomain ([211.171.34.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb738859csm12604140a91.11.2024.07.30.06.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 06:42:01 -0700 (PDT)
From: Kartik Kulkarni <kartik.koolks@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	akari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com,
	kartik.koolks@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: remove space after pointer
Date: Tue, 30 Jul 2024 13:41:55 +0000
Message-Id: <20240730134155.37784-1-kartik.koolks@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "foo * bar" should be "foo *bar"
in osdep_service.h:105

Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index cf96b5f7a..d6d651342 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -102,7 +102,7 @@ static inline int rtw_bug_check(void *parg1, void *parg2, void *parg3, void *par
 #define MAC_ARG(x) (x)
 #endif
 
-extern void rtw_free_netdev(struct net_device * netdev);
+extern void rtw_free_netdev(struct net_device *netdev);
 
 /* Macros for handling unaligned memory accesses */
 
-- 
2.20.1


