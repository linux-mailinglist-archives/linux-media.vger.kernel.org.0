Return-Path: <linux-media+bounces-31140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A0EA9E8C7
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46E653AB111
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 07:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23BF1DB356;
	Mon, 28 Apr 2025 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/xoAUJ4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040E43C3C;
	Mon, 28 Apr 2025 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745823879; cv=none; b=AgiG9RySrVlrajxrXkkuW2MFkDVZQZSC2rP5QPeLzwNNPlAaiJ315RDD3c71tl7BdYlpWqwsJozFYpL90TJK3/1IBDYQ23Pm4Rw04dq8AT0+7KRNTSmTYHJjmt44p0DjYATkdZhMo9lBo1N5OUKRDcV42iTrVriQ+y5Uy3X2AWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745823879; c=relaxed/simple;
	bh=ksWJoUKCRMosr0m1b32vuD5ejeinFrZWyYqhNBswWbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdYYu7dKsL2yRMQU5ednlOfj92d7/ANd0LQ1jvn6Mzc5VlOZMLCfeQXnlJKw/+4jUoLBbVgL7IDwZfhw55DvqeYnhqB0RXK6YP9iArz9S3Lohno8NGfxp2vvGc3Onnwqo1ANohUnJ9zdy9VXarnxucz8iT2PXLNeY5m+akJ+7oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/xoAUJ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B8CC4CEE4;
	Mon, 28 Apr 2025 07:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745823878;
	bh=ksWJoUKCRMosr0m1b32vuD5ejeinFrZWyYqhNBswWbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/xoAUJ4LZPVh5VizqyD3gbO2s09ZDqU1wPh19+oMmyWWojlL8mKFDkxa+Q15oMeI
	 L1dEd/V0AiS3KoRjxjxup80+QASz5RbQWHuKcFoi4bLqYFWwDH5PX7wK6I4RmdH0f+
	 fip6+xAr9ioYGWoHoxyuEQYI8GDDSY2zFzrm41Kskh77Eyw9l9g+iVZpQn6QvMtUk0
	 fiujIG4CskPuW5SX8Af/PcxP/h92disrCm/HeFOXwPrO64zDCQjOTtNEE9sgTb02cx
	 bTKhfx0BPxA+F5QMF6Kz5iF8GnoJOJsC0cx1mRA52jWTK2VblPZ9jLCHz3KsjPvls/
	 oxUWl/VMDOeeg==
Date: Mon, 28 Apr 2025 09:04:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 01/12] dt-bindings: media: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Message-ID: <20250428-ambitious-deer-of-plenty-2a553a@kuoka>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
 <20250425085328.16929-2-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425085328.16929-2-kyrie.wu@mediatek.com>

On Fri, Apr 25, 2025 at 04:53:17PM GMT, Kyrie Wu wrote:
> Compared to the previous generation IC, the MT8196 uses SMMU
> instead of IOMMU and supports features such as dynamic voltage
> and frequency scaling. Therefore, add "mediatek,mt8196-jpgdec"
> compatible to the binding document.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

I gave you a link to the exact part of documentation about prefixes to
read. I do not see improvements, so I do not believe you read it. I could
imagine people skip reading entire doc (who would listen to the
reviewer, right?), but if I give direct link to specific chapter and
still not following it, makes me feel quite dissapointed.

Best regards,
Krzysztof


