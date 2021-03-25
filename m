Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF5C348E5C
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 11:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhCYKwT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 06:52:19 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:37645 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbhCYKv5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 06:51:57 -0400
Received: from mail-oo1-f44.google.com ([209.85.161.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MxmBi-1lZuOg11vK-00zJK8 for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021
 11:51:56 +0100
Received: by mail-oo1-f44.google.com with SMTP id q127-20020a4a33850000b02901b646aa81b1so368488ooq.8
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 03:51:56 -0700 (PDT)
X-Gm-Message-State: AOAM530Q7pzwG/3/5O/RR45xZsncwB7+pM/XRgvqEZ0SITtEx2kVPsUq
        nyfHozbyLd+UbOHbVTDSwpWBpW0s6BZcFfMX7U4=
X-Google-Smtp-Source: ABdhPJw91lv74YYOW4Kov/Md2P0IHBdTDmcWkqxXARPTbGNeWHb/ubYXdAPV2K1kT20MJJ6EP6Vha1e3ioIBNR3mWBs=
X-Received: by 2002:a4a:e9a2:: with SMTP id t2mr6575931ood.15.1616669514956;
 Thu, 25 Mar 2021 03:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210325102952.1126952-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20210325102952.1126952-1-stanimir.varbanov@linaro.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 25 Mar 2021 11:51:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0uCJ0U=mUiuUfT53r27KLBHaMOpZpLTp4BrbvG1P7sMw@mail.gmail.com>
Message-ID: <CAK8P3a0uCJ0U=mUiuUfT53r27KLBHaMOpZpLTp4BrbvG1P7sMw@mail.gmail.com>
Subject: Re: [PATCH] v4l: Cast timestamp tv_usec to singned
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:uomhpGsl1qGT5raFnR5Mtq6SkR86r2WHKo0BzLjvLKqY6f95TVi
 DAnLwRDibeOwT7VQMh5JppxgwAmPwr8O8dfFkRYQLIsqiQY2IOhG35pcNFSe0nUwsvZsv9D
 rWCu7o+ydSja/wd2WBWeChlz+9YLXB9HyoBRGTttekwE3CzsESNycC4YQ7FViKxxYNPMxpE
 3HDr1T4RqK5ghfz5eMxfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/aue+4clB/4=:Dp6aMT+Q5nmUB4nwYkY5VM
 64D/YjHrntq4F3q+c4GR2QMTYtTi1Tqa55utTqr+6vcxWiNvy0ZOXVPkKXL65KMdHtMSw9Dx1
 4Q0YoUS0fv4NQp6CAn6eZvtjhoIZRb6JgFTxRAXuXcuK6mJ+RKXUiKPWYRahx5w3TGU24h11u
 IOq/IyTytK2djOpxSRkx34vyRGBErxKGjjVPRMcT+78UPLoHSW+0pJ0P+yUb5wLvdHsW+sZ6O
 nswIkoqd8RfXt0lTQQI3RCr7WH4GiEaANO4bauLNa6baOlJoZvGzBDCvqW57MDp62C/ToS+tn
 Hb+Lrl8+eNnq7Ip3X/+UY+K7VVqSFfM+8hafhMs3mrzzVKuA7Thc2cdw6N44+2whHeCGl2Ond
 nOkqnk2KUguF2tWaZZrxLTxNBJM9Xqq+HkqbHYA0KKno0jntEf8L3T3j7mIUKGRxag3ohyMPI
 I/3DjPclPwOdafZ8od/9q/UuldjspY8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 25, 2021 at 11:29 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Some of the MPEG4 standards allows negative timestamps. Correct
> tv_usec cast to s32.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Can you clarify what exactly is allowed in MPEG4? Normally we require
a normalized timestamp to come from user space in other kernel interfaces,
i.e. an arbitrary .tv_sec value that may or may not be negative, plus
a sub-second .tv_usec between 0 and 999999, or a .tv_nsect between 0
and 999999999 to indicate the time after the last full second.

E.g. a negative timestamp of -1.0001 seconds would be represented as
.tv_sec = -2, .tv_usec = 999900.

What is the range defined in MPEG4? It might be necessary to check
for the specific range and reject anything outside of that, in particular
if MPEG4 also allows positive microsecond values larger than 999999.

         Arnd

>  include/media/v4l2-common.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 3eb202259e8c..1ed61416003a 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -544,11 +544,11 @@ static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>  {
>         /*
>          * When the timestamp comes from 32-bit user space, there may be
> -        * uninitialized data in tv_usec, so cast it to u32.
> +        * uninitialized data in tv_usec, so cast it to s32.
>          * Otherwise allow invalid input for backwards compatibility.
>          */
>         return buf->timestamp.tv_sec * NSEC_PER_SEC +
> -               (u32)buf->timestamp.tv_usec * NSEC_PER_USEC;
> +               (s32)buf->timestamp.tv_usec * NSEC_PER_USEC;
>  }
>
