Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 871504D7198
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 00:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbiCLXtx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Mar 2022 18:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbiCLXtw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Mar 2022 18:49:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5BADA369CA
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 15:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647128924;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l2x5t1DTMrr+F4JZEN4o27QeKTa0qaAj+e9wVSLV6fQ=;
        b=Bg9WBobaHZrn+u0tSAI9wdXV2fw2Mr2W6cNUTvV29Eya0P2rVllBje8cOLTx5qGCzEE9B+
        092+TDYb6mVAR8M7at2/gPLh5B7xZhouFrj242Rv1CMwQlnx1PMGCDGG929UNBip0V4HOV
        Cm2Z8iu2erOrm/Eab6U5dKfRamp4Rvo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-FTwqxbI_MVSR4h3B9LE5cQ-1; Sat, 12 Mar 2022 18:48:42 -0500
X-MC-Unique: FTwqxbI_MVSR4h3B9LE5cQ-1
Received: by mail-qk1-f200.google.com with SMTP id 207-20020a3706d8000000b0067b322bef9eso8861542qkg.3
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 15:48:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=l2x5t1DTMrr+F4JZEN4o27QeKTa0qaAj+e9wVSLV6fQ=;
        b=OZYWh9DB4nfLv75nGBbBLWv8vIkBJ+agpH7loA5MVaN0R9lFxjjizSomNTRoA94KJk
         VKWRZzStWSlVg1RbiFy5oIgSbItkm8OF+9QmsbUSQjFJdP07uDrNa+pW+iUV0habNlIV
         dZCRcs7tA9ttdMd3MFzeQH3ejwbiGrpSuJDZ3ng8zs86s7vF9JroEw3/3X5ur0Ot4j6q
         sJ168vg7SuiQMLvuUQKPpPvzFccWjs5n4dHayoJcQWafWSm2hHfRocpXlMOQdtK1dkEz
         Yn5We1QhBSG72eK3FnG4udGqREePsIte20zKlr3RXZq9htRcvHJq9+jIHmyL6q0oazLv
         uzAQ==
X-Gm-Message-State: AOAM531KG/RwlZwTIiHZCfomoKxsHCpVV7YERuAxRdfdp7yS0INSQ26T
        DvuxPhYdEMJ30wffk2+Xd4+is5zRj1EurzZQKiPIS+M2SBdghHXjUrQ90U9eSL2dUiM7yWogn1h
        7KauO/WL83frDfSrCsaonO84=
X-Received: by 2002:a37:4550:0:b0:473:b21a:5c90 with SMTP id s77-20020a374550000000b00473b21a5c90mr10220973qka.158.1647128922336;
        Sat, 12 Mar 2022 15:48:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTmHxO4uNTRJa2T6jaaBQ3swvJN6GUQj6QJkiVPbAOilb5IQ0I7gj2PGDGbNE/dYh9g10U6A==
X-Received: by 2002:a37:4550:0:b0:473:b21a:5c90 with SMTP id s77-20020a374550000000b00473b21a5c90mr10220965qka.158.1647128922110;
        Sat, 12 Mar 2022 15:48:42 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id o21-20020ac85a55000000b002e16389b501sm8462867qta.96.2022.03.12.15.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Mar 2022 15:48:41 -0800 (PST)
Subject: Re: [PATCH] media: stkwebcam: move stk_camera_read_reg() scratch
 buffer to struct stk_camera
To:     Pavel Skripkin <paskripkin@gmail.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, cai.huoqing@linux.dev,
        xose.vazquez@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220312173049.1410977-1-trix@redhat.com>
 <65a1d178-8511-a023-2655-94540114086c@gmail.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <c3723690-cacb-0c42-cc5d-397a3363b4da@redhat.com>
Date:   Sat, 12 Mar 2022 15:48:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <65a1d178-8511-a023-2655-94540114086c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/12/22 11:58 AM, Pavel Skripkin wrote:
> On 3/12/22 20:30, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> In stk_camera_read_reg() a single byte buffer is alloc-ed and
>> freed on every function call.  Since the size is known,
>> move the buffer to the struct stk_camera where it will be alloc-ed
>> and freed once.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/media/usb/stkwebcam/stk-webcam.c | 11 ++---------
>>   drivers/media/usb/stkwebcam/stk-webcam.h |  2 ++
>>   2 files changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c 
>> b/drivers/media/usb/stkwebcam/stk-webcam.c
>> index 5b822214ccc5c..787edb3d47c23 100644
>> --- a/drivers/media/usb/stkwebcam/stk-webcam.c
>> +++ b/drivers/media/usb/stkwebcam/stk-webcam.c
>> @@ -150,25 +150,18 @@ int stk_camera_write_reg(struct stk_camera 
>> *dev, u16 index, u8 value)
>>   int stk_camera_read_reg(struct stk_camera *dev, u16 index, u8 *value)
>
> And just random note: there are 4 possible uninit value bugs.
>
> stk_start_stream() calls stk_camera_read_reg 4 times, but ignores 
> return values.
>
> stk_camera_read_reg() should have __must_check annotation and return 
> value should be checked on each call.
>
>
> If you have time you can take care of it :) Or I will fix it one day...

These do show up in my usual static analysis and it why I was looking at 
this file.

And was sidetracked by the short malloc.

Unfortunately I looked and there are many other similar instances 
treewide ~100

These aren't caught in checkpatch, so working on that..

Tom

>
>
>
>
>
> With regards,
> Pavel Skripkin
>

