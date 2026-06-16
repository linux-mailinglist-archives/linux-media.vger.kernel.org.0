Return-Path: <linux-media+bounces-64967-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UcZ6OTIGMWoJagUAu9opvQ
	(envelope-from <linux-media+bounces-64967-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:15:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CBA68D139
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:15:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fcEiDylZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64967-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64967-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8784630453BB
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 08:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E1D3B42FE;
	Tue, 16 Jun 2026 08:15:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A33D3321A7
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 08:15:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781597732; cv=none; b=dEu9690LtBpsvHGHiRHkysCBX6fc1id+RrssxcPihL1Qk7AWVU6xApk2YYPJ4+ZanxktsX3g3QmbKUkrRKVIpNNS7XaQGlXEiWJgJwcV1BZ8fTuTQeOQ3p5hFcdmrB3EZ26nUFYn8gY7MQEl3LT3knxxEes01uaDyIrym6MyOrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781597732; c=relaxed/simple;
	bh=7GMKZG4X2ZhGc0HhZgJ9p/HGfEBpanPF3ukxNzMtKi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+BMGAaBC8NOvkMnj5EFX6v0mNIQa1oGeWfBzxpaSoUQN8CKzzOcTSU1TbG07rejT3GNy7WX6GevwJmC2nP2Rsqq3wbn+1cObuAm05SrhRUz3JOdIIAN2eyXoWedPDp1Vs+gItg8kzQlCYCWjxa4yPqCkvRtJDOK1T+kSB+uOmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcEiDylZ; arc=none smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso2632434a91.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 01:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781597730; x=1782202530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRcIgJ5zqOFyZ0kikC0CnLTs7M6XeT64Gz+VbIpYXKQ=;
        b=fcEiDylZvlQT7zDp4N8mSwGV53ZbqeR7ymsc7O30WWKcXpEOJdVgCx70xL1dRfJ9R8
         RQpXRjg+P+RPvaQLQPZIjR2rGIGxmj5yPgwKqu7FEVSmQOaGP5/0RPN9QD2aGLPxiyLl
         ZmO/JW3cLM2I2agYlg7TUOvS/KR45IjlhmGL2ZheXwwPLPz1Uc0PID1u28jf2MKs2elJ
         ouoOLjhbPJKlLvmZByLY0cHK0S43gpUQHSpLTK4d8X8G3Ao37sJcYm1oDiM/x5BW9CVh
         5I2QPeBLDycl3BoLXYxBkVF4Yc8pPn8khxhXl2Yg1mjMnWvITULwQimMrQNU07DD0lzI
         ijMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781597730; x=1782202530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sRcIgJ5zqOFyZ0kikC0CnLTs7M6XeT64Gz+VbIpYXKQ=;
        b=bM7i5CCURCxz57Gp7FEZlOWgw/KIRAVliofXKG+T40NB2PoyKWmVLCIO09MO//r0Va
         /wimhmV0jTrN+BUlIiv9ax3IQCWDqdo634yRdDBQaTXi/xzyjjl8hQVUDaXDU1KT2xc2
         WPI65PolBzAKR2gh/+qCbQzjptnZgrgRaLye8NzYKygSNZ7r0B8lKcIN1zFb8o3sZ1fX
         vsOoft+V1xGyVY/JgNyRSEk1DfE5dZJPj935JltFmf5F//Uoz+Kvhz8I5UeC3NM63zUC
         vKQG6zzk/2P3IVvUtLNDL6NlL4mqM1KjE09Vxgi9WJFF1jI4YgSBAJs7Wtrpxy5e7LO8
         TqFg==
X-Forwarded-Encrypted: i=1; AFNElJ8JDuq/OY76pCDpGJkY+TLfCuHnP2BscMzm1u6kRoAO2z6erbTLjaD2vZG1gbQHl0U1JeQHwqeAgq78Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoVb64iVmmXPf8smz8hgA4CDiG0ThotKzuN2IgKuGPhYormBbI
	YiHX6E29VEUN3bOlWYf2/uo2iLZ3QhnPUM0RoFGVrO0oMqwC7G08KFiA
X-Gm-Gg: Acq92OGpuNH/4EdW1exH/5qzLYcIfabUDjQUGh/+WbLW4OoyjNnY2lAIAZVXB5N/e1N
	Cw/bOlqUSKuI6zd/mxxWcOKmdaLtMuJmmnl5wouArXTFb4aF13Hebx4DSzLnjXw67pKvf5GPSxa
	+mrTr0ct45rTJ0IZeERSrE0B5/idpNV78LmW36oN5srXXievFIiGs79WnZ1LQwaFlj1HJURcy5D
	QkIW8qFWgpjRVLcVuNpin1B51pUh3+jbZcACT060H1VHNQsydAA9P6yHG4z18tdzB0K+cFO8yJ1
	ecu1UNhqQKknbFXYs+cAEDLdGOjFm7cN81l1Kkby/QEj1EANOvzZIcHOX2OABELn3k0hf7oEe3w
	6UJg2uj+Qx9mfM2QKn7XOiiGjEnNE7iRM+bUaGdpPdaImxPKt2sbQPthPp3u3vEss+fuhX957Y1
	Ca0PqYwyuM4gKHVokqhxeiVQwtd0RrP6/sAnmBIt/f3ZTa4wkerRVN
X-Received: by 2002:a17:902:f70b:b0:2c0:dd75:e830 with SMTP id d9443c01a7336-2c410cd1539mr205610215ad.5.1781597730507;
        Tue, 16 Jun 2026 01:15:30 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c75c3sm119650765ad.27.2026.06.16.01.15.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 01:15:30 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 2/3] media: i2c: imx290: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Tue, 16 Jun 2026 13:45:16 +0530
Message-ID: <20260616081517.44685-3-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260616081517.44685-1-birenpandya@gmail.com>
References: <20260616081517.44685-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[raspberrypi.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64967-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:mani@kernel.org,m:slongerbeam@gmail.com,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65CBA68D139

Utilize the __free(fwnode_handle) scoped guard macro from
<linux/cleanup.h> to automate the lifecycle management of the endpoint
fwnode in imx290_parse_dt().

This safely ties the release of the fwnode_handle to its compiler
scope, allowing us to drop the manual fwnode_handle_put() call and
removing the risk of missed puts if new early returns are added in
the future.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/imx290.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 21cbc81cb2ed..5c369c7ee21f 100644
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


