Return-Path: <linux-media+bounces-18004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F4161971CAC
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 16:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BECD1C2309F
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D8B1BAECB;
	Mon,  9 Sep 2024 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0Ycz/s1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C81BA860;
	Mon,  9 Sep 2024 14:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725892439; cv=none; b=qbcnl6RznOFrU7w1+wuLRdlNeAY+QjG6D7po+pBfxfcDi+c8pDwSf0ySorukNlEtuMxKkOZjXBsVmyLEDlGqpTdCKpnIQuxlyoXFL0Sdz7DETzeFKAw1PIdQyq1IbHogfisTrHbqMZSmVpc3s1BQSivpO53hYx1I4dBch8q6dWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725892439; c=relaxed/simple;
	bh=RtpajiZuj/u39ac8g6dIjw/3HD5dPygSYdoHtl3AWhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZAtWmmk7CQmWOH4gCEIZOVuajDwg29YtujOcnZ4cKsixqiRpumhQYOgn1k1Z3gt5CZOdBj9gi0hFKu32AukVm94BXZzERFfrCsKCkYj9IAoRXNu3BEHcui1MYRJMtbUj7L4iWvc8nG0Zs0dxRjU/8uqkVKUKO+9cyRwtiJOazM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0Ycz/s1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1259C4CEC5;
	Mon,  9 Sep 2024 14:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725892439;
	bh=RtpajiZuj/u39ac8g6dIjw/3HD5dPygSYdoHtl3AWhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0Ycz/s12YlDbFfXv3X0AzajlMdyUkvLwNkm4KnkgI86OafztxEq1coEn05aAda/K
	 eTq5E6+tNiJFASvm/tWIy0SILxqxmj3aSOMQaLhoKq1aQlQWEu7YrthgwWgzyIZXHB
	 BZi9sVjF+GD9/ECaRWkqHxNb7HmtwroWc7Ub+RZ41oy9xJqbQ8+I3FTs0HIhACdyaV
	 tSDlXVU67KBjXXLg1Sej9INJulMGXfT5XZCMwKExcvP4OoIh4JchOF4zL+joUL1VOE
	 4EzqaE0NG3mi7PaOZ3aOXBepjKkaahXGb3PKdn40HYMy+fQuEdeop44xn2BehzXmn2
	 SUwh6jqEorTfg==
Date: Mon, 9 Sep 2024 09:33:58 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.au@gmail.com>,
	Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH] media: dt-bindings: renesas,rzg2l-cru: Improve
 documentation
Message-ID: <20240909143358.GA2013-robh@kernel.org>
References: <20240905071803.8920-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905071803.8920-1-biju.das.jz@bp.renesas.com>

On Thu, Sep 05, 2024 at 08:18:01AM +0100, Biju Das wrote:
> Fix the documentation issues pointed by Pavel while backporting
> it to 6.1.y-cip.
>  - Replace 'input'->'inputs' in main description
>  - Replace 'Main'->'main' in CRU main clock description
>  - Replace 'Register'-> 'register' in CRU Register access clock
>    description
> 
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/all/ZtWJqOdRxkBkUb9y@duo.ucw.cz/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/media/renesas,rzg2l-cru.yaml        | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> index bc1245127025..d3c74341febc 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> @@ -13,7 +13,7 @@ maintainers:
>  description:
>    The CRU image processing module is a data conversion module equipped with pixel
>    color space conversion, LUT, pixel format conversion, etc. An MIPI CSI-2 input and
> -  parallel (including ITU-R BT.656) input are provided as the image sensor interface.
> +  parallel (including ITU-R BT.656) inputs are provided as the image sensor interface.

Are there multiple parallel inputs? If not, this change is wrong. The 
existing text is 'a foo input and bar input...'. It could be changed 
to 'foo and bar inputs...' though.

>  
>  properties:
>    compatible:
> @@ -38,8 +38,8 @@ properties:
>  
>    clocks:
>      items:
> -      - description: CRU Main clock
> -      - description: CRU Register access clock
> +      - description: CRU main clock
> +      - description: CRU register access clock
>        - description: CRU image transfer clock

I'd remove "CRU" instead.

>  
>    clock-names:
> -- 
> 2.43.0
> 

