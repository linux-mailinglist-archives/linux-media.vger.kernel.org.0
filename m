Return-Path: <linux-media+bounces-64507-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Iau6CvGsKWpkbwMAu9opvQ
	(envelope-from <linux-media+bounces-64507-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:29:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C3C66C3F7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:29:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=NF8ZhKEn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64507-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64507-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7AF9304A033
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3908535E1C0;
	Wed, 10 Jun 2026 18:28:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F0349AEA;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781116106; cv=none; b=lgZV9B1048zCk4RW016YH1r/plVK4pMpvFuKIJ/F7vRXdulTMkIa3K68qRxr/OXSMydk9cX6xp0TtHJro5LB92t8rwgEZM7VJC/g7BTK4HHkdHWf1MpfUmQxHIFyCPsMg9372gruEF3IaBBGNH6puFxhpDDvNHnjJrbOJC4bAZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781116106; c=relaxed/simple;
	bh=93ZJSfEZSJ5zjTpfrChvVSSiLVSjQRNkQ88bLdsaWgg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bBxUQDBqWENFhNIXVqAuNPUi2vCjfnuguj+UBC1HVkYHOFeqJO2hR6gdsrclE9zYY6CuhVWtgAEVCFL2drQe5rd5AhavH/ONXK0hfTRrHc3HYp6xSzxlwiTAlpL4n05zxJB7G7LNtEPO1W/rFHqiaCDDLWSq8NCXSck6HJ+Nso4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NF8ZhKEn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06539C2BCB9;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781116106;
	bh=93ZJSfEZSJ5zjTpfrChvVSSiLVSjQRNkQ88bLdsaWgg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NF8ZhKEnLJHIX/rJdEHYN3E8tU0Wh+hWjaW+AxN7tuOYwzgJ1v0tyatheuD+Umvas
	 7xc5BUt+aEho2Xg4nvBmPQ7Lrvn9AGRkxncmUwZ/qJaMbc0JT276LyTdUTx+Zxwu+p
	 rxh5DUQ0zuiCoANbYuBxbgGBlSIZBiSGbzg6TnrlJoXKl1vr1zfh4oSDD29E4iGmVE
	 m4k1ZdE5KOEHInUqIKO7lIyhi//I1+Np73NY2QcrAYA0qB7/3oaM36oeEbqwGpK+0Z
	 wpvLwDcb4JeKIW8J76CXUu5zgpsZmZ4ZB6o1ZW966nhqPFZut/+LQiZz0pixfmfCiW
	 QWlf6HbB/KGgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA660CD98C7;
	Wed, 10 Jun 2026 18:28:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v8 0/9] media: camss: Add support for C-PHY configuration
 on Qualcomm platforms
Date: Wed, 10 Jun 2026 20:28:20 +0200
Message-Id: <20260610-qcom-cphy-v8-0-cd4387785179@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMSsKWoC/23Oz07DMAwG8FeZcibIzh8n5cR7IA5N4tAc2EY7V
 RtT352sEmqKOH6Wf599FxOPhSfxcriLkecyldOxBv90EHHojx8sS6pZKFAWETr5FU+fMp6Hmwz
 Bx5B6jGSMqPvnkXO5rl1v7zUPZbqcxttaPeNj+l/LjBIkks2OXReA8bVcy+U5fotHx6w2p8C0T
 lVHQVvOPoBD3jv96wgQXet0dT6yox4ouxT2zmxOA7bOVMdWa6SkYiS7d3ZzVu+cXf9kyKSCSX8
 dba5ebB2t9yAxBGtd7/fOtc62zlVnFEXtuAPweXPLsvwAxrmRR/ABAAA=
X-Change-ID: 20251109-qcom-cphy-bb8cbda1c644
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6501; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=93ZJSfEZSJ5zjTpfrChvVSSiLVSjQRNkQ88bLdsaWgg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqKazHYqli7fxnFeO44lHtE9HpNMAk+6wDoRrdO
 20JCb87bpuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaimsxwAKCRBgAj/E00kg
 clXsD/49H3qLZorEIqEEMdjlAE3T28quYx4W45vR3r51Yp7PHUz+vxGvTs1bzOku/nk8sCEFWXj
 m+L7W/TQwIuBn8dPGicN341+NIqztrXKw9yaano2MvT04MX/r4yaBBTUoSoz+N0CwTntCAph+8k
 f+LbheECxSlvWfsH4uwi5ebuLo3TNr7xEUthSumW4Tv3dWx77PNV8aYWInDNHNpOhDQYuf5n4OZ
 JDuJRvJsJ+PpmszEFORrR9YJjrcEb9uopHoZ5x9LLYwZC6Js10auhEnCrxtpNWNWIrwOWRRqGDN
 NqUGWcWoOG3+N7JJ66J5iE/68i70UEZvWdSZdB4q9/2I5oURC0RNL4pEZasrm5CwNiaYxz1IKTk
 a+pmR1TMJ3uC8JDV7DWKwCAB7pQji4fVqw3jwHujebJs1G3/ejynKaL7wqvRIfQ4kScgw7Ajd51
 /BA0pQuiKQ6CH75EWHiV/uKLLO26UjahdvoIe72pJBr1mne7HUBxeF+dQpaGz2iey/bw8Qd+wMc
 chWRrhYXJHOLPoib7kLOkSIkS54OeXJbcEt0+zrh89gFF6Tt3OGisBOlzpMxRM6MypIp4oLsaFJ
 YlZ+w/EWhk2v/c5wGZhtkZg9RH280Sc/Eq39z8SguyuySijHFj7QUDYqAChDCCVKdEgdL8GLqRF
 3jIpYa9KXowgClQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64507-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:hverkuil@kernel.org,m:nihal.gupta@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:stable@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ixit.cz:replyto,ixit.cz:email,ixit.cz:mid,codeberg.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9C3C66C3F7

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
Changes in v8:
- Refactor the for cycle in csiphy_is_gen2 same way as
  csiphy_get_lane_mask(). (Frank)
- Dropped T-b/R-b/A-b from
  "media: qcom: camss: Account for C-PHY when calculating link frequency"
  as I did refactored the commit to not rely on `csiphy_id`. (Wenmeng)
- csiphy_get_lane_mask calculation fix. (Wenmeng)
- csiphy_lanes_enable now uses csiphy_get_lane_mask. (Wenmeng)
- Link to v7: https://lore.kernel.org/r/20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz

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
David Heidelberg (9):
      media: qcom: camss: csiphy: Introduce PHY configuration
      media: qcom: camss: csiphy-3ph: Fix lane mask calculation
      media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes
      media: qcom: camss: Prepare CSID for C-PHY support
      media: qcom: camss: Initialize lanes after lane configuration is available
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 C-PHY init
      media: qcom: camss: csiphy-3ph: Update Gen2 v1.1 MIPI CSI-2 C-PHY init
      media: qcom: camss: Account for C-PHY when calculating link frequency
      media: qcom: camss: Enable C-PHY where available

 .../media/platform/qcom/camss/camss-csid-gen2.c    |   1 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  11 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   6 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 229 ++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   6 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss.c          |  33 ++-
 drivers/media/platform/qcom/camss/camss.h          |   2 +-
 8 files changed, 229 insertions(+), 61 deletions(-)
---
base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
change-id: 20251109-qcom-cphy-bb8cbda1c644

Best regards,
-- 
David Heidelberg <david@ixit.cz>



