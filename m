Return-Path: <linux-media+bounces-52727-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLpvMiQkj2lNKAEAu9opvQ
	(envelope-from <linux-media+bounces-52727-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:16:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 186B31363F7
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA25730BC127
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A8C36073C;
	Fri, 13 Feb 2026 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pJ/BN9SE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2E0360731
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 13:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988510; cv=none; b=qGbFZxsfedmEFFNXTKJHACOXcyV+QjOTwD1806CH0DYY1Ch285K+1QT60nykj/g23LoiDYDy91IApdtGLa9POWGAxZEKxxmzjCjyrkttaGSeDCKACrQwC3MI+62rg3QS03/Zx2NztJPBOsxRsbm1AsMvcotoHCNXjyLgEEuKMrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988510; c=relaxed/simple;
	bh=TvUhDjM6zXcYKCp6b8M4X+IbmdcSfgsD/ePyNdzN+cc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jRQFDIcEMybOs4b+aJqxXIbOOF2z4PGeb3sDqAIULEHNDyR7Ww/lEQIFKNSBi3X7CfBTfTCgGV8O9shdVJU+aMncpxazH3H+tREqngE8IL6yeiJa7lz43Uk7M+Bj5zjHnS3+f/B5NEEJ219L6qv9bclsavca5VMG2muAepWD+JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pJ/BN9SE; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65808bb859cso1196453a12.2
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 05:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770988506; x=1771593306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GySLZnrMCil+p9dimkQbolV3qk7LEqm5vns9qVb7ZEQ=;
        b=pJ/BN9SEP+zF4Sy9F8FJ3xwH0Wf3fqtS/K4Zib4kkC/yBv52w0o3utRscLTpbkAH4s
         4wG/LPT82dDXKDBTAndk4ihOOjT8+HWgw+0fbMiV488pMo6Vxo8F4yTUBXBrbD2HHRcW
         uQVhxNSXJjCm7EThW+aJAExV5yk5/HIHhn+3kFvmRXfkiWkuRMQ5j2sS/XkRqKhLbcKI
         otETEoI+6+HQaQyJfzCZ1bTHKRn75gU5op6cJXHP+0klYilOxTtqhn7iqw7FnVchKWqK
         SvUuPk1LpsmceGcFPlb/Ty3Ozwl+yfsruz54shweve01+Ir56EHKAt6i7JhXcUHgKtOk
         g2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770988506; x=1771593306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GySLZnrMCil+p9dimkQbolV3qk7LEqm5vns9qVb7ZEQ=;
        b=O+FMYDLXz/VANQF6BfDXnfK00ahrRkcelnHK8BLC72bA5+dNAazlQNjo7zEhBjjyX8
         CpVWX+p/gDDmxqihW61DUOnlFo3YqmCyGYa1CTp9L+PUECCd74KImcUEy2WHSNu2o2bl
         ITcNGP3S3afpxK4WfD3BnhT5akvyzIx+pPgcMezYQyZstV0l9vwUgtmH0KKHdS4O8yBS
         lOsDAC6uICGj6qd3mIubmN1DC6kXjc2J+mACWyjynbMgqHzvQ10vv9ClfNzuF28XISZ8
         vI7Iu+73gYyY2rGSbRpjAvXPEF5va6Xdf7pGUpMoUnoZ6qiT44k2Yqh7hMAogL7KPaXI
         gyEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7QJ8lBxxUw+lVE3CilJAgimpsRTb8v/NdQdsjcBSf6v4X8SkShvrLmecsR5PqD9JzlTy+0d8m0BasHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLWFlZK+/ISoPl6XDWvzZu9Rc43Nhed4FQY8I1pOhjyXymP19B
	sP0SC6HFb4CVL3/qIGfzXuuDLpJ3CeaBohZ/chwiLrNC2RLLgw3v8fb2g4wYicwzePAWgbQ6nuR
	/YxBw
X-Gm-Gg: AZuq6aJBlRaoqqlkoaG19b8Y7XckSrXbl0jy5ISRZeHjtiY4xvXrxw/x8X3jEpGutTS
	yV/BpY/OhpwjaSFtbBfshvbjj4ZlpYyZnhrdTOgs07SP86fzc+DD1Fl8lniXTSeW6KPmjB/5Eop
	0Q3B30Ze0U3IwlVWjbhttpeR63LJnhKuXHV1NP99o8EwSijrWUQJOg5Vpwu1bYjH/GY0sPVuOMF
	DuQdHf2ZBLfc/wq8JJ8wYSZHf1KpCNMOtlW3CaNMGUTjbOzyzzBYZgZ/aswMMipN/NAkcOVJwWG
	9OH54fKJ2lLEsuZCv+9E0sF3ZchuwYQYVi3BPn9OzorXFZoab85pJqpl7/lNtFbYhsNloOvGpM/
	wtQMumbMWUhVZRxejid6uhVgIDtmuW68emwV3UT0EliIoeo4zBKV1n9WcG8fG4i0ZjEinysOTEa
	SBiN/UgmNBWvl0MwATVdM2VJVExhr5/5p/yzpsRM2HYPp+wsV3NXaOfvPez6ysQ/6sz4mVE9BfV
	8EE
X-Received: by 2002:a05:6402:5250:b0:658:bfb7:f086 with SMTP id 4fb4d7f45d1cf-65bb119c373mr839450a12.23.1770988505704;
        Fri, 13 Feb 2026 05:15:05 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bace3fc4esm674231a12.0.2026.02.13.05.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 05:15:05 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Feb 2026 14:15:02 +0100
Subject: [PATCH v3 2/3] media: qcom: camss: Add SM6350 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-sm6350-camss-v3-2-30a845b0b7cc@fairphone.com>
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
In-Reply-To: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770988501; l=16195;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TvUhDjM6zXcYKCp6b8M4X+IbmdcSfgsD/ePyNdzN+cc=;
 b=asIhzfwbzdYpLc2/H4Q2StVl4cwiq0oZprETTVVw0CRUBcD40Mr3c8An/VEZToBjkGd4fWpkP
 q9a74cW4p9uCrLLX1mUhONXeCl5P0nLWwF11Eh+DL8V6Vat9yAqYWAx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52727-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 186B31363F7
X-Rspamd-Action: no action

Add the necessary support for CAMSS on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 261 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 389 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 415483274552..2b0c21c90e30 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -399,6 +399,126 @@ csiphy_lane_regs lane_regs_sm8250[] = {
 	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* GEN2 1.2.3 2PH */
+static const struct
+csiphy_lane_regs lane_regs_sm6350[] = {
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0904, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0910, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0900, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0908, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0904, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0010, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x005C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0060, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0730, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C84, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C80, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C88, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C84, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x070c, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0230, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0210, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x025C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0260, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0410, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x045C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0460, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0630, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0610, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x065C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0660, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+};
+
 /* 14nm 2PH v 2.0.1 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_qcm2290[] = {
@@ -1011,6 +1131,7 @@ static bool csiphy_is_gen2(u32 version)
 	switch (version) {
 	case CAMSS_2290:
 	case CAMSS_6150:
+	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -1105,6 +1226,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_qcm2290[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
 		break;
+	case CAMSS_6350:
+		regs->lane_regs = &lane_regs_sm6350[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
+		break;
 	case CAMSS_7280:
 	case CAMSS_8250:
 		regs->lane_regs = &lane_regs_sm8250[0];
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5baf0e3d4bc4..7dc937d018f6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -343,6 +343,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_660:
 	case CAMSS_2290:
 	case CAMSS_6150:
+	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8x96:
 	case CAMSS_8250:
@@ -2003,6 +2004,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 
 	switch (vfe->camss->res->version) {
 	case CAMSS_6150:
+	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd..b53fb94ab54a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1703,6 +1703,253 @@ static const struct resources_icc icc_res_sm6150[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_sm6350[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy0-0p9", .init_load_uA = 80000 },
+			{ .supply = "vdd-csiphy0-1p25", .init_load_uA = 80000 },
+		},
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy1-0p9", .init_load_uA = 80000 },
+			{ .supply = "vdd-csiphy1-1p25", .init_load_uA = 80000 },
+		},
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy2-0p9", .init_load_uA = 80000 },
+			{ .supply = "vdd-csiphy2-1p25", .init_load_uA = 80000 },
+		},
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy3-0p9", .init_load_uA = 80000 },
+			{ .supply = "vdd-csiphy3-1p25", .init_load_uA = 80000 },
+		},
+		.clock = { "csiphy3", "csiphy3_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_sm6350[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "vfe2_csid", "vfe2_cphy_rx", "vfe2" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite" },
+		.interrupt = { "csid_lite" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_sm6350[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "camnoc_axi", "vfe0",
+			   "vfe0_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "camnoc_axi", "vfe1",
+			   "vfe1_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "camnoc_axi", "vfe2",
+			   "vfe2_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "camnoc_axi", "vfe_lite",
+			   "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite" },
+		.interrupt = { "vfe_lite" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_sm6350[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 0,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_icp_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
@@ -5233,6 +5480,19 @@ static const struct camss_resources sm6150_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm6150),
 };
 
+static const struct camss_resources sm6350_resources = {
+	.version = CAMSS_6350,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_sm6350,
+	.csid_res = csid_res_sm6350,
+	.vfe_res = vfe_res_sm6350,
+	.icc_res = icc_res_sm6350,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm6350),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_sm6350),
+	.csid_num = ARRAY_SIZE(csid_res_sm6350),
+	.vfe_num = ARRAY_SIZE(vfe_res_sm6350),
+};
+
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
@@ -5329,6 +5589,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
+	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 6d048414c919..d323c105d185 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -81,6 +81,7 @@ enum camss_version {
 	CAMSS_660,
 	CAMSS_2290,
 	CAMSS_6150,
+	CAMSS_6350,
 	CAMSS_7280,
 	CAMSS_8x16,
 	CAMSS_8x39,

-- 
2.53.0


