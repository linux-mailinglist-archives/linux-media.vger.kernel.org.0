Return-Path: <linux-media+bounces-26413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA7A3CABD
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 22:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B65717702F
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 21:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F862512C1;
	Wed, 19 Feb 2025 21:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="tfMjQR1m"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D014184F;
	Wed, 19 Feb 2025 21:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739998995; cv=none; b=q5tqmZ/uWZyhe151DbMlr26Pyo3WDCLnYIW1nn4H0K4hGjlfhvfD2sgKejWr/sFS4xVuN2oraDBUNOzuoIj0hkep09dtsZ2kiXDRUtd1Y6fflQhWCTvaADCh3XxNK5CM8gDYYaW01Fh/1phaX3xgSTHPrAmtZtanZmQ0g3JsNi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739998995; c=relaxed/simple;
	bh=bVh/9Xy+fVVQmLK0Abao4KGCAGEU47AesaNFcotfLBU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=LU4FdGkZgUa0ZpAJm/Z3oysifeizrzyGQhKK9btjDI/VPjW/EOyF1oClbk9o1NGS94m99TTNeiryXDL1e7J33P+bsRJU0W497T0qV7y31XPHIKHSzwZ39U3f1z4P7+yglUVx20bBiwbLYlLxWYZ3EHOptkQXWxVObLabE0WgcHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=tfMjQR1m; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739998981; x=1740603781; i=markus.elfring@web.de;
	bh=2SWP69i4G2CzvUOmUdUSobPigRxGcLa8t5Qfp8lqpJQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tfMjQR1mabCmPcG7yobPSy3kOc2Oo18cmCVLFHMEcp4BAqoUoPe7tQJGtn6a7YBC
	 BQ1rrXjZRFHsnUPgK0IOP6Acem806DUT5qzMdpb+En5M+nbrwZaxE0WOk8YixXICg
	 RkaFdh0NTf7XbbDbcrMqjdfrmRVuuU4cIYEmlTWnuf8e1L2gT+JkgSB5aKr3bHJqm
	 1EFYtJnKR9vOTWcw4WPfMGzCM071HRdnrT8h3/r2aRii91jv5TAmT0fiEHqDuRuhB
	 kmCuj6gxj0l2wrx+IlD9bL3E53XPVxMfjFr+rBogSQ7vvocN1wOQuFQ++RgeQ7who
	 1mh9zgfiXqXD/H8PFA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.10]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQPZj-1tyHH13N0D-00XOQW; Wed, 19
 Feb 2025 21:56:34 +0100
Message-ID: <9e46e0f9-ef0d-406f-9fa9-9c4464a8db88@web.de>
Date: Wed, 19 Feb 2025 21:56:31 +0100
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
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nelson Costa <Nelson.Costa@synopsys.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@collabora.com,
 Tim Surber <me@timsurber.de>
