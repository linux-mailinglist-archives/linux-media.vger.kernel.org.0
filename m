Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC777072AF
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 22:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjEQUDH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 16:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjEQUDG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 16:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40EE0115
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684353745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zLZnJaLN0n+wdG5gMmca7s8DNaXLda/zUpeeDF5C+Zc=;
        b=UdPU0rE+0yhB40KWZq1kYy7mJtJT3AG4AJaDewhlv4V6c+8eTUMQlTPVCsdhHyCAlInd/6
        IG1ReCH5GWYMAlOruVgmFJNnnOsKdlSvsBGvwM3Sj4gN2GW12H0LPUJcp4oMCnUTnpX8SI
        UDJqVms8WovVLo9u48fhmXkyyWuGO0w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-G81UeMc4P0y9Z_MKVUBZeQ-1; Wed, 17 May 2023 16:02:22 -0400
X-MC-Unique: G81UeMc4P0y9Z_MKVUBZeQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-969c378d138so133221266b.1
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 13:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684353741; x=1686945741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLZnJaLN0n+wdG5gMmca7s8DNaXLda/zUpeeDF5C+Zc=;
        b=ZYqmoKt0vF+LoZu5QCN4DfdAJHQ+cQjDAn9pig6F7JNyAxovrGFUVhSRc4Sp4Ai/D9
         rVaI6j0FzM7ITACmGPdp21geLnceHvf7glNWLO5omrKIIgj6a0Bca5PhQm6m+3sPuVcL
         xX2NtCiapTzKeCz9PCbb7v2bMOYBgYj6MiJRIfuBxQZMtNzB4RV59UGo2qQtJnMCNiDH
         TrKks3rTNeS+o8ddB70gqn9YZLbcv9TK5Xy31Q4sybklGCzJ+Ly1X3qsaIeso4e2yecG
         dX9oUbCWq7VbsYCKNGrq5MUrPdqoO/K/sMllOLMrSpNoB+k7pghCUVxreAX1VRWct++V
         6drA==
X-Gm-Message-State: AC+VfDz5eKlFnFAD3//oFcmoauPDWUuu7vS56FOkwsCnmnmXf4gIVgqN
        Y7raPYRREyFRoX/9vL80Numn+OK7nmdvznzJkkcLWGwUeoIitFxJtPIy6ukgHkZnnRsfmU/Kt3W
        aJTjQccMHCFOK1Afkc5eogyo=
X-Received: by 2002:a17:907:3f0a:b0:967:e015:f536 with SMTP id hq10-20020a1709073f0a00b00967e015f536mr33885899ejc.75.1684353740942;
        Wed, 17 May 2023 13:02:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hCEdV9EGFSF3Lsf4LSwyqA1NutHTL7g1WGrs4JzW3xdVjq5qShbntTNnCiPit7Cmy++w9AA==
X-Received: by 2002:a17:907:3f0a:b0:967:e015:f536 with SMTP id hq10-20020a1709073f0a00b00967e015f536mr33885872ejc.75.1684353740670;
        Wed, 17 May 2023 13:02:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a10-20020a170906368a00b0096b275e19cbsm5007419ejc.115.2023.05.17.13.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 13:02:20 -0700 (PDT)
Message-ID: <2c4c8ba1-f5ca-a4bc-d4c8-1fe45b1654b6@redhat.com>
Date:   Wed, 17 May 2023 22:02:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/30] media: atomisp: Register only 1 /dev/video# node +
 cleanups
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230513123159.33234-1-hdegoede@redhat.com>
 <CAHp75Ve413+r6jE=h-n0tibU5xy5iAMfbB3H8MPpgjRD3bj-eA@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve413+r6jE=h-n0tibU5xy5iAMfbB3H8MPpgjRD3bj-eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/13/23 22:59, Andy Shevchenko wrote:
> On Sat, May 13, 2023 at 3:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Here is an atomisp patch-series to continue the simplification /
>> exotic feature removal of atomisp. Specifically this series
>> makes atomisp register only 1 /dev/video# node.
>>
>> The other patches are some preparation + follow-up work for
>> this change, as well as a whole bunch of folow-up clean-ups.
>>
>> The cleanups focus on removing the various count / users functions
>> which atomisp used before when there were multiple nodes. This
>> is preparation work for eventually allowing opening the same
>> node multipe-times, as is normal for standard v4l2 /dev/video#
>> nodes.
> 
> As usual
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> for non-commented and otherwise depending on your answers. I.o.w. feel
> free to add if you are going to address as I suggested.

Thank you for all the reviews.

I've pushed a new version of the patches addressing all your
comments and adding your Reviewed-by to:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

Regards,

Hans


