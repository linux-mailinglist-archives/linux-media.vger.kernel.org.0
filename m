Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23B36B23B2
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjCIMKM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjCIMKF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:10:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7BAE8256
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678363754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sF9cn8IndW3P9AYSj+zwTAJz3uCe69DKAGPLYALHruw=;
        b=E6z8Zf0syFUP4P4DHOVFj6BPmJuH1RrnPqeHCw/A4wseJGyzhKdLSLn90GftRHSsSMNPjE
        zpOXt7+7t3A91atnvVnHsGb6FeCTH2hQn1030gyqKXzG8LdzOQ0+ZyIRGDhBF79qqPZpaH
        p7PKbMgOy7PKs/ZUkWGWeZ2CNWIiI3Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-mKQG6ieFO72x_UTAtHHV2Q-1; Thu, 09 Mar 2023 07:09:13 -0500
X-MC-Unique: mKQG6ieFO72x_UTAtHHV2Q-1
Received: by mail-ed1-f72.google.com with SMTP id i22-20020a05640242d600b004f5962985f4so2200784edc.12
        for <linux-media@vger.kernel.org>; Thu, 09 Mar 2023 04:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678363752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sF9cn8IndW3P9AYSj+zwTAJz3uCe69DKAGPLYALHruw=;
        b=pkjsdTFd9FDavIkzmSiI3p4YVM00k0k6XxFKUvbHIRPEoA0Xl3Zq4Qe7zKxRs/gwvA
         zyCtvD0ZFal+4TrwY9VAEIoYewncJcxUbuKJl4/Oy87Ff8UzN29Q6izvVIXRf10O1N91
         L45KwHHKDKAyK5hkK6eiKBts93u+wG5l2DWSjo80Gqz2QizSQDPqBGeaEUuQgZcksDH1
         RrfWs0w7kMPvQk7iJCsXwRBzV+AH0jCU1uNd7oqqmTP2Btu1PYIKBhG4aO7iAyyThroe
         PyaKOg66ZX8iARB2eGPcWw3xFcsrRUpONhylg34wRSwDH7+9OahArZPlpnzz3RWJCjZ5
         v4PQ==
X-Gm-Message-State: AO0yUKWX8Uaf21Zok0abQJQERG4oW5aBYivhhePk69tnGLowfH7l1e/0
        f3MEkbfhVwzvJjnZbZdbgDgAr3xcKtShN7WyyuVJK1jZpSGwLtLf9BeusJ9JRASzEE3bpe+a9ig
        xmmKNfrXoD3QfVUMdjZOPNuQ=
X-Received: by 2002:a17:907:c07:b0:8f4:86a9:748d with SMTP id ga7-20020a1709070c0700b008f486a9748dmr24499453ejc.12.1678363752311;
        Thu, 09 Mar 2023 04:09:12 -0800 (PST)
X-Google-Smtp-Source: AK7set8LDrsBtHhF9F+LJgz8uK5WRFKJZ4QnPBQ6F9d3psuzfrNPNtfai7PDVstovsRSxmkl9S38bA==
X-Received: by 2002:a17:907:c07:b0:8f4:86a9:748d with SMTP id ga7-20020a1709070c0700b008f486a9748dmr24499433ejc.12.1678363752083;
        Thu, 09 Mar 2023 04:09:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090681c500b008d269233bd4sm8735903ejx.204.2023.03.09.04.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 04:09:11 -0800 (PST)
Message-ID: <ba09d1c2-ddca-ff1a-28ae-7c8355f75012@redhat.com>
Date:   Thu, 9 Mar 2023 13:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     tomi.valkeinen@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
References: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
 <20230302202219.846011-1-sakari.ailus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230302202219.846011-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 3/2/23 21:22, Sakari Ailus wrote:
> Link validation currently accesses invalid pointers if the link passed to it
> is not between two sub-devices. This is of course a driver bug.
> 
> Ignore the error but print a debug message, as this is how it used to work
> previously.
> 
> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi Hans,
> 
> Could you test this?

Yes, thank you for the fix.

I can confirm that this fixes the oops on my Surface Go 1 and
that it makes the IPU3 attached cameras work again:

Tested-by: Hans de Goede <hdegoede@redhat.com>

or better just replace the Reported-by with:

Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> The bug is of course in the ImgU driver and this reverts to the old
> pre-streams behaviour. It silently fails instead of oopsing. The ImgU driver
> needs to be fixed and I think we could make this return an error at the same
> time. Right now I can't be sure the ImgU driver is the only one suffering
> from this, but if so, it's likely to be broken anyway.
> 
> - Sakari
> 
>  drivers/media/v4l2-core/v4l2-subdev.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index dff1d9be7841..a6c80096586e 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1224,6 +1224,17 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  	struct v4l2_subdev_state *source_state, *sink_state;
>  	int ret;
>  
> +	if (!is_media_entity_v4l2_subdev(link->sink->entity)) {
> +		pr_debug("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
> +			 link->sink->entity->name);
> +		return 0;
> +	}
> +	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
> +		pr_debug("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
> +			 link->source->entity->name);
> +		return 0;
> +	}
> +
>  	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
>  	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
>  

