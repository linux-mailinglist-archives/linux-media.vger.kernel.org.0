Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97463667E0
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 11:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238122AbhDUJYT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 05:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238104AbhDUJYS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 05:24:18 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7F0C06138B
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 02:23:45 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id v13so7705340ple.9
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 02:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=t7aNByOeUhFyWt6Sy3wX4FetGD+P+u6fWa5ltN+4WxM=;
        b=BYCF2xYL8PKZQc+WHijHwsv8QHrBQrckwijPN7I0cR1ZWJl8mlhe/kJjN/zh4+kx2R
         HOUjiW/yxdWqulTXQHoE5MLrTL4ZmHGSDOM9NKcnzwYbHhdSoysv72ADo3+D3KjLvxKT
         0CZEaZpabpnQqGzoDTExph1kkSzI1dDExklEKiXdOhsxAu1SM6sUo74VDB8zOZccgAX2
         3qCfN8O4Z2PEK7EG39CZDcDQ+m0Ho+Gyg3Ve0Jha9o5VQt+/VvkzeNj0IPgxiCHja076
         IrexmU4t0oo5/1iu3bgc2gMsrdLD7WSzmj5fGIE72xK5SL++gKzFfzTkWPHVUppf6LbB
         /bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=t7aNByOeUhFyWt6Sy3wX4FetGD+P+u6fWa5ltN+4WxM=;
        b=VxfnKpp753KcvPg1VRgXtSaeisWbdSCZmineikq9FyTp2ziPEisI0+bSvcG1Su5dps
         8ngz3EWybnC0Pi2QxOU5FXi1VlEq+593Q6woNX4yxO9WssJ8y3ZfV0k48M1+njlZslmX
         mRUQ/i8ULK30CXt/9N9EbKBODRK2xKbLzCYzQQbVcnpLdSOzkKwkQ60L1F56fiYiDhcC
         wMGyaEQkBbSeVrsqHJL7ckUL/rOm9I/MbzM4dyL6El9TJhxNsRzCAVpPgD0oXna33J3J
         /23pLnZluuVIZJvOdR+CC1yUbH9OBQc1RfY5vKVUxrObqx8/IzLFmZiLbkqpW/FDY8Tc
         VHaw==
X-Gm-Message-State: AOAM533+5PJ5zqOSuz2DvDxNdb9MgDiBycOoN/z/J0BeHnmdbpb0Z9Bd
        O4cgvQ8SOhy5vdsnYnRDF80=
X-Google-Smtp-Source: ABdhPJwb0hWXO6h1s7u7KyePh309B53si0UEhV8xmBG62Nv3lsCCgu2/Nk/34KAAPv0QfzpgQlnF5Q==
X-Received: by 2002:a17:902:6b81:b029:ea:dcc5:b841 with SMTP id p1-20020a1709026b81b02900eadcc5b841mr32795238plk.29.1618997024877;
        Wed, 21 Apr 2021 02:23:44 -0700 (PDT)
Received: from ?IPv6:2001:470:1f05:79e:2d98:a12:ce0e:c3e3? ([2001:470:1f05:79e:2d98:a12:ce0e:c3e3])
        by smtp.gmail.com with ESMTPSA id t19sm1365323pfg.38.2021.04.21.02.23.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Apr 2021 02:23:44 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 8/8] v4l2-utils: turn prefixes to a constexpr array
From:   Rosen Penev <rosenp@gmail.com>
X-Mailer: iPhone Mail (16G201)
In-Reply-To: <566ba9fe-509c-26b4-19a3-845a45093ba1@xs4all.nl>
Date:   Wed, 21 Apr 2021 02:23:44 -0700
Cc:     linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <21827EC0-E8B2-46F2-B943-A09A2D31EA45@gmail.com>
References: <20210421072035.4188497-1-rosenp@gmail.com> <20210421072035.4188497-8-rosenp@gmail.com> <566ba9fe-509c-26b4-19a3-845a45093ba1@xs4all.nl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On Apr 21, 2021, at 01:06, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>=20
>> On 21/04/2021 09:20, Rosen Penev wrote:
>> Allows usage of a single any_of instead of a raw loop.
>>=20
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>> utils/v4l2-ctl/v4l2-ctl-common.cpp | 24 +++++-------------------
>> 1 file changed, 5 insertions(+), 19 deletions(-)
>>=20
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl=
-common.cpp
>> index 17ad488dd..2b6dd6d13 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> @@ -116,28 +116,14 @@ void common_usage()
>>           );
>> }
>>=20
>> -static const char *prefixes[] =3D {
>> -    "video",
>> -    "radio",
>> -    "vbi",
>> -    "swradio",
>> -    "v4l-subdev",
>> -    "v4l-touch",
>> -    "media",
>> -    nullptr
>> +static constexpr std::array<const char *, 7> prefixes{
>> +    "video", "radio", "vbi", "swradio", "v4l-subdev", "v4l-touch", "medi=
a",
>> };
>>=20
>> static bool is_v4l_dev(const char *name)
>> {
>> -    for (unsigned i =3D 0; prefixes[i]; i++) {
>> -        unsigned l =3D strlen(prefixes[i]);
>> -
>> -        if (!memcmp(name, prefixes[i], l)) {
>> -            if (isdigit(name[l]))
>> -                return true;
>> -        }
>> -    }
>> -    return false;
>> +    return std::any_of(prefixes.begin(), prefixes.end(),
>> +               [=3D](const char *prefix) { return !strcmp(name, prefix) &=
& isdigit(name[strlen(prefix)]); });
>=20
> Yuck. Besides, it is wrong AFAIKS since strcmp is not the same as memcmp.
True. C++17 would make this better with std::string_view with its size membe=
r function which also happens to be constexpr. strlen IIRC is slow.
>=20
> I like the original code, easier to understand than the replacement. So su=
e me :-)
I=E2=80=99ll convert to range loop.
>=20
> Regards,
>=20
>    Hans
>=20
>> }
>>=20
>> static int calc_node_val(const char *s)
>> @@ -146,7 +132,7 @@ static int calc_node_val(const char *s)
>>=20
>>    s =3D std::strrchr(s, '/') + 1;
>>=20
>> -    for (unsigned i =3D 0; prefixes[i]; i++) {
>> +    for (size_t i =3D 0; i < prefixes.size(); i++) {
>>        unsigned l =3D strlen(prefixes[i]);
>>=20
>>        if (!memcmp(s, prefixes[i], l)) {
>>=20
>=20
