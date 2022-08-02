Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2827587CC4
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 14:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237073AbiHBM7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 08:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236959AbiHBM7P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 08:59:15 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970883AB01
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 05:58:51 -0700 (PDT)
X-KPN-MessageId: cb6c925e-1262-11ed-888a-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id cb6c925e-1262-11ed-888a-005056992ed3;
        Tue, 02 Aug 2022 14:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=+Icvj/oxDulBrECr6G0YOVQ8I5XgdxaPdxVtx/WK6z4=;
        b=pq/Refq/YPIOJksPY9gGjWkY4FSF2TheQ573Y4gOyiWxGjYM/MuUAz2GElK8tMBIbPwnQ6eeM0hZm
         wFt9svMLkjzveF9FVxKtE/xiJ7+qSOsPFKfpUhTrWDTSnLH+S+dYocaxQJ5cUoIT6tVLi5YBLRE5vH
         /Cwj7DzIX/X4HGLyLOQQpDiyYvVmGf7ZXSF0HCVEqZKqUIGo2BJHSlrg2tosujCAo/Nw/N2SsiEMCp
         o8nJPoUdvfaZQRJiolsC6IdSOlDv/yP/Fbm0/wQVoFiPOPiU7njj0Rz8sn1qaBnREmV5yiPMFcG0p6
         mssUxr9lLFxqAtOnrLRjprKwKidj25g==
X-KPN-MID: 33|0bNGKUFy/B+BsrAofcX+JOEjEC/RiQq/z5TUjpef09SpTawrCafSSkrpT6bms4z
 Aw0roxKqfsSJnYYtLhqhJ5aDwWO37EzlQDd0FTNgQ+Gs=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|DN0SfO85EqmkDllvkE6bEeDLayT0xatpTDlZUMKKcvHK62j2lJrl8yEFQEtvMRV
 ynKmvu2DRQW1GNiLPcb0JeQ==
X-Originating-IP: 173.38.220.52
Received: from [10.47.77.219] (unknown [173.38.220.52])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id e09632f4-1262-11ed-8bc8-005056998788;
        Tue, 02 Aug 2022 14:59:00 +0200 (CEST)
Message-ID: <403e5055-81dd-7426-a3cd-f3c3bbf24179@xs4all.nl>
Date:   Tue, 2 Aug 2022 14:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID
 EEPROM
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Erling Ljunggren (hljunggr)" <hljunggr@cisco.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "jonathansb1@gmail.com" <jonathansb1@gmail.com>
References: <20220728114050.2400475-1-hljunggr@cisco.com>
 <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
 <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
 <CAHp75Vc2qWQXk-+0ath8zuTaGHmSG_ZiUYih=4rGeKx3_nmtsQ@mail.gmail.com>
 <b426bd08-6c52-3891-9319-b6cc52bdfbab@xs4all.nl>
 <CAHp75Vdtv6qtjxACA+nET2wyzHpHqxvPeZ-KhRWSByGtH4T5TQ@mail.gmail.com>
 <5d3fe43f-5615-137d-b712-f6c9079460cd@xs4all.nl>
 <CAHp75VfWhzz4jzyQAD4UYTN8dBWiKsvimKOPiKozGyNd2_oj=A@mail.gmail.com>
 <CAHp75Vd60urVv5R+fE+xxqMNJhJSmXZnfJJwU5t-m3E_T+pcWA@mail.gmail.com>
 <CAHp75Ve87Pvh-ZGHA=wK+ex9kq58FusA-p1EtVzdwKO_3MRyOw@mail.gmail.com>
 <390ab4ac-ad6a-5bef-349b-379ef772afa1@xs4all.nl>
 <CAHp75Vfqn0oUUvFGu2SegRBRPLpxazXVT5_pNmcD8FUi2_fjuw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAHp75Vfqn0oUUvFGu2SegRBRPLpxazXVT5_pNmcD8FUi2_fjuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/2/22 14:49, Andy Shevchenko wrote:
> On Tue, Aug 2, 2022 at 2:45 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>> On 8/2/22 14:26, Andy Shevchenko wrote:
>>> On Tue, Aug 2, 2022 at 2:23 PM Andy Shevchenko
>>> <andy.shevchenko@gmail.com> wrote:
>>>> On Tue, Aug 2, 2022 at 2:21 PM Andy Shevchenko
>>>> <andy.shevchenko@gmail.com> wrote:
> 
> ...
> 
>>>>> You are blaming the wrong man here, i.e. devm. The problem as I stated
>>>>> above is developers who do not understand (pay attention to) the
>>>>> lifetime of the objects.
>>>>
>>>> That said, the devm has nothing to do with the driver still being
>>>> problematic for the scenario you described, no?
>>>
>>> And the cleanest (at the first glance) solution is to make v4l2 to fix
>>> this bug by suppressing unbind attributes when the device is opened
>>> for all v4l2 subdev drivers, and restore it back when it's closed.
>>
>> Why would we do that? The patch works in the scenario that I described:
>> the memory is freed in the struct video_device release() callback, which
>> is called when the last reference to the video node goes away. This is
>> standard V4L2 framework behavior that works great in the case of a unbind.
>>
>> Without devm_kzalloc it works fine, even when unbind is called. With
>> devm_kzalloc the unbind attributes would have to be suppressed. I see no
>> reason for that as media maintainer.
> 
> I'm not sure anymore that we are talking about the same thing.
> 
> Your driver allocates memory with kzalloc() in ->probe() and frees it
> in ->remove(). How is this different from the lifetime of a devm:ed
> object? If what you said is true, than driver is still problematic,
> since ->remove() frees this memory the very same way at unbind call.

No, it is not freed in remove(). remove() calls video_unregister_device(),
and that calls cat24c208_release() when the last user of /dev/videoX closes
its filehandle. And it is cat24c208_release() that finally frees the memory.

Regards,

	Hans
