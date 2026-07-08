Return-Path: <linux-media+bounces-66996-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b1rKIjxVTmpuKwIAu9opvQ
	(envelope-from <linux-media+bounces-66996-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:48:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10E726F32
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:48:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kyySRXKB;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66996-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66996-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED4583022348
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 13:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075053803D1;
	Wed,  8 Jul 2026 13:44:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDBC37FF54
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 13:44:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518284; cv=none; b=ZdA2UzxhOmo0mmg4hxVOHOf+dBEw0S0jFYfEVr+uCbErAprZSq3dgiOD+FHDHXxg+YSf2SrYgY8oQnwYs4lw3QS5BeSULqASwZm14skaNDCrPqgHsVlwRa/a3LlZuuTKdK53yOWV0UotA3onTCYrpyU48Xs1chH3Hqrr1fs+L0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518284; c=relaxed/simple;
	bh=kfi10y2IMPkPFrv15N4twI+Eku+Y7y77UoS2TN5Qj0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmiXF+DshDrauw53C8cL0MqLHn2Z25lu0MBpbtLWDgqjVHyRSA4sk3Yuq2ek7ut27tpbTD4NrdF2jQnR/o0nlN1BK2cyhsE5oOLAQlHCUa6N7D9ozkp7mNqFDLpeE4hsLjCsmiBAamh84arau82MxfR/R1l2JhEKWgKWC1b5DGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyySRXKB; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38175907a56so1568140a91.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783518283; x=1784123083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WptfU0jvAZS3Dm30QmrDFvWibUBX3nZZBpUMMQVwHOc=;
        b=kyySRXKBJmq3qc+QoA/iwDlOg0+vV5MtpQr4HU2Trn63x/o0TFtsIib3GJrG/G+dLZ
         0KpbXUyqBe+WdH7Wa4S+BwowCWVUC6ULDkHLRzS3Gil3On6SRGIDfCDbDueXBw4W4MII
         c6Ipf9ZaGFpm0wNEJ2FXGn3GZqoOXh0SZ7prHGLmbdLJgZV4Ks43R2PlhWFdw33rvZhS
         TAW7o5eITpIMvAxozeZ47De/eRx/DWX42lgzA99h23jAIYrXmL23kIE+btFZzUyhbDJp
         Ot6KnoLtjZ7EjgOFrYSgJajwK9sMHNMyuY4v8SOHamuz8Wl3fpT6DDTBSsfLc18SgU/Y
         SqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518283; x=1784123083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WptfU0jvAZS3Dm30QmrDFvWibUBX3nZZBpUMMQVwHOc=;
        b=N+eyGTnRgESJBNPfraBiijfj1sWlQHCRf5EyuLk7WnY1C4yevK3SrvwSSnTBWvHFK9
         FpXRcM48QRMfWI8hrt2xDodj6Y1aSMuZon+u5n/FACg1wLVGplMvHvfIrWcS9MgWss24
         bLEmYSgPjJIvLoR2kcictKf9s9I3nlFX4/hvnwcrp6sNwrZcF7TMnlVxdEr1ZAI9C6F/
         6yQQvGNoENYi9vsT+Nq+RwWgeiMl0Ats9fBYeNogz4+sSCptZna/72OcEuZ8jjgsgRf/
         iV1fqTGxi7AQXqdMGEvP3IIMlMPO9IsoeFiFxLVVxLHfo8hTIVMnsoACHAR+dPgpGA6q
         hAXA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0H/6r6GiR+jvrNJIHCGGGlBh1ZQX/JrMwBAUNTkJJdad0Z+ES6YFcUBzvUYBIPJzS/rvE+y95uoSg3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywotu+rEwVLIwc8o6AN88JoyKgldYf2NAXDmPM9vYDzNpqhVP51
	RAxx3U1+TM711WfmQ64ABeE2FfjYLdXNp89QPU3Txx1nliaZKkhdZAJaAA2lJ87R
X-Gm-Gg: AfdE7cluBg0NzBx0nY70KGYSl8uOGviAZPcCrdB2XjG7fsLxUymfeEgZEgmKZPdFWhY
	GSZ445DDpil6HVbeqpWTA2RJ4O2Kh8Xai789LzawFFdEclF90lFkAFedE7oQtB/wr+aKV37am9d
	iJV5eTFdHcBmdJfP3nW/DsMqUVaLUjbe2dLQOVsviZ2rF88CqLy51lmG5XkTL0ApzLcpv0bPSOl
	G6aEQU8YSUw2PpVkYpMoX+P8cmpXgWquDgAypKRSkqbFpfiW67r7CFb8mXL2LGpZVP8LMIeI1jN
	JW40B47xUIArk9PHcaxH9pB2h6QstRDdbmIKpoBjzMziY0LZx3j607rsmYUJgvWgJdq9iGPz8x8
	e4brFhDJBc2Y+ScUoUN55zjdN9e8+5lCYc26HJuOVksrcWMtLCsODNhQnQ+LZvCFJm4CWYTmZ/r
	E3bSUNYmEoVhpVcU3qSsTjem1RrhPLtKE4ZYhq6Cywg64=
X-Received: by 2002:a17:90b:2683:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-387d6b973a3mr8217510a91.1.1783518282559;
        Wed, 08 Jul 2026 06:44:42 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f72a6sm23648662eec.1.2026.07.08.06.44.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 06:44:41 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	dave.stevenson@raspberrypi.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 3/3] media: i2c: imx219: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Wed,  8 Jul 2026 19:14:06 +0530
Message-ID: <20260708134403.45935-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708134403.45935-5-birenpandya@gmail.com>
References: <20260615223055.39953-1-birenpandya@gmail.com>
 <20260708134403.45935-5-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66996-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E10E726F32

Utilize the __free(fwnode_handle) scoped guard macro from
<linux/cleanup.h> to automate the lifecycle management of the endpoint
fwnode in imx219_check_hwcfg().
This inherently guarantees that the endpoint node is released when it
goes out of scope. Consequently, the manual fwnode_handle_put() call
in the error_out label is no longer needed and has been removed.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v3:
- Resend as a complete series to fix broken threading.
- Collected Reviewed-by tag.
 drivers/media/i2c/imx219.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 7da02ce5da154..d76eae880d730 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -14,6 +14,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -1110,7 +1111,7 @@ static int imx219_identify_module(struct imx219 *imx219)
 
 static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 {
-	struct fwnode_handle *endpoint;
+	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
 	struct v4l2_fwnode_endpoint ep_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
@@ -1172,7 +1173,6 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 
 error_out:
 	v4l2_fwnode_endpoint_free(&ep_cfg);
-	fwnode_handle_put(endpoint);
 
 	return ret;
 }
-- 
2.50.1 (Apple Git-155)


