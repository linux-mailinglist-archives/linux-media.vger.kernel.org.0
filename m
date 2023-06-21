Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0A9738FA9
	for <lists+linux-media@lfdr.de>; Wed, 21 Jun 2023 21:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbjFUTJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jun 2023 15:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjFUTJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jun 2023 15:09:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E721726
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 12:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687374491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NEmlXOWN5xon1mu2udWpriWSvGoI+UuGNBEZkTcUaEU=;
        b=ZWzma1dg23IfxuQ6tCEZ/wnTpsrl+OXT2eJYsD/c12cmrhuiBgzgIDawsb4I6VteDvNlFM
        dDUFHS/NPVYkBJiQv1WeItjBG1HTU05C76zzlNH3DcFrLBwXly5oEqzjSVFXYRWzrimO/C
        btnMyHWUjuOyGH2MPj0xHY1tKAsaLGE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-tFQrNJjcOcGnTyJE3IMuhQ-1; Wed, 21 Jun 2023 15:08:10 -0400
X-MC-Unique: tFQrNJjcOcGnTyJE3IMuhQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-986db3313f0so357579866b.3
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 12:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687374489; x=1689966489;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NEmlXOWN5xon1mu2udWpriWSvGoI+UuGNBEZkTcUaEU=;
        b=J4WQSgH5EcFRtCWrjnUZ5dVX6ICfB3HaNCqP7fu8ZhlxAvYayhvQxLp6D1fbTnQ9Sx
         fqpo1RJhJHj7/MOmy5pNJMU4SDbJa7DNCkx5gro0FpID7nGTMxvxtBA/vvzJ216LULPR
         pm6yjma1ibFShppq0SCCTeQBAXXf3yZfVbf4rBotJCPszdS6uEE73XLIorCdYIrSjwZ2
         jsFBbXW9kwPOGS04WfNlJYF8yQ+p7pVHMIFU05fNlAR8WE+8ixIziMncxl6qOd3/k1rE
         rthEmzoT/2ORtbbqAq8laPJl0j5WUR8gO9BHhpLyD8KobXbgxChnhG20dAxJ9nX9afaX
         UMhQ==
X-Gm-Message-State: AC+VfDw+WDxNab85q0tTWmaTmn1QnjeiXnfcBlcrwTNv6YczfAxr1Vf4
        kMjFWoNG8Rwp6GB413M3t4xlYN3G6pkfhsDtldY00XHI9Q75SGonEUM18m6xquWyBF/aaLemACp
        l2jfM0bhUtLU6BesS7/sWVQU=
X-Received: by 2002:a17:907:72c7:b0:98c:e72c:6b83 with SMTP id du7-20020a17090772c700b0098ce72c6b83mr1485909ejc.45.1687374488852;
        Wed, 21 Jun 2023 12:08:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4iMKcEBF8XNyTnb7TbftEc8afsFeexMwbjEJir+5Sa5+cI2kuUFld49cWsjdK20n5b4A0hEg==
X-Received: by 2002:a17:907:72c7:b0:98c:e72c:6b83 with SMTP id du7-20020a17090772c700b0098ce72c6b83mr1485899ejc.45.1687374488501;
        Wed, 21 Jun 2023 12:08:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q25-20020a170906145900b0098503ba0db4sm3594563ejc.149.2023.06.21.12.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 12:08:07 -0700 (PDT)
Message-ID: <90723e18-5ad6-b2bc-fee3-c7b037370333@redhat.com>
Date:   Wed, 21 Jun 2023 21:08:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/3] media: atomisp: sh_css_internal: sh_css_params:
 Unifying sh_css_sp_group data structure
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230619052453.48598-1-hpa@redhat.com>
 <20230619052453.48598-4-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230619052453.48598-4-hpa@redhat.com>
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

Thank you for the new version. One small remark below.

On 6/19/23 07:24, Kate Hsuan wrote:
> Since some parts of the data structure elements are determined in compile
> time, the configuration data structure should be compiled for both two
> ISP models. In order to set the configuration for both ISP models in
> runtime, The sh_css_sp_group is unified to one data structure for the
> configuration to ensure the data structure can be used for both ISP2400
> and 2401 in runtime. Also, the unused codes for debug purpose are removed.
> 
> Form the aspect of ISP setting, the length and the content of the
> configuration structure for ISP2400 and ISP2401 are different. So, we
> need to pick up the necessary part of sp_group configuration for both
> models and then copy those parts into a temporary buffer. This buffer
> is finally written to the ISP with the corresponding length.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  .../media/atomisp/pci/sh_css_internal.h       | 41 +------------------
>  .../staging/media/atomisp/pci/sh_css_params.c | 41 ++++++++++++++++++-
>  2 files changed, 41 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
> index d98f1323441e..2349eb4d3767 100644
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

The patch hunk starting here: 

