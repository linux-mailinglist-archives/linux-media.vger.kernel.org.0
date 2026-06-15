Return-Path: <linux-media+bounces-64935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GMe9D1l+MGozTwUAu9opvQ
	(envelope-from <linux-media+bounces-64935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:36:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E45D68A66D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:36:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=O2+Wgh5t;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64935-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64935-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C54593032BCC
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 22:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971963C870E;
	Mon, 15 Jun 2026 22:31:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0D13B995E
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 22:31:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781562673; cv=none; b=k6tBEnPxX3DlQdE8wu4fVbYHdrFyKhi1yuh7i39MeT5xtgE7bW59NbRVSeQ9Cl3ozheAuxQ/aN1+KHkXi6Vjyl0Ty0GNY/9USvPEzj/hpUdMGrhUpH3S1kQ6MEycOyymEDXc7howymw7uVazTH/aQ8oJpaU+biEJJVHhS+NMeVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781562673; c=relaxed/simple;
	bh=fd8S9xwvgM4gVaiRo4qfg6c4apMQUtakGh5a9Ly+mUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpLWxvKerChIStqtlkL3vCWnsZEWpRUnTwSLsyYZe/CC9TcFN1QHP1B0cUmtthrbwfxq5HTyPDHs5OGqRTp/z+SWIXzks2s0ksQJjsC+255+mtzIuVUYVg0O605W/1TcqXTCD417HMqHlQ3YoFfEP3z4sKAWzmZ68DMuL57B0JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2+Wgh5t; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so2454324a91.3
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 15:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781562671; x=1782167471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3HHVwgTTRBza2h0D/n/Uei1kjwtoCZN60paXjloDr4=;
        b=O2+Wgh5tQu2B9URRrskOBbWM4qpC5x0KXMo7J+3TaR+4gaMViDUDeQoUcTH5OS8tfV
         0ZAv8MwimfgDEn+oq5TwsDm5xN2vtRWTnDoL44Po3nWt7XuvygUiyPEgvEIwzMFpL/An
         0jC4pZV4CP+HTugEUup1puKZfu16honX0drtCjZ9HgNrJAuXPKQL2Ns0UkDAEK4GGlqE
         KEzY7BMhOp6N8aDlokIzUW4q5P4wIezI3O5LuMiTMbb76QP9JBlwhrPyCtx4ddfb2JyF
         wRERObhLkI+QrS7VIShA/9vbJrOZom7fbIskBoOguwnDeofL4LDUUdlrWbYm0aABI//K
         ku3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781562671; x=1782167471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3HHVwgTTRBza2h0D/n/Uei1kjwtoCZN60paXjloDr4=;
        b=k3n5QCZYGPVoJ5akqO/cB4aTZ4Fi/lJdoA3yV6kmk2lI8Go0bG3YiRopW46cshkS1a
         31wWybJ1BVzPlodTOJ+kWcCzYHM27YP6Za/p9TNydfaFiHpP3aRX5eruB/NNNf9RwzBj
         th7Z3GK2PKKaf9jAxo3erB7FDIeRaG7hkWyIbgqFUHUiJdEoSv42GYoNOYWc4q6scqET
         haewLLU7x9RR6X63/eM5GN7VdQJJ3ACRaokIqz/cQGO0ggnwge3wW6jI3g7GCS5+yUCU
         rhr88IN0zDO5EtlviBKPvN7emO9PwJjCuZgxad79bfz3Ej0g5vFUEilFGQDoy+2q8Bms
         a5kg==
X-Gm-Message-State: AOJu0YwkUEEkN8mWKTI3ur+4k1rII6xWqcOt4x2kVD6kUdr4j7fbD53W
	Xkm3KbT3BUCx8SJgi3tBsYDQBNCZZIiiKklDY5ECnVHbxksSB8uGQAbXCkHM8/dG
X-Gm-Gg: Acq92OFlAA84P6a5E4Dp7g6Xu724teWMnTXrECiC/OG8cTLb/JvozrrXBbzqbKSUcU2
	xmynhZUmR/yCoNgyb/X3u6dltKbesEORpMUgLNTa1Nwn0hfuk69QybpxjJYiR5vnfBmnG3RXeOz
	2nOtNdG3z7jvx1HQCpvUj2cdLlB8fDzsX9G5jv5xWKnN1HwshVw1AgVWF6kgAj2yrcRgGiSPBNB
	UJcJuPAyxR3wMF0Qb4Bm7t1KPyCZMHDIuRsw+iKxOan1VRYoggjS9yzKebJVCA/ETqTzAVanthb
	0I6CO7Y8SXVEFxYKblYgIekF23aRFlC9t+dPnulJU+ljAw04spRYkrUz1akQnhhSh6yimSZ25wm
	JJ07dQQ7VtqSDBpsx8tMfboCt8GhHnIRtNFBgzbHkrwe7SXssMxS0Y8ICJkxkdWuO+RGbWjgOG3
	/u8SgcKOIV1u5MflbYsZYH5VRG5S5pPtLmL6lL8C9+pAtGavhjTAMFXLTh8erR/Sw=
X-Received: by 2002:a05:6a20:72a3:b0:3b4:85db:1bdc with SMTP id adf61e73a8af0-3b7e4d50026mr919553637.34.1781562670749;
        Mon, 15 Jun 2026 15:31:10 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651a0090sm9638592a12.26.2026.06.15.15.31.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 15:31:10 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH 2/3] media: i2c: imx290: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Tue, 16 Jun 2026 04:00:54 +0530
Message-ID: <20260615223055.39953-3-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260615223055.39953-1-birenpandya@gmail.com>
References: <20260615223055.39953-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[raspberrypi.com,linux.intel.com,kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64935-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:mani@kernel.org,m:slongerbeam@gmail.com,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E45D68A66D

Utilize the __free(fwnode_handle) scoped guard macro from <linux/cleanup.h> to automate the lifecycle management of the endpoint fwnode in imx290_parse_dt().

This safely ties the release of the fwnode_handle to its compiler scope, allowing us to drop the manual fwnode_handle_put() call and removing the risk of missed puts if new early returns are added in the future.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/imx290.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 21cbc81cb2ed..b0fd3e1dec2e 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -8,6 +8,7 @@
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -1514,20 +1515,19 @@ static int imx290_parse_dt(struct imx290 *imx290)
 	struct v4l2_fwnode_endpoint ep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	struct fwnode_handle *endpoint;
 	int ret;
 	s64 fq;
 
 	imx290->model = of_device_get_match_data(imx290->dev);
 
-	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(imx290->dev), NULL);
+	struct fwnode_handle *endpoint __free(fwnode_handle) =
+		fwnode_graph_get_next_endpoint(dev_fwnode(imx290->dev), NULL);
 	if (!endpoint) {
 		dev_err(imx290->dev, "Endpoint node not found\n");
 		return -EINVAL;
 	}
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
-	fwnode_handle_put(endpoint);
 	if (ret == -ENXIO) {
 		dev_err(imx290->dev, "Unsupported bus type, should be CSI2\n");
 		goto done;
-- 
2.50.1 (Apple Git-155)


