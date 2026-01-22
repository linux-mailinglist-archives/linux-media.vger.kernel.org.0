Return-Path: <linux-media+bounces-51365-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNRAOa14cmlSlQAAu9opvQ
	(envelope-from <linux-media+bounces-51365-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 20:21:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E06CF5F
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 20:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 074413006084
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 19:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8608E38FF1A;
	Thu, 22 Jan 2026 19:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=loescher@gmx.de header.b="q44yAeji"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D538E5E4
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 19:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769109666; cv=none; b=sR/VULnKlEbYKjCZOTYwDZBw9DhSTCVMdHmjkvQMi0BUgmgx9YYYvBaIBGO1MBzohVLTEjRZDZcJnLMvGWAZQ+TtamxD2puoZtC+pPrGF336j6l/DEaAdedZXuFZ+dPyZg9Ed31IEXGvqcCqaVaWY2axnCI61XibYH8hLbeJGSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769109666; c=relaxed/simple;
	bh=TWg0/Az5c5zjgUaHLYJggYuJcqquoO3ex5mcnG+QxI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rRXQofxqUGUGJQ4+ZWr0qFoX8sy/GdztbSpIpMIL+N6/HUFRZ1k1ozWQU2p4/hpK5sWQc1HZ6CTSrkh6rOfKmo1fxrXyqSh52mlzcHy8+v2MqXCkYJMbQk1siLGNqpuIWPUOBYxSui02VRFzngr9EESre+38h6rWpcG8deVzzWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=loescher@gmx.de header.b=q44yAeji; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1769109656; x=1769714456; i=loescher@gmx.de;
	bh=1wIGJS50qYYBL4v/s22T5z/b1QhCYzXh033CcPjVip8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=q44yAejiMgVdqF7XUN8csb2YeLqIkM//yO/sAxxTwq9B4vlgrbDjoBrFgTgxlfie
	 b1mR07GFWG6DyOWBG5LiEseky3Jr8MLXioh/itTB5o6kNVaYZIyOnPE6cggbH4iX9
	 uCRjOEjm1qHGphQ928uOcaJyYwLy7QX6kjxdWo/QY2LFrZSIJWyMMmTkmAGDr3AWZ
	 Y2HoImBZMOtYT5rvQt0ZKwLxI3NdKCu1QVfccgSC2NiJq4Q6yDfRgWMUBaOmw8BKS
	 C6VufReDfc3FG3SuGiZpFi9ryrSKglZ1/I+9/sHXn4DwmhsLpNdNK0SCMbiY2g44W
	 ArR8lkWSgoBiNTmh9A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.212] ([87.122.210.133]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6KYl-1vpt2n1FBR-015b1f for
 <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 20:20:56 +0100
Message-ID: <f153443d-a8c4-4871-8a35-de40d4efc3f7@gmx.de>
Date: Thu, 22 Jan 2026 20:20:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fix remote key stroke hang in cinergyT2-core.c
To: linux-media@vger.kernel.org
References: <74e3b0c9-02da-4f1f-8d6a-d2a63550b710@gmx.de>
 <696e85da.050a0220.1bec0f.4fd8@mx.google.com>
Content-Language: en-US, de-DE
From: Stephan Loescher <loescher@gmx.de>
In-Reply-To: <696e85da.050a0220.1bec0f.4fd8@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2ox85Rhi5uPxh4u+Hfzsa4ishPQrY5wvFY5npCmAj04CGnPwyZ/
 rsoisFPQg1RlBE78LQd9LOQQ8c0l5pmcgcER4lvFtZUtSoQYJaakn5ff5JT8wyvfvK6Tt69
 154mSCu/tnTy6bDmsVjUmK8drs1QGnG97jnyXC7H8XWmd2Gr2at1YFuZSMzJvRiLtbSJrBj
 EctZyEbJUL3AXK2VOhimg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A/mUha1kwAs=;65rGeS2L50FlBSRXzgFGxOTOj3L
 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
 Nxz+Zj4+2O6b3FEuA=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51365-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[gmx.de:+];
	FREEMAIL_FROM(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loescher@gmx.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: E52E06CF5F
X-Rspamd-Action: no action

=2D-- orig/drivers/media/usb/dvb-usb/cinergyT2-core.c	2026-01-22=20
13:40:04.647739827 +0100
+++ fixed/drivers/media/usb/dvb-usb/cinergyT2-core.c	2026-01-22=20
13:40:31.296007776 +0100
@@ -129,10 +129,6 @@
  #define RC_REPEAT_DELAY 3

  static int repeatable_keys[] =3D {
-	KEY_UP,
-	KEY_DOWN,
-	KEY_LEFT,
-	KEY_RIGHT,
  	KEY_VOLUMEUP,
  	KEY_VOLUMEDOWN,
  	KEY_CHANNELUP,


