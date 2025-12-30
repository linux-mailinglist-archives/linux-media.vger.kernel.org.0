Return-Path: <linux-media+bounces-49659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 728F1CE88EE
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 03:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FEC6301F8CB
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 02:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5852DF136;
	Tue, 30 Dec 2025 02:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtmdeF5g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D732DF15C
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 02:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061689; cv=none; b=hoVp9rDXdGHXazvEB3HkEIl6aTua6h+/dcULup/mmnfeYTVY1VXSvEyvL7X7jKJ7E6V1t/U0fxqCxh2WLp2TUQ6QK8Ma7ew9LiDYs5LhB2crHfhp5qe5prLFjaf5cq/zOgdRfFHeIuEobdk2AEXZss9law+SDV75GqajP0H3WWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061689; c=relaxed/simple;
	bh=hZMAxnWL5r+KiexN1e6GrVKsiCsKBA3Ey90h4qQueSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEzYMsg3e88gufzBABh8GcNkDBb5MB/uGk9kg27IeMI5mL/TwqOTJXmY+mDXtuIlZBnQg5LxHMit+lv0Y/urMHhHqhqwrHXBSrhudQQgMFo9RO8dxBsNHSaWSvnFk8UYY1pwsxZaVHIgfCjp3gou1W/lzDX0gf2sTcOA7M8nibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtmdeF5g; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4eda77e2358so84362541cf.1
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 18:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767061687; x=1767666487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Boc0hyaruKu7zfPgeDx+KGd5hDYj3D0Tb7d06swQ2k=;
        b=CtmdeF5gazjNOm2BZfnELhBuhN3h0NAGZqhtArcVccRTTup5immNbsMid4fn6ULxeG
         NO0N1p3+17Z1hzu6HmZP0enxImt/27HZ7tJHwI4i02si9UY77c1tsvjgIMmXlmJqYThP
         dCMDPGbqnXCgFRx1iSxqDsZ/sel3enT4dzSbbmbq98BgoS0yPBmda537jH0s/z7wPCK1
         M7zVBRpN2mz3202syT/xKbskz5Q1P+NpxJKEZRx9Kn/fd0kF8x2NCb9c5cl7VOVMo4qm
         I0YWOXm6NVz9ixHuc7GrJaCxD7Of6/k9GC6tai46V0R9AOMq8k6lm3xSwdouBiYklGLt
         vFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061687; x=1767666487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Boc0hyaruKu7zfPgeDx+KGd5hDYj3D0Tb7d06swQ2k=;
        b=a5p+bFg2aWUY2zfqdWBqR5sEi8gg8fy2kUwGaB/EsLjET7FfROJMzLyKCiEbZJXFj0
         LRchpeWmzV5o7c8lAl8AMi53nUUY2ea8C1IhCA0bcaiHiL2YOmUU6eR2Mv5y4ePjBCoO
         Z9w4EJxCxJbjgfKtrfeW0zVxhHccild1GCIUZkhhd6XEAfNMxM+jLBrFrkNpctQfFXoE
         IatWptBO7qWzq2bTovymV1TMvpjvUx5bMQfIAOSzrTLsDpPGok/OVWfZSpTecbDLyEPa
         zm5q4TpK6U+RUPwmcon7JekVx3l/veSU2/uLsk+ej17EAm9mpWHW7wSwErfJUavS+Td9
         tozA==
X-Forwarded-Encrypted: i=1; AJvYcCXCeVw/Ih6pfoV0uzUOV6fboTOgsUEEkjWWEB2nz+0noxiriK2aOmx0BseGx8hgrC1GE4ZufYrxoeFIRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeIzMI7SPaozKEyh3MPLmqQ+NohVTX/5xIgT3DnR/EdzvPktaY
	Yds8/LpjrVsPqLcmHub1dpO9qykzWk5NaoG0SXcWV8mWlFUwzcBTrgig
X-Gm-Gg: AY/fxX7gnz71uTx63JC3cF5N8W3bxEpOM56AvoNayhwBBpvoI11YyhXks83DBR6uCRp
	CGeAo0F5i5IhOS6nURKIfW7btzi7Wf4mlQQX28trxreB4HXBDTXYV/MjFLFgbfkGymq6bbbVY8E
	FgIfWhB6uu0atRhcagu+fA6lV9p+L6JMoDCaxHE9X+En6E6cMdo3+Re+Hha7GchsxLSwpEzd38P
	V7QGKS+XVmrRJP49J16QLKuff9B/tnqsCBV/Y4w+X3QU7uBarpBwameTFO1l4PApxH83bXHFMmw
	TFYZZbSmy2+MdABNO1tucTT8lez86OujFH2ivKYfiYh0qK5UfAYsljKijGuv9rtlXInjQNVSTDB
	/7cdiDd8CteUb5/94Mwr8heFMiLzRsXWb7uiToZkxkGE7EHjWA3Ew/63KN0tjr17l1rQrlzRQkX
	1t0RbBNyKH3xRbQg==
X-Google-Smtp-Source: AGHT+IFEAMQrwwwqZI6BcR86cj8VNjvEbJgT3zi/3zKCZBfFKORHXJEZ4ohqq/vIUFDgz0WWZXwE2A==
X-Received: by 2002:a05:622a:130e:b0:4ee:26bd:13fa with SMTP id d75a77b69052e-4f4abdd147bmr480786931cf.80.1767061687220;
        Mon, 29 Dec 2025 18:28:07 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac532d08sm229328881cf.6.2025.12.29.18.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 18:28:06 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [RFC PATCH 3/3] arm64: dts: qcom: sdm670: remove status properties of camss endpoints
Date: Mon, 29 Dec 2025 21:27:59 -0500
Message-ID: <20251230022759.9449-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230022759.9449-1-mailingradian@gmail.com>
References: <20251230022759.9449-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These properties are unnecessary and can be removed. The endpoints are
disconnected, but this is implied by a missing remote-parent.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index b8a8dcbdfbe3..e841309221e2 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1780,7 +1780,6 @@ port@0 {
 					reg = <0>;
 
 					camss_endpoint0: endpoint {
-						status = "disabled";
 					};
 				};
 
@@ -1788,7 +1787,6 @@ port@1 {
 					reg = <1>;
 
 					camss_endpoint1: endpoint {
-						status = "disabled";
 					};
 				};
 
@@ -1796,7 +1794,6 @@ port@2 {
 					reg = <2>;
 
 					camss_endpoint2: endpoint {
-						status = "disabled";
 					};
 				};
 			};
-- 
2.52.0


