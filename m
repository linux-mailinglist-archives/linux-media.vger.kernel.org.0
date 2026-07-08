Return-Path: <linux-media+bounces-66989-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t9GCMCFOTmr7KQIAu9opvQ
	(envelope-from <linux-media+bounces-66989-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:18:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D052726B7E
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:18:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SEhCsOtV;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66989-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66989-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0995E304C35B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 13:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B972727B35B;
	Wed,  8 Jul 2026 13:16:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED4A2264D6
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 13:16:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516613; cv=none; b=Z7cz8MtcXr5Ipli/K2+Dk0Wt28gDcotPrAzTgCOYCTq3C6ZX2o+hnFl15i4rHVS9u+mgBVyIgzLdjVoPn/wmFYYUXEHiEiU68Jfp/+JGiAOn0rvTmfaoN+wr9M5ec0FHKO+RBPzf7VxsmZdHY+GOikgQnI+G9GYSt44Zh/IKdH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516613; c=relaxed/simple;
	bh=Ut6iGecErQbbKq1EQTWQmxnXlyJqeb4XsvAW8iInNCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GukMfIhpHfI+hmOOHup7CKLcVJrNjKI5HK3hpdzNGVQLyE6QBDV4ITx4xpf7zLaGHbsMeXYy5SlMRQHwPcJ0zM64FdZ5JUjJZptNy0N0LLJQnkVSfVL6fZaFHQJ4CJ9236KeLQLnmJuVBrSsSzZuOWvVC+mqO2c7CF53+sBOjcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEhCsOtV; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so689440a91.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783516605; x=1784121405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1g9bGpZfeB1rvyBPb5iXBjrZ5UuiljRZ+IlaR3rBxm0=;
        b=SEhCsOtVjv2RWiXHpbqsbDRUbVxvw6HY9ye18BrUyuQIBjQe8T+QY/Lv7ihx6sSn8D
         EzS51E6SjKoRFeakqlzdnfe9094JBR7EwooXw2KTSNb5034UrbcJWSZQA7/R7FaT9axb
         28WDg+ZmcOYQRanh0cJCqBihZQSNYu9PfvyTuEncur4sSUVbJWAgo/tk+NJaf+U0wNjv
         hDOb+YyRw9hS3KW9cZB0XnL8O1JdklSSGlYEI0WrCDMBTbiLkkez1OO0WiwB/SyYrHsG
         DJ5+3Z3rCvp/nqy5zRBumgFrCvYa4xEIpfvHLQO8Oja7jW2LMgAGWzxKK6pggESiEgsP
         a39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516605; x=1784121405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1g9bGpZfeB1rvyBPb5iXBjrZ5UuiljRZ+IlaR3rBxm0=;
        b=fovtVvLcNAq9qoVT2wOp2GLi2gRPAwx8dEtgDqo4jZff0CoAXmhYX7NKvhWaMDkQjC
         7NUOi/VbHibctAIrPw9c0lMCfLhjSaBRW6+iCcatQ+saD1QM6IA9vvxEosyUfjCWCmaT
         clQRWEWy7Jloc4zwwbkbY6dEUcpQSuvM9CReUjesktDUC9ZOazmhyABG/6r1UNdDKERe
         BfvncEIrtDyoRNsBq3C2/RsTJJTcvvr5XBN2eZeTQIlV+XMGVktgRvDgsqJi1evVweZx
         jX2gk2jBnyXUCuCenNHTjT45cdmh/e57jTIJKw8+By+O7WRsYQPHL/Ue3TNiIisVas6j
         TquA==
X-Forwarded-Encrypted: i=1; AHgh+RpgXBC/q3YpKLpSLocIkc0FO70H4OBGR1rZo6AgUYZx5BSTqoedU8dkdkPltfRmB4SkxawbICSJQ6UoCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR9r41jukp7LTqYLXPretpbn2wH0IOoYiTMlsB1gKu9cUAYFFl
	TfgQkim49SrYY4sF5ooO14z3idnqeNhhgX4zfX/T9xINGOK2ugbtxMUu
X-Gm-Gg: AfdE7ckKu+zsJEkhoO/pWUc2bg2U83Rlb5PeFdsuAPxwuvqVqiOobgr6OOccciKBacg
	B+MNDnHUH80PKpAEQ0kDEHm0mI1S6Bak7Psa0dA5pKx5kv74L2OpqOAWuWWXYcdubUuEQA6tmz7
	d+CFo0fLR1z08OxPthtsgSHdaZiuADZWysflaKhbkj3XS7N9+4puFF6d/X4pXY38FaXUkhFShv1
	6AT9kfBNEFxh+0W8nVY9dRnXZMmqgcRcetH7f7/EnqtP4Q7weLioAydJa3mj96XTfSwwSGXRSLL
	sLmAZdPA8mA4KB1CjYPvoD65+jxjZkfR/kWLDfTVfTT9ppjltch3CH4RP0Ojve7t+PkTV/l8y9/
	QdKQJkvBh2MI0Zah50AXcJ/kRbbMvLKnKDvGb5YPwwyRWyeuheOc52dtSMa0sh/ys3V+7TEc6WE
	LuHvjYbK4iKtRBkLnBcfnywrBbXQ8834yxWRB2z7GPWak=
X-Received: by 2002:a17:90b:3bcb:b0:381:77cd:38d1 with SMTP id 98e67ed59e1d1-3893fb74d3fmr2571017a91.10.1783516605369;
        Wed, 08 Jul 2026 06:16:45 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm22447962eec.30.2026.07.08.06.16.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 06:16:44 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	mani@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3] media: i2c: imx290: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Wed,  8 Jul 2026 18:46:37 +0530
Message-ID: <20260708131637.35132-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260616081517.44685-3-birenpandya@gmail.com>
References: <20260616081517.44685-3-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66989-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D052726B7E

Utilize the __free(fwnode_handle) scoped guard macro from
<linux/cleanup.h> to automate the lifecycle management of the endpoint
fwnode in imx290_parse_dt().

This safely ties the release of the fwnode_handle to its compiler
scope, allowing us to drop the manual fwnode_handle_put() call and
removing the risk of missed puts if new early returns are added in
the future.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>

 v3: picked up Reviewed-by tag.
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 v3: picked up Reviewed-by tag.
---
 drivers/media/i2c/imx290.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 21cbc81cb2edc..5c369c7ee21f7 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -8,6 +8,7 @@
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -1514,7 +1515,7 @@ static int imx290_parse_dt(struct imx290 *imx290)
 	struct v4l2_fwnode_endpoint ep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	struct fwnode_handle *endpoint;
+	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
 	int ret;
 	s64 fq;
 
@@ -1527,7 +1528,6 @@ static int imx290_parse_dt(struct imx290 *imx290)
 	}
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
-	fwnode_handle_put(endpoint);
 	if (ret == -ENXIO) {
 		dev_err(imx290->dev, "Unsupported bus type, should be CSI2\n");
 		goto done;
-- 
2.50.1 (Apple Git-155)


