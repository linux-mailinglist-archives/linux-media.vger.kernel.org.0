Return-Path: <linux-media+bounces-45226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE7BFB935
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 13:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92AEA1A05129
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 11:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6CF32D43A;
	Wed, 22 Oct 2025 11:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Ty/h6UXx"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D2332B998;
	Wed, 22 Oct 2025 11:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131688; cv=none; b=Mw3x7BbPv9F/oFWwZFPZNikXE4I3kA7c36FgB3xu4s741pw3x6ZX/n13zMdzIDxVMYXEvMxPqAnPxg3Vb4G0Sl1cA7Ol+gJJ+UI5s2aVUuRhIPoH+bbzomxz4BPJ3oPuot/dubKO9yU/KQYO/v23fX15fgPioY2EENh5zNq6llI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131688; c=relaxed/simple;
	bh=IM3W/fh44QhiB0pEgCFONnZL4oP+MS3gfjZvM32fqss=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=QeFmEkfelhLE5pa8Z15NmF+robpAkSIr9JUR0MyEeP9Y0goGkbGgtzTjiihj1JOjLkj6T27TvcU41vF8FqkSwjYVgpzw3PoQ+1jcqySO4meB0pGlm6E0STgcaG3ttmEfbltFXkh8iRNmrt3F6CuhLLBcdnRcMJP6dTIwkRCXhlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Ty/h6UXx; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761131666; x=1761736466; i=markus.elfring@web.de;
	bh=WQh/q03bUDYSmRb3ARH65jyFk5aRNd38x4A59pLe7SY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ty/h6UXxBOv2WhlV4k7jjpUgB6DozGeva5jrtpBweDQoEI/CWXOm8FloDna1yvSQ
	 ErQJ1RMiJYiL5a2yFty58azyCyMcKCkO3rRZ6cpr8Un3eU1PHLJHQMZ2OyhYAvLX6
	 04uaTk39cIA9eNuODJGnv0SmyheBOw3bcV/Lbxisl+XNy/0fwB1EAI2HlI96ioEKe
	 HJMkypIFb0eqpKFg0OIG54FPJxPYk7qolxPabQoL75HL8FTNYeVz1/exJap7ygj4W
	 t0bghgoej9U/v59pT1JeUpvoYeEhyRFQlMfR7CheDKJHwCh0vi4Eo8Gi9w87RAk1m
	 YAkKduyBWFBm/6KAjg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.250]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWi5s-1ueXU21um0-00XJna; Wed, 22
 Oct 2025 13:14:26 +0200
Message-ID: <d1461717-1a58-46f7-b8fd-a185aaf90828@web.de>
Date: Wed, 22 Oct 2025 13:14:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20251022043108.7197-1-biancaa2210329@ssn.edu.in>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2=5D_Signed-off-by=3A_Biancaa_Ramesh_?=
 =?UTF-8?B?4oCm?=
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251022043108.7197-1-biancaa2210329@ssn.edu.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0OaA8HjrVXcqa3gae9XV0pfDlRR6IVm+fJ7MEAd9rA8juELnufq
 AsPkoJi+l9YuG8Tpen6TuXZaSNZqwhoP2Qo9aUnYcpAZTnigtlPblrfFopCgAueVZwoOQbF
 HsmEbHm2j8azgyjY8vIHx4JrNeJNloubBfI2rgok8f/1AhxqtyEnzAIq6stuVf2CEP0Cmxf
 ky6HIjwRyYDp5oNqJfZcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zijLEPWv5H4=;AHj7xADi6QHCzgwi/VgWFAOVKNj
 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

> dma-buf: improve dma_buf_show_fdinfo output
=E2=80=A6
> This patch also fixes incorrect =E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n94


> Closes: https://lore.kernel.org/oe-kbuild-all/202510220802.svbgdYsJ-lkp@=
intel.com/

Not yet.

Please use a more appropriate patch subject for the proposed adjustment
of the function =E2=80=9Cdma_buf_show_fdinfo=E2=80=9D.
https://elixir.bootlin.com/linux/v6.18-rc2/source/drivers/dma-buf/dma-buf.=
c#L570-L582
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n396


> ---
>  drivers/dma-buf/dma-buf.c | 26 ++++++++++++--------------
=E2=80=A6

Some contributors would appreciate patch version descriptions.
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n310


=E2=80=A6
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -571,24 +571,22 @@ static long dma_buf_ioctl(struct file *file,
>  	}
>  }
> =20
> -static void dma_buf_show_fdinfo(struct seq_file *s, struct file *f)
> +static void dma_buf_show_fdinfo(struct seq_file *s, struct file *file)
>  {
=E2=80=A6
=E2=80=A6
> -    seq_printf(s, "flags:\t%lu\n", f->f_flags);
> -    seq_printf(s, "size:\t%llu\n", dmabuf->size);

* Why does such a diff representation contain space characters instead of =
tab characters?

* Did you refer to a source code variant before the commit bcc071110aeacd2=
8a87525a2442dd96eab145a3c
  ("dma-buf: add show_fdinfo handler") from 2019-06-14?


=E2=80=A6
> --=20
> ::DISCLAIMER::
=E2=80=A6
> The=20
> contents of this e-mail and any attachment(s) are confidential and
=E2=80=A6

Please avoid such unwanted information for communication by the means of p=
ublic mailing lists.
https://subspace.kernel.org/etiquette.html#do-not-include-confidentiality-=
disclaimers

Regards,
Markus

