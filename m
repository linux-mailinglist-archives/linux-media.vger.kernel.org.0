Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6CB36A74
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 05:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfFFDXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 23:23:00 -0400
Received: from merlin.infradead.org ([205.233.59.134]:58916 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfFFDXA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 23:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=eTKFnj9H2RVEXyHnZL/5VHqft4gx9JgIxSrqJOjMisA=; b=A3jcvPmm/Xrh+DcE6WHP+Tpb9j
        OldZpRzlkj4yuOxPMg0/dHTyYWgqsP48pnC22j1T2BE/ZDDLYh8o8M/T2RFm45/rmIUdrBx+XIDA3
        kUfAnZIi/LK0qNp1DUfwkHLErNyGGDmY5/B9JhkYqRyA/IR4S+RfIiPhKTzNMZacx6/rg4W/I9DVB
        tYKheTTdjddaQdvUqyxe7QIYHAXxK5AbZXwwCiROZexyrWo00NThe9CZeLetlR1kRSGm/vu8KsUc7
        /2zyAj9hxYWiQzmOqKfeHfVP9bygG2Bi09VyFYmw8ER48RDuHetdawM3V7YnQTQ0V6a0HMUDIL52i
        4T7hNIMA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hYizR-0004Ol-3b; Thu, 06 Jun 2019 03:22:57 +0000
Subject: Re: [PATCH 1/2] media: v4l2-core: Shifting signed 32-bit value by 31
 bits error
To:     Shuah Khan <skhan@linuxfoundation.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se, ezequiel@collabora.com,
        paul.kocialkowski@bootlin.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1559764506.git.skhan@linuxfoundation.org>
 <bac3ee3b10de409b6cdf7286e0e84737e63662ee.1559764506.git.skhan@linuxfoundation.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8cc03625-f41d-6009-d50c-823e5f498dca@infradead.org>
Date:   Wed, 5 Jun 2019 20:22:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <bac3ee3b10de409b6cdf7286e0e84737e63662ee.1559764506.git.skhan@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/5/19 2:53 PM, Shuah Khan wrote:
> Fix the following cppcheck error:
> 
> Checking drivers/media/v4l2-core/v4l2-ioctl.c ...
> [drivers/media/v4l2-core/v4l2-ioctl.c:1370]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 6859bdac86fe..333e387bafeb 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1364,7 +1364,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  					(char)((fmt->pixelformat >> 8) & 0x7f),
>  					(char)((fmt->pixelformat >> 16) & 0x7f),
>  					(char)((fmt->pixelformat >> 24) & 0x7f),
> -					(fmt->pixelformat & (1 << 31)) ? "-BE" : "");
> +					(fmt->pixelformat & BIT(31)) ? "-BE" : "");
>  			break;
>  		}
>  	}
> 

If this builds, I guess #define BIT(x) got pulled in indirectly
since bits.h nor bitops.h is currently #included in that source file.

Documentation/process/submit-checklist.rst rule #1 says:
1) If you use a facility then #include the file that defines/declares
   that facility.  Don't depend on other header files pulling in ones
   that you use.

Please add #include <linux/bits or bitops.h>

-- 
~Randy
