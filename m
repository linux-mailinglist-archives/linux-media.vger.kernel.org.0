Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33B7223AF9
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 13:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgGQL7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 07:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgGQL7d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 07:59:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD13C061755;
        Fri, 17 Jul 2020 04:59:33 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82400561;
        Fri, 17 Jul 2020 13:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594987170;
        bh=xF/xJDcrJipLnK8pks8U4NEnx0RCjMwVlmOA23tAZic=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=bs6rAoV6BK4ecPn9HeLWpIPYWoRyZhJH3ys2/JX9rqA2Q+HFY+fPejaVP0R03ydRi
         aNv2668HBWSTzbGZW04M7fvnHlZxDyB5k+hnoQwdpu6+68A4VXS4Q/czvnkXIRRy9K
         Yr4Jzey15aObbdba6elVp4NZSjn6odTNPxOZgrBQ=
Subject: Re: [PATCH 1/5] media/media-device.h: drop duplicated word in comment
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20200714220553.20294-1-rdunlap@infradead.org>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <6df0dd2e-b33a-ae7a-6584-58a6be7c1675@ideasonboard.com>
Date:   Fri, 17 Jul 2020 12:59:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200714220553.20294-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/07/2020 23:05, Randy Dunlap wrote:
> Delete the doubled word "the" in a comment.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  include/media/media-device.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200714.orig/include/media/media-device.h
> +++ linux-next-20200714/include/media/media-device.h
> @@ -128,7 +128,7 @@ struct media_device_ops {
>   *
>   * Use-case: find tuner entity connected to the decoder
>   * entity and check if it is available, and activate the
> - * the link between them from @enable_source and deactivate
> + * link between them from @enable_source and deactivate
>   * from @disable_source.
>   *
>   * .. note::
> 

