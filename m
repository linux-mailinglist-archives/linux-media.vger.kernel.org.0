Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB2C4766533
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 09:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234131AbjG1HXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 03:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234149AbjG1HXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 03:23:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE432D5F
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 00:23:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 694E26201D
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 07:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB22C433C8;
        Fri, 28 Jul 2023 07:23:37 +0000 (UTC)
Message-ID: <7c8fc5b4-280e-844e-cdf5-b6ec2a1616aa@xs4all.nl>
Date:   Fri, 28 Jul 2023 09:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] media: atomisp: Fix smatch warnings caused by atomisp
 custom assert() usage
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230727155606.41903-1-hdegoede@redhat.com>
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230727155606.41903-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/07/2023 17:56, Hans de Goede wrote:
> The atomisp code base has a custom assert() macro, a couple of functions
> use this in a construction like the following:
> 
>    assert(pipe);
>    assert(pipe->stream);
>    if ((!pipe) || (!pipe->stream)) {
>            ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>                                "allocate_mipi_frames(%p) exit: ...\n",
>                                pipe);
>            return -EINVAL;
>    }
> 
> The second assert is seen by smatch as dereferencing "pipe" in the above
> example (and dereferencing "dvs_6axis_config" / "me" in the 2 other cases).
> 
> Following by the dereferenced variable being checked (a second time)
> in the following if () statement.
> 
> This triggers the following smatch warnings:
> drivers/staging/media/atomisp/pci/sh_css_mipi.c:356 allocate_mipi_frames() warn: variable dereferenced before check 'pipe' (see line 355)
> drivers/staging/media/atomisp/pci/sh_css_mipi.c:562 send_mipi_frames() warn: variable dereferenced before check 'pipe' (see line 561)
> drivers/staging/media/atomisp/pci/sh_css_param_dvs.c:208 free_dvs_6axis_table() warn: variable dereferenced before check 'dvs_6axis_config' (see line 206)
> drivers/staging/media/atomisp/pci/sh_css_sp.c:1255 sh_css_sp_init_pipeline() warn: variable dereferenced before check 'me->stages' (see line 1224)

After testing this patch with smatch I am still left with this warning:

drivers/staging/media/atomisp/pci/sh_css_sp.c:1251 sh_css_sp_init_pipeline() warn: variable dereferenced before check 'me->stages' (see line 1220)

Regards,

	Hans

> 
> The custom assert() macro actually expands to a BUG() call and BUG()
> calls should not be used in the kernel.
> 
> Remove the assert() calls to fix the smatch warnings and in case of
> [allocate|send]_mipi_frames() also remove the if () return -EINVAL
> block since these functions are never called with a NULL pipe.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note:
> 1. No Closes: tag since Hans Verkuil reported this in an offlist email.
> 2. All the other assert() calls really should also be removed.
>    I've put this on my todo list.
> ---
>  drivers/staging/media/atomisp/pci/sh_css_mipi.c  | 16 ----------------
>  .../staging/media/atomisp/pci/sh_css_param_dvs.c |  3 ---
>  drivers/staging/media/atomisp/pci/sh_css_sp.c    |  4 ----
>  3 files changed, 23 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> index b20acaab0595..ced21dedf7ac 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> @@ -351,15 +351,6 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>  	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>  			    "allocate_mipi_frames(%p) enter:\n", pipe);
>  
> -	assert(pipe);
> -	assert(pipe->stream);
> -	if ((!pipe) || (!pipe->stream)) {
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> -				    "allocate_mipi_frames(%p) exit: pipe or stream is null.\n",
> -				    pipe);
> -		return -EINVAL;
> -	}
> -
>  	if (IS_ISP2401 && pipe->stream->config.online) {
>  		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>  				    "allocate_mipi_frames(%p) exit: no buffers needed for 2401 pipe mode.\n",
> @@ -557,13 +548,6 @@ send_mipi_frames(struct ia_css_pipe *pipe)
>  
>  	IA_CSS_ENTER_PRIVATE("pipe=%p", pipe);
>  
> -	assert(pipe);
> -	assert(pipe->stream);
> -	if (!pipe || !pipe->stream) {
> -		IA_CSS_ERROR("pipe or stream is null");
> -		return -EINVAL;
> -	}
> -
>  	/* multi stream video needs mipi buffers */
>  	/* nothing to be done in other cases. */
>  	if (pipe->stream->config.mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
> index ff0082d02af3..5174bc210ae1 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
> @@ -202,9 +202,6 @@ generate_dvs_6axis_table_from_config(struct ia_css_dvs_6axis_config
>  void
>  free_dvs_6axis_table(struct ia_css_dvs_6axis_config  **dvs_6axis_config)
>  {
> -	assert(dvs_6axis_config);
> -	assert(*dvs_6axis_config);
> -
>  	if ((dvs_6axis_config) && (*dvs_6axis_config)) {
>  		IA_CSS_ENTER_PRIVATE("dvs_6axis_config %p", (*dvs_6axis_config));
>  		if ((*dvs_6axis_config)->xcoords_y) {
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> index 4ef1c9e61ea8..5ecc982ad725 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> @@ -1215,10 +1215,6 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
>  	unsigned int thread_id;
>  	u8 if_config_index, tmp_if_config_index;
>  
> -	assert(me);
> -
> -	assert(me->stages);
> -
>  	first_binary = me->stages->binary;
>  
>  	if (input_mode == IA_CSS_INPUT_MODE_SENSOR ||

