Return-Path: <linux-media+bounces-29571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB541A7F3B8
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 06:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E49B1898AF2
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 04:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C811325F97D;
	Tue,  8 Apr 2025 04:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYbIMuFV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7FC1F8725;
	Tue,  8 Apr 2025 04:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744087205; cv=none; b=m2P7lSBmx+BYdj2jFLEfM0xq1y0hiRKb5pMGALRgfVygsvlyzampzgANxbnsTBUIUvYa176XgmUqkFzvYCkqwXIm+dYaB0uwGvRzEYI0gaKEUFry4o2LGOZv+LLFuGbTl7OpNGzemGIMc7TVtB1gBNZNDjdPL1Kr1ivjOv+ypYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744087205; c=relaxed/simple;
	bh=yhMKEV0cCXxqfGp4QpUkRtWTz9lltxPGH8xVqkkKk6U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TVKKiGqgEEvvIDo4MAfeABx9dnfbgROpiKq9cAQSXcd3udpyh6vcvt4rWy0+5bnxV8rWUZaMLliWmdCH6s8WTPFkcHyRROvUO1+1YrSLSlH1/GdC7G2QuA+jXtB+PiyRs4zhw9OFhBz6ChEYNiGE/LE84JEAMH7x5EnUXfAn8xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYbIMuFV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79F9DC4CEE5;
	Tue,  8 Apr 2025 04:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744087204;
	bh=yhMKEV0cCXxqfGp4QpUkRtWTz9lltxPGH8xVqkkKk6U=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oYbIMuFV7ceLFvB8/96Xvpp0VPtG4kopOOPjJaG4djYfuycI2k0VcryLjlotvxqa4
	 fFUzJ2xw1NLgoxzhsNqjzGu1jMchabmj0wGPocSwPjp8Mon6qKXQ/P0y5NyNXcVa6b
	 iu7/F91o79GG9UE9mK9Yclt4+LDcwG9MpHXVyReUoea7pSrnzYlrNR9lYnVSBJaStT
	 B+lni8n5dieA7cqFe54mn1zBLYIF3s/aQp6TSBLU6Vl77TJ5Q2UiL9AkNN/4ep5jBz
	 Z1SrzZfjp4J7VJgqI0S2S3IHutwkJkCggWTDWAL7rKiudNt0zmufDSHTDYWrzMmu4Y
	 1K6f+X3kUjPLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E52FC36010;
	Tue,  8 Apr 2025 04:40:04 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/4] Tegra CEC Updates
Date: Mon, 07 Apr 2025 23:39:47 -0500
Message-Id: <20250407-tegra-cec-v1-0-e25dd9577b5f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJOo9GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNz3ZLU9KJE3eTUZF3zVONE86TUNBNTszQloPqCotS0zAqwWdGxtbU
 A6RE18lsAAAA=
X-Change-ID: 20250407-tegra-cec-7e3a7bef456f
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744087203; l=1291;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=yhMKEV0cCXxqfGp4QpUkRtWTz9lltxPGH8xVqkkKk6U=;
 b=JNmTCowIP6MS6wzfw9GGZGXQ0MW2dzlpWAzLQlRfvO1TQja1n8lxqpsC0oIgP+KoF4O49VeWF
 qkgbthdLa0FAZzcQssXjf9m1RNjsJlbzPposr4TiSM4rSsghTM+4K/J
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This series updates Tegra hdmi cec support to be usable out of the box
on Tegra210 through Tegra194.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (4):
      media: dt-bindings: Document Tegra186 and Tegra194 cec
      media: tegra-cec: Support Tegra186 and Tegra194
      arm64: tegra: Add CEC controller on Tegra210
      arm64: tegra: Wire up cec to devkits

 .../devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml       | 2 ++
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts               | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts    | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts               | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi              | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts               | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts               | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi                         | 9 +++++++++
 drivers/media/cec/platform/tegra/tegra_cec.c                     | 2 ++
 9 files changed, 49 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250407-tegra-cec-7e3a7bef456f

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



