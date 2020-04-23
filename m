Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1571B576F
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgDWIoF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbgDWIoF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:44:05 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18057C03C1AF
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 01:44:04 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id r14so2623126pfg.2
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=Cd6bKlDWb0+yf4D45aHDLkh7jwQWwhOhOLLADxG4Jkc=;
        b=ZUiGL0+Vp94msiqAiB0twLCkxYgXAz/DZ3PSJwbyzJwnmR9KAdtP9jvG4MJx4Q4xti
         AQWwBwrE1sbcq3PaJMtLvAnYVRfAVZX9p7qpA3ly+9CzD8JTGgSr72pCCR8RWG59APHi
         PJ32DW+2hkbw/cNEV/oVymRsuq5j1FPsQe/XuUQWYdk50/NVACSWEZILUTdYRNc0+KI0
         pki9oquUTqs7DM+AmAoE8J2Q7gRa7nJEKfjQ3nx7WIO7WOpOdpue6B0hFG4mQIxjBJag
         YaxRsnBy9AJZal6Y8SNDG8LX/rozVWWc8EBLgEhNqtAUpqHyYCMg+WND2Z1vjBsOPGmd
         KQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=Cd6bKlDWb0+yf4D45aHDLkh7jwQWwhOhOLLADxG4Jkc=;
        b=nLEtDksZgTxfN7P4iINug7EhgEwGHH9i2dgyeuBFQw2cWzyJVn2J/P7WMiU+tV2y73
         CloqFaZp/K+1E0nmXaCqzSM/aKibY7QLsxaIBjjTj3f3wAxDI7dGF3iTXFUVvBT9Rium
         dUIpJ4Ijul4Xl7Et9mQm7xERAvDJ9HrnzyyZd5X1+L3ekOxVF/u2g/PQswyzQu2MeCSl
         YFMvsfTaZ1XOrtfd/k3Me/EQeP1iMgo95lexgNG5JsKuhVPkWk5VviN+srogpeafFbcp
         9mSovNVv6DxatF02nQlxeTrhLvsWHBZHGKFTsTBDvDEWioZjOa1hFvCMaHwZ1vJqgyhd
         hh0g==
X-Gm-Message-State: AGi0PuYYaHfYvYc3490+MXfuFj2rR92fM5dDwZTP6JWTBE8JtaKXW+VY
        rvE2bj9rTFfUbCOZZix3pdE=
X-Google-Smtp-Source: APiQypIdp6VyzQnfQbEtKE1mGHUijtwBUFcZkZF9e1ZwHEjOwN+YMROsKio6cXLRyJn6884cqCt6cQ==
X-Received: by 2002:a62:4ec4:: with SMTP id c187mr2781513pfb.223.1587631443557;
        Thu, 23 Apr 2020 01:44:03 -0700 (PDT)
