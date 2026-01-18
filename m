Return-Path: <linux-media+bounces-50968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C295AD3935B
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 09:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F942301671D
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 08:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DDA280018;
	Sun, 18 Jan 2026 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i8Jli7Cq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B9F23F431;
	Sun, 18 Jan 2026 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768724891; cv=none; b=FBYuo6Kxp7q8cVrUOI0zABR02rNfAT/1QYs+3IjMStf06WbKHBukCIg3hW4iOW8exuEnvI2uVAtDzhaZCgnjEaeYd1O9fHQBrZyh0kdts2PYUf6KESi5oO9tW03q7PGX/MYTA1lWvYC3pp2rwGPLCt5fW0EBPjKz6XBELdmZieg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768724891; c=relaxed/simple;
	bh=YzC2nIgU2SkXVKyjnbNr9fMH3ByPfPWotj5jRbKgvvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obuz8w+2m5LjgoWBA7HiMfB3LoSWJEKS0NfIAfIUNb7mp77XF3KxAtZLSgsyGPRUelKcymGsPBEzZ75AMOhzt6ONsUvcHlBeZptwekCu32ASKmvRitOjt+vXakGx4aSTmnKnGlqyyTrMwl4UCBKVZlU2OEpQghbdTGdGnL7ZIL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i8Jli7Cq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8490646F;
	Sun, 18 Jan 2026 09:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768724851;
	bh=YzC2nIgU2SkXVKyjnbNr9fMH3ByPfPWotj5jRbKgvvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8Jli7CquJ+rdQjuvxarifX3qqhU4TbQUOU5MmUpcqnJEzAgsZZJAVMc2wq8YXbRa
	 BbKl2TFEdcZUDzNEGkT0n2uttLglX/YyGANzvXY0wD2+1DHcoiLSChkZmQCkNb4PH9
	 89bBN+8wvMfaJulNUmOLkyjyOyxGHyAoWgBXE9T0=
Date: Sun, 18 Jan 2026 10:27:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Drop starfive,jh7110-camss
 from staging
Message-ID: <20260118082739.GA20659@pendragon.ideasonboard.com>
References: <20260116-drop-starfive-camss-v2-0-34df57025921@ideasonboard.com>
 <20260116-drop-starfive-camss-v2-1-34df57025921@ideasonboard.com>
 <20260117-bulky-speedy-kagu-faee94@quoll>
 <8881acaf-3233-44a3-aa55-bb1236a7cc91@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8881acaf-3233-44a3-aa55-bb1236a7cc91@kernel.org>

On Sat, Jan 17, 2026 at 12:38:21PM +0100, Krzysztof Kozlowski wrote:
> On 17/01/2026 12:36, Krzysztof Kozlowski wrote:
> > On Fri, Jan 16, 2026 at 12:36:58PM +0530, Jai Luthra wrote:
> >> The starfive-camss driver is no longer being worked upon for destaging,
> >> and will be dropped in a subsequent commit, so drop the DT bindings.
> > 
> > That's a moderately new SoC and commit was added ~2 years ago. Why is
> > this being dropped exactly?
> 
> OK, the link below gives some answer but isn't this better just to mark
> it orphan and keep for some time? Is the driver working/useful? Maybe
> someone will volunteer for it?

It's in staging, nobody has registered any interest, the company behind
the hardware as publicly said they won't continue development, and
there's no documentation. I think that meets the bar for dropping the
driver. In the very unlikely case someone would want to revive it, the
source code will live in git history.

> >> Link: https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/
> >> Acked-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> >> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > 
> > Reverting/dropping changes is always in reverse of introducing them, so
> > this must be second commit. Otherwise your change is non-bisectable and
> > you have now warnings of undocumented ABI.

We can easily do that when applying.

-- 
Regards,

Laurent Pinchart

