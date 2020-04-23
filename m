Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E631B577D
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgDWIup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgDWIup (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:50:45 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213B0C03C1AF
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 01:50:45 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o15so2592199pgi.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 01:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=bzYSkghE+rayvUA079AE+562umxaszQmCWj46a/QCLg=;
        b=FpAGn3EJB3ST4fW/H8wBG64WP6XaSAkWL20ywuOXgjS6Gp763+WyrLaLBBWrNCgqyi
         81GR3wsSbrIrsxbzte+HR6mh0J8ROY1Enyypk6R+zjm0kyymAWgHhWaRLyod392MGurI
         wYJ8aLu5Uk2KLQurn6iXnedlQngshN5dJMXTMA6QgzuAqNDqUuWk3nWwx0MZDlYb4RC4
         zBV1SADxT0gSGDoC8QIKmYOIQ7XfafScDEfxGZ1WQ00B+b/PvdCmRTQcwJvi42XxwsE0
         3zYrJVLPLmj4JJEH8dVGKffWYJU9PJXWMNeeWpX5Do+oDAomZdOf8l5WoALSkhfBGftK
         Euww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=bzYSkghE+rayvUA079AE+562umxaszQmCWj46a/QCLg=;
        b=N3EJLZk84BjRPE0zhLk++oYFA+fkBgkVtODv8bqs6giTQoJ7yH4BE347q9A3DWbmk6
         X9x2T+DDetRR7NBQHV/n2YULxn7ZObZguoIoUi8ll+3XFJOT4dujOgyTLVWMXg5h7H4V
         H6HdZm+yQUue5REdWM4980gMCDwGikLPqFRbZhXueBH1+fTaOskayipIFeet2SzB/orM
         FQ9V4BOStHdePQYhiGHPp66vrWzkOm8zvo+Jaj1KtMEWJmM70SngS3Vxi7VIbmAYAMy9
         /WBPvhqn4M8s52F6LmWtdO6uHdv3hBH3zgNBgoM8b6XIvsMU2TO5wu1HOsrEUz2LbWxv
         IM8w==
X-Gm-Message-State: AGi0PuYbb9L7rs6dUNX5U+DwXAOg3ruMNchh6y0/KkRkf86OzRrnuCDa
        DwUI/tsgjMK9+cJ0sCubjgzwABgx
X-Google-Smtp-Source: APiQypJATyUdOUYz9UJwfpRDu2gy3cUIKyai7Z0XCng1ibAO6BEZDq35GTcJlS0SWD36kuNu5ijaXw==
X-Received: by 2002:aa7:8743:: with SMTP id g3mr2722915pfo.218.1587631843601;
        Thu, 23 Apr 2020 01:50:43 -0700 (PDT)
Received: from [192.168.0.147] (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y21sm351557pfn.148.2020.04.23.01.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 01:50:43 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Rosen Penev <rosenp@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 01/12] utils: fix compilation with C++98
Date:   Thu, 23 Apr 2020 01:50:42 -0700
Message-Id: <9A9211EF-4983-47AA-8FC6-C85FB9879377@gmail.com>
References: <2ecc5ce5-e6a4-8d6a-ae03-2e169ef68653@xs4all.nl>
Cc:     linux-media@vger.kernel.org
In-Reply-To: <2ecc5ce5-e6a4-8d6a-ae03-2e169ef68653@xs4all.nl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: iPhone Mail (17C54)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> On Apr 23, 2020, at 1:48 AM, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>=20
> =EF=BB=BFOn 23/04/2020 10:30, Rosen Penev wrote:
>>=20
>>=20
>>>> On Apr 23, 2020, at 1:19 AM, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>=20
>>> =EF=BB=BFOn 22/04/2020 02:37, Rosen Penev wrote:
>>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>>> ---
>>>> utils/cec-compliance/cec-test.cpp | 4 ++--
>>>> utils/rds-ctl/rds-ctl.cpp         | 2 +-
>>>> 2 files changed, 3 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/c=
ec-test.cpp
>>>> index 032ff5ad..cc07998a 100644
>>>> --- a/utils/cec-compliance/cec-test.cpp
>>>> +++ b/utils/cec-compliance/cec-test.cpp
>>>> @@ -908,7 +908,7 @@ static int tuner_ctl_test(struct node *node, unsign=
ed me, unsigned la, bool inte
>>>>       cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ON=
CE);
>>>>       fail_on_test(!transmit_timeout(node, &msg));
>>>>       fail_on_test(timed_out_or_abort(&msg));
>>>> -        info =3D {};
>>>> +        memset(&info, 0, sizeof(info));
>>>>       cec_ops_tuner_device_status(&msg, &info);
>>>>       if (!memcmp(&info, &info_vec[0], sizeof(info)))
>>>>           break;
>>>> @@ -935,7 +935,7 @@ static int tuner_ctl_test(struct node *node, unsign=
ed me, unsigned la, bool inte
>>>>       cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ON=
CE);
>>>>       fail_on_test(!transmit_timeout(node, &msg));
>>>>       fail_on_test(timed_out_or_abort(&msg));
>>>> -        info =3D {};
>>>> +        memset(&info, 0, sizeof(info));
>>>>       cec_ops_tuner_device_status(&msg, &info);
>>>>       if (memcmp(&info, &(*iter), sizeof(info))) {
>>>>           log_tuner_service(info);
>>>> diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
>>>> index 0511fe5d..0e497b2a 100644
>>>> --- a/utils/rds-ctl/rds-ctl.cpp
>>>> +++ b/utils/rds-ctl/rds-ctl.cpp
>>>> @@ -918,7 +918,7 @@ static void get_options(const int fd, const int cap=
abilities, struct v4l2_freque
>>>>               printf("\tFrequency range      : %.1f MHz - %.1f MHz\n",
>>>>                    vt.rangelow / 16.0, vt.rangehigh / 16.0);
>>>>           printf("\tSignal strength/AFC  : %ld%%/%d\n",
>>>> -                std::lround(vt.signal / 655.35), vt.afc);
>>>> +                lround(vt.signal / 655.25), vt.afc);
>>>=20
>>> v4l2-ctl-tuner.cpp also uses std::lround, but that one isn't changed bac=
k.
>>>=20
>>> Is rds-ctl.cpp perhaps just missing a header?
>> Nope. std::lround is C++11.
>=20
> So, why isn't v4l2-ctl-tuner.cpp changed to lround as well?
Ugh I think it=E2=80=99s in some other local patch of mine. I=E2=80=99ll nee=
d to resend this one.
>=20
> Regards,
>=20
>    Hans
>=20
>>>=20
>>> Regards,
>>>=20
>>>   Hans
>>>=20
>>>>           printf("\tCurrent audio mode   : %s\n", audmode2s(vt.audmode)=
);
>>>>           printf("\tAvailable subchannels: %s\n",
>>>>                   rxsubchans2s(vt.rxsubchans).c_str());
>>>>=20
>>>=20
>=20
