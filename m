Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5406ABD26
	for <lists+linux-media@lfdr.de>; Mon,  6 Mar 2023 11:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjCFKoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 05:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbjCFKou (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 05:44:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB94F761
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 02:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678099442;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iDesKEH7zvriBWTq7JexRfulhrKSrhU4sKAOril+/8I=;
        b=Hp3lwklPjdjeRDkJ1G1DqSstbx05kPyqsRghkH8MKNBdaIM8/nv/Ibg/fi3NxmSTr+rVxN
        fIOynbzTkVRB4+YyFO0JqmP0SgYyMeEg6TIXaf2iX/+8zRGnpiq18lIjmPovAQ5t16E7Vu
        p1RIOYHGIzb5bhpS7AkpvkFbfru1coY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-X131ZF6INESMbVsL8Pjl6Q-1; Mon, 06 Mar 2023 05:44:01 -0500
X-MC-Unique: X131ZF6INESMbVsL8Pjl6Q-1
Received: by mail-wm1-f72.google.com with SMTP id j6-20020a05600c1c0600b003eaf882cb85so3564518wms.9
        for <linux-media@vger.kernel.org>; Mon, 06 Mar 2023 02:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678099440;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iDesKEH7zvriBWTq7JexRfulhrKSrhU4sKAOril+/8I=;
        b=Q8VVq/z1VPzeuykvzeUxV9hghkgMkRmM3EqqEJCKQZDTChTYn0lW4FVk41iMwV5k5x
         ltMSrShE8tYDhPb31xKe2sHmK07ogSf6AwpDSLbZuGulgCuJa3WzbPJRCmHB44/O8wPC
         RhI1pBJDLb2OT7v3zRXts2/1hvgCvuTnAuNhLqWcPqpsKBkibLLTihBupEkofP1lH0Jh
         DxeknQ05Zxu2tDsxvC4R+f6dyzHfQDjxtlQ+n761SYadj0VLxrPVdUJw632Ol8JLe7L+
         N/gpCIOkAM0jd97g4JztSgCU/4yGuGrytz/rbVOhDpP5KIwzh+O2DlIGIHvh28SEHzo5
         DS8A==
X-Gm-Message-State: AO0yUKU4Zy/6YOld1IMhmYRKbJl8IGvGcN8UhDiA1HvYQip8lhUx8nNL
        DQxf3oCSP8PTsQx1em2yaLEOFp7ehkcTHI8Qf1LJBLJ4hETrWrRgW4IeKiYmU7lNYTeJrBY1OTP
        aBSaH54hJTnTq5lwLG+CIW4U=
X-Received: by 2002:adf:fecf:0:b0:2c8:cdde:c284 with SMTP id q15-20020adffecf000000b002c8cddec284mr5750801wrs.38.1678099440416;
        Mon, 06 Mar 2023 02:44:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+xDDKOkEQ/ouFaHCLdFnxR30h51kxFvJ2YPQfpuZKNHPpdAuO161DYiS2nOmGOYC1GadhwCw==
X-Received: by 2002:adf:fecf:0:b0:2c8:cdde:c284 with SMTP id q15-20020adffecf000000b002c8cddec284mr5750790wrs.38.1678099440053;
        Mon, 06 Mar 2023 02:44:00 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n18-20020adfe352000000b002c567881dbcsm9468784wrj.48.2023.03.06.02.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:43:59 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vikash Garodia <vgarodia@qti.qualcomm.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mka@chromium.org" <mka@chromium.org>,
        Albert Esteve <aesteve@redhat.com>,
        "stanimir.varbanov@linaro.org" <stanimir.varbanov@linaro.org>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fritz Koenig <frkoenig@google.com>,
        "Rajeshwar Kurapaty (QUIC)" <quic_rkurapat@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] Revert "venus: firmware: Correct non-pix start and end
 addresses"
In-Reply-To: <0c84724d-08d4-ddcb-5f71-4eb8261240c6@quicinc.com>
References: <20230207102254.1446461-1-javierm@redhat.com>
 <DM8PR02MB8169809493BF2822E6C29EECF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <ef09bc9f-d570-be11-238b-bd34063917fc@redhat.com>
 <70c01751-1dd7-c4bd-a96e-94dea437aa40@redhat.com>
 <DM8PR02MB81696369DBFE619E43F81EEFF3DE9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <e87344c6-acef-7f3f-5cac-24961dbd9401@redhat.com>
 <6f97a117-0d9c-e21b-9adf-50f2233ba9e3@leemhuis.info>
 <ea283f0a-ca72-447e-ce87-68c1bbee793e@leemhuis.info>
 <CAFOAJEdBbzqkGVqw+vgNYNxyaTHwvjFyskTwjycP820L2tOctA@mail.gmail.com>
 <b548da46-bf91-6f1c-4b63-4002109056bc@leemhuis.info>
 <9a0bfef8-0b5d-f4d0-a8a5-4bbcacc5c0fb@leemhuis.info>
 <DM8PR02MB8169E16569616870A583B376F3AB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <87356wn6xf.fsf@minerva.mail-host-address-is-not-set>
 <87edq9hj4w.fsf@minerva.mail-host-address-is-not-set>
 <d18fac76-6b77-a446-5fe0-7236556e9187@quicinc.com>
 <0c84724d-08d4-ddcb-5f71-4eb8261240c6@quicinc.com>
Date:   Mon, 06 Mar 2023 11:43:58 +0100
Message-ID: <87edq2dus1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dikshita Agarwal <quic_dikshita@quicinc.com> writes:

Hello Dikshita,

> On 3/1/2023 3:15 PM, Dikshita Agarwal wrote:
>>
>>
>> On 2/28/2023 9:33 PM, Javier Martinez Canillas wrote:
>>> Javier Martinez Canillas<javierm@redhat.com>  writes:
>>>
>>>> Vikash Garodia<vgarodia@qti.qualcomm.com>  writes:
>>>>
>>>> Hello Vikash,
>>>>
>>>>> Hi All,
>>>>>
>>>> [...]
>>>>
>>>>>> No reply from Mauro and Linus chose to not apply the revert I pointed him to.
>>>>>> That at this point leads to the question:
>>>>>>
>>>>>> Vikash, did you or somebody else make any progress to fix this properly?
>>>>> We tried with different settings for the registers and arrive at a conclusion that
>>>>> the original configuration was proper. There is no need to explicitly configure
>>>>> the secure non-pixel region when there is no support for the usecase. So, in summary,
>>>>> we are good to have the revert.
>>>>>
>>>> Perfect. Thanks a lot for looking at this.
>>>>
>>>>> Stan, could you please help with the revert and a pull request having this revert
>>>>> alongwith other pending changes ?
>>>>>
>>>> Other fix posted is "media: venus: dec: Fix capture formats enumeration order":
>>>>
>>>> https://patchwork.kernel.org/project/linux-media/patch/20230210081835.2054482-1-javierm@redhat.com/
>
> Hi Javier,
>
> Thanks for this patch "media: venus: dec: Fix capture formats 
> enumeration order".
>
> Somehow I can't find it in my mailbox to be able to reply there.
>
> Could you please explain what is the regression you see here?
>

You can find the thread and explanation of the issue here:

https://lore.kernel.org/lkml/Y+KPW18o%2FDa+N8UI@google.com/T/

But Stanimir already picked it and sent a PR for v6.3 including it.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

