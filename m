Return-Path: <linux-media+bounces-64858-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mXG/FoUPL2qF7gQAu9opvQ
	(envelope-from <linux-media+bounces-64858-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B1D6822DA
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BmqA3ZXh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64858-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64858-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3768C30160FC
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCBB325726;
	Sun, 14 Jun 2026 20:29:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA7B320A0E
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468998; cv=none; b=huvnH4LYrQwarA2WvH9B5Wq3o0O7aVnZMmEMeJYHWAfShwQAqTbQ531HA3snPHgpPoyBEnlnPGIAVTgVjZ+TmWxeEwMHTTGKRh2Ew5VRUFmFIu2j/5m/Yy4jDDkxTfZWez6Gkum21Y9V5q7SkZKrAXkSlvQfcmrEeB1tcyXbs+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468998; c=relaxed/simple;
	bh=MD/QxFgvNsXhV6cW5P8IQCBQ0WTUS3KaVH6K42AOeIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSneiUXUjhUY8PzevQpgxNp9M7wSEMibA8it4yOS+okzmK62DN5/xitfyw1CzssREuBSOqdGJAQboYsZd1tx/9FtlmbOFUUB9MCgmaBwvJM66dGC2g2CxI4gBpRE8ZVUGIPOfY0T2J9iEHrHLJ/dltTtbVJCY53PkLDcnt17qhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmqA3ZXh; arc=none smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36b8d414666so1583547a91.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468997; x=1782073797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3+EdCQF341UmIGsj3sEVrfID9CbhUI//NjgDBvmX1U=;
        b=BmqA3ZXhZUPFoVG+7zyp5qlukCep0X6DkKtHTReierGqoLG+H123yTu40bcM32yn7s
         KiZpbgd3HDi2bS89MRHEKXGa6+pvIEhZmExCmov4wkFhlII1hzhScOvtkemLjVSnHjep
         DBa4joASVgAiNaaQO2vrL3ZXy2GGhjL9gErrXnoeX53U5o6gZhqeAs2ghz4Ha48pMK1m
         8e3rtLEUasw+k1mTT1XUIPhzXc38Ofg5sbMFNo1cuCy1EYanXIl7JSbNIEpr/4jK0GHD
         pnDeQYSyGZbIxGiYisYRwVbWDb2fY9CvRIuZfTRYUcCbMF3kDxDjSkOPyl/HnJh80UIE
         u/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468997; x=1782073797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W3+EdCQF341UmIGsj3sEVrfID9CbhUI//NjgDBvmX1U=;
        b=k+wUKtq14TL802CzTrqNk2n0RG3cEY96cUL1pT5B6tY2fM4QaXkTQKkMIHcxoBCHl1
         Tur4cQYSyjDjKE5EzpSF6yblrrX15Op2nQe5G8VeJorQUu6S88WBIWTmIc/Zmj56mTYH
         RqCCfYnIqRIzBdY3SUvnNxpWb9ZE6qYePp1KpGVm3m+SrfykwVB4kqpV8LBVfgODL0GE
         Ub16O+aBqgKVu0oYEBy+N89UJJEZAf9xsNI4JpiHUMGuBcaqudChKtRMHxLF3TotelBB
         EL4l8h7qFJAaORh6i7unkwHd/33VDSwXWjch0SfvdACYk1eBcLzOGR3VzXf4gBbimWEP
         rQEw==
X-Gm-Message-State: AOJu0Yz80ifNzBrccZvkboxWzPwYUI1FTQpsoMkGclzjCCFmfX2dM4cy
	sYpTTpbQN2LMLs/JdtSM4Tg/kbhF60we2Gw2CNB9LGjDv8DmynnRJL3ZB3N7kQ9m
X-Gm-Gg: Acq92OHdIfuzW3GPawsNMhbe/xD8s7fC4DatP7BMs8jDXwhnguanSh6L6nRwj/SaIKO
	byoh0DogmLuFzU6QzXTD/r/InLqxTss2WQgFKxuIQGEZNXy06m7AhBqICpRUqPI1ZdFo7Chegxn
	oGFCTqI4FFeTxc9CK2L10KUOL4TSw+jmhkq1KwA3bPIL9bYtZ3XlLV7Kb43UnUyfLXkN08izY6C
	/Ce0JzhoccVGRgnYytnoULo3tHPYxXXxUbX0PPWK7ZMEhgHsKUM1ZpkCkH+zpmNxrL+2x3Q8Ed+
	6PMJXkJOEpm1UqB9Z6VazNBecmgmpreKS/wU2Hp2FPyY8xkaK6tbeHasonffS/EKRTdOJzdh2Up
	d5fiQ3Pu2d5DcioihdaTtJYQV5F2hePxeYxWwgMKrzPRJ4uM3/gx+F4OTq3SegIVnLAqCrlBgOQ
	460EzWuNKaSmdqq5IVUpOspvvyqq93fPL7tSBb+mJSaIF2fqI38M3v8RjHkvjFPdw=
X-Received: by 2002:a17:90b:3cd0:b0:36d:a510:f908 with SMTP id 98e67ed59e1d1-37a01846f18mr12880181a91.5.1781468996864;
        Sun, 14 Jun 2026 13:29:56 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:56 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Jai Luthra <jai.luthra@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 15/22] media: platform: j721e-csi2rx: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:15 +0530
Message-ID: <20260614202835.11977-16-birenpandya@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,kernel.org,ideasonboard.com,ti.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64858-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:jai.luthra@linux.dev,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:p.yadav@ti.com,m:vaishnav.a@ti.com,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8B1D6822DA

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index b75aa363d1bf..b88e3ac3dac8 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1079,13 +1079,16 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	csi->v4l2_dev.mdev = mdev;
 
 	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
-	if (ret)
+	if (ret) {
+		media_entity_cleanup(&csi->vdev.entity);
 		return ret;
+	}
 
 	ret = media_device_register(mdev);
 	if (ret) {
 		v4l2_device_unregister(&csi->v4l2_dev);
 		media_device_cleanup(mdev);
+		media_entity_cleanup(&csi->vdev.entity);
 		return ret;
 	}
 
@@ -1105,6 +1108,7 @@ static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
 	media_device_unregister(&csi->mdev);
 	v4l2_device_unregister(&csi->v4l2_dev);
 	media_device_cleanup(&csi->mdev);
+	media_entity_cleanup(&csi->vdev.entity);
 }
 
 static void ti_csi2rx_cleanup_subdev(struct ti_csi2rx_dev *csi)
-- 
2.50.1 (Apple Git-155)


