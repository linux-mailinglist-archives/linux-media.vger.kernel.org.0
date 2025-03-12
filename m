Return-Path: <linux-media+bounces-28075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233AA5D3A7
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 01:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E4141882045
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 00:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5481D182B4;
	Wed, 12 Mar 2025 00:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVHp8Dh/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B068489
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 00:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741738314; cv=none; b=sDWJra9tjuiMKRS4FYGM9Ymyt7fkI4dDvHdvgg7e2l54D9AoAm9k0LiSM/abWbr7jfgzGgBEDphWw0QcTYRbS7PPHv7tyO0iQeMfWEGd7EMaJ4Q5pc5ENHSO5Aq/A7nOtNB7BHiG7VuFosn+0xsCtugrGLbh0+XYRMgcJyHOlS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741738314; c=relaxed/simple;
	bh=Vhpu6RqhN90u1GFEqS8WZ68QyeytV3y1M3LAhe7iHhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzafr6rCFDp6AV+WWFhahRFnaSmLKsdJoAe6KKaKO13St9VW+zVTRgPpUK/MdsoRgJyKVbwNQj1ECtB9PIj04jWgxvMO6udI8wEoyqHQf7xlJjWC1QNWejPis0uDBtMO9B0Nx29USvoUZeYQiDmyDVr28IB6LBqrGJUGmP+d9To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVHp8Dh/; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bf1fa94d6so6588601fa.1
        for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 17:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741738311; x=1742343111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GkhK4viS+WCkr+deNxmeottlEzNcM+YTsy00vrKebc=;
        b=FVHp8Dh/3bSdcIFcKNFTnNc5jw15nxTOgqhN5Gu/6GOHEz9ZNf8Hm1hTZkE4vRFHks
         LCZCsXlcuBSpFqZEaPF7X++Dv+bTFAbjSk0BOgxTo2eHtHJXYiePUZV/m9rWpRtD82tg
         b3gcWSYka0Hz0DrWOv5x74cZeH5pAXaFZQEX7gPNZ4o5KQxlrvT5kQ343lqJLwQv4fv2
         8z7HtpdRu1ocyzPVnz2PofWuOstkuAOCTyXUfSKlrTk6DOd8nj9Zt8WZu5NOGNlrhmZQ
         C8/S6ON+72loHvTCvPSpR9IeCJ30iIQ5F/PD1if4UrXFDEtT4vCFe6y0Vwcj8pDGnznf
         G3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741738311; x=1742343111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GkhK4viS+WCkr+deNxmeottlEzNcM+YTsy00vrKebc=;
        b=E3YVrazxn6avVu3ZervtNV3e4XSnFOGl7oaVOFZjZLgL9oIy2uBRKmTM96nx74QEmV
         vxxzGJbhpkIPSA3vQp5KTISKQ2ZWX65sRhx25ifsLWaRRd3lrteVBdtZB6dmRv6+2FzW
         KVs+KmwS3YSq/s20QE/SfMK3AfoxfQcV4MPuSofFYWdqowli8IKv3HD9IXfXtyNL7zOH
         OIiEwkb2/42ckf7Gagrsvc6IykZrqwNepr2/ItxpxplVisTVPtU+x+fJdZj8qwWELD2w
         FOav8CH0fWym/eoxUXsZEHMNK6etuDrme0fOqNFE60Lczsn4jlxBHN/3lPIUHIhdhxas
         /q3w==
X-Forwarded-Encrypted: i=1; AJvYcCWgZZDBkNvDuDypWEVhVwYCCG7OQtTPm87dWcSy0PZssVBrraP92jaCusu55thPCydjSs6UlDkKYASqbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgYypfi+Rm8tf5BfP2leF0eGG0yOHtWyOab0p3K15HxSIAnE6s
	B8NXlZs/3l2EmZhiVYY+Y/JxeA+b1mGUeOOF+NtK2bCl6zs8aRyMYJ2bNgSA9MSIxNa+yVjKSir
	nndI=
X-Gm-Gg: ASbGncsyHmuNTJmU94KfYuR0xctOY7iZwkkUency/aRjrMTxIjfVqtsx8R2WOO7UGRl
	/RA4p4P0ZNxgY9qz5U9YQsX3SlB7Bc99nbTaPHEdyBZuckSJKqTnNmMgxVmbjZXq5LgMiIOWn5i
	fspRLzFTrgBYeBpKO8s7kU+F8IjWo1nXlbMZTDdrKTzhcFvjm02mY7Myl9ttRxzj0WuOCJWvEGj
	AWAkYkWdv94ZY4f+Y0ndcVekvcYSNwydpVuaNtMHrm+E7qxNnKj9q1SE3SgTMl65lDMjN5aK0XP
	vkWbAriMOq8uOTHJ4+v+M8uzYmQwswZ6eWXsjPqRC4SUdUAw2kcLT9VT8+pjvhGOb3OQvcIpxLQ
	iYrC8wqaf4yUNtZCWZiz0F+zjaLRjmyvTFA==
X-Google-Smtp-Source: AGHT+IE3aGg2miikjmCVfSPDVDV2u4JxCl/JvcqcglMLCCNbR5JO35QkaAxLbPimjVUrfG9XbI48eA==
X-Received: by 2002:a05:651c:1988:b0:30b:bf18:91c9 with SMTP id 38308e7fff4ca-30bff4150femr21070251fa.4.1741738311067;
        Tue, 11 Mar 2025 17:11:51 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bfe741fadsm15984251fa.10.2025.03.11.17.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 17:11:49 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm8650: Add description of MCLK pins
Date: Wed, 12 Mar 2025 02:11:32 +0200
Message-ID: <20250312001132.1832655-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add fixed MCLK pin descriptions for all pins with such supported
function.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 144 +++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index bf5e238a93c3..526ef2ae8ac8 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5792,6 +5792,150 @@ tlmm: pinctrl@f100000 {
 
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				mclk-pins {
+					pins = "gpio100";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam0_sleep: cam0-sleep-state {
+				mclk-pins {
+					pins = "gpio100";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam1_default: cam1-default-state {
+				mclk-pins {
+					pins = "gpio101";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam1_sleep: cam1-sleep-state {
+				mclk-pins {
+					pins = "gpio101";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam2_default: cam2-default-state {
+				mclk-pins {
+					pins = "gpio102";
+					function = "cam_aon_mclk2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam2_sleep: cam2-sleep-state {
+				mclk-pins {
+					pins = "gpio102";
+					function = "cam_aon_mclk2";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam3_default: cam3-default-state {
+				mclk-pins {
+					pins = "gpio103";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam3_sleep: cam3-sleep-state {
+				mclk-pins {
+					pins = "gpio103";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam4_default: cam4-default-state {
+				mclk-pins {
+					pins = "gpio104";
+					function = "cam_aon_mclk4";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam4_sleep: cam4-sleep-state {
+				mclk-pins {
+					pins = "gpio104";
+					function = "cam_aon_mclk4";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam5_default: cam5-default-state {
+				mclk-pins {
+					pins = "gpio105";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam5_sleep: cam5-sleep-state {
+				mclk-pins {
+					pins = "gpio105";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam6_default: cam6-default-state {
+				mclk-pins {
+					pins = "gpio108";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam6_sleep: cam6-sleep-state {
+				mclk-pins {
+					pins = "gpio108";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam7_default: cam7-default-state {
+				mclk-pins {
+					pins = "gpio106";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam7_sleep: cam7-sleep-state {
+				mclk-pins {
+					pins = "gpio106";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";
-- 
2.45.2


