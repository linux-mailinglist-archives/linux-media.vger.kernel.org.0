Return-Path: <linux-media+bounces-3170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D51578226E0
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 03:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 741321F22A5B
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 02:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F67C747F;
	Wed,  3 Jan 2024 02:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u22h6Alv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017401C14
	for <linux-media@vger.kernel.org>; Wed,  3 Jan 2024 02:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d5ac76667so51137615e9.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jan 2024 18:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704248319; x=1704853119; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=muhOU9sgz4QGazZ/rfni9jszPeW7tQPyUaLpLGDrUWw=;
        b=u22h6Alv9fiJ0SWaZK8rR2F0jHgt0QcmfKzGdlq5qSewci2squNtNiHPg3ey1C8edP
         i289Y1odwhFBRmXDlHvVNKQXyiP/mGf7fOxG47++svR9As7Ug2jfWl1UavmEG6E5oZZH
         h6j/KRiRAq6wTng6GcWbO3QoYtBKwfzf0gHcHsn/S0ekQ56Bs9Vp8kWrT4gUIo4iiZpG
         SzCjF47sG7WGKpi3/E+NHEYdxCKB9r0K/x3icu/StHZMDZYr6wcQl5nD3E3VNKpHxRaI
         bRh4yb+YEbGM2pUakn3RDLKq80Zqf41Fxz+ynY2C/EXXT9NQQJEJrSr0vPZEonQnhmbu
         tECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704248319; x=1704853119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muhOU9sgz4QGazZ/rfni9jszPeW7tQPyUaLpLGDrUWw=;
        b=AhgtE3ByGyqH+8V5SRUG90SC9rUBoETF+2R+H1MMIgrN7QKT3FxHLVq4rh6uBpguSG
         uXLKWVbrT9Lsr7I9SYQkWSRXJ7BQGcKmVAr5Geb5eIuuJbFsysEhzXE7rKot8MDxND4k
         N16wEtEqxGTH9zx646QBGzho0SZptvuhW3o67ynmoqDZMSOUh2qhCAVHvNG3+14w7rAP
         aKmI1fR/OvrhFUNtBgCbhr7WlXRqp8wvAyB0BlrmF0srf7JB1ZI3eKCg42EM8RB/S2Ji
         acQBULHWWNtgZlyxS5swcgMV0rLf+/nMuutDP6eA1pPZ/cNQlRRnSF1We42RgYE35WVf
         w6Jg==
X-Gm-Message-State: AOJu0Yy/vwXl2wLL/dVECSPe+UwfXBqjXOmxvCrrT5sriK75k7a7hMZz
	wKISfRGRZkAaBe0jGaFwebRsnZmvMUT/nQ==
X-Google-Smtp-Source: AGHT+IENyJfQ6gBcjfBwcPnX51FC+82M3roaHsx7i6KP6rorcOIWiwogJNkgsT2GbWFBbqNK48Rtwg==
X-Received: by 2002:a05:600c:a44:b0:40d:7720:9f6c with SMTP id c4-20020a05600c0a4400b0040d77209f6cmr3644918wmq.5.1704248319253;
        Tue, 02 Jan 2024 18:18:39 -0800 (PST)
Received: from [127.0.1.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c4f4400b0040d3276ba19sm734374wmq.25.2024.01.02.18.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 18:18:38 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: sc8280xp: Add CAMSS core dtsi
 support
Date: Wed, 03 Jan 2024 02:18:38 +0000
Message-Id: <20240103-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v1-0-abacaa63a961@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP7DlGUC/x2NQQqDMBAAvyJ77sJmtZj2K6WHEDftQhslqyUg/
 t3Q48xhZgeTomJw73Yo8lPTOTdwlw7iO+SXoE6NgYkHcsT40bxVzFJX5AHJYXMWPXuqC8bwNcM
 4F8FpNUUeewrXNEq6eWjJpUjS+t89nsdxAuGGg4h+AAAA
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13-dev-4e032

This series adds the yaml, CAMSS and CCI dts definitions for the sc8280xp.

4 x CCI master busses
4 x VFE
4 x VFE Lite
4 x CSID
4 x CSIPHY

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-01-02-sc8280xp-camss-core-dtsi

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (3):
      media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding
      arm64: dts: qcom: sc8280xp: camss: Add CCI definitions
      arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition

 .../bindings/media/qcom,sc8280xp-camss.yaml        | 512 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 563 +++++++++++++++++++++
 2 files changed, 1075 insertions(+)
---
base-commit: ab0b3e6ef50d305278b1971891cf1d82ab050b35
change-id: 20240102-linux-next-24-01-02-sc8280xp-camss-core-dtsi-2730a5f7ef98

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


