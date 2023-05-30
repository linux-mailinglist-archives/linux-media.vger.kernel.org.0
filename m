Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2F93715C14
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 12:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbjE3Kon (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 06:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjE3KoN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 06:44:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9351D127
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 03:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685443389;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M1/UPsscETsj7+EjeQ3PcdMeTjBlfkQ2ct8mcogpYJE=;
        b=PcsUlxEyNAM23yPXjtgSOa57BQJ2uC8PvkHzVsY++GyFOgVDNQuBFscaoa2q1NqUncgfHf
        2zbjKkPhnNM2m/q2F+RnhgVOTMj8EA6FykPCJEv9IMy/fJNMomgYIQTI63jXZXC+shFSSj
        81XC1WnQQBVKkiq49F79KOzi7AAqFOU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-VLeM05PONXSUHkfJawA0dA-1; Tue, 30 May 2023 06:43:08 -0400
X-MC-Unique: VLeM05PONXSUHkfJawA0dA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-973c42bfc38so381569166b.0
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 03:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685443387; x=1688035387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1/UPsscETsj7+EjeQ3PcdMeTjBlfkQ2ct8mcogpYJE=;
        b=PtV8huEJIGwP086s6aKjaXvte781qNcUYrxTWO3y0BdNV8NgJ/u15Fb0pIJSFCsznR
         a5YsBZNNvT9AOncoz7gKkH2CxrsyzksE7c/6gKkw51XFfK+Ig77dPhrjWva8bM/LUP8H
         HQdWCdQyQS53kyXjANUbXVI5kBmmakart1WAijGroL43n0vTE8Cu337AMlV7FwtlT1CP
         RELvrdvjwikh9cJv3XJt34qwHDcMIsSb520APxl9HfqALNgU3L28owqJnBTq90ncz46L
         ngPd5rSfCT9DY9Wx338pNp1aY+J9EgBfcM4Og/jXc/JULt1MP5g6rCYgYTKjQ+LVUosQ
         LSsA==
X-Gm-Message-State: AC+VfDyklSfn+dJm+hC4RtXkAjdwD+kUJFRoYwAIcIztdFQwdc+Y+8ok
        JdpnqfHFMPJZb2ycbibF9T5cUg3ccUDbDmu7rZMSCve24tOAmAWglkr/qjl9fsRkHVdNnQmW2TJ
        ka3BnP2bHQCf94ZCBiihRQAc=
X-Received: by 2002:a17:907:c0c:b0:973:edba:df30 with SMTP id ga12-20020a1709070c0c00b00973edbadf30mr2105045ejc.61.1685443386974;
        Tue, 30 May 2023 03:43:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5evzDwMqSKG5LE+MvE5Rf2/8ajEiE+IyPQSsI97T3G83snVmBuKn4pmFCjOc4bS5gYQMfaug==
X-Received: by 2002:a17:907:c0c:b0:973:edba:df30 with SMTP id ga12-20020a1709070c0c00b00973edbadf30mr2105027ejc.61.1685443386665;
        Tue, 30 May 2023 03:43:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u24-20020a1709064ad800b0096f67b55b0csm7142242ejt.115.2023.05.30.03.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:43:06 -0700 (PDT)
Message-ID: <6663a0c4-1c76-ef75-d4de-be4e0187f8f0@redhat.com>
Date:   Tue, 30 May 2023 12:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 13/21] media: atomisp: Add ia_css_frame_pad_width() helper
 function
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230529103741.11904-1-hdegoede@redhat.com>
 <20230529103741.11904-14-hdegoede@redhat.com>
 <CAHp75VfOfSs=mH90yusTwD1uVA4pLabvPSiZPbw_o9JuNnMR-w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfOfSs=mH90yusTwD1uVA4pLabvPSiZPbw_o9JuNnMR-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/29/23 22:57, Andy Shevchenko wrote:
> On Mon, May 29, 2023 at 1:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Factor the code to go from width to a properly aligned pitch out of
>> ia_css_frame_info_set_width().
>>
>> This is a preparation patch to fix try_fmt() calls returning a bogus
>> bytesperline value.
> 
> ...
> 
>> +       /*
>> +        * frames with a U and V plane of 8 bits per pixel need to have
> 
> Frames
> 
>> +        * all planes aligned, this means double the alignment for the
>> +        * Y plane if the horizontal decimation is 2.
>> +        */
>> +       if (format == IA_CSS_FRAME_FORMAT_YUV420 ||
>> +           format == IA_CSS_FRAME_FORMAT_YV12 ||
>> +           format == IA_CSS_FRAME_FORMAT_NV12 ||
>> +           format == IA_CSS_FRAME_FORMAT_NV21 ||
>> +           format == IA_CSS_FRAME_FORMAT_BINARY_8 ||
>> +           format == IA_CSS_FRAME_FORMAT_YUV_LINE)
>> +               return CEIL_MUL(width, 2 * HIVE_ISP_DDR_WORD_BYTES);
> 
>> +       else if (format == IA_CSS_FRAME_FORMAT_NV12_TILEY)
>> +               return CEIL_MUL(width, NV12_TILEY_TILE_WIDTH);
>> +       else if (format == IA_CSS_FRAME_FORMAT_RAW ||
>> +                format == IA_CSS_FRAME_FORMAT_RAW_PACKED)
>> +               return CEIL_MUL(width, 2 * ISP_VEC_NELEMS);
>> +       else
> 
> All 'else':s can be dropped.

Actually the whole function is really just a single switch-case,
so I've switched to that since that is even better IMHO.

Regards,

Hans



> 
>> +               return CEIL_MUL(width, HIVE_ISP_DDR_WORD_BYTES);
>> +}
> 



