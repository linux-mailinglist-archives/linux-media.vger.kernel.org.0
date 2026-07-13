Return-Path: <linux-media+bounces-67467-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GJGyBunPVGqpfAAAu9opvQ
	(envelope-from <linux-media+bounces-67467-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 13:45:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F21274A7D0
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 13:45:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=I4PRoorD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67467-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67467-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F6BD311B298
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FC63E2760;
	Mon, 13 Jul 2026 11:41:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C5A3E7179
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 11:41:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942877; cv=none; b=MGJPpQDIN+J8UztZ8te20gk79DjGhI3uEMVPbyAFlIDN+4DwjDXOK0SrSJHvE85MC0t+T4IIqHjNUUe5v7F8Kxa3Jfy7DmkeSIRPzIdaseZmyA6OKISE9m1tseFeu9KkQpy6IsmPZL4BReBo4p/oM8mLhDHBqh991+TIpp1DHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942877; c=relaxed/simple;
	bh=DF8JWJfNh6M1Sw4cPR6Hjd+QCs0193pYYptH/jXmmFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gBauMJTNhvWFuLmpCwAiHvw2KW3f6M9M/AEbuvkMC3MSk/UXQ+qC7IsCruiYSyHfr7b2cqnd3Gty/YoFu/xlyqr2gdKq3Ghb6zOXA2S2BrZeobNGvxiZ/uxyrLi/OFdmf8+zyN10rozFCF6kQOF6qbf6Lu67HXmCC+t7LapqWvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4PRoorD; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacb8416a1so25934185ad.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 04:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783942874; x=1784547674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bjup8tkbZReyLVbx7owWNWJpf0WRCU5BarQCoUzbWwU=;
        b=I4PRoorDO4Oia6Gdwk/Kc/D0+f8ToiOYMGTUk6lTcb7FsTAqOMEkCjZlap27qNdGUd
         pTL21PqGoj4S8mZIWr8Z1j+qRCSgi0IJw20qAACd5co6Ay6PT3iCu3vSzCA/Nyo+y2yK
         t8qYUWpKln5W1rLNGUtwUp9L3MttmDPhfPf7phjh8RDCwe0KlKbkQ8qvgL4Pz/Ut+6Rq
         t4NmddTc167tRLSXEW1JVdybAjE3K0iIaJP8A9guPUzD0uE6+KLw3djuIp5n/U5NOEbk
         9Y/0vMyC5FIg96LRDdpr6JSjpbc3kfABhrqBEM/FsuS7ZTFwbC6yoJPhYfeVl1BcfTIv
         TefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783942874; x=1784547674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bjup8tkbZReyLVbx7owWNWJpf0WRCU5BarQCoUzbWwU=;
        b=UoRCJXkhdvs33/rJ+UR0I/SF2riMyDyoX8ezCRiqR0qCgZUzuHDwfas0M7bKJfM3M+
         evMaLMAau6bTTdeiL+UYgwDu9y1jSjEf1BccgdN2sQVJCLWIwFs5bZRHCQJUohro4v9D
         sa3WQ4wjQwbF4G+Tst4k4iGtaPMpSDbpGM/zA9E7v3VIayHIijGWd2x1bD86E4jqA20M
         unN0SPycluFwBSEnah8gzKY76X5DEpAzMpneKhITGzvf/uoSSBmQVqUslVJbpo2FshAQ
         tS9KTMGS97NFglyONatiFb/gOWVmv1Nz2HY1OTlI6on33k7syPSZQpxBx15ogXSCXs4t
         TRXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+f1kiNCzET7LxI8QGGUiA98wmxRnEkq/nnrHysZ62ysPBQ4qbtEGZrqMRiOmZOU6wx5+YmlL3fqvLuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzybgDopiKD3AoAxZHVSp7zT1JGEVCeS8h33gEo8rGQIUuIJO18
	a9xQSzxpDESs0Wl22WRrV6p5eYoSEqHwwptMWa17/U32llQRbYdNVJL+
X-Gm-Gg: AfdE7cnD/3wW1W+aH+2CUjPR/s8F4Lm4776vh88jcbb/iuRNjGyi6Lv6HItoUuyM90p
	pNdGBhrjSuzukd2VmzBTdcfaN+slNdOzXEny/tsmmb4NJSLyfKTOq99VdbUrv8LsHV6/XoUKUZ8
	WDdoU3ysrFoW4xYmloEBMJ1LqXuxL3YOrRQardJ4s1Gx+JHfJ73+hSwl7tmOQL0AdX+wIXSQoJK
	CVCIuSGeBsgGIoSybNi4tZw7reoNg/ELCNk5nZQhNnUmVEPoOTKq6n5MUAO6UE9QktKOyU7/1VU
	OcC5otiKd/EX4LWHDN+J7OfFeS9Xhyw008Do0TWzeACOKLnSwpQ/cTYKFn27PbMcPoNxg+z0Bjj
	hHnirlnaGHgsXAr43dafdk+i2Ggt2Zgcy1BigqgrZbctL2iXDM7Kj9UHW/c2NEOGspakHvsbXeH
	EIh7ymAw==
X-Received: by 2002:a17:902:ea03:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2ce9ed181f6mr81660085ad.21.1783942873961;
        Mon, 13 Jul 2026 04:41:13 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e33sm95978515ad.74.2026.07.13.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:41:13 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] media: platform: mtk-mdp3: Fix SCP device refcounting
Date: Mon, 13 Jul 2026 19:38:59 +0800
Message-ID: <20260713113859.921358-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67467-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:johan@kernel.org,m:kees@kernel.org,m:lgs201920130244@gmail.com,m:thomas.weissschuh@linutronix.de,m:marco.crivellari@suse.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:stable@vger.kernel.org,m:matthiasbgg@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,linutronix.de,suse.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F21274A7D0

mdp_probe() first tries to get the SCP handle with scp_get(). When that
fails, it falls back to looking up the SCP platform device with
__get_pdev_by_id() and then reads its driver data.

The fallback lookup returns the platform device with a reference, just
like scp_get() does. However, the fallback path currently drops that
reference immediately after platform_get_drvdata(). The driver later
still calls scp_put(mdp->scp) unconditionally from the probe error path
and from mdp_video_device_release(), which drops the SCP device
reference again.

Keep the fallback reference until the existing scp_put() call, so that
the fallback path follows the same ownership rules as the scp_get()
path.

Fixes: 8f6f3aa21517 ("media: platform: mtk-mdp3: fix device leaks at probe")
Cc: stable@vger.kernel.org
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Add Cc stable.
  - Add Reviewed-by tag from Johan Hovold.
  - No code changes.

 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8f4da4cf55d2..121b1006ffdc 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -294,7 +294,6 @@ static int mdp_probe(struct platform_device *pdev)
 			goto err_destroy_clock_wq;
 		}
 		mdp->scp = platform_get_drvdata(mm_pdev);
-		put_device(&mm_pdev->dev);
 	}
 
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
-- 
2.43.0


