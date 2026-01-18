Return-Path: <linux-media+bounces-50972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1FBD393D8
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 11:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C62630049CF
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 10:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092D52DE6F1;
	Sun, 18 Jan 2026 10:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6wuDEGz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C1027FB1F;
	Sun, 18 Jan 2026 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768731038; cv=none; b=YJi9IOdzw+kfeBJb2+EF/voVlXAljVmpa8LqgOf8+GyHQVNPyVNc2jA6QHmH/WuSRkPJVWgvCfH5mSC91c66PHy/EbSoufvgaduW7Qod7T3iC0lFuDSdage92DiA0Uaf60soz341xXqpz0S6ObvhY5nBLjpPxYcWgpOm5yUVpXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768731038; c=relaxed/simple;
	bh=D7d35ddE1MELKfbo53AGgmr9TOYdjIjWD9lI/+jEEhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2Dbwqoh1gAKCNPm72SZ7V3tfZjsAvlAK2vGzeJYt46Ub5DfD8kG/yJkSXMveNFE1toKWweWg01prz15ExhNyIE76yfJPu++qC7B7Lq1It4EGL/5PZSNoywIpdJVo/y+BkuaLsVTfvawXfAX8XgcQhPaf+yiFwAzMx4YhJnLDgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6wuDEGz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB59C116D0;
	Sun, 18 Jan 2026 10:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768731038;
	bh=D7d35ddE1MELKfbo53AGgmr9TOYdjIjWD9lI/+jEEhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B6wuDEGzp2GTBCBZVplDzoAE971e8e55XKJYlrwd72QZWxst72ach4DCQ2lUUVIbg
	 QA0xQq+Ln6AFmLiY5eGd14yAVkE8jr935VSNaGusD1DCzl0rW+atnndMcymEdSjdBz
	 9rspy9iCefZUarY46jfhvmKafXUH441y8HcnA0Xn+iyJxX8mI+csBuFMEnqdgNGMGw
	 RV9DHTA4YjKPpJqWLXm85nQ+n9YoeHiE2/hdPGHH2OQJshN2VViNvhWEtTvNIrLx7v
	 402D461ZiyfU76cX0ALnX0qlOv/0gZNcir2JT9X6WD/0RPOUDmZM2HWZyhK3l5SFl7
	 gadeifixAgz4A==
Date: Sun, 18 Jan 2026 11:10:35 +0100
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
Message-ID: <20260118-fearless-viridian-lizard-1f6a86@quoll>
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
> 
> Link: https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/
> Acked-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  .../bindings/media/starfive,jh7110-camss.yaml      | 180 ---------------------
>  MAINTAINERS                                        |   1 -
>  2 files changed, 181 deletions(-)
> 

Please revert the order of patches when applying.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


