Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F814429FB3
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 10:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbhJLIZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 04:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234501AbhJLIZP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 04:25:15 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B75A2C061570;
        Tue, 12 Oct 2021 01:23:13 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aD40m6YsKk3b0aD44mPZdY; Tue, 12 Oct 2021 10:23:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634026992; bh=IcmG4hlwkywRE0PK6X1+E437tEYrBkwUPVeE4O1mHiY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RCnAujWlRxHBoL1QdKw48WfQpGdxT6iixcng9vb0Xc1Z1wUrLPFQ1mVx9C7flL3a8
         Y7TZllynMNSC9Mvw0HgVf/SUIz2OQieIJ3LmTTLAIHzreKT+aJe968qIOqekjDSLqd
         p9i641lKestJ0hR6dFGgkny/B9rrd6TlRmlj/V+bh441ZYM2AifkLjgnKlxru5Xp7n
         /3JW8PNUlReSH2oWq7bz36bnVcUEY1x0WSsIInhHqAMC7b14d4KNqF4oNSKmBqnrqv
         RvySXj/7O8zdxhcTdmAmo/h9+OdU08NA9H3PnCCK7TlqYTXqa3sNxE2kH8x/rQt1Dy
         zg/yZtjKhOSzw==
Subject: Re: [PATCH] media: Kconfig: Make DVB_CORE=m possible when
 MEDIA_SUPPORT=y
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, yj.chiang@mediatek.com
References: <20211005105110.14082-1-lecopzer.chen@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5086eb11-621f-29ed-e2dd-2a262857b78c@xs4all.nl>
Date:   Tue, 12 Oct 2021 10:23:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005105110.14082-1-lecopzer.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE/P2szUh3UowWLMZqnKxz/PUYZfRHCTaA2A7qVF8Y5nVArKLxkVRNI9niMZUYQjgR2wrx96rDLeiC+F1OrKBhpbh1S2YxkJeEWDEpZR/K9rqsFcGD7i
 xnG4TRY9gW44QLWvk/71efYDqvDpEjIl4g7Eh3/CP6vx+0laTcwJuy/RSIWNHGFHlat5UM+o3zDLPB0Hf7WhgZScMBHlfoWd/9Y6oqNL8PazR/lVE/8bx2YW
 v+GY5T/P0FE7ht0fhuUHSdaccWVgBnRrBHYmqSSFF/DmiyhStMWU1dE0AhU8ZAAgeG8IPwqCmO0+Wp8PniuZrdDVC62qD/iNAnSBXvBRbXAOQ01BXNgL85C7
 63DCnrFp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 12:51, Lecopzer Chen wrote:
> A case that we need VIDEO_DEV=y but DVB_CORE=m, and this doesn't
> work since DVB_CORE is default MEDIA_DIGITAL_TV_SUPPORT and then
> follows MEDIA_SUPPORT.
> 
> Change to tristate to make DVB_CORE=m possible when MEDIA_SUPPORT=y
> 
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  drivers/media/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index b07812657cee..c3baf92b4d02 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -88,7 +88,7 @@ config MEDIA_ANALOG_TV_SUPPORT
>  		will disable support for them.
>  
>  config MEDIA_DIGITAL_TV_SUPPORT
> -	bool
> +	tristate
>  	prompt "Digital TV" if MEDIA_SUPPORT_FILTER
>  	default y if !MEDIA_SUPPORT_FILTER
>  	help
> 

I don't think this is the right approach.

I think the following patch would fix the issue, and it is also in line
with what config VIDEO_DEV does.

What do you think, Mauro?

Regards,

	Hans

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index c3baf92b4d02..46f7b1f75630 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -179,8 +179,7 @@ config MEDIA_CONTROLLER
 #

 config DVB_CORE
-	tristate
-	depends on MEDIA_DIGITAL_TV_SUPPORT
+	tristate "DVB core"
 	depends on (I2C || I2C=n)
 	default MEDIA_DIGITAL_TV_SUPPORT
 	select CRC32
