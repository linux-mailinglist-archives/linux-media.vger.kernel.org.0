Return-Path: <linux-media+bounces-21521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E13F39D0F5B
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 12:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5CAD28353A
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 11:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE9E198E79;
	Mon, 18 Nov 2024 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aWE4QKXk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0549D198A11;
	Mon, 18 Nov 2024 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731928384; cv=none; b=WsfIP50utsyYiFxGWBE1/ImGVz4f6THER6OJX2t+LyttVDdYEDu2rqpdBcBqKU1j56vhznEMBF+xXzMlZch4GzhjRmSqHcYiRmOlO2OhDAFZvnPgRUPqqwMLAFod8275T3UT1Nuj2RPq5gcSoguzkG8FbchtpMJ2FGywUZS9MuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731928384; c=relaxed/simple;
	bh=9FZtUrLxgITXxMZ87S63LEQHrA/feohoWzEBTJ5kX2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2CNZPMY/5f5Fd22VbEbUQ2HFHu53GzccjORadFYmFR+ACcMEhMOuWFd0D+KDXs6xk4vnsYDLpQz2VZDI5EIV+OCEcvH8jyKWSKN3bA0E5XnR4mjTOoM+wX2hpr3psSnmzZ2DeaBsfjkB3v1J8aO2r+ZA8+zOtQbnlqKi2jFYdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aWE4QKXk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E8795B3;
	Mon, 18 Nov 2024 12:12:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731928364;
	bh=9FZtUrLxgITXxMZ87S63LEQHrA/feohoWzEBTJ5kX2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWE4QKXkEVkAGci1B/4oU48WhnfVRM+9r+GqkCD8E6QpEZCJrTFyfS3SmczquDqxI
	 GRe9hjT+bymWJAg/MWSc4ozlAm1Fhr2hGcVrAdK3nNGsyrEMgohMIIi+RYhsnxrTDl
	 P29fpFbI0nqOnaHbia46POuSs8uZYYltmQF2AvE8=
Date: Mon, 18 Nov 2024 13:12:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: dafna@fastmail.com, linux-media@vger.kernel.org, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 media-next] media: rkisp1: Fix unused value issue
Message-ID: <20241118111252.GL31681@pendragon.ideasonboard.com>
References: <20241118093721.55982-1-dheeraj.linuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118093721.55982-1-dheeraj.linuxdev@gmail.com>

Hi Dheeraj,

Thank you for the patch.

On Mon, Nov 18, 2024 at 03:07:21PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> This commit fixes an unused value issue detected by Coverity (CID
> 1519008). If ret is set to an error value in the switch statement, it is
> not handled before being overwritten later.
> 
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index dd114ab77800..9ad5026ab10a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  			break;
>  		}
>  
> +		if (ret)
> +			break;
> +
>  		/* Parse the endpoint and validate the bus type. */
>  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  		if (ret) {

-- 
Regards,

Laurent Pinchart

