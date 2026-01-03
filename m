Return-Path: <linux-media+bounces-49859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED6CF01AF
	for <lists+linux-media@lfdr.de>; Sat, 03 Jan 2026 16:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9789D3000E99
	for <lists+linux-media@lfdr.de>; Sat,  3 Jan 2026 15:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CFC30E0F3;
	Sat,  3 Jan 2026 15:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="d9G6kPPL"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2366F1DC198;
	Sat,  3 Jan 2026 15:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767453789; cv=none; b=T01T01/JclRXalQdSZ4/KMuIVeWbWPZ8eQnZZimaGsdizFu00fYc9GO6OGdW/5F2728djbuPLKQH0uogFWOobXDUbW5bM43Nw9yG8df5ObRhmigSDiy5MBZlIqKI/6O78QXewb4aIBlEBzqcW4NBGugMpKhGZclbTu/gXYMkRT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767453789; c=relaxed/simple;
	bh=xUYiFAvHYPLI9eQmWC9BaMIkB/E/FNgl8vp3chCmgVY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qFiEsJdfbRfVFp2pHaAYl7vSixB+R6w8c8PDZ99cNJRmD453ia4gb4lttm5NsRyBrVhNnhPePFF7uA3PtxVXeDL/pVZ1a2tOh/B2SiQeeYYpKczk8A2lpvP2U0wsjxBzO2AjVAcYkj4wDysW6bOvVp1n2NBfuf0f1W7aVn9wReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=d9G6kPPL; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1767453763; x=1768058563; i=markus.elfring@web.de;
	bh=xUYiFAvHYPLI9eQmWC9BaMIkB/E/FNgl8vp3chCmgVY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=d9G6kPPL0L2MOevwNY9PZHbpi9Jd9kEf6C5PUCw1zFyY6sYTIvD87Ck8RJFxTHwo
	 xhwbKQaxAVZ/pwrhQp6qlEkRJymSJ2mpDI4PnMGEISeUEYFMr/lXdnK9kpiRSbg3L
	 tPYCc6GHsg1Bs/7FUFAZ6xMXyhb2/a0tU0VOJZNnmpAbBJVmSRTa2PXH4hciWyizC
	 gEOL/E01rls4eay2RGdzuId8LLhelcX/aWEgzVSH2DKPE4e9eF2KU1jpQob7LAelv
	 uXVTlA8MBjPIq3GyTy7eVD2Yyoqf9J8+4bobUO/K+zuGSkmSbC1jHJ+pv4g8fk/IU
	 zHpX9UDQD4Kzmtj8ZA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.243]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNwjS-1vDusU3P8S-00Z1II; Sat, 03
 Jan 2026 16:22:42 +0100
Message-ID: <6c6228d3-eb7c-4347-befd-f1de10e2ec2a@web.de>
Date: Sat, 3 Jan 2026 16:22:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260103074647.1941895-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH] media: cx25821: Fix a resource leak in
 cx25821_dev_setup()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260103074647.1941895-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ADk9qDs0Nb+4/L2q7cI3wMVFz1O0lQ1wS0ihUstwAKBBwjiaSR7
 Jmfp7fwdGKmdbwPMJF/BjnQNfX8feUkxodOUD7WEATZeCt77nhw63ih4Xv2CbhgNt/Me1SN
 oOPVaDZ87fAyLg8JTxP/kmJwixsS52cPWwYTJvFoasvvboW3QKXwtW99aX+7NSpNnPri5km
 mRQnkw10+otIPfpUlqxhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0c43RzyG6ng=;754FH4T4QwpYQ1MoA086BoohymH
 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
 WgNWb5ffwKfzoDfbdrDfGxbvRAwEsVo2Gbh0yt

> Add release_mem_region() if ioremap() fails to release the memory
> region obtained by cx25821_get_resources().

Do you try to synchronise resource release actions with information
from the implementation of the function =E2=80=9Ccx25821_dev_unregister=E2=
=80=9D?
https://elixir.bootlin.com/linux/v6.19-rc3/source/drivers/media/pci/cx2582=
1/cx25821-core.c#L939-L963

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc3#n145

Regards,
Markus

