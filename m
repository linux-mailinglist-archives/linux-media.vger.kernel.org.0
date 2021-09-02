Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB613FED7C
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 14:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344113AbhIBMIT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 08:08:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59722 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234081AbhIBMIN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 08:08:13 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C9D2317;
        Thu,  2 Sep 2021 14:07:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630584432;
        bh=csucKKKaebI8zi2+HWw8SH9l9iZHwSFcwgRgPzO91HU=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=uaChDXnSXYzOC76S8Jxtwixm1QKdOBtOYp0skOQOqreeoEaebwu12qpwKlt0axzqK
         hV+YmH8hspy7qF4GIPQihzNys+F1IYCMih1sBIm3D43iTL39Glye4AGcIHrmb+kggA
         ST3LsX8w9Z0O3AR1+N2dF0mPgJLQ+gzERYy2O84E=
Subject: Re: [PATCH] MAINTAINERS: Add linux-renesas-soc mailing list to
 renesas JPU
To:     Cai Huoqing <caihuoqing@baidu.com>,
        mikhail.ulyanov@cogentembedded.com, mchehab@kernel.org,
        kieran.bingham+renesas@ideasonboard.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20210902114641.32370-1-caihuoqing@baidu.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <b646e4a5-e680-2438-5107-456d73871fd0@ideasonboard.com>
Date:   Thu, 2 Sep 2021 13:07:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902114641.32370-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/09/2021 12:46, Cai Huoqing wrote:
> 'linux-renesas-soc' is the mailing list for renesas SOC driver,
> so add it to renesas JPU driver info.

You beat me to it ;-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9de648f49591..3581939fd679 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10042,6 +10042,7 @@ F:	include/linux/jbd2.h
>  JPU V4L2 MEM2MEM DRIVER FOR RENESAS
>  M:	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
>  L:	linux-media@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
>  S:	Maintained
>  F:	drivers/media/platform/rcar_jpu.c
>  
> 
