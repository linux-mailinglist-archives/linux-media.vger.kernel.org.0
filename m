Return-Path: <linux-media+bounces-28240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C6A614E5
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A14C38826EB
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD8520371C;
	Fri, 14 Mar 2025 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncarldHI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED070202F9A;
	Fri, 14 Mar 2025 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966193; cv=none; b=tz/C17+ghFcFjxw6yyCAFNHSOo1h7lVFUupI80wPPlJ4HjBllUgc2mPPtaNyixyfEHBW8GHVGUwiANWKFs0aVpr05wMWuRa3rvtHtkBrhh3BcpF7nNbv5MnzX9fuSJQwZIAgM5iWbHLn7hoVRjLhRl1xrUnOP8+FvIZeX9NVLIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966193; c=relaxed/simple;
	bh=dDfjSEMJqcbiFRRTXRgiBy29koeayW0JN3uv77D2LIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=coY2gYWOsr9Wz2lfnKYn/m6r7FK92lUBkBjKJCfgAtB9QJaWvUHs/ahO5hvTx5ryBJAO/Nc/yGmgu3rW4ZqeX9ymvY/9QyNutCMlLCn9KQua8ezN47a7tyoi0eIx3I3h068rBRe/i+2k8VQ66li0ddySZVUCLjaIRVdK+Gy0K38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncarldHI; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30c461a45f8so13563981fa.1;
        Fri, 14 Mar 2025 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966189; x=1742570989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+KjLHCq3Sx2kKjWPeGqmXEWfZAFtx8T+aLve8LuxuM=;
        b=ncarldHIG8NIB88IQ2IHHVYNfQwCDin5d+1xVKCdwYfvBeUYtGAu2cgCYn5ueIEEjS
         7zYnerUkSwxo5KTZ2czeY4efq/KyGvgePnbf3FYsbUqV0ZxJorDfsMijYK3iTSIaxKaa
         Y4hn2r+7EvUGab3uLJovMGVoVYN3d1yvVlhh3paRWEvpqeqD+GtPUwA6w6liI+uVcS51
         976ZjgWbnuf3Dz8HN8u/lBWboRKbSImzZmpREF5yK/paDRhnJUjZgvsjqZBw1d8mFeSu
         79DwIPi3taI2hyxDx1DU6t4k5groJqDlicleCEn5IDlQclP/AqNBnasQtmXteK2JvI2a
         pp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966189; x=1742570989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+KjLHCq3Sx2kKjWPeGqmXEWfZAFtx8T+aLve8LuxuM=;
        b=MaHG5TgiOekxYjTd7kMoB1TKceekeFM/+bafrvDU+y4OmNxdUxQi94JfgE97OZpuk8
         cEBLKBRprAXAUGI+aEkpg6+1Eu8CSPrs2+7qj1CQsQE8anZQpWd6DcJO/tc3WpYQaPIy
         VcxBJvTqbLQj1GyBJLSz0eAE9659TYvYsZ0FRWW9Z0Z7NjwUaYaurbC2pMvuQ2oydqvY
         JAts+Hz8Jx2+jZE6Kloq47rWSdKWtA3zP2ejuPN2KIrq/3N7pLiRGUQha41txhbZyBdw
         OurI4o8PrD+ZhhY1R34x42CDQO5Hpse2o7j8Sn09RNqdYBJdnWYXEMh7ZFvyWki0+VvK
         FVhg==
X-Forwarded-Encrypted: i=1; AJvYcCVYmOSWZgxZjHnedQL7nl6eKc+i6r4iP22i10Ic0tqYXgqoltDHjuRbZnCnhx/zSwCbERVTcow1ungaySo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnCEAPK0ZX03bYqelrS0hIOFbCSMaVrup6GnxL8HhjXKpjS7vs
	B32NRr2MmcaU5L6Z2vQZsw1F4yMnq/N0ccKO65sBEoBvnfXZijOpF4E5o+eMC78=
X-Gm-Gg: ASbGnctnK3aeNV+o+zcEQ+i7X3JOHTCAfHWyicsGCv7hY18Y+NVby39wN2Q5OmhmGlo
	R1mYdp/mI9lJpOEka3jDKKo0kry5m+rZtuvadECsdXYNX704OSlv1ZfE+OdgKJOPP1qrOQcBFPt
	Roin5e8cBKOLgeJ1IkXjfva0mWwgxuzWKOnOmI+YEPhCop/FV8gJGB0Np6nth9PEh0r34mwpvHB
	foGOW7R5qBvEGbmzqWcyd/aqSte9fz4HmlDN8SPF4xcmJccHq5idHYSK3wXYsVfDMwCIklOQJmY
	hZQrXNIQiPyJaiE9UugPCMvaRx3WOk+NYbrG+HuTGmjC4sCi+cwZF4PELCrpxe5KQK/B
X-Google-Smtp-Source: AGHT+IFt63GiJvYRhTbIvjnwU/PlkPSNrf5lKrSkW7Do/SjlTvnqNK4g893isi48FwqEKoOZwM5BoA==
X-Received: by 2002:a05:651c:220c:b0:30b:cc6a:fff7 with SMTP id 38308e7fff4ca-30c4a852e04mr11269241fa.6.1741966189312;
        Fri, 14 Mar 2025 08:29:49 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:29:48 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 03/18] dt-bindings: media: coda: Fix resets count
Date: Fri, 14 Mar 2025 18:29:24 +0300
Message-Id: <20250314152939.2759573-4-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Yakovlev <vovchkir@gmail.com>

Change resets count because now we use get array function and reset
signas may be more than 1.

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 Documentation/devicetree/bindings/media/coda.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
index c9d5adbc8c4a..3cb0e9afc100 100644
--- a/Documentation/devicetree/bindings/media/coda.yaml
+++ b/Documentation/devicetree/bindings/media/coda.yaml
@@ -60,7 +60,7 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
 
   iram:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.30.2


