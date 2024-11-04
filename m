Return-Path: <linux-media+bounces-20773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE79BAE6F
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 09:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C3E21F2169C
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882341AB507;
	Mon,  4 Nov 2024 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="kPKsPlw6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE39D7081F
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 08:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709945; cv=none; b=oDx+KcTG8wQafU2jD/oPwBFuzKy5ldg1lOjv/Ch5EbDUUtU2P/lnqc4wfFNLOUzz3whZZnkUl3yU8csCrLqbgA860MCvnzfJZH9I8lfj1kqM0+and/MrRGDvTzuBR1KVYAdQ8uNkPqEn7GnGiz5BppxY9eDUYQRHy4OXddScrCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709945; c=relaxed/simple;
	bh=UBEDZPdJjCTA4KZUpdfMW6fHq7esRaCALfSfkeB2IqE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lt7MXW46BLk1boylfqMEevqth7KUlSV1SUUznb8g2yvKh+QDqixX7FJcp7y+Hz1JWIdBFd+E2ooaOqEsnbgXGOrlmITgVj/UJAsWz155sUzyFzTOMJkv7c2+fBuhlnPkTip059cwpbMaHN1d7YOVFHnjkIbaAagK/IGGpKkS9do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=kPKsPlw6; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso3150365b3a.0
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 00:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1730709942; x=1731314742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XCdAosn0hUVlp01SX9nqFxjGER1OMRbiVfMoy6WTI0=;
        b=kPKsPlw6s3emFTt7daqR2gMHNqZNY7usC6mdG5v3dRZsdrI3PxpN85dhV1/xtES77m
         6uhw3A0EfNNxIaWiMcXZywSdhOutac2Ln0VEbYckQLTWxmfcYLIjuFnkdAaEcJtRP2/K
         1lcqBjy8iDG5z/hpBr/hsuuHE26YBDm4jRm7wO/Uz71RUARPwr0KGEEg8DD6yWxS0RHd
         rTMqaCTXqmo8QEOfjbYsA5lsOFHK4s9VH3MXXM8qRwcBC6FGlJTDCYVhLJpDhceYdx6s
         Y623C9FD7us36V+9F4IOlH/JeyT9PyefITNo/0A0Mokw9ZsZXOxPXoj252jv+jNb2Vrr
         ikhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730709942; x=1731314742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XCdAosn0hUVlp01SX9nqFxjGER1OMRbiVfMoy6WTI0=;
        b=agcGZwWXuLcUqLCuqH2PQmj2/hsK/dzNphfzKOFEPxKU6Txrx/8JCCZBCt4LkCImyp
         irf3J1DknFXK0a6TdNMsMESbcJeRQSkDi3RQ0l3SRpV6dl8lIKBjSdjK0VWAAFJAHuVB
         1GoHNNAoA8E24aH79S8BmStVwkKgXEyzxNGDcjqXC17iSUX8r9jfdfFz2ulSL2sGFer3
         68uVh8+aSUBMN5T9jB0Oc8fXLFoHeMVVuEOpDLmxsBPKc0tWbefbkkcMTLtvchlVDdX3
         0g6K4FG17aY3L0x0Yx+1tXKkHjxjxxxul9fK3kAJUrzZgr8jOeIp10lR0FZT4N981TMW
         9Pug==
X-Gm-Message-State: AOJu0YyJ5gd1NUW8tc8sxP8L5/FcIHo0V2JCkMD5sgiyiS/sAFYxdFfM
	uAryze/yCzElQuIt8uj2Rn3/PptltgAlfyP0zZUcZMd6ucDRpVddDihkU2dX/pw=
X-Google-Smtp-Source: AGHT+IHiXWZPPcp0AxyUPDH1xp1GtNVDcbeVwmq+iICbvpxwIdCRDdmEYCJowpJtkGVtM0qkw9f9wQ==
X-Received: by 2002:a05:6a20:4f08:b0:1d3:418a:e42 with SMTP id adf61e73a8af0-1db94fabb1bmr19591908637.10.1730709942023;
        Mon, 04 Nov 2024 00:45:42 -0800 (PST)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459fdee2sm6541941a12.58.2024.11.04.00.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:45:40 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: s.nawrocki@samsung.com,
	mchehab@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	andrzej.hajda@intel.com
Cc: linux-media@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] media: platform: exynos4-is: Fix memory leak in fimc_md_is_isp_available
Date: Mon,  4 Nov 2024 17:45:29 +0900
Message-Id: <20241104084529.2113302-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fimc_md_is_isp_available(), of_get_child_by_name() is called to check
if FIMC-IS is available. Current code does not decrement the refcount of
the returned device node, which causes memory leak. Fix the bug by
calling of_node_put() at the end of the variable scope.

Fixes: e781bbe3fecf ("[media] exynos4-is: Add fimc-is subdevs registration")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/media/platform/samsung/exynos4-is/media-dev.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/drivers/media/platform/samsung/exynos4-is/media-dev.h
index 786264cf79dc..3bbcab9eed6b 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -178,8 +178,9 @@ int fimc_md_set_camclk(struct v4l2_subdev *sd, bool on);
 #ifdef CONFIG_OF
 static inline bool fimc_md_is_isp_available(struct device_node *node)
 {
-	node = of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
-	return node ? of_device_is_available(node) : false;
+	struct device_node *fimc_is __free(device_node) =
+		of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
+	return fimc_is ? of_device_is_available(fimc_is) : false;
 }
 #else
 #define fimc_md_is_isp_available(node) (false)
-- 
2.34.1


