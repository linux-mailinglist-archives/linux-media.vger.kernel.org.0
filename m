Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1B71C993F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 20:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgEGS13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 14:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726367AbgEGS13 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 14:27:29 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C65C05BD43
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 11:27:28 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t9so3027688pjw.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 11:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=5hABk9CidU50frEzxQsE36w4wpL/jrP0RTKv4wJuJEk=;
        b=E+6dAw4bb8gQObgabZN1zleFfnzHttg1EH6IX1GzzmKK5RieXcJ4/N0D5OmaS58x6X
         ucuAwsdyZ/RuxNZX9h6BRdEP2yuFGv06VMey4AW3qhfj31MWiAJhGSbhyk/lS2zLAojt
         88ItAh7ZfDOa9Zmjy7V+Gvpx61apqZuEuTSBJpHupYkf+PgSM+iM8Ylp/MNb7x9s4VYt
         0iaJzAoqbevjDboqzRnQGMb55593PknZKZoNOpVMKDoj4GnxIdjZdR6Z7KKce7v1vhC3
         x7jM+fkjHUG8xRYO6hSCaERVWs2oujLABVICahOHdybOLuiNomCzsGZOh9QGyMYRWQ04
         6X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=5hABk9CidU50frEzxQsE36w4wpL/jrP0RTKv4wJuJEk=;
        b=f4EhwaXZPA7J9T5EEfSwOqWOcnKBSh2ugA4NPNoB2Emb4Wi0iWGDYhEll2jY/SLXQz
         gU1NhnwBZCAqmLw32dy6s38IEOhv61nKZZAG/lJD9kvJANA4mojuoEQPXt75EpzWBz30
         JeDDfGtSy/D1Bo63ADV4rr2vKzHouLrRBZ2dzyOJCi4knZqlumy0J943yho4BHJIAKvI
         PzdSYdHtoj+oHf3s7pnPnds/82wCe3MrEQW8xq8YSGJCWs8aDUXYku2uwezxjGG4Ihza
         JGI51qxfosA6nKlhO4q5val1k5Hq72CkLVKTYoO/CXHwPu5Cbe8mjee6cP1jO2vS+93B
         aMvQ==
X-Gm-Message-State: AGi0PuYF4V6JBGihJrv0Vj9d/tpkznYHrAhjcwMbPSRTxDS8djdtxGgZ
        Ov9mBCGF7V3zQ7AuXrU340ONX+SKDKo=
X-Google-Smtp-Source: APiQypJmokoxLAUtaTvX7Sue8Jfv/FpKoCc1Rr8qMsQb9rgCmP39zbo11jJRYHCXyyPuXCMaDV8aLg==
X-Received: by 2002:a17:90b:3598:: with SMTP id mm24mr1377367pjb.132.1588876048231;
        Thu, 07 May 2020 11:27:28 -0700 (PDT)
