Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB8C724073
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 13:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbjFFLE3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 07:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234877AbjFFLEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 07:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D1310D5
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686049386;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lCHISaW7ZwHaF3PNWM73pnY+AonldIyhhypRI5mj1KA=;
        b=MkI6OPDWoHdIFFlniaOl2wWoqi9OeR7NbbqHBNBrHqS0VPCDZBd2xK9caJUDhB0yM2H2qy
        AEi4EBpBJ4eGt8UqchkcFT18ykKsDYRpr6bDwhxvu/jw9NjnvtQ3BjBBsrPZzP3SLY8rrW
        m5jO9by4SJRlulAGCGBFt39g8f70Y5E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-J9kG1MluO1S74mjlYgXWtQ-1; Tue, 06 Jun 2023 07:03:04 -0400
X-MC-Unique: J9kG1MluO1S74mjlYgXWtQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-95847b4b4e7so488342466b.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 04:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686049383; x=1688641383;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCHISaW7ZwHaF3PNWM73pnY+AonldIyhhypRI5mj1KA=;
        b=EOS+KIU9puEeviYfda2gUR41dxvhckfNtpyKqfK+8TJORXuHrMgHOIHbKCpSVB9lc1
         z8Z49r2j8Y27KgOm48huNU5XAL7X/YtmsGuFN5aNt9Cbs2MK0kxCaDe435FvDht20djW
         8pJ3TcK6gJLRvXbEbCPwZfmsrOM7UGHrjiYZPC8Mbej80tScmTWVo8ChQddNFeEq66Bm
         xjCA8OfPNuZKk1WJGnYxI/FwPAEjY2WJ2mn7qhpFel9N/CcJIszF+R44oFMfBqH6S32Q
         hthaRJP3M+LnDIrnZt7RG7WeOqwDC/Kq+QF91OHg4a+QOijqXuYjn25tLeJ0TX33YBn5
         7bgg==
X-Gm-Message-State: AC+VfDwlivTej+59FFptWlj/W4lD62Ty7Z1t6e9S+7EGgathwXQ+4U/5
        k8WYo1jtBh4udcgYGvOJfucqXBkwzKm/QXWiNsJx4RTvuaDk+6qjmZOHUsRce5YuhORsaIYf0Br
        gth28W51HiKWNGgmMmZbuct0=
X-Received: by 2002:a17:907:2d10:b0:96a:928c:d391 with SMTP id gs16-20020a1709072d1000b0096a928cd391mr2294560ejc.4.1686049383667;
        Tue, 06 Jun 2023 04:03:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7cY37rL2dpQqnSI1U77e0mAlpV9rM1O80Yl5Z/t+2QgCOeYc0TszkYKN7kjEYoRC+ADbzENw==
X-Received: by 2002:a17:907:2d10:b0:96a:928c:d391 with SMTP id gs16-20020a1709072d1000b0096a928cd391mr2294539ejc.4.1686049383417;
        Tue, 06 Jun 2023 04:03:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bi1-20020a170906a24100b009664cdb3fc5sm5463328ejb.138.2023.06.06.04.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 04:03:02 -0700 (PDT)
Message-ID: <0d171008-763c-5ea9-5935-e594ebe4aae5@redhat.com>
Date:   Tue, 6 Jun 2023 13:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] media: atomisp: sh_css_internal: Unifying
 sh_css_sp_group to remove #ifdef ISP2401
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230605102903.924283-1-hpa@redhat.com>
 <20230605102903.924283-2-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230605102903.924283-2-hpa@redhat.com>
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

Hi,

On 6/5/23 12:29, Kate Hsuan wrote:
> Since some parts of the data scructure elements are determined in compile
> time, the configuration data structure should be compiled for both two
> ISP models. In order to set the configuration for both ISP model in
> runtime, Thesh_css_sp_group is unified to one data structure for the
> configuration to ensure the data structure can be used for both ISP2400
> and 2401.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Please squash this patch into patch 2/3 even if the intermediate results with just this patch compiles it will not run properly, so just fold the 2 patches into 1 please.

Regards,

Hans



> ---
>  .../media/atomisp/pci/sh_css_internal.h       | 35 ++++++-------------
>  1 file changed, 11 insertions(+), 24 deletions(-)
> 
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

