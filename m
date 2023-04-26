Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8136EF425
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 14:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240816AbjDZMRc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 08:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240073AbjDZMRb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 08:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A108C2121
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 05:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682511401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N7JsSpHKRygF4heZCdYSw4B9AwIhapm0I11x8rY3w60=;
        b=CZv2ponVg9Pw+UV9lX/utE/1ACp7njTAERfafxVoNFSMgfem6NNMoAVM61j5Fb0RqPUuoo
        bFrzAT986WUEDu/JyIi2bl/m0WNOdTDfJCX1XEIv9+gkH3gw0xFFMq+v9jPPhE9BgVs2OU
        m6A61bcTXel4Spdx8kBqDrb3Kq9pygI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-Id5XJjesMRGEukA1rqCLwA-1; Wed, 26 Apr 2023 08:16:40 -0400
X-MC-Unique: Id5XJjesMRGEukA1rqCLwA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a341ee4fcso817115066b.0
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 05:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682511399; x=1685103399;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7JsSpHKRygF4heZCdYSw4B9AwIhapm0I11x8rY3w60=;
        b=kxunpRtvaA2fW07h76P7srse7V24U2xSmYy7zZJZytAllVeQQPVdDsAxF5BiHPHvn7
         LTS21wUaJbkzPio+IHYbUaRvqtJxqQy3kmGA9ZmIka2LY39zEUjHzvabPQyG+t0vIagY
         1YfTUaLAZ4GZhWOH9xJ9TxqGendyITKI8DKPHR4Rw1zvI/NOWg0z6OsXx6lQ2lPZPrE+
         sOOnTBPFqePoheCuC6heauEJoUWWsMalcUjGIdYxDqviO1dT3xREUfPpa5kIRlLu8mgd
         R+3yn7oeXX/98RxJZrU9oRn49HH3WmmLcFH1gXKe1V2Iq5sZr7v5ALnl4mGmMaGvPgkr
         YsCg==
X-Gm-Message-State: AAQBX9d/AbJ1g2+Dk5L0IcNwsJldFE6ogRzWinHw9xoky54KoFftTirv
        lDpc2FdHIJ5Kc1QF7v0ZWGAkgdPSqdxEMlh1CGR3GQ/YOigwYB2pSXvDMc1lR/PnASV5YgIeVia
        8hCKq2MEzSkuqfG5P7tqxz9YpI4Mng2U=
X-Received: by 2002:a17:906:8a62:b0:94f:969e:c52b with SMTP id hy2-20020a1709068a6200b0094f969ec52bmr13910126ejc.74.1682511399042;
        Wed, 26 Apr 2023 05:16:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZQCHJm7i0OVIE57JNbrh1L8v1afyTSLhVKP3rbcQGzwHLbYqyKZtimY1ZyU7Eu7k6wWilf0A==
X-Received: by 2002:a17:906:8a62:b0:94f:969e:c52b with SMTP id hy2-20020a1709068a6200b0094f969ec52bmr13910112ejc.74.1682511398721;
        Wed, 26 Apr 2023 05:16:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id la5-20020a170906ad8500b0094e877ec197sm8293858ejb.148.2023.04.26.05.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 05:16:38 -0700 (PDT)
Message-ID: <68e8825f-f0d4-4ccd-ba8d-2587b5bc34ec@redhat.com>
Date:   Wed, 26 Apr 2023 14:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/5] staging: media: atomisp: sh_css_mipi: Remove #ifdef
 2041
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230425074841.29063-1-hpa@redhat.com>
 <20230425074841.29063-6-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230425074841.29063-6-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kate,

On 4/25/23 09:48, Kate Hsuan wrote:
> The actions of ISP2401 and 2400 are determined at the runtime.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  .../staging/media/atomisp/pci/sh_css_mipi.c   | 101 +++++++++---------
>  1 file changed, 49 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> index bc6e8598a776..9c9d3b27ded4 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c

<snip>

