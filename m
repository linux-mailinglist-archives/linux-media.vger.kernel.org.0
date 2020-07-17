Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC891223AFF
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 14:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgGQMAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 08:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgGQMAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 08:00:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330D5C061755;
        Fri, 17 Jul 2020 05:00:08 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8293561;
        Fri, 17 Jul 2020 14:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594987206;
        bh=qauw+Sylv5VmNfLyhylTIiE8ucaocn0RjVyCorvGeN0=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=pGag95/RPg/Zevd37woYohP9r4QSPGVVEWDRKKWTgjoDiry+rZVIkhfzPUSlU4b+7
         lKT+CqkUkREH9POnY2/JjD6yIKByhGvMINjItR7JgW2LJceYQ3rIbZQpnmcbotWA1l
         6RkKrRj1Ng/PuFIRqYXzIziAeZqZ0N5qli0DJiek=
Subject: Re: [PATCH 4/5] media/media-entity.h: drop duplicated word in comment
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20200714220553.20294-1-rdunlap@infradead.org>
 <20200714220553.20294-4-rdunlap@infradead.org>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <3babbd98-206b-1fe3-ba4f-8c4128b60a70@ideasonboard.com>
Date:   Fri, 17 Jul 2020 13:00:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200714220553.20294-4-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/07/2020 23:05, Randy Dunlap wrote:
> Delete the doubled word "flag" in a comment.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  include/media/media-entity.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200714.orig/include/media/media-entity.h
> +++ linux-next-20200714/include/media/media-entity.h
> @@ -803,7 +803,7 @@ int __media_entity_setup_link(struct med
>   * @flags:	the requested new link flags
>   *
>   * The only configurable property is the %MEDIA_LNK_FL_ENABLED link flag
> - * flag to enable/disable a link. Links marked with the
> + * to enable/disable a link. Links marked with the
>   * %MEDIA_LNK_FL_IMMUTABLE link flag can not be enabled or disabled.
>   *
>   * When a link is enabled or disabled, the media framework calls the
> 

