Return-Path: <linux-media+bounces-64509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4zZMO+qsKWpfbwMAu9opvQ
	(envelope-from <linux-media+bounces-64509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:28:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31866C3ED
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:28:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=WVRyNzN6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64509-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64509-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11C4D304939A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E32D35E956;
	Wed, 10 Jun 2026 18:28:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6590034F48A;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781116106; cv=none; b=Ns7xvOAoJi2gn8VOFeKlxKtB1F0G/2HQz5xQl5X80I6FFeClGFlgsp3487T98s3V/DMOsZfYV0UbdtEg+6clhEeEcSC7U1b9cSZ54dBZHwBgZiWKk+LeIelqpA5IcV1ad4RQuMHhc1ofdO3A9WGTyG18dA/7NIrezpHv2dBP/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781116106; c=relaxed/simple;
	bh=f8SrsdtyM1rgsFTUL63CV9k8mrmfy6y6rj81qhSxPK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpUeT8W0qsTwFmUt5i8wy2QTn5iq2cMceWik5mKLvnBxZmVA0yd9UhypDiCp3liXj32boCHRdxEjTAhZgq2cnFZ9dY16s+jPHVOH3adcRDKxdg6t4+Lf1ELaPKXG4S4o1abSj4iwkA/RQM/ihrbaPAiLLmus+JFg6ArDgL9Ac5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVRyNzN6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24721C2BCC7;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781116106;
	bh=f8SrsdtyM1rgsFTUL63CV9k8mrmfy6y6rj81qhSxPK4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WVRyNzN6QUj29V847ygVs58FUIVVOU8wWYzd2p9OZ6h6qC4xgjcU8YcsLYCypH2y7
	 sz7m1y/ZXmntMy7lo93b8FcvYSpEVDLQ3OtXFt3fPqVbzOnr/fOPBN94/7s3mrwVaf
	 62SkVg6zkKAbQ16nqsGgB1FRa9SaofyCHcy8YFLTbESSn+Mx5TWjBrHhd25WD/msHH
	 IW3PUxXWwOl5us4Rk1zUAhwoorMIuar5yu4XGpnkBYGlnievSXfrYlsuh6kRs78dRU
	 jxbtOLi2LDvZJfYV0SGAqzVQgRIU6KC52cAweJu9uhBm5hGV4Td4/wzYlFrizOAq4C
	 mc3qN4SflqUHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18666CD8C90;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 10 Jun 2026 20:28:22 +0200
Subject: [PATCH v8 2/9] media: qcom: camss: csiphy-3ph: Fix lane mask
 calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-qcom-cphy-v8-2-cd4387785179@ixit.cz>
References: <20260610-qcom-cphy-v8-0-cd4387785179@ixit.cz>
In-Reply-To: <20260610-qcom-cphy-v8-0-cd4387785179@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=fVr/sKiSUifC1zTyd9NJfz2/7dlahZ+nJFq+MKqII4Q=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqKazHrEq72fCIjBjv5GAwcwAD87AwFCvVFNX8o
 UcaO9akx5uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaimsxwAKCRBgAj/E00kg
 ctpwD/4/WsbiW6UstsGTs+oI+7288BjF7yxrlnh9CnB6PTSK0uj2fe50jkbGJWP45Gw0aCYoobM
 eabGhwamHCUahsw7Rmw3ewmJbIOcK5UNB/0NC57x/5XVZXMXYRLYF23AfC9O5wzHUh7RxZ4YeMY
 UNmuHdmhcyAahwrjAZTIBjbeqQUO9yFIFyrzXshdLlZE5ChpodZroYN0p2J7WVD/LDHIFsWEcHU
 Z636bAZ/72L9Zv5l3IUm8FgMZFG5vfHgJW1PdMwILI8UM7iVG71T+nTvfgTDRd0jQQ8ekwBkhqY
 DM7Q0qe9gsaXejuf8nA4+FLNOeMxrof7iw10YuVsI099/juO//84+HNWomMEAdbNN91bnFdnWwD
 lFNNDjvYC1AFxK3ApgbiitMZMP1YQN19hevUBOqZMNrvJ2K/v13fsZkts/LKApZuxcmKfoisHNG
 aWNRQfi+W//gqYg7nDBaiLWnO6B4RklvCJvYA68N3z478jkRIdJpmZGh5U6SG8LxUuBBSKthXqB
 0w+YMH/Zoa8VVbrU2NNq2iQnzQZ7y2UDViAtil3sREALE8OAXeAh8YdNOsxfUVi2w3uv8GYx3LP
 f+BscvKk5Fvs+m+/xtO7udSCXkCUXcb7aXIaQx5wqTa7mzU4sy/k0fVcWCMdmvvvZl4O1yI+wfI
 5CRlocIMb2+jzfQ==
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
	TAGGED_FROM(0.00)[bounces-64509-lists,linux-media=lfdr.de,david.ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,ixit.cz:replyto,ixit.cz:email,ixit.cz:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF31866C3ED

From: David Heidelberg <david@ixit.cz>

The lane mask must be multiplied by 2, but this was accidentally omitted.

Fixes: c94d21ffa814 ("media: camss: Add CSIPHY files")
Cc: stable@vger.kernel.org
Suggested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index dac8d2ecf7995..7c8c0e41bc62f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1114,17 +1114,17 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 {
 	u8 lane_mask;
 	int i;
 
 	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
 
 	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_mask |= 1 << lane_cfg->data[i].pos;
+		lane_mask |= BIT(lane_cfg->data[i].pos * 2);
 
 	return lane_mask;
 }
 
 static bool csiphy_is_gen2(u32 version)
 {
 	bool ret = false;
 

-- 
2.53.0