> @@ -86,31 +84,8 @@
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
> -#if !defined(ISP2401)
> -#define SH_CSS_SP_INTERNAL_METADATA_THREAD	1
> -#else
> -#define SH_CSS_SP_INTERNAL_METADATA_THREAD	0
> -#endif
> -
> -#define SH_CSS_SP_INTERNAL_SERVICE_THREAD		1
> -
>  #define SH_CSS_MAX_SP_THREADS		5
>  
> -#define SH_CSS_MAX_SP_INTERNAL_THREADS	(\
> -	 SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
> -	 SH_CSS_SP_INTERNAL_METADATA_THREAD)
> -
> -#define SH_CSS_MAX_PIPELINES	SH_CSS_MAX_SP_THREADS
> -
>  /**
>   * The C99 standard does not specify the exact object representation of structs;
>   * the representation is compiler dependent.

And ending here.

Really belongs in: [PATCH v3 2/3] media: atomisp: Removed unused
HAS_WATCHDOG_SP_THREAD_DEBUG debug.

I have moved this patch hunk to patch 2/3 while merging this
series into my atomisp branch:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

Regards,

Hans


> @@ -357,14 +332,12 @@ struct sh_css_sp_debug_command {
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
> @@ -377,7 +350,7 @@ struct sh_css_sp_config {
>  	     frames are locked when their EOF event is successfully sent to the
>  	     host (true) or when they are passed to the preview/video pipe
>  	     (false). */
> -#if !defined(ISP2401)
> +
>  	struct {
>  		u8					a_changed;
>  		u8					b_changed;
> @@ -385,15 +358,13 @@ struct sh_css_sp_config {
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
> @@ -409,7 +380,6 @@ enum sh_css_stage_type {
>  #define SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS_MASK \
>  	((SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << SH_CSS_MAX_SP_THREADS) - 1)
>  
> -#if defined(ISP2401)
>  struct sh_css_sp_pipeline_terminal {
>  	union {
>  		/* Input System 2401 */
> @@ -442,7 +412,6 @@ struct sh_css_sp_pipeline_io_status {
>  	u32	running[N_INPUT_SYSTEM_CSI_PORT];	/** configured streams */
>  };
>  
> -#endif
>  enum sh_css_port_dir {
>  	SH_CSS_PORT_INPUT  = 0,
>  	SH_CSS_PORT_OUTPUT  = 1
> @@ -641,10 +610,8 @@ struct sh_css_sp_stage {
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
> @@ -922,13 +889,11 @@ sh_css_frame_info_set_width(struct ia_css_frame_info *info,
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
> @@ -971,11 +936,9 @@ sh_css_continuous_is_enabled(uint8_t pipe_num);
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
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 588f2adab058..5667e855da76 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -3720,10 +3720,47 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
>  
>  ia_css_ptr sh_css_store_sp_group_to_ddr(void)
>  {
> +	u8 *write_buf;
> +	u8 *buf_ptr;
> +
>  	IA_CSS_ENTER_LEAVE_PRIVATE("void");
> +
> +	write_buf = kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
> +	if (!write_buf)
> +		return 0;
> +
> +	buf_ptr = write_buf;
> +	if (IS_ISP2401) {
> +		memcpy(buf_ptr, &sh_css_sp_group.config, 3);
> +		buf_ptr += 3;
> +		memcpy(buf_ptr, &sh_css_sp_group.config.enable_isys_event_queue, 2);
> +		buf_ptr += 2;
> +		memset(buf_ptr, 0, 3);
> +		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
> +	} else {
> +		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(sh_css_sp_group.config));
> +		buf_ptr += sizeof(sh_css_sp_group.config);
> +	}
> +
> +	memcpy(buf_ptr, &sh_css_sp_group.pipe, sizeof(sh_css_sp_group.pipe));
> +	buf_ptr += sizeof(sh_css_sp_group.pipe);
> +
> +	if (IS_ISP2401) {
> +		memcpy(buf_ptr, &sh_css_sp_group.pipe_io, sizeof(sh_css_sp_group.pipe_io));
> +		buf_ptr += sizeof(sh_css_sp_group.pipe_io);
> +		memcpy(buf_ptr, &sh_css_sp_group.pipe_io_status,
> +		       sizeof(sh_css_sp_group.pipe_io_status));
> +		buf_ptr += sizeof(sh_css_sp_group.pipe_io_status);
> +	}
> +
> +	memcpy(buf_ptr, &sh_css_sp_group.debug, sizeof(sh_css_sp_group.debug));
> +	buf_ptr += sizeof(sh_css_sp_group.debug);
> +
>  	hmm_store(xmem_sp_group_ptrs,
> -		   &sh_css_sp_group,
> -		   sizeof(struct sh_css_sp_group));
> +		  write_buf,
> +		  buf_ptr - write_buf);
> +
> +	kfree(write_buf);
>  	return xmem_sp_group_ptrs;
>  }
>  

