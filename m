Return-Path: <linux-media+bounces-27503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E03AA4E8FB
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F37073BFE8E
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 16:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC542D1F78;
	Tue,  4 Mar 2025 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTzEGiFf"
X-Original-To: linux-media@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547D5290BDB
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741104951; cv=fail; b=hTKsWy43HJXFV5XL2uqd/xItAK6yfM37vCbRAtkyoYDUth+mOitEujREq5mx80ex8XFdg2VUjB5lbbq5ESi2qoiuE54gzdTiL6KoC4fA7Zq8hYKHRgi9id6QmHrYVGNX4Dc/PyZC4dw+dEhoIO+8lZUlzw7FyrFEmw1EougEiPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741104951; c=relaxed/simple;
	bh=iaBlcemRdKwSm+foatTJC45/O0WgscPMRwsAY1ldMss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSvnwvxJFlm2TiU1BGtvpSpsSQXKP9fCIJ+VanQaQZwatZu+Bbl61mBPTLIZB8HXAd84WviYMxG3GxH4N9Qvx0mCGp8RxeYDN61u/FPVXxLFc3OLd0k1K4XNYs591XCg4CWDFVTsikjrcJmBoN+FnQcXH2PZ/1hqWtKzNulj14I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTzEGiFf reason="signature verification failed"; arc=none smtp.client-ip=10.30.226.201; arc=fail smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 80F9B40CEC94
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 19:15:48 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HTzEGiFf
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gh01bNqzG2J2
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 19:12:48 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 3D49C42755; Tue,  4 Mar 2025 19:12:34 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTzEGiFf
X-Envelope-From: <linux-kernel+bounces-541094-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTzEGiFf
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id BC6A6420F3
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:31:51 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 985BD3064C0C
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:31:51 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A7B318917C9
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 07:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D571EB1B5;
	Mon,  3 Mar 2025 07:31:35 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC714AD2D;
	Mon,  3 Mar 2025 07:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740987092; cv=none; b=ky5TbUiFvALlMlTaKigdQDLDUk1W1AH8b/MvXagBb0Xk5b5TIUiiItID+KCOXnGO/FZcObnLbedkgXfb+ftAmS7DSkS22QklUVqV4BV6nIGoQvPJgXEgBoZ2vgEJPVqmaIh7lFxE6VDHu+fAPHnBR0ZpQyLX3HUQtBJovb9FZlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740987092; c=relaxed/simple;
	bh=Rp+ML2bibpqktoLUGR92Bz7M855WOGJIx85KWI6GPlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qs/rqmr1PCo3H0sUZ9KVUfarUOj+NsP1wfjmQLXG0WIKQaeK6qK+/w0+UQD3te/wCKDFiZbRc6rN+Yg4pTVy0sssnopchUbeRiJxphCiNlC7pclhI9TvEdcC++q8C0edegJVN+a8VOs4y6a2Ba5yl/IkOPBqx//O5BB/9CHblbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTzEGiFf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA799C4CED6;
	Mon,  3 Mar 2025 07:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740987091;
	bh=Rp+ML2bibpqktoLUGR92Bz7M855WOGJIx85KWI6GPlY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HTzEGiFfHLV4w3wmTYdgM1MCufXU4oIQ7PNRV0iGYfH7O1AlC9I9jG8mRefk8kGMk
	 hHaX3prwYZyBKkE9OkYkGGbfe4+xwGnXulJ7Tn+Yqhbes5R4tmKYP75jte80SDKIrX
	 ORktdyG6hGNsc+7RzDE68WQt/m9XnfY8ftWGpyWBeQ2r/NSrTW1qY8x8VokwBvGAtf
	 KwjwSt0LjcHRMPqtg1L3JUujWt3sRkfsY3yO5yyHWKsDWKS3aIcwN+ecSJXmqz/oNX
	 IH1cwiQLFaJoLuhdLdx/btKuJqw+tg0teun2eDbRAcaZAqjQ2JrgstmwN5S8kQPsss
	 7blHovP1SNM+A==
Message-ID: <3d729159-4d13-4a61-88c7-3be992b23728@kernel.org>
Date: Mon, 3 Mar 2025 08:31:24 +0100
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add dt bindings for
 m2m-deinterlace device
