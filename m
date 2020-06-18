Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838B01FF313
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 15:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730199AbgFRNaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 09:30:11 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50158 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729047AbgFRNaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 09:30:01 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05IDTwfV100277;
        Thu, 18 Jun 2020 08:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592486998;
        bh=5va+SErevFHXq2MTpWc+Slrv+u6J1iA9q+8UrxyMzso=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=eecemE88YoMXc3DqpbxdciJJDRemT5z79LdJbGb4As3NYCVgohClbNiyKhtqzo5+5
         RJMWSRg2DACi+6ORgOjgIxtbfx2g3EfXVyptiwxxlIPtTndJvPm/K5ZIUNIwlIJ75m
         IBlIJ3sx05iztjB/CTzzbOW7y/35coY/KDqpsBfU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05IDTwWr074409;
        Thu, 18 Jun 2020 08:29:58 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 18
 Jun 2020 08:29:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 18 Jun 2020 08:29:57 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id 05IDTtpw075964;
        Thu, 18 Jun 2020 08:29:56 -0500
Date:   Thu, 18 Jun 2020 08:29:55 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 008/107] media: ti-vpe: cal: Turn
 reg_(read|write)_field() into inline functions
Message-ID: <20200618132955.ozbx3heo6a5tas3m@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-9-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200614235944.17716-9-laurent.pinchart@ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the patch.

Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote on Mon [2020-Jun-15 02:58:05 +0300]:
> Turn the reg_(read|write)_field() macros into inline functions for
> additional type safety. Use the FIELD_GET() and FIELD_PREP() macros
> internally instead of reinventing the wheel.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index fa86a53882cc..8c068af936f0 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -6,6 +6,7 @@
>   * Benoit Parrot, <bparrot@ti.com>
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> @@ -76,13 +77,6 @@ static const struct v4l2_fract
>  #define reg_read(dev, offset) ioread32(dev->base + offset)
>  #define reg_write(dev, offset, val) iowrite32(val, dev->base + offset)
>  
> -#define reg_read_field(dev, offset, mask) get_field(reg_read(dev, offset), \
> -						    mask)
> -#define reg_write_field(dev, offset, field, mask) { \
> -	u32 val = reg_read(dev, offset); \
> -	set_field(&val, field, mask); \
> -	reg_write(dev, offset, val); }
> -
>  /* ------------------------------------------------------------------
>   *	Basic structures
>   * ------------------------------------------------------------------
> @@ -418,6 +412,21 @@ struct cal_ctx {
>  	bool dma_act;
>  };
>  
> +static inline u32 reg_read_field(struct cal_dev *dev, u32 offset, u32 mask)
> +{
> +	return FIELD_GET(mask, reg_read(dev, offset));
> +}
> +
> +static inline void reg_write_field(struct cal_dev *dev, u32 offset, u32 value,
> +				   u32 mask)
> +{
> +	u32 val = reg_read(dev, offset);
> +
> +	val &= ~mask;
> +	val |= FIELD_PREP(mask, value);
> +	reg_write(dev, offset, val);
> +}
> +
>  static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
>  						u32 pixelformat)
>  {
> @@ -453,11 +462,6 @@ static inline struct cal_ctx *notifier_to_ctx(struct v4l2_async_notifier *n)
>  	return container_of(n, struct cal_ctx, notifier);
>  }
>  
> -static inline int get_field(u32 value, u32 mask)
> -{
> -	return (value & mask) >> __ffs(mask);
> -}
> -
>  static inline void set_field(u32 *valp, u32 field, u32 mask)
>  {
>  	u32 val = *valp;

Is set_field still in use then after this patch?
Any reason to keep it around?

Benoit

> -- 
> Regards,
> 
> Laurent Pinchart
> 
