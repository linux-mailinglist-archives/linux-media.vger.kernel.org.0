Return-Path: <linux-media+bounces-67522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1bleO0ZZVWrWnAAAu9opvQ
	(envelope-from <linux-media+bounces-67522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:31:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6C574F43E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:31:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=JkDSk7Uc;
	dkim=pass header.d=mess.org header.s=2020 header.b=beMRrv2R;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67522-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67522-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 584A2300F0D4
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EFA1E0DE8;
	Mon, 13 Jul 2026 21:31:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EAF355813;
	Mon, 13 Jul 2026 21:31:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978295; cv=none; b=V74Q8ttIvh4QZ3aqojkdCl2NuPMtmslJya7iKU/YM2dECPwEZtm1YqS8EPM2nf9SIXYn52APWhgiLU6bwgO/gQkqR+AlKQhFwbC3IbyA4e1yms+U2VD4eG5izQomE1hyTnYFV1A1nppJNbsSt3m3O8Vmu2ThoC6qQ4v9oJ2QHFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978295; c=relaxed/simple;
	bh=sN7lYjU8zHlrX56FIz+okt6DZ37RUyPize8qBxfzelU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EoBYH2/WGbES9uvbSDHNFq215z2WMwKS7qM3hDKWZP3vnp2bsrn/ncqpQA3TLBSgeuXpm94+p+60TN2fdgi6sKo8KwEBJVDJdBAdvWb71EoKN4ihZx4IaAZogKKwucGdxR2mJsqtOVmC4kP6ZbMr96pHf/GwuW4QPEpRBtnBjCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=JkDSk7Uc; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=beMRrv2R; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978282; bh=sN7lYjU8zHlrX56FIz+okt6DZ37RUyPize8qBxfzelU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JkDSk7UcptnTK9XDatRlapAfQtlwBYZMve/Spj4xtj2eFa2EHLuI/KmvAtHG1UuJ9
	 fR5Cfke3K85geCgLMebDtiLBI+i83+XWLnG8/SHUnBJPfi/q2RaS//KDqqwc3S+HkR
	 cULiUq9EaF/tvlnq74l1X7uMIYZy9ITLfa/cqQiT9qYZbOb71yOjiFwn7CdQsP+8l7
	 bU3YJT7FGMLpZ97NgTX2Ugh/69d5M/X8IU45O0NWANFV0K5UlMxhUFvPFgyLSiTTpC
	 XXhfkRRPKSjwaH0adp3LC+ZRC83lyZu64eOJzjRY5fg8TeS7/t6suL5neVpVZck+40
	 +Ln6yP/s3PwZg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id C94CF40A41; Mon, 13 Jul 2026 22:31:22 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978281; bh=sN7lYjU8zHlrX56FIz+okt6DZ37RUyPize8qBxfzelU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=beMRrv2RfHP91xBu21znMcx7Tb9ZsM7u/EBIDK57aHamajwarLUFK7oZ17++YeoAt
	 Pj6Z/Y5WlQZqKEta2X+5WikV05OwXHX54bjXSdLsrwOi8Cp09XJzazKrNudPtNuorF
	 sQ7sznH8ZXHl3wSqUCVv69/WbSt4ogdnikUG8NtQp8CHOKXpG9Z6QZFpIwyEZNCeBA
	 aiY6vMp+tZsyNwpxlNIgQ5taNkyBNMQj044VoGp4kf3IYY6se/2pPffwdIbI0jh4FI
	 GnxEQRnyT8DkGwbcZ6biPwqxQKm0VLXYggVu2twxGwr6HCzFsBLIgkPiD71dxXmClh
	 dpQrXOOBhN00Q==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id CD3EE40155;
	Mon, 13 Jul 2026 22:31:21 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/11] media: redrat3: Ensure rc device is freed if enable_detector() fails
Date: Mon, 13 Jul 2026 22:30:56 +0100
Message-ID: <bdf98db19836b04c2c55b5ac7d8e3983656b84c1.1783977550.git.sean@mess.org>
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
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67522-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:jarod@redhat.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mess.org:from_mime,mess.org:mid,mess.org:email,mess.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD6C574F43E

This particular error path does not free the rc device at all, with
its priv pointer still pointing at freed memory.

Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver device driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 3f828a564e19..391d01143491 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1111,17 +1111,20 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 	/* might be all we need to do? */
 	retval = redrat3_enable_detector(rr3);
 	if (retval < 0)
-		goto led_free;
+		goto rc_free;
 
 	/* we can register the device now, as it is ready */
 	usb_set_intfdata(intf, rr3);
 
 	return 0;
 
+rc_free:
+	rc_unregister_device(rr3->rc);
 led_free:
 	led_classdev_unregister(&rr3->led);
 redrat_free:
 	redrat3_delete(rr3, rr3->udev);
+	rc_free_device(rr3->rc);
 
 no_endpoints:
 	return retval;
-- 
2.55.0


