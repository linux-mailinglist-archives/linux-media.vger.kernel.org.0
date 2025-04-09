Return-Path: <linux-media+bounces-29814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E37A83448
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 00:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4262D462A7A
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 22:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A022521D5B0;
	Wed,  9 Apr 2025 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHCnBLOs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B7D8BEA;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744239448; cv=none; b=rCj7Wb7nshCAkyVWvjZLLsR+pimPhFbEniTXaCdDppr//o6wQlDu+DZsaUmHibSWqLfkOVazlNs14ejDtzVpdvs3E5pJN7fx7vmnpO/ssWpS1nqE8FT7MXU2Y4K9fvcnsTbkCzZNhR0AxGUbcIkczWK33lp8CHDjeB99t6JhXlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744239448; c=relaxed/simple;
	bh=IYXgA9m/26sMDrILCQnvUu7ZffwoswKKZa5Bxjp4hnQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rdyj+EN3utHbDHbZC5XjQavND34q7xLqsp0rgv+HRSxLtqYkaF7JtOB/QcEGq4UsAXj0KcnHSGyYQq92h/pzGhmTyRNDODQvrqaIf0rkSvk9Zni8xVB9+qQFu00gCVPRLTkBYUTvkvdWGE8/AMz6f6l3Otg/XC6mkuwry/x69Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHCnBLOs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55478C4CEE2;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744239447;
	bh=IYXgA9m/26sMDrILCQnvUu7ZffwoswKKZa5Bxjp4hnQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CHCnBLOsccyKgv3qTQA0q20/Ezk+LvOsxj9zkjhiPmyxMUSV5Ciu5V0OVDBZaVm8y
	 GeNP8symGInMpgmqOj0V1rwWsuk2fUciohTneac+naFTJnG95Iw84tsQmEvH/4XdWU
	 XZATvOAat65xFNiVVDku8PKAMDnPW3ut0rdlEaclwV3QsFSoU/1ZpLdu0wDLMhKVih
	 F7t80WWtkJWxd8vAuQAnmnJ/8+S4IVdAi5aSUk6Z83OnbKaFgH6bvSvvq54psZUEX7
	 XAAmw7gvJirAn+h65g8OvIS5rsar6kngZMlIF8J9u7XnRKA1mMBHR9uEaSHxoWlp5M
	 3Unnk6Lr0mmKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42867C36002;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v3 0/4] Tegra CEC Updates
Date: Wed, 09 Apr 2025 17:57:21 -0500
Message-Id: <20250409-tegra-cec-v3-0-91640131dfa2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFL79mcC/22MwQ6DIBAFf8XsuTSIUGxP/Y+mB4RFN6nSgCFtj
 P9e9OShx3l5MwskjIQJbtUCETMlClOB5lSBHczUIyNXGAQXikuu2Yx9NMyiZRobozv0Ul08lP8
 7oqfP3no8Cw+U5hC/ezrX2/qvkmvGGQrl3FVp3Sl/70dDr7MNI2yVLI5mezRFMYXnXHrnW4nt0
 VzX9QeA4FBA3AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744239446; l=1738;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=IYXgA9m/26sMDrILCQnvUu7ZffwoswKKZa5Bxjp4hnQ=;
 b=XrEolROn2YCvTM9CofMWLZ45J3A3ZofsZlNX8w7BlwIQCijcJl67Ux0IIujVjScG9ENc4FPU2
 pNaHaeMTkoJAKKGJJcCK1fQx4ApdnQloFeD8d1EMdTknnybXd8pn2Aw
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
Changes in v3:
- Update patch 1 to fix lint warnings
- Link to v2: https://lore.kernel.org/r/20250408-tegra-cec-v2-0-2f004fdf84e8@gmail.com

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



