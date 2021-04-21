Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4DD366846
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 11:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238645AbhDUJjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 05:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238607AbhDUJju (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 05:39:50 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09F3C06138E
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 02:39:17 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id h20so21326335plr.4
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=lwuqjeVtokLlTOTVzgpAyEm03onsefC59ymfEzWm7tE=;
        b=mIrGdRVTGPMAHNW1jcIqpVHMujndDTvPSk5n2p1mUxvv3Bkh08AsxYPWr7eoYdBXUI
         vKzItvSRMSA+62C6KQNedEbyX3hDKw0DUGbzJDXb6ZIUHalMbchnyRPeZuQY3NYC+Klq
         F9EkOhkt3kbwhgeN+7UsigQ1GDotS9FfjRWCeyGKp6A7HONg2pPskzQ4VJ/tY6VLLEKC
         61D4/x6xX/A7f/tCtvDXYk5nlT7oN/Fc30vM/0eG3ScsBkUqSG9Y27Vp+Zz0Dt53bTya
         BuUmtEMkIVBQCSX40oPya8bpw7Tm5D56R5qJvd9POKOlptfH5gu1Q9GsCa+0gauLDiuA
         IZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=lwuqjeVtokLlTOTVzgpAyEm03onsefC59ymfEzWm7tE=;
        b=Dg0BcY1RopU9mqs+vw+bLUWgqRH4klsCRPRUniPb514BAnjs6T+iHJ72NWu6IUP8OZ
         9zgX7vLcSagMug18uyeHx01SGbpze8Pe36rtWLWCei1ZDMjYhapQXfo52/C702eVGvw9
         A4GM7WEfZH8GH1sGV8+zqjTWjPc4cbHR/jgEp3a+noWb3sCorQqraRjsLQUVccUyOJAM
         ve90OWxiBHN0NxVfoHNHiYOArKGV6wNqw/+9kZPxJyy4yjm6iUb4HdzX++rpR48gqiuC
         ZBYJbFwk6pW73wuPk/GqR5V79RV/G/vsFWwQcE48jKBsMIv4rd5Rgh2o5xMQLpT21owA
         vg/Q==
X-Gm-Message-State: AOAM5317RUiO1345ipTvWQiIcUcmIrnHmX4oocpNa4GmdokGsegaB8UA
        qa9f34L2USuhFxu4mxM3hys=
X-Google-Smtp-Source: ABdhPJxxzGdfX1jVNB2720z7Md/eg51NCQeFq+OECjUJTuguCVeF5O4ppM3dI2Kd2HXBJXyktEqAKw==
X-Received: by 2002:a17:902:bd09:b029:ec:7e58:a54a with SMTP id p9-20020a170902bd09b02900ec7e58a54amr26608019pls.62.1618997957481;
        Wed, 21 Apr 2021 02:39:17 -0700 (PDT)
Received: from ?IPv6:2001:470:1f05:79e:2d98:a12:ce0e:c3e3? ([2001:470:1f05:79e:2d98:a12:ce0e:c3e3])
        by smtp.gmail.com with ESMTPSA id x20sm1587066pjp.12.2021.04.21.02.39.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Apr 2021 02:39:17 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 5/8] v4l2-info: remove a strange sizeof usage
