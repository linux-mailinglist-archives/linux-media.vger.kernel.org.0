Return-Path: <linux-media+bounces-15027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995E931698
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 16:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D14A1C21B57
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 14:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6B918EA6D;
	Mon, 15 Jul 2024 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Vm8f0bNN"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A151E89C;
	Mon, 15 Jul 2024 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721053414; cv=none; b=BBMJFAaZjqIZqIRupBmOUlE8kIgHOdIA9mYmjvX0LZhnOfGXb4gtNaMTEqUtN8z8LpXDl/hujnSfKpzwl4aAzHLXjuTlx4SIamM9ncestUgnBT/wbAuTb3pu/3vMXAhAJA2R2g82n9cYUIaNGSuliPyvUEry85GzeGK52q0mCVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721053414; c=relaxed/simple;
	bh=8W/NbhbOtzlfo5nBCm9HhO+NCk0WKIFpF3ts5SLPFJY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=a6h7GE3QzLXptC01K4zNN386Xhpsa0FjaVhqG8O3vC6/4GAxHbGHQAjcUxgzeWGqlfEMqIAdHgqp7YWoBmQkiCckCEsZjHI0UJZYjQl3mYMS27EHYHp7+7Ac4YyYXI+TsVvEgetUIZcqupmDBkL8tArbO8CjufVWqyLTlVsb1jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Vm8f0bNN; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721053385; x=1721658185; i=markus.elfring@web.de;
	bh=8W/NbhbOtzlfo5nBCm9HhO+NCk0WKIFpF3ts5SLPFJY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Vm8f0bNNH/uH+JUYznMdwwmJaEDOPlHOKqUivQ42dHq53qqz+HWx0jqe1HGO8ow0
	 wKzsAcDHN89s2ya/1w9tddaqU+LQmyToFb4cxArMOwWvq0yxUfv6Set9i236MkC/s
	 vzf5WvMtto/hjUAKh9JG9nQ28AcPIm4RwDLEjhnVEuDcMfyvA92FNe81w4OLj9qOC
	 5wZF+BAU/amD/MNMqIA5nHDY9y+e/+CH33e6/YIvItDME2G90ARxr0xU+dk2t0Ll1
	 Zol9c0sow38k9skELR11H+Z37Mpw/iSvgZ3O8eG0E/DV3SOIt4iGlJUFex88lNlhP
	 gwZ1DypQxOvWQRDOWg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MActe-1seKy91ilU-00AZo0; Mon, 15
 Jul 2024 16:23:05 +0200
Message-ID: <3644b87d-d283-4539-aa61-263ca7a81249@web.de>
Date: Mon, 15 Jul 2024 16:23:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240712103000.16655-2-benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v3 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240712103000.16655-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QfwYEWLVQ6kZx6KTIuE8fzL7Zjn6qY++jXuW43skhT6HeJrL9pT
 HrzaG5PzYShFRTcgkVoKMz4coboztN8K/zsPnJodLKrNMxR0aMv3lLFlfKA0GI79RzLkFmm
 qk/yuYfEZkTdvGoGxkIdZrzfAvzf9HUaIYokswkbAc6bE/KK2HoPDUKyctn2CEsmL8LqALB
 YV7fkjhhFBCMzEPAwFKGA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SbuFEh6f8Ms=;vADHCL5fWBqHt+00OVZkSE0Y1nH
 4ivCoRthhuJGr0uvXsL3w8U6jVaXp6qZqBXa+P0djltwj2akn59hQ1IPIfLdatMvr6Dr85DJE
 z0FacJoMLEJjTlL1UsRgaTwAUbxruEUrx8RjPxDVgASmpI9+7H/SWp9u939j73OtGlaut3/2F
 hv5Z+X9ki0CdO4gsMbpQjmm4yvewbEvOCQ3bvCPYosajRe7fQvFhZYFB3fSNiY6FiT0cI7TVV
 lR7uYssDKb66j8pVpLg1tbjdRmr8uvLTYlejJDF1FUZavqyfbqmGJZLc/SIpp6w73NRc6gN+4
 10oSKv2PpE1K1AFWDjWK4eaWFKQZAQoezPk7O/Cm7szJlw/8XZ0B3kNbBA0oglJkHCFUUuocO
 thPHxQkVN5AazxvLgueaTehmeAy7PMdaOghsDTGOOsU13jjw4ohdeSrExlTpbxQml5P/qWbo4
 ouAPmDckx8fFuB624XgLHACoX2i6GH/ZY89d83dRlUm6JOo6V9DGr/YyWEYPthuoPPsZmoP0g
 M6tZBpjIzQSPOHHob2TcrHygdVewOInddL7b2OHuPNZni84bcUtFcgzUdkei1nbRhgcYTdsRu
 mTpZ2LvPCuU6fUqzne84dVp5Yj3i0XZwXjL8TepHWpt99NpicVC4+XsY3HODZg9f/OARuM0W7
 DtwCQNtA1YAGzvkOUPtc6AbnVfPsMXIPx7ETL6Y7WQRrS4iO+NE14wbCTEvhYuwg6f8VjLu52
 JYp1iZR4L2usRb6AHvlJanj76hoZvLC/cvFkNw6A4kxqv984wNmlnSTsOd8JA+IbIZateCDIU
 LFLREtSlSob4SjzJo8BeA0VA==

> Add new flags to enumerate all pixels formats when calling VIDIOC_ENUM_F=
MT ioctl.
=E2=80=A6

Will the word =E2=80=9Cunconditionally=E2=80=9D be more appropriate for th=
e next summary phrase?

Regards,
Markus

