Return-Path: <linux-media+bounces-16887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 891879606BB
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 452432859D5
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7654D19EEDF;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4zppCny"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54CC19D08C;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753194; cv=none; b=XRPfQilRHSURa/Bj0zLm4MjNis6FIHIU9Vfd1qX6NVJ4c/ECuYt2axMmQkIf83jJiPbCeGAgJ0h23vMjvlrUSlpMD4Q5zbwwothhSdQ7iAiD2uPZV2SjsXzCxYwjCst01D0/I+gbVtTtauVmzBZbrzGuRi2PTd3rcmopjplEnso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753194; c=relaxed/simple;
	bh=zKj0i2yGql7HRjfp5dYyt3Lo063aPGwvbKN6Pvn8jqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rq/EIfs5I3tm1fAhNYpWVc2IDVI0z9HE7UPE00hvOWSCA4REBH6xqHxsLGXCMtoNfy8S0EHM7Yd5F1WCDxnKoFLQ7pBfbUPqvofpa5jFdu5Jpk+hIAeCwBwnAhPuGfa4pnfXiO+F2boRihtnP++gFyNzjb0WtG1hgdqgtwy9JDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4zppCny; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 401D8C8B7DF;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753194;
	bh=zKj0i2yGql7HRjfp5dYyt3Lo063aPGwvbKN6Pvn8jqs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R4zppCnyoPv8cbJW/l8AK9sh2KU05AVjugjkiCV8G8v3IMyY9ROYphJ/2+qqo1GJ5
	 zfOMFyv7JEx15EQQoWO1hQRD+Lc4u1dv4d2Silgo3lwCirvnTX/yf8cNeH46vNPJua
	 fZavLb3FG/gNioqd5/DphwKp6NuuVDM0LgYXSIXQ8PwxmqGiG2LbXnuCuCYEoYbMTk
	 plstywBeflx/jUkiNO2PIsai/GzrlxjjxHm1zj8d0r4g8yeKn3QqqHz0yW5sMfXoNS
	 r6byGjyqIVXv5YAbejt3UEMYVYhZKA5ka8iWj3/LB5cShEpMFneR6FXilTuczLPWaa
	 ZA/Htn7Lg6G/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A027C5472E;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:27 +0530
Subject: [PATCH v3 02/29] media: MAINTAINERS: Add Qualcomm Iris video
 accelerator driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-2-c5fdbbe65e70@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=1103;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=f4t4EfkFMyoaeCFa31G11dRb4r/+CaAlXqjBl8U4iXg=;
 b=Thrg8vqMvLlIP/qwUlEbz8Qy2jtQ00kzFxAjrXCdXAmLY+3oTHib4cBoRrPi1KjFPUmi2iQe2
 8I0Aptv2J4OANis7uKKViTvvNujKSS8weX4qDwRCmbQf/N2gWEpXy+k
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Add an entry for Iris video decoder accelerator driver.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8766f3e5e87e..105e67fca308 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18898,6 +18898,17 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
+QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
+M:	Vikash Garodia <quic_vgarodia@quicinc.com>
+M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
+R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+L:	linux-media@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
+F:	drivers/media/platform/qcom/iris/
+
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-mtd@lists.infradead.org

-- 
2.34.1



