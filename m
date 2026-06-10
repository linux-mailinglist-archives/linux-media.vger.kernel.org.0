Return-Path: <linux-media+bounces-64508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GFDIOB2tKWqBbwMAu9opvQ
	(envelope-from <linux-media+bounces-64508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:29:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE2866C42B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:29:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=IBRI3jmr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64508-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64508-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82EAA30BC04E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE6D35E1C1;
	Wed, 10 Jun 2026 18:28:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6586A349CFB;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781116106; cv=none; b=tBTdwajhL+wBihintRpGMmiSAaTseynSBECGbmWY2h7mKkXi6snnPzO7rLTq03kh3xq5WMF/TVT6oAXVN1Cey3CLOkTpvuhGAj9W9uSJ9HUoh/LmpPg8HkEd4RsbyuvuN6JCK1uhbU77gmH8yU6YmKgVhMeOsVd9e9gw1Kh9RbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781116106; c=relaxed/simple;
	bh=l4eCm8AIWkDUoE3WTsV7Zxme0lc2GyFF0+eYcS0+My8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nok7uILWQoQSgcZ2J6xbcsTojyD3NKMADSe5RzZrEAsDx1+iuD9G1IXYt8BoeDxf9v11BVINUpoE0S2U/B1Y+9Kt8Q1ReOq46FfGVyoB+g+QGVGNi5rObTMk/5UTypyYkqhMHkm4LZkoF99NzPyuktK62N52SHYxCa7ia8/uMOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBRI3jmr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14B93C19425;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781116106;
	bh=l4eCm8AIWkDUoE3WTsV7Zxme0lc2GyFF0+eYcS0+My8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IBRI3jmrrMJRj9X9ZK0ApOGLx4DAyC+Zer2YIwpn3QvJoQM3ZPrPofgXiut4tTDhe
	 +hMYtjoApVH/FOJ7NK8rgXPNnOmpsikBfQGrK1NCdD4BZMGDjkUazs2KJwTtk2i6O8
	 eSJNINMGAsm7YlpTzuOHPKjiP0dPT2Me5gdlOZzJpvxtJ6yS85CR5EihDpycYEOmPE
	 gwEQRy8OuLbg4IEDnFtUf1tvU7TL3qo3nB4p2MkyFhYyYdbsE4lmulr5Dzyez99ZXD
	 KheNNjchzMLE+I55OVAlzrTdjAYFp9sdTJ4OeahKtMqWuRXUBY5BUrlHiurt1a593b
	 hdoQLd0fQ7XYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08056CD8CB9;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 10 Jun 2026 20:28:21 +0200
Subject: [PATCH v8 1/9] media: qcom: camss: csiphy: Introduce PHY
 configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-qcom-cphy-v8-1-cd4387785179@ixit.cz>
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
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=X7AOYJ4niyGHoBf3ode1cySyXfbTbBCjzlnLn/fppe8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqKazHsNzKao2StPMyomhqbIoXjZXvSQY9/KTlw
 PnpRtBXziGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaimsxwAKCRBgAj/E00kg
 cr47EACr81qGwSvjaBRUeVJd6oZTUjqz2DS1aD1LzLWMhs7id2+srd+Go9Izkmsgs2tU1BcPJ+j
 HMhI24Jx0rliHj+YhBtEVgl86I/6834xcHXY0UUoSj3WCA3cnoqS7EF0C0pYDiDFzbbZbnJBhtg
 hfGS3/GgnCTZdqA/tz4dUtmp9YPiUW0S2PmwrIN8dMMCe/4r9mwjOj7hc2iIRpzmQenMooF0OB8
 0E118ZjkIqfFIvD4olpfuhkokLnl8cZgMzUvUFMw2snufBqngE4ObEsoIXEf/q2vmd8ZzXlvsnb
 btB5mzV30F4XDAC++hU6LqhaPM89fcPeD7vLo93jeYWcffO3UtecIB8vD0iauCBxd92tF1NhIL1
 Dqn/4P7yVNkbPtk+TyOgidokrjMDj+TxMwTuARU65iN7+Q7PWB//RwjJDkSoB2yn4LQH0UewIeX
 T5/sv2g8g13OZq55Et68yOAkdscZ/xzoA/wSHw8absSPcbaXXeppww8XWR4kd0oKEKo/lIt8op2
 Et5qiXjZiq87xDJf6ZeV1XJNPP1nUgohQx/yigfMLnTzTBWVt7u8Ja/F2817QqAWIMDM6aJIW8l
 Mly9gjmNJ/nfg1gHIKjE6lvF7wGMpjCSdYPg7AS6pVs8J6+U/f0hm2xoHfVZfSJ+VoudZWaCy1c
 bu4LwYriI1PKG1Q==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64508-lists,linux-media=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ixit.cz:replyto,ixit.cz:email,ixit.cz:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FE2866C42B

From: David Heidelberg <david@ixit.cz>

Read PHY configuration from the device-tree bus-type and save it into
the csiphy structure for later use.

For C-PHY, skip clock line configuration, as there is none.

Acked-by: Cory Keitz <ckeitz@amazon.com>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
 drivers/media/platform/qcom/camss/camss.c        | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 9d9657b82f748..2ebb307be18ba 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -25,21 +25,23 @@
 
 struct csiphy_lane {
 	u8 pos;
 	u8 pol;
 };
 
 /**
  * struct csiphy_lanes_cfg - CSIPHY lanes configuration
+ * @phy_cfg:  interface selection (C-PHY or D-PHY)
  * @num_data: number of data lanes
  * @data:     data lanes configuration
  * @clk:      clock lane configuration (only for D-PHY)
  */
 struct csiphy_lanes_cfg {
+	enum v4l2_mbus_type phy_cfg;
 	int num_data;
 	struct csiphy_lane *data;
 	struct csiphy_lane clk;
 };
 
 struct csiphy_csi2_cfg {
 	struct csiphy_lanes_cfg lane_cfg;
 };
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7..072c428e25166 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4761,19 +4761,23 @@ static int camss_parse_endpoint_node(struct device *dev,
 	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
 		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
 		return -EINVAL;
 	}
 
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
-	lncfg->clk.pos = mipi_csi2->clock_lane;
-	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
 	lncfg->num_data = mipi_csi2->num_data_lanes;
+	lncfg->phy_cfg = vep.bus_type;
+
+	if (lncfg->phy_cfg != V4L2_MBUS_CSI2_CPHY) {
+		lncfg->clk.pos = mipi_csi2->clock_lane;
+		lncfg->clk.pol = mipi_csi2->lane_polarities[0];
+	}
 
 	lncfg->data = devm_kcalloc(dev,
 				   lncfg->num_data, sizeof(*lncfg->data),
 				   GFP_KERNEL);
 	if (!lncfg->data)
 		return -ENOMEM;
 
 	for (i = 0; i < lncfg->num_data; i++) {

-- 
2.53.0



