Return-Path: <linux-media+bounces-64852-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TkOwDDoPL2p77gQAu9opvQ
	(envelope-from <linux-media+bounces-64852-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5476822B7
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nFHnCmv5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64852-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64852-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FBA9300DDFA
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDAB320A0E;
	Sun, 14 Jun 2026 20:29:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD64E319601
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468964; cv=none; b=PTHNnS+kaGGEOHBUJKXoDbo/2hJD7oQVYfGJOqSytpdelHHOMeClxeK8/f7NAac7AJy4arfOPLyQ/OpPhnDEStjed+x7S58QTCzToodnWlACc+gAOISRQXcVahPhj+FY87CMhMy6m4Jx44F4wSITwm2i3G6PiwzIF0d3e1tDEmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468964; c=relaxed/simple;
	bh=CvZP6x9x+hR739UsPR/vDWCdaH7AW4NXCFPv1KEcKTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKVxHhaWrLdA5EjEk8bPVYgc+g11aRosIzmL1ZJhQp1rFBI92eIxmH4P2HxwEDixSURitxWBQ9QTXng5uwZuXsXOvxHLRO1VZ81Tbfj5lYfikD+kkpiZWDyC6y2XlRDdf2mZT/tc4xSd/X1UkupMiu4q/eY9TNrzvO6YEw2nm94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFHnCmv5; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b9b15af73so2341976a91.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468963; x=1782073763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYEAAt0I9lGnx7UMzkwbmUnoR9TH/0g7X8p6M3BtsFc=;
        b=nFHnCmv59A3GdxhUmrepRxfdhws8VIv9IouKhili8vutEI3qCHM6cDkp+5FMbyh7Uq
         70a+Jv4GtcsicYUxC8p8ww9woKsVpkZrh2zlm7x28NjB2d6JdUAR0cMrx+/PG2YPx1fw
         KR2Nya8kUZAtMTQll+CDs93xu/DSTozYcjRLIB+4HMpV4TFwqquFqCTe3vcSb58tuOqL
         ThNdMXZJwDG9KEyj1yy69yuaCHGmQGILmHfvqoQMn6QSY8wSVgC/9eQYWCRw12DWBFYp
         yrP3JHJFPInxcyzsRZT2hOuVa8VEghsi4DCbGGuiMSD9MjQZLVtVf18s9w91ZnOKHMWT
         WtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468963; x=1782073763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZYEAAt0I9lGnx7UMzkwbmUnoR9TH/0g7X8p6M3BtsFc=;
        b=WY5/Q8IG9oM7p+0x3OnN6W/3a1clTDuNOP1co6A2RcyjSrQEnCgheriwyi2nXeHWF9
         Rb/jWiYO+QfLGl5CxQMSXR71UkSVBbbNaDyHUk3FObRLF++yKVM+ezlv5HnxJA+defkE
         0wWeog7ex7LT/ejDIiILqbIuwSFrkuUjwq/JamyO4Gyx1h1+9ooFUkgvoC6dbQ4/6cSY
         EIELh0CKZOWLxHVxrFjDyGwAu6UB24BG6j0eKPBL0MbVtDVKdziu/SjQL9+tchAyotBA
         i3XYENu6bfIz8AtMtR1S5Vgf7jzeTZ2cmdQSKR6YP326QxWR6blgZ+xWkkrSgpZbICll
         5sVg==
X-Gm-Message-State: AOJu0YyhYUoZTm7o4g8gI8UU3xvUGno9Wi4iXOrYjKIrzK/XhLGr7uGw
	B5l/vkjGWjPXi4RpCNsxsKvbHk7lZ+BYquyBNfgIXuf4/Z9Z24RBlqf97cHhX8BD
X-Gm-Gg: Acq92OFKO76IfI7MR+RA/ucnk/+7LEJhHh0iVFi1s8r4nO05BXAkfJOJinU/j2DRSzR
	il71GHVXDvZfpmWKzThrkwgkKE+jotcqKUqLIm8V548MpTXltgragMvshOL3V0jn8EDVde1W6KQ
	bqCTpMXj+s9mVOPRTCAjVLyk2r5dv/12Kh9jtGt4ukPjMWtpoB5uozlPjaR/fJpEsDaf4/Pnemt
	+tDM1JNQaHES200vZA8c6R1NWwcoTmQQvJDjtce7ju/J9g7bS8o/AFLOqopPMEgZGA1QpbJZKlt
	J2VUGFr+i+eUOsN7W/nFyefnLaICgf/lWDNMHs7toNqFjqLsLw0b4a1mjiur3f7MyedACKf82E3
	G0vly3aM0azHRiIeUvU/Z/liZpCYjHdcPZZGY7eKnmm+RSPPi4xksJC/QRSUZUF/BoYjS/nYe9u
	rzNNFdAf125Ps3/qvAUcgO3E6XpE8NE/CCqBXZy9P2XuqX7z/QzJOo
X-Received: by 2002:a17:90b:1c8e:b0:36b:71e6:3de8 with SMTP id 98e67ed59e1d1-37a03ebeb89mr12642355a91.24.1781468963042;
        Sun, 14 Jun 2026 13:29:23 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:22 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benoit Parrot <bparrot@ti.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 09/22] media: platform: cdns-csi2tx: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:09 +0530
Message-ID: <20260614202835.11977-10-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,ti.com,ragnatech.se,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64852-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mripard@kernel.org,m:mchehab@kernel.org,m:bparrot@ti.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE5476822B7

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Fixes: 6f684d4fcce5 ("media: v4l: cadence: Add Cadence MIPI-CSI2 TX driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 629b0fa838a2..df1598091d57 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -620,7 +620,7 @@ static int csi2tx_probe(struct platform_device *pdev)
 
 	ret = v4l2_async_register_subdev(&csi2tx->subdev);
 	if (ret < 0)
-		goto err_free_priv;
+		goto err_entity_cleanup;
 
 	dev_info(&pdev->dev,
 		 "Probed CSI2TX with %u/%u lanes, %u streams, %s D-PHY\n",
@@ -629,6 +629,8 @@ static int csi2tx_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_entity_cleanup:
+	media_entity_cleanup(&csi2tx->subdev.entity);
 err_free_priv:
 	kfree(csi2tx);
 	return ret;
@@ -639,6 +641,7 @@ static void csi2tx_remove(struct platform_device *pdev)
 	struct csi2tx_priv *csi2tx = platform_get_drvdata(pdev);
 
 	v4l2_async_unregister_subdev(&csi2tx->subdev);
+	media_entity_cleanup(&csi2tx->subdev.entity);
 	kfree(csi2tx);
 }
 
-- 
2.50.1 (Apple Git-155)


