Return-Path: <linux-media+bounces-57246-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIecKE2LxmlELgUAu9opvQ
	(envelope-from <linux-media+bounces-57246-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:51:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 072C7345988
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A6AD30B26CB
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 13:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAB43EE1F1;
	Fri, 27 Mar 2026 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="UiLRe9jJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766213ED13E;
	Fri, 27 Mar 2026 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619064; cv=none; b=OvULSsBqniMr7vTcoWHhYNQHSwoXEiFlSOpUIRRBtO91CHKp4rvo/GBUXJqtGH5sVwf1aMn4xardkiyHik9D/7YcvgAxL3LXATsgiHfb3AH5N+0lqFaBALoWEfh3JYji1pl+jXF3P7szfupszSD0Y7kgCNq5OSJs3QMOmyvmwmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619064; c=relaxed/simple;
	bh=zp4B8gtOxCsufdh7wy4QZSlBVelDOoXz75eKfybgmTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLXiIXa3H949P6p+TYxcVslblXc0phDizLKDLG1sntheIF1dsthoq4w838vApEe+JwsWeCZlY9zgUd8kND6c7BplNSOPtPwz/MHxxl6R2KMM4jp/2dVJuJZmpbIdmBw1i4eyXuBDWvOZtDaDIN0385bGWBAs4B5ozxgqCwPraf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=UiLRe9jJ; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774619049; x=1775223849; i=markus.elfring@web.de;
	bh=jTyYuoqxeyiOIyclnpl5xPZNS+Xje0DXiwYwhpsRafM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UiLRe9jJV1L823s9sfZ8OPDx2PR5E6yVatDTZvy4ROz0yiLATbA4yZxoR2+nhEol
	 iiod+SDLFbiimdV7kn+IKHgcoYbGYO7ckFod5bmW54LKh4v/0M9XMpJiPWvxhrEQp
	 gyz+Tfh7716LODRNMwhA3yvdvWM0hmlicA+XhsRScYsZM1pxY3jJ4L4K+LG7sW35S
	 /MdSfSEKY9Z/LbrwddvzFGMcR5w9t71fOXjOCWc9ayid0rv0pIKlRfKUJtn0PFrvH
	 nCM/vQBoFIq1ZFpM92nuak/aglQJ2O526v2RfskGY7ncAwWUdu1lzbVE7zDDnhqcW
	 sBhOmexTjebeRKY7KA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhFlm-1vaeWI3IDy-00p8qM; Fri, 27
 Mar 2026 14:38:24 +0100
Message-ID: <0201d4dd-f7dd-40af-90e6-0865bfdb5190@web.de>
Date: Fri, 27 Mar 2026 14:38:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: tuner: add error handling for I2C transfers in
 set_type()
To: Wenyuan Li <2063309626@qq.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 gszhai@bjtu.edu.cn, 23120469@bjtu.edu.cn, 25125332@bjtu.edu.cn,
 25125283@bjtu.edu.cn
References: <20260327100815.23565-1-2063309626@qq.com>
 <tencent_3F73117D57532EA69EDD2C9E2BA48A5EBA09@qq.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_3F73117D57532EA69EDD2C9E2BA48A5EBA09@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k83fKmn5KHlhxebbQsj/6pzWah7pUy7UqT+MTFCr2qbhy+Fu0hk
 eGVfNP9kC/VnHWvpX/V+B8oXm42Py77DSHjsm3/aO2nlk2z8cA3cvZJ7I+ViqiXUaQGwLor
 Qqpx9RYD8QORyhFsBZACWOLzCSM6sDCc/cSqx0A0QK/Ju6ORJBzkaNYTTnEjdC7WeF4rSZg
 GzyrkdTggErYdkHhQU6dQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SbOBkcrHn4Q=;ugIMbLDaZxJQWPwK3Iammw0bTve
 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
 i7
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57246-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:email]
X-Rspamd-Queue-Id: 072C7345988
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=E2=80=A6
> Fix this by:
> - Adding a helper function tuner_i2c_send() that checks the return
>   value of i2c_master_send() and logs errors with %pe format
> - Replacing direct i2c_master_send() calls with tuner_i2c_send()
> - Propagating errors to the attach_failed path
>=20
> This ensures that I2C communication failures during tuner
> initialization are properly detected and handled.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc5#n94


=E2=80=A6
> Signed-off-by: Wenyuan Li <2063309626@qq.com>
>=20
> v4:
> - Added Cc: stable@vger.kernel.org
> - Updated Fixes: to original commit (93df3413f1b4)
> ---
>  drivers/media/v4l2-core/tuner-core.c | 22 +++++++++++++++++++---
=E2=80=A6

Please move patch version descriptions behind the marker line.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc5#n785

Regards,
Markus

