Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9003276861F
	for <lists+linux-media@lfdr.de>; Sun, 30 Jul 2023 17:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjG3PDC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jul 2023 11:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjG3PDB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jul 2023 11:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FE4102
        for <linux-media@vger.kernel.org>; Sun, 30 Jul 2023 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690729332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ACoDSOFEhzPVwQw3lfLaARQDh8s4w1iXiuyLJ7QFuMs=;
        b=QsSvdNPoJNyE7ckE3DgRbi75WVTQ01cc8Akc/d3Ega4LxGJuBket5O6yMeHe0yQuoIERkm
        sDf9IBGi2/hyDvjBLsJfchWPn9eijgRv6TRB3gqiwvXKUg5s5kghaJSGefmhzYrSLUn0QI
        thoHgrbVMZKaeKpw5SegvJjMdyDPItI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-x67Wj0vdO8ukqDFD2pLjuA-1; Sun, 30 Jul 2023 11:02:10 -0400
X-MC-Unique: x67Wj0vdO8ukqDFD2pLjuA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-993eeb3a950so274267266b.2
        for <linux-media@vger.kernel.org>; Sun, 30 Jul 2023 08:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690729329; x=1691334129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACoDSOFEhzPVwQw3lfLaARQDh8s4w1iXiuyLJ7QFuMs=;
        b=FqAUy0R9AjgzabkW7YlsfM9GIuAgpUQwogcWLH7UDMwHQNHTcymN2FIf2kclVJbitW
         QjFbsiM9U54YIZVJVtbiiPYOK2e0GBOYt9WMBcdTAcfDXpJKI8+GYtkB1OAVLEjz0Xq9
         KQYVWHeT+jgSZQUKOtZbARZkOu8MObORHtmnZ1A8xjKAR7tXSAv4apSqIhL0DdJtuHaZ
         MtxkUdZbuHxe/72Ae6I6e/6GLHLlwSm9o28A9DMa3vRrxNgqOX0lzYAm0XlTI8Ylawm5
         SC+i7c3SbkmHAOwuUhLHyUxOJQJntQn8pfrBxUv4fjMxD5rB5RIMYT+pG9XOfDvtRieK
         /cCw==
X-Gm-Message-State: ABy/qLY5saNtErL8l5CCjH4Glvj8phklkOPlInt3KKDf8TmPWfay4ZBC
        lXCRtSBQvUd64X8xUVG5rmsNHJfmxz77+NIPg558BuDrXVmGPIa7V9GjnXuktw9THpL6/chw0gY
        L9VdQVxTsCrmk3cgTN95Z/tE=
X-Received: by 2002:a17:906:518f:b0:99b:ed53:5bff with SMTP id y15-20020a170906518f00b0099bed535bffmr5512298ejk.10.1690729329530;
        Sun, 30 Jul 2023 08:02:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHMDJ7zEh7HxyZZ9/zghVDXGaP7cQrtKt+ayIho8Rn/NmD4yGa/4hC2kBpVlUl0V9sllqMyKA==
X-Received: by 2002:a17:906:518f:b0:99b:ed53:5bff with SMTP id y15-20020a170906518f00b0099bed535bffmr5512278ejk.10.1690729329181;
        Sun, 30 Jul 2023 08:02:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k13-20020a170906970d00b0098d2261d189sm4848082ejx.19.2023.07.30.08.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 08:02:07 -0700 (PDT)
Message-ID: <4e4cce76-c412-025e-8623-f09188069a37@redhat.com>
Date:   Sun, 30 Jul 2023 17:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: atomisp: Fix smatch warnings caused by atomisp
 custom assert() usage
Content-Language: en-US, nl
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230727155606.41903-1-hdegoede@redhat.com>
 <7c8fc5b4-280e-844e-cdf5-b6ec2a1616aa@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7c8fc5b4-280e-844e-cdf5-b6ec2a1616aa@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/28/23 09:23, Hans Verkuil wrote:
