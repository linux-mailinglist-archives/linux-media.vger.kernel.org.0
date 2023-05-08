Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABBF6FA3DE
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 11:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233802AbjEHJwh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 05:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjEHJwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 05:52:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA602383F
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 02:52:29 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F54E755;
        Mon,  8 May 2023 11:52:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683539541;
        bh=WRoyyHNXdOqKkUnjM+j6duDCHLrqy5y32z8AIdOSDK4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=U097UEewQUeQMfPMDFwSm+zvUY2ssRfh8zgEw3BJi8K11tHk/4WT9mhN6ZN503yoj
         +b3bUKNt0F6N1zkZzZbAF41oyNb5HsEhbAyk/jPJnCFEzLHwjtwsblAiPDiW045D+H
         ZhWVoT6haLD5PzACJVO86vjT4/+Ig7hQ3atgIbsQ=
Message-ID: <e41293d2-2b2b-1c3a-e3e9-1384369b1fcc@ideasonboard.com>
Date:   Mon, 8 May 2023 12:52:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 1/7] media: mc: Add INTERNAL_SOURCE pad type flag
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-2-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230505215257.60704-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/05/2023 00:52, Sakari Ailus wrote:
> Internal source pads will be used as routing endpoints in V4L2
> [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> 
> Also prevent creating links to pads that have been flagged as internal.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../userspace-api/media/mediactl/media-types.rst          | 7 +++++++
>   drivers/media/mc/mc-entity.c                              | 8 +++++++-
>   include/uapi/linux/media.h                                | 1 +
>   3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> index 0ffeece1e0c8..c724139ad46c 100644
> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
>   .. _MEDIA-PAD-FL-SINK:
>   .. _MEDIA-PAD-FL-SOURCE:
>   .. _MEDIA-PAD-FL-MUST-CONNECT:
> +.. _MEDIA-PAD-FL-INTERNAL-SOURCE:
>   
>   .. flat-table:: Media pad flags
>       :header-rows:  0
> @@ -382,6 +383,12 @@ Types and flags used to represent the media graph elements
>   	  when this flag isn't set; the absence of the flag doesn't imply
>   	  there is none.
>   
> +    *  -  ``MEDIA_PAD_FL_INTERNAL_SOURCE``
> +       -  This flag indicates an internal pad that has no external
> +	  connections. Such a pad may not be connected with a link. The internal

"must not"? Or "shall not"?

  Tomi

