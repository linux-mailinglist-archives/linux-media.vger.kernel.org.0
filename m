Return-Path: <linux-media+bounces-44723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF77BE31A3
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 586A14E135B
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 11:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C31932A3C8;
	Thu, 16 Oct 2025 11:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UM9t36tz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A463C31B105
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760614543; cv=none; b=VpYNovrpoRGLp3BwCJKwJgmNtRxScCytvo3pTYZ0e7+z/xxSvatYp2lx/ouLwXSwBJSTd+NFwZcvDLEQQlkDZ5adF3gwqqvBgbL7EcmN04aPLvndRwdorHekDAEjybMUDuyYi5MpWl+A73v8EqGXCZddEOoP/BfghR62dA4shVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760614543; c=relaxed/simple;
	bh=gf8H+ukYIbgROYGzqMkJ3nKfIiaJaTqo98lw8T1hC40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i7PAcHRODYkBQISzKPzVwGvrJd5N7bcqOSXiR+o6MzgKc8w6AYwFsyePJ+SqSDg2s+cPmx4UcjHcQ8QrX9ScZx578ndPKAOqLDJ7Vh+ip5pf7Hl3V3fQcGXot41E3FWiVkzlLS6l3nQ8BKKMlnwHSNatOCNKxDJQxHrFLwsjtiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UM9t36tz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso1149987a12.0
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760614540; x=1761219340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mff1komaHzKy5qamReWqnHNEDw/jb5nxHAJoK7B9V8M=;
        b=UM9t36tzrlEtsafPLgYDmM2QZbfpizZOI1F4qKwfx4qcBqVYsz9AW9A+gAgvSV1Hzh
         jRUzoOJMyAm9OH/5sFP9sSU5DYtruMRd0ZMwauxAdz01X2/4L5ZvgDgSVA+tq9ADNRYq
         r+oymLBpGVk0srjcHDsE2aNGo+KmamumOXtu+fs+7Tsc6h3WbxBaopQtDEhgEW0LTDCI
         RhI8SALGEI5Cm/JgIkytZaXHGAewOh6JH7tz+2niQYHG8sx40oi8aZgOtEVql0K0WMku
         8nRMQrs3IsEfujkTMIJQTp29MJVgYd9VNME8GsYRfeSsg1i3+NjHM3HmwwW51RGfDfcu
         WLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760614540; x=1761219340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mff1komaHzKy5qamReWqnHNEDw/jb5nxHAJoK7B9V8M=;
        b=Iszal9EDuurzQVf1INJizXUkkGaOldHQjHO8mYYY1JZIjrIAB0gt7mn66jm/u0CA9Y
         N2P03QiKiu/+VSRrxCUq75iOsN+gglc43Nz1O2U7x1f+h3rxqBMcMhsNio38ICXYlOSg
         S9l1WSK5taAVTY6fn/XBPFjWadHrBr9k0irfPbcainLRHx1oN6L2/BK1WlDi8DUmlU79
         PbumG8ZECaEXSTNFixcqgLmwlI+oO2Pe5wnyGEV/hovsKZvjxIjKcBure74GLOL4TUMs
         H5HDKHi/YdtIGaiHejv+SpMJlYD0YtTKAv1VkW5byCh7/lMIZW1uZzXr1MxNBX1N2EGz
         DKCw==
X-Gm-Message-State: AOJu0YzFHJD3YZHtBW9P422o7HoBIrThL7TLr4hyehsODKdgC+EK9E+S
	4sQq4HSoeY9Xl5Snlb00Lwey5wNaD0Ab8s/xStvgffgt+ig3K5meofXiTu3ze2fXE+U=
X-Gm-Gg: ASbGncsYh9+FCL41otzXBkACPT0eHQwKDgNCKex8uPemW7tFgtt2Wg6GnotLR1WzArX
	4vNLL7jY2IfL5IaB/kcsztx3baczi40Dd6w0NKN9F5zRf9TulehjGOPzZyXskZwLmpTfsAXrF7j
	PlIhJXUMbJhIpwbh5j4IAOWkjhirKmtM9hwyKag8fb4481i54v0bLwG1dFQFVgvrs5KLAOQfGW4
	4GbG6DtECY1w2JWlboEivxlyLxdHzOkpUgJTDy6DnbEL2aFqr6cdROV5FVmU94SgD2l6De/XHyh
	/3KNKgI5FtuzwuXCMC/05ZlOmQt6k91u9oUl65twUCzJVOGqum1WpTHHgNbuoRRurp+DHZYPakm
	k9mNgm60YI+F2A0zaC6P5meKNWz+jqLS/4+KGqQe76MWaMhl9ZbJ/+1vfB0lxQHmzgk+atYE4ze
	DDycHcl0NIxrvTc8rOxM95xktpK3o7NFM/jE6rYL+z8HDoiuLLy9OVlWz7Ew==
X-Google-Smtp-Source: AGHT+IFt0wcc7vVIDScENVCFhYLkuARX9ObN5Qzs2E7dwGXfe1HoldJOiXObCCcu1OnE67EX8a55JA==
X-Received: by 2002:a05:6402:34d5:b0:63c:eb6:65da with SMTP id 4fb4d7f45d1cf-63c0eb6688dmr1482472a12.34.1760614539709;
        Thu, 16 Oct 2025 04:35:39 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b1e89csm15849397a12.19.2025.10.16.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 04:35:39 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 16 Oct 2025 13:35:24 +0200
Subject: [PATCH v3 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 pull-up
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-dw9800-driver-v3-3-d7058f72ead4@fairphone.com>
References: <20251016-dw9800-driver-v3-0-d7058f72ead4@fairphone.com>
In-Reply-To: <20251016-dw9800-driver-v3-0-d7058f72ead4@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760614534; l=1033;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=gf8H+ukYIbgROYGzqMkJ3nKfIiaJaTqo98lw8T1hC40=;
 b=X8KaIXCiujGBnMpRRbzNWlyFPBpu3tG4PttYXtjNEuJe/QimnhfHsEz4b41csRGR/uwHk1LHu
 zE6cviABJz0CvJVuEykDIOw8aLaO+EJOIwjbffq1k9qyj8MN79c1158
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Enable vreg_l6p, which is the voltage source for the pull-up resistor of
the CCI busses.

This ensures that I2C communication works as expected.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e115b6a52b299ef663ccfb614785f8f89091f39d..2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -749,6 +749,8 @@ vreg_l6p: ldo6 {
 				regulator-name = "vreg_l6p";
 				regulator-min-microvolt = <1700000>;
 				regulator-max-microvolt = <1904000>;
+				/* Pull-up for CCI I2C busses */
+				regulator-always-on;
 			};
 
 			vreg_l7p: ldo7 {

-- 
2.43.0


