Return-Path: <linux-media+bounces-15525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D419409EA
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 09:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C65361F2477F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 07:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D08190682;
	Tue, 30 Jul 2024 07:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="HzYzVsWO"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03C15FD08;
	Tue, 30 Jul 2024 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722324394; cv=none; b=Pua2udEGJkoL/sZmSyrWZbgFkAieNtZxTcSny9HjXQU2U/sMFR6ogrP7tczBwQVLjOWirKikliGtdKDv9Yv8gGkEoYdhXwd6NrOw3Nb+tDmxXswWn4cLNLHfULZgbWGa4YDHj2G2j8UAvksmXTqmd7lKq44yRIXbP9j/S/ZBIXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722324394; c=relaxed/simple;
	bh=JPZZ3Rcof6JZ+WH+47Q0chcov6L97fX5CwYUguKChoc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=BbgEgGWB73ajSZA/usPTMJuURuVF9N49LngCXmdEXldP7vq3ToyfbKVD/JLZtPhwM/aVhqMfeeCeGacAw3ucOYfqnwmg/YrvB8imbBNkI7BSbw7cbGF1ElPLr4OShQl80RfSO+IzYyvkhqgyFOQv6BjWZorvjICcAuJ3eCK6w78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=HzYzVsWO; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722324362; x=1722929162; i=markus.elfring@web.de;
	bh=Y29Cu3aNgFt3lRUAJtHfjwbzXHmscrTrGrCYF6YO//0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HzYzVsWOtT7f+UfbZ+pTB4befjGK7iWGD5ZGbGSzJCLHS44J8K2pg75PXHbpUjRG
	 IgonXxtCzlYCeH0evgN5LlQcDh/mRWxibv/9Z4rZBc/zKmmLwtKHb/B6a9H0DcJK4
	 kBtWeF8glZY5Ms7yqr/VwLwFp6OwPaJyUIcmJWxT2qKYt5s+IIGUyFcuK4/HEJVpj
	 hORzFBmb+t+EU/P6CSVcQJGNMtaLJALejP/XetYS0g3CHIW7yvmEQ3i/jvX3QxdQ6
	 Ebbgi6B96uoYBUcCh2byMtjZ2d87WL7+fVQyj4vwOVXHelYaiUUZldqeZqzCSCo1d
	 BAcu4kNWV/ckDbbZdA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MODiN-1sspUp1WBt-00Nvj2; Tue, 30
 Jul 2024 09:26:02 +0200
Message-ID: <6bccc366-7b21-48a7-895e-d6693bac809d@web.de>
Date: Tue, 30 Jul 2024 09:25:45 +0200
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
References: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yvPCQKrKXBCoDamMmIKaF729ETlr5jjPPSiqGwUVUeJt8P75TyN
 OG2ePZ2Kh2QWizHR51/Ed8zsDlVH/pEgjI2BWaRW6cIfMDUb9rnmVRRSTRcKUm/r1netZki
 pu6CbiuPuV8xRamEqTnSEtedOGZnLV1QMIKgPZrAd88K6MAghc8529Idl12rXXoq+eNhouL
 9BnUD8mxibuK2JdcWQs9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F5C1DnPzew8=;YgqK+iYHl2KVBnza3FawQVr13aP
 QSQeEPgRTv8d/HiQoSSUkH33WdfeCKBP49vFLS898Ni1XGeVwBBghRndtgWXHvxj9N0OzgDVP
 WVq46FLsdoLi256Sg8rHNoKkt+fNWfzfPTZ7j/AZzVSEncowxGsNjb3dKtwI74RucYlZilK9i
 7e9tL1uhivn8AlWFNEh0V3fdN9BYyZfC3CM46Pg0GiGHgfVeuhSkP0Y2NnILYBU3vPc76ovf0
 btBlEV+wd3lTFJEFkreqim5MphVtaAYbiC2abHd5xFToi0kiQSN+1I8XPkkmiCOL6q7O/1m0E
 1CPab4Z3faLDw2C/3fdAVqiBaYyj8rg2RXzfAb4rhuSqheHs6k3t3cIB16Nu0ZoDozkMGi8WF
 /IU4iqLcataQEdv77yD/XEx7luhECCHCVwypHPxLHWV3a5KixBoFXReXaZWhh3Lj+i7YaXo3W
 o0T1aDT4TG6gN6nWLWUD8Ylihi/CaTvdIrXnUa8pBLn8bWZQR6d4sz4H6f+N0L9iU7d+rBla3
 Oj7vqqGRqJ3TaiindStvhV5hK1kfcbSUJOS8RPFGnZ0fyr8LETzm04qgWgg7d8DwYRZFM/thy
 Q1jYfTo5NhBbE7A7o59jmnwuujLQFAILRBbZTqV0YsmaNGVFvMjAri0NZa1VpbQ6A4O18rjWl
 W0yZdt45bR4RAfAQjYIUx/XSjrqiIh+QDGQHlVonAVbjNAXNtQ2lLxoLe0aCH9fP0aMe2UpsB
 DLoQUjsaQA0xNEIFY8txTozJkul/bcUaxZNK1TX728nnd1InHv6mca1poCK6NWYx5wdjvQdwI
 aIhgsEWVjl4w5ynfcb8gHsvg==

=E2=80=A6
> +++ b/drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c
> @@ -0,0 +1,413 @@
=E2=80=A6
> +static int mtk_camsv30_runtime_suspend(struct device *dev)
> +{
=E2=80=A6
> +	if (vb2_is_streaming(vbq)) {
> +		mutex_lock(&cam_dev->op_lock);
> +		v4l2_subdev_call(&cam_dev->subdev, video, s_stream, 0);
> +		mutex_unlock(&cam_dev->op_lock);
> +	}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&cam_dev->op_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10.2/source/include/linux/mutex.h#L196

Regards,
Markus

