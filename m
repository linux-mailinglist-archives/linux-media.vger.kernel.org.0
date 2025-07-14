Return-Path: <linux-media+bounces-37674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D99B0435D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 869D04A0EBF
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188D425D53B;
	Mon, 14 Jul 2025 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p0G2je50"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E68F25C80D
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506181; cv=none; b=PuVGqTTkGaO+b0rraY+iCoPI6q659wiVIHWqvFlMs+97ilJWKI/GKbGuGf4D8j+OKJApPTBdjMwSGN5uj32VuXVh2yhP/a6TUExCpeuM5mqUn6nP4fAn6DKsX4Q4EwRxSI+4rLeRvchxunOSwa+bq6P4GVw1H6XeLhOANs9nX8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506181; c=relaxed/simple;
	bh=5SEmN81j++cDBIFvkv9n2aotAYscERc+zZaDKLuEifk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HBCcbrrRG6VETL8R3DWvNA6K4dTJf6SSq17mgksRkIPl3TA0e/8c1Wpz2VEb9j8/JDozXbwlXeCIliG47d9PkAtzlEXuXPv87fwsnOco1R6Qux9lVytpHrmuWkuHMzWOQcDeHlofxGPlVfSJB0QO/FzRkHpKlMzZktYKyo89XKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p0G2je50; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso644788f8f.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752506178; x=1753110978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7sCtPxfaMjoFSfs4MFDmQ8NiKqG4DUPOXp+rPZHPqE=;
        b=p0G2je50+cYBQD0Pkj3Omw7zDOKtrMxY+oUSCdma8ej/fpywNMvN34RvQlbwJcRpy5
         REXJS4MM9pSRRHMKQowQcDjJexhYvMB2qq2b7U5uRZJzQXg8H7Ih02D+OEPjEYINbuD3
         gwlUKLyOEWZkl2n38RbZw7cxjs/RmY5rwys8cdMfziBI9In/kju5YFSrG0CrR4CdoWw1
         78QLLQ1fL0J4IS0GevGBxBqLxFXMC2dAwn0NDSqL6F8RXC6wOc8UlTVxX7GNPko6TJ8J
         5uK0CEP3up5CuYuXYJEmOaHwpYw73BJlT61g9/+aXpIztgeMFlk3eJ5nkp2HPKTo3GdT
         q0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506178; x=1753110978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7sCtPxfaMjoFSfs4MFDmQ8NiKqG4DUPOXp+rPZHPqE=;
        b=FjkQOHf6aA0iQqt2V8CVm6QVbK2PzVchQUPbnS/DbH+5G0dmolTIx1Qf8Kg1TPkZXx
         gS+Ma8eAEu5T8JtAbs9PeXMDN50GtVxLJXPb6uEDoCwurJCMIxw6Ka6537rdFEu99K1A
         2K4HzICPZnEliMGgvEMcHWR0OAufWjMhjl8lJp6tiiVMsq5+YFCg1bQgovQ7LudE+qIs
         Vnx4WEIUF6JWpAZsQ/1MGLY7awqAAHBNkhL9ZhDzopIEukOlwp2pGjOldV96rj6uGw/1
         mKRlO9Hg17JDa2wo3nnpSWw6qkLNXTcEZ8rzAmiPu1Y4KB2gDqznqOyJuqaImx7IpT64
         iznQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGU2y3/4AjYDtocN7EaUtqV8ZO192KsDnSlcMneBrW6BG83r60ha2ne86OwBQTtEf3WLDpLXoc+FhxRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbf1aQFoWpyGfWQj4PTtxMWMEg56T/mV6Bc7TxI6Ii9IO5tDGR
	0bDXJEFiWEN52matH9j5TjFesOz8Y1/i/riJe6TiibNBYnl+vT2GoTARWmdDyu/mf3Q=
