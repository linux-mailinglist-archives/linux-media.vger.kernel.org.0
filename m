Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 692995F8515
	for <lists+linux-media@lfdr.de>; Sat,  8 Oct 2022 13:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbiJHLsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Oct 2022 07:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiJHLsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Oct 2022 07:48:24 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401F84F6A6
        for <linux-media@vger.kernel.org>; Sat,  8 Oct 2022 04:48:23 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id x6-20020a4ac586000000b0047f8cc6dbe4so5153284oop.3
        for <linux-media@vger.kernel.org>; Sat, 08 Oct 2022 04:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73QtHZDhbIGuujQNI6Z7ZQzch+gIkHHRWbkMn7pJwxs=;
        b=ESr1xs4JOjb74mz8DMtNIsBIqfeR0+Q04hExkKYfEeWcBI00NJdRqgUhRzh0gN+mUN
         O+9Q6eGIw8HqO18tey0qUrTy8VsKwK/j5naj6FLe7ZZ/14sr+Fi0m2xeuxw7z+1s/kDc
         v/y434FrTuPOORFdur/Vazf7A8h271pH/fQ19zhH1lhlNWjdxwtrGFeLmoqQ4YVfU4Hm
         Z+pPjHPV7HNXFv4tzhompR+1T33Wufj/eLydEwgKxPiRPCpkud1heV9HkMwHMcqdFfyL
         gjkmgLqvWbmNi4Ny7h1e5i8W6PzyefD4JRjCaSGnq7+/cVomtaRLgHI0mkz8BqkhXT1C
         CDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73QtHZDhbIGuujQNI6Z7ZQzch+gIkHHRWbkMn7pJwxs=;
        b=fBJbXNFtC5vfqAtzLBz86MtyJEjIIRt/sEfnNozThvftDLZ0ttFotkQfcHhPpL4Gmc
         FcFxWoWqMQWJqFHvaWs2BqWNhEgeqmvTKN60zGAvlaElCIoTxUvF0tsV1Pi7ebBSyvZG
         /a028m7USoe3w4ROOskBoy/6T+Itm9HwdczERyOokbIAPPGtqNAe71SV0JL/lEiSfJ0y
         oZySU48ROvWNeB7zknNTBh1G6pv+lksFw9L7ePaqX7fi5fHOQTnN0b2npPzeaSlNhb03
         DPqTN2AtCBeXoiprprv9Np9CPmJw4CL7JZqS2QoxY09YYPmXFRI1lc7DIA8Tb2tqjeog
         UKag==
X-Gm-Message-State: ACrzQf2100dMcC+y/W+OjCAQ/Ig1zJfVFkuULjotu1YrVTTs9RtkYSEM
        5v3bDEVC7jIEbc0aF5nULSI42+cYzgg=
X-Google-Smtp-Source: AMsMyM4i/7qqXaik9bYc1CEgsOJp+K8w4ZdFEHg/RQqxQ2T465Ayv0BddeDjeWl9ejQT9wnwvidwxQ==
X-Received: by 2002:a05:6830:2b28:b0:657:7798:2eda with SMTP id l40-20020a0568302b2800b0065777982edamr4124664otv.153.1665229702350;
        Sat, 08 Oct 2022 04:48:22 -0700 (PDT)
Received: from smtpclient.apple ([186.212.115.217])
        by smtp.gmail.com with ESMTPSA id r41-20020a05687017a900b00132f141ef2dsm2507489oae.56.2022.10.08.04.48.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Oct 2022 04:48:22 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.92\))
Subject: Re: [PATCH] videodev2.h: apply packed attribute to union
From:   Devendra Tewari <devendra.tewari@gmail.com>
In-Reply-To: <969BFFB7-0FEB-44F8-9195-4932C52FB123@gmail.com>
Date:   Sat, 8 Oct 2022 08:48:08 -0300
Cc:     linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A6CA791E-98FD-430E-8A6D-8F43241CF97D@gmail.com>
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

The only explanation I can think of is that this may be the only =
instance where a union inside a packed struct has other structs that are =
not packed.

>=20
>> Is there any more context from the compiler warning beyond what is
>> reported above?
>=20
> I'll post a more detailed log asap.
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

Resending because mail daemon rejected rich text message.

Thanks,
Devendra

