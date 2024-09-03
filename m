Return-Path: <linux-media+bounces-17455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF13B969874
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 11:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CDB52810F8
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 09:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFF91A3040;
	Tue,  3 Sep 2024 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NVLewLIm"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B47D1C767C;
	Tue,  3 Sep 2024 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725354867; cv=none; b=r0Dd7Jrf6eZUkPF+lwWCph4KeT7v/tj0jS6KlYjQv+fRrJs0rr7Cf2XYQFglh498jIxVAkAU7UXjlSCMu8HtAhS97q2P1j2HTP8CA5gs/ZX4+m6Qem2hVrz1iXXeThfhX/4BJrnehOqci4c6h4/Y/ZW3/kdrEMgpiQCgp/kU1iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725354867; c=relaxed/simple;
	bh=Z+iq6pQpAnUlmLYB3fvLhnqZrJvrth6tuFKVD0jRPKM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8oB0JtihKeVf6WU2pi2Zdmko893BBkJPI0OWf1wy3VFEBqq/tL56c0BlmMLbine16O9tE3Tp0PUZslkHeAFxr5gF5FOLQ+6E9zZouBd+yTOiKUGqV9GdMlyuOMqDMwqYVnAnbzKt7+begAs9Gwx0lIMl56GA1m8GMMKDoQF1/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NVLewLIm; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4839EEMD029493;
	Tue, 3 Sep 2024 04:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725354854;
	bh=lGxRkcTWErgfsKaHOZPHJn/0YfodHMNERSKEXygiM1Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NVLewLImU8nd4+pcvpSi7tDxuxuFTI0V5CqSwkm7n+n4lz2lmKxBlEmEs2Pb6sXhU
	 jABQEzOojukE0r/3kcBbJ5nvmj9AZdjJNgJNsgpokuIxAu38Z+a6SqqFDdccuBt2Qd
	 aIARdTG19Ae0MDkTEBIpH5z++i/W/pfJLvsKK/Zo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4839EEQL054867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Sep 2024 04:14:14 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Sep 2024 04:14:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Sep 2024 04:14:14 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4839EDbv039010;
	Tue, 3 Sep 2024 04:14:14 -0500
Date: Tue, 3 Sep 2024 14:44:13 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Chen Ni <nichen@iscas.ac.cn>
CC: <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: ti: j721e-csi2rx: Convert comma to semicolon
Message-ID: <4nku6uyhn3akjcdkw4bc4oo6ktyjefh6qblpgcmbrozxql4pc6@6kcz6o7hsvt2>
References: <20240903072904.780819-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240903072904.780819-1-nichen@iscas.ac.cn>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Chen,

Thanks for the patch.

On Sep 03, 2024 at 15:29:04 +0800, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 

Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
Reviewed-by: Jai Luthra <j-luthra@ti.com>

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 22442fce7607..d124c1256562 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -1014,9 +1014,9 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  	pix_fmt->height = 480;
>  	pix_fmt->field = V4L2_FIELD_NONE;
>  	pix_fmt->colorspace = V4L2_COLORSPACE_SRGB;
> -	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601,
> -	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE,
> -	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB,
> +	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> +	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
>  
>  	ti_csi2rx_fill_fmt(fmt, &csi->v_fmt);
>  
> -- 
> 2.25.1
> 

-- 
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

