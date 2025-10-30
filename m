Return-Path: <linux-media+bounces-46000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E91DBC1FA61
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 11:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD6DB4E971B
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 10:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC316350D42;
	Thu, 30 Oct 2025 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="fRb0pGmi"
X-Original-To: linux-media@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5A3396E0
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821546; cv=none; b=SGVsPYEBonp66OzPY+RKBNoqZuqWB/5avQrLfEdcBPal9XIjH2pFq8q8VL74HlCY4X6ylWJNk+aJlXr19gyHV9yvu52nAc2TEeYi11krqRGMipw+tsf8gyJwg589Bj5CXYk56Rs57M3ChT0fC6PItn5Se/Eaf8k+MPidWckbieo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821546; c=relaxed/simple;
	bh=7qW+NaaGh/JE/ucc85gWuheRzd1Q3hCNzAtheC5l+2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=eVC1m6WAoW4fiVJlFOUgD8n/3BmE8f9La1eJyu5mMVvojIWhZiRiOgSGL3nzqi+ruMwbjtaOcMNOqoV0nsY77fLaYF3epyfgKNWub9iCsrG49tdiD9Xb9jZwSr34mR3Hw4JR9b4NqaAbn5+f5oxwQDLZZZjj03RBl+thg4kz+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=fRb0pGmi; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Date: Thu, 30 Oct 2025 10:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1761821531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBHnBHSuMYckJCLbgZCu2OahfUnKzTUzjWVCcpE6wBc=;
	b=fRb0pGmiX3dK8gJZa/zjS1z3dJEB9uuqxQT5osdza1NGSdi0lHhhDfiqNCTqSSxuOdCutE
	TtGUGf9YypwzUGmubEkjG8lMMFdFXkWq9Lcd9riJSOPKCwMrurjtuoaW0qPhUJVlSAoTSe
	qrkkfOoffCkvPDrPNLwWaVNmC2KCRUdGnHnarRcYSyxSZejDIqqhLkGL/hkf3VdmefsS5v
	pYr+ao12rw7hjomsHXvZDxGHRRFnM9fASbnSRDTeJD4UnlwwHQRx46IiWPbMFatzp2e8kv
	3OmV6LQF5OfTwin8zGkIA17VE42nTlRvvZtWg1MV9FaXs/JWAkBnh5gqDsx7gw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>, Christian Hewitt <christianshewitt@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com> <B9A578FB-BF95-47E1-B202-B59897C2C898@gmail.com> <9a8e0391-c73f-4913-88e1-0a278d99f90d@amlogic.com>
In-Reply-To: <9a8e0391-c73f-4913-88e1-0a278d99f90d@amlogic.com>
Message-ID: <t4xy6q.vhi5j58gpfcw@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT

On Tue, 28 Oct 2025 11:08, Zhentao Guo <zhentao.guo@amlogic.com> wrote:
>
>在 2025/10/27 20:57, Christian Hewitt 写道:
>> [christianshewitt@gmail.com appears similar to someone who previously sent you email, but may not be that person. Learn why this could be a risk at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> [ EXTERNAL EMAIL ]
>>
>>> On 27 Oct 2025, at 9:42 am, Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>>>
>>> Introduce initial driver support for Amlogic's new video acceleration
>>> hardware architecture, designed for video stream decoding.
>>>
>>> Compared to the current Amlogic video decoder hardware architecture,
>>> this new implementation eliminates the Esparser hardware component,
>>> enabling direct vb2 buffer input. The driver is designed to support
>>> the V4L2 M2M stateless decoder API. The initial phase includes support
>>> for H.264 decoding on Amlogic S805X2 platform.
>> It would be nice if you can outline the additional hardware the driver
>> plans to support so reviewers have perspective on where we are now, and
>> what more be coming? - the community would also like to understand if
>> this driver will supersede the stalled driver attempt in staging.
>Yes, we will follow Amlogic's overall upstream progress to support more 
>hardware
>platforms in the future. The next step will be adding support for 
>A311D2(T7) platform.
>We also plan to replace the stalled driver with the new stateless 
>decoder driver.
>The new stateless driver is fully compatible with the old G12/SM1 
>platforms, making
>this transition feasible.

That's awesome news! But how about the older platforms such as GXBB
(S905), GXL (S905X) and AXG (A113D)? Will support for them also be added
or not?

I and probably many other people still have interest on these older
SoCs.. they otherwise run Mainline linux mostly fine, so if a working
vdec driver comes along for these, that would be great!

Best regards,
Ferass

