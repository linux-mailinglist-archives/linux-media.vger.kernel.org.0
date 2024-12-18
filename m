Return-Path: <linux-media+bounces-23689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBE79F60A3
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 10:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF16C18956DA
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 09:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4B719340E;
	Wed, 18 Dec 2024 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZDImDzB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16999156879;
	Wed, 18 Dec 2024 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512485; cv=none; b=MPp+qa0l+MZx0XkuuHUuaesPgpa5P93zvc3QKdrfHCbeY+5K6T29zjxSuUXPJl/CJjQ7VwAAK5CvhHaYw33uSw5Y4keFCpYXcg8xJoCWoR+iJ6/dH0q/g2cqPyktz/RkT4/HHiKT4jgTPM2XfO2n/kpeJf+ODyFdgEj3C64ev38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512485; c=relaxed/simple;
	bh=UkhrEcQSxGpaSlOo+Yxh6CLOUTDPmvf5xbmljZZ9rKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqGgjPIKb3HKFjR+2yWCq9n4wSXRcMNa4iEgMy8tUJHp/qpG/A7GZJbytRodcmxFZbyIRJrw7bTe1ZZT5cfs3FLtg0aElLa2RLUEQG0sxF5GfkQG2MsKeoCyczB7NBcjD2Jvvc73Tk2Vm52LIeoNEOLYJUeBWRDyq+BgzvuIVrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZDImDzB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DEBC4CECE;
	Wed, 18 Dec 2024 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734512484;
	bh=UkhrEcQSxGpaSlOo+Yxh6CLOUTDPmvf5xbmljZZ9rKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZDImDzBuyS62sQVCVCGL9NSn5ZxxhwDnYQETEWRx1hVBVH1b8P3RATQ9CcKUF6pw
	 TAWvHC7kpuRgQ7gol2gP9GrVC371fasHgomdpUDx2ZLgq9MfrBk1hjpwYyTlDUk4Jg
	 f+eKfYkD1PdlAZ8y+Tkpe+iMRcoI6XTuE5znv4YiL8sdI+MdgcNVH719qYkuvW7b2H
	 qJqVy2WH1SK26gWnMIMr/aQOO6NmT9WwYqLTSgBQfLATRVPwydBSE0KnSvJsXClfJi
	 edmndmMTte/G+htgFvYdR2DFL+NyDoxNKzK+SniI91YyedD6rT7PwlIZCCgD82B8gZ
	 KfxW8FwfM26NQ==
Date: Wed, 18 Dec 2024 10:01:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <x5hka7t2sxeac6nesr5r47s5bmbbiksyvky5hqoelkvaxcuhiy@7fsxv2y7deag>
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
 <20241217-loongson1-nand-v11-1-b692c58988bb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-loongson1-nand-v11-1-b692c58988bb@gmail.com>

On Tue, Dec 17, 2024 at 06:16:49PM +0800, Keguang Zhang wrote:
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - loongson,ls1b-nand-controller
> +          - loongson,ls1c-nand-controller
> +      - items:
> +          - enum:
> +              - loongson,ls1a-nand-controller
> +          - const: loongson,ls1b-nand-controller
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: nand
> +      - const: nand-dma

Are you sure these are separate address spaces?
<0x1fe78000 0x24>, <0x1fe78040 0x4>
spacing/distance of !4 words...

Best regards,
Krzysztof


