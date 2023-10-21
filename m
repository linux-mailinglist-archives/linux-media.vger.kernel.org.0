Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5BB47D1CEF
	for <lists+linux-media@lfdr.de>; Sat, 21 Oct 2023 13:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbjJUL56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Oct 2023 07:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjJUL55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Oct 2023 07:57:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FF21BF
        for <linux-media@vger.kernel.org>; Sat, 21 Oct 2023 04:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697889434;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8A5YPNn+IwEItuJ1G2OC4z10xXdMM8+6p/08c4lncco=;
        b=VFlp+yuJRX5nJDCVrSOs11MBGS7peuCCCwCwb2mMbcAC/MnN8U/gnl8bXKexBd2LxqLtuJ
        i2CMalBELAho6IN6tCkoeIRLQU/G5xcOD4V8TO+dcv6ZhlNTs8Lh9Y6UsmTYdUfys/A6L3
        gI2KttUeEYtCHXXdMsZaypnM2arBagI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-YGk78GehN7uw0zHb2S86DA-1; Sat, 21 Oct 2023 07:57:10 -0400
X-MC-Unique: YGk78GehN7uw0zHb2S86DA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5079a8c68c6so1623774e87.1
        for <linux-media@vger.kernel.org>; Sat, 21 Oct 2023 04:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697889429; x=1698494229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8A5YPNn+IwEItuJ1G2OC4z10xXdMM8+6p/08c4lncco=;
        b=a4ovHfnlc0FySFkZB+/iRQXHyiqjfbaUtMfLCOI8IaERYXL+0L9/sKeNAxVKR6MLXF
         4Auj+6OJ9kjtbGDN6qqf62E/FkuhrQTHc+9daQJ59CVl0xX0UIOMORgnlL7JwCTFg5Hs
         6MFtreFDm45k2W/1mVF6qcGilDfHR9CGAdgV4RaBB3deQpobHznxB3gPAVKtx9bdV+Y6
         nM2iYdMISFNuz3ETGbDA2Rw1D7W7MNv4xkJ+ulVp6dtNrNQ+3Etm3+Ao3lks7H54WmDZ
         HGt6dq9k8UJMDrJezrY7tCpJomvKyHqqCyU3KrkbCDi9JzL4LXsLmo4kaZWUK0488GMq
         1XoA==
X-Gm-Message-State: AOJu0Yx52BcX1YFZ8rgoHBgs6weJW8BT6ZgiqNSN1+Dc1QzWz/GCSdNX
        kzRcHQaC8D21dAxKqATVxXfRFzsfEOMKBYhga2H/lCnPrhi0PlzeSy6lQNrKrzqo64u1qz7eFBj
        2ZNE3LYdNN80zd9egOT9kJG0=
X-Received: by 2002:a19:6742:0:b0:507:9a00:c169 with SMTP id e2-20020a196742000000b005079a00c169mr3461930lfj.5.1697889428947;
        Sat, 21 Oct 2023 04:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRg2tiyoJnYcPUczv2CKzX9otDeCiprhYPsEiOsrC6j2ShP6Mn99ICxaoSBra/sl4K9VMnBw==
X-Received: by 2002:a19:6742:0:b0:507:9a00:c169 with SMTP id e2-20020a196742000000b005079a00c169mr3461922lfj.5.1697889428601;
        Sat, 21 Oct 2023 04:57:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w21-20020a50d795000000b0053e4d1cbc6esm3392994edi.55.2023.10.21.04.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 04:57:06 -0700 (PDT)
Message-ID: <acf1fade-7693-9332-03b1-626f4949f9ff@redhat.com>
Date:   Sat, 21 Oct 2023 13:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND] staging: media: atomisp: Removed duplicate comment
 and fixed comment format
To:     Jonathan Bergh <bergh.jonathan@gmail.com>,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20231021110058.85013-1-bergh.jonathan@gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231021110058.85013-1-bergh.jonathan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan,

On 10/21/23 13:00, Jonathan Bergh wrote:
> Fixed the following issues:
>  * Removed a duplicate comment
>  * Fixed up minor comment format issue
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>

Thank you for your patch, but please don't resend
it every week.

I did see the original patch and it looks fine but
I have not had any time to work in atomisp support
recently and this does not seem like something
which needs to get merged urgently.

I'll pick this up next time I have time to do
a bunch of atomisp work.

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/i2c/gc2235.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
> index 55ea422291ba..ade28950db73 100644
> --- a/drivers/staging/media/atomisp/i2c/gc2235.h
> +++ b/drivers/staging/media/atomisp/i2c/gc2235.h
> @@ -74,9 +74,6 @@
>  #define GC2235_COARSE_INTG_TIME_MIN 1
>  #define GC2235_COARSE_INTG_TIME_MAX_MARGIN 6
>  
> -/*
> - * GC2235 System control registers
> - */
>  /*
>   * GC2235 System control registers
>   */
> @@ -167,7 +164,7 @@ enum gc2235_tok_type {
>  	GC2235_TOK_MASK = 0xfff0
>  };
>  
> -/**
> +/*
>   * struct gc2235_reg - MI sensor  register format
>   * @type: type of the register
>   * @reg: 8-bit offset to register

