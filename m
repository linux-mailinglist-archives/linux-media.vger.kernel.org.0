Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADABC3667D2
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 11:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237589AbhDUJUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 05:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237740AbhDUJUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 05:20:05 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6640EC06138B
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 02:19:30 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id p12so29209661pgj.10
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=+8um/RRQ6EZUhC1gLGgFY823zdLpobHbzu093jQn4wc=;
        b=E7zBOKdbuikUTYhBFXoYrhAz4oqBkvCHOuMTyb4wp9qX/YbPnW1iF9CZrhpyeC7nkg
         VxF0DXG3PoZ/OtbYNe/5l6S9Z7oPs/8mljMTcQmzVY8GpxxiI/rH1nzTXoZXHnicince
         qt3+lCqMiSrRadS5cIjfwp3igOfLZ/Ia4QeWWzW9i5SMbN+lSHOjx+Ga5z+qK55+Yf6S
         oW34IY60f1yINDd3ysA9MP0GiFmyyamxf9kRlfjQFdbfINjcrBz9MmoY+VGHQDuyiRCf
         ZlPeUltjN1or1RMwU/VrSJ0iJ9XukNFwXtk8wYW/UA+LFEfGPs+HY4sHwrUaWFSDfX27
         imjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=+8um/RRQ6EZUhC1gLGgFY823zdLpobHbzu093jQn4wc=;
        b=dWDq7z15K2gVu6F6l7p9KE4l/IkvFLrejZFOwo5B18YVGf3bXehf+zg2DfmPgaeeS+
         PwXTzFmsI3ieAovtmLlg91pXvGOxm7Tf3dTVsbk9yZgyU8qLbgtM6XsA1fX7M/bbjB9E
         9MebsFXJp+sbog2skAJxEgCfm5Xjs38y+0ookz57uZfSMLUFnoHu/n8pmlAkA+U7I/il
         H50SIrKBgfYiAQ5iGE7Lm+vNBcFxsY6fFngASjIlZAlDvPBQVMpqnkqeQmSTbk9VAOCW
         bWrwOO7VxY7iTUVUPsZBxeZtCqq2r/GyqvbJHt99JOcktTsE7qUDUjfsuP26i58iO+gE
         D0MA==
X-Gm-Message-State: AOAM533Uj/Ok/eDC8Ugv1hLhJUxeGteWbJhDgk5aZ1ACDJp8Opk+26fi
        l78W0FXo/5E/cd5EFumahlxJLOAMNfSD8w==
X-Google-Smtp-Source: ABdhPJwOyYRzCvZK7xa+Vuwdyc9r29XMkjp+VT5PMHiuSY28v6+A8aVqqf4wO6CiwMV5VsYdHwcYSw==
X-Received: by 2002:aa7:85d7:0:b029:25d:2b00:2c6c with SMTP id z23-20020aa785d70000b029025d2b002c6cmr18228129pfn.3.1618996769840;
        Wed, 21 Apr 2021 02:19:29 -0700 (PDT)
Received: from ?IPv6:2001:470:1f05:79e:2d98:a12:ce0e:c3e3? ([2001:470:1f05:79e:2d98:a12:ce0e:c3e3])
        by smtp.gmail.com with ESMTPSA id mv13sm1567832pjb.29.2021.04.21.02.19.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Apr 2021 02:19:29 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 5/8] v4l2-info: remove a strange sizeof usage
From:   Rosen Penev <rosenp@gmail.com>
X-Mailer: iPhone Mail (16G201)
In-Reply-To: <525235dc-e205-0154-ebde-1df11daf48ca@xs4all.nl>
Date:   Wed, 21 Apr 2021 02:19:28 -0700
Cc:     linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <497715F9-E425-45ED-AFD1-CDCEAA2690AA@gmail.com>
References: <20210421072035.4188497-1-rosenp@gmail.com> <20210421072035.4188497-5-rosenp@gmail.com> <525235dc-e205-0154-ebde-1df11daf48ca@xs4all.nl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On Apr 21, 2021, at 01:23, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>=20
>> On 21/04/2021 09:20, Rosen Penev wrote:
>> The array has a nullptr and 0 member for some reason. Remove and convert
>> loop to a for range one.
>>=20
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>> utils/common/v4l2-info.cpp | 33 +++++++++++++++------------------
>> 1 file changed, 15 insertions(+), 18 deletions(-)
>>=20
>> diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
>> index cb3cb91f7..0359cf137 100644
>> --- a/utils/common/v4l2-info.cpp
>> +++ b/utils/common/v4l2-info.cpp
>> @@ -3,6 +3,8 @@
>>  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights r=
eserved.
>>  */
>>=20
>> +#include <array>
>> +
>> #include <v4l2-info.h>
>>=20
>> static std::string num2s(unsigned num, bool is_hex =3D true)
>> @@ -411,21 +413,20 @@ std::string mbus2s(unsigned flags, bool is_hsv)
>>    return flags2s(flags, mbus_ycbcr_def);
>> }
>>=20
>> -static const flag_def selection_targets_def[] =3D {
>> -    { V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
>> -    { V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
>> -    { V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
>> -    { V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
>> -    { V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
>> -    { V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
>> -    { V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
>> -    { V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
>> -    { 0, nullptr }
>=20
> The idea of having this sentinel is that this makes it easy to add new
> entries without having to update the array size.
Not following this. I assume it=E2=80=99s some C feature.
>=20
>> +static constexpr std::array<flag_def, 8> selection_targets_def{
>=20
> Something you need to do here, adding a new flag means updating the size.
I assume this is a small issue. It=E2=80=99s an immediate compile error anyw=
ay.
>=20
> New flags are added regularly, so keeping that robust is a good idea IMHO.=

>=20
> If it were possible to write:
>=20
> static constexpr std::array<flag_def> selection_targets_def{
>=20
> i.e. without an explicit size, then this would make sense, but C++
> doesn't allow this. And std::vector allocates the data on the heap,
> which is less efficient as well.
But this is possible. With C++17 :). That would necessitate a minimum of GCC=
6 though.
>=20
> Let's just keep using normal arrays in this case, they do the job
> just fine. Just because you have a hammer, it doesn't mean everything
> is now a nail :-)
>=20
> Regards,
>=20
>    Hans
>=20
>> +    flag_def{ V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
>> +    flag_def{ V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
>> +    flag_def{ V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
>> +    flag_def{ V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
>> };
>>=20
>> bool valid_seltarget_at_idx(unsigned i)
>> {
>> -    return i < sizeof(selection_targets_def) / sizeof(selection_targets_=
def[0]) - 1;
>> +    return i < selection_targets_def.size();
>> }
>>=20
>> unsigned seltarget_at_idx(unsigned i)
>> @@ -437,13 +438,9 @@ unsigned seltarget_at_idx(unsigned i)
>>=20
>> std::string seltarget2s(__u32 target)
>> {
>> -    int i =3D 0;
>> -
>> -    while (selection_targets_def[i].str !=3D nullptr) {
>> -        if (selection_targets_def[i].flag =3D=3D target)
>> -            return selection_targets_def[i].str;
>> -        i++;
>> -    }
>> +    for (const auto &def : selection_targets_def)
>> +        if (def.flag =3D=3D target)
>> +            return def.str;
>>    return std::string("Unknown (") + num2s(target) + ")";
>> }
>>=20
>>=20
>=20