> @@ -363,15 +360,15 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>  		return -EINVAL;
>  	}
>  
> -#ifdef ISP2401
> -	if (pipe->stream->config.online) {
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> -				    "allocate_mipi_frames(%p) exit: no buffers needed for 2401 pipe mode.\n",
> -				    pipe);
> -		return 0;
> +	if (IS_ISP2401) {
> +		if (pipe->stream->config.online) {
> +			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> +					    "allocate_mipi_frames(%p) exit: no buffers needed for 2401 pipe mode.\n",
> +					    pipe);
> +			return 0;
> +		}
>  	}
>  
> -#endif
>  	if (pipe->stream->config.mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
>  		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>  				    "allocate_mipi_frames(%p) exit: no buffers needed for pipe mode.\n",

Please combine the 2 conditions with && instead of using nested if-s:

	if (IS_ISP2401 && pipe->stream->config.online) {
		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
				    "allocate_mipi_frames(%p) exit: no buffers needed for 2401 pipe mode.\n",
				    pipe);
		return 0;
	}


> @@ -386,30 +383,30 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>  		return -EINVAL;
>  	}
>  
> -#ifdef ISP2401
> -	err = calculate_mipi_buff_size(&pipe->stream->config,
> -				       &my_css.mipi_frame_size[port]);
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
> -	if (ref_count_mipi_allocation[port] != 0) {
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> -				    "allocate_mipi_frames(%p) exit: already allocated for this port (port=%d).\n",
> -				    pipe, port);
> -		return 0;
> +	if (IS_ISP2401) {
> +		err = calculate_mipi_buff_size(&pipe->stream->config,
> +					       &my_css.mipi_frame_size[port]);
> +		/*
> +		 * 2401 system allows multiple streams to use same physical port. This is not
> +		 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
> +		 * TODO AM: Once that is changed (removed) this code should be removed as well.
> +		 * In that case only 2400 related code should remain.
> +		 */
> +		if (ref_count_mipi_allocation[port] != 0) {
> +			ref_count_mipi_allocation[port]++;
> +			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> +					    "allocate_mipi_frames(%p) leave: nothing to do, already allocated for this port (port=%d).\n",
> +					    pipe, port);
> +			return 0;
> +		}
> +	} else {
> +		if (ref_count_mipi_allocation[port] != 0) {
> +			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> +					    "allocate_mipi_frames(%p) exit: already allocated for this port (port=%d).\n",
> +					    pipe, port);
> +			return 0;
> +		}
>  	}
> -#endif

The "if (ref_count_mipi_allocation[port] != 0) { log-message; return 0; }"
block is shared between the ISP2400 and ISP2401. Except for one debug log
message using "leave" and the other using "exit" these 2 blocks are 100%
the same, so please pick one of the 2 log messages and move this block
out of the if (IS_ISP2401) {} block (and drop the else branch).

> @@ -534,18 +531,18 @@ free_mipi_frames(struct ia_css_pipe *pipe)
>  				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>  						    "free_mipi_frames(%p) exit (deallocated).\n", pipe);
>  			}
> -#if defined(ISP2401)
>  			else {
> -				/* 2401 system allows multiple streams to use same physical port. This is not
> -				 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
> -				 * TODO AM: Once that is changed (removed) this code should be removed as well.
> -				 * In that case only 2400 related code should remain.
> -				 */
> -				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> -						    "free_mipi_frames(%p) leave: nothing to do, other streams still use this port (port=%d).\n",
> -						    pipe, port);
> +				if (IS_ISP2401) {
> +					/* 2401 system allows multiple streams to use same physical port. This is not
> +					 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
> +					 * TODO AM: Once that is changed (removed) this code should be removed as well.
> +					 * In that case only 2400 related code should remain.
> +					 */
> +					ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> +							    "free_mipi_frames(%p) leave: nothing to do, other streams still use this port (port=%d).\n",
> +							    pipe, port);
> +				}
>  			}
> -#endif
>  		}
>  	} else { /* pipe ==NULL */
>  		/* AM TEMP: free-ing all mipi buffers just like a legacy code. */

Hmm maybe just drop the entire ia_css_debug_dtrace() call here
instead of replace the #ifdef with if (IS_ISP2401) { } ?

I don't see much value in the ia_css_debug_dtrace() call, so to
me just dropping it seems best.

Regards,

Hans


