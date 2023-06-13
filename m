Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A864F72DDD1
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 11:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241157AbjFMJfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 05:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242000AbjFMJf2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 05:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EF910DC
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 02:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686648889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l7qmoOsVf+tguy6RcDj0O3a+WK3+45G3D3xcHziFfwc=;
        b=IhG2FptAzILd/pE79jPtS1xdZXLM/pABOJ9Q8X1gwZ2yKekkGBHheU8FMiB4hRo7FTDyVz
        hFYl8xEwJ7CKhkR1o/8F/HY53j2qbU5r/TcofNQoqycl20nq3VBfQvLyesb34okAo82oEa
        T3G8b2lxO8E3gNl02CDx9RFdn40eTCE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-iMPFrYzcOYCv_TFjIYwLyA-1; Tue, 13 Jun 2023 05:34:45 -0400
X-MC-Unique: iMPFrYzcOYCv_TFjIYwLyA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-51866148986so1222583a12.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 02:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686648884; x=1689240884;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7qmoOsVf+tguy6RcDj0O3a+WK3+45G3D3xcHziFfwc=;
        b=PKWA9+9xf0qwah86+mfJWE6TnGZtg43UO+9aDYmxXx1BTJS8LaIi7ZDVFMZe1FXq1V
         +VQbmuwM/huJK9J+CCzIzOGESLfyqQFyDon9helXcw+lsV5frqm8XMY+e9t2fFpad97v
         hTQ2uiQcbVsBXKUyQ2gV+KgKtfmVSDAonW+g2Rya9Ye4wWhb5sfd8E8WJMEJYl6oMRXG
         dAsJMvOf6NU7Mq3AMAue8DhfeYiECGjVlituYEY/ri+NizsbfyQx6UHEAv4ozImHtACN
         WbpXn/w1RMnboZtbbpD9voBl2uuzRgg68zeFfqWbddX8TstsU3Oc378GqS4imWaRD961
         3pmA==
X-Gm-Message-State: AC+VfDzEhZ4RaRjP4V7PWpBz5tWZot9VbkJ3Sx/4gbt309z38LrqS0R9
        xSUZhr3ig6sQLwWtGAt8GUSnIf9scsXRPYv2iojQ9r3rSCxIFOgTYyAg9hQR1jrnkndxNJSYvxm
        VXzK03eHiVhZ9IFaOsSKr/Zk=
X-Received: by 2002:a17:906:9b8d:b0:974:e755:9fde with SMTP id dd13-20020a1709069b8d00b00974e7559fdemr13326462ejc.19.1686648883981;
        Tue, 13 Jun 2023 02:34:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5TpG6UZcAK+bC0FCOdV9pMnRGmb+SzI96kssOQCPrT1BNZXMAmgKFtsJTPrG/3GduhlGp6QA==
X-Received: by 2002:a17:906:9b8d:b0:974:e755:9fde with SMTP id dd13-20020a1709069b8d00b00974e7559fdemr13326447ejc.19.1686648883659;
        Tue, 13 Jun 2023 02:34:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id zo18-20020a170906ff5200b0096ae4451c65sm6467436ejb.157.2023.06.13.02.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 02:34:42 -0700 (PDT)
Message-ID: <33242ae0-848a-f264-3809-91b55fa1405b@redhat.com>
Date:   Tue, 13 Jun 2023 11:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] media: atomisp: sh_css_internal: Unifying
 sh_css_sp_group to remove #ifdef ISP2401
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230612055718.453554-1-hpa@redhat.com>
 <20230612055718.453554-2-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230612055718.453554-2-hpa@redhat.com>
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

Thank you for the new version.

It seems that this is a mismatch of multiple previous v1 patches
squashed into 1, so I'm afraid that this is going to need
a version 3 to fix this.

I see bits of both:

[PATCH 1/3] media: atomisp: sh_css_internal: Unifying sh_css_sp_group to remove #ifdef ISP2401
[PATCH 3/3] media: atomisp: ia_css_debug: remove unused codes

from v1 of the series in here. Where I think this should be only patch 3/3,
removing the unused ia_css_debug code as a prep patch for further changes.

See below for details.

On 6/12/23 07:57, Kate Hsuan wrote:
> Since some parts of the data scructure elements are determined in compile
> time, the configuration data structure should be compiled for both two
> ISP models. In order to set the configuration for both ISP model in
> runtime, Thesh_css_sp_group is unified to one data structure for the
> configuration to ensure the data structure can be used for both ISP2400
> and 2401. Some of the unsed codes from ia_css_debug.c are also removed.

It seems that when squashing patches you have ended up re-using the wrong
commit message for this one.

Instead the commit msg of the v1:
"[PATCH 3/3] media: atomisp: ia_css_debug: remove unused codes"

patch should be used here.


> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  .../runtime/debug/interface/ia_css_debug.h    |  6 --
>  .../pci/runtime/debug/src/ia_css_debug.c      | 76 +------------------
>  .../media/atomisp/pci/sh_css_internal.h       | 35 +++------
>  3 files changed, 13 insertions(+), 104 deletions(-)
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

The patch-hunk starting here:

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

And ending here, does not belong in this patch. Instead it should be squashed into patch 2/3
which will result in patch 2/3 simply removing the original lines.

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

All the sh_css_internal.h changes below should be
squashed into / moved to:

[PATCH v2 3/3] atomisp: sh_css_params: write the sp_group config according to the ISP model

> diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
> index d98f1323441e..2fa0b3e45fe0 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
> +++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
> @@ -22,9 +22,7 @@
>  #include <platform_support.h>
>  #include <linux/stdarg.h>
>  
> -#if !defined(ISP2401)
>  #include "input_formatter.h"
> -#endif
>  #include "input_system.h"
>  
>  #include "ia_css_types.h"
> @@ -95,19 +93,20 @@
>   *	 these threads can't be used as image pipe
>   */
>  
> -#if !defined(ISP2401)
> -#define SH_CSS_SP_INTERNAL_METADATA_THREAD	1
> -#else
> -#define SH_CSS_SP_INTERNAL_METADATA_THREAD	0
> -#endif
> +#define SH_CSS_SP_INTERNAL_METADATA_THREAD_2400	1
> +#define SH_CSS_SP_INTERNAL_METADATA_THREAD_2401	0
>  
>  #define SH_CSS_SP_INTERNAL_SERVICE_THREAD		1
>  
>  #define SH_CSS_MAX_SP_THREADS		5
>  
> -#define SH_CSS_MAX_SP_INTERNAL_THREADS	(\
> -	 SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
> -	 SH_CSS_SP_INTERNAL_METADATA_THREAD)
> +#define SH_CSS_MAX_SP_INTERNAL_THREADS_2400	(\
> +	SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
> +	 SH_CSS_SP_INTERNAL_METADATA_THREAD_2400)
> +
> +#define SH_CSS_MAX_SP_INTERNAL_THREADS_2401	(\
> +	SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
> +	 SH_CSS_SP_INTERNAL_METADATA_THREAD_2401)
>  
>  #define SH_CSS_MAX_PIPELINES	SH_CSS_MAX_SP_THREADS
>  
> @@ -357,14 +356,12 @@ struct sh_css_sp_debug_command {
>  	u32 dma_sw_reg;
>  };
>  
> -#if !defined(ISP2401)
>  /* SP input formatter configuration.*/
>  struct sh_css_sp_input_formatter_set {
>  	u32				stream_format;
>  	input_formatter_cfg_t	config_a;
>  	input_formatter_cfg_t	config_b;
>  };
> -#endif
>  
>  #define IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT (3)
>  
> @@ -377,7 +374,7 @@ struct sh_css_sp_config {
>  	     frames are locked when their EOF event is successfully sent to the
>  	     host (true) or when they are passed to the preview/video pipe
>  	     (false). */
> -#if !defined(ISP2401)
> +
>  	struct {
>  		u8					a_changed;
>  		u8					b_changed;
> @@ -385,15 +382,13 @@ struct sh_css_sp_config {
>  		struct sh_css_sp_input_formatter_set
>  			set[SH_CSS_MAX_IF_CONFIGS]; /* CSI-2 port is used as index. */
>  	} input_formatter;
> -#endif
> -#if !defined(ISP2401)
> +
>  	sync_generator_cfg_t	sync_gen;
>  	tpg_cfg_t		tpg;
>  	prbs_cfg_t		prbs;
>  	input_system_cfg_t	input_circuit;
>  	u8			input_circuit_cfg_changed;
>  	u32		mipi_sizes_for_check[N_CSI_PORTS][IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT];
> -#endif
>  	u8                 enable_isys_event_queue;
>  	u8			disable_cont_vf;
>  };
> @@ -409,7 +404,6 @@ enum sh_css_stage_type {
>  #define SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS_MASK \
>  	((SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << SH_CSS_MAX_SP_THREADS) - 1)
>  
> -#if defined(ISP2401)
>  struct sh_css_sp_pipeline_terminal {
>  	union {
>  		/* Input System 2401 */
> @@ -442,7 +436,6 @@ struct sh_css_sp_pipeline_io_status {
>  	u32	running[N_INPUT_SYSTEM_CSI_PORT];	/** configured streams */
>  };
>  
> -#endif
>  enum sh_css_port_dir {
>  	SH_CSS_PORT_INPUT  = 0,
>  	SH_CSS_PORT_OUTPUT  = 1
> @@ -641,10 +634,8 @@ struct sh_css_sp_stage {
>  struct sh_css_sp_group {
>  	struct sh_css_sp_config		config;
>  	struct sh_css_sp_pipeline	pipe[SH_CSS_MAX_SP_THREADS];
> -#if defined(ISP2401)
>  	struct sh_css_sp_pipeline_io	pipe_io[SH_CSS_MAX_SP_THREADS];
>  	struct sh_css_sp_pipeline_io_status	pipe_io_status;
> -#endif
>  	struct sh_css_sp_debug_command	debug;
>  };
>  
> @@ -922,13 +913,11 @@ sh_css_frame_info_set_width(struct ia_css_frame_info *info,
>  			    unsigned int width,
>  			    unsigned int aligned);
>  
> -#if !defined(ISP2401)
>  
>  unsigned int
>  sh_css_get_mipi_sizes_for_check(const unsigned int port,
>  				const unsigned int idx);
>  
> -#endif
>  
>  ia_css_ptr
>  sh_css_store_sp_group_to_ddr(void);
> @@ -971,11 +960,9 @@ sh_css_continuous_is_enabled(uint8_t pipe_num);
>  struct ia_css_pipe *
>  find_pipe_by_num(uint32_t pipe_num);
>  
> -#ifdef ISP2401
>  void
>  ia_css_get_crop_offsets(
>      struct ia_css_pipe *pipe,
>      struct ia_css_frame_info *in_frame);
> -#endif
>  
>  #endif /* _SH_CSS_INTERNAL_H_ */



Regards,

Hans


