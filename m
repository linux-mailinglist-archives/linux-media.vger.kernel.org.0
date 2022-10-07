Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9AEE5F8103
	for <lists+linux-media@lfdr.de>; Sat,  8 Oct 2022 01:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiJGXEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 19:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJGXEf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 19:04:35 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDE199
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 16:04:33 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id o64so7131140oib.12
        for <linux-media@vger.kernel.org>; Fri, 07 Oct 2022 16:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJfuuF9lKbZrzeRMRPZLKHPdNCoVkv4e1zGAMiZ1COo=;
        b=JYyaj31HoYCsTL6s9TMyoFH/ayiLDLZQy6Xbrcd7Id+Hb/7deirQN725U3yAotgP3T
         YLmcqyhaZzmrgTXNzkod5wu8ZeQB1UWJVLgNmLmnozj/r2LBITDabgTLRtt0yf0VdhH9
         w3XHwkDMVx62CaztnvfNP2ruwcwDuiuj6i/RjuwDJy0RKhdWNukxRHSvkq8Nm6h0/78C
         sfT+s0jQeavabbCP5wLMtkOr3yC8EGnN+yeH0RfMHvHIwE/MB4LV+X4zSXctfmLyt2UF
         r4Osy+BX4valW6EhIAftzkGHSfhDRJWwf415FX/PZsjoYHcPUrMybHQxtmUelWRUWSqW
         ksCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJfuuF9lKbZrzeRMRPZLKHPdNCoVkv4e1zGAMiZ1COo=;
        b=rm7Q19dUbtA12MAx+H9HcqsW12UzUIjEvtGb+VNzL7vNWRyGYlCkMS1gqf/KqQMbXM
         WtuYsYV72bgS/yven13AmwKHJEyjUZRp/FWLSMOr0BFirtcxuNHCWD+aZM2pBdIbxSTh
         mpYboL6WjKPRr1O0JFBxPxgXYpfmmoRh9gQerAS+8r0fgmQo29HgmTMG5Ywa8VdUWpfo
         thLcR5YTkGvQobuRs5lbyBFgJMo5EA4MTlr1IYvqfML9woWuZoGfal4lhjnygCKldFbu
         fVOqss59dEu6UPe0C14aE4pO5Ps0extuvguUECaT+jxFlXxXyouEn8zPeN6VydnFe6x3
         YWrQ==
X-Gm-Message-State: ACrzQf0K0OO6yqjz4Hta8tBCs/l+BteMwARufp4qMgxjyhztlD7ZrUx6
        NefG+p/4nhQqPm8OYv5/n8AOkqcOXe8=
X-Google-Smtp-Source: AMsMyM71A+8C+EWMKK3eI7vzHKO5ANQbYaprrb4WNnuA2Rx2Rk3qp3we9sbzZewOj89FuMJWYdbXig==
X-Received: by 2002:a05:6808:13d1:b0:354:436a:2b02 with SMTP id d17-20020a05680813d100b00354436a2b02mr1925768oiw.124.1665183872330;
        Fri, 07 Oct 2022 16:04:32 -0700 (PDT)
Received: from smtpclient.apple ([186.212.115.217])
        by smtp.gmail.com with ESMTPSA id r17-20020a05687002d100b00130d060ce80sm2141250oaf.31.2022.10.07.16.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 16:04:31 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Devendra Tewari <devendra.tewari@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] videodev2.h: apply packed attribute to union
Date:   Fri, 7 Oct 2022 20:04:16 -0300
Message-Id: <969BFFB7-0FEB-44F8-9195-4932C52FB123@gmail.com>
References: <166517991147.1077487.14561113854570206898@Monstersaurus>
Cc:     linux-media@vger.kernel.org
In-Reply-To: <166517991147.1077487.14561113854570206898@Monstersaurus>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: iPhone Mail (20A380)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> No dia 7 de out. de 2022, =C3=A0s 18:58, Kieran Bingham <kieran.bingham@id=
easonboard.com> escreveu:
>=20
> =EF=BB=BFHi Devendra,
>=20
> Quoting Devendra Tewari (2022-04-22 20:20:31)
>> Fixes clang warning: field within 'v4l2_ext_control' is less than
>=20
> Can you detail which version of clang this occurs with? Have you tried
> more than one version?
>=20

This started happening with version 14.0.1 and I continue to see it with ver=
sion 15.

>=20
>> 'v4l2_ext_control::(anonymous union
>>=20
>> Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
>> ---
>> include/uapi/linux/videodev2.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
>> index 3768a0a80830..767c52c722cd 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1765,7 +1765,7 @@ struct v4l2_ext_control {
>>                struct v4l2_ctrl_vp9_compressed_hdr __user *p_vp9_compress=
ed_hdr_probs;
>>                struct v4l2_ctrl_vp9_frame __user *p_vp9_frame;
>>                void __user *ptr;
>> -       };
>> +       } __attribute__ ((packed));
>=20
> This is a curious fix. It's applying a packed attribute to the union,
> which I presume means that it's then applying the packed attribute to
> any item in the union.
>=20
> The items are all either: __s32, __s64, values - or pointers.
>=20
> While applying this attribute here may fix the compiler warning, I'm not
> sure it's clear why this is required. This file also has other
> locations where a union inside a packed struct is not marked as packed.
> Should all unions be marked with the attribute?

Interesting - I need to look deeper into packed.

> Is there any more context from the compiler warning beyond what is
> reported above?

I'll post a more detailed log asap.

>=20
> --
> Kieran
>=20
>=20
>> } __attribute__ ((packed));
>>=20
>> struct v4l2_ext_controls {
>> --=20
>> 2.25.1
>>=20
Thanks,
Devendra=
