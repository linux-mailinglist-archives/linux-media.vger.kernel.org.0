Return-Path: <linux-media+bounces-57452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EsaA3Tyx2lMfQUAu9opvQ
	(envelope-from <linux-media+bounces-57452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:23:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED4C34EDCD
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B19CF303FF12
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6699D34404F;
	Sat, 28 Mar 2026 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlOz5XlS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E83370EC
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774711108; cv=none; b=DR5vAz+X8KrSYDUIwDvVshfONWOB1VErE2Io/yARs2rZxlCVtN5rWLvriSwcSQXC+aIw0rHQkYxfugqAjYpz/FRlZ4anjuElswphh/d9tfGcJRMLF60Zm51+DGfGtv5K9xZ3Jd4viaG6N66XKDmzKIcJUgRcCGAunUsOemq9a4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774711108; c=relaxed/simple;
	bh=DllPNEY5HJhelRRWtMlz2dJNBymbUWyXeyN0iDUfRcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RktYKNwAnbTOAqyKYXVeb5DX1amZqezKt+vrlOfST9tas0YaPLInFlx8IajdRVPlucavT8noICOzxLdatUgGaNZea24d3SuqKKAx9XT+0z7TYCW0Tvj4KrwTYjaV9OsezBoahVXvkrXNzC1gqN57CnEu39Bd6OHDTOJQbFvGiAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlOz5XlS; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so410038566b.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774711106; x=1775315906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5w1Y1b3TwAv79lqz5JishdxGsbpyNm4BW0hPIUDQcY=;
        b=YlOz5XlSQYpnKjMzXh9j+F0UukrU119oeEWsspHDEwNdobgNWnwDdAL2w31atKuOGm
         7c0uqyeswDdi1Nz7hJWe+OY1A4DmE9oWtIBu2cwsn7nSc0LdvfHuWOy5RC5DlvA5xu31
         LN9PFHzM5fX2+8swYcLhteRhaU27aXLMLzowFR/eDD+das9950OM7KrO2HUBNAQBeV2x
         w1zVjxtAm8S4iTeRSNPRvOFVKAotPw2K54VHwBeGg6UqMCrb0MW1Ss+LnR63XIw4GYZG
         7TICyTN5mFpNJLaLVwjhkqdPprMDs72cbx1tC8ZKxqyBkpLIMa7cnz3vbwpIxsrzwK09
         pgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774711106; x=1775315906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K5w1Y1b3TwAv79lqz5JishdxGsbpyNm4BW0hPIUDQcY=;
        b=TpJR7VJYNyk872e+Rbb8iiHiv+xLGsX27NwHhbWjyY7QHN8QNdCSR2T1G/GV44iu5x
         VdNG7yiMMG7BO7ys7RQbp3aMJ90eORUenjUm59hh2OxKeLM5HPw3nJov1HIrenQN6ydP
         5qAzO2AO/2WCFy9MsABLnkh34lU1BQBCjLwCLzmGnSUmKyQCFXastdV/T2D3NPc76iSu
         p82sTB1ShyqXcVrllVBTtmza3APiabWBBoj+tgWj/RYSLDF36755cZ8b8eYK56YiCAxv
         QBtbz25T52o85zEJxRifo98+yrp0c+kNawa/q2neBJNR/xUDu6J07dglmThlVXGmQ90Y
         ZhTg==
X-Forwarded-Encrypted: i=1; AJvYcCXZo/Z+kAvelIYIRGm3SBIihVX8uYaf65QG45nEoOlkzAJ2ZLv+LZhyoTT1eXzTzQv4P4g4QBnLAOInpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuA0Sds05zhU/PhWv47M9M1XOY10INsMYpMWec2JOAhmYZHb2
	MYTCfXrIzZMLUdDiU5ir/6u844axoVQLd3w8MlOzh7hoalkldOfQkIKLp25UVfzAHclk8w==
X-Gm-Gg: ATEYQzznnJr1lGw/fVl0xRl7OP9HAhx2JQDAMCgJE0aOWuaecgrLDNiF5ZZPyXn+gZx
	I99GGgo9By1yd7wdK4U9vedjF9XHI5beh7vMsqDpEbjh0spjL4Iz6O+S3lGWJtbLPsx8dt7+mCO
	IXp5qoF+uu6GjuefkQ0kmZB0V2g6W8jNVWKXoxxjjixKyg6z6N+PfRhtyK9c1qDHlrZjtD4WOMR
	QSbX1sgEu3I/nBS6xBwtgV0FULJlo1VrnYBbNrmSGNcbB7AjOPKuCCDjxu2Jp8msXtoK9zU0dSj
	XXZ1a/BV3urlmAYOHfRwEjygwCLhoVWx39xJLVzSAvmo5pFJIiJ6m3/EUt4CZ+cgJ7SiRfve1Ar
	RWiBkuGjVkZWLLNNQwZipJzado1LPyR6424wEmBMIDDIdH14hDHlVrAeUdv0MFoL3b2cKqlHZQ7
	xQLgGpXqG5wnk0+oSCv/EKe33tJYV8YryRNMZ1AmJqzBziqrpB2KQ56da1UJEwDxFkTq0Ywt4Lq
	BGwqsjwFYP+
X-Received: by 2002:a05:600c:6814:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-48727f7be29mr91414145e9.22.1774692014189;
        Sat, 28 Mar 2026 03:00:14 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d4d884sm198418535e9.15.2026.03.28.03.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 03:00:13 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jacopo@jmondi.org,
	aisheng.dong@nxp.com,
	guoniu.zhou@nxp.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] media: nxp: imx8-isi: fix memory leaks in probe error paths and remove
