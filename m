Return-Path: <linux-media+bounces-15576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 215ED941479
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 16:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEFD71F23DBF
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 14:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6281A2569;
	Tue, 30 Jul 2024 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="kewX3bjr"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A91C18FC75;
	Tue, 30 Jul 2024 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350117; cv=none; b=rj5+yuBW4a1e1KKGDcE7vQRkZR5Id/3hWazFcQ6D7ljs7zai40YHq8bqFoOiSajHquCkb+zjnZcVqohsHxkcAePj6JgdJbyMgFZVbQ1MB3ZSg1HhXminFwJ1ZaDM4ONc/vRjuhWSaFW2Te1hl9LnaqBHJDkq53ekbVTS/+49nEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350117; c=relaxed/simple;
	bh=JhY1Y3ip6eClPY+P/MEpnktsK/w4JKZqqsx2mtxqIW0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=PmZvSqtLqeiTru4+ShNs/9oUltVqdOxuOdpAM1+dTRFGWJvuhBzHh/XQA7qTI6VWUlJO72/7fVqFRPbpsux09HUwG/N7oLsUSOzmy3s4iWOee+jze9ms9J+LFEhgWLdLkF0izVL18c5lEhSM1don2C2BHtCwMbZJFqfHazuq3tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=kewX3bjr; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722350086; x=1722954886; i=markus.elfring@web.de;
	bh=erEqLbR3UVJtu/sTLZpah7HRshWQQmK1WXT0v24AMf4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kewX3bjrpOFxrz5++x+RjIH9lwU7yHgteiCr8NNG2iKcHwA9Rv5K2oo5Fq05Jccy
	 u1OLivaeaOh9tT2ZbZQcI79egbLEMagrvEiC/vE/6bA59FtYCkpWaEpkll4auyWyp
	 4FjNxl0MBA4p022WNCtvkTh5oSP1kQYHfxJDMvQlwNt8K2YK7Z3PaqGOJMVhxpABw
	 cjYj9+fGG1yEhQey4FE39jbE3i8zbdDAAknttS3G9RnOfltNl8III1BnWzy1xh5da
	 E0qzCViMmnn4HC8CR81oFCuFh6CeQH+0PilPIxuv0zFk2XWj0G2ybtJrAjyFKMdBn
	 M6+4PWuWtVBFueDYiw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCXVX-1sQnKQ40kV-00Dp1b; Tue, 30
 Jul 2024 16:34:46 +0200
Message-ID: <0962976e-18c7-478a-a829-8e1cc6cfa60f@web.de>
Date: Tue, 30 Jul 2024 16:34:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Sylvestre <fsylvestre@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Phi-bang Nguyen <pnguyen@baylibre.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dpx+dzgS4rW78tkaB9aMkyTJNBcagz1rU5j0sT7u24JC04ElGVN
 zVuwH6ocADUqXpNuiUpRdXTBwSFv0BunGwPCPU+qhOPOdNggiNIkW+1jXBweJH1M+nILp+u
 BOGlM7fY1gLbspxNIl03lpu718r6ieuO2NglvMvVhZCfyWIw5Wut3bBUsYzmFH+uYXyB3hC
 yQNxVRLz2nZo0KArbKkhw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hxC21qntc+E=;/GbKhZlfiRbRlhYCom9CM8c+8jX
 L61vx2JfQJyc4ETmCdHawr735TIgG7j+TCFemXle819vYxBZWAmZeoC6UZ7+VnZ++YoZrjtBc
 u/z//q++eqRjbeHWGMJ4lqPgqUQosEBirpoKD9P441Cvbr1lr3okdH82vAz18hGpo7eg9NRqF
 6D2ddFlf91S3XiBpLicTq9Jg5wG9bQ4Hx8AxdnBr0Y1LXsJkzaeNU4tt4ZILU5vjd7DV+4C0C
 9AY6J+qd8QYbBKN43rokJNKk95+9WyoiS5MK2T2tvyKaUpKpztguEISxvfwf37y69gC2wELs5
 XvJHPvpZbORH6I2c1KvNJO0LKmCP/2BsewCnr2lhFivQ09Mz+GmFR/W9fNfjpj6FDLm1lzE1p
 lyJPzl80vsVt3+ldiy0Glfrba1T/8rrG+18t6dauBEQaNK9Oi6b8KididULkV03Ut4mDirbAU
 i3U2aaQUoN5777C4RqvcmsgLRFtWlEIq5oMpoeru7QuB8oRAmUFfds6ALETihsg25zvs7Zqwb
 UhaUzHK8StxaeCwOq1nYLXY+W36nKpbjpjxoXp0eRgbQv9RZwIcmgfkhNjJsV7/qZyahzAzjV
 15SVxcoEJ9c0hZtDjPbrVnoClCH9nJkPEfDcXb76nqlXWbBA9vtValOe0rWpChBwjZwOs0sSq
 t+sYC1Ni7+Wa2fowBOffupFc8c8gu4vmyJeM5h3mC3QTB8363fcbz53aI0ui4p4xuadEWIeOb
 j8FVFgipPSfqyMtHGFiEZfKdL7rvefZDl3ZOw2GU4nbOwtBnOlGun6ZenExbafJqjWhT4MZtr
 5HK3PiHpXM5CSEh0i2p6/T/g==

> From: Phi-bang Nguyen <pnguyen@baylibre.com>
>
> This driver provides a path to bypass the SoC ISP so that image data
> coming from the SENINF can go directly into memory without any image
> processing. This allows the use of an external ISP.
>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
=E2=80=A6

How does information from such a change description fit to details
from an other notification?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.11-rc1#n396

=E2=80=A6
The following address failed:

    pnguyen@baylibre.com:
        SMTP error from remote server for RCPT TO command, host: aspmx.l.g=
oogle.com (74.125.133.27) reason: 550-5.1.1 The email account that you tri=
ed to reach does not exist.
=E2=80=A6


Regards,
Markus

