Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730BB7DC9D7
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 10:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjJaJrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 05:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjJaJrR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 05:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CDAF3
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 02:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698745592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JthG3/Ss5dDB1+OSSJCHUu9P7vyIsrxqViWpo/6mIEw=;
        b=bzGdKeJq0LeQmB52QUWoivG6QQlkzQ4uWIvVUy79De9RwBaQaP/jq6YTIa4Eg9g8EtMJ5O
        sJm2pceJGnYHZga15Zypyu+fIGQ3CxPDqN0B2s9xR1C39QywEg5Qj3aaMq6BHlXV5kIypt
        zods6p5Azj+uuMpnTf5Oae1xk77hYQM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-mXM9CyBAOmG-fKQUcmJ2RA-1; Tue, 31 Oct 2023 05:46:31 -0400
X-MC-Unique: mXM9CyBAOmG-fKQUcmJ2RA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae686dafedso396344166b.3
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 02:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698745590; x=1699350390;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JthG3/Ss5dDB1+OSSJCHUu9P7vyIsrxqViWpo/6mIEw=;
        b=FvzXX+A98uJ3up4VpbtPBPjq0+ISrxS15mFG9ttKv2Q4y80y0/IeJUMIiSKPgEO11W
         DPQI8y6AuMCBMcp1HJen+wPw7jJy9GGTWCgKHjcA0H8hte6X3F7qQ3BiHFDfCBuTW0tD
         ajfqRjWi16b9CDPPxIhhJrlymvreIGyGoJcygQtzx5abuTeX4+x7p+NGk3pcpb+Lozfz
         PuuMl+gZ3KjqyF3u5uoiQEIj5PG3Trxks+qaex3JAGerhYzBNjOnF8ImC4RSjy88WO/M
         RMERPastlxn1wTJxYKcgzq0A5wL8K3RhnI7On8f4Vk3KLIiPAXjMLp0b5dFT3sQu2UDE
         EHxw==
X-Gm-Message-State: AOJu0Ywr8DkrXaXOtOvsKGhodVr1jM2lObH5CySN43e9rom1kACw4ai2
        Ux1GCrFdegDH/EyRgibmMCAFX1qKtLJqA1y4NTZ8uSCF4m1cA7mAlXcQ3vPbF4PqGN9G9c/CvpH
        l/evAvLN+EwRs6sSP4O3bX5TLC4dfUzQdySt2nYP4/lP4cd+EQKIWdUVqUgKWTJcQ340ULdRUoK
        fz27yW5mM=
X-Received: by 2002:a17:907:60cd:b0:9be:45b3:3116 with SMTP id hv13-20020a17090760cd00b009be45b33116mr11379902ejc.71.1698745590032;
        Tue, 31 Oct 2023 02:46:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWtUc9po/jCzLDBDCzywlaVoaWiSkgDpZ0I/5xRcGHiRX27NjRhmOhbAoqUlNdIoyo9PWj6Q==
X-Received: by 2002:a17:907:60cd:b0:9be:45b3:3116 with SMTP id hv13-20020a17090760cd00b009be45b33116mr11379881ejc.71.1698745589554;
        Tue, 31 Oct 2023 02:46:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lf14-20020a170906ae4e00b00992b510089asm670760ejb.84.2023.10.31.02.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 02:46:29 -0700 (PDT)
Message-ID: <c1a13a65-5798-8a14-1913-0cc33beec0c0@redhat.com>
Date:   Tue, 31 Oct 2023 10:46:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC] regmap_range_cfg usage with v4l2-cci
Content-Language: en-US, nl
To:     linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
References: <20231030173637.GA2977515@gnbcxd0016.gnb.st.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231030173637.GA2977515@gnbcxd0016.gnb.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alain,

On 10/30/23 18:36, Alain Volmat wrote:
> Hi,
> 
> Goal of this email is to get first comments prior to posting a patch.
> 
> Could we consider enhancements within the v4l2-cci in order to also
> allow regmap_range_cfg usage for paged register access ?

Yes definitely.

Extending v4l2-cci for other use cases was already briefly discussed
between Kieran (Cc-ed) and me:

The CCI part of the MIPI CSI spec says that multi-byte registers are
always in big endian format, but some of the Sony IMX sensors actually
use little-endian format for multi-byte registers.

The main reason why we need v4l2-cci and cannot use regmap directly is
because of the variable register width in CCI, where as regmap only
supports a single width. v4l2 cci uses 8 bits width in the underlying
regmap-config and then takes care of multy-byte registers by e.g.
reading multiple bytes and calling e.g. get_unaligned_be16() on
the read bytes.

For the IMX scenario the plan is to add the notion of v4l2-cci
flags by adding this to include/media/v4l2-cci.h :

struct v4l2_cci {
	struct regmap *map;
	long flags;
}

And then change the prototype for devm_cci_regmap_init_i2c() to:

struct v4l2_cci *devm_cci_regmap_init_i2c(struct i2c_client *client,
                                          int reg_addr_bits, long flags);

And have devm_cci_regmap_init_i2c():
1. devm_kmalloc() a struct v4l2_cci
2. store the regmap there
3. copy over flags from the function argument

Combined with modifying all the other functions to take
"struct v4l2_cci *cci" as first argument instead of
"struct regmap *map".

This change will require all existing sensor drivers using
v4l2-cci to be converted for the "struct regmap *map" ->
"struct v4l2_cci *cci" change, this all needs to be done
in one single commit adding the new struct + flags argument
to avoid breaking the compilation.

Then once we have this a second patch can add:

/* devm_cci_regmap_init_i2c() flags argument defines */
#define V4L2_CCI_DATA_LE	BIT(0)

to include/media/v4l2-cci.h and make v4l2-cci.h honor
this flag solving the IMX scenario.

We need to make this change sooner rather then later,
while we only still have a few sensor drivers using
v4l2-cci.

So back to your question yes extensions are welcome
and we already have one planned. If we are going to do
more extensions though, then I really would want to see
the little-endian data plan get implemented first, having
our own struct v4l2_cci should help with future extensions
were we can then just add more fields to it if necessary.

I'm sorry about asking you to implement this first before
being able to solve your own problem, but this should be
relatively KISS to implement and I can test the patches
for you for at least some of the sensor drivers.

> At least two drivers currently being upstream and using v4l2-cci infrastructure
> could benefit from regmap_range_cfg.
> The GC0308 driver is partially using v4l2-cci and partially regmap (in order to use
> regmap_range_cfg) and the GC2145 driver is using v4l2-cci but doing paging manually.
> 
> The function devm_cci_regmap_init_i2c is already taking as parameter one argument
> reg_addr_bits to be used in the regmap_config structure.  We could also add
> regmap_range_cfg pointer and size arguments to the function or
> alternatively add another init function with more arguments ?

I think adding a devm_cci_regmap_init_i2c_ex() would make sense here, this
could already be done when adding the flags argument, giving only
devm_cci_regmap_init_i2c_ex() the flags argument. For just the flags argument
having a _ex seems overkill but if we are going to add regmap_range_cfg pointer
and size arguments too then I think an _ex makes sense.

And then in v4l2-cci.c only have the _ex and have a static inline helper
in v4l2-cci-h defining the non _ex version ?

Note this devm_cci_regmap_init_i2c_ex() variant is just an idea /
suggestion I'm open to discussion about that.

Regards,

Hans



