Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3528D5F84DC
	for <lists+linux-media@lfdr.de>; Sat,  8 Oct 2022 13:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiJHLEo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Oct 2022 07:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiJHLEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Oct 2022 07:04:42 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388FD13DEC
        for <linux-media@vger.kernel.org>; Sat,  8 Oct 2022 04:04:41 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id g15-20020a4a894f000000b0047f8e899623so5096620ooi.5
        for <linux-media@vger.kernel.org>; Sat, 08 Oct 2022 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQD3VDG0XIL4jbO5j0GtKRswMSCzSQWEg4QTcifRKFI=;
        b=WHDteUBS0567mYZhsQIgYMXxnMB59xeWwYYli5X02fFDX/NBhtYgBrU/1dtO6RAvx5
         QV54BRJ7WsAA08rbIBZxGchtXK9FNWIcXbOVWy7/xZBYF8D0ZcOWHcIoibmcrw2WLsmc
         cbAQqncEbyHw1klitjC9+fAe27GhBgc2FINYDU5aOY1/exIQHpW9p6lxQtRav6FxBxf+
         dNBL+RgAzEic7i/2bR4Ta7bgdNDdloQ2UMqUq9TCImd9m1lchWSinTlWuCde9sFLoJg3
         V7CNhdDqZOdLo94UJy0AIIvrL1HuqO0HiuBIEikiyyEAfZlQMisPDpyVdz5yNPNGt07R
         iNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQD3VDG0XIL4jbO5j0GtKRswMSCzSQWEg4QTcifRKFI=;
        b=fkhzNQaaYG8xWSSJ4WOjM7RuQXfCSBQkWczet8rCjKV+cU2gkJ25HRPlJ+f1mxTVYQ
         bamhlHjhOJ+JmTO/bPtOxy8Q0dIOiY5sO/e2fCifopJqdGlROFSNNdd0MzkSK85kX6ZD
         BZXG440B0j2RT2+lEjpc8xQUOR3aTOo3z2+gO1F5JhfGsCyYLMH+VwZ0W95WjdUYZS+f
         bQRH8PvWNLhPG4gi9leM7S3Pt8u+F9XGVv5LSZSWMN8ix6qCNHQa6CIVRGDjK0ZMSfSH
         R6q9HPrxNk4YZkePFV49Bj7ZbNqflh7/JIFeZE7qYRZ6N0J5k7Lb7sJ7lVGnsSq7xQOJ
         bqVQ==
X-Gm-Message-State: ACrzQf1SN87iLzvWX9hgXbTMPlA+Qvm73MEuFPDE/A6cK7t1n5w399Pn
        +4hOgO0mNQq0OiuJINSGrGfWQqn/Zqc=
X-Google-Smtp-Source: AMsMyM6bzMSHTq0OULhhUqgZeyJoX+rCkUGJ4rx6ETtEiOSdKlxIeKOtA9w1yrV+IMJpIFiJ8yPdog==
X-Received: by 2002:a9d:7c89:0:b0:655:dfb1:331c with SMTP id q9-20020a9d7c89000000b00655dfb1331cmr3810857otn.224.1665227080467;
        Sat, 08 Oct 2022 04:04:40 -0700 (PDT)
Received: from smtpclient.apple ([186.212.115.217])
        by smtp.gmail.com with ESMTPSA id v24-20020a05683011d800b006618ad77a63sm1124083otq.74.2022.10.08.04.04.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Oct 2022 04:04:40 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.92\))
Subject: Re: [PATCH] videodev2.h: apply packed attribute to union
From:   Devendra Tewari <devendra.tewari@gmail.com>
In-Reply-To: <969BFFB7-0FEB-44F8-9195-4932C52FB123@gmail.com>
Date:   Sat, 8 Oct 2022 08:04:26 -0300
Cc:     linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <00587D7F-CE87-4846-9119-BD06CB4D289D@gmail.com>
References: <166517991147.1077487.14561113854570206898@Monstersaurus>
 <969BFFB7-0FEB-44F8-9195-4932C52FB123@gmail.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: Apple Mail (2.3731.200.92)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> On 7 Oct 2022, at 20:04, Devendra Tewari <devendra.tewari@gmail.com> =
wrote:
>=20
>=20
>=20
>> No dia 7 de out. de 2022, =C3=A0s 18:58, Kieran Bingham =
<kieran.bingham@ideasonboard.com> escreveu:
>>=20
>> =EF=BB=BFHi Devendra,
>>=20
>> Quoting Devendra Tewari (2022-04-22 20:20:31)
>>> Fixes clang warning: field within 'v4l2_ext_control' is less than
>>=20
>> Can you detail which version of clang this occurs with? Have you =
tried
>> more than one version?
>>=20
>=20
> This started happening with version 14.0.1 and I continue to see it =
with version 15.
>=20
>>=20
>>> 'v4l2_ext_control::(anonymous union
>>>=20
>>> Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
>>> ---
>>> include/uapi/linux/videodev2.h | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/include/uapi/linux/videodev2.h =
b/include/uapi/linux/videodev2.h
>>> index 3768a0a80830..767c52c722cd 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -1765,7 +1765,7 @@ struct v4l2_ext_control {
>>>               struct v4l2_ctrl_vp9_compressed_hdr __user =
*p_vp9_compressed_hdr_probs;
>>>               struct v4l2_ctrl_vp9_frame __user *p_vp9_frame;
>>>               void __user *ptr;
>>> -       };
>>> +       } __attribute__ ((packed));
>>=20
>> This is a curious fix. It's applying a packed attribute to the union,
>> which I presume means that it's then applying the packed attribute to
>> any item in the union.
>>=20
>> The items are all either: __s32, __s64, values - or pointers.
>>=20
>> While applying this attribute here may fix the compiler warning, I'm =
not
>> sure it's clear why this is required. This file also has other
>> locations where a union inside a packed struct is not marked as =
packed.
>> Should all unions be marked with the attribute?
>=20
> Interesting - I need to look deeper into packed.
>=20
>> Is there any more context from the compiler warning beyond what is
>> reported above?
>=20
> I'll post a more detailed log asap.

This is the log with clang 15 compiler=E2=80=A6

 ../git/src/libcamera/v4l2_device.cpp
| In file included from ../git/src/libcamera/v4l2_device.cpp:8:
| In file included from =
../git/include/libcamera/internal/v4l2_device.h:15:
| ../git/include/linux/videodev2.h:1724:2: error: field  within =
'v4l2_ext_control' is less aligned than 'v4l2_ext_control::(anonymous =
union at ../git/include/linux/videodev2.h:1724:2)' and is usually due to =
'v4l2_ext_control' being packed, which can lead to unaligned accesses =
[-Werror,-Wunaligned-access]
|         union {
|         ^
| 1 error generated.


Compiler version...

# clang --version
clang version 15.0.1 (https://github.com/llvm/llvm-project =
29d395a1b7a8176abb1d6278f7df98301fbe7744)
Target: x86_64-unknown-linux-gnu
Thread model: posix

>=20
>>=20
>> --
>> Kieran
>>=20
>>=20
>>> } __attribute__ ((packed));
>>>=20
>>> struct v4l2_ext_controls {
>>> --=20
>>> 2.25.1
>>>=20
> Thanks,
> Devendra
Resending because mailing list daemon is unhappy with rich text.

Thanks,
Devendra

