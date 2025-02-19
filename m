Return-Path: <linux-media+bounces-26366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540BA3BF49
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1097E18811CA
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 12:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC811E98F4;
	Wed, 19 Feb 2025 12:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Ojhv1gYn"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC8B1E105E;
	Wed, 19 Feb 2025 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739969698; cv=none; b=H1jt/O9oEbdYqrZLw5o5wFehZBgk/mFJMjd3eMAZTE6CULRmtNdFRp1iTSkP9VHnhIuzZ5sQ+A3LhT8jOEs23/ZN0vYAjIEY/kK1kcMoHWWGh7QkU6vS21qx59T2K0DucPu9VWj0EtKUf+ianccKIZ68LarhQG1QYRKh7+WVvN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739969698; c=relaxed/simple;
	bh=Q/nXdxHGvbQWNEHz1kYW91/CQ5zP3gVSY2KAUBZiO50=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ub1IVltrktRrcLOZJxM+kYWjUOpMYjc2TluH4XQwTzsZXF4HZyssMYfSD+qXcW+Kqgl+GYG4Z5Aj1GmQJ1Mjy+XozO4MbDkRNOsd0Gc7VULlYs2ohJIFA1dctcFdoCusio2W6nfXno3bKtqD8LEtlKgbF4dmsy+tlFm5gKlvCHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Ojhv1gYn; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739969668; x=1740574468; i=markus.elfring@web.de;
	bh=NX2wgBTb57YNhQ0Dx2z58i0VYdMln4e5I4vq7Id/u/8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ojhv1gYnRx2oJvMCOW/7S5ogYi96h1eNZmBVjkDZE6HIgfn2bII237fhxN/7KZsD
	 TbJx6YTDA0wj+xQ01ee78LN1sBK+MH13PGLGB/C2RrJh/biFIvTeFPRkrML/4qQfw
	 13mbxKPnYqG1ZEAAxz45Af1J+rnwzpyRElAJ5GGPXFlyUjrngYViYaCA2uzkrzaBe
	 u7F1I8C/D0N2pLh3o5zqFrKhTyf1zdui4pGYEY//aVIcyQyfTzj7y/RylJsBhEhm5
	 OY6nKHp6dqx0f94VeuS+NaVOSVPC1/zKK2qHQQ4yS5cIyEasMyvXo9g9vArg3PRx8
	 yEDdFZZg0UFaQfEtOg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.10]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MZjEJ-1toFzn27IF-00OMPN; Wed, 19
 Feb 2025 13:54:28 +0100
Message-ID: <218b109e-a05f-42f2-b0bf-1b15d1a28b50@web.de>
Date: Wed, 19 Feb 2025 13:54:22 +0100
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
References: <20250219-v6-8-topic-rk3568-vicap-v4-5-e906600ae3b0@wolfvision.net>
Subject: Re: [PATCH v4 05/11] media: rockchip: add a driver for the rockchip
 camera interface
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-5-e906600ae3b0@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QIH6bMsC4SL6tM5FXvxmKgSOSHYCPU+Qy2oNfHkFEGuXlyilvv/
 IFsq49vVgAZ/Pz+LhRUXX39v0QsqT4VJ0lzMuThOjmq2AA6jbH631PmDEgT1rfrLNEJUcyz
 fVzOl/gOx3F9fxs0UJNOZNUdE4T49CZVR/EQoWROi04wkD8GyzY3YidoSpCPlyoa8a/6rNh
 ZlaRJ7Sc+nD/ATpgRsMUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:irdIEICfqUI=;IsbIQ2vMNaB35dqJ5SZn3/+Sp3+
 mXwNV2aM8hxp6dDAjuGUyS+Y0n0nQfiuRYj7EjV5dbJJPQ1qgTA/aoOsbdgHzr4anJUz1urak
 1Fy4Ld/li3SbQBe+1bTlAnjy45NtgK6c32v9JDO15iuqxJH/8sBokEUieuUTpvpqmTWGqHrGK
 LMhCNWRZ4fMI4B/hcCNE9611FTaENHqw0wZt2QxPmiIHc0dEw42A3IGY9A/eEP35n2QyTML9P
 TPMoN+DzXd5uFBST/7zzYvoG74g0tgseOgdVpdCoLMpSOyD0mw2kLzIM59mPaj/FA2tRif03b
 4jeH+E2Ox5p7mJ6ZPxVdBGY8QrqoJH+/TjcT3OgP+JtNSeHzc9rlnjJ6I2svyQhCJ3CfJjsYb
 VnKSQs3Sfa8gJUEkrlcJ/ZIiPEX7UCvqDWO2xJmwBeAZbpzZ4CsKXlG6nuhNUK2Q7YTODUogH
 RSaVLVg3S3X4dY5dV4s73smx3kDb92+vxtH1rJaUkchMdy+XiRpJaeKk1/smFaHtEdou/4iov
 Ouv0TiV2K51V5KrGuB6kBsUw9cnqsSZQ2HnMvYJ57Q99QYx62BjMGj0hHh8m+87+QfP1p2EFK
 Vo7oh4O1UO7pD/IRenTP0pWWqG+mIMSNe78luOBp5MW7CPBqharvXE4pfuNjCRS+rDoHsrfSy
 m4OGd8g9l9eSJDAr7q/tunzX5ksrBN2N0ao4evDDKf4MopkrUavi3wrJEfL5Kd0vwp8NDtHze
 gmbelQPmuIwtKsHfIQwa3tsLfhZPN9w+leySKkJr541BKuGe77AL5SHeqMrix/GoWZPA25pgX
 aBAtiVUz0l67QHVN3xoTZWA53me/9XxuLwA3uyO0q8lRXKn3kHfFqWQFRXNNDOJqmE12CvkuW
 alJmeRxP6SumTbWDk0NE2AnNTMCRBVeVRF/rUVbT7tL05ILNmU7T/0Uu8xTDW546L2dl/JxT9
 DFMOejqdbzQIeTDxXRePaLbcU/K8nrZLFPlyd/7SFu7ea/RrO4OXChCQS9jQZn/JN+irxc1fY
 gMboO6kG+hEvwl8jERbxhjBsSAEyow55ijMMdRhw95xogj6GOXRzrJnaTsm2Dztd7PVGSyigj
 wc0NLwrTQBoyyi7649VfhzDAXWIpM3twStyRwnpnGuBT2fq+fDjqVYZjygyKf7XZXtf6r/9cB
 BIS5BDKPY6DZ936Q7thnh//IRKWVRex5o7810MS3lZSXHj95gH/V5fi/YiFjKl/AP6u1NgM3T
 vOkzaJ75n2J2bhfyPcRZKe9dKlnwPDYX/8V2vCOnW+vU3YrLbMkuoEzXU2FWgTHiJwrPZ/RTj
 R8uij/kRfK+pF5NIn3HrXTvpiwjcG9qSnZqDrHjhd6sZKd6/PoUFsVg59irRrleUNQBlSru64
 Odc/rgs2jkQRD3fDWxGBjl116fQCxh3SHnRa5aJ8Wb9/66RHlNepWfOmVn6FCCAkL/tCEzuad
 Ok5fKh33orINRYSUGyKpM0Vp7u50=

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

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&stream->driver_queue_lock);=E2=80=
=9D?
https://elixir.bootlin.com/linux/v6.14-rc3/source/include/linux/spinlock.h=
#L572

Regards,
Markus

