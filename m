Return-Path: <linux-media+bounces-63900-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DDTREMrNImqSdwEAu9opvQ
	(envelope-from <linux-media+bounces-63900-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:23:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B3648829
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:23:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=oQGFFjZb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63900-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63900-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93DAE30A1C13
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30E94EA384;
	Fri,  5 Jun 2026 13:14:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A2C395DBF;
	Fri,  5 Jun 2026 13:14:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665285; cv=none; b=cpssU77hCMUE52IW5ILcGY/6pBECy5z4t+d9v+mz4a+0yglbS0mKOFQw/NqLnezVzU1ZvlVSNo1GceM8UvQsVlmlCbzxcY/CShPL/48/esuv1Cu8weey/F1Uu2YfjFddjPrAFlUFvf7kGlduvd8dAPFc1fe2Ld0QBbTl1LbLgZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665285; c=relaxed/simple;
	bh=O51xkAl5s81o4UbthCOTPTh9WQ0BVCJAm02EkoAQwE8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tmGRITW6e7y/rzQ+rWid7B/bwbcMotafpzH641K8Z/wlKXNmpCjzVwf+1qDQ16bKBNDqOcWP5AipFzv3FHdqfjBkIjdRWYX3qveHGDCSBZZgMCz+9R/lYXT3+S2eHZywfwkbcg34fOlCH/sBphMknwzgq7NIYxPVDbYuDo0P0Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQGFFjZb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5394C2BCB9;
	Fri,  5 Jun 2026 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780665284;
	bh=O51xkAl5s81o4UbthCOTPTh9WQ0BVCJAm02EkoAQwE8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oQGFFjZbjlo3eI9kfOURftvNGR0lNTxQ4ryyNj4QuaTCTlPTIrTucdqdNbpSZ+zI4
	 QTQMwrOW74Yp0RiC6NyfATq2RrzdUnJiq+Og+kZPwJaJv84G+ydK7A9XagkUdxpSqi
	 GjoBka0V9HFqrC32dhhOiSdYLswxAtuEtWyyN2XCo24H0x4b9P73Zce4RbTbXUQslo
	 jZh6XguDisAMZ4nsEEDOThbp+SCtFKFp7nagEomK+YKjeLFFYa/dPtWsfXtA4/sqQW
	 l/bD2Z+6CU5ElHRbtIjeqx5IlmmqaE+ftwAvoo43c7I3zSJwlslnCj9zNTa2J0/VhI
	 Q8Ndqe36vl3ow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A1FCD6E7D;
	Fri,  5 Jun 2026 13:14:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v7 0/8] media: camss: Add support for C-PHY configuration
 on Qualcomm platforms
Date: Fri, 05 Jun 2026 15:14:38 +0200
Message-Id: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7LImoC/23OwU7DMAwG4FeZcibITmKn48R7IA5N4tIcWEc7V
 RtT352sEkqLOP6Wv9++q0nGLJN6OdzVKHOe8nAqwT8dVOzb04fonEpWBgwhwlF/xeFTx3N/0yE
 0MaQWIzunyv55lC5f166395L7PF2G8bZWz/iY/tcyowaNTJ0Xfwwg+Jqv+fIcv9WjYzbVGXBbZ
 4rjYEm6JoBH2Tv76xgQ/dbZ4poonlvgzqewd646C7h1rjgha5GTiZFp76g6sjtH658CHZvg0l/
 H1ZWLW8frPUgCgci3TXXLsvwAzcPcvrgBAAA=
X-Change-ID: 20251109-qcom-cphy-bb8cbda1c644
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5951; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=O51xkAl5s81o4UbthCOTPTh9WQ0BVCJAm02EkoAQwE8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqIsvCg6p45hL2uF9Ui51VrNd987t1eLp1CSq3b
 ouk4ZUnv0WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaiLLwgAKCRBgAj/E00kg
 cp23D/9I1EPYpSF2/Z+ahYHr6DbgYVNI4KI+Dpa6XwOdPLDJNBayx28cQTdnZSVLCcG/aLmODxy
 fNNSWoPUXxv9zjSNnoE6r0kU2SozSHJbgElR4DXTMiVFx/01y6I9AuwNuIfPXrd/LzWghwsT34T
 EPWpBBGCJyKLbjdk/Xu27mhvNCAR50Z2XCUPD4sY3DQxxLAtsGPWa04gc+DRD5JNs5AGzz0N9Nw
 7cRC30IYRwT4E4a7V/IrYzCWA9v7MsLF4W05Vpja9/RhZMFHmxCndQTy0+JouhZjzkx84CFxmCB
 CTjoJ8yyMCheAPer3YuIMHNQDbI9cTSknzKcMHWwfzPfQLlycV2GUbxdP44pVitPxWIu/3bo26i
 iQ/0PIqvvKDq1h6d7ps5VkfCa3qkjskQ0IDtB0ZtpfaSS/BFeL2B0tnecNKkrNRyBYFv4Q7qwWh
 vaddRvRmNymbegGa+dx9eBycDyBFApmtDzYTm2t2Fff5zA0qB2HXeQXURlmXBFIt6k7f4MH/mXc
 p5JUruVOldvoZASYaUAIWWH4ijx8A9IVouGCuiRPzzwB2qG+EMvnVBxufymst9D/RXGTkBEZd4U
 FNOaqGLUc9UBUuozso7HeQGP4jaTjb6KBQjCFgHZVUeaLoKdCl7Q/bdmKbEFjGJC4RuhI+8WAP9
 aEOYlsPNX1Byaog==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63900-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:todortoo@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeberg.org:url,ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 964B3648829

