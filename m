Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 977A16BBB3A
	for <lists+linux-media@lfdr.de>; Wed, 15 Mar 2023 18:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbjCORq2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Mar 2023 13:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbjCORqY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Mar 2023 13:46:24 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB3A94A71
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 10:45:44 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id r16so17073570qtx.9
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1678902343;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVqnbMQjD+hEQYZ0qvtCSJOeYn5CfLCQS9cotKwNhgs=;
        b=QVp9OnVZOYETbpMj1Z44zabcNQ/fZQv6+CIhiaDr59LTCSxmiMbbTD+moCTrrEk0zC
         Kx8tzJXf1Jrq3dUjXtB4MhHdkRdsXZrvw/Xqt7/aH1PvOkn8Nwizb6IaHbUI2cEpsZzF
         jdjJ8dKdqV+WOnShwkXgHh3zRqLoi6wasSE/1vCQuqppOiSHMxjKIXxgkJOsdob35VTx
         DWzoT6U63Ahmr+cVtK7Jfsm0gP5Y5M5vh8/klwT0FqXGTOqlkd4j2scUoBbRTt/2Me3j
         gJ2Nk2DM04S5EoPq9JEoema2XBz6g3Q9HR4PdxZoWRXHmZel9xSL+TA9Lh+OdqgqM72Z
         JpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678902343;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JVqnbMQjD+hEQYZ0qvtCSJOeYn5CfLCQS9cotKwNhgs=;
        b=a+qt4aXiVll39rEIyFzzYZO0luOvUeUNqrftVVrBgLOwdCwD0rVRurK+Cs1VZQ8oTd
         VvKK4dZVhnMDoo7HD5/t4waDJ3yt5vU1EnFDknFGM11ejXTNpc8LbnopHoAiTikOfJeO
         G+D/DmqFpIuOIXV9/sB7RNsOlFSQ6s2YgVTYwVMYAgHP6m/bQ8pJJ62Nw3L+c6o0dCCt
         hp2POBkVjtNquDKXA/O+eHePe53p82qf4cR713smZFqxKQ52qZzy+2N1NVQGv4jbV9gt
         1MI4hcC/SXSw8W2pYdmJBwlrLrhMPvNyrFVN4e0ycC+dsHdi75YMtztambpaVtvkAtGD
         YOgA==
X-Gm-Message-State: AO0yUKWLwK6xr4xcLOfQiyhssxk9jlMdKA4bf/LKXT3/ifGsbOwXY/rL
        3wlaU9MVdrU7wVGt34wtu1zYCafHSmYNCwe7pys=
X-Google-Smtp-Source: AK7set+YJeVGcvzLA8q/Tzr4X6kcPTw7R8ni/GDpEywO2L6gkqK6Nh1+Q22GPmCScmsCNBILMkU7xQ==
X-Received: by 2002:a05:622a:307:b0:3b6:2c3b:8c00 with SMTP id q7-20020a05622a030700b003b62c3b8c00mr920326qtw.66.1678902343521;
        Wed, 15 Mar 2023 10:45:43 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id cp4-20020a05622a420400b003bfb0ea8094sm3977092qtb.83.2023.03.15.10.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 10:45:43 -0700 (PDT)
Message-ID: <5cbe4d25a8ee52eaf245822ce5bbb97366d647ab.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/5] media: v4l: Add Broadcom sand formats to
 videodev2.h
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Date:   Wed, 15 Mar 2023 13:45:42 -0400
In-Reply-To: <20230310194121.61928-3-jc@kynesim.co.uk>
References: <20230310194121.61928-1-jc@kynesim.co.uk>
         <20230310194121.61928-3-jc@kynesim.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

Le vendredi 10 mars 2023 =C3=A0 19:41 +0000, John Cox a =C3=A9crit=C2=A0:
> Add fourccs for Broadcom 8 and 10-bit packed 128 byte column formats to
> videodev2.h
>=20
> Signed-off-by: John Cox <jc@kynesim.co.uk>
> ---
>  include/uapi/linux/videodev2.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 1befd181a4cc..a836322ae5d8 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -656,6 +656,8 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* 12  Y/C=
bCr 4:2:0 10-bit 4x4 macroblocks */
>  #define V4L2_PIX_FMT_NV12_8L128       v4l2_fourcc('A', 'T', '1', '2') /*=
 Y/CbCr 4:2:0 8x128 tiles */
>  #define V4L2_PIX_FMT_NV12_10BE_8L128  v4l2_fourcc_be('A', 'X', '1', '2')=
 /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> +#define V4L2_PIX_FMT_NV12_C128        v4l2_fourcc('C', 'N', '1', '2') /*=
 Y/CbCr 4:2:0 128 byte columns */
> +#define V4L2_PIX_FMT_P030_C128        v4l2_fourcc('C', 'N', '3', '0') /*=
 Y/CbCr 4:2:0 10-bit packed 128 byte columns */

I really should have asked on first review, sorry about this, but where doe=
s
P030 comes from ? I didn't find any new format that would be called
V4L2_PIX_FMT_P030.

> =20
>  /* Tiled YUV formats, non contiguous planes */
>  #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  Y/Cb=
Cr 4:2:0 64x32 tiles */