References: <20250218184439.28648-5-dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v7 4/6] media: platform: synopsys: Add support for HDMI
 input driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250218184439.28648-5-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g/nteeapHpXeO3nP8XGK/NTsQoE4a7rQd00/eKhfZJqD3E4me6k
 mPBfaWWvqneRcRbYIXoVsvgfDFiwgmcn2+SwUKiismKfCo0nx3rdQhZBy4mLTqfXiQ+eYAr
 crbVywIUycNHedSQV7D5KlQ5pZaP5YEjKbWr4MixaWf0KeSynMRIIrtuR+28WZrPHQqNJtt
 zqqN1ASlctW5KqJINvu4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F6O9QjTt1G8=;HpKS35OzFbD2n7qX+2zD6g8CqrC
 WJq6SvPVn2nfLtSdsFHcqLn6PhsEEPHbiDYi5+hiEv330H5MWR8uzDy8ynohUQ1NO87pH+TbN
 3Z7rmW5bOWVMVgAYMbM624vf9R2DSrLHEcUD0lCBQXV60pcUZYnOhDRloORXyzNJ/NHWwS7GR
 42GyPmGZEvu3UDnBKLG8EfXzNjV+C/A9THZFxchZVcNdMXWP9hrk9eSCWMRow3wHxlRAD0PBv
 yZQbkhqabUSuTD04SIjrNgRQ+qaCf7G3j+TUrELBlZULaXJPmwKinYL0DbOXJzw/HtV7d6tWW
 ysxdZB2ndqOVlErXale3IcVCSDZKfbkzCnRh9m1TcQoSRVesIVBRRUvTuOw90ILWQ7/yBaWQP
 dnGxcgsuujpWCLg295YbrKdxqhpx/9yDMTZ25igOTLNQn8YkEqFMYbeW7eth93G3qSSZDPSto
 h9qjwqQ6gmnY2swDVZpm1EkufLMhOfJNfY8dDyUumvq3QMnAxJlA3sZlIbEo1TeVKzLmhIKq6
 Qft//XcK4v9YoXUERycZsjlFGeUnQY199Yj29FBZwNrEzIZKg/q0Zzk9jr8Wo2WfGnT5z641i
 La1hJAE56bUXpkCJ4waMFC7dZVUg9s6u4gR3q7/L85hi0n+yxuAvUhPEMj2w7YViK3USI3W7p
 DGk7SVBQj0fPchGDiwD7KVkWkHa5BQuhWRrr9vSwg6s05UQLHLup1CalK1qtQg8s7wuo0gl7c
 xusuqZgsz3m+mAUcloC1gPtzJZNzIwefvVh3+g0YOeUpkJuQU7xYTKZP6nN2RCrmed4WHsCmt
 MgDeSCWhgok1hC1JTw9H3+Ak0y2+yQiXvgOoGd40as86rAz/NFMxf0+sDaEQmxmkiXOuX6Xmd
 wbAcVplFRj0GXutlKxZ/+pBN5Y8a1GeyzAphxCtbfwSBILW/pLhTp7rNQTb09ivct0rXc8wXl
 w6raEcMLutMy4dKg2V7F9YZeXQgXNn88pTbLm+/IizroWw4RXpF0gJgArAu7Up65PjJVO815/
 HhhmiXpVRFTax9lXiYunirS3t2Ac37LsZlL3726VGZogrNJoNg6wnpdvzcUuNz4tP5pFf7UNx
 GVDrgCw3s0Wbp4oFTtSKpAIuIw0C8xUFXq33VllH7apXxi2jKSZiQI14KkNZYXo7rpb1evfXO
 6f84DHHtaDtOT3qDh5yxAb+W4S3FLSL04hGwHpXSIuU9Z+AGWJOCx7pXnqGqUgnCA1I1h2ufj
 NgwkMoT4WiiTdYK5hnI2MrCwUgiWQBL/Kpbu3IR+vIPmJhD+lhHoxnCk6dJ4F7qblvKi+yoHo
 PPpVQjb3RuOeMzP4BpiNv2G0S6VL3+nIkBF7d/3Sy0IkTH5Ev8q0FxOTAJ0veFW4thvq8g2ey
 BOdjPsmLsQQG4ZoQFUDdCVLjwFq7An9VLwbajUg9J+X/nxCY5wEpYmB1AioYX09/BCczVNZxr
 NnGfOlw==

=E2=80=A6
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -0,0 +1,2718 @@
=E2=80=A6
> +static u32 hdmirx_readl(struct snps_hdmirx_dev *hdmirx_dev, int reg)
> +{
> +	u32 val;
> +
> +	guard(spinlock_irqsave)(&hdmirx_dev->rst_lock);
> +
> +	val =3D readl(hdmirx_dev->regs + reg);
> +
> +	return val;
> +}

May such a function implementation be simplified?

{
	guard(spinlock_irqsave)(&hdmirx_dev->rst_lock);
	return readl(hdmirx_dev->regs + reg);
}


=E2=80=A6
> +static int hdmirx_get_detected_timings(struct snps_hdmirx_dev *hdmirx_d=
ev,
> +				       struct v4l2_dv_timings *timings)
> +{
=E2=80=A6
> +	mutex_lock(&hdmirx_dev->work_lock);
> +retry:
> +	memset(timings, 0, sizeof(struct v4l2_dv_timings));
=E2=80=A6
> +	mutex_unlock(&hdmirx_dev->work_lock);
> +
> +	return ret;
> +}
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&hdmirx_dev->work_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.14-rc3/source/include/linux/mutex.h#L2=
01

Regards,
Markus

