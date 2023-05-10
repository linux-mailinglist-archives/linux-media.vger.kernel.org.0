Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713B56FE412
	for <lists+linux-media@lfdr.de>; Wed, 10 May 2023 20:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235814AbjEJSfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 May 2023 14:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjEJSfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 May 2023 14:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CADF63C01
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683743676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/iU/YWG6JLDsm9YIhsB7LJaDut8Cwu8yDR8xjDvAXcg=;
        b=WlpeB5CaIAqpc1PXLEINmHJkmCtjuhR+JCl/LDAa8Knz+CCRE1el7HkFZl47Z+fam6nO2T
        RlnKtcr8vbZgtAJFxQRGELBb7NY1FjM7QRkINUuunBD1IZ6FusGfH4ZQ0AzRRGr5+F3QGD
        CIDv5FELaIjMMSI356d0NRbP/cqaZDw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-gOYA7TnuOt244xoZQ3YXBA-1; Wed, 10 May 2023 14:34:35 -0400
X-MC-Unique: gOYA7TnuOt244xoZQ3YXBA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-50bc456a94dso7141161a12.1
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 11:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683743674; x=1686335674;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/iU/YWG6JLDsm9YIhsB7LJaDut8Cwu8yDR8xjDvAXcg=;
        b=bfT5BWeM3rzfzhIYa1l2BoKYLbW2iN2heby1/PPTOQcniN90o61BRwV42low4IKkW9
         2ajDjJhhnL1q3beyfKHoFQumpbo2fm5aVq+aFmFeBNa90S9upZHP0I3nZg9b0w6mi4qd
         lPvFImVvzo2ZFL4GmXrVsJepE4rb+mIOfDLVWMDmXzDnjU0XEiici4q9iQyLFd1FRdQX
         IbtDBbDkYcOVcMRgrMijWxniMBiyZhh/rEnKEaIiorDrDOWTgnmJGo01u36onre3M/X2
         RnnV7XWcwtQN5Q57jO2CxfMntsWNT6ftmFyiqzDippnXwu00ntwaFQ5JIevaH4xBBzdY
         NcWg==
X-Gm-Message-State: AC+VfDwtXSs1euKvWBcslliMGePbJXP+aCVCq0bdxtNhif0qdoYLzH4o
        vQE7kkIPhdRyR7mLXELlf/9tFugop7aCbHsSsjXocdSC27syWr/Qf7V5ImKKGjx9V68e3y4NZEr
        5YIBxY5N2s3M9nCuS6RbWwR0=
X-Received: by 2002:a17:907:3e1d:b0:94e:dd30:54b5 with SMTP id hp29-20020a1709073e1d00b0094edd3054b5mr19182239ejc.6.1683743674283;
        Wed, 10 May 2023 11:34:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5WOGXEy9sVcpQStRmbMON/2R0sniDUjFU0xVPyA22Sel+zGCAdR6lKMI/BSi3TjyXz1XWNlQ==
X-Received: by 2002:a17:907:3e1d:b0:94e:dd30:54b5 with SMTP id hp29-20020a1709073e1d00b0094edd3054b5mr19182221ejc.6.1683743673887;
        Wed, 10 May 2023 11:34:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q17-20020a056402033100b00509dfb39b52sm2186904edw.37.2023.05.10.11.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 11:34:33 -0700 (PDT)
Message-ID: <b718122b-7935-d0e2-4e1d-a09e0943a84b@redhat.com>
Date:   Wed, 10 May 2023 20:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/5] staging: media: atomisp: sh_css_mipi: Remove
 #ifdef 2041
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230508062632.34537-1-hpa@redhat.com>
 <20230508062632.34537-5-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230508062632.34537-5-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kate,

On 5/8/23 08:26, Kate Hsuan wrote:
> The actions of ISP2401 and 2400 are determined at the runtime.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  .../staging/media/atomisp/pci/sh_css_mipi.c   | 65 ++++++-------------
>  1 file changed, 20 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> index bc6e8598a776..52a1ed63e9a5 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> @@ -386,30 +381,22 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>  		return -EINVAL;
>  	}
>  
> -#ifdef ISP2401
> -	err = calculate_mipi_buff_size(&pipe->stream->config,
> -				       &my_css.mipi_frame_size[port]);

Before you changes this code always run ISP2401, now it only runs
when (ref_count_mipi_allocation[port] != 0) is not true.

So this statement should stay here in the code, just prefixed
with a if (IS_ISP2401) condition.

> -	/*
> -	 * 2401 system allows multiple streams to use same physical port. This is not
> -	 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
> -	 * TODO AM: Once that is changed (removed) this code should be removed as well.
> -	 * In that case only 2400 related code should remain.
> -	 */
> -	if (ref_count_mipi_allocation[port] != 0) {
> -		ref_count_mipi_allocation[port]++;
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> -				    "allocate_mipi_frames(%p) leave: nothing to do, already allocated for this port (port=%d).\n",
> -				    pipe, port);
> -		return 0;
> -	}
> -#else
>  	if (ref_count_mipi_allocation[port] != 0) {
>  		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>  				    "allocate_mipi_frames(%p) exit: already allocated for this port (port=%d).\n",
>  				    pipe, port);
>  		return 0;
> +	} else {
> +		/*
> +		 * 2401 system allows multiple streams to use same physical port. This is not
> +		 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
> +		 * TODO AM: Once that is changed (removed) this code should be removed as well.
> +		 * In that case only 2400 related code should remain.
> +		 */

This comment block actually belongs to the if (ref_count_mipi_allocation[port] != 0)
check, the code executed if that check passes was actually different between
the ISP2400 and ISP2401 (my bad, sorry). The ISP2401 case did an extra:

		ref_count_mipi_allocation[port]++;

when (ref_count_mipi_allocation[port] != 0), so we need to add:

		if (IS_ISP2401)
			ref_count_mipi_allocation[port]++;

above the return 0 above.

> +		if (IS_ISP2401)
> +			err = calculate_mipi_buff_size(&pipe->stream->config,
> +						       &my_css.mipi_frame_size[port]);

I have fixed this all up while merging your series and the new
diff for this code-block now looks like this:

@@ -386,9 +381,10 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 		return -EINVAL;
 	}
 
-#ifdef ISP2401
-	err = calculate_mipi_buff_size(&pipe->stream->config,
-				       &my_css.mipi_frame_size[port]);
+	if (IS_ISP2401)
+		err = calculate_mipi_buff_size(&pipe->stream->config,
+					       &my_css.mipi_frame_size[port]);
+
 	/*
 	 * 2401 system allows multiple streams to use same physical port. This is not
 	 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
@@ -396,20 +392,14 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 	 * In that case only 2400 related code should remain.
 	 */
 	if (ref_count_mipi_allocation[port] != 0) {
-		ref_count_mipi_allocation[port]++;
+		if (IS_ISP2401)
+			ref_count_mipi_allocation[port]++;
+
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) leave: nothing to do, already allocated for this port (port=%d).\n",
 				    pipe, port);
 		return 0;
 	}
-#else
-	if (ref_count_mipi_allocation[port] != 0) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "allocate_mipi_frames(%p) exit: already allocated for this port (port=%d).\n",
-				    pipe, port);
-		return 0;
-	}
-#endif
 
 	ref_count_mipi_allocation[port]++;
 


Regards,

Hans

