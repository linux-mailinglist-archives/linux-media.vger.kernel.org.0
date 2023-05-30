Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F46C715BF2
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 12:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjE3Khi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 06:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjE3Khg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 06:37:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1544A8F
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685443009;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2C272nEx9s9eB+T4qDCUTRMED0MJS1yr52s8S2qnGlw=;
        b=VQM1yIsMbVa3212yb9fYDQl2ZL7GpHFitCs4u9CUKbLxD3s7+JUHK7ibZgMWLkeWXkhwjQ
        2tPexkAQIAlsfuJ1wqzsq8w1WHNB3yHff6BCdlV7Amq4yWT2ZqUwbTLK6glK6Urgw9Jw9U
        DQOO9GAMD1bCY3KTGPLHzYvHYA5Z9Qc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128--5nCj0MPO8KXikGUyhhdWg-1; Tue, 30 May 2023 06:36:47 -0400
X-MC-Unique: -5nCj0MPO8KXikGUyhhdWg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a34e35f57so380361066b.3
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 03:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685443006; x=1688035006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2C272nEx9s9eB+T4qDCUTRMED0MJS1yr52s8S2qnGlw=;
        b=RkB0WZSKgrnC6ZgcDJTGiOASD36PK7YkJv0Re5NneitOnR5IyLy3Dv7vxPyLmbsIjL
         3dqSJnL05fZb7iFFMFxe50sNJVCqBsBQ31ZDzhrD7FIfaIzk2k+wEZOvn7oqrYzJKRae
         gZ7Pkj73SImJJGfWAWIazzsrKD5TOuZ3ay0+UhMjNy2ra31AAMTXFG41K48Ltb1B7g5W
         4pDk7BlsF8CPxfR4BD9fuCjdoJ8tY2161X6mP+8rRS58G9Po8pVq+XWJEadpxBBERdR1
         t1HJ0Jd84Ky6geYw0Czu90UnH7PufabQl4gulbkJpvRMOQEpMLE5VX7wxWoQlBONAhqb
         ljKA==
X-Gm-Message-State: AC+VfDwJ/40YPKUlsqDNiVMx+eYquI1eULr5NR9yj6ZN44C8ckukgL8h
        akMxc94k6bbblheM1P3zPrUwx/1c8GPlIK5rcdydozp97I554egtmYCpwTjYd9eJ6Fr+xxuwLbW
        kfvcwajqNQnvASpqGGetQB7M=
X-Received: by 2002:a17:907:9718:b0:96a:90bb:a2d3 with SMTP id jg24-20020a170907971800b0096a90bba2d3mr1733530ejc.71.1685443006507;
        Tue, 30 May 2023 03:36:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7JVVeVFsK96/1s1szL11Kj5OycsPWwb9NQRpwztATo9n2vEZwn2AqIjlw8ZTzQBS+MTmJc6g==
X-Received: by 2002:a17:907:9718:b0:96a:90bb:a2d3 with SMTP id jg24-20020a170907971800b0096a90bba2d3mr1733516ejc.71.1685443006197;
        Tue, 30 May 2023 03:36:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u21-20020a170906b11500b0096f738bc2f7sm7216670ejy.60.2023.05.30.03.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:36:45 -0700 (PDT)
Message-ID: <b8059e0a-8a95-ce5e-ccd5-786ac9ee6abc@redhat.com>
Date:   Tue, 30 May 2023 12:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/21] media: atomisp: ov2680: Implement selection support
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
 <20230529103741.11904-7-hdegoede@redhat.com>
 <CAHp75Vd0n8HHv2nguQFHvoRuqjwAAj=YdmgMGckg+1q-NLptFw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd0n8HHv2nguQFHvoRuqjwAAj=YdmgMGckg+1q-NLptFw@mail.gmail.com>
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

On 5/29/23 22:31, Andy Shevchenko wrote:
> On Mon, May 29, 2023 at 1:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Implement selection support. Modelled after ov5693 selection support,
>> but allow setting sizes smaller then crop-size through set_fmt since
> 
> than
> 
>> that was already allowed.
> 
> ...
> 
>> +static struct v4l2_rect *
>> +__ov2680_get_pad_crop(struct ov2680_dev *sensor, struct v4l2_subdev_state *state,
>> +                     unsigned int pad, enum v4l2_subdev_format_whence which)
>> +{
>> +       switch (which) {
>> +       case V4L2_SUBDEV_FORMAT_TRY:
>> +               return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
>> +       case V4L2_SUBDEV_FORMAT_ACTIVE:
>> +               return &sensor->mode.crop;
>> +       }
>> +
>> +       return NULL;
> 
> I would move this to default: case.

That may cause the reader of the code to think that there are other cases,
which there are not. All possible values of enum v4l2_subdev_format_whence
are already handled, otherwise the compiler would also complain.

The "return NULL" is there to shut up other compiler warnings.

I'll add a /* never reached */ to it to make this clear.

Regards,

Hans


