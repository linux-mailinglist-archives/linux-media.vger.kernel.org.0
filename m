Return-Path: <linux-media+bounces-29669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58571A816F8
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 22:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70B091B881F1
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 20:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFE825523A;
	Tue,  8 Apr 2025 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eX+kTm7k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9399724886B;
	Tue,  8 Apr 2025 20:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144222; cv=none; b=hT1vy4qfzYFwjMZpCV+hVnefSHquXy+cRIesr1gsRP6x2NGQx1q8pl4EWzpciXtstGPPzwuau4LtkkLNDpABC1+qjHWqSjhW+wtVIaL62Y0TgQFeU806mONrnRsCI/f4AT26pLYI4G83dcQ3EQH6qmSAzQXlrVRJXz7SPBBwUfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144222; c=relaxed/simple;
	bh=pSNYHP17o7Fgq2T92jXtQMIX7yPDgExcuj9fOGXUZ58=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tVNXRlcU/7cn3d44OJ0WoqX9n8hA1ezur7qq/E0976p6M+734B/7oTMqeQkOfXtKWg8FiuYoNNclbaozsRhPw68thn4M5UH3Ec3wo0UTa0Em/UtaOrfMF/NyVam5RVkldKl2U51KsUzLVpM5HOMCDtr5k4ws9CLQdvSFRBhLdkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eX+kTm7k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECEE2C4CEE5;
	Tue,  8 Apr 2025 20:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744144222;
	bh=pSNYHP17o7Fgq2T92jXtQMIX7yPDgExcuj9fOGXUZ58=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eX+kTm7klUXXhi7gXo7gVqU/F7CkIwCWabnuMSbkSg5iW2R85MPGt1Yqp6+4f4h07
	 L4mYUBNTtWPo6K7ADiRgoB76izsKPwUzXy7HLyukJSupMBnQjB0l9txUTCg+3pf8qD
	 QekqpLZ7glnBUiyLNJcHjPeZ13vtQNm8GVGazHlU4y2IT9+hoJop+4GXpvWcHaOZZG
	 07xqidW0NEIujzGvlhTy5UUhPAPbZ1NLlbvuUf0onhy/xgCPz6Bv1quQWBxJu319cI
	 AURtyt5pWC6pNp9GCFh3KQYmNqf4mV8GBm0EfKZICcO0wzWUdRv1pnrXEv/dX3/DMZ
	 rxX9gaADJ+gPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA14C36010;
	Tue,  8 Apr 2025 20:30:21 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/4] Tegra CEC Updates
Date: Tue, 08 Apr 2025 15:29:57 -0500
Message-Id: <20250408-tegra-cec-v2-0-2f004fdf84e8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEWH9WcC/23MQQ7CIBCF4as0s3YMxSLRlfcwXVAY6CS2NNAQT
 dO7i127/F9evg0yJaYM92aDRIUzx7mGPDVgRzMHQna1QQqpRCc0rhSSQUsWNV2MHsh36uqh/pd
 Ent+H9exrj5zXmD4HXdrf+k8pLQokqZy7Ka0H5R9hMvw62zhBv+/7FzTJHCGiAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744144221; l=1593;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=pSNYHP17o7Fgq2T92jXtQMIX7yPDgExcuj9fOGXUZ58=;
 b=/4oHnJM10rg/wTNM5JAmmK5r0+5IGk+KmssuLjFh/kfOcHrWh4LaIoENtPMl5ameemKTJqILk
 OqKaVGF4L6kBQ29G4NSP/Yy4pj+691Mm1WKhTo9o5wPCMlhCjyYuvN/
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
Changes in v2:
- Dropped patch 2, per request
- Added change to declare fallback compatibles instead, as per request
- Update patch 1 to allow fallback compatibles
- Link to v1: https://lore.kernel.org/r/20250407-tegra-cec-v1-0-e25dd9577b5f@gmail.com

---
Aaron Kling (4):
      media: dt-bindings: Document Tegra186 and Tegra194 cec
      arm64: tegra: Add fallback cec compatibles
      arm64: tegra: Add CEC controller on Tegra210
      arm64: tegra: Wire up cec to devkits

 .../bindings/media/cec/nvidia,tegra114-cec.yaml           | 15 +++++++++++----
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts        |  6 ++++++
 .../boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts    |  6 ++++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi                  |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts        |  6 ++++++
 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi       |  6 ++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi                  |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts        |  6 ++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts        |  6 ++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi                  |  9 +++++++++
 10 files changed, 58 insertions(+), 6 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250407-tegra-cec-7e3a7bef456f

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



