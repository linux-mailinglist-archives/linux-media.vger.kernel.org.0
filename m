Return-Path: <linux-media+bounces-62752-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBtFKjROFWpMUQcAu9opvQ
	(envelope-from <linux-media+bounces-62752-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 09:39:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 853D55D1C7E
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 09:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B9F7300F5E6
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 07:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572163CC7D8;
	Tue, 26 May 2026 07:39:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-sc.amlogic.com (unknown [64.106.246.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5763CBE78;
	Tue, 26 May 2026 07:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.106.246.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781154; cv=none; b=G25nz5YxaF2cMbPPqOJSVoQDOh2KbxkBEllvCa3IlL/cmavlxEW5VgJnJQfMytfqzzbblgaJqd1XFCCcWUUZRvADD3eb8LRQoNvrmh8DrfYhNvVYBTSralgveokgXpmZBpSih1TTarNXAcyClMao0ixkwxWs3gkHzOWIOaiATh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781154; c=relaxed/simple;
	bh=EIbyEqiJ64VIutoxUMLEEjiZLuEMFFURkZoqXNKTANY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KwPATTz9j425Uab8RRQ3syp6NNzy4O3Be38WPEuEsymvOFGaUjm8FKDMSWV3CJ+iYVcUEvzx/q419OvPivOdmbDSKp9bjsYbo6d3X6aDeRl489j4pfHRpWwDhvbfrf/5o1q9XJqZLaQaywigubLF2e6EXx4GCl5G/FvWDum8e7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=64.106.246.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from [127.0.1.1] (10.28.11.83) by mailsc.amlogic.com (10.8.11.35)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 00:34:05 -0700
From: Zhentao Guo <zhentao.guo@amlogic.com>
Date: Tue, 26 May 2026 15:33:36 +0800
Subject: [PATCH RFC v5 1/6] firmware: meson: sm: Add video firmware loading
 SMC call
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260526-b4-s4-vdec-upstream-v5-1-c6edebf5ea89@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-0-c6edebf5ea89@amlogic.com>
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-0-c6edebf5ea89@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779780841; l=701;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=EIbyEqiJ64VIutoxUMLEEjiZLuEMFFURkZoqXNKTANY=;
 b=7/SFWew3pk2OIXRhw+gXjJ6zO9SpMclslVvqDIMdvdUYP6BkKPPRYCWQTW1BLj6aozUHtdc6i
 xy42EToyXR2ARaoPfx0rblMuNp8i6nC5QlQvbmbXvmqzChAvXkWfCVV
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[amlogic.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62752-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhentao.guo@amlogic.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.773];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amlogic.com:mid,amlogic.com:email]
X-Rspamd-Queue-Id: 853D55D1C7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
table to load video firmware.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 drivers/firmware/meson/meson_sm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 3ab67aaa9e5d..5da6c65d684a 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -47,6 +47,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_GET_CHIP_ID,	0x82000044),
 		CMD(SM_A1_PWRC_SET,	0x82000093),
 		CMD(SM_A1_PWRC_GET,	0x82000095),
+		CMD(SM_LOAD_VIDEO_FW,	0xb200000f),
 		{ /* sentinel */ },
 	},
 };

-- 
2.42.0


