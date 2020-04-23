Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5F31B573A
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgDWIaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgDWIaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:30:10 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA7BC03C1AB
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 01:30:09 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f7so2592117pfa.9
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=R2wZqYrfve6bPhIaJxyFr/Xjg0MLm2lZH1TkbxbD7hM=;
        b=YrekPVaPFmNtunj4Wqr3bRaXlgOan37Ac1mWzvooFaZsSG3HN7TkPYgAhsfTQgxHK6
         1qnfP9bwNKioOkwiAiWa4pk8LKSuNJ2Pr3pkgHMZ0R4OpMDf5wNEFXIwhtxFmMJJXPPA
         RBiK3Yv66Dg/FPpoFIrhjO0CmW7w4yUNbPI7n7WWD/MkjDTw/68CIqaI3WxqEYxMzZOW
         +EBKoZAPUjMu90se4HAV7vTQ4LxiGmabSKIISEyqpy9V/fffVR1CE2T3kipEh4PUHjMN
         e06rjOpImibfPQhsWpiZXDW3izSlIggMAL+1Lsy3861AZYbMNfECIFgEjeeDLAk8/nMx
         y7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=R2wZqYrfve6bPhIaJxyFr/Xjg0MLm2lZH1TkbxbD7hM=;
        b=JmTANaVcFqBggx/iBVqlU5qutRnzYJEL0yjhPA3ARkqfvqRB+xuEw7uYViOgZ1MSKz
         qpFTeKZrLHsAijzMy3djXPnOzt47hbZRPSQycncnl+vXUy+fjDCvgX7BV8CKUO1KPyC7
         xSMY8ZeddSYKIyCbt6Bxj3l8TeRtStN05bBNTheObnYExX9VCPzfybQo6kCRahEmLjgb
         Mi2465IMIv63sldOwFMhzICpE7KBbcSBE2qTb/SXmb9ATr67bVVfP12lvds7INOXP9Cf
         6CU+vx1XAGmuflxBDWn/9+mk98U//64MFAlOLnWSDeep8D6Ku+StxkNksc5sMOMztH/C
         JFMw==
X-Gm-Message-State: AGi0PuZp8byW71B583MsQX6EY5dEkHG2I1gHF0EDyV2WGvPUYn70Eq4G
        weN1PY2ZWvRctVHEEN6tYR0=
X-Google-Smtp-Source: APiQypIL8EtDRsmyrHLH0ba6y8mk3NRWz7OkkmRcpLaZmrNzSsMez0wFnGiWePwNFQlXxQ8wkRP5GQ==
X-Received: by 2002:a63:4957:: with SMTP id y23mr2604306pgk.302.1587630609350;
        Thu, 23 Apr 2020 01:30:09 -0700 (PDT)
Received: from [192.168.0.147] (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id a7sm1922489pfg.157.2020.04.23.01.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 01:30:08 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Rosen Penev <rosenp@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 01/12] utils: fix compilation with C++98
Date:   Thu, 23 Apr 2020 01:30:07 -0700
Message-Id: <400FD765-D58F-401D-90EF-9AFED41B53D5@gmail.com>
References: <5cf49918-bff9-d97b-701b-7ece6e1ae0a5@xs4all.nl>
Cc:     linux-media@vger.kernel.org
In-Reply-To: <5cf49918-bff9-d97b-701b-7ece6e1ae0a5@xs4all.nl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: iPhone Mail (17C54)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> On Apr 23, 2020, at 1:19 AM, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>=20
> =EF=BB=BFOn 22/04/2020 02:37, Rosen Penev wrote:
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>> utils/cec-compliance/cec-test.cpp | 4 ++--
>> utils/rds-ctl/rds-ctl.cpp         | 2 +-
>> 2 files changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec=
-test.cpp
>> index 032ff5ad..cc07998a 100644
>> --- a/utils/cec-compliance/cec-test.cpp
>> +++ b/utils/cec-compliance/cec-test.cpp
>> @@ -908,7 +908,7 @@ static int tuner_ctl_test(struct node *node, unsigned=
 me, unsigned la, bool inte
>>        cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONC=
E);
>>        fail_on_test(!transmit_timeout(node, &msg));
>>        fail_on_test(timed_out_or_abort(&msg));
>> -        info =3D {};
>> +        memset(&info, 0, sizeof(info));
>>        cec_ops_tuner_device_status(&msg, &info);
>>        if (!memcmp(&info, &info_vec[0], sizeof(info)))
>>            break;
>> @@ -935,7 +935,7 @@ static int tuner_ctl_test(struct node *node, unsigned=
 me, unsigned la, bool inte
>>        cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONC=
E);
>>        fail_on_test(!transmit_timeout(node, &msg));
>>        fail_on_test(timed_out_or_abort(&msg));
>> -        info =3D {};
>> +        memset(&info, 0, sizeof(info));
>>        cec_ops_tuner_device_status(&msg, &info);
>>        if (memcmp(&info, &(*iter), sizeof(info))) {
>>            log_tuner_service(info);
>> diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
>> index 0511fe5d..0e497b2a 100644
>> --- a/utils/rds-ctl/rds-ctl.cpp
>> +++ b/utils/rds-ctl/rds-ctl.cpp
>> @@ -918,7 +918,7 @@ static void get_options(const int fd, const int capab=
ilities, struct v4l2_freque
>>                printf("\tFrequency range      : %.1f MHz - %.1f MHz\n",
>>                     vt.rangelow / 16.0, vt.rangehigh / 16.0);
>>            printf("\tSignal strength/AFC  : %ld%%/%d\n",
>> -                std::lround(vt.signal / 655.35), vt.afc);
>> +                lround(vt.signal / 655.25), vt.afc);
>=20
> v4l2-ctl-tuner.cpp also uses std::lround, but that one isn't changed back.=

>=20
> Is rds-ctl.cpp perhaps just missing a header?
Nope. std::lround is C++11.
>=20
> Regards,
>=20
>    Hans
>=20
>>            printf("\tCurrent audio mode   : %s\n", audmode2s(vt.audmode))=
;
>>            printf("\tAvailable subchannels: %s\n",
>>                    rxsubchans2s(vt.rxsubchans).c_str());
>>=20
>=20
