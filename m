Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1656910F1
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 20:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjBITGc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 14:06:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjBITGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 14:06:30 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FCE36A31B
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 11:06:07 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id bu23so2812087wrb.8
        for <linux-media@vger.kernel.org>; Thu, 09 Feb 2023 11:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RRExSq4SBgGyfbyjdPHXrg2O+D7EoEAOlU7sE9eRqec=;
        b=yfBMjva6nFbJ1XhCWtpbN7+Y9CoIA24XHpAQFcAGzULhrA5WaNKliTtK9sKhBMV/Ov
         9GljXxy0JLq5UR5c4gYJ7RJ1oqIuB82YaT5QP0TtnYBCfbCLMtlLgdRWhwoMcEfxfQn5
         Px8o7JS/gCZDO3a8siDYmzinJiEXan6mDpKCMRWYC6CrvvNRQ4Y9vd8E+Gp9QaY0WdCc
         0fQu5Z/kAd0ygwil/muevErmPepEq/LJEKSRfd7cSs75s64x3U603OOSjUqyoowKO8DL
         /+33FU+rirqcyPGHoTnd9SezJ3WQtZQesACOZhp9dQIQ1Xv729dQFLozeqGKCoLtjlQM
         2jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RRExSq4SBgGyfbyjdPHXrg2O+D7EoEAOlU7sE9eRqec=;
        b=VMCGG+Zj6FrgKaQWXTVP2iKX+vsz6GPQcQNi2Tw///xUszdMtVzSrpOLMxAniYekK7
         CyssgbznRwd1fzyBonTDSIPFPfFNH2l/GMgNxwGBl4ZTOFymfbcWJZR9pr9ByAB0COfM
         XIQv7xZ4Fu6ZnxqneuBdWE4NktHlIg8hmswmuWNnL8D67hpLaouHGwQsG/ih+Wpwjama
         CGWBLV6Dd/LdwEitH9WtRq/eyoMwKr1tyY2tG0wA1aFLmyaS4hz3QrVbLRBYEgoV8VvP
         01ZfsdVDJ8ke9VB3KUJK1KdEilG6EicVfLav8ZYz3+aYF7ypdaDQ43OfX/R1qUuJqQq5
         kozA==
X-Gm-Message-State: AO0yUKVTLyJwTAmhNvFaVMxrQFGmx5+/Z4dg01hSGeuyb9nSb4MG/xPV
        iLXKRZnBOlUSEmu8MT3I0HkLNQ==
X-Google-Smtp-Source: AK7set8NR4mJwZKS/n+Js42xNYuyOykPNeZicXX43uk8KzzuaAZCWjAVpYycJKDHv7LnhpQVSTw2kQ==
X-Received: by 2002:adf:ef84:0:b0:2bf:bac7:30d4 with SMTP id d4-20020adfef84000000b002bfbac730d4mr12141951wro.53.1675969565686;
        Thu, 09 Feb 2023 11:06:05 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id bi5-20020a05600c3d8500b003db012d49b7sm9728587wmb.2.2023.02.09.11.06.05
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 09 Feb 2023 11:06:05 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 1/2] media: v4l: Add Broadcom sand formats to videodev2.h
Date:   Thu, 09 Feb 2023 19:06:04 +0000
Message-ID: <1ogauh5ro652so8vtc2fsgor5g3pj6ns3e@4ax.com>
References: <20230127153415.83126-1-jc@kynesim.co.uk> <20230127153415.83126-2-jc@kynesim.co.uk> <4c9eef106e893b633ab83a792d97cc5e36f408fe.camel@ndufresne.ca>
In-Reply-To: <4c9eef106e893b633ab83a792d97cc5e36f408fe.camel@ndufresne.ca>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =
=C3=A9crit=C2=A0:
>> Add fourccs for Broadcom 8 and 10-bit packed 128 byte column formats =
to
>> videodev2.h
>>=20
>> Signed-off-by: John Cox <jc@kynesim.co.uk>
>> ---
>>  include/uapi/linux/videodev2.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/include/uapi/linux/videodev2.h =
b/include/uapi/linux/videodev2.h
>> index 1befd181a4cc..a836322ae5d8 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -656,6 +656,8 @@ struct v4l2_pix_format {
>>  #define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* 12  =
Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
>>  #define V4L2_PIX_FMT_NV12_8L128       v4l2_fourcc('A', 'T', '1', '2')=
 /* Y/CbCr 4:2:0 8x128 tiles */
>>  #define V4L2_PIX_FMT_NV12_10BE_8L128  v4l2_fourcc_be('A', 'X', '1', =
'2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>> +#define V4L2_PIX_FMT_NV12_C128        v4l2_fourcc('C', 'N', '1', '2')=
 /* Y/CbCr 4:2:0 128 byte columns */
>> +#define V4L2_PIX_FMT_P030_C128        v4l2_fourcc('C', 'N', '3', '0')=
 /* Y/CbCr 4:2:0 10-bit packed 128 byte columns */
>> =20
>>  /* Tiled YUV formats, non contiguous planes */
>>  #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  =
Y/CbCr 4:2:0 64x32 tiles */
>
>I would expect updates to v4l2-common.c and v4l2-ioctl.c to be in the =
same
>patch. And then the driver should be using the helpers there whenever =
possible.

=46air point - I'll fix that.

What is the correct .bpp for 3 10-bit pixels packed into 4 bytes in the
v4l2_format_info?

Regards

John Cox
