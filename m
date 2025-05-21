Return-Path: <linux-media+bounces-32988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE8ABECB4
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 09:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7C43BC343
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 07:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A4723504B;
	Wed, 21 May 2025 07:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX/Xe6te"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C922B8C3;
	Wed, 21 May 2025 07:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811098; cv=none; b=FyY2rwm1p8OGx80sI+vuYdFQdSMIyoPpsNfLN2v+WLbFxnYUkM4QsZtQzrAQ94GUx2uUQnx+pccc8v1afvxAZ3TpBlBxArQii01CY+AEals616kJW3U2fVnw2Z/HDMUcS4/EGymIbhGAa73vg/014vhopWCJdWDTm6bSq1/CYio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811098; c=relaxed/simple;
	bh=3WyxaI7kOIbqwbUBNGQKfpf2rboaU9CMQfWTBnce4gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kw/4dcvE3Q/aAppcwVXIFS8rsKZqjAgrLdliYLWl3TuWFoQL3EAo6I6q7kqf/0gI1yDLW2F0mO+aqvib+NehbqvQIeEH+e9rAmPtQUdaocyckxwh2XtygRZBE+p46Xjd1r2vsAJioNwVKJIU1PKSI0zi5pHueLdRQBX5AxJtbt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX/Xe6te; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D201C4CEEB;
	Wed, 21 May 2025 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747811098;
	bh=3WyxaI7kOIbqwbUBNGQKfpf2rboaU9CMQfWTBnce4gM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HX/Xe6teP17NbDLbbn6o4ACl9/mOPm4fZAiU5uUkw51WDT1RRPyogO2dqn8nd780B
	 gMneD4I9yN1G3DDNl38Osg9WOY5jwGnv7PiF3LPVyHNwruBJ8BlQZg62EVKqJVlgV5
	 7NQuYLY0L2VxUjjfYqIgGrWX2MEJ1/2Id+FFyE7zmtiEV0cnNcondaYGs3mn6DAJsT
	 CZ9LlmgFongU+ekVRBEu3ohhvVuKE9uKS9j64pfAuNM6NkiNdmoniundRoNUedZIt2
	 rjHeGSWgOLdJcKtHtUNaqKf+GKCSYO4p7fVb2iKjlRmAXmNLBRkJuBJ12d2nvzM2lP
	 iWK9waSnZVgLw==
Date: Wed, 21 May 2025 09:04:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 02/12] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgenc compatible
Message-ID: <20250521-handsome-primitive-goose-1cbbab@kuoka>
References: <20250521022322.27576-1-kyrie.wu@mediatek.com>
 <20250521022322.27576-3-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521022322.27576-3-kyrie.wu@mediatek.com>

On Wed, May 21, 2025 at 10:23:12AM GMT, Kyrie Wu wrote:
> Compared to the previous generation IC, the MT8196 uses SMMU
> instead of IOMMU and supports features such as dynamic voltage
> and frequency scaling. Therefore, add "mediatek,mt8196-jpgenc"
> compatible to the binding document.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8195-jpegenc.yaml           | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


