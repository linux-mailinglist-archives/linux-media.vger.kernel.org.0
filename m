Return-Path: <linux-media+bounces-26581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BF5A3F4C8
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 14:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CC5A17C0C1
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 13:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB2920B218;
	Fri, 21 Feb 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="CHM9auL9"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6184A31;
	Fri, 21 Feb 2025 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740142928; cv=none; b=h+J2IidzslE1+LRdEp0UiAtqdu19AEWpIglonHW/ER0lY5sbLG0kmQYz6+J6pAJexKU2h/gEXVi5eXMdhzBRSDbNVYrBYIB7k7nwcMtvi/OMR1ykL40ADDQDo7UMivJfLRQeWAaNetCuhCnFRKAf3nQ2/dY3IzgEb5ncKzoPDi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740142928; c=relaxed/simple;
	bh=ZqTPC6SKPHwCsDGINweqJvHTyb3S2pYCu2pMOZrxkB0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=kI5liRMYl/PpMqyQ/E5L46+2X6CS8oJykETxxICKEfZtUXmWOJMB4J1Lun3I191bKvqAKUFuFaFAj/q1FpI/tab4QUH5BLiPhXxwDHsZxENyKvb5QsPD+SKWHr8RTo/DH4jbSUt2tW9oTFC9jQQku5wJEpo1YykKnSX2IDjkR0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=CHM9auL9; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740142904; x=1740747704; i=markus.elfring@web.de;
	bh=85ZqJ2WnsK+xsV2MUlzgduJL4PyG/D51U/cS63JS8II=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CHM9auL9al+K6GjKDD9yPsDUZ30bsleiNs194UHYjwOkZeppGJSTjbSyICdbk4mt
	 6n/bSgc7pdEy5DoaeW4v7hfmjVzrg5u621R/f5KbhckewRCI0Uy5LCXeNZuRQ3cDP
	 Z89fDER8yZCxRjiOe7yAOUYj4Ef1/RfvhBKvRx8HhfrrIvgtgyEDjjGThPFWLnAC1
	 2mVoassSLDqSFsZKVTUDVPs2pVf/ykStv3v1MqtdMbpxx2nhu0OXsdMH9g0eu+v7w
	 ifli+1r8PNErCOP26Kdm/72hlraPt+35NtYgZC3oDdqcX8e62NCufXmOlOs3kv4w+
	 1sVi4uOc6Y1cfdNyjQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.4]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjBVv-1t9MYH25ll-00hNJl; Fri, 21
 Feb 2025 14:01:44 +0100
Message-ID: <b8e127d4-0a8b-437f-a856-3f75d4680045@web.de>
Date: Fri, 21 Feb 2025 14:01:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
 <ribalda@chromium.org>, linux-media@vger.kernel.org, cocci@inria.fr,
 Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Marvin Lin <milkfafa@gmail.com>
