Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93325724436
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 15:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238145AbjFFNUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 09:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237522AbjFFNUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 09:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A08012F
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686057595;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C5XybOvws+6gkhvcwZNSqRF3mGXbtoymf+lx6kJinwQ=;
        b=ME3ByfzGVLvNphSqyf8Dk1vdydSsmN7W6HLAOEOpUhHwlr6bte1C/Zshk8enWfbzAcEnlc
        8yn935iXYZadBWg2WgNEJIVxLgJUfsqbGSHI1AbKypv36ROe8Ko3N1XrET8x/lWaXwxnQO
        iQq4cq1gHKFrvuu2zJ7V4eh4KUi+NTQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-cWTVlOKIPA-FFkKBbNBX5g-1; Tue, 06 Jun 2023 09:19:54 -0400
X-MC-Unique: cWTVlOKIPA-FFkKBbNBX5g-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5149ab05081so3949139a12.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 06:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057593; x=1688649593;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5XybOvws+6gkhvcwZNSqRF3mGXbtoymf+lx6kJinwQ=;
        b=ko5mK2OsCFIyFV7LgKJmgQQlMpfekuCGUPR4l7B9iAY+w38n2ujTkl6HvRb/BIM2JM
         ucPfhk1csr4I9JEJF3mvJzBYhiTjtFWEIHL4iPh6TwXvz39dXzHWJV1sjcUmrc206RsK
         o95lnoVEPJ+XJv/ZrmgfqbbOQLo1Ul1b4kUEkWbXFiGBOqawSWb1b9H/cf/41i5Aaxus
         OVcXQX0Q0YMHGJXTohhAeSDxCmdjsQJh26yF0a7GqSty3PeB0TVGMtBj3JZPRLXplyJZ
         /YY6mjc35xTfggeFhXOU5R0LPI9ZmqzIAGx5lTX0BSpJabTMAJYO6+QkMu3prw1Zqr+8
         MS0g==
X-Gm-Message-State: AC+VfDzDAiSk5B4A0loippncYLO74XdyH6f26M5jWIPxzKrv2sSY8BQQ
        j5mNrXuzQKULlkg0h4afxwal+chOB7SWT6bjv+QvChhEBMt9YRkmX8mlR4TkaFUAXIZXp8AUgM8
        +KXy+tT0C20VYNM0y/clTGno=
X-Received: by 2002:a17:907:d29:b0:973:ea73:b883 with SMTP id gn41-20020a1709070d2900b00973ea73b883mr3380380ejc.66.1686057592947;
        Tue, 06 Jun 2023 06:19:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HX1s/zPOuyY1Dmb4+r/d5IcrElziI7GUFpcGFH9QTvBl38/PyyLd18U5MsRJf4kl+VEhOBw==
X-Received: by 2002:a17:907:d29:b0:973:ea73:b883 with SMTP id gn41-20020a1709070d2900b00973ea73b883mr3380356ejc.66.1686057592654;
        Tue, 06 Jun 2023 06:19:52 -0700 (PDT)
Received: from [192.168.43.127] ([109.38.131.166])
        by smtp.gmail.com with ESMTPSA id q25-20020a170906a09900b0096f7e7d1566sm5584027ejy.224.2023.06.06.06.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:19:52 -0700 (PDT)
Message-ID: <264b29be-e48d-c06f-c7ed-1f1c9dc3205e@redhat.com>
Date:   Tue, 6 Jun 2023 15:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] atomisp: sh_css_params: write the sp_group config
 according to the ISP model
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230605102903.924283-1-hpa@redhat.com>
 <20230605102903.924283-3-hpa@redhat.com>
 <f57f6070-aab7-87aa-b838-906b570a8265@redhat.com>
In-Reply-To: <f57f6070-aab7-87aa-b838-906b570a8265@redhat.com>
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