From:   Rosen Penev <rosenp@gmail.com>
X-Mailer: iPhone Mail (16G201)
In-Reply-To: <9e4086d7-7ea6-7120-4f2d-1609dcdba93e@xs4all.nl>
Date:   Wed, 21 Apr 2021 02:39:16 -0700
Cc:     linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <36545438-CED2-4A0A-BF50-90102500E66D@gmail.com>
References: <20210421072035.4188497-1-rosenp@gmail.com> <20210421072035.4188497-5-rosenp@gmail.com> <525235dc-e205-0154-ebde-1df11daf48ca@xs4all.nl> <497715F9-E425-45ED-AFD1-CDCEAA2690AA@gmail.com> <9e4086d7-7ea6-7120-4f2d-1609dcdba93e@xs4all.nl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On Apr 21, 2021, at 02:33, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>=20
>> On 21/04/2021 11:19, Rosen Penev wrote:
>>=20
>>>> On Apr 21, 2021, at 01:23, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>=20
>>>> On 21/04/2021 09:20, Rosen Penev wrote:
>>>> The array has a nullptr and 0 member for some reason. Remove and conver=
t
>>>> loop to a for range one.
>>>>=20
>>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>>> ---
>>>> utils/common/v4l2-info.cpp | 33 +++++++++++++++------------------
>>>> 1 file changed, 15 insertions(+), 18 deletions(-)
>>>>=20
>>>> diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
>>>> index cb3cb91f7..0359cf137 100644
>>>> --- a/utils/common/v4l2-info.cpp
>>>> +++ b/utils/common/v4l2-info.cpp
>>>> @@ -3,6 +3,8 @@
>>>> * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights r=
eserved.
>>>> */
>>>>=20
>>>> +#include <array>
>>>> +
>>>> #include <v4l2-info.h>
>>>>=20
>>>> static std::string num2s(unsigned num, bool is_hex =3D true)
>>>> @@ -411,21 +413,20 @@ std::string mbus2s(unsigned flags, bool is_hsv)
>>>>   return flags2s(flags, mbus_ycbcr_def);
>>>> }
>>>>=20
>>>> -static const flag_def selection_targets_def[] =3D {
>>>> -    { V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
>>>> -    { V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
>>>> -    { V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
>>>> -    { V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
>>>> -    { V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
>>>> -    { V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
>>>> -    { V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
>>>> -    { V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
>>>> -    { 0, nullptr }
>>>=20
>>> The idea of having this sentinel is that this makes it easy to add new
>>> entries without having to update the array size.
>> Not following this. I assume it=E2=80=99s some C feature.
>=20
> Standard programming techique:
>=20
> https://en.wikipedia.org/wiki/Sentinel_value#:~:text=3DIn%20computer%20pro=
gramming%2C%20a%20sentinel,a%20loop%20or%20recursive%20algorithm.
>=20
>>>=20
>>>> +static constexpr std::array<flag_def, 8> selection_targets_def{
>>>=20
>>> Something you need to do here, adding a new flag means updating the size=
.
>> I assume this is a small issue. It=E2=80=99s an immediate compile error a=
nyway.
>=20
> Not if the size is larger that the number of initializers. That would leav=
e
> zeroed elements at the end.
Ah yes that is a real problem. I=E2=80=99ve been bitten by it in the past.
>=20
>>>=20
>>> New flags are added regularly, so keeping that robust is a good idea IMH=
O.
>>>=20
>>> If it were possible to write:
>>>=20
>>> static constexpr std::array<flag_def> selection_targets_def{
>>>=20
>>> i.e. without an explicit size, then this would make sense, but C++
>>> doesn't allow this. And std::vector allocates the data on the heap,
>>> which is less efficient as well.
>> But this is possible. With C++17 :). That would necessitate a minimum of G=
CC6 though.
>=20
> How is that done in C++17? I didn't find anything about that.
C++17 has class template argument deduction. It allows putting just std::arr=
ay or std::vector or any other container really without the <>. Of course yo=
u have to allow it to deduce the arguments by putting them in the initialize=
rs. This is actually what I did in the previous cec-tuner patch.
>=20
> Regards,
>=20
>    Hans
>=20
>>>=20
>>> Let's just keep using normal arrays in this case, they do the job
>>> just fine. Just because you have a hammer, it doesn't mean everything
>>> is now a nail :-)
>>>=20
>>> Regards,
>>>=20
>>>   Hans
>>>=20
>>>> +    flag_def{ V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
>>>> +    flag_def{ V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
>>>> +    flag_def{ V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
>>>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
>>>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
>>>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
>>>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
>>>> +    flag_def{ V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
>>>> };
>>>>=20
>>>> bool valid_seltarget_at_idx(unsigned i)
>>>> {
>>>> -    return i < sizeof(selection_targets_def) / sizeof(selection_target=
s_def[0]) - 1;
>>>> +    return i < selection_targets_def.size();
>>>> }
>>>>=20
>>>> unsigned seltarget_at_idx(unsigned i)
>>>> @@ -437,13 +438,9 @@ unsigned seltarget_at_idx(unsigned i)
>>>>=20
>>>> std::string seltarget2s(__u32 target)
>>>> {
>>>> -    int i =3D 0;
>>>> -
>>>> -    while (selection_targets_def[i].str !=3D nullptr) {
>>>> -        if (selection_targets_def[i].flag =3D=3D target)
>>>> -            return selection_targets_def[i].str;
>>>> -        i++;
>>>> -    }
>>>> +    for (const auto &def : selection_targets_def)
>>>> +        if (def.flag =3D=3D target)
>>>> +            return def.str;
>>>>   return std::string("Unknown (") + num2s(target) + ")";
>>>> }
>>>>=20
>>>>=20
>>>=20
>=20
