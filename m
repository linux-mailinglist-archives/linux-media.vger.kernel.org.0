Return-Path: <linux-media+bounces-245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6C7E9DDA
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25EFC280E02
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B554D20B03;
	Mon, 13 Nov 2023 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cbNnWvdp"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40031C2B5
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:53:16 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB9618B
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:53:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F75C10A;
	Mon, 13 Nov 2023 14:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699883569;
	bh=FUTr6p87UUOskUi7fXvULjE4qIbiu8x6o3qcYjlFG48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbNnWvdpWCEIOjdzJpaFlCN8EoT8e563rUpHYGkwMg+EDeW6gySZIDNIertqZiWxx
	 8iglpodSD4coLXUqt+C52rj4M+wdyPbZPosB2t9+hyf7S7g96ETOR6qaXnQnGrhnT2
	 EOcz7Z1Xxeok0rO7CCPLfDvFnKzXzlBzBN2HGr6w=
Date: Mon, 13 Nov 2023 15:53:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v2 2/6] media: v4l: cci: Add driver-private bit
 definitions
Message-ID: <20231113135321.GE24338@pendragon.ideasonboard.com>
References: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
 <20231113134458.1423754-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231113134458.1423754-3-sakari.ailus@linux.intel.com>

On Mon, Nov 13, 2023 at 03:44:54PM +0200, Sakari Ailus wrote:
> Provide a few bits for drivers to store private information on register
> definitions.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  include/media/v4l2-cci.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> index f2c2962e936b..ee469f03e440 100644
> --- a/include/media/v4l2-cci.h
> +++ b/include/media/v4l2-cci.h
> @@ -33,6 +33,11 @@ struct cci_reg_sequence {
>  #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
>  #define CCI_REG_WIDTH_SHIFT		16
>  #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)

Should these be unsigned too for consistency ?

> +/*
> + * Private CCI register flags, for the use of drivers.
> + */
> +#define CCI_REG_PRIVATE_SHIFT		28U
> +#define CCI_REG_PRIVATE_MASK		GENMASK(31U, CCI_REG_PRIVATE_SHIFT)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))

-- 
Regards,

Laurent Pinchart