Received: from [192.168.0.147] (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id b73sm5586984pfb.52.2020.05.07.11.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 11:27:27 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Rosen Penev <rosenp@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/5] utils: fix compilation with C++98
Date:   Thu, 7 May 2020 11:27:26 -0700
Message-Id: <4810B27A-4B1C-4B70-A67A-5774B5548927@gmail.com>
References: <CAHD77H=x2audZcChjCgB=-f4YP2M2MWc5U=FiyXCedbQUPrRfg@mail.gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
In-Reply-To: <CAHD77H=x2audZcChjCgB=-f4YP2M2MWc5U=FiyXCedbQUPrRfg@mail.gmail.com>
To:     Tomasz Figa <tfiga@chromium.org>
X-Mailer: iPhone Mail (17C54)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> On May 7, 2020, at 4:54 AM, Tomasz Figa <tfiga@chromium.org> wrote:
>=20
> =EF=BB=BFHI Rosen,
>=20
>> On Thu, Apr 23, 2020 at 11:10 PM Rosen Penev <rosenp@gmail.com> wrote:
>>=20
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>> utils/cec-compliance/cec-test.cpp | 4 ++--
>> utils/rds-ctl/rds-ctl.cpp         | 2 +-
>> utils/v4l2-ctl/v4l2-ctl-tuner.cpp | 2 +-
>> 3 files changed, 4 insertions(+), 4 deletions(-)
>>=20
>=20
> First of all, thanks for the patch!
>=20
> One question: In what case this file would end up being compiled in
> the C++98 mode?
-std=3Dc++98 , using uClibc++.
>=20
> Also, please see a comment inline.
>=20
>> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec=
-test.cpp
>> index 032ff5ad..cc07998a 100644
>> --- a/utils/cec-compliance/cec-test.cpp
>> +++ b/utils/cec-compliance/cec-test.cpp
>> @@ -908,7 +908,7 @@ static int tuner_ctl_test(struct node *node, unsigned=
 me, unsigned la, bool inte
>>                cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS=
_REQ_ONCE);
>>                fail_on_test(!transmit_timeout(node, &msg));
>>                fail_on_test(timed_out_or_abort(&msg));
>> -               info =3D {};
>> +               memset(&info, 0, sizeof(info));
>>                cec_ops_tuner_device_status(&msg, &info);
>>                if (!memcmp(&info, &info_vec[0], sizeof(info)))
>>                        break;
>> @@ -935,7 +935,7 @@ static int tuner_ctl_test(struct node *node, unsigned=
 me, unsigned la, bool inte
>>                cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS=
_REQ_ONCE);
>>                fail_on_test(!transmit_timeout(node, &msg));
>>                fail_on_test(timed_out_or_abort(&msg));
>> -               info =3D {};
>> +               memset(&info, 0, sizeof(info));
>>                cec_ops_tuner_device_status(&msg, &info);
>>                if (memcmp(&info, &(*iter), sizeof(info))) {
>>                        log_tuner_service(info);
>> diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
>> index 0511fe5d..0e497b2a 100644
>> --- a/utils/rds-ctl/rds-ctl.cpp
>> +++ b/utils/rds-ctl/rds-ctl.cpp
>> @@ -918,7 +918,7 @@ static void get_options(const int fd, const int capab=
ilities, struct v4l2_freque
>>                                printf("\tFrequency range      : %.1f MHz -=
 %.1f MHz\n",
>>                                         vt.rangelow / 16.0, vt.rangehigh /=
 16.0);
>>                        printf("\tSignal strength/AFC  : %ld%%/%d\n",
>> -                               std::lround(vt.signal / 655.35), vt.afc);=

>> +                               lround(vt.signal / 655.25), vt.afc);
>=20
> Why the change from .35 to .25?
This looks like a mistake.
>=20
> Best regards,
> Tomasz
>=20
>>                        printf("\tCurrent audio mode   : %s\n", audmode2s(=
vt.audmode));
>>                        printf("\tAvailable subchannels: %s\n",
>>                                        rxsubchans2s(vt.rxsubchans).c_str(=
));
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-=
tuner.cpp
>> index bc397ec2..73dc323c 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
>> @@ -423,7 +423,7 @@ void tuner_get(cv4l_fd &_fd)
>>=20
>>                        if (vt.type !=3D V4L2_TUNER_SDR && vt.type !=3D V4=
L2_TUNER_RF) {
>>                                printf("\tSignal strength/AFC  : %ld%%/%d\=
n",
>> -                                      std::lround(vt.signal / 655.35), v=
t.afc);
>> +                                      lround(vt.signal / 655.35), vt.afc=
);
>>                                printf("\tCurrent audio mode   : %s\n", au=
dmode2s(vt.audmode));
>>                                printf("\tAvailable subchannels: %s\n", rx=
subchans2s(vt.rxsubchans).c_str());
>>                        }
>> --
>> 2.25.3
>>=20
