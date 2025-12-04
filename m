Return-Path: <linux-media+bounces-48239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07384CA48AC
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 17:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50D5E30D69D7
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 16:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508F72FE048;
	Thu,  4 Dec 2025 16:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVbmeC8y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8002F6928;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865967; cv=none; b=kHf4PIfeNb7Nq8rSWJ8BdyN/lIgSFGkSNFAcDBZgaTDAibPHr6YcANT/i3zc+YAJNnQYWd2vfG/0hiIgkpsGKA0ATyGdfACQ3muz7aRBa/hLqlKKXSDfVjcB32nZrP3+livAT+RelSnGCxLYn3Dhco0tyNTwh0bmfx8/6xWi9uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865967; c=relaxed/simple;
	bh=9XD/qJL6eCwajB0X8fOBOZaDsiRuG8CojS+Mt+P85VY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Guuf+PyTcDdwnAvIwovBiEttUxe8s2zTO/9zKAuw/RbWGMJwLTrALORMliby+yrKHvm7BEsvI3AhNbJlAk1TRFiEYwVnlyyY2ZANdFIwsSxKOT+NjSQX511QMP0WYMYiiyPdxDFV4Ci5vJK3JZIDrIqb5tQremODYHH6uUjLUYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVbmeC8y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6DAFC4CEFB;
	Thu,  4 Dec 2025 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764865966;
	bh=9XD/qJL6eCwajB0X8fOBOZaDsiRuG8CojS+Mt+P85VY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DVbmeC8y8VWOjoO47SKyhardGdgNt1wudX9iJEmcfOCQaFyhkWu6JIsqWYk/zuU5h
	 30dvCNVzRfplb/cS4FeU9THYJQjIt+C5jOZdz9OaVmTwnIONuyvpjuTykGuzx0/GES
	 CfaMZQ+FaKvHCZ7h5tGEJefmIQErCO+SnOOp7w0DAMazdnnhq5M+gObJYL5Wj0E5sp
	 VO04klOpnFU8uOBItTta7jOWXv5c/Un+SdWdl3pteyQcpobMUdX5F9G7KWJA2NPEHA
	 FGVd4x7vz2Tr8vUAOY3cqBjH1e0M3tla3XW2LqA6bkqAGRKh5QFrITKC++p49VBgRA
	 X/O6A4ze0lAlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C23D216AA;
	Thu,  4 Dec 2025 16:32:46 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH WIP v2 0/8] media: camss: Add support for C-PHY
 configuration on Qualcomm platforms
Date: Thu, 04 Dec 2025 17:32:34 +0100
Message-Id: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKK3MWkC/22Muw6CQBBFf4VM7ZidDQ+xorWzszAU7DLIFALuE
 gKS/Xc31Jbn3pOzg2cn7OGa7OB4ES/jEEGfErB9M7wYpY0MWumMSJX4seMb7dRvaMzFmrYhm6c
 pRH9y3Ml6tJ7wuN2hjmMvfh7ddvQXOq4/qYVQIeVZV3BRGsVUySrz2X6hDiH8ADFsCEulAAAA
X-Change-ID: 20251109-qcom-cphy-bb8cbda1c644
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3959; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=9XD/qJL6eCwajB0X8fOBOZaDsiRuG8CojS+Mt+P85VY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpMbesegKeN7A2ZNvAYwRK3TZ+YUHLMWn2RGl73
 6xKZq8YxqKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTG3rAAKCRBgAj/E00kg
 cvWeD/0e1kBDFXZtcoDJOmU/MjKGcSP99Nv+6yV6h3+Rh7tbZ/gw/Q7vxrFTS4j8Q+trEx2lqno
 mUz2ncBTmLKDOGxH4hjeVLFliLlV97+D9CfNpMZtHzq1AEM9gV1RHYkKSYt6u69wU5L/L8gwD25
 tKv4cerLfV9cEgLTnQjib+7xYb6b5X1N6o91/lQAM9C82B/AuohRwqsHJeQo6JsIf0tiq+hdQ/R
 5/uwUYsu1JKJnKk9P5DqwNI/WTvZlL823DL2PVN7VfS5i7wOKYcRmkgKLwLbb3krYzP7RyFBNof
 7aH6xLD+GNNIbwp+mxk8QOvWP8mt1T6UDf7G1eARbQg/U/tMHNXeEuYROid01tgwEVaiTPYuI/l
 5uprBfJKWl9QG83SNZsYauzepZp5LEFDuk25/5S3ix2QboxlKY5bxrtR+2z8qeHwOLg6yTcAQNX
 eoA1mX/oXML6ylbG9Zi1yl3edX+iPkHIg/9BYYIDjoHUFRPpfnT4ijOG5IsHqjCEhIu0DbCv/S6
 rL5nhoYP5e99xh38yk0s8bW2GffYDXC+AuvS89Y/k1M9mc44tMYDLWusRl7cy0hWxk+tM8AK/cz
 2RT7bPQ0dGfPM+HumnUCOa5sF33dsaK+dRMNF5uLonV65zqFXT0R5m6/h0aT9IhSHLU4mxmYjNt
 AU2nNmpyG75IglA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

