Return-Path: <linux-media+bounces-23119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61299EBF5A
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52ABA167346
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181A12163A7;
	Tue, 10 Dec 2024 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTpdAkxq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCA51A3056;
	Tue, 10 Dec 2024 23:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733873751; cv=none; b=EiUA69oGZzNDvdH/JpcGwzI/XBmnxp5N53K9U5J5vdv6xAR5ljJ60L+M9eWz1fabzqjpnhGN8T1o1+/enn9gp8WawMUXul25nwKpjGNrDLyHlCBaQvqxyQct5iLS8E16blRSyiusdzMeX4mmNWpYOD8qOU83/g8DYNOoSzK6bic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733873751; c=relaxed/simple;
	bh=Z7oibvWnuB8FEKQScYpRrF+GodMgfcygIASE07NiK2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ny33wKgafvKx0vI92kkucdfFR8c5Kg+BRSssOneU4QYigaTHnfJyJ4zE0Mq4XXVH07hMmxpXldZP3lA+UcLReelyouhTA962eCiVel8fISqHbYPgs0REPA+9UZX4bUjhwzdop7OSBkncajBR8ZVC4v0QnubBZYrFazV0z/wlqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTpdAkxq; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d8f544d227so25510226d6.1;
        Tue, 10 Dec 2024 15:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733873748; x=1734478548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q3or1BVyav+U0mVBbK8UTA6qLz2lo3xASGrx99y+7sM=;
        b=eTpdAkxq3LP4CZ1Ip57ornpfXW5V6U2rnBMgReyqupwT0r1HPZwJQkNKPkrcAB3+5+
         GaSWVV/W1gjiHC/EkZ+/PmQLyG68pE7jpQTT5eJtCOhMwyA3WhhEsDFq3c+AKNKClfu5
         2QJ1/BxArgYXcuVy4aDbUWZkgAbQLEbjRmNGYVAB28B35h/KRVHzMqWYAUiuiz19Q0kv
         zmWdnm1PIEmwpqsGzgQBEt1WJ2EKnG0mSk3dvw7xjwGnquQgDIPW2PRrJh4EXezDLMaX
         T3LNCsYPtUAjoAUpJx20rvA7C+8LGamC/KN4McDMzNct6t3dUX60K1mTbPjxO6rYPoCr
         HOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733873748; x=1734478548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3or1BVyav+U0mVBbK8UTA6qLz2lo3xASGrx99y+7sM=;
        b=AiCkgz76rHgZsnU7WW1zm1r7WT1dyPQDr4L0ncNHBSId2nDOISBTCu/1/j0WZtwDzj
         an88smPi3VoLuI5PlQ4PNKax0XtrgcxT0Ie5Bb/11i7qoD0XoQ2mKPK1sEiWQInqrMUr
         bKYvdhZAkIEsBzhjUzY6paFdvJ2SfvNfPIMibWx6Qwfsvm7DwZ21H4F/jVAAjmzRM2QO
         aIBOX6KFSTez77YF78cJoV4pJk1ylaBCDpcpvSObcLHF+bWozj6zn8vNeOkrl9fnie74
         czPBxriiQs1ve1bFwxNG+cC1Z3CE5ezUjuPJHkJDWeM1lVGTUM2oG9EgY9zF4mpMlvIq
         r2kg==
X-Forwarded-Encrypted: i=1; AJvYcCVxXftHjL+1SKj0l4ZuppehqzYZUY8TGFNN1r2HrfdAmn0ASrjoizsbOOR9xzYJ0oivFXkJGbzauV2xt2c=@vger.kernel.org, AJvYcCWXUGAQz42+mbzRrQOCxa+g7B4SPIYIYNlwhmXQEFPigW6I+/T7HUVIHWTR0VQYwFqPMAycKgdx7AZr@vger.kernel.org, AJvYcCWYM+Vk/CHz+SR5ktPRgbMgqLgMYmhayllrRlcmb40TX3h0jTm4/yQwmrGR39J3ODdJTg3wfH+k3uKK@vger.kernel.org, AJvYcCXwC4q5hqqjrLT9BeK+vwVYoE1O59nAzX3YHjRD2ayDOsW51rzkIIHHhI8vmSJWa5rKeL4vx6V/qxAm2VGHIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx70VNw8ROJBzcm4F0uR9sYo2aNk8Jr4DfaLcpXsZTeqWJorOKo
	V0Eubn6JO3WLxuv2dBnpI0QU7S1IBdf0JL1Yo4qnzomxquOSu667asZVtLyF
