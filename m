Return-Path: <linux-media+bounces-66329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D5RnKyEwRmqQLQsAu9opvQ
	(envelope-from <linux-media+bounces-66329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:32:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 936346F549D
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:32:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bJuk5bHy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66329-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66329-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88E23300D343
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 09:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA8947B431;
	Thu,  2 Jul 2026 09:25:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5C1412271
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 09:25:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984344; cv=none; b=PPx1sVcBm//bUx0nKzMhLwRcjKS6UGuS5VG1ArxhHLus+48lDM8eOi1OwCmgrHSMpu3E9Z9jSr2U9vQqAkY3ty3tvbSs1Bba0HeBio1n3QTQVjP5Kxnt9ejhaNQwkY7x666w8h7jgr8PUW6RgRXFPTB4zpxgUjmMnThphGPl9Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984344; c=relaxed/simple;
	bh=bxHfofVftas0nDT0dCU01gYtETbVotYMlAQeU6wjcUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZaVNqwTvbof+Y6lEEHhX9JgRlSxokkOc7g6bX4NbQZ9BoIkFMTj0pc5pryGbXgFFidlk5y+crt2GODxSYdqvHbkhZfd4y/LHrSacgdOdYJzmSKET0yzskqtYHr/Nv6cUuatYyc+g5Pcdu7aORREXSA5mTrCJ/lCExCymBge9iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJuk5bHy; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so10822175e9.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782984342; x=1783589142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAf0SbLKbze84BZy2kaqNnSUiZel7JKCETRGPOgpKO4=;
        b=bJuk5bHyE5LBKEJ5Ipm2l3dm/5blYLy1+GuT7HWgE2YcKUxIHjHItK2qjvjhuLpxnt
         jgnEGlQLuRINv6OjoKVHkDlCILn6xFkFKu53FKIkCFJeHmjijogbCA2iUeVQxvDlMHMT
         hjCSGNGI1PBiH9drt3QPbCpkkMLgfPL24aVmpuAMNxiz1tUmI22CnB4qnFhAK55xjuTJ
         0cAMDet9SsSwJ6oWTNpFenVrmxDWTnWJGv20ew0RGH6ZQe/yklEqw2/HfGSTg2uljOpt
         ygL5HjW/Eh89BWWnN2zYufZG+xnwEkfKi2dAFq0SW4NQ2EZNbfnrspFyxNLtjX4ahTJx
         oa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984342; x=1783589142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAf0SbLKbze84BZy2kaqNnSUiZel7JKCETRGPOgpKO4=;
        b=HlLm5Z/Mwt1tcQuC2zsG8gOZjATNcf5uQcNjiJgLIIj5dcZa5DtIqMr16bP1/Hml+K
         xC8NYk0IJeQ9CbprMI/XH+libqBwBp8Rqp88GEFhpOANSmBwmhMOeSsWIgMPWrEE+JmB
         fg4V6YNYAueNwMOb8tLo1Ad/MZdWz/XxnVHmg117hYEcjoJDJm9o/f+AAhLRvNaUFa8S
         ld3xmkAtwvASRKi/lHuRiNq2Vjq6uYv/w8NGlx+nTw+p5KoEZtPH5hoaqs0GYNoV2npt
         WR/n8QATmVQ1Iy7zF3fqt80h+FKoz5F/bmMkNqtfp16u1aBiuKm50Kc/yH6aZM/8Sv9P
         ekKw==
X-Gm-Message-State: AOJu0YyV1vqk7x/VCtsUhC8If2Nbbvh1jRGL0f90ZHNltQ7lJLgZ8gsK
	2qnWS1W/VNqBlAElJwMRqADlMmVlbA2GW5/jncIZLPuBV5AheC7jtiX4oXcaQQ==
X-Gm-Gg: AfdE7clhcdPldgmtr5zLHS+F6dK58RQlHQY4lXg+/iVI5oblNIKftzaMl1todlPeQDO
	/PaCc1k90oS9rct2IM+sZ+slArQpNHIdVmOQ+nRdU3Plpp87kOLTTlvDa9XsNe1lDAuGww5nUTx
	vYFP8AVSKGZQacsunKhK7UBu8EgMizqGhxXp4Wis7XAzAboLLvjnnHKXte/Dihyf98iv+oyQ7JV
	11Zf0iS8Jjb6A4k7FIY4Xp/YTt3knMoUFW1zEk/WdN/E3+xc0oJZxPk3XirThdgGWaQkOVq29Nk
	3aWN+pv3qFmqmRKLRr+bgqFEaNYflAzMHPl8qUCZyoE07wcHGJjTVZRC54f7Tq7dUJ7X8O3cYG9
	uGOlUI6V7PoD/TjkMxp4yFlIxc8KEdt95wRS7de0krCkSzBWdyDX6CXuqHBKRr0y/1mhh2iG3Y6
	vRDCaKBj9GWo9XpPRx1b8MAflsYexHhMUke8YjyPJG025/8hS+yhI9ncrogToyvKM9bJjkKT57M
	is6hIg59Rk=
X-Received: by 2002:a05:600c:154f:b0:493:bd4f:510 with SMTP id 5b1f17b1804b1-493c3cf45d2mr58466845e9.19.1782984341599;
        Thu, 02 Jul 2026 02:25:41 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6381e4fsm38312815e9.8.2026.07.02.02.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:25:41 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	dan.scally@ideasonboard.com,
	mauro.chehab@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] media: mali-c55: Fix clock leak on reset deassert failure
Date: Thu,  2 Jul 2026 10:25:38 +0100
Message-ID: <20260702092538.335036-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66329-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mauro.chehab@kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:devnexen@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 936346F549D

__mali_c55_power_on() enables the clocks before deasserting the resets,
but bails out on a deassert failure without disabling them again. Both
callers treat a failed power-on as already cleaned up, so the clocks are
left enabled.

Disable them on the error path.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index ee4a42674..fb81141d1 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -699,6 +699,8 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
 					  mali_c55->resets);
 	if (ret) {
 		dev_err(mali_c55->dev, "failed to deassert resets\n");
+		clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks),
+					   mali_c55->clks);
 		return ret;
 	}
 
-- 
2.53.0


