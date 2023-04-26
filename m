Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A45B06EF366
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 13:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240424AbjDZLZz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 07:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240277AbjDZLZy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 07:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D834D1988
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 04:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682508312;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GQYBjgr2noHk0Tbnpwp2bG2y2P+nAcM0ljfz/vpeo6M=;
        b=Rubog+N9Vseke1yPJGgemAFs1hQTCMRXCkZs8fvjl7KwQUxtsXghm1ArazfWZiMkOqVFPh
        hPtJCCmf3gSQZOy7AHwkmJHhJJDrfwFocBJDUFz5mAMNVmr08Qaxk9mX4lgAD85kNHMMCs
        F5R/APIu77S8iUITEdoZCGNunTNIoqg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-A0mfnpIpNbu0l8MiBsNcIw-1; Wed, 26 Apr 2023 07:25:10 -0400
X-MC-Unique: A0mfnpIpNbu0l8MiBsNcIw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5067c88a429so7869955a12.3
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 04:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682508309; x=1685100309;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQYBjgr2noHk0Tbnpwp2bG2y2P+nAcM0ljfz/vpeo6M=;
        b=iM9TPlsOv7Z1GbrG5iymRM9iUnZsiHUpmaf2M0gfHb6JD5DIMa0xx5+ScK87GEKq1c
         GNbiUkpubLMGwNKDbeqoY9gZ5Q+oue9lUbE3NtSvk00UfDa9BW2YyK/Pyoa1jz1VY4FV
         CP/uuDgkM0roD0W+djuLlhi3GACiKlQwtSNc6yL8yBL0BZ38XiSwCy7IzYzvMsS/rctg
         E1qLs1Qvmmixqb4ydSFqHsoOuTjsSURosJwxymE7cqulRLuyD72uAa1j5SsIdHqhOK27
         /8bBa7A7VCNjHH9iFaKJmcHEV4tXVsREP3w6VU1KF8qSI6CNhS+/X40MlzQl9IfM7YGQ
         dFeA==
X-Gm-Message-State: AAQBX9f+wD89yYnwjgyWo3qXuta9w9k92O8nzA9s92cEG6SY2F8dD8Jy
        YBUv5M4eE8KTCuuveFQwrGLSEsVYgqZp83Qf/bE2n2ewnHLu1tzPcJt6c/Z7UJ0SEWr2zUKfKDM
        cu9K0FiFtO06DRh0Q6DXnNiY=
X-Received: by 2002:a17:906:1907:b0:958:cc8:bd55 with SMTP id a7-20020a170906190700b009580cc8bd55mr13733328eje.0.1682508309588;
        Wed, 26 Apr 2023 04:25:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350arSn4o/44YOfBiTZHkx+fJp6E/TpM2U+MkT7h14DYnh1SMFm6cfq/zRxBIGldDTzp5gGWFzQ==
X-Received: by 2002:a17:906:1907:b0:958:cc8:bd55 with SMTP id a7-20020a170906190700b009580cc8bd55mr13733298eje.0.1682508309160;
        Wed, 26 Apr 2023 04:25:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c15-20020a170906924f00b0094f507aa0e9sm8172129ejx.19.2023.04.26.04.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 04:25:08 -0700 (PDT)
Message-ID: <19f4e61c-1d93-7bf2-0e40-ee6b14d7fe36@redhat.com>
Date:   Wed, 26 Apr 2023 13:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] staging: media: atomisp: sh_css: Remove #ifdef
 ISP2401
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230425074841.29063-1-hpa@redhat.com>
 <20230425074841.29063-2-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230425074841.29063-2-hpa@redhat.com>
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

Thank you for your work on this!

A few small remarks below / inline:

