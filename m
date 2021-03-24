Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBDAC34844A
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 23:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhCXWAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 18:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234921AbhCXWA3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 18:00:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39796C06174A;
        Wed, 24 Mar 2021 15:00:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CA20580;
        Wed, 24 Mar 2021 23:00:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616623225;
        bh=Ni2cjB6byd96A2Cn8ugy1SKp31iFzBRuNsiJIlp7FRw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bhpzE40wnj21yXJFYomqATtJeiWAFBZctLIvlwmjinlOpIN/7BR1WLFGR4R3DhGyC
         PDkhlNQ8d+6DgxZvAwLF5r6npzpOZLcD6RFunCNd+Wr87hjlRpjL2l21tXtvbXQXvQ
         9oqycRW6oCcyW6x0U3I7JY+xHbvuZy6zMohuo1ZA=
Date:   Wed, 24 Mar 2021 23:59:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     sakari.ailus@linux.intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org
Subject: Re: [PATCH] media: entity: A typo fix
Message-ID: <YFu2Tk1iffrxvzaQ@pendragon.ideasonboard.com>
References: <20210324132100.18306-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210324132100.18306-1-unixbhaskar@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bhaskar,

Thank you for the patch.

On Wed, Mar 24, 2021 at 06:51:00PM +0530, Bhaskar Chowdhury wrote:
> 
> s/cariers/carriers/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/media-entity.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index cbdfcb79d0d0..a90e2bf6baf7 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -155,7 +155,7 @@ struct media_link {
>   *	uniquely identified by the pad number.
>   * @PAD_SIGNAL_ANALOG:
>   *	The pad contains an analog signal. It can be Radio Frequency,
> - *	Intermediate Frequency, a baseband signal or sub-cariers.
> + *	Intermediate Frequency, a baseband signal or sub-carriers.
>   *	Tuner inputs, IF-PLL demodulators, composite and s-video signals
>   *	should use it.
>   * @PAD_SIGNAL_DV:

-- 
Regards,

Laurent Pinchart