Received: from [192.168.0.147] (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id i190sm1933248pfe.114.2020.04.23.01.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 01:44:03 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Rosen Penev <rosenp@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 09/12] utils: fix implicit float conversions
Date:   Thu, 23 Apr 2020 01:44:02 -0700
Message-Id: <DBFC2366-4C35-43A2-8AC0-7F108FF6255F@gmail.com>
References: <614cd737-6d34-be13-2c45-da43652cf586@xs4all.nl>
Cc:     linux-media@vger.kernel.org
In-Reply-To: <614cd737-6d34-be13-2c45-da43652cf586@xs4all.nl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: iPhone Mail (17C54)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> On Apr 23, 2020, at 1:36 AM, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>=20
> =EF=BB=BFOn 22/04/2020 02:37, Rosen Penev wrote:
>> Found with -Wfloat-conversion
>>=20
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>> utils/cec-ctl/cec-ctl.cpp                   | 4 ++--
>> utils/cec-ctl/cec-pin.cpp                   | 2 +-
>> utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 +-
>> utils/v4l2-ctl/v4l2-ctl-misc.cpp            | 4 ++--
>> utils/v4l2-ctl/v4l2-ctl-streaming.cpp       | 2 +-
>> utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 2 +-
>> 6 files changed, 8 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
>> index f4133494..f0e31aca 100644
>> --- a/utils/cec-ctl/cec-ctl.cpp
>> +++ b/utils/cec-ctl/cec-ctl.cpp
>> @@ -1507,8 +1507,8 @@ static void stress_test_power_cycle(struct node &no=
de, unsigned cnt,
>>    srandom(seed);
>>=20
>>    for (;;) {
>> -        unsigned usecs1 =3D mod_usleep ? random() % mod_usleep : sleep_b=
efore_on * 1000000;
>> -        unsigned usecs2 =3D mod_usleep ? random() % mod_usleep : sleep_b=
efore_off * 1000000;
>> +        unsigned usecs1 =3D mod_usleep ? random() % mod_usleep : (unsign=
ed)(sleep_before_on * 1000000);
>> +        unsigned usecs2 =3D mod_usleep ? random() % mod_usleep : (unsign=
ed)(sleep_before_off * 1000000);
>=20
> Shouldn't this be static_cast<unsigned>? Same elsewhere.
Sure, but that=E2=80=99s beyond this patch. It should be unsigned int actual=
ly. Implicit int is bad.
>=20
> Regards,
>=20
>    Hans
>=20
>>=20
>>        usecs1 +=3D min_usleep;
>>        usecs2 +=3D min_usleep;
>> diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
>> index 0322ad5e..10abea37 100644
>> --- a/utils/cec-ctl/cec-pin.cpp
>> +++ b/utils/cec-ctl/cec-pin.cpp
>> @@ -261,7 +261,7 @@ static void cec_pin_rx_data_bit_was_low(__u64 ev_ts, _=
_u64 usecs, __u64 usecs_mi
>>     * If the low drive starts at the end of a 0 bit, then the actual
>>     * maximum time that the bus can be low is the two summed.
>>     */
>> -    const unsigned max_low_drive =3D CEC_TIM_LOW_DRIVE_ERROR_MAX +
>> +    const unsigned max_low_drive =3D (unsigned)CEC_TIM_LOW_DRIVE_ERROR_M=
AX +
>>        CEC_TIM_DATA_BIT_0_LOW_MAX + CEC_TIM_MARGIN;
>>=20
>>    low_usecs =3D usecs;
>> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-com=
pliance/v4l2-test-buffers.cpp
>> index 93df7034..87c2e523 100644
>> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> @@ -2597,7 +2597,7 @@ static void streamFmt(struct node *node, __u32 pixe=
lformat, __u32 w, __u32 h,
>>    char hz[32] =3D "";
>>=20
>>    if (!frame_count)
>> -        frame_count =3D f ? 1.0 / fract2f(f) : 10;
>> +        frame_count =3D f ? (unsigned)(1.0f / fract2f(f)) : 10;
>>    node->g_fmt(fmt);
>>    fmt.s_pixelformat(pixelformat);
>>    fmt.s_width(w);
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-m=
isc.cpp
>> index cb933217..2851886a 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
>> @@ -320,7 +320,7 @@ void misc_set(cv4l_fd &_fd)
>>        parm.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>        parm.parm.capture.timeperframe.numerator =3D 1000;
>>        parm.parm.capture.timeperframe.denominator =3D
>> -            fps * parm.parm.capture.timeperframe.numerator;
>> +            (uint32_t)(fps * parm.parm.capture.timeperframe.numerator);
>>=20
>>        if (doioctl(fd, VIDIOC_S_PARM, &parm) =3D=3D 0) {
>>            struct v4l2_fract *tf =3D &parm.parm.capture.timeperframe;
>> @@ -338,7 +338,7 @@ void misc_set(cv4l_fd &_fd)
>>        parm.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT;
>>        parm.parm.output.timeperframe.numerator =3D 1000;
>>        parm.parm.output.timeperframe.denominator =3D
>> -            output_fps * parm.parm.output.timeperframe.numerator;
>> +            (uint32_t)(output_fps * parm.parm.output.timeperframe.numera=
tor);
>>=20
>>        if (doioctl(fd, VIDIOC_S_PARM, &parm) =3D=3D 0) {
>>            struct v4l2_fract *tf =3D &parm.parm.output.timeperframe;
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-=
ctl-streaming.cpp
>> index 066a336a..6981a3cc 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>> @@ -569,7 +569,7 @@ static void print_concise_buffer(FILE *f, cv4l_buffer=
 &buf, cv4l_fmt &fmt,
>>    if (!skip_ts && (buf.g_flags() & V4L2_BUF_FLAG_TIMESTAMP_MASK) !=3D V4=
L2_BUF_FLAG_TIMESTAMP_COPY) {
>>        double ts =3D buf.g_timestamp().tv_sec + buf.g_timestamp().tv_usec=
 / 1000000.0;
>>        fprintf(f, " ts: %.06f", ts);
>> -        if (last_ts)
>> +        if (last_ts <=3D 0.0)
>>            fprintf(f, " delta: %.03f ms", (ts - last_ts) * 1000.0);
>>        last_ts =3D ts;
>>=20
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl=
-subdev.cpp
>> index 747f1699..f1223084 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
>> @@ -487,7 +487,7 @@ void subdev_set(cv4l_fd &_fd)
>>            exit(1);
>>        }
>>        fival.interval.numerator =3D 1000;
>> -        fival.interval.denominator =3D set_fps * fival.interval.numerato=
r;
>> +        fival.interval.denominator =3D (uint32_t)(set_fps * fival.interv=
al.numerator);
>>        printf("Note: --set-subdev-fps is only for testing.\n"
>>               "Normally media-ctl is used to configure the video pipeline=
.\n");
>>        printf("ioctl: VIDIOC_SUBDEV_S_FRAME_INTERVAL (pad=3D%u)\n", fival=
.pad);
>>=20
>=20