References: <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
Subject: Re: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iFsHkTyzJQla9LP+6t/K5VjRFy7phUQNDh4Men40wXmfAgHQZAO
 BAFszW1jSronbk2zcvpuTTav61LBTyccqcQFDQORsyQlfDVVirQI5PnSCEtZeEWRd5xFMMA
 mzxy11KaOa6hDDfV4QWj6lsTIxYtHnDaIFW9MZPJdAb7XriUShYvkx6cMp/Qble1RJqD40N
 UebwF5jr4cGJTiemgi9rA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vKbg0xmAZbE=;scMx0Cag00azSe+gAuLGqt+F6My
 f/00eXJv0UI9rH73lTmQZneILMNCVkl7/NkGixj3YPhDGBeB5MY8B9ij1KLkhCquguXB6nGAc
 KcGmezzVSap5tgJEh2kX9aqgBH75GZiUA59Jdb1UyGT5yKR4l5beYWGQiSoEeUuv8ZXFXNDIL
 aKK70IRA0pT/+9QSlmSzNmTBBFxiuqo2CePRyvlXZkOD8iYCnAJqKUtnQ9LlBYcN3TYjskbdt
 vAAiJl+7UtZ3jP1bdJnBkDBv2WIkxZBToFo05HDYxph+/fTbN4H1U3N9P27cBJBbQnAPqK0gW
 M+98vYxx7RXU9bo+JgosWZnQnrv37ZmBHNVpU5jBAAZ6bk6F1kI9bOnOjBKfpzwt8vgJ+1yQl
 osewOTQTPjRQjP1qdWk0HUWnKLyW9/tOiWsjLr8SZKWDakBSNcxQoJz5fFGSpvXDioBhfDQIX
 E8vbolf8WZGzpikwNxz/2KYpm0PdjaLkWYdTFAYiJMcMrOKnb4/LByeo+q6wNmd1unu9n/YCe
 6VNRc7T1VAEQJnkOq9fXo7epCSJWpe9j6bbU1pUowIzF+2J3XaGalz+AbRIl9rp7bPtjjB/6l
 uRjAVfgNuog++8ggKI8K1A6+2xXc2vx2PKUwyz4KIE5PZG3+IHcwwhAwQdKdi8JSjKNuvTHQO
 WF9hPUQTn+VAIdEvaiSmCYsjWShmw8yzQJeCV3YFfngB7lnlwj5GwSQMtdb+UezcGEMfvxphr
 ZkjQTD2f9N5bb1F1Ai7s3H0XCeSQalyfDnAf3CXauvSZf5OMjJ5X6H6ETFr5dStqaYuVvB212
 PwdH7BncfsTDQTooM4/wUsM6gpBq7tlJKM+UyMfSjY/Xh0JvAQNV2jqaiT6Tk/PlyLnp4Z4ui
 9WdJKdkxYpTghKg49VLfV6m8IZnzKWC3TF9ISUZC18DRfH06NMfFPCQdLlMW1UVWZsu9DUgvQ
 Drp5XCzhDBuTNc0DPTk6A6rK480L3pTrrJLOZyzeCXUN0cdCLr/LsES+ufhqRQx2u6thi3Toj
 Uvb+EohhnHXsq7bDOiguOkO5sIcm0gT0XSaqA6SDuUicHbwh3Wfnnn03p9VObyxMFFsYsp/ZV
 T0nIKU/jYN5gl1bqM25Buub9sotUz5t7xOscdfrXxCKKlbBA12hRc05LrL+saI6s2X7cl1xTA
 PyA5oF5Ey6aYq020WnqrUMs6rB9oCOgeTyWfZdGSljlShgOGusweto9Tp7KOU4RThk5sd8CpQ
 07hlLszPG64p9z0uJ58M0ROyDEbKe7to//C9NnsKeq+TZVFjeZiWalqJlipFQvN1kuwvCIKcj
 tqfhjwDJ1YMyvjmJzWwOrR+d1ZUajQv+95kJFZ2prN5vHjHle4IgsXHJ+sllLOG0NIpr6lku3
 lIyWKIbnhcAI9fRkSgoHjEToUwhN0FRw4V/1aWpY8vfsWRNJldBudVbLnJxlt/FJ1ZurN68TG
 L70SlOZk01HcHTYGrHxxgLp6va1M=

=E2=80=A6
> > Found by cocci:
> > ./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; c=
all of_find_device_by_node on line 1667, but without a corresponding objec=
t release within this function.
=E2=80=A6
> This driver uses this construct:
>
>                 struct device *ece_dev __free(put_device) =3D &ece_pdev-=
>dev;
>
> to automatically call put_device. So this patch would 'put' the device t=
wice.
>
> Does cocci understand constructs like this? =E2=80=A6

Not yet directly (for coccicheck scripts).
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/scr=
ipts/coccinelle/free/put_device.cocci?h=3Dv6.14-rc3

I am unsure under which circumstances support can be added for the detecti=
on
of scope-based resource management also by the means of the semantic patch=
 language.

Regards,
Markus

