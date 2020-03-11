Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A9C181B28
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 15:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729309AbgCKO3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 10:29:24 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54693 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729057AbgCKO3Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 10:29:24 -0400
Received: by mail-wm1-f68.google.com with SMTP id n8so2323547wmc.4
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 07:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uLHgIzjARDspW7AaPWyUfxn2AvoCszn7mW3ogUVfK90=;
        b=ceBHs2/cjNl2DIe1sNqz52y4WNb09pz6CJTXKG82Q/SNizDZJb9nRTvD5lca7s70HG
         AiXmXyxsNASWFoc6K+bn+EXTEp3wyDul9UGSZcPAq280+28etFQKROM80QB7avHOnKty
         Se40vC7oi8E8An76EZsJtNQ3SfRWg2vQIIsobnx7Jd8r0gQWC9NPl6xtMgBmAmETQXQR
         Jr2xi+6pbH7HGEz90f4GMn1nR8QOMSqSbL7CrUtqQ9TkNey3VNKvz3YmFZQ1LSfUCGcj
         YIq8GrzZ2W7sIbIHJj7nRaUEx2//Gfy8+l9rswnNUioIS5kdw+2ZCN6lg0liX8oogRA1
         Ju7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uLHgIzjARDspW7AaPWyUfxn2AvoCszn7mW3ogUVfK90=;
        b=WQoE6WLp88qD33GdnoALisoI91JsfOkt/pxEXf2Vc/p947Xj3PIx1OJJlu+WNZuXzH
         GrDorpj4F9UYHw/lBduKHaklUnTP+H/HA27smIN1TxFH5WD9PDEDP9ocjwa91oY+OSFu
         G28CXvxp7FNmVTO/iJ9T89GbwL21T+8t0gTAfDQDhg930DRpGJOFSZim/PWErgfO3w3r
         QCUm8ow4Jqig7kLhgAJ6X1Z75gwOWFUbhfqwd+Uq8aUjmMQ0cq4IKSs4YiH2yf9JXQd8
         zulIy+3/ZMDLFeDfo4WLlVWkvOo9RMxoTjQ+NsOy62UjzocFrx4b1qFlbcBTotNFAuH1
         m5Gg==
X-Gm-Message-State: ANhLgQ0Pcn3vT805t0EAGRzWNediU9BX+rLptUhkU0OkrMQ9YdBhWyge
        m04iBP9PjdUAZMfCFk8+F50=
X-Google-Smtp-Source: ADFU+vuJ0BRRyGAHRNIteumxQxkknsWMFb/omM6SAtn+kQC63ev9yKprFJnD3SuBLVZqkGSDthdelA==
X-Received: by 2002:a7b:c05a:: with SMTP id u26mr4049951wmc.74.1583936961844;
        Wed, 11 Mar 2020 07:29:21 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id r19sm8250364wmh.26.2020.03.11.07.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 07:29:20 -0700 (PDT)
Date:   Wed, 11 Mar 2020 14:29:18 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 10/10] media: imx: imx7-media-csi: Support clamping
 Y10 and Y12 to Y8
Message-ID: <20200311142918.pbaeztyw5jyvord2@arch-thunder.localdomain>
References: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
 <20200310160633.950-11-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310160633.950-11-laurent.pinchart@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
Thanks for this, I think this is the only one I did not acked.

On Tue, Mar 10, 2020 at 06:06:33PM +0200, Laurent Pinchart wrote:
> 10-bit and 12-bit greyscale input data to the CSI can be written as
> 8-bit data to memory. Support this.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index e85202255168..3225082ce58d 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -804,6 +804,14 @@ static int imx7_csi_configure(struct imx7_csi *csi)
>  	case V4L2_PIX_FMT_YUYV:
>  		cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
>  		break;
> +	case V4L2_PIX_FMT_GREY:
> +		if (in_code == MEDIA_BUS_FMT_Y8_1X8)
> +			cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
> +		else if (in_code == MEDIA_BUS_FMT_Y10_1X10)
> +			cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
> +		else
> +			cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
> +		break;
>  	case V4L2_PIX_FMT_Y10:
>  		cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
>  		cr1 |= BIT_PIXEL_BIT;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