On 4/25/23 09:48, Kate Hsuan wrote:
> The actions of ISP2401 and 2400 are determined at the runtime.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 584 ++++++++++-----------
>  1 file changed, 286 insertions(+), 298 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index 93789500416f..0cc008b3c921 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -1529,15 +1529,14 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
>  
>  	mipi_init();
>  
> -#ifndef ISP2401
>  	/*
>  	 * In case this has been programmed already, update internal
>  	 * data structure ...
>  	 * DEPRECATED
>  	 */
> -	my_css.page_table_base_index = mmu_get_page_table_base_index(MMU0_ID);
> +	if (!IS_ISP2401)
> +		my_css.page_table_base_index = mmu_get_page_table_base_index(MMU0_ID);
>  
> -#endif
>  	my_css.irq_type = irq_type;
>  
>  	my_css_save.irq_type = irq_type;
> @@ -1596,10 +1595,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
>  	 * sh_css_init_buffer_queues();
>  	 */
>  
> -#if defined(ISP2401)
> -	gp_device_reg_store(GP_DEVICE0_ID, _REG_GP_SWITCH_ISYS2401_ADDR, 1);
> -#endif
> -
> +	if (IS_ISP2401)
> +		gp_device_reg_store(GP_DEVICE0_ID, _REG_GP_SWITCH_ISYS2401_ADDR, 1);
>  
>  	if (!IS_ISP2401)
>  		dma_set_max_burst_size(DMA0_ID, HIVE_DMA_BUS_DDR_CONN,
> @@ -2128,13 +2125,13 @@ ia_css_pipe_destroy(struct ia_css_pipe *pipe)
>  						    err);
>  			}
>  		}
> -#ifndef ISP2401
> -		ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
> -					   pipe->pipe_settings.video.tnr_frames);
> -#else
> -		ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
> -					   pipe->pipe_settings.video.tnr_frames);
> -#endif
> +		if (IS_ISP2401)
> +			ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
> +						   pipe->pipe_settings.video.tnr_frames);
> +		else
> +			ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
> +						   pipe->pipe_settings.video.tnr_frames);
> +

Unless I am missing something here the if and else branches
contain the same statement here (and so did the original code)
so I think this can if ...  else ... can be simplified to just:

		ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
					   pipe->pipe_settings.video.tnr_frames);

?

<snip (+ more snips below)>

> @@ -2514,11 +2515,11 @@ load_preview_binaries(struct ia_css_pipe *pipe)
>  	assert(pipe->mode == IA_CSS_PIPE_ID_PREVIEW);
>  
>  	online = pipe->stream->config.online;
> -#ifdef ISP2401
> -	sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
> -#else
> -	continuous = pipe->stream->config.continuous;
> -#endif
> +
> +	if (IS_ISP2401)
> +		sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
> +	else
> +		continuous = pipe->stream->config.continuous;

You can drop the if ... else here and just always initialize both
helper variables:

	sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
	continuous = pipe->stream->config.continuous;


