Return-Path: <linux-media+bounces-56111-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF9UAyGTuWk5KQIAu9opvQ
	(envelope-from <linux-media+bounces-56111-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:45:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FE82B0145
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FB4731FBD99
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80602330D54;
	Tue, 17 Mar 2026 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwWjso2B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD89B346797
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768122; cv=none; b=HTwONRboviYRcOt5mjJijOQkSkzoKJyutgfak/Fnvjlk2Bcqg68UHlI1usG852CGOiOoZ9BIbCgNcV7RlzYu3fyJybIJ9Qy7gzljp/NVjoMJVlpUfM7uIy6lsVneO15G0m6tmY/zurJOUpodPt5ti7ckCBw21ztpkNSDDgT6MTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768122; c=relaxed/simple;
	bh=LX3WrCkmBT80+WbDdsLXcY90w5LjQ8QZ9GC6fBf1zns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUvJkMv6DuEmsWz/rmtR83ryt16fG1/aSpRLepX6uBcnu+BXfANElFZbJ5jq2jpAh9ymeeSO4QmtTJeUgBPAmyrts+2MxiB4t6rqnT0u+ze1ay9fuI6fuurLCU0hMluJV/sjdi/HjZmVFPiBON9pBtEDtqnTcc+veDTHq3hZbFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwWjso2B; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ad9516a653so25621365ad.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768120; x=1774372920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlnnacpIBF5tbzl0VRGQD3bXIyCs0S6ifDpvfz5RffI=;
        b=ZwWjso2BDsDibWKEjAvLLKrT3CgpCFHL6uLGbycSIjCTXhuL8XhW0WGojttB5vkqF+
         rTxyf/j6FjnsjUCriNwASxcWFNoaLrx9EkgmDJHCplW2Y1C2LxkZRSrEEECEvCDkYHNa
         Gbv0XP+E6cdSlxTRVH4FnT6+yyOqjz+OwQOXVgOjgJbTUtu5sH+4uWCoE3FlZ9aXFVPF
         KH3NnhSZ0uwtFV+2+pmV9ebOehAT98cDfhXx55DxXUBio3G4JdqPlNSJ65jEhRP2Uywp
         mbMn6GWTZNOVJdz+xfJCyVZWApKlgI/geRsOe3OKw2xw9lYvk4+GXh4/f6CyIx9/m6E2
         cAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768120; x=1774372920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RlnnacpIBF5tbzl0VRGQD3bXIyCs0S6ifDpvfz5RffI=;
        b=OSI5Atj8rJF3THiw0V8R3R4JITp46F5P/YpzC7rf4a94FUBT2qKMmWWSpzmK62NLuI
         kIbvLm+iPLbz6qPBmHMH63a3y3IuayV68qj08p5omkyWCtjW6KqF0CMkkBNl1xcL5WqG
         JqP+mhmRdVlab02uxZEYGWNNcFGDmKbF65Bm3mrk4fNCrdXS8a9fz1XOgyVABQwW7QTy
         Mmr3a7ppahE6He7bHm2TtbpVl4gTtzB65kiruMAcSztuM/eAcrZlfjyo0hw0Q3HC8idq
         NnKv8BLxCFILzbQEVgxclNYUbftj59UkU1FX/mR1KfmNV0Sjuto1Kdz/EqkOkxSjhLOt
         L+vA==
X-Gm-Message-State: AOJu0Yw9+gg1w+0lWo4YklNdx5tjlMNDhcfn5lcHYgWuBFTLduE7pZDn
	NItX8Zpdg0BpMcrV7M89oNQPwnDAqaDf11GIw7jCDC8oU1I5F49Il/GPI4DIeyDTQss=
X-Gm-Gg: ATEYQzylRK8LC7UFaLJ8bpvYnU1vuvGJTR9lzB+8oLS+saZGkYjjbMLqW7ByRvtiaXT
	w73SUfuyVjT6wgCj5IHdT9LiPBMytWNdAuDm7IG/Y5rbH1qGoKGf5mV3OY87DXvW1YewVKojXMC
	azAsuucOWT64q+tqL06Br6D9NdHMFGKYaeTbhTxDA6nAyitrdDI3O3gMQSsjS6uRzkUjNB/mZgk
	yPAzbzeAme99XkwrY1HuPYqtmKoAOjK97Y+63Yn0dC6eSyFEHYMajdqoyReZPNOcTeYoLUSb/df
	LfITPo6l9bp5t42UGHJBpKeEM/NIVXwPmmgG6D4Ki33UtSd/4qDhKdkzeMcs1+7w1c+yXNGkKuA
	B0n2swQi/OClnBXUy9Zk60oh734yCWAu9RII80uTZZRPV3kdm9WijaxVxTAMK0EAllzxEPml249
	jP2Ss6pc/kyT38Gm/aTJDdHpQMfsXqn5tRZoJPvhgFjmtgk8I=
X-Received: by 2002:a17:903:19e6:b0:2b0:59c4:e9e2 with SMTP id d9443c01a7336-2b06e2da870mr3486765ad.2.1773768120187;
        Tue, 17 Mar 2026 10:22:00 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e608a66sm934825ad.61.2026.03.17.10.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:21:59 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 18 Mar 2026 01:21:53 +0800
Subject: [PATCH 1/3] media: ti: vpe: Fix fwnode_handle leak in
 vip_probe_complete()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-vip-v1-1-5fdcdbd01829@gmail.com>
References: <20260318-vip-v1-0-5fdcdbd01829@gmail.com>
In-Reply-To: <20260318-vip-v1-0-5fdcdbd01829@gmail.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dale Farnsworth <dale@farnsworth.org>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sukrut Bellary <sbellary@baylibre.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773768115; l=1909;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=LX3WrCkmBT80+WbDdsLXcY90w5LjQ8QZ9GC6fBf1zns=;
 b=4rD6cG3wRc8/1B34vC8AbbcZ0qq3UmKAa6j6mkH84dCPLJz4IgcTlx8eCBCDAcqNJ+jzhs/pu
 +opfntOaohwCMpz4MD8Wle2TxrN5oGdhWyoz9hRVRRjG0EpCLXXdmiK
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56111-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62FE82B0145
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In vip_probe_complete(), the fwnode_handle reference is not released
if the loop continues via the default switch case or if alloc_port()
fails. This results in a reference count leak.

Switch to using the __free(fwnode_handle) cleanup attribute to ensure
the reference is automatically released when the handle goes out of
scope.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/media/platform/ti/vpe/vip.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index a4b616a5ece7..01d27769cd10 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -3389,7 +3390,6 @@ static int vip_probe_complete(struct platform_device *pdev)
 	struct vip_port *port;
 	struct vip_dev *dev;
 	struct device_node *parent = pdev->dev.of_node;
-	struct fwnode_handle *ep = NULL;
 	unsigned int syscon_args[5];
 	int ret, i, slice_id, port_id, p;
 
@@ -3411,8 +3411,9 @@ static int vip_probe_complete(struct platform_device *pdev)
 		ctrl->syscon_bit_field[i] = syscon_args[i + 1];
 
 	for (p = 0; p < (VIP_NUM_PORTS * VIP_NUM_SLICES); p++) {
-		ep = fwnode_graph_get_next_endpoint_by_regs(of_fwnode_handle(parent),
-							    p, 0);
+		struct fwnode_handle *ep __free(fwnode_handle) =
+			fwnode_graph_get_next_endpoint_by_regs(
+				of_fwnode_handle(parent), p, 0);
 		if (!ep)
 			continue;
 
@@ -3447,7 +3448,6 @@ static int vip_probe_complete(struct platform_device *pdev)
 		port = dev->ports[port_id];
 
 		vip_register_subdev_notify(port, ep);
-		fwnode_handle_put(ep);
 	}
 	return 0;
 }

-- 
2.43.0


