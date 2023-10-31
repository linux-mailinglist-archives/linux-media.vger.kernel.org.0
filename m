Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9790F7DCA3D
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 10:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbjJaJz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 05:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjJaJzZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 05:55:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5424583
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 02:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698746076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jee9+MISFVou7ihsYybK0NoiswXAd2Q2fTZE8U7jIkw=;
        b=SPGgxBAXKm++ET8NXbzSzNjT/syMiaAmcAC3a1hlUpmpVdtQ4ecHgz9O/5P/OueaDoQDi+
        tFDCDe6gBZ8PjncL7bidYWE2UCGBqeTeAjy2caL6O2/jqKe2q+eOWnrGTmEsZTPKoOJlXx
        e3CGLHjRyR5oWsPIwxDXhL0WalfRgSg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-mG4Xa_8bMh-pELBqw-Bm_g-1; Tue, 31 Oct 2023 05:53:19 -0400
X-MC-Unique: mG4Xa_8bMh-pELBqw-Bm_g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9c983b42c3bso717831566b.1
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 02:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698745998; x=1699350798;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jee9+MISFVou7ihsYybK0NoiswXAd2Q2fTZE8U7jIkw=;
        b=ReXIZTJujRdWNgOnDWYMFpko0g0aF2JbdB85eCk9Gi4TE7wHTR5myQFdRMQHR0SiAk
         HiqUJRUyqeJD4OtSvybdByBDT5G4TJFQBRNdIUkGhSFy8CWj14irDt8lmaT0Xdl5qpos
         ZM3Zxla0anuAhf9xsTFxZys0o7C88cV33NUIGXfomsvfkvwRNZZZmwaSXf7BaU94GVY1
         IUd9+BW1olibd3JP3jZFp+KBcEt8ym4mPY+GTino6mNcYt2ByOk3xtI3eys11/SloVb6
         UEAAI/SYdcMVa1XbZTWiOGsUUHmVJWdbmO0cs7S2dZhG5+uAgK26JVaWMCvA1woF6Rto
         OtQg==
X-Gm-Message-State: AOJu0Yy/5DTepQ/YMdvRvHn0unXK6aowdju4PJ7swrgPfWS3GftSUP+e
        yr+/GkrgibIOrxa2P502mFfmQODbu+j3ln0FYyUh8IhQZnOky4BYX9i+QOHHszXUo42m/G/Ncmn
        lV/jX035PQRp3w/dj1WiupKwVFXaOkITCOOXHEFAitHavAhgBQuWqK9rHSkbfGkdGPqkoyQKBVL
        zkFC91B1w=
X-Received: by 2002:a17:906:c14d:b0:9a9:f0e6:904e with SMTP id dp13-20020a170906c14d00b009a9f0e6904emr1970955ejc.16.1698745998205;
        Tue, 31 Oct 2023 02:53:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGog2vgMsxQFbHvYxRGC9QKJNRZvzX/anyxk/T7Q8hocQXins1oR6dBYSWwrCME/Q5ruOenoA==
X-Received: by 2002:a17:906:c14d:b0:9a9:f0e6:904e with SMTP id dp13-20020a170906c14d00b009a9f0e6904emr1970943ejc.16.1698745997815;
        Tue, 31 Oct 2023 02:53:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gz22-20020a170906f2d600b0099cd008c1a4sm678223ejb.136.2023.10.31.02.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 02:53:17 -0700 (PDT)
Message-ID: <962d6d0c-2263-fe59-011c-09068a6a4cef@redhat.com>
Date:   Tue, 31 Oct 2023 10:53:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC] regmap_range_cfg usage with v4l2-cci
To:     linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        Alain Volmat <alain.volmat@foss.st.com>
References: <20231030173637.GA2977515@gnbcxd0016.gnb.st.com>
Content-Language: en-US, nl
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

<resend with Alain added to the To: for some reason reply-to-all did not add Alain>

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

To be clear if you plan to implement the devm_cci_regmap_init_i2c_ex()
variant, then this should be done in the first patch adding the:

struct v4l2_cci {
	struct regmap *map;
	long flags;
};

bits, so that we don't have to add an extra 0 argument for the flags to
all the existing callers of devm_cci_regmap_init_i2c() in that patch.

And then a future IMX driver conversion can use the _ex variant.

Regards,

Hans