>  
>  	if (mycs->preview_binary.info)
>  		return 0;
> @@ -2627,24 +2628,26 @@ load_preview_binaries(struct ia_css_pipe *pipe)
>  			return err;
>  	}
>  
> -#ifdef ISP2401
> -	/*
> -	 * When the input system is 2401, only the Direct Sensor Mode
> -	 * Offline Preview uses the ISP copy binary.
> -	 */
> -	need_isp_copy_binary = !online && sensor;
> -#else
> -	/*
> -	 * About pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY:
> -	 * This is typical the case with SkyCam (which has no input system) but it also applies to all cases
> -	 * where the driver chooses for memory based input frames. In these cases, a copy binary (which typical
> -	 * copies sensor data to DDR) does not have much use.
> -	 */
> -	if (!IS_ISP2401)
> -		need_isp_copy_binary = !online && !continuous;
> +	if (IS_ISP2401)
> +		/*
> +		 * When the input system is 2401, only the Direct Sensor Mode
> +		 * Offline Preview uses the ISP copy binary.
> +		 */
> +		need_isp_copy_binary = !online && sensor;
>  	else
> -		need_isp_copy_binary = !online && !continuous && !(pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY);
> -#endif
> +		/*
> +		 * About pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY:
> +		 * This is typical the case with SkyCam (which has no input system) but it also
> +		 * applies to all cases where the driver chooses for memory based input frames.
> +		 * In these cases, a copy binary (which typical copies sensor data to DDR) does
> +		 * not have much use.
> +		 */
> +		if (!IS_ISP2401)
> +			need_isp_copy_binary = !online && !continuous;
> +		else
> +			need_isp_copy_binary = !online && !continuous &&
> +					       !(pipe->stream->config.mode ==
> +						 IA_CSS_INPUT_MODE_MEMORY);
>  
>  	/* Copy */
>  	if (need_isp_copy_binary) {

The if (!IS_ISP2401) is always true here since we are in an else
branch of the "if (IS_ISP2401)" check above (this was already the
case in the old code with the #ifdef, but no-one noticed sofar).

So the else branch of the nested if never gets run and can be
removed. And since the comment is only about the else branch
it can be removed too, so this entire block / chunk can be
similified to:

	if (IS_ISP2401) {
		/*
		 * When the input system is 2401, only the Direct Sensor Mode
		 * Offline Preview uses the ISP copy binary.
		 */
		need_isp_copy_binary = !online && sensor;
  	} else {
		need_isp_copy_binary = !online && !continuous;
	}



> @@ -3125,11 +3128,11 @@ init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
>  
>  	in_frame->frame_info.format = format;
>  
> -#ifdef ISP2401
> -	if (format == IA_CSS_FRAME_FORMAT_RAW)
> -		in_frame->frame_info.format = (pipe->stream->config.pack_raw_pixels) ?
> -		IA_CSS_FRAME_FORMAT_RAW_PACKED : IA_CSS_FRAME_FORMAT_RAW;
> -#endif
> +	if (IS_ISP2401) {
> +		if (format == IA_CSS_FRAME_FORMAT_RAW)
> +			in_frame->frame_info.format = (pipe->stream->config.pack_raw_pixels) ?
> +			IA_CSS_FRAME_FORMAT_RAW_PACKED : IA_CSS_FRAME_FORMAT_RAW;
> +	}
>  
>  	in_frame->frame_info.res.width = pipe->stream->config.input_config.input_res.width;
>  	in_frame->frame_info.res.height = pipe->stream->config.input_config.input_res.height;

Please change this to:

	if (IS_ISP2401 && format == IA_CSS_FRAME_FORMAT_RAW) {
		in_frame->frame_info.format = (pipe->stream->config.pack_raw_pixels) ?
		IA_CSS_FRAME_FORMAT_RAW_PACKED : IA_CSS_FRAME_FORMAT_RAW;
	}

to avoid unnecessary if nesting.

> @@ -3141,9 +3144,12 @@ init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
>  	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_INPUT_FRAME, thread_id, &queue_id);
>  	in_frame->dynamic_queue_id = queue_id;
>  	in_frame->buf_type = IA_CSS_BUFFER_TYPE_INPUT_FRAME;
> +
>  #ifdef ISP2401
> +
>  	ia_css_get_crop_offsets(pipe, &in_frame->frame_info);
>  #endif
> +
>  	err = ia_css_frame_init_planes(in_frame);
>  
>  	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s() bayer_order = %d\n",

You are only adding whitespace here? I guess the intent was to
actually replace the #ifdef with a if (IS_ISP2401) ?

> @@ -3417,9 +3420,9 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe)
>  			goto ERR;
>  
>  		in_frame = &me->in_frame;
> -	} else {
> +	} else
>  		in_frame = NULL;
> -	}
> +
>  
>  	err = init_out_frameinfo_defaults(pipe, &me->out_frame[0], 0);
>  	if (err)

Unrelated coding style change, please drop.

> @@ -5251,12 +5247,12 @@ static int load_primary_binaries(
>  	       pipe->mode == IA_CSS_PIPE_ID_COPY);
>  
>  	online = pipe->stream->config.online;
> -#ifdef ISP2401
> -	sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
> -#else
> -	memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
> -	continuous = pipe->stream->config.continuous;
> -#endif
> +	if (IS_ISP2401) {
> +		sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
> +	} else {
> +		memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
> +		continuous = pipe->stream->config.continuous;
> +	}

As above, just always initialize all helper variables like these:

	sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
	memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
	continuous = pipe->stream->config.continuous;

