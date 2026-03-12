Return-Path: <linux-media+bounces-55511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIXELS3csmlMQQAAu9opvQ
	(envelope-from <linux-media+bounces-55511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:30:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5352747F0
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A35713043D66
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 15:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC9E3C6A5C;
	Thu, 12 Mar 2026 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="pzlMOb/7"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F93E375F88;
	Thu, 12 Mar 2026 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773329312; cv=none; b=WwPdMJLBWuRtsfZD0xL0H+sek+W77ze91E+1bR+UpwGGxDHEYFbZIUEAKeuLr2XUkSFlNbv9OJ8AIap4yIqwUlymPM2JIm0wCtnOVdugydwvx5se472fHBQO/UFcqzAMR1iHGXXsSdk4lBnE7xCDQTYIoTYwiSKrPfI+70y9jqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773329312; c=relaxed/simple;
	bh=mg5QwjVB8C3lyA5B4GIUBanFC8PT/4NVDirTPg56Dw0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ta67EcvbfdLQ1mj9aVygSCMXtdhNxdAd37LlYQbOk9u10nCas5dkP7e4tH69bLp/fopydOZk1Cne+TOoVh9Cq+3cfUtoh/Rg6eSb3x9fQ4PphWi1NA3qP1Vsrpppj5ejfbGY2kR9d2oc0+PPQ/wUD8lT63fcrSBjvD87kaYf4Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=pzlMOb/7; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773329296; x=1773934096; i=markus.elfring@web.de;
	bh=SC8u5eoiPAkMWwOVbnMih4gktNVv+/wNn305CFKLNXc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pzlMOb/7U2ZmxNy9xTL+j9Nmes2G9v6xBfkBmoTqBSLrrFdL9ov00sOTkwzeJXYy
	 3AauKRvJCUq9WRyeNmpdPROH+qf29cuv9Yz4Yt5XThrlyPZBE2Hvtd+A1x9eJYE2a
	 W1MQisgeRnk1R6ICKo1yj0CgsApgITJPY4C+czUqXox+t0gv86uboIk1lqLGsM2Br
	 Vg5DFaiPmi2WrUSV5H/iB9WuF2r5SBOxoCMCM+FGcKlac55VDfFOj0y3M6ZZFiMhm
	 3C9wLojiLaJQxRCG+KyW6qcyC94sNpAe+i30ZM1Mee/4HxdcIPJNZCZ7WGxPMt3Zf
	 FJQ2I1xxWnZnrYlAqA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MgibW-1vQFc33xNs-00d9Ym; Thu, 12
 Mar 2026 16:28:16 +0100
Message-ID: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
Date: Thu, 12 Mar 2026 16:28:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wang Jun <1742789905@qq.com>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 gszhai@bjtu.edu.cn, 23120469@bjtu.edu.cn, 25125332@bjtu.edu.cn,
 25125283@bjtu.edu.cn
References: <tencent_D591461D8821B2B10E09549FF5379CE6C706@qq.com>
Subject: Re: [PATCH v3] media: saa7164: add missing ioremap error handling
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_D591461D8821B2B10E09549FF5379CE6C706@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j3UjvJaZMnAWbj8kJ0oltxzF1RqAVXX8yPZsKN3xcU2bhncFZCd
 1FuGQupfBY5iHvjhtYymVSiG+Cm53A+BRShP44rJEro+ZHoez+ilZ02M/YGMJv6aA7mYlbb
 PkhRSP+FfDl42wl+zLYgPjocpX3AmEvV1KeyYUqUiTq6X0sGNCjUErQnMDFO7fVtx+6bjCY
 +PyDRPbSm3aZe+hyEB83w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jnsQAoDSvWY=;FLl6v0ozK9lI9KO2rmn6a0WBe3z
 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
 HkeRRp55OwAVvi9NQv3i
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55511-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,vger.kernel.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 5C5352747F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Add checks for ioremap return values in saa7164_dev_setup(). If
> ioremap for BAR0 or BAR2 fails, release the already allocated PCI
> memory regions, remove the device from the global list, decrement
> the device count, and return -ENODEV.

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc3#n659


> This prevents potential null pointer dereferences and ensures proper
> cleanup on memory mapping failures.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc3#n145


=E2=80=A6
> +++ b/drivers/media/pci/saa7164/saa7164-core.c
> @@ -998,9 +998,21 @@ static int saa7164_dev_setup(struct saa7164_dev *de=
v)
>  	/* PCI/e allocations */
>  	dev->lmmio =3D ioremap(pci_resource_start(dev->pci, 0),
>  			     pci_resource_len(dev->pci, 0));
> +	if (!dev->lmmio) {
> +		dev_err(&dev->pci->dev,
> +				"failed to remap MMIO memory @ 0x%llx\n",
> +			(u64)pci_resource_start(dev->pci, 0));
> +		goto err_ioremap;
> +	}
> =20
>  	dev->lmmio2 =3D ioremap(pci_resource_start(dev->pci, 2),
>  			     pci_resource_len(dev->pci, 2));
=E2=80=A6

Would you like to avoid duplicate source code here?

=E2=80=A6
> @@ -1019,6 +1031,23 @@ static int saa7164_dev_setup(struct saa7164_dev *=
dev)
>  	saa7164_pci_quirks(dev);
> =20
>  	return 0;
=E2=80=A6
> +	/* Remove from device list and decrement count */
> +	mutex_lock(&devlist);
> +	list_del(&dev->devlist);
> +	mutex_unlock(&devlist);
> +	saa7164_devcount--;
=E2=80=A6

Will development interests grow to apply a call like =E2=80=9Cscoped_guard=
(mutex, &devlist)=E2=80=9D?
https://elixir.bootlin.com/linux/v7.0-rc3/source/include/linux/mutex.h#L25=
3

Regards,
Markus