X-Gm-Gg: ASbGncshopycEIfjzw724yzyEsoUMeGwsQbz6ONwFH2RzMF3udO7StZwv7tJGO5oHJ2
	FwOzfk7hOx6IOkmPTo1Ylf00GaEW2V2nxzAYXHFi+Xp0Nzdxm1Pe7LtH8VPnujs74t6MnXblRsO
	DlGtzBoCnsKPkv0Jyb+bEcwXHH5hrAO0+iC41AAaLzTW1MTIhGk9ztNLeb56UXpM53wIbC3FZJ8
	YR9SMkqe5XkEmvOOgBO38y2J8OyltCttvMVKnlnKg==
X-Google-Smtp-Source: AGHT+IG4GHwErOdTJqeODeAkL0AXYBeDMEJpGraf5ZwI2PTpkCDT5FYyptL8Z+ONwwS8O/3I8vnJYQ==
X-Received: by 2002:a05:6214:21a6:b0:6d4:3b7a:313a with SMTP id 6a1803df08f44-6d934b7b5camr15070696d6.32.1733873748586;
        Tue, 10 Dec 2024 15:35:48 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::6d3f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8ff0231c0sm39047226d6.65.2024.12.10.15.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 15:35:48 -0800 (PST)
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
Subject: [PATCH v7 0/5] Add SDM670 camera subsystem
Date: Tue, 10 Dec 2024 18:35:35 -0500
Message-ID: <20241210233534.614520-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the camera subsystem on the Snapdragon 670.

Changes since v6 (20241011023724.614584-7-mailingradian@gmail.com):
- set unit address in node name to first address in regs (2/5, 5/5)

Changes since v5 (20241001023520.547271-9-mailingradian@gmail.com):
- sort reg and reg-names alphabetically (2/5, 5/5)
- drop CCI I2C patches since they are applied (formerly 2/7, 3/7)

Changes since v4 (20240904020448.52035-9-mailingradian@gmail.com):
- change camss interrupts to rising edge in dts (7/7)
- change IRQs to rising edge in camss dt-bindings example (4/7)
- move gcc and ahb clocks in camss dt-bindings example (4/7)
- add reviewed-by for camcc dt-bindings patch (1/7)

Changes since v3 (20240819221051.31489-7-mailingradian@gmail.com):
- add specific sdm670 compatible for camcc to dt schema and dts (1/7, 6/7)
- pick up patch from Bryan for CCI driver (3/7)
- stop assigning CCI frequency in dts (7/7)
- add maxItems for sdm670 cci clocks (2/7)
- remove empty line at top of camss dt schema (4/7)
- move regs and reg-names up in camss dt schema (4/7)
- move gcc and ahb clocks up in dts and dt schema (4/7, 7/7)
- add reviewed-by from Vladimir for CCI dt-bindings patch (2/7)
- add reviewed-by from Bryan for dts patch (7/7)
- add reviewed-by from Krzysztof for camss dt-bindings patch (4/7)
- add rewiew tags for camss driver patch (5/7)

Changes since v2 (20240813230037.84004-8-mailingradian@gmail.com):
- drop unnecessary assigned AXI clock frequency (5/5)
- drop src clocks from cci (5/5)
- add unit name, remove mmio properties from port in example dts (2/5)
- correct the reg-names order (2/5)
- add parent_dev_ops to csid (3/5)
- remove CSID clocks from VFE (3/5)
- remove AXI clock from CSIPHY (3/5)
- change subsystem part of the commit message summary (3/5)
- add reviewed-by (4/5)

Changes since v1 (20240806224219.71623-7-mailingradian@gmail.com):
- define dedicated resource structs/arrays for sdm670 (3/5)
- separate camcc device tree node into its own patch (4/5)
- specify correct dual license (2/5)
- add include directives in dt-bindings camss example (2/5)
- remove src clocks from dt-bindings (2/5)
- remove src clocks from dtsi (5/5)
- add power-domain-names to camss (5/5)
- specify power domain names (3/5)
- restrict cci-i2c clocks (1/5)
- populate a commit message with hw info (2/5)
- reword commit message (3/5)

Richard Acayan (5):
  dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible
  dt-bindings: media: camss: Add qcom,sdm670-camss
  media: qcom: camss: add support for SDM670 camss
  arm64: dts: qcom: sdm670: add camcc
  arm64: dts: qcom: sdm670: add camss and cci

 .../bindings/clock/qcom,sdm845-camcc.yaml     |   6 +-
 .../bindings/media/qcom,sdm670-camss.yaml     | 318 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 195 +++++++++++
 drivers/media/platform/qcom/camss/camss.c     | 191 +++++++++++
 4 files changed, 709 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

-- 
2.47.1


