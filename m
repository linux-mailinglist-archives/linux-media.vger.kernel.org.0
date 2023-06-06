Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8348A724030
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 12:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236485AbjFFKzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 06:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237516AbjFFKyy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 06:54:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5BE198E
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 03:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686048631;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bhmKLtp/x4dPFZgDWK6FgwiS1s0YK2aGHSM9L+0D4xM=;
        b=WX31wAPvMqTFiQImmemvlXicfrTAfPVsmLNVqOOATQ1+Sd8SVlV+3yFfMlIzPZBNch0YpN
        CVoTyQy6GIp0cf38U+DD2wkEYrTmS0z+/p6SfZf2sbEC0eFrs2yGFzXk4PQnfim/cMRBZq
        Wlf5eIZSimunYUFhlFrvUI6+X7FMKJE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-c-jBMQoiPdihbul3c-7KuQ-1; Tue, 06 Jun 2023 06:50:28 -0400
X-MC-Unique: c-jBMQoiPdihbul3c-7KuQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-97467e06580so404395166b.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 03:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686048627; x=1688640627;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhmKLtp/x4dPFZgDWK6FgwiS1s0YK2aGHSM9L+0D4xM=;
        b=gfiVPXqFDoTVDmld4hKmabPW/QtfdQu6SVczE68KcMwu2CZOtvXXzFIXvEa05hVzIk
         PIIf6agt7qQVheoauBazMHkeVMFI8mnvkgUQlWXt61BtOPgGSSUXhTVwLf99dQZK4T++
         KpeOfLnMlwr4uvX4NfGhmkhc8+pLRy6Wt4hSL9U5ckus2qqkwCcMY1hNQHOsPV2s7wzd
         cYfELg748k/uZM4idC/7s9IR5kkK/Mvt6+9Sc+ay0m7ypqD51feSCXT3xIwbfQnr/TkV
         nycxtU4cXDpPH7EMySPGsT9M2PSM4hQsGNTPB/GmuuPDEM0Q0PRzJaDVv8h6CvXIJsLp
         pLMQ==
X-Gm-Message-State: AC+VfDzDRHL6kuYpjvQDUjhRVhVbrSWoe8kGrJfeTR7YRSt0vhQB7+9a
        Ejnm52fUdJP0WXfQkkKKcIfqcaTcH18EroNAKV/IgBdB7O6/O4o5fQXExsnWoHOZ+ohaUD5HiEY
        AcqEVvY/r3igSh+bqi8FHCcQ=
X-Received: by 2002:a17:906:6a20:b0:96f:c988:941 with SMTP id qw32-20020a1709066a2000b0096fc9880941mr2123402ejc.15.1686048627045;
        Tue, 06 Jun 2023 03:50:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6LV0P2ksQG3tdTJzfUsLHVyMgTt0NyFlHhHqsCMmJ0TgwWRDuW2hJ/xIUSQW9okjuSMu8Igw==
X-Received: by 2002:a17:906:6a20:b0:96f:c988:941 with SMTP id qw32-20020a1709066a2000b0096fc9880941mr2123382ejc.15.1686048626734;
        Tue, 06 Jun 2023 03:50:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r6-20020a170906350600b00970f0e2dab2sm5404963eja.112.2023.06.06.03.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:50:25 -0700 (PDT)
Message-ID: <5e4e49d8-1e0d-709d-0a4a-576fa1212f01@redhat.com>
Date:   Tue, 6 Jun 2023 12:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] media: atomisp: ia_css_debug: remove unused codes
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230605102903.924283-1-hpa@redhat.com>
 <20230605102903.924283-4-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230605102903.924283-4-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kate,

On 6/5/23 12:29, Kate Hsuan wrote:
> This portion of the codes was not referenced so it can be completely
> removed.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

So this patch fixes compile errors introduced by the first patch
and MAX_THREAD_NUM is still used after this by code in
"#ifdef HAS_WATCHDOG_SP_THREAD_DEBUG" blocks.

Note HAS_WATCHDOG_SP_THREAD_DEBUG is never set.

So IMHO the right thing to do here is:

1. Introduce a new patch which should be the first patch
   of the set which removes all code blocks protected by
   "#ifdef HAS_WATCHDOG_SP_THREAD_DEBUG" as well as
   the "uncomment this here" HAS_WATCHDOG_SP_THREAD_DEBUG bits
   in drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h

2.Make this patch the second (first patch after the
  HAS_WATCHDOG_SP_THREAD_DEBUG removal) patch of the series.

  And instead of renaming MAX_THREAD_NUM to
  MAX_THREAD_NUM_2400 / MAX_THREAD_NUM_2401 just entirely drop it
  and also drop the following now no longer used defines:
  SH_CSS_SP_INTERNAL_METADATA_THREAD
  SH_CSS_SP_INTERNAL_SERVICE_THREAD
  SH_CSS_MAX_SP_INTERNAL_THREADS

