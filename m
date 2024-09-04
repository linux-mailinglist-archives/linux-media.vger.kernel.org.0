Return-Path: <linux-media+bounces-17592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A92B96BD87
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 15:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F32EB1F25982
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536971DA2F4;
	Wed,  4 Sep 2024 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UW7YqvUm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD81DA0F7;
	Wed,  4 Sep 2024 13:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454904; cv=none; b=ECUPxBjrmf+bqeXr72WnpXyxk+qlUzNxDcD7XIAij3cBl2CzuMPA9XC6CV7yvftCVg0PHLUNMTvBw1Cs+A8PWTpff4RXj3lG5WMvmG3/lsJpD/0IM5fqd8f+jSTXZxWtQbsQn3M5OkVkAro9yrF2vKarf8lnBh+7/3o8N2G1RYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454904; c=relaxed/simple;
	bh=2mmPu6E3U48CJkFGaSnqdl8PTyiZGdtKNei8l8N2vpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bdM+qIfteVJivohfMKjYUAK7eY/KX1XO7tXtZcOxyY314NSSjvl0YyiiTevoarI6EFt/9agMEpsSfj+MWvGyzSGCpcUw4cl8BtrO4P33d8WY6B6HmqwApxwkRQwccC8aeKLRF0n7l385oTN0Hif9pP+re5mROa0wYEHMNZ4aP3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UW7YqvUm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fee6435a34so47978935ad.0;
        Wed, 04 Sep 2024 06:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725454902; x=1726059702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RBltWiWSywERaHxg16ZAEqaH2LpVIFn8K1A57sAsz98=;
        b=UW7YqvUmxb6mFzbZKwn7KFkCk6Pp2bVeneAyvP24RsFGmc7omZ8MnVMC+drhBf1iv6
         bMCS0mfSa0Ccjk5t+5OiNEw6ov4O55cVhRLoS8vvmRz453oxFHYhB5QkL8N7D5ebvPtE
         64BDcAlfV5EFRu0OsDdewPqANaEWG9oeAiiCYscWlKeTt4cYaMcGIWc5TMb7QhkCbKYg
         mh532JwsG/fPc7Hb/MScxzrbMoc3nWkdGXEkwUouKR3/qxojCellAriNHmWcCyuJBPHl
         1CLukj7TJOSsAqtCT7zqEXS+rPJWyrGUPEkWQ0tMbMsGvgReSDj2QDwKy9rqxFQJMmHD
         IY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725454902; x=1726059702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBltWiWSywERaHxg16ZAEqaH2LpVIFn8K1A57sAsz98=;
        b=gGETOqyYNZ/ajqrdp1KIo3ZrmJLFIMbRm9BVBEoofEuAc/jr3BXU8kioqmOU0tAPhY
         nq0aLtFIjrAWQiZx7IN3sWppKgn3ztkTHIabaPPIYE6QIoXR4J4fG2wi0WwUonnULsxP
         iIpnbx23L2V6USxEbDnCnrLICF8ECM9pZypN2ARRmDRLdPFH10qkSLoHJu+ASxmXrQ5L
         Y3Ol8/4z0i6pmtAFodq9IKX+CqfGxBMHBh5D6rJ8GtgNJEIT259e6BA7LAVMDHRqBlTr
         s91hIbxVFf+evod60qiYdojO5jHU6Hl+eZy5+ajSn/z+H8f/IGQhPvff1MjnPwpMBxHf
         SMsw==
X-Forwarded-Encrypted: i=1; AJvYcCUEHsZDX/x0+OlD0+wMblt2/GnJiR6EHAnGh4iaFRTTAu3zFo/bKvk1BO0IWj+hPA8DWNQaVU1YdJJjK/g=@vger.kernel.org, AJvYcCUN1UyN+YiFfJKBHozokUkxnvXI60adA0SZhLx0sOmSRyz7Son0CSDB9kz1uxIy/2tyU89zbvEBcQXL@vger.kernel.org, AJvYcCVRAeT27QnNe40uTyfQpBd3BTx6HOs7l5x89zPG5YMPvw8N/x+1bu5zVlWE4Imf+3RkfDQjsFO0lgnenhcs@vger.kernel.org
X-Gm-Message-State: AOJu0YwmhhAu1/HCbgfHZkNke/et5D7iuoVjMrxr2UUgQfwdBIkFKD80
	AYobTw45ACPfg3OKAwyXA4FJgBDAbsBbYkUTmVygCZE7JdgeqFZL
X-Google-Smtp-Source: AGHT+IFACE8rU4MTmISbcF4L6lzcmk1JnhTCDcrqcYjiIZ4IDpiN6kQ62qA1kr+r/u6WI25ih45p+Q==
X-Received: by 2002:a17:902:f612:b0:201:f0c7:6a00 with SMTP id d9443c01a7336-20699b361a4mr69807395ad.53.1725454902249;
        Wed, 04 Sep 2024 06:01:42 -0700 (PDT)
Received: from eleanor-wkdl.. ([140.116.96.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea38eb3sm13147565ad.142.2024.09.04.06.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 06:01:41 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	paul.elder@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.or,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: visitorckw@gmail.com,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [PATCH v3] dt-bindings: Fix various typos
Date: Wed,  4 Sep 2024 20:58:11 +0800
Message-ID: <20240904125812.2761993-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a typo in media/i2c/thine,thp7312.yaml

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
v2->v3
Corrected "interlaved" to "interleaved"

v1->v2
Fixed more typos in dt-bindings files

v2
Link: https://lore.kernel.org/lkml/20240903164242.2188895-1-eleanor15x@gmail.com/

I've dropped reviewed tags in v1 due to significant
changes in v2. So it would be helpful if Laurent Pinchart
and Kuan-Wei Chiu could review with the version.

 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
index d5b930524b53..535acf2b88a9 100644
--- a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
@@ -16,7 +16,7 @@ description:
   can be connected to CMOS image sensors from various vendors, supporting both
   MIPI CSI-2 and parallel interfaces. It can also output on either MIPI CSI-2
   or parallel. The hardware is capable of transmitting and receiving MIPI
-  interlaved data streams with data types or multiple virtual channel
+  interleaved data streams with data types or multiple virtual channel
   identifiers.
 
 allOf:
-- 
2.43.0


