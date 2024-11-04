Return-Path: <linux-media+bounces-20779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75DA9BB07F
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 11:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CD8F284BAC
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 10:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0981AF4C1;
	Mon,  4 Nov 2024 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="rHLkj8xA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117BF1AF0D1
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714497; cv=none; b=pNOGmFfluBkn6M9mJfmQWh0fHl00xEoEeWHaWTX/0JDx+ITylP2A9Jk3VgPBRynIfBiRLehmBwWHl5F/+oH730n355TxLXI4DtKqT2A2ZvP739WU/S6MzTv4gv5gPcZ0rMQ6vuFhpyJmbyd6xP8SEanSdBgmq6+8fdOJy16GRDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714497; c=relaxed/simple;
	bh=Zrm6drnbKRKxiZ6HaTfeQdUj3MvizoBOT6103YXttp0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oEkgqH5vdnaoy0Fi/59vvd1enz5nRTFW/RO9XyPK1p1kEMj5e8doEIKc/LwHaPg7UAH12PPF0cYKrsUfnpaOprP8cWkanWtEeB6br0emdk9c5/HPOEXXL3Cqw2N0GW7VPj9NjuaSioXu0k/WciOsyCGgQzf1au3zbhA42iahj6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=rHLkj8xA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c9978a221so39903785ad.1
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 02:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1730714494; x=1731319294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uu/Hn4B1CLfNhyVjR/ZehwHt0szyrEKv0cT8lqo+PuA=;
        b=rHLkj8xA+05SpbFnj3N3igeR7q9pxHK1P6rKg3pQM2QOmVwSCpbwlukmq+zVch6aOC
         UL56GXy3AjIzG5wTbcmYrtyBkiSstwsNdCyFLV2uY/TvIPUn2QOl7nwd+/oMPFFs6/SN
         UCpdgArv95pi2deaeONPAuRDAdqEabIw5p4UxRNPG1uXi6t+58BtPAsDC9owv5BGVhEO
         f4Ns6De/5vJVRMZbA+CmDIdrRACzVMqTPwhykxFluPEeR64erU8zRxVMpaV/TIAxmUQ0
         R2MtVQottBxhKo0htRoFvYLTk4VssAzzd3tvx84Oi3vWY7v6t+uLyIfrslAY8a0hzHJr
         CgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714494; x=1731319294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uu/Hn4B1CLfNhyVjR/ZehwHt0szyrEKv0cT8lqo+PuA=;
        b=j7gfXLCBHPIve2duhKT0++8udzLwKsMrOR8SHT08E/r+xmcE+fAJgsZnt8FcdqUWtk
         ugK7D+CQllXvgTIzA20Ag+YLTBHQlUPWKxH5Svm+7HKTVycvpy+XEw/pRa+yyr3SD4um
         ZVn4o9QN9IH/S4IIGajmw1ItDKcW4hJeEIhZYUMymfktsK9ORpI3I3pgXKHnXyTLqft0
         sc4/oBw3TTnogBGFwfM2jOsiCwg55y8qGGgRyBhbu7U5vczZq4v72KtvjiCt0Ns9hVuC
         nap/xwsKkT6XR08S4TKCnzzZiI5t/AK7iw8qSzmYRz7MVR/FsezZ22UzhpnaEdjz3MlO
         eatg==
X-Gm-Message-State: AOJu0YwQC3QbiFahow164NzkIRoxHwBJ9JqxHyBwqNbsoGqo2AV2jC/i
	RrORhL8wvcVmUYRXOrKdrchqPcJGUTohIr4CWEtenY2g3HLaBPn033IutiP719d1Qoz6UiOtooB
	RKcw=
X-Google-Smtp-Source: AGHT+IHgX7/J/LHam24dB2LrYlnkJ97J5eC7SoQThk8VahXxNPfsknOObvyGLWAwJi3aMDlk5RiHfA==
X-Received: by 2002:a17:903:230e:b0:20c:bf43:938e with SMTP id d9443c01a7336-210c68d3ee4mr460851495ad.15.1730714494225;
        Mon, 04 Nov 2024 02:01:34 -0800 (PST)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a5fe6sm57325185ad.149.2024.11.04.02.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 02:01:32 -0800 (PST)
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
Subject: [PATCH v2] media: platform: exynos4-is: Fix an OF node reference leak in fimc_md_is_isp_available
Date: Mon,  4 Nov 2024 19:01:19 +0900
Message-Id: <20241104100119.2173052-1-joe@pf.is.s.u-tokyo.ac.jp>
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
the returned device node, which causes an OF node reference leak. Fix it
by calling of_node_put() at the end of the variable scope.

Fixes: e781bbe3fecf ("[media] exynos4-is: Add fimc-is subdevs registration")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in v2:
- Update the commit message.
- Change the name of the device node according to the naming convention.
---
 drivers/media/platform/samsung/exynos4-is/media-dev.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/drivers/media/platform/samsung/exynos4-is/media-dev.h
index 786264cf79dc..a50e58ab7ef7 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -178,8 +178,9 @@ int fimc_md_set_camclk(struct v4l2_subdev *sd, bool on);
 #ifdef CONFIG_OF
 static inline bool fimc_md_is_isp_available(struct device_node *node)
 {
-	node = of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
-	return node ? of_device_is_available(node) : false;
+	struct device_node *child __free(device_node) =
+		of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
+	return child ? of_device_is_available(child) : false;
 }
 #else
 #define fimc_md_is_isp_available(node) (false)
-- 
2.34.1