X-Gm-Gg: ASbGncuMBO0Mdes9z6aXtGrH2tt+8R4ouba0hOYhlzhKntqcTW+hwhIodBA08KdQ+CC
	U/xKPCGZ95sJ5yhb3FLIArjCaAuqT25e7PhOKhS6y4d3cfbBCup7BYZeIARli9MUiUZeYdn/1g4
	Lu5g/w2XO7t0TenuB5hYZfGYFuGGLPni/iF9qDRibZB4kpPOt7m+pnUTSkJ/AuQs3jni5YZYtPS
	xAfB/bLN6zoZH+XaB56dWTVidy9VptRU5x8PubjQHwSJFFMh4ZcN5pnjniLcvQNFcquABqdm7rS
	udhyvs7ioI6URz0rq/bj9329hxA78cyTYFvQZ5BMKpXAkC4i5V55elrTrB/S43waciTgMAiDtB2
	7q6N/J46wckZyfv9SDxXVng5AjJZjnzBOA3g=
X-Google-Smtp-Source: AGHT+IHpL4WiPXA7lF0M3FZSr+pRwaq/mQ+o86j3tdbjJ+F9gQ68S3X3x2/bhMtUi+hXfsOAWMSEsg==
X-Received: by 2002:a05:6000:410b:b0:3a5:7875:576 with SMTP id ffacd0b85a97d-3b5f1890dc7mr3123868f8f.1.1752506177716;
        Mon, 14 Jul 2025 08:16:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm12970388f8f.38.2025.07.14.08.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:16:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: bryan.odonoghue@linaro.org,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: iris: MAINTAINERS: Document actual maintainership by Bryan O'Donoghue
Date: Mon, 14 Jul 2025 17:16:10 +0200
Message-ID: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=5SEmN81j++cDBIFvkv9n2aotAYscERc+zZaDKLuEifk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBodR85KovBs9Byw5IM3Ko1TPG7MkwoC4nasQNwZ
 S91rcu8eeGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHUfOQAKCRDBN2bmhouD
 175eD/0QEl43ZipiEU/g+okr5EbElD01rJ7qQvSMis8Mzn0HeZVPm/S+WFVVLhiUE0OTyMSH1TR
 JvNkX8tLNPBQI+kuh9q5vDEEtIfhbZYF7DG7n1EWPoykST725tMcdVKdTO4ayNbGO9uD4ZOggMT
 r5567tq+S+D5it9prHYoCMVd5O7W6ScHnrpRUsUk9lEtIvdZYaG5ZOq2/iG3acmPVrifkmmeB4e
 4eMtljOXC5fFo4H6xRSGDfXvTpVpfk3gzgwoSkmvXKGaMTC82HsEYXH//6Odwhm0tnB6vRNXnZ2
 cqs3xT7bwdOPyDho38csJuTju8d8CvM7uqQoP/T8KT+KrXdyi0DFpb3/dNgBdp09HT3Pk+QHLIq
 SCtHzRejs5v2DOm6k7ZR8WjT6Cxd0B5yIQ8/zCVYKe/SyUy2h8cuY0UQKuDfpLkUmdW6fMX7dmZ
 CRyfueVtw1CkZ4aHRgpwv3OOdDE9ZsvyRz93acmJX3rQaHB6+ecPGNlLX/Zz/oi6y12aWlJsnWK
 lbhKQaOHI4gSOEsYHlUuyXVl4w4HoALVKqeQcEJcpfSH0fN2I/+eRcTbc6w6AaxjcDwHaxmo0X6
 Aij1ssTPItb/AEQ1Xr0EiYwlWanzHEsZB3Pj+q/uHqMZbP7vVUkGkbCbbkDdCy9CBDyBy2LstEG +8Ee1VYHQcguHNA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Bryan O'Donoghue reviews and applies patches for both Iris and Venus
Qualcomm SoC video codecs (visible in git log as his Signed-off-by and
in pull requests like [1]), so he is de facto the maintainer responsible
for the code.  Reflect this actual state my changing his entry from
reviewer to maintainer and moving the entry to alphabetical position by
first name.

[1] https://lore.kernel.org/linux-media/20250630121704.260831-1-bod@kernel.org/T/#u

Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 40831ae42296..f56e40d9b3c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20678,10 +20678,10 @@ F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
 QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
+M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Abhinav Kumar <abhinav.kumar@linux.dev>
-R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
@@ -20750,9 +20750,9 @@ F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
 F:	drivers/usb/typec/tcpm/qcom/
 
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
+M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
-R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.43.0


