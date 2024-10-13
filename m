Return-Path: <linux-media+bounces-19516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D241B99BA53
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 18:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 100B01C209B2
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 16:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C1E1487ED;
	Sun, 13 Oct 2024 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bR+1dp+G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF17414831D;
	Sun, 13 Oct 2024 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728836673; cv=none; b=hGoto7rTJ04ldgoeF1eXogAjpqAmRLh6pi2IfHY4GQ3r9q1thzg+a9d7OhH13bvA58ZFaL5GVCkOjc4zOHx0pa6AVPVmQtX+O2PaMsO9Nxy2NU+BJ2/eVe790dg2bGsxlzHcl0JCM86k/mYOp5sZU2ERU3Q7slJjwnWoD50MGXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728836673; c=relaxed/simple;
	bh=NE4FbCOloT4eH5vN817TuK0z5R9di0EBvDq7W5Sn73U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVTzrLq0uBkJNbryKIsQTWMmG4vLXU1vulZuy/wFz/UOoyxW6Y+JPeWWGNfvwpfFmnRThigzsWfW2yavq6KITy2DxG0FuxuI//L9AKTdqaYWt85ZIVO7eRUJ929NdF42/wj9xKTwuSUpk8gMX7AieY5qKvc6bUG+4K2jb48kP6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bR+1dp+G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [23.233.251.139])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7336882E;
	Sun, 13 Oct 2024 18:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728836569;
	bh=NE4FbCOloT4eH5vN817TuK0z5R9di0EBvDq7W5Sn73U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bR+1dp+GIl4PTHoXhkmQCE84uMDZH/Q2T+6RZ4g3kURHmZopOTYzTdcN2oMeWhWOD
	 HadkG+VNrP13ODUJLVxGfFywRvsbmlqjBuO2g3DOy0UQdjI7Zr8ZbEmSHHu/DPgERJ
	 iLZX78BCmGGP0ON4E5+AVGom+DZA1iFZ2M0jvajE=
Date: Sun, 13 Oct 2024 19:24:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, jacopo@jmondi.org, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.d,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP
 ISI compatible string
Message-ID: <20241013162422.GE5212@pendragon.ideasonboard.com>
References: <20241012084732.1036652-1-guoniu.zhou@oss.nxp.com>
 <20241012084732.1036652-3-guoniu.zhou@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012084732.1036652-3-guoniu.zhou@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Sat, Oct 12, 2024 at 04:47:35PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Add the compatible string support for i.MX8ULP ISI.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index 4d5348d456a1..f43b91984f01 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -21,6 +21,7 @@ properties:
>      enum:
>        - fsl,imx8mn-isi
>        - fsl,imx8mp-isi
> +      - fsl,imx8ulp-isi
>        - fsl,imx93-isi
>  
>    reg:
> @@ -75,6 +76,7 @@ allOf:
>            contains:
>              enum:
>                - fsl,imx8mn-isi
> +              - fsl,imx8ulp-isi
>                - fsl,imx93-isi
>      then:
>        properties:

-- 
Regards,

Laurent Pinchart

