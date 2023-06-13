Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 142D972DDDB
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 11:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240573AbjFMJhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 05:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241186AbjFMJhG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 05:37:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FE21BFD
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 02:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686648967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g/Pi75vcSPtNCKaviArQBm9+171/NA9A4ohp9N1ofbg=;
        b=Xq/8E43n0YdL7ZyKqay46iRq9Vkb8xkR99e4oQet6IZ4yUxxLItLLVpSprQAxeTdItx0Xl
        BlHfhBO/nDYznAkvs6dpysAZ7xfcwyuDEpIKQjl6WDPANMfJatQZ4CkE2H/zF7HUkzd7vQ
        vsFonyBxQgf10EA351URh1uD+wBCT7U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-nwcBvucnMWyQGHUz-jSDCg-1; Tue, 13 Jun 2023 05:36:06 -0400
X-MC-Unique: nwcBvucnMWyQGHUz-jSDCg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-977e50b0120so587817266b.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 02:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686648965; x=1689240965;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/Pi75vcSPtNCKaviArQBm9+171/NA9A4ohp9N1ofbg=;
        b=fTNLXd7mp9cw0Ud6Dt/Sj/H6tqFJAHlYZttzZ4Do5Y8NfSVEkYd57wGNGdU2GPVgDl
         A67vZEETWM0dO1byqd0HkLyzankaS32iv4LEYT5412m5NNkc6KEn0ea5fofAbJHDOwnV
         3xu0fyrJWNM9F5Bp/PwmIVJAKK2gGSqcjFtNhjJdf7/VyivhtPlarcUy8EZP7X3K/hiM
         fY4OvlCRdbgtq7zZPsV9dI56MkwJxqLlblk9wc/rqHxjiyg5lQArRQxhK7oBFsrqFfX/
         7Epa0k1hVRa++kexyhFEO0zK+TAcrzgtjLHpLOMnDKVicPLstr1Y4oD4S1f7D4m3geRC
         tIMw==
X-Gm-Message-State: AC+VfDx1zlw/yqc4I1uAd8etyiY6fDVqLVbm6G91B54Cjql8NxYpRkpl
        z8e8Y1hQVCGGH7mu06KcbDDYzncBb+HwEAQXbQEsqsJOo2JjSeBY9wyBf5wPWIVKYJQ9ac8y1v7
        Tx1x3dtn86kdzEpS/0y0CbaM=
X-Received: by 2002:a17:907:60d0:b0:978:7262:d125 with SMTP id hv16-20020a17090760d000b009787262d125mr14546430ejc.76.1686648965164;
        Tue, 13 Jun 2023 02:36:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7K7LavoYMOeURHE+BN8sZwArsE6Er53WnguJwBL3cNHhJd+IGEzRS6qG/sTA8KMWqAEF+fDQ==
X-Received: by 2002:a17:907:60d0:b0:978:7262:d125 with SMTP id hv16-20020a17090760d000b009787262d125mr14546416ejc.76.1686648964772;
        Tue, 13 Jun 2023 02:36:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s8-20020a170906500800b009663582a90bsm6489634ejj.19.2023.06.13.02.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 02:36:04 -0700 (PDT)
Message-ID: <104ec2e8-b377-ca70-197c-b6110eeeba00@redhat.com>
Date:   Tue, 13 Jun 2023 11:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/3] media: atomisp: ia_css_debug: remove unused
 HAS_WATCHDOG_SP_THREAD_DEBUG codes
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230612055718.453554-1-hpa@redhat.com>
 <20230612055718.453554-3-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230612055718.453554-3-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kate,

