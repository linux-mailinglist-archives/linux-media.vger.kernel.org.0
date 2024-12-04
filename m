Return-Path: <linux-media+bounces-22634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB079E3F2E
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 17:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D62E285678
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 16:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA20720E337;
	Wed,  4 Dec 2024 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="rOi6oDIn"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11BE20C489;
	Wed,  4 Dec 2024 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733328081; cv=none; b=Yu7qHo2kt6tFgpzqLiPIqRAukCJFKRwQbYpSpypBN1ID71nRs/ULw8Agg5uaKk7bIypUcrX5d6WPs8/9H873xEU6vNkvUZHta4ASg407TbzkAEkxaeI3MQbgqDoUAo4R6LD/Z84f6BYHsWC8og4FX+LSoj7JQeNYjXR1dJUv09o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733328081; c=relaxed/simple;
	bh=NjUQ+/Is9qo/eHUI7YN4HM9wBFM/VIIEN9EEYricbd0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=a4TZRD+83AcnWzI3zAVjolLtKabIKVOj6/tVIb2INezk/isWlr+1DboVEWjudaqs37qO4vPK/IRcqGoOvi/PzlFs8fbzicusLzjBLpTKm4+/8xAljYLC9xbuUAdTgnvY3WB4I9QY/qzeVUlPl4NSjuBHSTfeED+SQBgAAtv5NfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=rOi6oDIn; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1733328048; x=1733932848; i=markus.elfring@web.de;
	bh=M39RYs7uVwvs7U/6UTJpSDJR19rNiyp8x6wxPXRhcxo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rOi6oDInlrM96rSzmWtoWlpDC7Fe7YEQd1Nbcdu3pkc4s0QAbKrC/5n5NYzHzTKt
	 zot4IMpgvA9bFYwsKBTmtjMJF0FnE8nEJUVtRzNrONXStNKclpKavC3VftjUBNav7
	 Tl9l2uPts/sAoTpQWhf/PYXa8yOnU17MCw4zaaKU/NoaEWdMjiXdaJ6WV5Mm/DLy/
	 bXqIy7Du5G9yoRNbsRN7qyZk9QFqzJ7a+EHaHHE0Pa4v8XY3iFt8tbT9qVzQenrsL
	 s6whE27NNZx5i2ezuOJcJRAmMUi4vaTzWH6s8N4saEvHSor3wWe259TeIt+TsarrG
	 rNuLi81ok4aHC6swvg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mr7eu-1tyCIA0VgE-00lc0u; Wed, 04
 Dec 2024 17:00:48 +0100
Message-ID: <b63dc903-ce33-4201-8fdb-a99da8f188ed@web.de>
Date: Wed, 4 Dec 2024 17:00:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc: LKML <linux-kernel@vger.kernel.org>, Allen Pais <allen.lkml@gmail.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20241203212902.38116-1-jiashengjiangcool@gmail.com>
Subject: Re: [PATCH v2] media: marvell: Add check for clk_enable()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241203212902.38116-1-jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:4M890Sw6neXm6KaMiuFrB9T7Y2sjsQW/Eg40uN7DyFw1fg4aQ0k
 KqJz0vcBOlqAzQ53oqV1pvkWAKuammJUJfQ+5RHFTP2vsYdFDU/kAIpzvKARv0u1uH7um3a
 tWGNoSV9ojhyq8TFPf3sPihyRz4W3Ogx86+++Afbl9oqbscHUVmpAEST+6Neau04mWW0+nl
 kKJbhunAjvV12VJoZ3HGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Khu/TTnhegs=;S/Vsbqg+wscYg4qUNyJHId38Kub
 59vaeRRaKR5icufE3H1qFH5HXg4Cfomed+6cLh999kNfG87NaZNKQDQneFv3E9/XHV+2xTFaD
 iUEZ7HYDgfCg788SPhaq7MLlWtSRcEruLh4zr1ByhmC5k0NrHd+DVq/qp+t/FDGr+hAXAvltA
 OFrX8RaEhZeVoRLoiNyPTZ0EO4na7OYcvlZ+4lgeuw2FcNDZzRABeRSU2rOPvNAu71Njy6gly
 RMSHh5n6zeUENwPnTU0rMNzCc8SzMmntGzu2q2q/wVR4dJAK7bLc82xO61txCzAYHq1nfo0Wv
 PaelnA/O78y8wmCLcyn1DXIT1JJkuWpISg19AJfRloRi7Uj2p8kauzp/ag+ZkMoMtmRgvx/Ah
 vUnCs2iFtxSQDonKXTKS4G8v68GYA6ihhnEOMtZYqN9pMi7eFQtkfwVdAMCTyWOss/pBG9v7i
 8l0LMWD4pW0qXNmgihfgFDaOnhuiDYnP1XMRyCPC9ddMQwrvRmTIEymCIbzZBHA9GfXLWrH85
 ae+qUJrbsofKajlLPn6eNqszIcD623m1I4TuoR0Iol3F6XBwNPV9uiWBbzQAc9BFucthQ4242
 hz33qDRUIj6uairKWmo38onpehzGJtnFFZ/hEJUvwQD+ZTqTzBQnkPN7DQrEwQOx1ZnqKyP89
 F80DXiz4EyObyLJyp3IJYy0HfPOOwiOjG3T+fOF1Pk/DtuvB3ZaJ7AGxjSEpCaHHFonCsqo3V
 Cdi5d1v/37GSNnWpLKMcooNE/OCCsjOS1nuVNRwW4SViXoATlzlhSrUJAEKGoDPIOt5J4Nhjb
 hj7opwezpmd4LIhmn8aqif/EDwW90nhoTfENIrdvK26YozZwmP1hDjysXGtVEVGWgiDqEswGq
 QnPKgALfz0inT+ccKOxT8syO0lHYIWFt57T9jP3/Jh8y8f+TYUX3fysKTh5RsAPGD8kCTYixO
 KYqG4QDkFUygDDzQcqUU2ZX161KoP+UTzSeEid18UcNQi3D4WDk96GvYUrkQP7OnW0+i5LVna
 zjdJXGyYFgxJTkIkZTTnOJK0pbTh+/npBy/sDeaD+wDoGU4Cs/eycOCrDMJdjBGRSBVyfLVbf
 Imazx8/nQ=

> Add check for the return value of clk_enable() to gurantee the success.

                                                    guarantee?

Would you like to detect a failed function call?

Regards,
Markus

