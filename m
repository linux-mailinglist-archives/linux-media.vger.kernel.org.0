Return-Path: <linux-media+bounces-42628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C089B59D21
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 18:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91CCA4E3AA1
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 16:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3F827E074;
	Tue, 16 Sep 2025 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbAZ65/l"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277F4179A3;
	Tue, 16 Sep 2025 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758038835; cv=none; b=VQhYoj+RWdTYVEeMy+k7Q2zN1zoiY5ieJCtBkWekKxcL1/cqA2fmCv0EgaOtxlturc2QqqRPYnhQc9JEs9DGEseSTpFXyXvHGCRArjsNVqHLMxuOGF7+F3VORYqYKZm7DGNKEg5IQgk1yw8cOr43mJnYTyksa+7lamLTgM92trg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758038835; c=relaxed/simple;
	bh=51WcFBaGb8iVlN616QSXwpGIWaODtYoNiSjMhAkopiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=om5f5bUQaqyY9zjfsjyErkqxPdnqCV5GRE+TeyYTpYsHPRwDwTeA+pXZ7oJFX2fYfS/VCgalPtqXo3v447ThL4vQWwJJG5ksizq0zfY2zUnhkKUj9hQoerQXvQMXoTKiDW1fbAPaQ4UKS1zBo41aBIrvwxik9Toc/SOlJAAfCz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbAZ65/l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD51C4CEEB;
	Tue, 16 Sep 2025 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758038835;
	bh=51WcFBaGb8iVlN616QSXwpGIWaODtYoNiSjMhAkopiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pbAZ65/lJeT66tC/tViEhpf2YdbqQy4lG+F6MPj0P3b/IXgYil+S+0iAH2BCTWDJM
	 WBD3/QDwEWZZw68d+Eq71VOAeyrY2jbBfFu+srDWbGfifnDBKnm8hqzbNnXRCUM1sE
	 VDI6xogZl1oRhWg55Zt5O9cvUm9Qq2EtxNxKwblGJqw96Y9QRkSUuJyZqctq7ZS6lu
	 2i/Zs51S1Ex+IhqNHcHg8uvw5/Gm5FtmKIpufEMNegugO45PxpsoURM8RDAaNiIzbG
	 2C4Tq/6mb3IafdN2UWGE7MvgXWYKOb2oxPROkU43vuQTkwJ/EA1sYd+JuzR8z/TeIU
	 ccDikKXSTSCVQ==
Date: Tue, 16 Sep 2025 17:07:07 +0100
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, threeway@gmail.com,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
Message-ID: <20250916160707.GA3893363@google.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
 <20250911081540.GD9224@google.com>
 <b875f811-6371-4ff4-9cc2-a0a2c82a569c@kernel.org>
 <g7xkdervsknmcwjg4qgloj643b4itjlfeyiipvsrborszgrhlg@zrp65nvfueqk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <g7xkdervsknmcwjg4qgloj643b4itjlfeyiipvsrborszgrhlg@zrp65nvfueqk>

On Tue, 16 Sep 2025, Bjorn Andersson wrote:

> On Thu, Sep 11, 2025 at 11:01:00AM +0200, Hans de Goede wrote:
> > Hi Lee,
> > 
> > On 11-Sep-25 10:15 AM, Lee Jones wrote:
> > > On Wed, 10 Sep 2025, Aleksandrs Vinarskis wrote:
> > > 
> > >> From: Hans de Goede <hansg@kernel.org>
> > >>
> > >> Add 'name' argument to of_led_get() such that it can lookup LEDs in
> > >> devicetree by either name or index.
> > >>
> > >> And use this modified function to add devicetree support to the generic
> > >> (non devicetree specific) [devm_]led_get() function.
> > >>
> > >> This uses the standard devicetree pattern of adding a -names string array
> > >> to map names to the indexes for an array of resources.
> > >>
> > >> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > >> Reviewed-by: Lee Jones <lee@kernel.org>
> > > 
> > > Remind me why this can't go in through LED again?
> > 
> > I don't think anyone has discussed how to merge this yet.
> > 
> > I believe that the LED tree is the correct tree to merge this
> > entire series through, once the DT bits have been reviewed.
> > 
> 
> Unless there are some strong reasons (that I'm failing to spot), we
> should merge the DeviceTree binding and implementation through the LED
> tree. Then I merge the DTS change through the Qualcomm DT tree once the
> bindings are available in linux-next.

1-3 have been applied to the LED tree already.

-- 
Lee Jones [李琼斯]

