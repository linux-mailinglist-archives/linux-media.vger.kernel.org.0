Return-Path: <linux-media+bounces-56863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMXsFzZ8wmnqdAQAu9opvQ
	(envelope-from <linux-media+bounces-56863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:57:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA0307C19
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E41A304E241
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8926B3F1647;
	Tue, 24 Mar 2026 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="oe4JKqrl"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF333EDACF;
	Tue, 24 Mar 2026 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352911; cv=none; b=KDjD7lbuhedRHXD54sGfPTUQu/1Yj7uOrhRs1MLrLw4FlJ6ueP+sQS/XPM9lWZGL8SiU7VTa4BK8WhbkhNy2A6HLHlQ6NZa1D/x/RqHSSYVQh7Y425zlmAwzhN/X4HaY6zn62Psk7vRWv0TDwpk4HKKl7fx8E4Y786AVcPjI4IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352911; c=relaxed/simple;
	bh=WVXTAYC1jFLXBLDuXwkxWfTGymz5RyAtN8Qn1RGXCyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fHm66LL7DI1EoXsVffWMIymytXgZ0B1FaWjbKl2jbTl1tOuOHjjPTKnG2T+MGsoR74LrpRtGJ73SLmpr1Mh7fjoWZ1jwRrYraqlYx+LC2nhcva4d60VOcEWnkW6IMTJENyWCl+ohRB2F4iAa1y3mZrfUpHYgKt1HZFwHbvVPeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=oe4JKqrl; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774352901; x=1774957701; i=markus.elfring@web.de;
	bh=WVXTAYC1jFLXBLDuXwkxWfTGymz5RyAtN8Qn1RGXCyk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oe4JKqrl9z7Un0TJkfLxenTRy7L3+rtISvhRI3/GBdRRwoMUeUW31ZvgxAHFB+M+
	 3WXSpScu85nM9YLD0lOCLqSYDF+wtB711Mkz9G3dtRx/4SMbNppqjboSJ38lthTGO
	 tNdUKs8MU0N/rmvCZDC+HslkZHjk4bQ613DwH9ZlDMOmv/k8qyqjUZ6Q1Rr2s1HxT
	 EWDg/ItDH1VS2rl9bSB8xqRmo/YCLjaJRO6FERetHRvABsgZSpq7Sz6X039fzHWMO
	 7joi5g8NeJdf0zA6XL2o2KupQ/mV53s+XqsWXRT/XYtkNjYdUpd+t4UWozAoHoFPS
	 AJGijxy60b3zGzEYZg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M76bb-1wCPAg13Gx-00BTfl; Tue, 24
 Mar 2026 12:48:21 +0100
Message-ID: <5f83912a-cf5f-4621-a64f-b6e09b47bf27@web.de>
Date: Tue, 24 Mar 2026 12:48:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: tuner: add error handling for I2C transfers in
 set_type()
To: Wenyuan Li <2063309626@qq.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <tencent_A55E983CA3588C54E8172574B723EAAD560A@qq.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_A55E983CA3588C54E8172574B723EAAD560A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fb0DhPr7qQP/J10N42tjLgB9j2sS5BnuVtgQ5L32PCTz7auup36
 9azXtXWrlxdkKX00fxVYMRiMYkWAOkECcM4UfifDNLkH3zqU/8VxCuhxMMtuWTDaBnhv4nS
 E/5qalzW5BIqJkCeJuzG2hOhSG9NULfWD8hkEVYD8sgCUsWHrlhLYgTOg0zWAcdkxlo1v+1
 SDmLqF1KC1G900/3k8Qtg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9dmWsk21NGE=;cGnVJfxtd3FN1cc3/b1Y47OG6ui
 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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56863-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[qq.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[web.de]
X-Rspamd-Queue-Id: 3CFA0307C19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=E2=80=A6
> This ensures that I2C communication failures during tuner
> initialization are properly detected and handled.

Were any source code analysis tools involved here?


Do any contributors care more for another development requirement?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc5#n94


> Cc: Markus <Markus.Elfring@web.de>

I would find other tag variants more helpful.

See also:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.0-rc5#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.0-rc5#n34

Regards,
Markus