> @@ -6808,11 +6798,11 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
>  	if (pipe->pipe_settings.yuvpp.copy_binary.info) {
>  		struct ia_css_frame *in_frame_local = NULL;
>  
> -#ifdef ISP2401
> -		/* After isp copy is enabled in_frame needs to be passed. */
> -		if (!online)
> -			in_frame_local = in_frame;
> -#endif
> +		if (IS_ISP2401) {
> +			/* After isp copy is enabled in_frame needs to be passed. */
> +			if (!online)
> +				in_frame_local = in_frame;
> +		}

Please && the 2 conditions together to avoid unnecessary if nesting:

		if (IS_ISP2401 && !online) {
			/* After isp copy is enabled in_frame needs to be passed. */
			in_frame_local = in_frame;
		}

> @@ -7054,25 +7042,26 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
>  	ia_css_pipeline_clean(me);
>  	ia_css_pipe_util_create_output_frames(out_frames);
>  
> -#ifdef ISP2401
> -	/*
> -	 * When the input system is 2401, always enable 'in_frameinfo_memory'
> -	 * except for the following:
> -	 * - Direct Sensor Mode Online Capture
> -	 * - Direct Sensor Mode Online Capture
> -	 * - Direct Sensor Mode Continuous Capture
> -	 * - Buffered Sensor Mode Continuous Capture
> -	 */
> -	sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
> -	buffered_sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
> -	online = pipe->stream->config.online;
> -	continuous = pipe->stream->config.continuous;
> -	need_in_frameinfo_memory =
> -	!((sensor && (online || continuous)) || (buffered_sensor && (online || continuous)));
> -#else
> -	/* Construct in_frame info (only in case we have dynamic input */
> -	need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
> -#endif
> +	if (IS_ISP2401) {
> +		/*
> +		 * When the input system is 2401, always enable 'in_frameinfo_memory'
> +		 * except for the following:
> +		 * - Direct Sensor Mode Online Capture
> +		 * - Direct Sensor Mode Online Capture
> +		 * - Direct Sensor Mode Continuous Capture
> +		 * - Buffered Sensor Mode Continuous Capture
> +		 */
> +		sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
> +		buffered_sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
> +		online = pipe->stream->config.online;
> +		continuous = pipe->stream->config.continuous;
> +		need_in_frameinfo_memory =
> +		!((sensor && (online || continuous)) || (buffered_sensor &&
> +							(online || continuous)));
> +	} else
> +		/* Construct in_frame info (only in case we have dynamic input */
> +		need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
> +

When one branch of an if...else... block needs {} please add {}
to both branches (so also add it to the else here).


> @@ -7185,14 +7174,17 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
>  				local_in_frame = in_frame;
>  			else
>  				local_in_frame = NULL;
> -#ifndef ISP2401
> -			if (!need_pp && (i == num_primary_stage - 1))
> -#else
> -			if (!need_pp && (i == num_primary_stage - 1) && !need_ldc)
> -#endif
> -				local_out_frame = out_frame;
> -			else
> +
> +			if (!need_pp && (i == num_primary_stage - 1)) {
> +				if (IS_ISP2401) {
> +					if (!need_ldc)
> +						local_out_frame = out_frame;

this is missing a:

					else
						local_out_frame = NULL;

> +				} else {
> +					local_out_frame = out_frame;
> +				}
> +			} else {
>  				local_out_frame = NULL;
> +			}

Rather then adding the missing else, I think it would be
better to just fold this all into:

			if (!need_pp && (i == num_primary_stage - 1) && (!IS_ISP2401 || !need_ldc))
				local_out_frame = out_frame;
			else
				local_out_frame = NULL;

?

>  			ia_css_pipe_util_set_output_frames(out_frames, 0, local_out_frame);
>  			/*
>  			 * WARNING: The #if def flag has been added below as a
> @@ -7401,22 +7393,22 @@ static int capture_start(struct ia_css_pipe *pipe)
>  		}
>  	}
>  
> -#if !defined(ISP2401)
> -	/* old isys: need to send_mipi_frames() in all pipe modes */
> -	err = send_mipi_frames(pipe);
> -	if (err) {
> -		IA_CSS_LEAVE_ERR_PRIVATE(err);
> -		return err;
> -	}
> -#else
> -	if (pipe->config.mode != IA_CSS_PIPE_MODE_COPY) {
> +	if (IS_ISP2401) {
> +		if (pipe->config.mode != IA_CSS_PIPE_MODE_COPY) {
> +			err = send_mipi_frames(pipe);
> +			if (err) {
> +				IA_CSS_LEAVE_ERR_PRIVATE(err);
> +				return err;
> +			}
> +		}
> +	} else {
> +		/* old isys: need to send_mipi_frames() in all pipe modes */
>  		err = send_mipi_frames(pipe);
>  		if (err) {
>  			IA_CSS_LEAVE_ERR_PRIVATE(err);
>  			return err;
>  		}
>  	}
> -#endif
>  
>  	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
>  	copy_ovrd = 1 << thread_id;

Maybe simplify this entire block to:

	/* old isys: need to send_mipi_frames() in all pipe modes */
	if (!IS_ISP2401 || !pipe->config.mode != IA_CSS_PIPE_MODE_COPY) {
		if (pipe->config.mode != IA_CSS_PIPE_MODE_COPY) {
			err = send_mipi_frames(pipe);
			if (err) {
				IA_CSS_LEAVE_ERR_PRIVATE(err);
				return err;
			}
		}
	}

?

> @@ -8665,6 +8653,7 @@ ia_css_stream_start(struct ia_css_stream *stream)
>  		for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT; idx++) {
>  			sh_css_sp_group.config.mipi_sizes_for_check[port][idx] =
>  			sh_css_get_mipi_sizes_for_check(port, idx);
> +
>  		}
>  	}
>  #endif

Unrelated whitespace chage, please drop.

Regards,

Hans