To: Matthew Majewski <mattwmajewski@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250214231759.119481-1-mattwmajewski@gmail.com>
 <20250214231759.119481-2-mattwmajewski@gmail.com>
 <20250218-eggplant-skylark-of-swiftness-dcf6ba@krzk-bin>
 <69cb2e95c291f17cff42b45e7c871f30a85c060d.camel@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <69cb2e95c291f17cff42b45e7c871f30a85c060d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6gh01bNqzG2J2
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741709647.19604@c4MH54Gle08d4pbfQOxWMQ
X-ITU-MailScanner-SpamCheck: not spam

On 26/02/2025 23:41, Matthew Majewski wrote:
> Hi Krzysztof,
>=20
> On Tue, 2025-02-18 at 09:30 +0100, Krzysztof Kozlowski wrote:
>> On Fri, Feb 14, 2025 at 06:17:58PM -0500, Matthew Majewski wrote:
>>> Create a new yaml schema file to describe the device tree bindings
>>> for
>>> generic m2m-deinterlace device.
>>>
>>> This device is supported on any hardware that provides a MEM_TO_MEM
>>
>> Which device? I don't see here any device name/model.
>=20
> By "device" I am referring to the m2m-deinterlace device, which I
> explained is a quasi-virtual device. If this is confusing wording I can
> change.=20
>=20
>> I asked to provide here some examples of devices.
>=20
> As I wrote, supported devices/hardware is anything that provides a
> MEM_TO_MEM capable dma-controller with interleaved transfer support. I
> did not list specific devices because the bindings are supposed to be
> generic, as they are not describing actual silicon. But if you want me

I already told you that no. Bindings are not supposed to be generic.

From where did you get such information?

> to list some devices which provide a compatible dma-controller, here
> are devices I found in the current mainline kernel:
>=20
> - TI OMAP Soc Family
> - TI Davinci Soc Family
> - TI Keystone Processor Family
> - IMX27 Processor and variants
> - Several Microchip Processors (sama5, sam9x7, sam9x60)

That's too generic - you just listed SoCs, which consist of dozen or
hundred of devices. Which hardware piece is here?

Maybe this is not for a real device, but then this should be marked clear=
ly.

>=20
> As I mentioned in my original email, I have personally tested on a
> BeagleBone Black with an AM335X OMAP processor. There are likely many
> more devices with compatible dma-controllers that could be supported
> with additional dmaengine driver support.=20
>=20
>=20
>>> capable dma channel with interleaved trasfer support. Device tree
>>> bindings are for providing appropriate dma channel to device.
>>
>> Don't describe what DT is, but the hardware.
>>
>=20
> Ok, will remove reference to DT.
>=20
>>> +description: |-
>>> +=C2=A0 A generic memory2memory device for deinterlacing video using
>>> dmaengine. It can
>>> +=C2=A0 convert between interlaced buffer formats and can convert
>>> interlaced to
>>> +=C2=A0 progressive using a simple line-doubling algorithm. This devi=
ce
>>> can be used on
>>> +=C2=A0 any hardware that provides a MEM_TO_MEM capable dma controlle=
r
>>> that supports
>>> +=C2=A0 interleaved transfers.
>>
>> And how do you program that device to deinterlace? How do you signal
>> end
>> of frame/data when writing to the memory?
>>
>> It still looks all this is for driver :/
>>
>=20
> All of the deinterlacing is handled by the dma channel. To simplify a
> bit, m2m-deinterlace basically just translates video format information
> into appropriate interleaved dma transfers. Everything else (and
> everything hardware specific) is handled by the dma engine, such as
> initiation and signaling completion of transfers.=20


So the device is the dma controller and maybe all this should be folded
into that controller bindings.

>=20
> I think an appropriate analogy for m2m-deinterlace would be spi-gpio.
> Since spi-gpio leverages gpio for bitbanging the spi protocol, the
> bindings do not need to describe any clocks, spi-controller registers,

Sure, SPI GPIO is Linux driver, not a device and I am asking about it
all the time.

> etc. All of the hardware specific components are abstracted away by the
> gpio controller. But the spi-gpio bindings still exist to specify which
> gpios are used.



Best regards,
Krzysztof