On 6/12/23 07:57, Kate Hsuan wrote:
> Since the debug codes around #ifdef HAS_WATCHDOG_SP_THREAD_DEBUG are
> no longer used, the debug implementation of this can be removed. Also,
> the unsed variables are removed.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  .../pci/hive_isp_css_common/debug_global.h    |  7 --
>  .../media/atomisp/pci/ia_css_acc_types.h      |  6 +-
>  .../runtime/debug/interface/ia_css_debug.h    |  6 --
>  .../pci/runtime/debug/src/ia_css_debug.c      | 93 -------------------
>  .../media/atomisp/pci/sh_css_internal.h       | 24 -----
>  5 files changed, 1 insertion(+), 135 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h
> index b6538beca18a..f2e17945fd45 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h
> @@ -35,13 +35,6 @@
>  
>  #define DEBUG_BUFFER_ISP_DMEM_ADDR       0x0
>  
> -/*
> - * Enable HAS_WATCHDOG_SP_THREAD_DEBUG for additional SP thread and
> - * pipe information on watchdog output
> - * #undef HAS_WATCHDOG_SP_THREAD_DEBUG
> - * #define HAS_WATCHDOG_SP_THREAD_DEBUG
> - */
> -
>  /*
>   * The linear buffer mode will accept data until the first
>   * overflow and then stop accepting new data
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> index a20879aedef6..d6e52b4971d6 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> @@ -331,11 +331,7 @@ struct ia_css_sp_info {
>  	of DDR debug queue */
>  	u32 perf_counter_input_system_error; /** input system perf
>  	counter array */
> -#ifdef HAS_WATCHDOG_SP_THREAD_DEBUG
> -	u32 debug_wait; /** thread/pipe post mortem debug */
> -	u32 debug_stage; /** thread/pipe post mortem debug */
> -	u32 debug_stripe; /** thread/pipe post mortem debug */
> -#endif
> +
>  	u32 threads_stack; /** sp thread's stack pointers */
>  	u32 threads_stack_size; /** sp thread's stack sizes */
>  	u32 curr_binary_id;        /** current binary id */
> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> index 3a3d72c6eaaa..efa136294836 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> @@ -306,12 +306,6 @@ void ia_css_debug_dump_isp_params(struct ia_css_stream *stream,
>   */
>  void ia_css_debug_dump_perf_counters(void);
>  
> -#ifdef HAS_WATCHDOG_SP_THREAD_DEBUG
> -void sh_css_dump_thread_wait_info(void);
> -void sh_css_dump_pipe_stage_info(void);
> -void sh_css_dump_pipe_stripe_info(void);
> -#endif
> -
>  void ia_css_debug_dump_isp_binary(void);
>  
>  void sh_css_dump_sp_raw_copy_linecount(bool reduced);
> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> index bb30146c5fe7..cf66a40bd6a4 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> @@ -101,13 +101,6 @@
>  
>  #define ENABLE_LINE_MAX_LENGTH (25)
>  
> -/*
> - * TODO:SH_CSS_MAX_SP_THREADS is not the max number of sp threads
> - * future rework should fix this and remove the define MAX_THREAD_NUM
> - */
> -#define MAX_THREAD_NUM_2400 (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS_2400)
> -#define MAX_THREAD_NUM_2401 (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS_2401)
> -
>  static struct pipe_graph_class {
>  	bool do_init;
>  	int height;

This patch looks good, except that as mentioned this bit should simply
remove the original lines from before this series, rather then first
having patch 1/3 modify these lines and then removing the modified
lines here.

Regards,

Hans



> @@ -2075,12 +2068,6 @@ void ia_css_debug_dump_debug_info(const char *context)
>  	ia_css_debug_dump_isp_gdc_fifo_state();
>  	ia_css_debug_dump_sp_state();
>  	ia_css_debug_dump_perf_counters();
> -
> -#ifdef HAS_WATCHDOG_SP_THREAD_DEBUG
> -	sh_css_dump_thread_wait_info();
> -	sh_css_dump_pipe_stage_info();
> -	sh_css_dump_pipe_stripe_info();
> -#endif
>  	ia_css_debug_dump_dma_isp_fifo_state();
>  	ia_css_debug_dump_dma_sp_fifo_state();
>  	ia_css_debug_dump_dma_state();
> @@ -2392,86 +2379,6 @@ static void __printf(1, 2) dtrace_dot(const char *fmt, ...)
>  	va_end(ap);
>  }
>  
> -#ifdef HAS_WATCHDOG_SP_THREAD_DEBUG
> -void sh_css_dump_thread_wait_info(void)
> -{
> -	const struct ia_css_fw_info *fw;
> -	int i;
> -	unsigned int HIVE_ADDR_sp_thread_wait;
> -	s32 sp_thread_wait[MAX_THREAD_NUM];
> -
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "SEM WAITS:\n");
> -
> -	fw = &sh_css_sp_fw;
> -	HIVE_ADDR_sp_thread_wait =
> -	    fw->info.sp.debug_wait;
> -
> -	(void)HIVE_ADDR_sp_thread_wait;
> -
> -	sp_dmem_load(SP0_ID,
> -		     (unsigned int)sp_address_of(sp_thread_wait),
> -		     &sp_thread_wait,
> -		     sizeof(sp_thread_wait));
> -	for (i = 0; i < MAX_THREAD_NUM; i++) {
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
> -				    "\twait[%d] = 0x%X\n",
> -				    i, sp_thread_wait[i]);
> -	}
> -}
> -
> -void sh_css_dump_pipe_stage_info(void)
> -{
> -	const struct ia_css_fw_info *fw;
> -	int i;
> -	unsigned int HIVE_ADDR_sp_pipe_stage;
> -	s32 sp_pipe_stage[MAX_THREAD_NUM];
> -
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "PIPE STAGE:\n");
> -
> -	fw = &sh_css_sp_fw;
> -	HIVE_ADDR_sp_pipe_stage =
> -	    fw->info.sp.debug_stage;
> -
> -	(void)HIVE_ADDR_sp_pipe_stage;
> -
> -	sp_dmem_load(SP0_ID,
> -		     (unsigned int)sp_address_of(sp_pipe_stage),
> -		     &sp_pipe_stage,
> -		     sizeof(sp_pipe_stage));
> -	for (i = 0; i < MAX_THREAD_NUM; i++) {
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
> -				    "\tstage[%d] = %d\n",
> -				    i, sp_pipe_stage[i]);
> -	}
> -}
> -
> -void sh_css_dump_pipe_stripe_info(void)
> -{
> -	const struct ia_css_fw_info *fw;
> -	int i;
> -	unsigned int HIVE_ADDR_sp_pipe_stripe;
> -	s32 sp_pipe_stripe[MAX_THREAD_NUM];
> -
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "PIPE STRIPE:\n");
> -
> -	fw = &sh_css_sp_fw;
> -	HIVE_ADDR_sp_pipe_stripe =
> -	    fw->info.sp.debug_stripe;
> -
> -	(void)HIVE_ADDR_sp_pipe_stripe;
> -
> -	sp_dmem_load(SP0_ID,
> -		     (unsigned int)sp_address_of(sp_pipe_stripe),
> -		     &sp_pipe_stripe,
> -		     sizeof(sp_pipe_stripe));
> -	for (i = 0; i < MAX_THREAD_NUM; i++) {
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
> -				    "\tstripe[%d] = %d\n",
> -				    i, sp_pipe_stripe[i]);
> -	}
> -}
> -#endif
> -
>  static void
>  ia_css_debug_pipe_graph_dump_frame(
>      const struct ia_css_frame *frame,
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
> index 2fa0b3e45fe0..2349eb4d3767 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
> +++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
> @@ -84,32 +84,8 @@
>  #define SH_CSS_MAX_IF_CONFIGS	3 /* Must match with IA_CSS_NR_OF_CONFIGS (not defined yet).*/
>  #define SH_CSS_IF_CONFIG_NOT_NEEDED	0xFF
>  
> -/*
> - * SH_CSS_MAX_SP_THREADS:
> - *	 sp threads visible to host with connected communication queues
> - *	 these threads are capable of running an image pipe
> - * SH_CSS_MAX_SP_INTERNAL_THREADS:
> - *	 internal sp service threads, no communication queues to host
> - *	 these threads can't be used as image pipe
> - */
> -
> -#define SH_CSS_SP_INTERNAL_METADATA_THREAD_2400	1
> -#define SH_CSS_SP_INTERNAL_METADATA_THREAD_2401	0
> -
> -#define SH_CSS_SP_INTERNAL_SERVICE_THREAD		1
> -
>  #define SH_CSS_MAX_SP_THREADS		5
>  
> -#define SH_CSS_MAX_SP_INTERNAL_THREADS_2400	(\
> -	SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
> -	 SH_CSS_SP_INTERNAL_METADATA_THREAD_2400)
> -
> -#define SH_CSS_MAX_SP_INTERNAL_THREADS_2401	(\
> -	SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
> -	 SH_CSS_SP_INTERNAL_METADATA_THREAD_2401)
> -
> -#define SH_CSS_MAX_PIPELINES	SH_CSS_MAX_SP_THREADS
> -
>  /**
>   * The C99 standard does not specify the exact object representation of structs;
>   * the representation is compiler dependent.

