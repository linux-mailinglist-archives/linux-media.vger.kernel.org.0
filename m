Return-Path: <linux-media+bounces-29573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC66A7F3C0
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 06:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41B4217898E
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 04:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF9525F99D;
	Tue,  8 Apr 2025 04:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uza+8to+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443E320B7EC;
	Tue,  8 Apr 2025 04:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744087205; cv=none; b=bg2uscqU0Jg3JTqx8vRJZMCOZrpi4BA8PfirSafUT5y++lq5ZxudaEOS8FeiAL9AxqBZDmQXeO4v/02pioYkyvbfml9Sx68tKip7254h6ZyzbgzkMzEnDsPfP03nLc7u7TU52+SdQbMNqbJe9Rxr6I68YSpsgCnu3mBYmv6M/HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744087205; c=relaxed/simple;
	bh=YK+aVvREciemeAB9SH+6aB7Pf7qdHnClt3ImglwiTsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bn2KvWCyjUR7rlQTiAQGpoyNnariRyfpGvfmBmKxI4ZUn1Nnn0WObcgT+V//cfBR1PoPRqqteGnSrLd6h1PhIAEdniyYxZgoVkc/1f2+2VVB7vJeoPBQm0CxSTZvlsXCWR2dGKzgzYKAg+xusmeSUolqRP4wyPRCCeHU6qXvDQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uza+8to+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD416C4CEEA;
	Tue,  8 Apr 2025 04:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744087204;
	bh=YK+aVvREciemeAB9SH+6aB7Pf7qdHnClt3ImglwiTsc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uza+8to+sJvAcJhqnRuoofJgLn5Sfio+gH2nQAXamImlDIKGqxvG0P6J0uj2XQ+oM
	 py22XHIbUWj5gCE6jIrwEB8V9/T+ihhaE5I+1znBPWR5eW59dnZqyFl0BstgR+Vu0C
	 wBBRmr7P8zD9DgxkAFEAhp4jyPiSJbSTqAETkHAFQQhI9uW2NEIu3xLhqPwLcLW4jh
	 7q9PygT0pd+ICO7fsdDPFFLek5v0joDdVzXxCXnSSDuZmHhjPVf2ikKecKSqxk1O4d
	 pMc0eET2WNytZke7dQhVD05xDpwFCLh1xeAK+Yp3LBxFuip67R2NNVojkPbvBs7qcC
	 E3qWOZWmaiXZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997D4C3600C;
	Tue,  8 Apr 2025 04:40:04 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 07 Apr 2025 23:39:49 -0500
Subject: [PATCH 2/4] media: tegra-cec: Support Tegra186 and Tegra194
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-tegra-cec-v1-2-e25dd9577b5f@gmail.com>
References: <20250407-tegra-cec-v1-0-e25dd9577b5f@gmail.com>
In-Reply-To: <20250407-tegra-cec-v1-0-e25dd9577b5f@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744087203; l=912;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=qzkH1Lb60CcGemYqjTXGR/2EtCT8x42nYq6ZuIVdnn4=;
 b=mwF6j61IoAjC9rHwr0PFWe+bAwWv8DsDyMBsHvheZZiELfnwymmTHlpUfaTRnASpGWoBIj4iX
 bz+hBJqhv2oCc5KOObnqKqs0WPxo25aU3fuZuBhPz3sHFgmjZoF1+Ss
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The tegra186 and tegra194 controllers are working with the driver as-is,
so add the compatibles to allow them to probe.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/media/cec/platform/tegra/tegra_cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media/cec/platform/tegra/tegra_cec.c
index 3ed50097262f64c32fe0480698cea9a1056a0953..aa3d36286d256d59f9d726e5c3cee5decacd1d23 100644
--- a/drivers/media/cec/platform/tegra/tegra_cec.c
+++ b/drivers/media/cec/platform/tegra/tegra_cec.c
@@ -456,6 +456,8 @@ static const struct of_device_id tegra_cec_of_match[] = {
 	{ .compatible = "nvidia,tegra114-cec", },
 	{ .compatible = "nvidia,tegra124-cec", },
 	{ .compatible = "nvidia,tegra210-cec", },
+	{ .compatible = "nvidia,tegra186-cec", },
+	{ .compatible = "nvidia,tegra194-cec", },
 	{},
 };
 

-- 
2.48.1



