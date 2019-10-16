Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A10ED8CFB
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 11:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404339AbfJPJx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 05:53:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36338 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404266AbfJPJx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 05:53:58 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8361443E;
        Wed, 16 Oct 2019 11:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571219635;
        bh=gjcnDXgTaHH8i0rQWIk9tmPvMqWjkUNsCfrg0iTzX/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BjNRpsJlVWhEN2gh2yeS7XLz3wM+GhoW+gTtqVPxOvthF6gcJDbUAfd6owFXi7IBC
         M+7+h31pY9s8i/nlfZWjSj92dvu1HLAOw+5QWPHnmHlrS1q1wmxsFBuIw33JDUOugs
         o9CqGq9H5Oy1FnBCXb+66ZIBJfklmfTCCa8cK9ws=
Date:   Wed, 16 Oct 2019 12:53:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hariprasad Kelam <hariprasad.kelam@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: make use of
 devm_platform_ioremap_resource
Message-ID: <20191016095352.GA5175@pendragon.ideasonboard.com>
References: <1570517752-30991-1-git-send-email-hariprasad.kelam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1570517752-30991-1-git-send-email-hariprasad.kelam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hariprasad,

Thank you for the patch.

As the patch only touches the omap4iss driver, you could have made the
subject line a bit more specific, for instance "staging: media:
omap4iss: Use devm_platform_ioremap_resource". No big deal though.

On Tue, Oct 08, 2019 at 12:25:51PM +0530, hariprasadKelamhariprasad.kelam@gmail.com wrote:
> From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> 
> fix below issue reported by coccicheck
> drivers/staging//media/omap4iss/iss.c:915:1-15: WARNING: Use
> devm_platform_ioremap_resource for iss -> regs [ res ]
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>

The change looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree for v5.5.

> ---
>  drivers/staging/media/omap4iss/iss.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index 1a966cb..6fb60b5 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -908,11 +908,7 @@ static int iss_map_mem_resource(struct platform_device *pdev,
>  				struct iss_device *iss,
>  				enum iss_mem_resources res)
>  {
> -	struct resource *mem;
> -
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, res);
> -
> -	iss->regs[res] = devm_ioremap_resource(iss->dev, mem);
> +	iss->regs[res] = devm_platform_ioremap_resource(pdev, res);
>  
>  	return PTR_ERR_OR_ZERO(iss->regs[res]);
>  }

-- 
Regards,

Laurent Pinchart
