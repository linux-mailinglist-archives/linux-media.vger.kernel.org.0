Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A334724075
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 13:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234308AbjFFLEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 07:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234890AbjFFLEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 07:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A79710CA
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 04:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686049342;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uVVWEr3/PDlkQByxpjb/NymBmkIobetZarYOxj+Nubo=;
        b=c7KAKv3p1NQvsZYCTFhCic8J+QnACAutq8Chc0W0CDntgYdoF22BkqebszA3hXzoqahbq4
        875FW700a3I0o8Eqpztd2Q+w0VQzahMRj8XTxGSk+UFAC8pCss/kMH2qhYprI6DckAbmsI
        +H52wpvWnwf46alk6zpYR93OGcu5aKw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-soayrc0FN46cTGIvc9EsFg-1; Tue, 06 Jun 2023 07:02:21 -0400
X-MC-Unique: soayrc0FN46cTGIvc9EsFg-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5142da822cbso4487264a12.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 04:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686049340; x=1688641340;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVVWEr3/PDlkQByxpjb/NymBmkIobetZarYOxj+Nubo=;
        b=EsyqsmaJVvIkyvBhhXCEwTKil2dV7gm+LReGXLBxWQjv02hYVoobSWvGtO1rByzB+U
         UaxfoPLXeuvf2ZFNPpCkQ7PWzFqIC0V5y//7eExpb+OqxmlNnx/7WLgLufehRBOHcEqi
         GHLgfcW+5qMqgd19yug3mNvWI8GazP5gvGRCGc8kRc4g/qUMBBpFT4sJhah7DTN6T93I
         5AYijVHvj+rBN1E+1UAsO7XhFMV4xugxR9ZyWIjblFksBkDYe7CCsU/0Uh+6qFZ3TdyT
         dFEIr7Hbf9ARKYAt6g2ztUWepMikaVDjLLbAvcWZVffi7qiMkGhWnwWKz8NBqFPAvKzQ
         pnew==
X-Gm-Message-State: AC+VfDxmeY0o09pmZB037jpVQYFIPPxptdJf1WEuTcea+INh0ppvr9XN
        lZkyYZPTu//wd0C1ny0CNwREP05Qt18pXZGrqsyAxTU1Z51gnpJx62Jfny3NDQDv6nBCyoWZ8y4
        VC3KpRsTxkIs3zkdqkKNVqMA=
X-Received: by 2002:a50:ff0b:0:b0:514:95b1:f0ba with SMTP id a11-20020a50ff0b000000b0051495b1f0bamr1754126edu.34.1686049340068;
        Tue, 06 Jun 2023 04:02:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zs8hy5gG0C+mEOx7AeLYSd3QuIehkmmVCU7G9fp1TOOiRsbtWguVcpo5A8rJyc1MXuPxxug==
X-Received: by 2002:a50:ff0b:0:b0:514:95b1:f0ba with SMTP id a11-20020a50ff0b000000b0051495b1f0bamr1754110edu.34.1686049339693;
        Tue, 06 Jun 2023 04:02:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e8-20020a50fb88000000b0050d82f96860sm4215159edq.59.2023.06.06.04.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 04:02:18 -0700 (PDT)
Message-ID: <f57f6070-aab7-87aa-b838-906b570a8265@redhat.com>
Date:   Tue, 6 Jun 2023 13:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] atomisp: sh_css_params: write the sp_group config
 according to the ISP model
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230605102903.924283-1-hpa@redhat.com>
 <20230605102903.924283-3-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230605102903.924283-3-hpa@redhat.com>
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
> Pick up the necessary part of sp_group configuration for both model and
> then copy those parts into a tempetory buffer. This buffer is finally
> written to the ISP with correct length.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  .../staging/media/atomisp/pci/sh_css_params.c | 37 ++++++++++++++++++-
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 588f2adab058..2913d9d6d226 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -3720,10 +3720,43 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
>  
>  ia_css_ptr sh_css_store_sp_group_to_ddr(void)
>  {
> +	u8 *write_buf;
> +	u8 *buf_ptr;
> +
>  	IA_CSS_ENTER_LEAVE_PRIVATE("void");
> +
> +	write_buf = kzalloc(sizeof(u8) * 8192, GFP_KERNEL);

Please use sizeof(struct sh_css_sp_group) here, since you have dropped all the #ifdef-s in the header now that is the largest size which you need now.

> +
> +	buf_ptr = write_buf;
> +	if (IS_ISP2401) {
> +		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(u8) * 5);

This is wrong, there is a big hole between:

        u8                      no_isp_sync; /* Signal host immediately after start */
        u8                      enable_raw_pool_locking; /** Enable Raw Buffer Locking for HAL
        u8                      lock_all;

and:

        u8                 enable_isys_event_queue;
        u8                      disable_cont_vf;

filled with ISP2400 specific data now, so you are copying what likely is some empty alignment bytes before the ISP2400 specific input_formatter struct now instead of copying enable_isys_event_queue
and disable_cont_vf.

So you need to split the memcpy into 2 memcpy calls. You can calculate the source offset of enable_isys_event_queue in sh_css_sp_group.config with offsetof(struct sh_css_sp_config, enable_isys_event_queue), or better yet, just take the address of it:

	if (IS_ISP2401) {
		memcpy(buf_ptr, &sh_css_sp_group.config, 3);
		buf_ptr += 3;
		memcpy(buf_ptr, &sh_css_sp_group.config.enable_isys_event_queue, 2);
		buf_ptr += 2;
		memset(buf_ptr, 0, 3);
		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
	} else {

Also note I have dropped the "* sizeof(u8)" here, you already dropped that yourself for the memset / padding bits and dropping it makes the code easier to read IMHO.
		


> +		buf_ptr += (sizeof(u8) * 5);
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

The rest looks good at a quick glance, but I need to take a closer look later.

Regards,

Hans

