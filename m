Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40FA4587C98
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 14:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235988AbiHBMpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 08:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235227AbiHBMpm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 08:45:42 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4894363BE
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 05:45:38 -0700 (PDT)
X-KPN-MessageId: f309ac9d-1260-11ed-888a-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id f309ac9d-1260-11ed-888a-005056992ed3;
        Tue, 02 Aug 2022 14:45:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=0vthUblMcU+v2M3zhRjcqDN6L7bMcDiZcS5Za/rBjLU=;
        b=gPxSoOo+9efNsYh94lfbbtvuWSDU1bYzsLe1tXHNxnbGYnDScKFJzVlSclMJC0y5e84xBjQAzzxWT
         eSOEodP+zckob1SzzX7ljAC3Ao5DYFbJJtUxFWoHNkzcI4lSHtqOD5EFdWVDeSyuPWEsiqRawZ+aZP
         qdaMOaBAXESUxfsEE5iQ8hirJJdJGCJD3j2vi5HTPVldpsPxHsONmG8euYiH5VvJKt9M/4pSJmZBJh
         /j3H0oA/X8i7o5nEju6HGiiKD0wYo2qv+cj8oAKzSRs+sAZCU58a6Fkd4jq7TrXEUpf7LtSmTahHuO
         2NniNskYHBsWZoD/AgLJhDI12el0uPA==
X-KPN-MID: 33|2oBP/UlEZKyvfb6HGa2HlEySVoZNbPGy1QSjmuosyGyXR4P5O6wT0SZ3aqbP0v5
 EjPsqOoWfdDjWOP7ymfNe/SOBQfsXgbOALFhJwNqgzRU=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|roxd1qDffklKE6jhgZ88m1usTqiz9tGJVuJBJHPombwA5OuJFtQ/4Y3xFjHBbvj
 sSQWaWmuBK7C96ErENUsXIQ==
X-Originating-IP: 173.38.220.52
Received: from [10.47.77.219] (unknown [173.38.220.52])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 00dd328d-1261-11ed-ad28-00505699772e;
        Tue, 02 Aug 2022 14:45:36 +0200 (CEST)
Message-ID: <390ab4ac-ad6a-5bef-349b-379ef772afa1@xs4all.nl>
Date:   Tue, 2 Aug 2022 14:45:35 +0200
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAHp75Ve87Pvh-ZGHA=wK+ex9kq58FusA-p1EtVzdwKO_3MRyOw@mail.gmail.com>
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

On 8/2/22 14:26, Andy Shevchenko wrote:
> On Tue, Aug 2, 2022 at 2:23 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Tue, Aug 2, 2022 at 2:21 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
> 
> ...
> 
>>> You are blaming the wrong man here, i.e. devm. The problem as I stated
>>> above is developers who do not understand (pay attention to) the
>>> lifetime of the objects.
>>
>> That said, the devm has nothing to do with the driver still being
>> problematic for the scenario you described, no?
> 
> And the cleanest (at the first glance) solution is to make v4l2 to fix
> this bug by suppressing unbind attributes when the device is opened
> for all v4l2 subdev drivers, and restore it back when it's closed.
> 

Why would we do that? The patch works in the scenario that I described:
the memory is freed in the struct video_device release() callback, which
is called when the last reference to the video node goes away. This is
standard V4L2 framework behavior that works great in the case of a unbind.

Without devm_kzalloc it works fine, even when unbind is called. With
devm_kzalloc the unbind attributes would have to be suppressed. I see no
reason for that as media maintainer.

Regards,

	Hans
