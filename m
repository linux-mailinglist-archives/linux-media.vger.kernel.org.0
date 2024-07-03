Return-Path: <linux-media+bounces-14594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D85A9265A1
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 18:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12CF7B261AA
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 16:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AF21822F8;
	Wed,  3 Jul 2024 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="oZkpvrM8"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CFB181CE2;
	Wed,  3 Jul 2024 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720022922; cv=none; b=cBAtLIz+OL1ki+Kl58dEOc34qX6YiLGxYEfyieLECbhFSPZV6sgcL4xgXTSskd+nQFuKG8Ho49JpZx/HfcCAo4wt3kgnumRC1q8j+XIRK07b/6L2V5e7W8iEkpqFlVGJFG3sq9ansg5kPLzLS1stTWEj1lvJZUri8b+KHUq9d74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720022922; c=relaxed/simple;
	bh=07orgEznonTXaOIHNFt/N1sf+pDGLONgsVdR7FpN9vU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=uKhXC8FfukMWuW8b7dxSmcxFAf4MA5loltOBGBdjcbl+0XTtM8chgs9AMTC7Fbhm6DIrRndOm4vP04CxigB/2CxDeWOpS6uYFVNQ9dy7knZZNqx/F7p91WN16qkyaRBKtNQPOufXDXKGPtYkw1mS2io/fci9M8EbbF+7fGNOq9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=oZkpvrM8; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720022896; x=1720627696; i=markus.elfring@web.de;
	bh=07orgEznonTXaOIHNFt/N1sf+pDGLONgsVdR7FpN9vU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oZkpvrM8xwVQ7XI5woMiqdzY/u2dKaIegJszLY91DeWPg66nsqdG/FtgjPyR9odg
	 reD1lLMgQ331UVEr6+NREDbVnvWHpMWBjstONtypiCrGbXPAB90QcO6jpXRHSl1Gn
	 kUG5shMRwd5QcK+t7J6mDZex62t+VV1oKdqrhERhu3Z9VeKLqyGJQ6fttVsM/nxCB
	 caoxJhveaVOKu+PLSpI99yyQVXL9GrTDryBi14nf90O844EMV/FFyFVDYmw2AoHKm
	 5NabEYQ8lhDskGZkVTc02qmRptzL4ibT21nMIlp8hrC98jBA8M35Ix0kqn0IW/k8U
	 1i98Q6N63rvvyXUFnw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLAVc-1sh7LO2ee2-00TfqF; Wed, 03
 Jul 2024 18:08:16 +0200
Message-ID: <170879dc-88de-4c08-93d7-57756daca4c6@web.de>
Date: Wed, 3 Jul 2024 18:08:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Junlin Li <make24@iscas.ac.cn>, linux-media@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Peter Rosin <peda@axentia.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240702132413.4318-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drivers: media: dvb-frontends/rtl2832: fix an
 out-of-bounds write error
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240702132413.4318-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VhPOAXdGj5dgCOol1vZtrpOQqZEObNHjQFtD5lJZmM8jnW4FXzA
 enGASuwiIRqSoGaG9yCDX8XozDPVzVZCMpMaLzn9kuRbnuyjeEqPnOYmH5RVuQr/Y7XEbru
 z2WzAEwrC/pLIA+oivPIQyKHKHsayImzFsvwHuIOirQyX7pnmL5oOnJFg/5o31AWkCyI1A+
 YBh5hb4ga8GZoPX9QjM/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DBJ8xYYnUw8=;PJRQ3jGGArGOK9kR+6p9MKH3hcB
 MEYm3WMIve8yDCOsueqwU3FelYdtBYf3vZ/DUNmMuLbk8Ba5Hgtn01TAEIoeYxs6lnoTgKJrQ
 taUFYdlD22dYWuj6zw2rhGPWYWisIx5bS2jR5UQBvF7EhNlaANVtNlmkeqb2pJqWYPnV6R+I3
 vN3TM45Z+NSSuqDZ+9AxFocH5yN8lwVh3T6D6IRMNBwcuDuURd+6NDKOchJguD7FOMN72QeSC
 gdv+wFRcVK5NO0eDpu9Eiq35thwTsiwuojWfBoSFVlbHO+NtlaSODLwxCST9B8dFdkGC2I8Vk
 lxEQUoLtX+mQiZygzaQ0gBixLB24jC2MX2uEDwWG0Y9tQ0Fq1n+wJxVzIUVU6UFKVCo+icLaI
 FWYQ2TSOWuWP3eoJ+t5OMMbSQ3kZ88TYitK1yuYT8wnYCONf5c5q2kKM/yR+nIYNfO9Rbv9WQ
 nFYWI+K23BG+c+Pca7TcuXBY7HIM7+Tkpt7bknCivd8NKzyZS4tKAYT5Q4Bso5X2dC5nUDq6D
 CSHndcKpyi1agchmx053CtE1V+hAFgoMXApJdr1iqWEsqzrqWWIT7CAEct3RvZNLcvWobHKfi
 HpCwGtjK+j9KwFhdSvnuZH5BLFkPG3DyDQ+FoaavMJFDQSwkwY+rSZmAd5AlYOQPvKll1umPR
 p8UoTxAfb1cVNbq2nCF6spyMXFLUtRaDXDrN74vT2+WNk56JYCn4a5GMrCFVXsIU1AzNQcZSe
 E2lDPy9SGp6uGEhoZ98/GsOrwCC1F66jmNYe6tbhnaj/Y00/pOwQV+PESPGlZhGNgrgXuIPUf
 1LOX3X6pCwDbHVfJT1Bu7GBbAQ/Y5GeJ8Wi0lrpWxTnqQ=

> Ensure index in rtl2830_pid_filter

Please correct such information according to the shown function name =E2=
=80=9Crtl2832_pid_filter=E2=80=9D
in the proposed diff fragment.


> does not exceed 31 to prevent out-of-bounds access.
=E2=80=A6

Please adjust the word wrapping.
You may occasionally put more than 51 characters into text lines
of such a change description.


=E2=80=A6
> Signed-off-by: Junlin Li <make24@iscas.ac.cn>

Under which circumstances will applications of the Developer's Certificate=
 of Origin
be reconsidered any more (after three different names were presented so fa=
r)?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc6#n398


Would you like to omit the text =E2=80=9Cdrivers: =E2=80=9D from the subsy=
stem specification?

Regards,
Markus

