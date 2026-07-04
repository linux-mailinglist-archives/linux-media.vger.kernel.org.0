Return-Path: <linux-media+bounces-66571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OuysJBe6SGo5tAAAu9opvQ
	(envelope-from <linux-media+bounces-66571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 09:45:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0134E706FD3
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 09:45:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=Kh1yZ7Lu;
	dmarc=pass (policy=quarantine) header.from=web.de;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66571-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66571-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E5E1302A71F
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 07:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63D13955FB;
	Sat,  4 Jul 2026 07:45:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C6C2D060D;
	Sat,  4 Jul 2026 07:45:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783151115; cv=none; b=V72hVrj7YU8MiFFa3f4KVzQu8TmBkxcqJSKFXwIbce/hVsRWF5NJcVqpFHEaWg+XjhajAYkg2ALcgu+ytQxILZgYP95R2cWuzov4vt1meUcK3wnIGS4xvOLzHzsFJTQfWSwm81p4ECtlVw7W1IsJposJQoNqmkjjVgiAULlSXvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783151115; c=relaxed/simple;
	bh=pOXgGgUfLg25Io5X2YPxjpZ3k3ptSqyDoKm6OQwRAgQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=BAHrRYmHc+1tSIa6JOAxYx7dvYJ4vO780vrAjHMIiQVQqY/jn4vChPTGXgqYoJ7T8ed3kuvJ103Eh3EzhSapKRwb4BX1/O944G/uPqZXHsbyEN3P70uOU2pcUh+J6yaWmogMhAxtwE4hlho2NV0/gbu1EXFdupjXQXePazADr9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Kh1yZ7Lu; arc=none smtp.client-ip=212.227.15.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1783151092; x=1783755892; i=markus.elfring@web.de;
	bh=pOXgGgUfLg25Io5X2YPxjpZ3k3ptSqyDoKm6OQwRAgQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Kh1yZ7LuPHKZNQF9D+HK8jCWBzLeEj7U1WBMd/jiYEDeM5iARtq3rsFzDz29X0NF
	 ZFmgBOWMgfuIDRQCRfDA1oAHw8rcmCJoH9GuanL2MFzRJ1VD0wnG/dY2XbXAJDnzB
	 b5nlnYFRpoNffhZvt0Y58qCVkqs/ak1EnyE+9Kq2l9sNdygsuD2KXLpm9ZEWIitFc
	 cBuYGFMV/oQYvkjj+/YARDomUVMF5kLN8/YE+GCoVN9N+zJPZi9kHoSYdpFofdlmt
	 QOP+DaFoD/8WH1YLTEmd457+q7NgdJLltDTs+BG2L/fSgtt5O2j1JO0/VJd3oRoND
	 bMrv0hdATMSNCYXPOA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mkmvj-1xNSw70UDH-00nWGT; Sat, 04
 Jul 2026 09:44:52 +0200
Message-ID: <50427aa9-c5d7-4b06-9c09-dab6032ffe4b@web.de>
Date: Sat, 4 Jul 2026 09:44:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alain Volmat <alain.volmat@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260704071740.37531-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] media: stm32: dcmipp: Propagate runtime resume errors
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260704071740.37531-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dpRyGk3Zq1S4MgbH6bVxNslCF1tENCsXc+XAk2d+qxFSZIUfmmH
 /QApZr02qzhhvW3MF5BJGUDj2e36c1qZIJ+qhQbbRnKhGPhXLtHhnMrCgPYrR01FQUo+0XJ
 aRClvLA0b1317ppe1e0qklETDu5KBWGVbhVtugdaOxM/ZglDl5Sdi3GrQPizmBHzR2CTqox
 6O/g5Hcft8x2hrVjmv/QQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6tZn5Gh5Jik=;W17w/BFhzVixWyhD3xbAbiv13hA
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66571-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com,foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:alain.volmat@foss.st.com,m:alexandre.torgue@foss.st.com,m:hugues.fruchet@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0134E706FD3

=E2=80=A6
> Return the pm_runtime_force_resume() result so system resume does not
> hide a failed runtime resume.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

See also:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.2-rc1#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.2-rc1#n34


Regards,
Markus

