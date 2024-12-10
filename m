Return-Path: <linux-media+bounces-23123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6A69EBF6C
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 717EE283EF5
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC9122689D;
	Tue, 10 Dec 2024 23:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+XxZ3qn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96F71F1932;
	Tue, 10 Dec 2024 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733873760; cv=none; b=Kys1lQrEcwnjFKFqaNmfAHUWs7EM82oYaghALHm98tLy2GeA0Ih3i3uOXBa0uggM4v1MNXktuO+0rbCEjgK3yi5+bPsuEYJzJd+oB2ZNIyfSzmLxjcQhw3q7d9bq9FCfwRQjI77hQzvOoXDPIuGvkUZnwkg0Wf6omee2FWBj0c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733873760; c=relaxed/simple;
	bh=cA8ia9gUiiYNXiF6cnwGU5yb3IDiwQmbEW9UlFxwV/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfgsBXG9Rw8E3oR/Mm3JFl0S/c/HWNldEIG1ZLv3oQVKleuja0f99Qfe99YJoNCL35suR2iQ4blAtcrsBAQc0KXaEtKtJxRXMVN0RIpqC42nXrTURTo0uSvItxAK77ecWYViKdUNwc2pAx9/ocaZriv1SWW8aOLZgXdo9BxM2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+XxZ3qn; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-467745731fdso11140121cf.2;
        Tue, 10 Dec 2024 15:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733873758; x=1734478558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riRl3ZaZxwmWu/pRGOcAcSHXuWSTMJ3QmPDQGJ4LbYU=;
        b=i+XxZ3qnGq+xHW4LhhxBA26Y0OPp8DNrcH5yNsoee+MqIs1FSZ4V7ydO+irw2go+D2
         REL6xw1/JuwteYm/oumxRBoAFll3hy3IY2G3jaZqgK9ao8FFjhsOJ03qAftvxguX9zGr
         Nfi9FAGiEnq0rsAmGCh0PlotQb69Fn47p09IZZaQgEBSFfv1c7ZeLKzBumI++dsPac7+
         yU6/INn1gQuSrTM3GcK00eK+qpE/mnOe4TxU27v09gSmsu0c3UAwhGRd3b2v57w2ut8q
         eI/LFWr9IXp4tnQz1n/YEAoeh2+nkqqvLPner6ptf6drUBxOSpzswsTr7B/JeyqLjTJi
         q2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733873758; x=1734478558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riRl3ZaZxwmWu/pRGOcAcSHXuWSTMJ3QmPDQGJ4LbYU=;
        b=tRjq5a9EbZUPFCL7zZleHYp5GTpM2MiN22/s3o9UFndQTv/ceKAxIZe0tI+so6FFGm
         vgl4fMDhudYJA9rHf19ID880SRt80iVGbEbpU5kUq/UcyhJxqjH3euD25BgV7g3AQ6H4
         yPTj2tg/jnupF0/fI1gWiX5KmeRub6fSbS3zjA1iNray/CGyukGybkfoayBGrqBAw502
         G12AMLnh6fKn7MB82/mYVisapSv847eZ1eXaL++cxgyrc+y6y/AXEHLXyKzUJuA5Fqk+
         ep9dMw1PbijtamP8/qIdnASF/X3uRL4yZiyheWNewLBqlsgmV/58Rv0ioVkqo/54feD3
         c/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUKoDlJ/s5bzgU/rTQyKfDcVjxTmLdAEUeLkD5a68hMYC2rvMrzBsgz0Cjo+RpOYWMY4/wx2Bg/US/TKqQ=@vger.kernel.org, AJvYcCUMw5Q9PU+VXE/INgioz6MfP5kNw3lq+xbCZ50Ng8haB/Pb/inoBxLAnnCswBwFGiqKhox8XI1qlM8F5GWflA==@vger.kernel.org, AJvYcCVczVL94DO6Z2EcrtlfnsulVJHrkgtwbmZVwBCcLbRSEo+xvKNF/jSVqD0jmtahvYFAMToN1H9WBgUx@vger.kernel.org, AJvYcCWCwuGOZEpHKvFXu38FTC1xxNvNoJU46EwvK7W83tNDRKRKI2ENApw7YIhp/ZQBzZKiAaeh0L+qKkg3@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGO5KNQY4a2jtIs5z4okcwre/z/ss0vtjMDqMtiJifA7+0Fsx
	MonJJpsizXIl+od1D/b5iB0BgZ6V2bVEuCyVRVhB8rNpgnYoCj3D
X-Gm-Gg: ASbGncsg1hq+Dg8ckc0WUw3P7X5cZZwSaBw6C1iA9ZE6fDM3piVpB3oB3fGfPpfBzd8
	t0Zr0Y/bMV0kCqiKL95U08Dy6WleHuxmfk+8NYtGUsXfHuKDCYxL7gVoTK2ZCTiDWJnSPXuUx2S
	4P4zHhmYuMrLw7RpirBG0T7jW9RAJt9GRklOaCXrbKYQFqTYYQflveGlNX03l6/mSKtQS3KBxqH
	g0tmyit3uM08XikLjUPQLeHPECaBWjN1p49HKvEXg==
X-Google-Smtp-Source: AGHT+IG8bQpXMB4K78RniAOkROkYshe2jwWRSyk3U26ua6C10ZSahucB783jNSOLyRByYNJn/TShcA==
X-Received: by 2002:a05:622a:164f:b0:467:7725:8b69 with SMTP id d75a77b69052e-4678939d7c9mr14902961cf.40.1733873757716;
        Tue, 10 Dec 2024 15:35:57 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::6d3f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46782386ef2sm8631871cf.26.2024.12.10.15.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 15:35:57 -0800 (PST)
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
Subject: [PATCH v7 4/5] arm64: dts: qcom: sdm670: add camcc
Date: Tue, 10 Dec 2024 18:35:39 -0500
Message-ID: <20241210233534.614520-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210233534.614520-7-mailingradian@gmail.com>
References: <20241210233534.614520-7-mailingradian@gmail.com>
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
index c93dd06c0b7d..328096b91126 100644
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
2.47.1


