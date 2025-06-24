Return-Path: <linux-media+bounces-35731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52843AE610D
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 530A8405FCE
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 09:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6A027C17F;
	Tue, 24 Jun 2025 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GbnLvBGB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A609526B74E
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758187; cv=none; b=cUEorGXQ+CDq5l3QGdM4mSD/r3Ldy8lvynyPV6Tkz6Gh0IGa2rqe4XGECZARUABuD5KEWnrjvbwizgd343t/Vs0m1IGamrY7PH0HEm7l4un0Wc9FaIx30VeftpUXwUDCXOoTK3hcwHaUhuBTiggMHVq/WIqtKKj989N9EU7YuD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758187; c=relaxed/simple;
	bh=aKVHs9BNm/mooH2PzEQj6OMW28srDvk9sw6OOEomA0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HE8ALUwjT/MjXYwR574QwwNLreJ1YjSnTn4SdIFn/dRKSUGWvMlVuQq7E8ByTjTgbmvzzmJPhyy2fITn27UIC9e7KbaIyk0xvE/pXXthhCayh7TOyP/zjvhDmuIuxo2+cmRsreJpyVycjbg26b5jIkW1oCroUA7YciyKhle4Rgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GbnLvBGB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55325956c93so801460e87.1
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 02:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750758184; x=1751362984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JRW6Y0n90vxkzJFGPiB+J4F9Eeo807Rauzaf+xKHkvQ=;
        b=GbnLvBGBUBr+olgx6m4XhoB9P19Laqkpz+OsvjbelfYAjfdrbedjuBXFY6kdIo7M6E
         G4WKm0HELQDdU2ZoS4923Z66mPh5UYW5uJFovx2dkyIKg1PVPoGpewqVg3EZNMHjV/Fe
         KzsskYdS0WeF5/3l8/lPsmNhbMasMRLfH3UOn92EMd4HvFDAdWZa3yKJPPzMY9qG3+C0
         409vEmWlwK3GLQbXVcMpGoR0ELTyAh3eo3kOdVYkXoIRrwZrCna2RMEpjb4Jem4QUXJw
         C6bUPRbueuLBQAJmqVfL0FygozRFX7mPwQEr0Ry//GzQDSupyXcab3v19R0Mq12JDuuI
         1Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750758184; x=1751362984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRW6Y0n90vxkzJFGPiB+J4F9Eeo807Rauzaf+xKHkvQ=;
        b=Ps9Wxo9C+Rnu0e+Kqei8EiJmtrcK8nFvriBRo9q0zbob8gmZtBUc3RoIxJhcunskWc
         DqT2aaAyNC/azUuOGWufKieJGpHi2CxBE11LOPBa/YavsPsChk+404sUFGuLUqYPYXpT
         JjZNqUusztr4U5pmk6nPlzowNsvg0vwM5omDZagSUc9CO7Lb0u80IG52jnVuLatG8XLU
         InYRP5na2ivvPFmOH4YCeVXZS1tsutlX0/3dVYckK7bd/lPQA7BqZCykLPdPNH/UzCGn
         w6j5r7uVdVzUIziya15DG1LMe/KecxqNhm6R/YOhzabkctT6qMUGXeAGk5EHHY6Z+oRY
         f5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXpVQBqMO6Tr+xnZW5fHfI/Eq//V3nCX48ohSa8uytAfHbyt5SY5WYdG+sqZYnsqzjbmmOuMD+tJ+MybQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNHp8MAbTeAOZ4nc9chDUfO1toW+hmU76kxDUGrNiBqTt+fz3R
	Rfso+ezUPCCxwZ1/FeiQ+ruYnMWwPVWgvm4/28GLl3KTfYiFg79jf52lim5hUNV/UYw=
X-Gm-Gg: ASbGnctBb4DYxjRX7KPKqrJ5jVufJgw+3AQKWxhjVoG/7l7ahDhr5zQwNLlFpI44ttv
	fprYNZR8KACBM2mTFjtp/QW7tPEGHPhvKbMkqt3z5qnTfaZeAYeW2o9ZYVSQpQbdiQslgi+OFyO
	xb8WWXLrIUVw9iftffpeYYAiiN2OQcK12n9gogjG7dYXRi7GiVt0hiRW7IrhNG3hGTkNbhRxw+g
	L3nmRzVLh9jfQMHC1DIuLK1F1AqVBiE/82sPlomPdsiwjKdow9Y+z5ssJu15IqchOrMGFXdPrAD
	W2IzfEKctPblYHg/6CtpJVjCLQFnGwsSxRP/jyP/qxwDPLp5FESOlM2EUwCwCHTFtDitzGNGR9k
	n7GpsTbFdeWdCflyjqOhO4orplCArjTSv58XjQnHcU/DbQHv2wvIL3VPk0WiI3w==
X-Google-Smtp-Source: AGHT+IEcjSc5H18Vb1fNysRQizg1q9F6o3XBgWlbmq5FEa2B9vx64nrRzhnJbuDe5ORvipHHhEkPtA==
X-Received: by 2002:a05:6512:3e04:b0:553:cf10:e424 with SMTP id 2adb3069b0e04-553e3ba74aamr1549856e87.2.1750758183755;
        Tue, 24 Jun 2025 02:43:03 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414445asm1745793e87.12.2025.06.24.02.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:43:03 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: media: qcom,x1e80100-camss: two minor changes
Date: Tue, 24 Jun 2025 12:42:51 +0300
Message-ID: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series contains a couple of minor improvements to qcom,x1e80100-camss
device tree binding scheme.

Changes from v1 to v2:
* removed Fixes tag from both changes per discussion (Bryan, Dmitry),
* added a note to 1/2 commit message that is an ABI change (Dmitry),
* added Bryan's Reviewed-by tag to 2/2 change.

Links to v1:
* 1/2 https://lore.kernel.org/all/20250610083318.2773727-1-vladimir.zapolskiy@linaro.org/
* 2/2 https://lore.kernel.org/all/20250610083318.2773727-2-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (2):
  dt-bindings: media: qcom,x1e80100-camss: Sort interconnects alphabetically
  dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address

 .../bindings/media/qcom,x1e80100-camss.yaml          | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.49.0


