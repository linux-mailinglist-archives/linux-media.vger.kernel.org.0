Return-Path: <linux-media+bounces-19369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E845C999AA9
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 04:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28A54B213E6
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 02:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C3A1F1310;
	Fri, 11 Oct 2024 02:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTOXjKp8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E31A17BA9;
	Fri, 11 Oct 2024 02:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728614254; cv=none; b=IxjIt86hDIK1+HHb14kSisuG2JXANYmHnCN9ewzzZg6mE2lO0IRQ9423atq6brC+9RwbHrlRC1vO7y35v8lxefLkHnzsNGSKG+G8QnrRBbCQa4iwvWAfTPyB2CD0ENVI6aWJzJOsLRAyqejzcz+Aasz9h+qldc1GjoX+E2MGno8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728614254; c=relaxed/simple;
	bh=m82pVi9rWdwhXvyMfOET2iSm8JiYFqQ9X4DgC2M12BY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQbR2VTRv4DRQ4eVqS9jZxtIA15pSwNV7iFt77yAVrm2+A7XQb02otea7d6A/4fbZZf6XDaHxUfEfaeYuM2F67ISD0SpKrkTVAqkQTZEiDcP4K/c+r2i1EBJCO+niBuT20V3H781ZMqD3Dp6u19/FiJv0bTECs8JZMmBSkh9/UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTOXjKp8; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6cbf347dc66so311506d6.3;
        Thu, 10 Oct 2024 19:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728614252; x=1729219052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RdCBEChnt7QpN4qu96zBgY3lUHISCcLaZiizJdxiJx0=;
        b=YTOXjKp8ZmM5wbq7nqpj8ZOgYVIV//L6GxGPVkpc4GwlgEEt8gWSRXf3dOqh9U1tHk
         rhCA+9ANo7eg56iHK48CPMfJVqMl1iVoK1LW4oOupA72KFba+Z9+14+t4M5mgVq4Eg4F
         kVHqreEHGr4OzS/+ZmxIw3XefbHz5zlzarM6+utI9HrSOG+AsnCeMM6v/x352pVvF3dV
         +EfaW65MF2oPRWEWH+GSB6NZDjCMdaV8cR2WZA5c/Bzau+quaw6Uy6kszv1DkBZPHkRz
         YvZ4AYL7ebMRgvX07IIz06G5VgEhW1HgDzkcz1RIdThKKdHnelVSQa+tCuydTJAi0v86
         q9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728614252; x=1729219052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdCBEChnt7QpN4qu96zBgY3lUHISCcLaZiizJdxiJx0=;
        b=UXSlEHowlpIJCi/+DoeDz5XUyg/qB5dj4/xP1Ps9oNjLz2VytxcGh2PeO0xM8mTEmh
         s1BtSnd9ZII4hpHh2yihxjdtllNTbpkqzNED+ifcaqibf4gQC0/gaO/qLtcMzmzKCAqY
         K/MrAH4xiQvL1aY5B+SbAXAbz1AfjFM8Bsov3ub4LvV0t6APfVsVTKe7Vp9btGBAEjkr
         Ist3PUNHQ6Kw5sBPME/r3IMCvLXRJ3XZ84UTIcmvHf/giYheMwiY3P801tQ8KQ+t9kqP
         AewZTOYITAMCZmIdnGqQTxk0wrFAN5T7keSN7Lfyi/E0R0JClz8qVLX/0FfYUTQ0+GoI
         DQSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4d5sxaFVcrxNZJPmmZ5pvNO3dob/Z8ZjcZnGgj+D/4O2l+sC8TYdHs0OZ+S6+DykYgneEw93btGA@vger.kernel.org, AJvYcCVCfcLylzEdln8uE0bOP/6kw51pKl7gpnH0S5BNEj7om7qUEUFBL+Wvw4/haARDgvJ/idNaGIu9sg+w@vger.kernel.org, AJvYcCWCWclMDVHSpRap8xHi8e77cAStWcobLUdr69Mp82L+Ak9cVwDMdfSRE1xitEgEuyJV5ZhuccOGH96RJjPd4Q==@vger.kernel.org, AJvYcCXhqxHTMoEw5zmu4JHYP5xb6Y4CvvQRtDB4Ql5fjiVndMHQBWUje05gS226zh5MGJMrQEltq+I/CHVBBJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuhQcBmXBG6kb6TNg3DSMkZDDG3Xg/koIAFZ2wlgt58e6NJgC5
	JlAAdTec9jxI5TRQuPoN+btRlhOyo37Osxo2ZZcYBa8J9w9fqc3w
X-Google-Smtp-Source: AGHT+IE7okBuB2dYuVMBP+g1EflF8G4KDK9sSZM5v9JU6mq+ZUuqRxkD9YO+UuG7rQpYqqZ7tSRGgg==
X-Received: by 2002:a05:6214:3986:b0:6cb:c161:d26e with SMTP id 6a1803df08f44-6cbf00f00e2mr19226966d6.34.1728614252092;
        Thu, 10 Oct 2024 19:37:32 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::786d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8679de8sm11344976d6.136.2024.10.10.19.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 19:37:30 -0700 (PDT)
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
Subject: [PATCH v6 0/5] Add SDM670 camera subsystem
Date: Thu, 10 Oct 2024 22:37:25 -0400
Message-ID: <20241011023724.614584-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the camera subsystem on the Snapdragon 670.

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
2.47.0