# Short summary

This patch series extends the Qualcomm CAMSS (Camera Subsystem),
including CSID and CSIPHY components, to support C-PHY mode configuration.

# Background and motivation

Modern smartphone cameras increasingly rely on MIPI C-PHY rather than D-PHY,
thanks to its higher data throughput and signal efficiency. As a result,
many OEMs adopt C-PHY interfaces for main (rear) cameras on Qualcomm-based
devices.

Until now, mainline Linux lacked C-PHY configuration support for Qualcomm
chipsets, preventing bring-up of primary camera sensors on several
Snapdragon platforms. This series closes that gap.

 - Introduces C-PHY configuration support for the CAMSS driver stack,
   covering both CSID and CSIPHY blocks.
 - Successfully enables C-PHY operation on the Snapdragon 845 platform.
 - Tested on OnePlus 6 and 6T phones running mainline Linux,
   using the Sony IMX519 main camera sensor.
 - The new configuration allows other chipsets versionsto enable C-PHY by
   simply adding corresponding sensor driver support and csiphy
   initialization data, following the example set for sdm845.

With this patch series, mainline Linux gains working C-PHY support for
Snapdragon 845, paving the way for improved main camera functionality
across many Qualcomm-based devices. The groundwork also simplifies
future enablement efforts for additional SoCs and sensors.

Until merged, the series will be also available at:
  https://gitlab.com/sdm845/sdm845-next/-/commits/b4/qcom-cphy

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- [NOTE] This is still WIP patch series, thus I wanted to publish already
  changed parts to get feedback regarding to the direction of patchset.  [/NOTE]
- When switch to using odd bits, zeroed val which was left unitialized in v1.
- Accidentally missed archs added back in the commit moving lane regs to
  new location.
- Remove commit with reverting check for only D-PHY is supported and
  adjusted the check to also account for C-PHY.
- Documented link frequency calculation with defines. (Casey)
- Changed the cphy boolean to phy_cfg enum in the camss/camss-csiphy.
  (Brian)
- Added patch for csiphy-3ph enablement for sm7280 from Luca as I'm
  meanwhile trying to bring up the C-PHY sensor on FairPhone 5.
- Merged these two commits together
    csiphy-3ph: Enable sdm845 C-PHY sequence
    csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 CPHY init
  merged R-b.
- Link to v1: https://lore.kernel.org/r/20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz

---
Casey Connolly (1):
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 CPHY init

David Heidelberg (5):
      media: qcom: camss: csiphy: Introduce PHY configuration
      media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes
      media: qcom: camss: Prepare CSID for C-PHY support
      media: qcom: camss: csiphy-3ph: C-PHY needs own lane configuration
      media: qcom: camss: Account for C-PHY when calculating link frequency

Luca Weiss (1):
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.1 MIPI CSI-2 C-PHY init

Petr Hodina (1):
      media: qcom: camss: Initialize lanes after lane configuration is available

 .../media/platform/qcom/camss/camss-csid-gen2.c    |   1 +
 drivers/media/platform/qcom/camss/camss-csid.c     |   3 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 318 ++++++++++++++++++---
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   6 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss.c          |  34 ++-
 drivers/media/platform/qcom/camss/camss.h          |   2 +-
 8 files changed, 312 insertions(+), 55 deletions(-)
---
base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
change-id: 20251109-qcom-cphy-bb8cbda1c644

Best regards,
-- 
David Heidelberg <david@ixit.cz>



