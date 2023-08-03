Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 810EC76E429
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbjHCJSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235031AbjHCJS2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C4F1BD9
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691054264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UB6PWIKBgrKNLceGAE/XgjeoPTD11d1hQjAXq1VYYso=;
        b=W/4PTY7TB30IxyUjZ59Ox9IADPOnnw54rtdXSE9iGTfzGdxY5IM+UmY1uffJfBOq44Qw3O
        2oIVioQUCJXB4VJt4WVSupULMpdaIS2Z+NyjR4Q53JCQHj/FadpdEp0RwRNhxRiDAvdXkx
        9TZDq5QH21DNGvux4lzihyjtWYHYjcQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-1sjZsuvoMTeR_IK8Ug4p0w-1; Thu, 03 Aug 2023 05:17:42 -0400
X-MC-Unique: 1sjZsuvoMTeR_IK8Ug4p0w-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-521f84b8c42so453372a12.2
        for <linux-media@vger.kernel.org>; Thu, 03 Aug 2023 02:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691054261; x=1691659061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UB6PWIKBgrKNLceGAE/XgjeoPTD11d1hQjAXq1VYYso=;
        b=WqOdxJC9MwniEd1o1+MfTAsufsBiRWX1U5GQ6vzyfHrvZ9UddefGn6xx9lYuKnmrXo
         0N63RAl7Ici0obW0Y6yorj6Ntm0uUegHXFaBePewG9PhxQSRIhZU7qpXAN+NTh/6awHS
         gKNybjEpCe4RVXnq7lYVylJSg8DR/mZOIojY/kX71xlHMreNdgZ04mOl59HnCsE3qcmS
         KU35n4GLjO1F4GtSGVQbD1uwfDr0R0vZldHPml/DmVvuR/tg2LQ1kLaBsXInex+DSD1Z
         LsaiU4vzDNOETbnCHxNVbS3JEpVLhXNaR4xI7KTpVsd8YaAp5riyEnjW0bwPTQMdQkoW
         x4Wg==
X-Gm-Message-State: ABy/qLaAgDA5Tjo7MOTPmWmXIFEjiT1rziSujChl94Ku+f+xGISWTJTj
        R8WHg+fGTOoFubqfz55gbKWNyFazMF9TKb1CWZNz3CTg5t46NGb6mHxKlzNQAnhpCUXsC2Ia375
        6muiRm3edXAgxt3O4iUivMcE=
X-Received: by 2002:a05:6402:1353:b0:522:3a37:a45f with SMTP id y19-20020a056402135300b005223a37a45fmr6624408edw.21.1691054261662;
        Thu, 03 Aug 2023 02:17:41 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEEU+1eJNaofvu8+uTyWoLY6FubYZHk0SUgKMpB1q0/UN0LLnKZoBZ5PUXXdWRukA6W3b61rg==
X-Received: by 2002:a05:6402:1353:b0:522:3a37:a45f with SMTP id y19-20020a056402135300b005223a37a45fmr6624385edw.21.1691054261280;
        Thu, 03 Aug 2023 02:17:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s11-20020aa7c54b000000b0051df54c6a27sm9856026edr.56.2023.08.03.02.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 02:17:40 -0700 (PDT)
Message-ID: <5fd37f72-4c26-963b-c67d-63d00eba2101@redhat.com>
Date:   Thu, 3 Aug 2023 11:17:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 21/32] media: ov2680: Make setting the mode algorithm
 based
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230802173046.368434-1-hdegoede@redhat.com>
 <20230802173046.368434-22-hdegoede@redhat.com>
 <CAHp75VcxOTP-rdWy5CVq4m-DPCoB3fuGfBf5uP8sxqBa4v1WRQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcxOTP-rdWy5CVq4m-DPCoB3fuGfBf5uP8sxqBa4v1WRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 8/2/23 21:37, Andy Shevchenko wrote:
> On Wed, Aug 2, 2023 at 8:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Instead of using a long fixed register settings list for each resolution,
>> calculate the register settings based on the requested width + height.
>>
>> This is based on atomisp-ov2680 commit 0611888592df ("media: atomisp:
>> ov2680: Make setting the modes algorithm based").
>>
>> This will allow future enhancements like adding hblank and vblank controls
>> and adding selection support.
>>
>> This also adds properly programming the ISP window and setting
>> the manual ISP window control bit in register 0x5708, this is
>> necessary for the hflip and vflip conrols to work properly.
> 
> ...
> 
>>  struct ov2680_mode {
>>         struct v4l2_mbus_framefmt       fmt;
>>         struct v4l2_fract               frame_interval;
> 
>> +       bool                            binning;
> 
> You might save a (few) byte(s) by moving this to be the last one.

I prefer to keep it here, it is not like there are going to be 100-s of these struct in memory (in reality there will be max 2 of these in memory) .

>> +       u16                             h_start;
>> +       u16                             v_start;
>> +       u16                             h_end;
>> +       u16                             v_end;
>> +       u16                             h_output_size;
>> +       u16                             v_output_size;
>> +       u16                             hts;
>> +       u16                             vts;
>>  };
> 
> 
>> +       sensor->mode.h_start = ((OV2680_NATIVE_WIDTH - width) / 2) & ~1;
>> +       sensor->mode.v_start = ((OV2680_NATIVE_HEIGHT - height) / 2) & ~1;
> 
> ~BIT(0) in both cases?

The start coordinates need to be a multiple of 2 to not change
the bayer order so this is rounding down to a multiple of 2.
Using ~BIT(0) makes that less clear IMHO, so I'm going to keep
this as is.

> 
> ...
> 
>> +       width = min_t(unsigned int, ALIGN(format->format.width, 2),
>> +                     OV2680_NATIVE_WIDTH);
>> +       height = min_t(unsigned int, ALIGN(format->format.height, 2),
>> +                      OV2680_NATIVE_HEIGHT);
> 
> Wondering if you can switch these to use min() (with a strict type checking).
> It might require adding U/UL to the respective constants.


I'll try to switch to regular min() use here for v5.

Regards,

Hans



