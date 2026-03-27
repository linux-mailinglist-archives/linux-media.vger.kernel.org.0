Return-Path: <linux-media+bounces-57269-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLNXMOKexmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57269-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:14:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32984346856
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D984F309FD40
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564D9312831;
	Fri, 27 Mar 2026 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="V0JC1gYS"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09C13101B2;
	Fri, 27 Mar 2026 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624284; cv=none; b=q7FFFxWTUAtASNFlZwwwtMES3yU0z/7pPhbx/WvAwVzQXfjUu7xBOtEj2/YF90ORS6h33Mdlds/gv7iPQAF2BGheLqN4+cDsBfD6z3spNXyyVY4RUYaob/DxcDD+Ily5kIuJHh9INwU5/NB43Ak0+2aLaN7zueJarj3VmFuSRnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624284; c=relaxed/simple;
	bh=KN/N3oopvMiB0VfAzEMcEEumLWuV1+Ba4XrbPdAVPRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bqt6m5hxREAbksKzdkTzcZiXPXNBizLNcDqiOCpfn+n5GrEHSd2XfcQU+mYA5ZOooSKTyuys/cHeamm0QVA8hr+XuHaAMhhe4r5iOuFw44YDaaI3b9ER10fGgSjZRyFMs1mioqcbyN7bdRyIEatqA0oCk/OeWOILxpGB5UpxUHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=V0JC1gYS; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774624260; x=1775229060; i=markus.elfring@web.de;
	bh=tx/drJQe6pCN8oHJoeNP2lve3vXXO3efvWjoeh7d9po=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=V0JC1gYSaYyMA6s2eLINWVqUehvKgflvTpXjEq67GI+V4yAjncJS5WSRuK6KPluu
	 wL6ttUlNta4Psu3L0T6oL+yiWxL0S+XFMfk/yf2xQMPR+47hBg6dg+FUxQ9OXKIbl
	 Le3cTR9YX11xabakV5JecIIhOYx4zlsjAmi2I471FnMI5swpxN6iM0N3JEbBkdiiR
	 G0oos4FFUK6a5COQeCbZQO+52usP2RBH/132ct7INyQ3yhGQEqU22mjLChgoYaQAw
	 rxmIwksE+GzJGQyVm8TQfsYM+AErnfOPLjbzsSeG+9xzpGh5RyYijynPnLajZ+b4Y
	 xTr9BnmhLQybPZ3FVA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLARS-1vo3ks20cU-00W8na; Fri, 27
 Mar 2026 16:11:00 +0100
Message-ID: <d7a532b3-5857-419a-b959-7efb9435f2fb@web.de>
Date: Fri, 27 Mar 2026 16:10:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: tuner: add error handling for I2C transfers in
 set_type()
To: Wenyuan Li <2063309626@qq.com>, linux-media@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, gszhai@bjtu.edu.cn,
 23120469@bjtu.edu.cn, 25125332@bjtu.edu.cn, 25125283@bjtu.edu.cn
References: <tencent_A6BA9F112D5C2AF48A24BA55113B562D2F09@qq.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_A6BA9F112D5C2AF48A24BA55113B562D2F09@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O7j3N6g1x4Rg1ao8jwoTpiHCJK3QVE1dtOI0HgYtV3WiyxkRceq
 qh7Dp+Y36i0gtQDDqf9v1RSKCzLNC4ErKsedyEPBTrK9KiZ3IPZv5sORVFdmr+knTpb8IpO
 ZQFIHFZipH5k0kZZRnItyKqoRZbafltcIEjbLQt5Lcu2S5UPncCTMi+JEIdbNt4kC3ul/zm
 HkNFdUjbfYJjHPfCUX1QA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MEh07iWC9lU=;jOLmhrThf4Cp09//GzcaATs8Gf8
 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
 v4D2FuyNCOCrdP0PfBJmGcMQoPte4fWfA==
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57269-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32984346856
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=E2=80=A6
> Fix this by:

Did anything hinder to take another development requirement better into ac=
count?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc5#n94


=E2=80=A6
> ---
> v4:
> - Added Cc: stable@vger.kernel.org
> - Updated Fixes: to original commit (93df3413f1b4)
> ---
>  drivers/media/v4l2-core/tuner-core.c | 22 +++++++++++++++++++---
=E2=80=A6

Did the patch version numbering become questionable anyhow?

Regards,
Markus