Regards,

Hans


SH_CSS_SP_INTERNAL_METADATA_THREAD and
  
the entire now no longer 

> ---
>  .../runtime/debug/interface/ia_css_debug.h    |  6 --
>  .../pci/runtime/debug/src/ia_css_debug.c      | 76 +------------------
>  2 files changed, 2 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> index fff89e9b4b01..3a3d72c6eaaa 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> @@ -141,12 +141,6 @@ static inline void __printf(2, 0) ia_css_debug_vdtrace(unsigned int level,
>  __printf(2, 3) void ia_css_debug_dtrace(unsigned int level,
>  					const char *fmt, ...);
>  
> -/*! @brief Dump sp thread's stack contents
> - * SP thread's stack contents are set to 0xcafecafe. This function dumps the
> - * stack to inspect if the stack's boundaries are compromised.
> - * @return	None
> - */
> -void ia_css_debug_dump_sp_stack_info(void);
>  
>  /*! @brief Function to set the global dtrace verbosity level.
>   * @param[in]	trace_level	Maximum level of the messages to be traced.
> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> index bb6204cb42c5..bb30146c5fe7 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> @@ -105,7 +105,8 @@
>   * TODO:SH_CSS_MAX_SP_THREADS is not the max number of sp threads
>   * future rework should fix this and remove the define MAX_THREAD_NUM
>   */
> -#define MAX_THREAD_NUM (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS)
> +#define MAX_THREAD_NUM_2400 (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS_2400)
> +#define MAX_THREAD_NUM_2401 (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS_2401)
>  
>  static struct pipe_graph_class {
>  	bool do_init;
> @@ -147,79 +148,6 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
>  	va_end(ap);
>  }
>  
> -static void debug_dump_long_array_formatted(
> -    const sp_ID_t sp_id,
> -    hrt_address stack_sp_addr,
> -    unsigned int stack_size)
> -{
> -	unsigned int i;
> -	u32 val;
> -	u32 addr = (uint32_t)stack_sp_addr;
> -	u32 stack_size_words = CEIL_DIV(stack_size, sizeof(uint32_t));
> -
> -	/* When size is not multiple of four, last word is only relevant for
> -	 * remaining bytes */
> -	for (i = 0; i < stack_size_words; i++) {
> -		val = sp_dmem_load_uint32(sp_id, (hrt_address)addr);
> -		if ((i % 8) == 0)
> -			ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "\n");
> -
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "0x%08x ", val);
> -		addr += sizeof(uint32_t);
> -	}
> -
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "\n");
> -}
> -
> -static void debug_dump_sp_stack_info(
> -    const sp_ID_t sp_id)
> -{
> -	const struct ia_css_fw_info *fw;
> -	unsigned int HIVE_ADDR_sp_threads_stack;
> -	unsigned int HIVE_ADDR_sp_threads_stack_size;
> -	u32 stack_sizes[MAX_THREAD_NUM];
> -	u32 stack_sp_addr[MAX_THREAD_NUM];
> -	unsigned int i;
> -
> -	fw = &sh_css_sp_fw;
> -
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "sp_id(%u) stack info\n", sp_id);
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
> -			    "from objects stack_addr_offset:0x%x stack_size_offset:0x%x\n",
> -			    fw->info.sp.threads_stack,
> -			    fw->info.sp.threads_stack_size);
> -
> -	HIVE_ADDR_sp_threads_stack = fw->info.sp.threads_stack;
> -	HIVE_ADDR_sp_threads_stack_size = fw->info.sp.threads_stack_size;
> -
> -	if (fw->info.sp.threads_stack == 0 ||
> -	    fw->info.sp.threads_stack_size == 0)
> -		return;
> -
> -	(void)HIVE_ADDR_sp_threads_stack;
> -	(void)HIVE_ADDR_sp_threads_stack_size;
> -
> -	sp_dmem_load(sp_id,
> -		     (unsigned int)sp_address_of(sp_threads_stack),
> -		     &stack_sp_addr, sizeof(stack_sp_addr));
> -	sp_dmem_load(sp_id,
> -		     (unsigned int)sp_address_of(sp_threads_stack_size),
> -		     &stack_sizes, sizeof(stack_sizes));
> -
> -	for (i = 0 ; i < MAX_THREAD_NUM; i++) {
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
> -				    "thread: %u stack_addr: 0x%08x stack_size: %u\n",
> -				    i, stack_sp_addr[i], stack_sizes[i]);
> -		debug_dump_long_array_formatted(sp_id, (hrt_address)stack_sp_addr[i],
> -						stack_sizes[i]);
> -	}
> -}
> -
> -void ia_css_debug_dump_sp_stack_info(void)
> -{
> -	debug_dump_sp_stack_info(SP0_ID);
> -}
> -
>  void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
>  {
>  	dbg_level = trace_level;

