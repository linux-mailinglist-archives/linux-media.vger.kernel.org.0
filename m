Return-Path: <linux-media+bounces-12473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C438C8D859C
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 16:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D81B282030
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 14:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B53130487;
	Mon,  3 Jun 2024 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="puVrGSra"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDEC4A12;
	Mon,  3 Jun 2024 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717426655; cv=none; b=cp0hGji7PB+PF/R06SsQOkucp7zG9NbvwVzgvcldyIsI4NkFuebC8cujqDpaD6eVErfPWXdOdy5s13Qbl3T/k+yWPRK+eXaONiCRCqVIuVfXHVEWvviF2IqtQSHU1V5ucKKKJW4js5qNycCZlfDexyI5ptO+6DEdreHRrfzl7Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717426655; c=relaxed/simple;
	bh=XxQOFTFoETaApC1cOL3VI9vHYDh/3zcRncz7EKtboyY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jaJF2jkgqc5Uxkhj5ds4T4WXMImN7kSbixl9K0wP77HxpfGShASuqloPJopwOzBRrOL6xRFQ96GQB+Rm5WlxsleHkFGRPdDVgolgP84blhS77yhoCx5NmVb2PwsjeMYNYN8wIlQ1y8Ok5Hg1+AnoFNYSPCacbqGO2zN0j6glwIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=puVrGSra; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717426651;
	bh=XxQOFTFoETaApC1cOL3VI9vHYDh/3zcRncz7EKtboyY=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=puVrGSraQ2BTNhqJXtmrCAtWWnWOGs84SAif9IB6w1H/VwBBhw/C4RSdSUgieT69D
	 01D2VwK9btyiIcmFQf8JJXJhfjbG2hvER1bSnGGkcCNpOW0ELhoXJVFtNThvFriwO5
	 QqzoVl7/NLPubt7e4aOfJ4pIMtIdbAx3wbZgttEiYyVA/RnIgAjoIwnRkrjvvXgpnD
	 wvyelex7+9RYkhUsct/ljpH1GhEsh6mBG8vvYZgyw+tMsNsAPF7XYNTkdeWu7fO+2v
	 d8lJ8mpP6kQ3SVOw3OcI0OmJGCELXtbiPfTfgPJ3Kst3MUcMuT6VukeGLJLHCtMpBC
	 Z/8yk2gSEh8sA==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1539B378216D;
	Mon,  3 Jun 2024 14:57:28 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] media: mediatek: jpeg: support 34bits
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240327040145.7155-1-jianhua.lin@mediatek.com>
Date: Mon, 3 Jun 2024 11:57:15 -0300
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 matthias.bgg@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <D76FE1CB-1EF9-4F38-8D73-F3E0D7942A6C@collabora.com>
References: <20240327040145.7155-1-jianhua.lin@mediatek.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>
X-Mailer: Apple Mail (2.3774.600.62)

Hi Jianhua,


> + ret =3D of_property_read_u32(pdev->dev.of_node, "mediatek,34bits",
> + &jpeg->support_34bit);
> + if (ret !=3D 0) {
> + dev_info(&pdev->dev, "default for 32bits");
> + jpeg->support_34bit =3D 0;
> + }
> + dev_info(&pdev->dev, "use 34bits: %d", jpeg->support_34bit);
> +

Please use of_property_read_bool instead.


> enc_get_file_size(void __iomem *base, u32 support_34bit)
> {
> - return readl(base + JPEG_ENC_DMA_ADDR0) -
> + u32 value =3D 1;
> +
> + if (support_34bit)
> + value =3D 4;
> +
> + return readl(base + JPEG_ENC_DMA_ADDR0) * value -
>       readl(base + JPEG_ENC_DST_ADDR0);
> }

Please use the ternary operator instead, there=E2=80=99s no need for two =
assignments.

Can you please add a comment inline to explain why this multiplier is =
needed?


> EXPORT_SYMBOL_GPL(mtk_jpeg_enc_get_file_size);
> @@ -75,6 +80,9 @@ void mtk_jpeg_enc_start(void __iomem *base)
>=20
> value =3D readl(base + JPEG_ENC_CTRL);
> value |=3D JPEG_ENC_CTRL_INT_EN_BIT | JPEG_ENC_CTRL_ENABLE_BIT;
> + value |=3D JPEG_ENC_CTRL_RDMA_PADDING_EN;
> + value |=3D JPEG_ENC_CTRL_RDMA_RIGHT_PADDING_EN;
> + value &=3D ~JPEG_ENC_CTRL_RDMA_PADDING_0_EN;
> writel(value, base + JPEG_ENC_CTRL);
> }

These do not have to be gated by =E2=80=9Csupport_34bit=E2=80=9D ?

=E2=80=94 Daniel=

