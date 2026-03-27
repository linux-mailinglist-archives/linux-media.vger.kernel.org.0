Return-Path: <linux-media+bounces-57253-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGIxI/iRxmkyMAUAu9opvQ
	(envelope-from <linux-media+bounces-57253-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:19:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A8345ED5
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02D15305E9DA
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70803F54BC;
	Fri, 27 Mar 2026 14:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="I8m5NWRd"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68203345CB0;
	Fri, 27 Mar 2026 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620966; cv=none; b=IFQoDJ7IJovjpaTitP8h/k0qUAIBWdBXu+jTUf7gSgvY4VOuA/GDd3tEgczA1B9uOu/okxabLv5rhjyE4+8We3/uG0KZTyJU7P1OqkpqhLVvTFne0WcAuIhS0MoNLgfBFZFquaB6cZDkEukZEmX1NfBO3PVphyaZ99ntT4Fylsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620966; c=relaxed/simple;
	bh=CCQcWXfRhfweSERGbnVbNuZIW9remV1MspwlJGH4JsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1K0F/nwx5obtKSddn3Cwm8fzXvgbgDJUroGD6cqdOwNZZDnziSCqqD1eLxmEkgj41ilFtJs35zsSETQNR0Hu8F0EuthJuzWjYplxQ5/ur+Mq7qa+28DjqLv3HMzXkxSkXYEcjB3hwZXSLNNRhbukbDLoeSSHGC2kY/lNK+vwFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=I8m5NWRd; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774620939; x=1775225739; i=markus.elfring@web.de;
	bh=Cr1scZZi7zdydZbOdobTccCzBZnQpm5ZyembG3sAVrU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=I8m5NWRdB9PuaFkxJFQDZROab3SflShpLg6IBJUebngxjIo1KNsjcCMDpc7xbrzw
	 er42s2OqLxBZiT3uEon4Os302fDXn39iXgCVEPi3KBEJoSBsqzW9bVOwBtHzj46sM
	 aP4nEF9T37JJ824GNKGNXHA84Y68OrvosmNrsPKecqQlPqjaTAG/9qId8ZKi2w+QQ
	 mTrWk72m61LwGqMyNqXa0zDWQ1NZXKV0Xd8rBqL0v6tC4H9Cgt6Yejc9YqN4wbUKS
	 FWBpMktjDJ8EyXb2QQRQYfgi5bZCWzDgwcYSxXWHdMVE3asY6u+c+oanpStDu2ovc
	 7o6IhayakNoLjyTEMg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWzD3-1w4IS20b3h-00LxMq; Fri, 27
 Mar 2026 15:15:39 +0100
Message-ID: <98e67723-5100-4a35-ac9d-26a2414037ec@web.de>
Date: Fri, 27 Mar 2026 15:15:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: ir-i2c: add error handling for I2C send in
 get_key_adaptec()
To: Wenyuan Li <2063309626@qq.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Andy Walls <awalls@md.metrocast.net>,
 linux-media@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Sean Young <sean@mess.org>, gszhai@bjtu.edu.cn, 23120469@bjtu.edu.cn,
 25125332@bjtu.edu.cn, 25125283@bjtu.edu.cn
References: <tencent_F0B755C48BEB67380BA88ADF22C96E1FC407@qq.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_F0B755C48BEB67380BA88ADF22C96E1FC407@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u7+QixeRS+xsga83TThFi2oZMUiZ6VN+TRvmCyxNfeOIURVkdlv
 Yg/PU65NKHOZotBm7LGHSUltoP+JxETadqBhohzAd4SMAD8yxLgTg/eo80//INhLb3/sH5d
 cWDMqgcawvq8PofrpprNwxNDnpHDKS3Cf3V58VCaCzTkeZOvvI6KjKX2NFN+Xr2UlEMoQWs
 MYDsJA5yuSz8MrCaiPGqQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RI6IeVtMJBU=;z5nAaYZZ+nSA6GE7aLOFoWLCCBJ
 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
 BjoBXAB90nuNW4QpFqUHX632SHDHqwsbA==
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57253-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,kernel.org,md.metrocast.net,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A8A8345ED5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=E2=80=A6
> Fix this by:
> - Checking the return value of i2c_master_send()
> - Converting partial sends to -EIO while preserving kernel error codes
> - Adding dev_err_ratelimited() logging with %pe format
> - Adding similar error logging for the i2c_master_recv() path

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc5#n94


=E2=80=A6
> ---
> v2:
=E2=80=A6
> ---
> v3:
=E2=80=A6
> ---
>  drivers/media/pci/ivtv/ivtv-i2c.c | 21 +++++++++++++++++++--
=E2=80=A6

How do you think about to avoid the specification of redundant marker line=
s?

Regards,
Markus