Note: WIP tag added, as not everything from the previous review round has
been addressed.

# Short summary

This patch series extends the Qualcomm CAMSS (Camera Subsystem),
including CSID and CSIPHY components, to support C-PHY mode configuration.

# Background and motivation

Modern smartphone cameras increasingly rely on MIPI C-PHY rather than 
D-PHY, thanks to its higher data throughput and signal efficiency.
As a result, many OEMs adopt C-PHY interfaces for main (rear) cameras on
Qualcomm-based devices.

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
  https://codeberg.org/sdm845/linux/commits/branch/b4/qcom-cphy

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v7:
- Move logic out of switch. (Frank)
- Change csid cphy knob to phy_sel using enum. (Bryan, Frank)
- Link to v6: https://lore.kernel.org/r/20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz

Changes in v6:
- lanes_enable now uses WARN_ONCE instead of return values. (Sakari)
- Dropped Kodiak patch until it gets better documented.
- Document the 3ph C-PHY sdm845 registers a bit.
- Link to v5: https://lore.kernel.org/r/20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz

Changes in v5:
- Split first patch enabling C-PHY part into last patch. (Bryan)
- Fix the camss_get_link_freq crash. (Cory)
- Dropped patch whitelisting C-PHY, instead use nullptr check. (Bryan)
- Dropped A-b/R-b from
 "media: qcom: camss: Initialize lanes after lane configuration is available"
 and changed Petr to Co-developed by and owned the patch.
- Link to v4: https://lore.kernel.org/r/20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz

Changes in v4:
- Documented cphy parametr to camss_get_link_freq.
- Use BIT() macro for lane_mask. (Bryan)
- Correct lane_mask calculation. (Kieran + me)
- Removed comment for the D/C-PHY sequences init. (Bryan)
- Pass &csid->phy for calculate freq. (Bryan)
- Added missing cphy description to camss_get_link_freq. (kernel test robot)
- Gen2 v1.1 MIPI CSI-2 CPHY init hex to lowercase.
- Added back missed commit with improved electrical for sdm845 3ph.
- NOT addressed yet:
  - Proliferating special cases in switch statements on a per-SoC basis is verboten. 
  - is it possible to set clock_lane to say 0xff in DT ? 
- Link to v3: https://lore.kernel.org/r/20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz

Changes in v3:
- Make lanes_enable return sucess or error, since I couldn't move the
  configuration to the _init.
- Dropped R-b tags on
  "media: qcom: camss: Initialize lanes after lane configuration is available"
  as I changed formatting.
- Link to v2: https://lore.kernel.org/r/20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz

Changes in v2:
- This is still WIP patch series, thus I wanted to publish already
  changed parts to get feedback regarding to the direction of patchset.
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
David Heidelberg (8):
      media: qcom: camss: csiphy: Introduce PHY configuration
      media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes
      media: qcom: camss: Prepare CSID for C-PHY support
      media: qcom: camss: Initialize lanes after lane configuration is available
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 C-PHY init
      media: qcom: camss: csiphy-3ph: Update Gen2 v1.1 MIPI CSI-2 C-PHY init
      media: qcom: camss: Account for C-PHY when calculating link frequency
      media: qcom: camss: Enable C-PHY where available

 .../media/platform/qcom/camss/camss-csid-gen2.c    |   1 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  12 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   6 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 243 +++++++++++++++++----
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   6 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss.c          |  36 ++-
 drivers/media/platform/qcom/camss/camss.h          |   2 +-
 8 files changed, 245 insertions(+), 63 deletions(-)
---
base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
change-id: 20251109-qcom-cphy-bb8cbda1c644

Best regards,
-- 
David Heidelberg <david@ixit.cz>



