Return-Path: <linux-media+bounces-42046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B58DB49CCB
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 00:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE2643C250E
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 22:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFF32EB862;
	Mon,  8 Sep 2025 22:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2BsrGp3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7AD17E0;
	Mon,  8 Sep 2025 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757370168; cv=none; b=J0ngJFCQYEihyrGPF43fH1TOB/kHKyCPwMdjZ3XZfT2YO3kzzCWQ1bRAtK3hpQ54p6wWgz1qVcBH3yQ5ovFCTL+++/Q7aVS8+ob348l7ZrZqK0ZbDB/F47gGAkFk7fJJfeOuArzU8UPGcImX74Mm2grAppZj5ACAeZd7pVbo0gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757370168; c=relaxed/simple;
	bh=8cXwfOI9HP/FP1SpHc23/1LxWXO1om2wkblB5QFskag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nM7sYQxUscQeDtFJTuaV4QWqKAXNQYFQda5jWenk0Le5wKVXnNisbbHmuCxGfAXbsWoP8h/q3E4EyZmvuQEwR/SZHS/yH7CVrSWMiTQks7R0fA9XI6ScDqfLpUsv3Lzq8Fl/qcrAULEolrk8kKk+zn/FCS3CjHq2g67lQKRbaqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2BsrGp3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8B4C4CEF1;
	Mon,  8 Sep 2025 22:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757370168;
	bh=8cXwfOI9HP/FP1SpHc23/1LxWXO1om2wkblB5QFskag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2BsrGp3+jnEyIhsekQIbzBbDnaVfc4R4dvpIQNDENfwb+sk8t8boiajtDihgeeVD
	 ZSuM5QLF+SUrtOtVc9U/Ktm5vBD+b4bEjx2V8ZnrKpKjCh2QMadCOYzVGGxgwW86Ul
	 I1bJTENjOii9cyuzUzyM9CNkCOyf7gdjG2DlOYtdoHdESLUDfSF8dYnMQFw+Aqv0ko
	 RGsIbBebuy1A8MTwov32N0zgLn1z58PWdz3DGt9Yl1g7e2gfyK9IOpHIOfKrOOHRMT
	 hcpZIFtefPLkE4pQDTRw/VEoJhvPy7dfPl6/KpRFhRzdoaVIH3smhdVZqb90fLRMP8
	 72Vw5rrTxdO5Q==
Date: Mon, 8 Sep 2025 17:22:47 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
Message-ID: <20250908222247.GA1943768-robh@kernel.org>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-2-5944dc400668@vinarskis.com>
 <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
 <046b289d-b6a5-45f9-88b1-090e2ab7c95d@kernel.org>
 <39b955b9-a152-458a-8e09-908efebaaccd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39b955b9-a152-458a-8e09-908efebaaccd@oss.qualcomm.com>

On Mon, Sep 08, 2025 at 09:36:39AM +0200, Konrad Dybcio wrote:
> On 9/8/25 9:33 AM, Hans de Goede wrote:
> > Hi,
> > 
> > On 8-Sep-25 09:20, Konrad Dybcio wrote:
> >> On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
> >>> A number of existing schemas use 'leds' property to provide
> >>> phandle-array of LED(s) to the consumer. Additionally, with the
> >>> upcoming privacy-led support in device-tree, v4l2 subnode could be a
> >>> LED consumer, meaning that all camera sensors should support 'leds'
> >>> and 'led-names' property via common 'video-interface-devices.yaml'.
> >>>
> >>> To avoid dublication, commonize 'leds' property from existing schemas
> >>> to newly introduced 'led-consumer.yaml'.
> >>>
> >>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> >>> ---
> >>
> >> [...]
> >>
> >>>  
> >>> +  leds:
> >>> +    minItems: 1
> >>> +    maxItems: 1
> >>
> >> My brain compiler suggests this will throw a warning (minItems should
> >> be redundant in this case)
> >>> +
> >>> +  led-names:
> >>> +    enum:
> >>> +      - privacy-led
> >>
> >> Nit: "privacy" makes more sense without the suffix, as we inherently
> >> know this is supposed to be an LED
> > 
> > Note "privacy-led" as name is already used on the x86/ACPI side and
> > the code consuming this will be shared.
> > 
> > With that said if there is a strong preference for going with just
> > "privacy" the x86 side can be adjusted since the provider-info is
> > generated through a LED lookup table on the x86/ACPI side. So we can
> > just modify both the lookup table generation as well as the already
> > existing led_get(dev, "privacy-led") call to use just "privacy"
> > without problems.
> 
> In that case, it may be cleaner to just go with what we have today
> (unless the dt maintainers have stronger opinions)

Well, I do, but I guess it's fine. Please don't add the suffix on the 
rest and add a comment for why it's there.

Rob

