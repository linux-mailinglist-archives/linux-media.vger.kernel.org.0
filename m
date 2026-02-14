Return-Path: <linux-media+bounces-52815-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENIPGLWIkGlbawEAu9opvQ
	(envelope-from <linux-media+bounces-52815-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 15:37:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A85C813C339
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 15:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4C6A3023DFF
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 14:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA10268690;
	Sat, 14 Feb 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="IXEyjLz0"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641923BD1F;
	Sat, 14 Feb 2026 14:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771079835; cv=none; b=nmSfMgG14Sz67/5jt/Fr82MuID9Ozr37cu8keF/ZFNjoqHZ580rhgrzMiaZvdlfCZozgCX/5J8vjYcNzOAIjmv0hfg7iqFSh08ZwYfy944ggzWq+AOHC7jTRyS5CSGn9e40Q5xoHtXptIhhCaxikaoUNEuuPaQaNtFQYEWJzjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771079835; c=relaxed/simple;
	bh=eHMazxgRqvHMWJd2dYG6jwtEjgnBojJOqjK3RtUBkdc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=givOog1Ubusa0J5rxxUUXKu6l/HBSizbf0fjV81b6xRjfMHxq5P8fb1JVNQbpnUmWzwQLdCpeYIB4N3wdouObax5/6OBir6E/7EnO4yl38D3n0eJSIPVpohWZWK5F1ntqPBFyIEWm1Owasvi5t1wn6qfMevc4ZGj9Syt+eIaoEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=IXEyjLz0; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1771079814; x=1771684614; i=markus.elfring@web.de;
	bh=k4sI0FULeQ9qu5TSRIMfJ4G+zHlRPF6E51qIV/0+m28=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IXEyjLz0GM3mKOZ1XYQrHfzUSZ8q6Q81J/M5xhQd6zLmMAwgOTBxZjZiXE8DYtPh
	 hSl+kR/WdNZ1BEY9M2EVLT6cXgQlBLde1wADl1sZ5bO8nq2cqphntE/TQGHq9WulF
	 A0HEF++Y9okaheSTLbtQL9LwohDheR6kg219HJrANqK5g5U/owBYmsYePe6EQVSZL
	 rFDTaPXxyp4XCa1P33aT6TSS+nQiVy4E229nN/ImWWcyu18sG/9e1dT/pUnMlIUvS
	 /TYqip/jOgiIm7U+tAiTx2sL5tYfDdoyMxKLxxHPMksXHv3oxET8Vsb6vWxYZ1ta3
	 U9td8HuoPWM/HvcEhw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.241]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRW6Z-1w5w2N32UX-00P9w1; Sat, 14
 Feb 2026 15:36:54 +0100
Message-ID: <b525c449-652b-4557-9517-ae695ffc3105@web.de>
Date: Sat, 14 Feb 2026 15:36:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alper Ak <alperyasinak1@gmail.com>, linux-media@vger.kernel.org,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nayden Kanchev <nayden.kanchev@arm.com>
References: <20260207091822.601255-1-alperyasinak1@gmail.com>
Subject: Re: [PATCH] media: malic55: Fix possible ERR_PTR deference in
 enable_streams
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260207091822.601255-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pF3Ya2lR31O4n74xXPZ25thn+Sar+nxGP6vKloPoDQFGl+r+Jab
 XCS7rYLtiXBJTM7TuK+9lBSLPUhJ4zAGwCnSw/DGgqsOYvB+celTtjnThVBzKbIpH577wiM
 +uLym6vHmBI0f9WTDk3/Ko2ewYdQq4JnORhcSVordGLOMmMVDlb8S3Ui9UBQxe1ow0OkyWD
 6v+llm2n3VZjrK9AiHSWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9aHEJoOH0Xc=;ZXxIrls0d4x4qSNY3tnChD0Wjou
 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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52815-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A85C813C339
X-Rspamd-Action: no action

=E2=80=A6
> pointer or an ERR_PTR() on failure =E2=80=A6

                error pointer


> Add proper error checking with IS_ERR() before dereferencing the
> pointer. Also set isp->remote_src to NULL on error to maintain
> consistency with other error paths in the function.
=E2=80=A6

* See also once more:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv6.19#n34

* Were any source code analysis tools involved here?

* Would a summary phrase like =E2=80=9CPrevent error pointer dereference
  in mali_c55_isp_enable_streams()=E2=80=9D be more appropriate?


Regards,
Markus


