Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D1F70861D
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 18:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjERQhk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 12:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjERQhj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 12:37:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C76DB
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684427808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qlWGmtvpmgPYSafTJYurg/qN6fjUp56disaAichymXM=;
        b=ByjpmM0Fg4ITEtqKhE++kDfNlMdZJODiisxvcwUTTO89nKdZsYmBCps0Jv+HTjk3Lckgfh
        NyQkxh2hl8p30MCCuQoFXLR3urpBVVYwlPVxwGIpV2PJV9QQWp8kbZnt9mxgn5cnqVsCLC
        SXk7SouXsio/pfEIPfL3Q9ILr+aBffU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-IuHJNf_FPSKQPwIqAAmzXw-1; Thu, 18 May 2023 12:36:46 -0400
X-MC-Unique: IuHJNf_FPSKQPwIqAAmzXw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9532170e883so91157466b.3
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684427805; x=1687019805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qlWGmtvpmgPYSafTJYurg/qN6fjUp56disaAichymXM=;
        b=HCE64hhjmmh+URIGjFi7Td53K1cIP2bHef4ahXqrPSn5S9SnvdBj8oRIR6IWQl04Qr
         UPeqeRUgntlWdztT3pdbIdVGwqu7oi4R7J9ZHyv5nMYuHX4PX9A8TGG/E8mCaQqKGj5O
         B7UwWrnnp447nPF9oQFiLf83HUU1nd8a29qcuEmNaOloBClvBjvSww/7Z/aq8Q3wJJf2
         6TL1xe5PR2sHfTrXZKK1pJhuFG2nfdfVb2I6oop3pKtTxmK4oIe5Zodpnj4QnVlkeJqx
         aaFW0lutmVAWZfu+yKY/bI204+TgUeW+T2fDzI7s/NIgNEp4YAa/ooDeLNKjxv5aSffe
         3MhA==
X-Gm-Message-State: AC+VfDx6WGtjvcbxUtJWk9wVTvOzpn6B/zHZoDGS78NdxId+lJqA2Idg
        5btWYUtCkYDhVwcuAdhX6Vbcng7J2ENY/Lx4bNGlAv45d7JqCrNugGfc5plY/Aw+VcFpblKsOBN
        6uCibpv2yN5Ho+rdFUdh1weY=
X-Received: by 2002:a17:906:6a1b:b0:96a:54e5:55d6 with SMTP id qw27-20020a1709066a1b00b0096a54e555d6mr26680034ejc.48.1684427805665;
        Thu, 18 May 2023 09:36:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6g8dxWPhvRyfHTD2kXPTAuDwcPuSWOJe4s/8IgizHEV02SPzGkJUr3qU4K+c73cgOxoYzlfg==
X-Received: by 2002:a17:906:6a1b:b0:96a:54e5:55d6 with SMTP id qw27-20020a1709066a1b00b0096a54e555d6mr26679997ejc.48.1684427805325;
        Thu, 18 May 2023 09:36:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q1-20020a17090609a100b0094f1b8901e1sm1182493eje.68.2023.05.18.09.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 09:36:44 -0700 (PDT)
Message-ID: <25c5c255-79e8-c81e-f884-36aab79fa5d4@redhat.com>
Date:   Thu, 18 May 2023 18:36:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/9] media: atomisp: Add support for v4l2-async sensor
 registration
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230518153733.195306-1-hdegoede@redhat.com>
 <CAHp75VfLyCG9AX6PhZBUMnxYCDKdnVQzOxtXO+uKgok-PREY0A@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfLyCG9AX6PhZBUMnxYCDKdnVQzOxtXO+uKgok-PREY0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/18/23 18:19, Andy Shevchenko wrote:
> On Thu, May 18, 2023 at 6:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> I'm quite happy to present this patch series which makes it possible
>> to use v4l2-async sensor registration together with the atomisp code :)
>>
>> This has been tested with both the gc0310 and the ov2680 sensor drivers.
>>
>> For now it also is still possible to use the old atomisp_gmin_platform
>> based sensor drivers. This is mainly intended for testing while moving
>> other sensor drivers over to runtime-pm + v4l2-async.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> for non-commented ones or in case you resolve remarks my way.
> 
> Definitely this does not apply to patch 9/9 which is WIP and requires
> more review, I'm still planning to go through it (not done yet).

Ugh, my bad I forgot to change the commit message of 9/9 from
my pov other then the commit message 9/9 is ready for merging

I have tested 9/9 with both the gc0310 and ov2680 drivers with
all mixes of 0 / 1 / both sensors using async (and the others
"classic" atomisp) enumeration and that all works well.

Regards,

Hans

