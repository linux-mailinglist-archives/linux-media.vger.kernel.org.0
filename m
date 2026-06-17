Return-Path: <linux-media+bounces-65095-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N31ICnJcMmpIzAUAu9opvQ
	(envelope-from <linux-media+bounces-65095-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 10:36:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EEF6979A4
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 10:36:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=jNRlPxaG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65095-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65095-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 215D7314D9EA
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 08:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87F13D1CAF;
	Wed, 17 Jun 2026 08:32:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E5C392C2F;
	Wed, 17 Jun 2026 08:32:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781685145; cv=none; b=kIvBDkYdvDHWQ+QUWuHOF6vSr2HQ6TuS1KbXCEcx6jRRRrb8MJKSyEGV3NyFSUCwa690SmW2kYZi/qmgLzoNGUPCgJbPVmxsmHre48wd84ul/9kc5FFCMxxcbYK4YCCH23i8aCtx169Fmtk4+VKriaxQWgh7SrKXVmy6SaX2TEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781685145; c=relaxed/simple;
	bh=l3uzC5RqqxzM3n8/+39StV34+5jEjjflyVqKlx4xsuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtwtV1zAyBnjUFOThnXaV/ZT3Q0+I/kbSZ4985tMPWDLsAMaY3OOGdvgZSgsfMzNCFGzSlKQaSaVi5ef1v/PbhkDiRJs/tRdeN00Z5W60FQ86ev4fL6GAL4Nw6RuAMrweJkFxqS1ayJtBOWe5vyp5j15wF/cBEZLekCsNn1XGe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNRlPxaG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77A73C4AF0F;
	Wed, 17 Jun 2026 08:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781685145;
	bh=l3uzC5RqqxzM3n8/+39StV34+5jEjjflyVqKlx4xsuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jNRlPxaGoR26GRZPIu8xKr7wWGV50qC6JYNxRZfYham/nAJ2TRCD9Be3l2rlj0AS2
	 xSdYynam6FLRAuS0Qh0GP+yK1mapxw3UUoP6aQkxEyfM53zcLH751WJ0qBCkv9T+io
	 MAZGu4CfVYliOYYshbR1b+Vc2mdjUcnaOfFQgg4erT7OtcFtL0iQC1dGB99vBvAVhW
	 OG4sDQNFv7Aqmjd0nTYw+kqHp7Mj7X4sxqCR6Mf27dsCRh8NJVLQYuDropESd7Z6d/
	 3xoop9zvBnhawWLxT85oSlM2zgSC8k/d1zrFyz5DXPIefcBHl0nwTgAk/Zg/poG8mj
	 +j0gTKQA4pQzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3DDCD98F0;
	Wed, 17 Jun 2026 08:32:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 17 Jun 2026 10:32:27 +0200
Subject: [PATCH v9 9/9] media: qcom: camss: Enable C-PHY where available
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-qcom-cphy-v9-9-83da8a8e4e44@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1392; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XCi14gM/uWIoK+pzO3oCf9ehRkiwcrxS49fsQobP0+s=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqMluW+jF3Lr8VpM2COVKWC6hom9xxExNCesNF0
 ji1AO+ZoZqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCajJblgAKCRBgAj/E00kg
 cgKqEACYPm+mneNrVxrgg9Cz90IrI+Lw0KVPE3vMznPnf2VnIGXHtMbVIWNUoWDsQnWymZqOaM5
 4rLQHTc/Fq3lkDFlYUkuZ21fcYT9/760MUyiSrp5Eg/vhrLYXmO6mZl4bZgh27JYbpiDw+OgFho
 rQH0svTAMn6gfrUe14vrfAmb6+k6B/H4Z0h+CPq6EkGIDFmaECxcmRMOydv+QyBlJzflXHkBO1i
 8yzs+RK0RTVnYQOKKzMDYg5T0uP+vWexNdWVW0wIQRUBU+LbL6CeOB+ZE2hCfckx9y43NpK8tfX
 ijsiUmCWOppkUQqIQn3+GedKo/AHGlzur7cx82zR0m1xKrhDPaV23kK/F3oUovg7e9PWMDaPGUi
 xD5qeyBgQqFcgp5tQY9nVGOkmlb5EQwHslvXOpNsJYlK6Pbp69nHWqm3Obdkn5vmcyAcYD/cFwg
 ndF5uGxec0RmjKzRumFL1+EP3hn7EiF0SeewgJnwW7+QSVKxcbkY7P19xgA73U429k7mp3T2/bM
 7AAFpkWc+qD/vGikV8iENakNtm1ldblBad+4p2nfAIAj+NvHTxnzqKFFwVoAXNdRmWHPSfN6ijM
 0D/mY1PglUVQdddpWGgySSTbFKONS2i4NuTmyLM6o9+YmaFXAuPj0Mcg6GZSgxvG7YsViO6LtyQ
 Amj/5NUDzpYhd/w==
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
	TAGGED_FROM(0.00)[bounces-65095-lists,linux-media=lfdr.de,david.ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,ixit.cz:replyto,ixit.cz:email,ixit.cz:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76EEF6979A4

From: David Heidelberg <david@ixit.cz>

After all the changes done we can now safely enable C-PHY for a SoC
where it's available.

Acked-by: Cory Keitz <ckeitz@amazon.com>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 66171069057f8..ebf8f21b5fa2e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4760,21 +4760,21 @@ static int camss_parse_endpoint_node(struct device *dev,
 	struct v4l2_fwnode_endpoint vep = { { 0 } };
 	unsigned int i;
 	int ret;
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
 		return ret;
 
-	/*
-	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
-	 * D-PHY is supported in the driver.
-	 */
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+	switch (vep.bus_type) {
+	case V4L2_MBUS_CSI2_CPHY:
+	case V4L2_MBUS_CSI2_DPHY:
+		break;
+	default:
 		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
 		return -EINVAL;
 	}
 
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
 	lncfg->num_data = mipi_csi2->num_data_lanes;

-- 
2.53.0



