Return-Path: <linux-media+bounces-403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C737ED494
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 21:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B06FB20BF4
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 20:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94262E40E;
	Wed, 15 Nov 2023 20:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JIWMIbia"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94A41BC6;
	Wed, 15 Nov 2023 12:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700081873; x=1700686673; i=wahrenst@gmx.net;
	bh=Sa50pr17rHpNEDRliCF/i+WHXsllL71GrbENdrRQpvE=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=JIWMIbiaXguloXQpSJ+TYXiJv3jZfO76Flxr9ZFQ/QL1dTPDPjii7H9kjo641p1T
	 xYIo5olu772EhFEUv7ByGRLLhXfAVh7oALPHSbBO9yLw93bZmXzCFf/8HRGMnX83w
	 CRsk11byOoXbrLXl+zpr2zJZZNlUJTeapkRqM1mRtfCue+WRLyppwchqhwTN0SQxO
	 hgLz4zOAgao0i61+u4DbBCrnhyNeB3ALP3PjwcphlQcfrx7BJMdo9+VmeY31Xj2ri
	 RqZKudxS0DWmME8lpRCIDMDs/Q7padA4o1TRL1t+CPT2dsbUNASUfLV3dnElpFslx
	 tr9Uy9hViawctxqPTQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mirng-1rXBvZ2lnA-00eqN7; Wed, 15
 Nov 2023 21:57:53 +0100
Message-ID: <58fe01b9-5fb6-451c-a759-c6a5afd695e3@gmx.net>
Date: Wed, 15 Nov 2023 21:57:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] staging: vc04_services: bcm2835-isp support
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, "Ivan T. Ivanov"
 <iivanov@suse.de>, Peter Robinson <pbrobinson@gmail.com>
Cc: linux-media@vger.kernel.org, kernel-list@raspberrypi.com,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>,
 Dan Carpenter <error27@gmail.com>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231115195947.GD29486@pendragon.ideasonboard.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231115195947.GD29486@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OpHO8qKwTrK4qdM9gXK3iDiFpAQpeW3bfk2kkP7XP3cSN85dvpJ
 Q47eMZcUon8X51QsZfc/2sxGkiom+jvSc/l2xDx6dzTNFOkW1yjHo+eG6sJgLQHzJMdKNcf
 uLam+EZ25Fo4/tw+9rZT0/qODmBko38lAUmFcMO68yK2pG4p6/9dG6PoqjAVNuKL8TSSkAq
 WTCrLZ1xl0RUlkMv2vjnQ==
UI-OutboundReport: notjunk:1;M01:P0:d57/UTHAN70=;jXaJZjyxy6erNJJmZQs5uXxNHRQ
 DvtFD9U8ftQnyxP4i1cHgt8jI5chfsaocIgciumD149Y5X8K0CV0N1qKzvJ6pq3uOhVkzlwU3
 /U5TrCyF1Btcq58c62ectMAn8bTpCKaBAI04S549wgsvzgC3c1VFGU9j9E7/yZ7EhFMDa7oW0
 w1Px0naeVDAIAmLUfT1Hy8HUI5XMPFzGvP/wm0EmhL+dbVXeF5wU5tilr2O/qdOIFWQq4oh3o
 4zTBEovBp+0z39EILZvHl5nF/IEIaZFPHNy6EidYdrCuOd1WK+lo513Fan9RKwm2HmKt/sKtn
 GebqghjIYGhiYk3TwtZ5711cCRUyI8Ye/93xGozrQRFbBjy4MZYcE157lukC/J0QTI5uNWxzh
 2xzrCjlExEK0idZn5GphsozObcsbjgTGv3wvAawJsxwIddThptGpCADIoC3ZILmz3vEKWBbYu
 9tgcGl82gqLdFjKaRTVcbcPJdqeU57rhUXcUMo/SfM0/ceCJk2rh4aGSRnQqPA1G/VqujgaYZ
 vUZRUph5AafMNHRDSr0zsQC0fdupel3qv7cjEifHk+wMwp5WChxRYeU+81OWy37Gv1fgu+BsJ
 o75chFEnFfDVKj7yQo1FAdQ6JoFiCBWgJpUJlYOUFwQzO9AHHybUSndnb3G1A19ma9k+u3I8e
 sKOsB6+PbrAM+U2rxNp37kdv4zVba3MiC9fRRyZ0Uk66Me/7gPsRhrMVTcVFKNKmk677j1SPs
 CLMCSbzaElGKUaXD0LRgi96oGNUScJrg2I4OZYpwOCWpU8mJn9wDXg6LE3/y6Pl/ZKkRdkUS2
 BjdTm7OquMbPu8SAoNa2NXeWwdolxQkvkTSyUnD0W/88oN0AWg1LKjhCauD76OVti0eoFV44g
 WKYSXT9QPj6fOKzXuaapnGMoyw6CkakD473Bbn4IcGzjc3wSyTS+Coxm02vgOMmLKBlbGNDYs
 IxkczA==

Hi Laurent,

[add Ivan & Peter]

Am 15.11.23 um 20:59 schrieb Laurent Pinchart:
> Hello,
>
> On Thu, Nov 09, 2023 at 04:02:52PM -0500, Umang Jain wrote:
>> This series aims to upport bcm2835-isp from the RPi kernel.
>> It is developed on top of staging-next which comprises many
>> VC04 changes for it's de-staging. Hence, the merge of this
>> driver is targeted when VC04 is de-staged completely (which I
>> have been pushing), but it can be helped getting reviewed meanwhile.
>> Hence, the reason for posting the series.
>
> Related question, what do people think about dropping the legacy
> firmware-based bcm2385-camera driver once this gets merged ?
> firmware-based camera operation is deprecated by Raspberry Pi, and
> doesn't work on the Pi 5
i don't remember exactly, but wasn't the bcm2835-camera required for Pi
Camera V1.3?

At the end cannot speak for the users. AFAIK OpenSuSE and Fedora use the
driver.

