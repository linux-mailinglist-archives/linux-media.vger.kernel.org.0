Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AF43667F0
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 11:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238079AbhDUJ0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 05:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhDUJ0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 05:26:31 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F98C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 02:25:59 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id c3so9396994pfo.3
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 02:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Gq7HfT5pgt6e1zKZ9wJXPuHNl+x5thWvQl+IKpztogM=;
        b=ovwTuB1JR59hrix4FhCOkC5U7BLN/UnzFsznknZcVdt5EbF5HNX/ofiFN0TRi1Vt+h
         ybVVLXQ4e0gdqXJZCIXD/hLTiHgD5+IO7nXjFFhwgrjoLKjOI6mdRspnWk3sXGlfnNi9
         wxhNkqEEGJK2iOECzNsp/hfCOrlic0enwi1/DF6QaybyEeu0SBLoK4tfXat3IqZtAPgH
         h2GwalFJ1Ke3G8XKhLnUt81l6D82ruEopx938MjtMB1+k7r6KxkdY+DfUANvZOA/Xn5m
         nubM+Z4Mi8mJP1aXfGoJagvyBwcVp1zid2xYA9k4XKoR/7Lmj/9/eo/X2PaKljknVMsu
         7XUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Gq7HfT5pgt6e1zKZ9wJXPuHNl+x5thWvQl+IKpztogM=;
        b=YZ1lIh18TJ2HY5QqzaoVEFa47r0MOHXWkiWTJP2dPCa5yWPUuQEN9bObJ3THNJuE+9
         5cVF9HNGk0LND8o+UzDOcdHpuxKPU5XWk6P2GTOQ1RM6Pw8NjmHqgy4WTFzUuRiO+kDt
         6ibTu+2i5uG0i+Fz7mU1m2qHfz6hwJKkBjYqtF1kBaBsa0939j4Si8iuLL3St1S7QIUY
         6px6qcIn3NSlLkw2X4AKjwQXynzB3EUqqnjPN1OqEXdzR3Q1w8NPO/s0gDBC4dy4zh1p
         bkaHud31FKU6coerGtJDMrFq9WKEyhx+SSurdHpS/BzBYGqXny4AjmatD27HByLLtV1v
         A1jQ==
X-Gm-Message-State: AOAM531UKSlyJKxKE1Uxl8eKUxdiN1rYF+4Kejwjty3WgurJ5QQozext
        JzO8sSPWdDXqu+Cp8DvLaUs=
X-Google-Smtp-Source: ABdhPJxlEkYS5YWhu2t3tD5yIZ1PYIzKfOIbRa7HaNnTn4NjZF6ZW2kW43+k0i8QdONy/KPlXerqOg==
X-Received: by 2002:a63:a19:: with SMTP id 25mr21216967pgk.177.1618997158775;
        Wed, 21 Apr 2021 02:25:58 -0700 (PDT)
Received: from ?IPv6:2001:470:1f05:79e:2d98:a12:ce0e:c3e3? ([2001:470:1f05:79e:2d98:a12:ce0e:c3e3])
        by smtp.gmail.com with ESMTPSA id k69sm1429706pga.45.2021.04.21.02.25.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Apr 2021 02:25:58 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 7/8] v4l2-utils: turn mbus_names into const vector
From:   Rosen Penev <rosenp@gmail.com>
X-Mailer: iPhone Mail (16G201)
In-Reply-To: <c39a54f8-1e35-5d93-3e24-2f06ca47464f@xs4all.nl>
Date:   Wed, 21 Apr 2021 02:25:58 -0700
Cc:     linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <460D5306-0CDE-4C02-AE1D-33932E575E5B@gmail.com>
References: <20210421072035.4188497-1-rosenp@gmail.com> <20210421072035.4188497-7-rosenp@gmail.com> <c39a54f8-1e35-5d93-3e24-2f06ca47464f@xs4all.nl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On Apr 21, 2021, at 01:02, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>=20
>> On 21/04/2021 09:20, Rosen Penev wrote:
>> Allows usage of a more standard for loop.
>>=20
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>> utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 16 ++++++++--------
>> 1 file changed, 8 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl=
-subdev.cpp
>> index d0f391bba..f2be9442c 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
>> @@ -1,3 +1,5 @@
>> +#include <vector>
>> +
>> #include "v4l2-ctl.h"
>>=20
>> struct mbus_name {
>> @@ -5,10 +7,9 @@ struct mbus_name {
>>    __u32 code;
>> };
>>=20
>> -static struct mbus_name mbus_names[] =3D {
>> +static const std::vector<mbus_name> mbus_names{
>>    { "Fixed", MEDIA_BUS_FMT_FIXED },
>> #include "media-bus-format-names.h"
>> -    { nullptr, 0 }
>> };
>=20
> I see no reason for this change, there is nothing wrong with the
> current array that I can see (other than that it should have been
> const, but I'll add that).
I used vector since it=E2=80=99s not easy to see the size.
>=20
>>=20
>> /* selection specified */
>> @@ -343,9 +344,9 @@ static void print_framefmt(const struct v4l2_mbus_fra=
mefmt &fmt)
>> {
>>    __u32 colsp =3D fmt.colorspace;
>>    __u32 ycbcr_enc =3D fmt.ycbcr_enc;
>> -    unsigned int i;
>> +    size_t i;
>>=20
>> -    for (i =3D 0; mbus_names[i].name; i++)
>> +    for (i =3D 0; i < mbus_names.size(); i++)
>>        if (mbus_names[i].code =3D=3D fmt.code)
>>            break;
>>    printf("\tWidth/Height      : %u/%u\n", fmt.width, fmt.height);
>> @@ -554,9 +555,9 @@ void subdev_get(cv4l_fd &_fd)
>>=20
>> static void print_mbus_code(__u32 code)
>> {
>> -    unsigned int i;
>> +    size_t i;
>>=20
>> -    for (i =3D 0; mbus_names[i].name; i++)
>> +    for (i =3D 0; i < mbus_names.size(); i++)
>>        if (mbus_names[i].code =3D=3D code)
>>            break;
>>    if (mbus_names[i].name)
>> @@ -568,9 +569,8 @@ static void print_mbus_code(__u32 code)
>>=20
>> static void print_mbus_codes(int fd, __u32 pad)
>> {
>> -    struct v4l2_subdev_mbus_code_enum mbus_code;
>> +    struct v4l2_subdev_mbus_code_enum mbus_code =3D {};
>>=20
>> -    memset(&mbus_code, 0, sizeof(mbus_code));
>=20
> This one is nice to have, though. But it's independent of the other
> changes.
Noticed it as I was passing by :).
>=20
> Regards,
>=20
>    Hans
>=20
>=20
>>    mbus_code.pad =3D pad;
>>    mbus_code.which =3D V4L2_SUBDEV_FORMAT_TRY;
>>=20
>>=20
>=20
