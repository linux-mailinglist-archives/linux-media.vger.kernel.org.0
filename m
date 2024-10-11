Return-Path: <linux-media+bounces-19373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D6E999A9C
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 04:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4C8C1C2153C
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 02:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD551F4723;
	Fri, 11 Oct 2024 02:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBdYW4gE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1D1F4711;
	Fri, 11 Oct 2024 02:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728614269; cv=none; b=nEI/c2AC78wJqsHyR2bCbbqnYo3ihNZf2TUnY8UQOuaLl3MI4uKgXIYdcxwtQTcPu8kZqA7W2ZFGW+SoYHbZjU1QOKqOZu4AyeR2gTxnHenUnrn3KBCnZx++9yJCtQ0YTHwDOrRuL09CjiP/sXmj5V7UN54TT/ykgSs4ecb4itg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728614269; c=relaxed/simple;
	bh=iNlwMXgz1Zvrwnb4TkSSScgraViaSX1xVBcR45JKUVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNkq7X7dBscnW5QmQULVqUNhVOkAq7Vp0HIsMp3lIZMe8FYs8L8EofYsjP4J/mtRjuAtdxWalw2N3xXwJVBc5H7u+9jygGuNwt33JU+g9zfpr45FYkuIXRsLHS81xFLXkqr6ymqzNuE15Jrh6EMTqwoc38Ee7K+Ccw42ixdWXmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBdYW4gE; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4604bd15be0so3782051cf.2;
        Thu, 10 Oct 2024 19:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728614267; x=1729219067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2tZPFFU12WsBefqXT52afAbPfKPX7iOAYmOLQqEmqg=;
        b=OBdYW4gEZ9p7ii9WKxkDZU2h81NNsBHrpIpMCjWcukGppdOoSUou2YfO4TYM9ut17G
         /KotS8mKQ+GpLOEFsIU2xyKkLE0tG+rjditSSdBtlXjCp0/plLY9oiGnipyYBUeujBih
         jvY7606+7/9p07WeoyQSAWlV9cbq77ed6wgJqvVjAzhXAeUPjDU2vpDs6qmm95Uz+XmY
         dg+yusV0Fl2o0crmpNaIgb3sEDNf0LuryLnOTYU5XIiNIqwefYrLKIBKE8RsY4fTtiGD
         zl5wYJqOlSq0wjx7uhsnjSJmSZ1qjg6P4bvZE4DhVDzg0+Mx9zUSiW1/GkZcMU8Yw11b
         ifEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728614267; x=1729219067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2tZPFFU12WsBefqXT52afAbPfKPX7iOAYmOLQqEmqg=;
        b=qQGpW8RDd7rqmPkqJd7xf/S5332ZwMxz6LkZ5d0VPCSCRqLXzopJQrO4dWxSUkzUkz
         EZTzm2hj6orGyb8WtI/47P7yWoxb7xwJqmSJ4fdWZCnv6sYR44TIXBSZS87CMf6C25pS
         nbkk/Qni1IzskoiI1qzYPcIfMfBH+NsbYVVzRGAs2GixWALXRJVC1Kck1gha/7KtY4Ku
         dceuit7QAaTlCLUG0NAi2p6K7mCGRAHWxCYjgrvpC7KZQGKGoMti2Rr4N8L8wqt8HXRi
         mxmihu6uMTJjTaiAO81dX2UoiLnf6pREpX8s/KcPO+Q4w8Y8G1yI45VLHx31ZC41skDQ
         vgHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+gsuCV1W6/YIDlBHM6fbXGSzzmsCQBniLHtP35FA3TS9AbvbACBevF6oNmRr0vEYHeLTjwaJxSjOzV30=@vger.kernel.org, AJvYcCWwcZYTAIb7got7J+lr1oBjOUHYGqLk8ld6Wu7L00MtjIXEvCnk43L1SBZEDmbAk5qu0mz2gG0FnBsN@vger.kernel.org, AJvYcCXEfq6x9eKJcfyGa6WONPsAYdXCeeTlEpwFG8EkAEl0KJ6Pn52/buSuH70sFEmOdP6qC+7V/fosRARxU0cuEA==@vger.kernel.org, AJvYcCXTcpHIrZx4KmfP9cADH0Ay4lsSvut5Z62VO+YJAoH8AVe/XgDZFtGVGKAwSte2U360kHboMKhcpbg4@vger.kernel.org
X-Gm-Message-State: AOJu0YwecIse7ACf25et8CyUVx8VE9MZiIhD5aHmdQxGkrA/8UrhvDj9
	N0ff6LmyGcT+TSnC0rOTajJIrqMEzb04J1vqrZp4f9qiQeXRObiV
X-Google-Smtp-Source: AGHT+IEmt7dBkYdNAHIqbSi4n1ChVUetWqJRtoP96mCtNaFYz2/Ge0wJDd1t4Ed7f3Fop0Vv+NRX2A==
X-Received: by 2002:a05:622a:1a82:b0:458:232d:db63 with SMTP id d75a77b69052e-4604bbbf450mr17540751cf.21.1728614267151;
        Thu, 10 Oct 2024 19:37:47 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::786d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46042802f65sm11295941cf.41.2024.10.10.19.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 19:37:46 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 4/5] arm64: dts: qcom: sdm670: add camcc
Date: Thu, 10 Oct 2024 22:37:29 -0400
Message-ID: <20241011023724.614584-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241011023724.614584-7-mailingradian@gmail.com>
References: <20241011023724.614584-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera clock controller on SDM670 controls the clocks that drive the
camera subsystem. The clocks are the same as on SDM845. Add the camera
clock controller for SDM670.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 187c6698835d..02f87200690a 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1400,6 +1400,16 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sdm670-camcc", "qcom,sdm845-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "bi_tcxo";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sdm670-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.47.0