> On 27/07/2023 17:56, Hans de Goede wrote:
>> The atomisp code base has a custom assert() macro, a couple of functions
>> use this in a construction like the following:
>>
>>    assert(pipe);
>>    assert(pipe->stream);
>>    if ((!pipe) || (!pipe->stream)) {
>>            ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>>                                "allocate_mipi_frames(%p) exit: ...\n",
>>                                pipe);
>>            return -EINVAL;
>>    }
>>
>> The second assert is seen by smatch as dereferencing "pipe" in the above
>> example (and dereferencing "dvs_6axis_config" / "me" in the 2 other cases).
>>
>> Following by the dereferenced variable being checked (a second time)
>> in the following if () statement.
>>
>> This triggers the following smatch warnings:
>> drivers/staging/media/atomisp/pci/sh_css_mipi.c:356 allocate_mipi_frames() warn: variable dereferenced before check 'pipe' (see line 355)
>> drivers/staging/media/atomisp/pci/sh_css_mipi.c:562 send_mipi_frames() warn: variable dereferenced before check 'pipe' (see line 561)
>> drivers/staging/media/atomisp/pci/sh_css_param_dvs.c:208 free_dvs_6axis_table() warn: variable dereferenced before check 'dvs_6axis_config' (see line 206)
>> drivers/staging/media/atomisp/pci/sh_css_sp.c:1255 sh_css_sp_init_pipeline() warn: variable dereferenced before check 'me->stages' (see line 1224)
> 
> After testing this patch with smatch I am still left with this warning:
> 
> drivers/staging/media/atomisp/pci/sh_css_sp.c:1251 sh_css_sp_init_pipeline() warn: variable dereferenced before check 'me->stages' (see line 1220)

Ok.

I'll drop the sh_css_sp.c change from this patch and send a v2 of this one + a new patch to address the 'me->stages' issues.

Regards,

Hans



>> The custom assert() macro actually expands to a BUG() call and BUG()
>> calls should not be used in the kernel.
>>
>> Remove the assert() calls to fix the smatch warnings and in case of
>> [allocate|send]_mipi_frames() also remove the if () return -EINVAL
>> block since these functions are never called with a NULL pipe.
>>
>> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Note:
>> 1. No Closes: tag since Hans Verkuil reported this in an offlist email.
>> 2. All the other assert() calls really should also be removed.
>>    I've put this on my todo list.
>> ---
>>  drivers/staging/media/atomisp/pci/sh_css_mipi.c  | 16 ----------------
>>  .../staging/media/atomisp/pci/sh_css_param_dvs.c |  3 ---
>>  drivers/staging/media/atomisp/pci/sh_css_sp.c    |  4 ----
>>  3 files changed, 23 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
>> index b20acaab0595..ced21dedf7ac 100644
>> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
>> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
>> @@ -351,15 +351,6 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>>  	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>>  			    "allocate_mipi_frames(%p) enter:\n", pipe);
>>  
>> -	assert(pipe);
>> -	assert(pipe->stream);
>> -	if ((!pipe) || (!pipe->stream)) {
>> -		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>> -				    "allocate_mipi_frames(%p) exit: pipe or stream is null.\n",
>> -				    pipe);
>> -		return -EINVAL;
>> -	}
>> -
>>  	if (IS_ISP2401 && pipe->stream->config.online) {
>>  		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>>  				    "allocate_mipi_frames(%p) exit: no buffers needed for 2401 pipe mode.\n",
>> @@ -557,13 +548,6 @@ send_mipi_frames(struct ia_css_pipe *pipe)
>>  
>>  	IA_CSS_ENTER_PRIVATE("pipe=%p", pipe);
>>  
>> -	assert(pipe);
>> -	assert(pipe->stream);
>> -	if (!pipe || !pipe->stream) {
>> -		IA_CSS_ERROR("pipe or stream is null");
>> -		return -EINVAL;
>> -	}
>> -
>>  	/* multi stream video needs mipi buffers */
>>  	/* nothing to be done in other cases. */
>>  	if (pipe->stream->config.mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
>> diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
>> index ff0082d02af3..5174bc210ae1 100644
>> --- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
>> +++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
>> @@ -202,9 +202,6 @@ generate_dvs_6axis_table_from_config(struct ia_css_dvs_6axis_config
>>  void
>>  free_dvs_6axis_table(struct ia_css_dvs_6axis_config  **dvs_6axis_config)
>>  {
>> -	assert(dvs_6axis_config);
>> -	assert(*dvs_6axis_config);
>> -
>>  	if ((dvs_6axis_config) && (*dvs_6axis_config)) {
>>  		IA_CSS_ENTER_PRIVATE("dvs_6axis_config %p", (*dvs_6axis_config));
>>  		if ((*dvs_6axis_config)->xcoords_y) {
>> diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
>> index 4ef1c9e61ea8..5ecc982ad725 100644
>> --- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
>> +++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
>> @@ -1215,10 +1215,6 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
>>  	unsigned int thread_id;
>>  	u8 if_config_index, tmp_if_config_index;
>>  
>> -	assert(me);
>> -
>> -	assert(me->stages);
>> -
>>  	first_binary = me->stages->binary;
>>  
>>  	if (input_mode == IA_CSS_INPUT_MODE_SENSOR ||
> 

