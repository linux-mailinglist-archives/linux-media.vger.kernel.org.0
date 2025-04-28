Return-Path: <linux-media+bounces-31213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EE5A9F31D
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 16:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 071A33A962C
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 14:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9412726C3AB;
	Mon, 28 Apr 2025 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="t5QLb/BK"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDB9253B4A;
	Mon, 28 Apr 2025 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849162; cv=none; b=suclCUkPBHNbTuUgc7f8wvt+J40PKMepfX1wxQSIy9TQrL85/5d2fGj/oPCbwC3c8EGUDYvKwju5BVBqynGrHEzeJPaNNmgu8OzAzRSXfgCOZRuc/0pIruUsYjZRRicFP00UfyfQGZn0MbDvjp1eJiC9WjmN1l/4KNOWZcQNVCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849162; c=relaxed/simple;
	bh=GcZ5l/5No+4dlZYfyrowQPX1iKb3jUt7DVvz7HcxyGM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qj3ZohfSTCbO81nQ1JFdnCi8FYzyB1TA2fIDYmAVOWjoMY7MwoLl+qhXqcIfrb7YCbc1L5RigbD1CuRrnLIh585hVo0xrHEZwVQR9QG6o63DyMUSN4Z0sgTQ8zQtSkdd6yrSp6b/slOHah4ZQMjLA71CnEP3PSuzqIpRRZU4fLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=t5QLb/BK; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745849124; x=1746453924; i=markus.elfring@web.de;
	bh=Rnvsrs/RnUfAdIFURUw+pSZpIvXzBwDBppysxb89Nz8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=t5QLb/BKuzh6YSLCKkNGOz0i5eSxRDo1zMIsSD5cUqqAoqe0CrLI4t7vkNZE/crW
	 ahvDtJE1sYWyxf6KYIgFZjEaLOlxlUXQvsDonQRMSilL+nvQ8dSscYc9MAZO1aODg
	 gC4S21hrByDCCrpPMeJA98dZyRoGy+5HDqXA+tbdgyvfBrKlofQOimhjCoiLNeaMB
	 iNoUjdJ6QNuokkTaoM4P2l6+FfcgNvuHtQ+R0Oc2zSTpXTC3b7f3brp+jxyNHJmyC
	 WrZpFYNCeBH7GaS7VctKYHCTUX9wZdLZvAYxH1eTMwlmMOeVNw/XdBRkx/gbtZKzp
	 jA5BswtUlU9xsohUTw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.68]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MmQcl-1ur1S11M9Z-00pd9Q; Mon, 28
 Apr 2025 16:05:24 +0200
Message-ID: <07f95756-8ba3-4cad-b97a-cf69866e0c2e@web.de>
Date: Mon, 28 Apr 2025 16:05:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Val Packett <val@packett.cool>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
References: <20250306-v6-8-topic-rk3568-vicap-v5-5-f02152534f3c@wolfvision.net>
Subject: Re: [PATCH v5 05/11] media: rockchip: add a driver for the rockchip
 camera interface
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-5-f02152534f3c@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0JXlIylFyGR2e+S5ZPdkWqY5NoftdtiKqkjdk+sF/38iaLsBaia
 mybUMF+Jo2kRjb9rNvSl/JbQD73LNLjA1wTLr29EfAXExtrgkOArJL87AqHFeCQjv0dpm4L
 lfex3Tmn0u7uT452l9FOCnGgm7P5bjYHUb+AZS2d/0MQtrHTpwuBoziQXhziR//zW099QBv
 4dAX/qJsHm7/t9sXnkMrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ptwO+GMJirc=;jIKzgwI1RijYUHZ29yER4P3Rvg+
 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

=E2=80=A6
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -0,0 +1,622 @@
=E2=80=A6
> +static void rkcif_stream_push_buffer(struct rkcif_stream *stream,
> +				     struct rkcif_buffer *buffer)
> +{
> +	unsigned long lock_flags;
> +
> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);
> +	list_add_tail(&buffer->queue, &stream->driver_queue);
> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
> +}
=E2=80=A6

Will development interests grow to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&stream->driver_queue_lock);=E2=80=
=9D?
https://elixir.bootlin.com/linux/v6.15-rc3/source/include/linux/spinlock.h=
#L571-L573

Regards,
Markus

