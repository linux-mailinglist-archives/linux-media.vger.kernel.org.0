Return-Path: <linux-media+bounces-65086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /57qBRRcMmo1zAUAu9opvQ
	(envelope-from <linux-media+bounces-65086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 10:34:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6613E697971
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 10:34:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=iWhi8ln4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65086-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65086-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2DC9309EBCE
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 08:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061963C0621;
	Wed, 17 Jun 2026 08:32:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413B717BCA;
	Wed, 17 Jun 2026 08:32:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781685145; cv=none; b=fpf7a34F9jftJj0yvRBQoLxXbBNyMIj2OTibd2kt7Q0haQLJLSpTyJN4l9xAwiVqtSHcy5kSgbgF69y678KuBu2H9s9aL94QfX7V6AlRh6j9WMhN16Lm3X1/22gvktedzAz/cb+ExIeIKRUudUFEUyjp/qOWTcnDpsuN6OtYA5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781685145; c=relaxed/simple;
	bh=Uk/b7YYDhvgsGviOg3h2t2SDHyXuI+Sg+OG/3Q4uIb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXmuYiXIsIVOCkijnEkH6kPDW9fv0fsQTzlMtx9ctico5CR9lt4oijoE+V4dX76BLZHa81stSOLzZ5w4lseitPk9ENdFFqVfnSauoV/K+jARB92Uy9poM6iQvG5N6Z67fJ1R8gDvLz3mUTmlYysYubDkhU0cfNzAhs0qO93QljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWhi8ln4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCE74C4AF0E;
	Wed, 17 Jun 2026 08:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781685144;
	bh=Uk/b7YYDhvgsGviOg3h2t2SDHyXuI+Sg+OG/3Q4uIb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iWhi8ln4YkX3BfbRR4MQrQCIFd9ZmSwuSNISfI9CjoJK0GAPCdgmot+TYgFJ9WakM
	 re/fuOxqKeCkOFbWYTzjZmZFM5tAkNZZ5Rw/x9DiU9CxDuh511YWH/BuePBlfVvWUY
	 vePeUnkCBNj4yqYeTfej5IiOf6UGPteP2RAGfqK7Q4o2UOxyByR1JdTM6ytl3hz4pS
	 UVJ+XBV0xxlq3FBxICqDiCBtxpAFFPxLUFMpE6lR2/voOX+6gKZNDalKsp3OyFzBtv
	 z1kU/b5eH0V6by5b0KVxtnM+WD/ve8yNhqKuUXvTI7GMrzH6Xeaz5hzs1bdYNqYg6k
	 0w1820nHKsuhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BE9CD98E4;
	Wed, 17 Jun 2026 08:32:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 17 Jun 2026 10:32:19 +0200
Subject: [PATCH v9 1/9] media: qcom: camss: csiphy-3ph: Fix lane mask
 calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-qcom-cphy-v9-1-83da8a8e4e44@ixit.cz>
References: <20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz>
In-Reply-To: <20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz>
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
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4gZLnNPEAXXeOriBAOpQ0RLijJCSPBaruO2JK2La25Y=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqMluVDaYt23kX5sYernqkW2OsBYpSt53wLLfQS
 FNNVrQ8LuuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCajJblQAKCRBgAj/E00kg
 cpeWEACHOPgSurC7v8KGNNYxgItBKG1rKNOXQxucd90zRFVR0vaZwNc+haE3e8IfalVBeGQR2Kn
 jzcJ/Op5+YbTkug+N+3vX1bCHkhURxFA2MO5rCAYgDR9qQS73NUn3HOJFYew5wzADDOmmRDnQHl
 SUnhn64zwXaXRSp3D2YRZEi3ALlINLmNzgzR3kxAoNsGeuueVl9CPjqqHqGVZd/PEf/R4r5goBO
 R1toPw9/f/bvvIOvZW7d1byETo+ckbFAMqG0d71QdSICNmv5E/WIBk3blWzbgtuye3K28KZDjd/
 dLEtRacIj/N2QcHFB8g3tVacsaKYKGVKfR6vEuCeOGGK1xzSTbWiU6oUBlTLv5QTSwntc4PWFBe
 5KX9vmCjM1hxu4frm0Q3bWzEmrR7V8a5vUh2hYUWJI81uXSY6ef1FMRNULaIZFr+miBP8+TIwAC
 g79GkR/Cpm73yJprj+QdwLeiInfctf8G5DHJUKnl9C88sPK+U8ddyfVmVQ0Q/W5gD6pvEYBpPUX
 b77FLtIe5k6cFYKfWKeFok1JyNHR/DYK7/kYETYk+82nFf5L2raUDT9dLqVFAPOBN0f5s4UdSDO
 OpnfGzlsmWs9OdNZSQA4fm3QfdbE10NGUiLbEsoEoTLBAF0rBCi4+xSqw8RKL2Iony8PNw3TKMt
 TOx0HDNhjUkdD4w==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65086-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:hverkuil@kernel.org,m:nihal.gupta@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:replyto,ixit.cz:email,ixit.cz:mid,linaro.org:email,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6613E697971

From: David Heidelberg <david@ixit.cz>

The lane mask must be multiplied by 2, but this was accidentally omitted.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
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



