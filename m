Return-Path: <linux-media+bounces-50944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A39E1D38E42
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 12:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A73B4301F01D
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 11:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490863370F2;
	Sat, 17 Jan 2026 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYiMndyq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC402580E1;
	Sat, 17 Jan 2026 11:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768649813; cv=none; b=C8eN0KlAIg2ssMArD4CNj+D3P9ENprqkw5Y4i+oztFwUAdJ4YtqZd4mxoFH8gFteWqH5ERBXVaJ4nwvAITpvWLb1jXY7fDjj8YoCjRyrevAYSV/OvjH1JIVjhli1eOQTkUjwzcv/TwRvqb9Yb2KTRkstTP2B/YyapPSG2+kbEjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768649813; c=relaxed/simple;
	bh=VjBbKNdlkHKK1MnHdgUeE1D0je5Fkp2iTmuGlL2vdLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rh7CSkcUIsqx/CnrAKn3J/6NpFgrcL7kV0fb554gMelXyQn4X+6aMGXoEemk+AAer899WSMXZExKa62yxopWNJTrNJa7a2IZ5tGvfi8QeRnbmqJ09dpjd1xz8UTh4skFTwcay7Tu4U+BUeWyvcWSU5e7nfc45KE5uizXutsIxJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYiMndyq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CF3C4CEF7;
	Sat, 17 Jan 2026 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768649813;
	bh=VjBbKNdlkHKK1MnHdgUeE1D0je5Fkp2iTmuGlL2vdLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYiMndyqIfA/OktJ1PPVNuhwTFOhCW8rSIm8U+lav+C4kxhnDEiD9AwXIdWAPK3/N
	 lh/H6tbEHrQ4Szq5AIonVaRzgZ2uJF0gilurEF4Uy++dCdKASdCngPMUpiHoBlWChn
	 ZNZZZiIoL8vjZwI4bA0+NARIc1wrMYkEmTG4BUcCCwXUPEgzxkvMkczaJVK2LxQgPu
	 j4ZMnyfTGsQKk/tDNpkM4hZ1Nk7ynwV0JaXbIE5OyyoG1QVzX2GiY36kfIzm8ZtzNa
	 /Uwej7sBnsposL86z35WWxlVpYpmlp7lHbZobnykyTHvoa7ucMUOGZJuNk8ryRKYGF
	 mjbPOPtuETWEg==
Date: Sat, 17 Jan 2026 12:36:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Drop starfive,jh7110-camss
 from staging
Message-ID: <20260117-bulky-speedy-kagu-faee94@quoll>
References: <20260116-drop-starfive-camss-v2-0-34df57025921@ideasonboard.com>
 <20260116-drop-starfive-camss-v2-1-34df57025921@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-drop-starfive-camss-v2-1-34df57025921@ideasonboard.com>

On Fri, Jan 16, 2026 at 12:36:58PM +0530, Jai Luthra wrote:
> The starfive-camss driver is no longer being worked upon for destaging,
> and will be dropped in a subsequent commit, so drop the DT bindings.

That's a moderately new SoC and commit was added ~2 years ago. Why is
this being dropped exactly?

> 
> Link: https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/
> Acked-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reverting/dropping changes is always in reverse of introducing them, so
this must be second commit. Otherwise your change is non-bisectable and
you have now warnings of undocumented ABI.

Best regards,
Krzysztof