Date: Sat, 28 Mar 2026 10:00:10 +0000
Message-ID: <20260328100010.41236-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327222711.268132-1-devnexen@gmail.com>
References: <20260327222711.268132-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57452-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,jmondi.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4ED4C34EDCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
frees it on any probe failure path or in mxc_isi_remove(), leaking the
allocation on every failed probe and every normal unbind.

Additionally, when mxc_isi_pipe_init() fails partway through the
channel loop or when mxc_isi_v4l2_init() fails, the already initialized
pipes are not cleaned up — their media entities and mutexes are leaked.

Fix both by adding kfree(isi->pipes) to all probe error paths and to
mxc_isi_remove(), and cleaning up already-initialized pipes in the
err_xbar error path.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 4bf8570e1b9e..ab32c5b6ac9c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -490,33 +490,43 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
-	if (isi->num_clks < 0)
+	if (isi->num_clks < 0) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
+	}
 
 	isi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(isi->regs))
+	if (IS_ERR(isi->regs)) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, PTR_ERR(isi->regs),
 				     "Failed to get ISI register map\n");
+	}
 
 	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
-		if (IS_ERR(isi->gasket))
+		if (IS_ERR(isi->gasket)) {
+			kfree(isi->pipes);
 			return dev_err_probe(dev, PTR_ERR(isi->gasket),
 					     "failed to get gasket\n");
+		}
 	}
 
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
 	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
 
 	ret = devm_pm_runtime_enable(dev);
-	if (ret)
+	if (ret) {
+		kfree(isi->pipes);
 		return ret;
+	}
 
 	ret = mxc_isi_crossbar_init(isi);
-	if (ret)
+	if (ret) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, ret,
 				     "Failed to initialize crossbar\n");
+	}
 
 	for (i = 0; i < isi->pdata->num_channels; ++i) {
 		ret = mxc_isi_pipe_init(isi, i);
@@ -538,7 +548,10 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	return 0;
 
 err_xbar:
+	while (i--)
+		mxc_isi_pipe_cleanup(&isi->pipes[i]);
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
+	kfree(isi->pipes);
 
 	return ret;
 }
@@ -556,6 +569,7 @@ static void mxc_isi_remove(struct platform_device *pdev)
 		mxc_isi_pipe_cleanup(pipe);
 	}
 
+	kfree(isi->pipes);
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
 	mxc_isi_v4l2_cleanup(isi);
 }
-- 
2.53.0


