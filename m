Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED661B5740
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgDWIdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgDWIdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:33:05 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524ADC03C1AB
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 01:33:05 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t40so2213191pjb.3
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 01:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=NmBZyP3DelujsHP31EVLPzROnX8jtf9XYU+l9YfXXHk=;
        b=kyfC/bzDaqg7OJU2hBjDK+NcxH9v13TzX+ooJpbSgY5PxYvg9H2Osaz0s5nv8kdM/N
         C8+yRFQeqt9KYeKMaZFJ/3E/Xdi/jOUDChOyugzPkdfVsj/AL2bwSZDYbONQ5XsE//Jx
         FgTUwgleZmBZpCJUeNFs6OExG6SzbY21KyeOirjhx8ozovdM2eNQUbVbaBfm/kQ+7S2s
         LpZ8nljFl83gMmtzRL+J8gbuWnWuJRnxYumvkXG49VVmjC954IZ5SJKps551hDQKWu3q
         BVQJjtQH8JYdX5BjSWTIajblLYktkrsKHq6OV1EaP0MR/5DlB8AsIGu+Uqu8lzzJoPLj
         We2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=NmBZyP3DelujsHP31EVLPzROnX8jtf9XYU+l9YfXXHk=;
        b=T4mzMBd7hDS3Og0XJMkriQSbZMbPjhCrXaXgxGGAUWgBmLJFDIpssz0nEAZmLIC3sg
         7RAPAn1tktQwwAIGLXeqBd+BkdBIUw8zteF1tmKSymQ8adOuLD4aT+Q5ZjaeOlWufQFv
         eGBBRfvsQtFm/XZUpVjFnXOPvXHpcANZdUOZFlFO+F6ZXEZYHJAIkVZ5K3Iut9ZGi/p0
         cCT0Dj8rexqbELufkkIc0mQQQZxLWwE0G0cDRyE3RB3B4K+hTsm62jC0YjiSyZDtHe8a
         iIvi+GepoA6YPT3lriVSSeK3xHBSIYYslLc6z2A1QF+ZNMeaSAOHZ2Yp2eWCZCfP1wzS
         5e0Q==
X-Gm-Message-State: AGi0PubI2L1NV8l9TusjbOnp3kw8SOJwlVghK1LKNNXFCpaoegBdVuBj
        yOXuyTX8ZxH30/WXPKnOHPWtLGFE
X-Google-Smtp-Source: APiQypJs8o8pCcWMzx6yK/Id19itGJzKjNddU9cUJmfzB8nVl9RaUtvj0ctlYQORkHdNsEK6P9PR+A==
X-Received: by 2002:a17:902:ed13:: with SMTP id b19mr2820384pld.254.1587630784743;
        Thu, 23 Apr 2020 01:33:04 -0700 (PDT)
Received: from [192.168.0.147] (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id x63sm1930702pfc.56.2020.04.23.01.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 01:33:04 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Rosen Penev <rosenp@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 04/12] utils: don't check unsigned for < 0.
Date:   Thu, 23 Apr 2020 01:33:03 -0700
Message-Id: <95622E7A-3F1E-427D-82D8-55D3E65B9473@gmail.com>
References: <d1116917-29c6-fb16-f19e-e075c727bc94@xs4all.nl>
Cc:     linux-media@vger.kernel.org
In-Reply-To: <d1116917-29c6-fb16-f19e-e075c727bc94@xs4all.nl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: iPhone Mail (17C54)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> On Apr 23, 2020, at 1:30 AM, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>=20
> =EF=BB=BFOn 22/04/2020 02:37, Rosen Penev wrote:
>> Found with -Wtautological-unsigned-zero-compare
>>=20
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>> utils/v4l2-compliance/v4l2-test-controls.cpp | 2 --
>> 1 file changed, 2 deletions(-)
>>=20
>> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-co=
mpliance/v4l2-test-controls.cpp
>> index 8c4480be..251a6049 100644
>> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
>> @@ -80,8 +80,6 @@ static int checkQCtrl(struct node *node, struct test_qu=
ery_ext_ctrl &qctrl)
>>            return fail("min > max\n");
>>        if (qctrl.step =3D=3D 0)
>>            return fail("step =3D=3D 0\n");
>> -        if (qctrl.step < 0)
>> -            return fail("step < 0\n");
>=20
> Ah, nice. This is actually a bug since this test needs to be done for
> struct v4l2_queryctl (where step is signed) instead of struct v4l2_query_e=
xt_ctrl
> (where step is unsigned).
>=20
> I've made a patch fixing this correctly.
Sounds good.
>=20
> Regards,
>=20
>    Hans
>=20
>>        if (static_cast<unsigned>(qctrl.step) > static_cast<unsigned>(qctr=
l.maximum - qctrl.minimum) &&
>>            qctrl.maximum !=3D qctrl.minimum)
>>            return fail("step > max - min\n");
>>=20
>=20
