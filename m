Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C948C2D0862
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728715AbgLFX6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:58:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbgLFX6d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:58:33 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D4548D;
        Mon,  7 Dec 2020 00:57:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607299037;
        bh=QSm/E6q7vVOxUbgsbatzp26B17I1fQagq5MN3nK7sVg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lPEhUDlLwn+waXpxNBHUdtMfISTdy4vAQpPMiKlaCNIRROhYzLbUs84ws8fCgOIv5
         w6HUR64n3cVPeKUePf57VHZPV4+uR0xNB7kdx7p6CpmaDU9J4bu5V47Ye5b14OOnn7
         qn6Yzqz23IyO80W5NZVBJqSe9+ZFvlIWluWUVMs4=
Date:   Mon, 7 Dec 2020 01:57:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ti-vpe: cal: avoid FIELD_GET assertion
Message-ID: <X81v22O9LxsAIUKs@pendragon.ideasonboard.com>
References: <20201203230738.1481199-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201203230738.1481199-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thank you for the patch.

On Fri, Dec 04, 2020 at 12:07:30AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> FIELD_GET() must only be used with a mask that is a compile-time
> constant:
> 
> drivers/media/platform/ti-vpe/cal.h: In function 'cal_read_field':
> include/linux/compiler_types.h:320:38: error: call to '__compiletime_assert_247' declared with attribute error: FIELD_GET: mask is not constant
> include/linux/bitfield.h:46:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    46 |   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
>       |   ^~~~~~~~~~~~~~~~
> drivers/media/platform/ti-vpe/cal.h:220:9: note: in expansion of macro 'FIELD_GET'
>   220 |  return FIELD_GET(mask, cal_read(cal, offset));
>       |         ^~~~~~~~~
> 
> The problem here is that the function is not always inlined. Mark it
> __always_inline to avoid the problem.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This doesn't conflict with the series I've just sent for the CAL driver,
and can thus be applied first or on top. Hans, can I let you handle this
?

> ---
>  drivers/media/platform/ti-vpe/cal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 4123405ee0cf..20d07311d222 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -215,7 +215,7 @@ static inline void cal_write(struct cal_dev *cal, u32 offset, u32 val)
>  	iowrite32(val, cal->base + offset);
>  }
>  
> -static inline u32 cal_read_field(struct cal_dev *cal, u32 offset, u32 mask)
> +static __always_inline u32 cal_read_field(struct cal_dev *cal, u32 offset, u32 mask)
>  {
>  	return FIELD_GET(mask, cal_read(cal, offset));
>  }

-- 
Regards,

Laurent Pinchart
