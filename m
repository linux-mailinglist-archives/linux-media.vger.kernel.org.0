Return-Path: <linux-media+bounces-43884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09619BC322F
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 03:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDDCC4E6210
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 01:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7993529A31C;
	Wed,  8 Oct 2025 01:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSjlpz5R"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0F5259CAC;
	Wed,  8 Oct 2025 01:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759888551; cv=none; b=bwosTkI/rxEPCAh3jCf/HZY5AhYLZ4YfsETPq74FO2h99AI24TU1i+CPJcZmoFo/hTtk3AYwkrGygupIiEW3lfsYBdX8i/8Qmp/k/gWHIC9xBPikv+R5cUAuTNb2G4dQLlZaKNFt/YyQe3KIEax9fIL+U810wRqRkW3NxzSTPjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759888551; c=relaxed/simple;
	bh=zUFhCE55gFIo0YuR9SI3nbI7zUYaY9J9ttmKAuups78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZjYzr+lw18LrmZYuzldQO29WJ7heoc2ufb0HGKCwS+/ctkEewRmvWeuW0Q5ThP7d1XoXP5K2DPiaxI1SyfS4BHoDY0Hz/inAYAT0yODBYI1AMGhC4E7/EBnWVQGiam6IxthkWA9uk3yfEgmSILd921UEWLLlWQaciBs91hXzpAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSjlpz5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0537C4CEF1;
	Wed,  8 Oct 2025 01:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759888551;
	bh=zUFhCE55gFIo0YuR9SI3nbI7zUYaY9J9ttmKAuups78=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WSjlpz5RmjXK8xcAe2HmxNq3T/d+qmhcJMygkYX/KOXOChRgXirnYRWFFWjrlUiGi
	 u7E3UjgyWozkSJxNLXbyBmxavxlDwXEgtGp2d2o9oydfW4gDoKSVC8pKcjS18ufcz/
	 ozAPILk8zMlev7+Nz10kRdduj7+eK0oDjW0I0+wLfikSxCn2YAHUzxV/3YVSPRmldO
	 OAE2NnM9CBpPHtY6r7HBJQcjixYcyiUw1XjGMgWOkzqeJrUxKB8uyJUkO3ezvj5MFM
	 /p7jPsxlJHeaB3zw0P+uPSg4Qfu8k5RSZpmX1KFBvTtd7OTmm2SvdZ1HMEoOkykOaI
	 H4Vs/4eOPToug==
Message-ID: <0ac39a3e-d1a2-40d8-a3d1-b422acc720cc@kernel.org>
Date: Wed, 8 Oct 2025 10:55:40 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] media: rockchip: rga: add rga3 support
To: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
 <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
 <bf989d9f-9e8e-4acc-b502-1674ce215318@kernel.org>
 <947409d8-9a92-46f2-a6e7-49f3aa44d74f@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <947409d8-9a92-46f2-a6e7-49f3aa44d74f@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2025 01:05, Sven Püschel wrote:
> Hi Krzysztof,
> 
> On 10/7/25 10:39 AM, Krzysztof Kozlowski wrote:
>> On 07/10/2025 17:32, Sven Püschel wrote:
>>> Add support for the RGA3 unit contained in the RK3588.
>>>
>>> Only a basic feature set consisting of scaling and color conversion is
>>> implemented. Advanced features like rotation and cropping will just be
>>> ignored. Also the BT601F color space conversion is currently hard coded.
>>>
>>> The register address defines were copied from the
>>> vendor Rockchip kernel sources and slightly adjusted to not start at 0
>>> again for the cmd registers.
>>>
>>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>>> ---
>>>   drivers/media/platform/rockchip/rga/Makefile  |   2 +-
>>>   drivers/media/platform/rockchip/rga/rga.c     |   4 +
>>>   drivers/media/platform/rockchip/rga/rga.h     |   2 +-
>>>   drivers/media/platform/rockchip/rga/rga3-hw.c | 490 ++++++++++++++++++++++++++
>>>   drivers/media/platform/rockchip/rga/rga3-hw.h | 186 ++++++++++
>>>   5 files changed, 682 insertions(+), 2 deletions(-)
>> Your order of patches is a mess. DTS cannot be in the middle. In fact,
>> DTS should not be even in this patchset, because you are targeting media.
> 
> sorry to bother you, but could you go into a bit more detail on how it 
> should be done correctly?

DTS cannot be before drivers, because this suggests that drivers depends
on DTS, which would be a NAK. See also maintainer soc profile. To avoid
having such impression of fake dependency, DTS must be placed at the end
of patchset (except the obvious part: nothing in your code can depend on
it).

Best regards,
Krzysztof

