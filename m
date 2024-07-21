Return-Path: <linux-media+bounces-15208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26805938517
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2024 17:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8B81F2149D
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2024 15:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BEF16631A;
	Sun, 21 Jul 2024 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="srG5umnm"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF2D2C95;
	Sun, 21 Jul 2024 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721574434; cv=none; b=W+Uqd8E/AWIuz02WIlj4L7TyrG05Vdr2Ko6uQC5U7QUW8NXVjrkrqku1/T75YzlRTBX+m1B09K04AOIVKLxJSx3/ApX7fKpxjB2kNp8s5tj16Ow9hQG4K8cePQwDtz2Xo4XNKeQ4nwAFVtXQv4d2Bpi/ZMil3ib7rWLSCYtHcO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721574434; c=relaxed/simple;
	bh=4RDVfMoZnl8W/03Rc62UPisRtfi7MpKvNbVSPt0+tFE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=rDTiijt/7A1d8DQoVQI1CxLfMxtqtkAGxULcsKvmNjRxxvBjeeOSfMGq3h3vvaLHOflAsxJgegSFHkMnv87w0HVVrh9o6iZMjr63eVB7j9mUUjKSRbLoOsO3iPelesPXkd62DX219WHOfcnpKuwXfS2FMiFwfUeZORc+BRmObsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=srG5umnm; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721574396; x=1722179196; i=markus.elfring@web.de;
	bh=8e6xngCEuAfhhKLHCqt5i+i2Y9dCoP7b7yRLeyw9pj0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=srG5umnm3ufPiBmYgOoAd7FiLEfhrND+tDIj90O2mEtyfKwgAv9c2Glc3m3l8GRk
	 yRALk0jJL1+K59/MxDaOdbaxYvwdOc0L0WtQiMkDMtGNKr0wcDeKbTCr/0Jh+G3mJ
	 +mpQk7uDhycp/sSoL0f8E/ghwzlYR/RBIY3fu/YrWqZfK4WyEkutrDKli6f1NT/hN
	 EP1HUo/sW1KW3Amk+lHlOXkYVpYEZLARg5jRfYFvRLOEyRMHGZureHfG7Ly4K1rvV
	 m/dhw9NRqQa9bHcjP8LtbqW4hSq03RQiSKlpzki6PLLnOEXSbAYXbwnJB5bDjRn5/
	 JKEl32160N+e9+qiqA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N79NA-1sFFfE1RAi-00tMCf; Sun, 21
 Jul 2024 17:06:36 +0200
Message-ID: <39542eb6-8616-468b-889e-d9e1db5bcac0@web.de>
Date: Sun, 21 Jul 2024 17:06:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dingxian Wen <shawn.wen@rock-chips.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Nelson Costa <Nelson.Costa@synopsys.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240719124032.26852-5-shreeya.patel@collabora.com>
Subject: Re: [PATCH v4 4/4] media: platform: synopsys: Add support for hdmi
 input driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240719124032.26852-5-shreeya.patel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ak//860WhkOvUrec+vnPOWHPxhxWYIyxGq482NZFRI1G3Kaz2J3
 yfLQAIDLAZZoMvfEkQeeZ2UAJh6Ollel5osvUKJXbO8ar7yjmXYqiSwpEIeso5KgG7kUQNS
 rPGOvXpD2m9ughKG6wgKMN5YMJZx+RMT6oil6VyHb/5xrPiIXTtz0wgD/0JVk1tQM5wAZ2R
 WeMLhpihX8cZ5MAI5RJ/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VxIcW5ieMCU=;AGiTzqtD2DIn/PYq60IPFcVELrj
 8zVMOpmg+5xhcleAN8Kr0lQC9AhE+tDegMYdoVvYY1M+FC7bpOoodcfMffkImWpohzXeSgQTd
 SgL2gxPPEibBmWh7CsHvDidwDIBEXE/imn0/Tglztb5UJxXHDpmsxQLtTRFUIr4MgHIeLW6us
 kMos34qP9WU1pIsa2J1J/uYYyj4mhQK+kmidKCcseYmdf1dSTVr/mHNPiLh1Absvtm7GMJm1m
 fl4/0vidzbzROR3/bCvhQlNgnypg5h3h6tCApE0dFslduErkNbZAXwGe20rmTsoqfYUZidiqY
 YSA0CDYUM6xDDOY6a6uo9g9HxVfSy+Qjn1xT06+veGFQo9NHKk2SHZXVqRfejxeQN7POcWO2I
 FWnMvUOOOQWe0sCAFwxpZIu3Au47E1f7ERkLd2TVpN4IgRoSeISWH3nM9D8E2XLwRqlv1O4En
 yHKpuSwpUV3Ie9KWTqDUNE+Rp8kQnAcCElkiLUmyoeTwz8K4SFmMHBrwB25qghWkT9TYh8fVn
 2YjDYKcfP2CQzusOJ59kdlQ9AHNmjU3ZKPlTeyt6KfD84Lmc+5svdKCuNcEcO6XcogON3L762
 UG2bKp6KqSsilhg+i4J8KOviCA6U6oEaafZr05owVzL0TVnvIsfG5Kx3FS4E9D0JuZ9pcrS50
 NmW0hZjwF540rxeqQIQN0mWYT3aOHXr9a+7gtLmW1xeuQRyr0jExb5WNbjWfr/DnUYJvLQ4Na
 6dglV1kM/ZACC/on2wPq9X07iiKM/vvBcm/dZIrZ+wJplkqDjU0SrXfsK4VLlsmMFiFnr5uGo
 BhHy6kQDu0WHF9JQv6JcfshQ==

=E2=80=A6
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -0,0 +1,2763 @@
=E2=80=A6
> +static void hdmirx_writel(struct snps_hdmirx_dev *hdmirx_dev, int reg, =
u32 val)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&hdmirx_dev->rst_lock, lock_flags);
> +	writel(val, hdmirx_dev->regs + reg);
> +	spin_unlock_irqrestore(&hdmirx_dev->rst_lock, lock_flags);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&hdmirx_dev->rst_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10/source/include/linux/spinlock.h#L57=
4

Regards,
Markus

