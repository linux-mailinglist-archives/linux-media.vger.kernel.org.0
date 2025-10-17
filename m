Return-Path: <linux-media+bounces-44804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1649BE6869
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7CA344F53B0
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 06:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8354230E0EB;
	Fri, 17 Oct 2025 06:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkOEOvOC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54A23EA9B;
	Fri, 17 Oct 2025 06:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760681079; cv=none; b=i2R8oxhSu+XwNNcW5w+SUM0Bhy6kuw/Y+2xfrLwje+DQERrfiF6CfV/P6vXyVg9UNE+Ax3G/6lHbdWUr08Rv5fFlZ3OTRBaY2Yzv4Gi7K3l0HeNStXhGY8C3DzjdUbuifV9yX1TufqbQ2njsK0XmGNzZDgSAAx2OAP6TocZMtIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760681079; c=relaxed/simple;
	bh=1f34fE1A3RjK8bsTl+pYR5vmwP04wNIaAaAsgSv7ALE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GsmHCFd5m3p/EFGke4+akEKYllXSaOvtPRulQkjgyVam2No+oQFijyIr93NfW1AHtLUkLhwFx4f7n7nrcqHoo1D3TIrMtUFromjvT7rX/S2Tu1V05ux2PEv3a+WmV2VEps1+IQc8hC3u2mn32A2+XTeSb9LbrdHyb3QifZn9JK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkOEOvOC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64529C4CEF9;
	Fri, 17 Oct 2025 06:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760681078;
	bh=1f34fE1A3RjK8bsTl+pYR5vmwP04wNIaAaAsgSv7ALE=;
	h=From:To:Cc:Subject:Date:From;
	b=DkOEOvOC7N+F853br4RnDc+uslKpOTfuppbKDY9um4W4NH4FfeJjsqwjyh3qQJKDF
	 sHNJts1Y1IB/wfe0/XIdwoqesbV4iOvx4DOd+qzjU+IYjJhgtgQTfn0W0InjD5O/CR
	 0artZ9zJpATpLD0qrRy8QQDlwNGHD35C667rlzBMqXRFNm1Q1NV/VZFmK6JnNsMvCu
	 Vn+S9ufP3vlHnlODHi6Ip+OiC+SNRkeLlvKXek0wrHn/SaNdohSWfPWKoNZM0p/QB/
	 LsmZI4vTk8G+BZuL8zQ7MKyCfO35uPJaTUo9q1SPdqq2aIbmK+gs34oKdzmvXq3Qxp
	 CC+5Iku3INRbw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9dZw-000000002Dm-3DYf;
	Fri, 17 Oct 2025 08:04:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan ODonoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] media: qcom: camss: drop unused module alias
Date: Fri, 17 Oct 2025 08:04:35 +0200
Message-ID: <20251017060435.8524-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver has never supported anything but OF probing so drop the
unused platform module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d9d770e5e7c6..c93aeeb5ab20 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4545,7 +4545,6 @@ static struct platform_driver qcom_camss_driver = {
 
 module_platform_driver(qcom_camss_driver);
 
-MODULE_ALIAS("platform:qcom-camss");
 MODULE_DESCRIPTION("Qualcomm Camera Subsystem driver");
 MODULE_AUTHOR("Todor Tomov <todor.tomov@linaro.org>");
 MODULE_LICENSE("GPL v2");
-- 
2.49.1


