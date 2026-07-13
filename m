Return-Path: <linux-media+bounces-67523-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6IjCKeVZVWoGnQAAu9opvQ
	(envelope-from <linux-media+bounces-67523-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:34:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ADE74F47B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:34:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=rb1clmVD;
	dkim=pass header.d=mess.org header.s=2020 header.b=rb1clmVD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67523-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67523-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 930423137BF2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE43369D51;
	Mon, 13 Jul 2026 21:31:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB3363C43;
	Mon, 13 Jul 2026 21:31:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978296; cv=none; b=rmwLZWvCy9Dwr3qv6ZYWfzwZBABZSXRSD5Ays2gRMorO9gppxxZZ6ZciRrd4HhkfdLycVA9SiUMZg8dcxQ5IERytbjLKJPiXVgf4pumlpzkY14GVdxCP3Xy8corlbgBWHFdsY+l4wtvzWXFgNj97yZEHdLGdCHb5u12UFDBRKcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978296; c=relaxed/simple;
	bh=/wMd2S6H6xvTmWtuaEoRsTWos8Ya+ZV7pVOSZ2gd67g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QS7VHGV1ZWwoJTuSwr8rk9LuYE2RE7sV7x97owxtA+s9Vi8c7k0pi0XeKJIAPCSffTdbZSuzrTtm0gaYpcMsUoL7ejbbYGoLWC+RKG7ip1bIc/6vXOHsm/8gosFeHw170X+vXQkYqbEu8+5eKdBJka3pWTyubHeNZYbnty65s7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=rb1clmVD; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=rb1clmVD; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978283; bh=/wMd2S6H6xvTmWtuaEoRsTWos8Ya+ZV7pVOSZ2gd67g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rb1clmVDADAClHao1NcD6q20qf7aLV5ZPHJLbrP1kUdA6wyx2Axc7sIHONc3m5zsh
	 Y5Q9Jf6Yoy+P+rWJkZsAbzX85RV92Z3erFkvKUwG3fd0iejgz8Uo9a3iBgx19thJvi
	 LlqgDqZPeTpshPUhDJqJnjm2jz5JxTeuGX4EW/WJyiVqImkGuryD6Uhl4ALHiSs9EY
	 NqaW9BPVu8yMdiXUVHY4qAu+2ZJI/nJMsxDrvvA0G68kZwiJcTrUhmquIfpy8u4IWH
	 xSZjwBXiu4eUvMAQvn4CmTqboV77gCr6HaSxoh7UAoRTXOD+sqE93Dh912t8C65+CY
	 BeMR88hXafPCg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id C449C40A4A; Mon, 13 Jul 2026 22:31:23 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978283; bh=/wMd2S6H6xvTmWtuaEoRsTWos8Ya+ZV7pVOSZ2gd67g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rb1clmVDADAClHao1NcD6q20qf7aLV5ZPHJLbrP1kUdA6wyx2Axc7sIHONc3m5zsh
	 Y5Q9Jf6Yoy+P+rWJkZsAbzX85RV92Z3erFkvKUwG3fd0iejgz8Uo9a3iBgx19thJvi
	 LlqgDqZPeTpshPUhDJqJnjm2jz5JxTeuGX4EW/WJyiVqImkGuryD6Uhl4ALHiSs9EY
	 NqaW9BPVu8yMdiXUVHY4qAu+2ZJI/nJMsxDrvvA0G68kZwiJcTrUhmquIfpy8u4IWH
	 xSZjwBXiu4eUvMAQvn4CmTqboV77gCr6HaSxoh7UAoRTXOD+sqE93Dh912t8C65+CY
	 BeMR88hXafPCg==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id DA28940155;
	Mon, 13 Jul 2026 22:31:22 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/11] media: redrat3: Ensure all urbs are suspended
Date: Mon, 13 Jul 2026 22:30:58 +0100
Message-ID: <57b8e3e0efa4efa11a55d98edb093388844d231b.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
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
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67523-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mess.org:from_mime,mess.org:mid,mess.org:email,mess.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36ADE74F47B

Ensure that the learn urb is stopped before suspend.

Fixes: c49fcdde38cb ("[media] redrat3: enable carrier reports using wideband receiver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 44678ee322c2..468907d6c3a8 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1167,6 +1167,7 @@ static int redrat3_dev_suspend(struct usb_interface *intf, pm_message_t message)
 	usb_kill_urb(rr3->narrow_urb);
 	usb_kill_urb(rr3->wide_urb);
 	usb_kill_urb(rr3->flash_urb);
+	usb_kill_urb(rr3->learn_urb);
 	return 0;
 }
 
-- 
2.55.0


