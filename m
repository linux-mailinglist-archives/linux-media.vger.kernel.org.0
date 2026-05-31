Return-Path: <linux-media+bounces-63178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEM1Cx0zHGoOLgkAu9opvQ
	(envelope-from <linux-media+bounces-63178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 15:09:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A32616383
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 15:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0F633045EF4
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 13:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB2E38D688;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGOr7Aw/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BE82147E5;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780232893; cv=none; b=KjSpnS2K9hcxJy33avsG1vJW5Th7FSe3in0HOoi9QHSwz2pcpf3Iw/VK28rm6Vs2aROa2WXqwGdpMgxNI7YnwwzTFiv1T5RqVaT3l5UkONGAEqzbA2qy2LfoZw6dLK6ef4OZa1rBG4enqPoSeSZWlmBzmQ68If2gU+KE+kfhs2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780232893; c=relaxed/simple;
	bh=7NFc4D+gNU9WgCqU34VckhTQYPbD996ctL86LivCl9Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i1APjbvnNppS2YlUkrW92nuRZGkKtVX25OU/Btc0Y0p/99gSQH/W2AY/lPG1Zh3va2RMRTAS/vrQ26WN0zf0YG04iE01PMxoQOIOdc88gVr6xZZffEucZETDnwGqfDsKd4NCnQ+8YPeY5T7WJ9peUD7uUbOBgy8Pp920wvBVqVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGOr7Aw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7E21C2BCB4;
	Sun, 31 May 2026 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780232892;
	bh=7NFc4D+gNU9WgCqU34VckhTQYPbD996ctL86LivCl9Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OGOr7Aw/0nGPaKc26Dte0qi0wy4HOSGzO270xoRusxwY32CX0L66wiAlHf8zWaPS3
	 5nuUMBfLP4ZURIc9BfxoeFHnghYvuDvnPYpAPoFTbOsBDp2s0Jj/hqUHsGz0YhTudJ
	 1v4wdZO8GtBzwuZwUTOWkZ7AGWeVdXIZkiOO4QDoFHpR6rjt39sE80dlvE7YQtZuIx
	 nfwhB/IEsSVNYh4+nZMty86s10H1E8XCdPqI9etAoaq9GglOgR65S5FoKU+RgwUip4
	 P0g9Hwx9aYnrcX4JThI6a9HOpIyKW4Z/KHBe6i61iY70ohJEZWbHk4E1pvlyvm97oR
	 BhsOCbe9dbonQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0D3CD6E55;
	Sun, 31 May 2026 13:08:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH WIP v5 0/9] media: camss: Add support for C-PHY
 configuration on Qualcomm platforms
Date: Sun, 31 May 2026 15:08:08 +0200
Message-Id: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALgyHGoC/23MuQ6CQBCA4VcxW7tmZk+0srWzszAW7DDIFoKCI
 R7h3d2QGDCxnOP736LjNnInNou3aLmPXWzqNNjlQlCV12eWsUizUKAsIqzljZqLpGv1lCFkFIo
 cyRkj0v+15TI+xtZRHHZ7cUrLKnb3pn2O/R7H059UjxIkOlt69usAjNv4iPcVvcZGryanwMydS
 s4FbbnMAnjkX6e/zgGinzudXEbsXQ6u9EX4dWZyGnDuTHJstUZXKCJnJzcMwwehhfyOTQEAAA=
 =
X-Change-ID: 20251109-qcom-cphy-bb8cbda1c644
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>, 
 Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5648; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=7NFc4D+gNU9WgCqU34VckhTQYPbD996ctL86LivCl9Q=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqHDK5OvDliwdFd4ciGUqTIHVV6Xbaogea9XuOl
 1e4ry0D5aSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCahwyuQAKCRBgAj/E00kg
 cuV/EACc6pkZhbAoaEVTUeVVaqaB1WBdiVdybhPYXea8nEWd3q4TOcn1Vr1afdKt/LgJCeqnQIU
 fpZervnJSu9gMIP0+zpzBRSDOZdkWAE8HL4toqT704cTLp6sdkNpFYoiqfbyNExycTfu+FBgAa+
 1CaXHIMWh6yjhVkjvLG+6UUTummDUxb6Mg+cMb1ALYrl7623MD7m6ANx7u8J5h51oghaPQKG+Oa
 MrecESmUFhESpby9aISpaH3G6jWSmZ8lD/AfkfngNzMLZ6EetJrdIqHsEbMtQcMYm4cPeCtvYx/
 4+lW35WgKDiZcrgvHyGsPnIPBFRLiBt943h+YtSusU4YoWBgqtbqwkLbVD7A9TDVP/6DJBtslsX
 iNmh9FWyNNCCliMs2t0XJBQ9t2WoJx6uKLJ6J7WZrA3BdfECHr9w1f4SCBgmAQyn4+mMZOcBAAf
 RMZnQOCfTI3VxNBWgNkA2uvCY+rDvdK0LbX+i9NsWKlfZ88DU+GIztbtiBulB7861/7ORNoCBq0
 71Z60+mGoc9scOMM9Hit1oXAyEPehoW0IjbMGvtX6zEYfThkKEjR+3wnflbNqqAxlQk8emXjbLv
 CM+L3uvLPHy1H1yRl4Rc/rk8n6eMhcfWD6o296Hy7m1lkzLgiPEU0VICufXgcr5rRKXtzUCOBSN
 EJZGSxHFzrOgBRg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63178-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:replyto,ixit.cz:mid,ixit.cz:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,codeberg.org:url]
X-Rspamd-Queue-Id: A8A32616383
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Casey Connolly (1):
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 C-PHY init

David Heidelberg (7):
      media: qcom: camss: csiphy: Introduce PHY configuration
      media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes
      media: qcom: camss: Prepare CSID for C-PHY support
      media: qcom: camss: Initialize lanes after lane configuration is available
      media: qcom: camss: csiphy-3ph: Update Gen2 v1.1 MIPI CSI-2 C-PHY init
      media: qcom: camss: Account for C-PHY when calculating link frequency
      media: qcom: camss: Enable C-PHY where available

Luca Weiss (1):
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.1 MIPI CSI-2 C-PHY init

 .../media/platform/qcom/camss/camss-csid-gen2.c    |   1 +
 drivers/media/platform/qcom/camss/camss-csid.c     |   8 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |   8 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 355 ++++++++++++++++++---
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  11 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   8 +-
 drivers/media/platform/qcom/camss/camss.c          |  36 ++-
 drivers/media/platform/qcom/camss/camss.h          |   2 +-
 9 files changed, 355 insertions(+), 75 deletions(-)
---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20251109-qcom-cphy-bb8cbda1c644

Best regards,
-- 
David Heidelberg <david@ixit.cz>



