Return-Path: <linux-media+bounces-20-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 821B57E7EDE
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3A861C20DD4
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C383B789;
	Fri, 10 Nov 2023 17:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pjbmo7sg"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE6E3AC15
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:40 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5678D39774
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 06:44:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59CA149E;
	Fri, 10 Nov 2023 15:43:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699627418;
	bh=UISHIKeHR+g2RiPJ/cvuV9G/gFYV7Mo42HPX2n7CjTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjbmo7sg0W1akJQ4D/h+nFCCNHW9+tOZtZSMwgzSvMIyjYRrIRpwlSiGwHzYP4Uff
	 q9oZs4pLuFFAvRZ5H+XBTzjN9mOw7H4R98My/ObQBx/OwpkVAo7OCtPQ6SziGrQH6H
	 3isDlDoLFOxmUoludM0HqpSNSKx13mqjvkHpU9sw=
Date: Fri, 10 Nov 2023 16:44:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 2/6] media: v4l: cci: Add driver-private bit definitions
Message-ID: <20231110144407.GA21167@pendragon.ideasonboard.com>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231110094705.1367083-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Nov 10, 2023 at 11:47:01AM +0200, Sakari Ailus wrote:
> Provide a few bits for drivers to store private information on register
> definitions.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-cci.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> index f2c2962e936b..b4ce0a46092c 100644
> --- a/include/media/v4l2-cci.h
> +++ b/include/media/v4l2-cci.h
> @@ -33,6 +33,12 @@ struct cci_reg_sequence {
>  #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
>  #define CCI_REG_WIDTH_SHIFT		16
>  #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
> +/*
> + * Private CCI register flags, for the use of drivers.
> + */
> +#define CCI_REG_FLAG_PRIVATE_START	28U

Could we name this CCI_REG_PRIVATE_SHIFT, like we do for WIDTH ?

> +#define CCI_REG_FLAG_PRIVATE_END	31U
> +#define CCI_REG_PRIVATE_MASK		GENMASK(CCI_REG_FLAG_PRIVATE_END, CCI_REG_FLAG_PRIVATE_START)

CCI_REG_FLAG_PRIVATE_END isn't used in the rest of the series, so I
would just write

#define CCI_REG_PRIVATE_MASK		GENMASK(31, 28)

for consistency.

>  
>  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))

-- 
Regards,

Laurent Pinchart