On 6/6/23 13:02, Hans de Goede wrote:
> Hi Kate,
> 
> On 6/5/23 12:29, Kate Hsuan wrote:
>> Pick up the necessary part of sp_group configuration for both model and
>> then copy those parts into a tempetory buffer. This buffer is finally
>> written to the ISP with correct length.
>>
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>> ---
>>  .../staging/media/atomisp/pci/sh_css_params.c | 37 ++++++++++++++++++-
>>  1 file changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
>> index 588f2adab058..2913d9d6d226 100644
>> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
>> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
>> @@ -3720,10 +3720,43 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
>>  
>>  ia_css_ptr sh_css_store_sp_group_to_ddr(void)
>>  {
>> +	u8 *write_buf;
>> +	u8 *buf_ptr;
>> +
>>  	IA_CSS_ENTER_LEAVE_PRIVATE("void");
>> +
>> +	write_buf = kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
> 
> Please use sizeof(struct sh_css_sp_group) here, since you have dropped all the #ifdef-s in the header now that is the largest size which you need now.
> 
>> +
>> +	buf_ptr = write_buf;
>> +	if (IS_ISP2401) {
>> +		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(u8) * 5);
> 
> This is wrong, there is a big hole between:
> 
>         u8                      no_isp_sync; /* Signal host immediately after start */
>         u8                      enable_raw_pool_locking; /** Enable Raw Buffer Locking for HAL
>         u8                      lock_all;
> 
> and:
> 
>         u8                 enable_isys_event_queue;
>         u8                      disable_cont_vf;
> 
> filled with ISP2400 specific data now, so you are copying what likely is some empty alignment bytes before the ISP2400 specific input_formatter struct now instead of copying enable_isys_event_queue
> and disable_cont_vf.
> 
> So you need to split the memcpy into 2 memcpy calls. You can calculate the source offset of enable_isys_event_queue in sh_css_sp_group.config with offsetof(struct sh_css_sp_config, enable_isys_event_queue), or better yet, just take the address of it:
> 
> 	if (IS_ISP2401) {
> 		memcpy(buf_ptr, &sh_css_sp_group.config, 3);
> 		buf_ptr += 3;
> 		memcpy(buf_ptr, &sh_css_sp_group.config.enable_isys_event_queue, 2);
> 		buf_ptr += 2;
> 		memset(buf_ptr, 0, 3);
> 		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
> 	} else {
> 
> Also note I have dropped the "* sizeof(u8)" here, you already dropped that yourself for the memset / padding bits and dropping it makes the code easier to read IMHO.
> 		
> 
> 
>> +		buf_ptr += (sizeof(u8) * 5);
>> +		memset(buf_ptr, 0, 3);
>> +		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
>> +	} else {
>> +		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(sh_css_sp_group.config));
>> +		buf_ptr += sizeof(sh_css_sp_group.config);
>> +	}
>> +
>> +	memcpy(buf_ptr, &sh_css_sp_group.pipe, sizeof(sh_css_sp_group.pipe));
>> +	buf_ptr += sizeof(sh_css_sp_group.pipe);
>> +
>> +	if (IS_ISP2401) {
>> +		memcpy(buf_ptr, &sh_css_sp_group.pipe_io, sizeof(sh_css_sp_group.pipe_io));
>> +		buf_ptr += sizeof(sh_css_sp_group.pipe_io);
>> +		memcpy(buf_ptr, &sh_css_sp_group.pipe_io_status,
>> +		       sizeof(sh_css_sp_group.pipe_io_status));
>> +		buf_ptr += sizeof(sh_css_sp_group.pipe_io_status);
>> +	}
>> +
>> +	memcpy(buf_ptr, &sh_css_sp_group.debug, sizeof(sh_css_sp_group.debug));
>> +	buf_ptr += sizeof(sh_css_sp_group.debug);
>> +
>>  	hmm_store(xmem_sp_group_ptrs,
>> -		   &sh_css_sp_group,
>> -		   sizeof(struct sh_css_sp_group));
>> +		  write_buf,
>> +		  buf_ptr - write_buf);
>> +
>> +	kfree(write_buf);
>>  	return xmem_sp_group_ptrs;
>>  }
>>  
> 
> The rest looks good at a quick glance, but I need to take a closer look later.

I have taken a closer look at the rest of the patch now and except for my one previous remark this looks good to me.

Thank you for working on this.

Regards,

Hans

