Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B95646EF378
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 13:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240408AbjDZLfW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 07:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240028AbjDZLfV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 07:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9803A91
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682508878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TcFHYmE9eSf6Aa8aneAvxOqMLzSM/o9Xb/3ty4/Hoek=;
        b=UZI4nfEOf72nvFUqPGqnigSzUXXPX10qJBVJ5QeQKAzXZ+eEZizQfzE3/lopqApPQ9GrXC
        +v+EurfDKnCa9H767DV53TkHSsI0c2aT2Ca3wmitmD7lUiXA5ofMkQ+5Fegeo3ExS8Swsv
        CO3pCJYlwe3+Xt3XzlN2bLzFBRgTao8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-PDor7ecIMPGfBZWXIlNUbQ-1; Wed, 26 Apr 2023 07:34:36 -0400
X-MC-Unique: PDor7ecIMPGfBZWXIlNUbQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9537db54c94so656548866b.2
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 04:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682508876; x=1685100876;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcFHYmE9eSf6Aa8aneAvxOqMLzSM/o9Xb/3ty4/Hoek=;
        b=cSLBvw84ly9l/wUEy44eWygO36VDmXxqohOANUrAPP5e94XVFIJtPC3Fzmbailm63q
         U8RraAxYBC7e135sdDMZ9+IUKIx01e/An66HnQXIZ3KTw7cmTxWNuhIWUmfKoQ7SAGeC
         JRVixuerdotOc4pV0ql0jQKTuOvDPhcWNVoCWtEgMZIbyM1iDeno+RzrbIYmmu78l+vH
         6kv6S9+fdAMCS4qOwTm/w5G8YSbVJZ05CQMFG1eGUTfqKsWxAV8qVlG3vv7E+te7y0MG
         76mD2jJRd4MKvIr8cEoWEbpPWnA+iUl5SqgxRhW1tqtl4CJva4Z4Xxs1cIgJmI4sA17e
         JZvw==
X-Gm-Message-State: AAQBX9c+MTEGIAsjuqGa2xiQxQtTgl1GIHLTmZGa92PuD27s3e2fPebx
        fvjO+WSw7NzXENN90sIaphIYcUf6c/qduaHKmF8/XMKNVzkWK+iZhgIR1OLOolxZ+Ekmqn8GzDg
        oecwRplkpL+rLDqdRNO1TNOo=
X-Received: by 2002:a17:906:5fd2:b0:94e:ea6d:fa98 with SMTP id k18-20020a1709065fd200b0094eea6dfa98mr16119422ejv.28.1682508875874;
        Wed, 26 Apr 2023 04:34:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350aEqj6dzeTlQ89eyM3kWqnhwRaKKQ7uieU6JW6FZ/shKhrG4rhkrg7WUIh6YYdTRbTWP4R8ww==
X-Received: by 2002:a17:906:5fd2:b0:94e:ea6d:fa98 with SMTP id k18-20020a1709065fd200b0094eea6dfa98mr16119401ejv.28.1682508875575;
        Wed, 26 Apr 2023 04:34:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906705400b0094f05fee9d3sm8150732ejj.211.2023.04.26.04.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 04:34:35 -0700 (PDT)
Message-ID: <2fd56895-3f2e-83d7-46d4-c97eaf72d9e8@redhat.com>
Date:   Wed, 26 Apr 2023 13:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/5] staging: media: atomisp: runtime: frame: remove
 #ifdef ISP2401
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230425074841.29063-1-hpa@redhat.com>
 <20230425074841.29063-3-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230425074841.29063-3-hpa@redhat.com>
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

On 4/25/23 09:48, Kate Hsuan wrote:
> The actions of ISP2401 and 2400 are determined at the runtime.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  .../media/atomisp/pci/runtime/frame/src/frame.c   | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> index 83bb42e05421..425e75f7dda7 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> @@ -601,9 +601,9 @@ static void frame_init_qplane6_planes(struct ia_css_frame *frame)
>  
>  static int frame_allocate_buffer_data(struct ia_css_frame *frame)
>  {
> -#ifdef ISP2401
> -	IA_CSS_ENTER_LEAVE_PRIVATE("frame->data_bytes=%d\n", frame->data_bytes);
> -#endif
> +	if (IS_ISP2401)
> +		IA_CSS_ENTER_LEAVE_PRIVATE("frame->data_bytes=%d\n", frame->data_bytes);
> +
>  	frame->data = hmm_alloc(frame->data_bytes);
>  	if (frame->data == mmgr_NULL)
>  		return -ENOMEM;

This is just a debug log message, IMHO it is best to just completely remove
the message for both ISP models.


> @@ -635,11 +635,10 @@ static int frame_allocate_with_data(struct ia_css_frame **frame,
>  
>  	if (err) {
>  		kvfree(me);
> -#ifndef ISP2401
> -		return err;
> -#else
> -		me = NULL;
> -#endif
> +		if (IS_ISP2401)
> +			me = NULL;
> +		else
> +			return err;
>  	}
>  
>  	*frame = me;

This one is also weird. I have checked the only caller of this and it
does not matter what *frame is set to since as long as this returns
non 0 the *frame is ignored and the functions always returns err
(just outside of the context of the patch).

So this can be simplified to just:

	if (err) {
		kvfree(me);
		me = NULL;
	}

And then fall through to the original code of:

  	*frame = me;

	return err;
}


The me = NULL is not strictly necessary but setting *frame = NULL
on errors is a bit cleaner and may help catch future bugs.

Regards,

Hans






