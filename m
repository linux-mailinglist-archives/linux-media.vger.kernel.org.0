Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFD25691039
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 19:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjBISVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 13:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjBISVA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 13:21:00 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A302DE77
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 10:20:59 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id ch10so1856844qtb.11
        for <linux-media@vger.kernel.org>; Thu, 09 Feb 2023 10:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vYoLBMtSjl0B0VxFWH1mP5w3VQjWusAJS9fBHyrKqE8=;
        b=l4fJCIjrJPZdrJHziCTQ/NT2Ny0+B68N76G9/kGE7FGOVibnf+d0HzJN2foaU/+XDO
         UusxLMex9B2/yYJhnyDCZhtN1rW5IVSVHaSM36hPq0TyoxI0dgAig7I72vzUy1WZz/FW
         hl6ny+j/jXSfmrTPa5HPLeL5y65eJUYzLr3C0/dO0pCkrME7scjn3TEBTZlY7oovWuux
         uHVVr3fHHogisAkhLBus0wMD32gWgAZjWK0kIE5vAgxY7fKj+flstUDTq5KOE85+vHhr
         u8F4bj+76AusWha4o4sMH9rPkF5HcYy89jUgyT5i4pP2RJbn4wGbhRCSAnH26Hp5IjRJ
         7L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYoLBMtSjl0B0VxFWH1mP5w3VQjWusAJS9fBHyrKqE8=;
        b=19QqHsLK+RFSQfep6KE7jzwzvE7ya7cTEKgCTa5vQXJJggaOC5HyN+D3UJAAK9dBBA
         GXSYvJo3yI2jx28bOWK1lZA7EzT9Mtq6yL4yNTIJZA4hvVZ0Wl+3cutEjfOMMWQMKhnE
         EuWDwCdCwuKQDq50vHC4NXAy+IRe0llSeAMtyIkbQChck7jk/tt0YgHBnM7hGJGU4Gzm
         ZXwlzGYGCklHLcqElS4MAM+bgrfnjlGw/0yjIspFBfrSqPWKdIKfO6y+SyK7gGbyjNZb
         giSduVEvhPlrQLcQHReC8GvNoPy54OejDq39OkNMnwDedNAJik0EUbUKz4jbrwZdb7IR
         6/Tw==
X-Gm-Message-State: AO0yUKWxWhv85x/DfYUVZ3+QQ8o6ftPg1/xbqbajk7d90Vd74qsCzDHP
        WOnITskCAY28IJbPlPcOhvZeyw==
X-Google-Smtp-Source: AK7set/A63dE1jAuJbsAPIAzgNNhquhaOHiJLeexq5nz6tT/Pvv0FhallGZbuEmzPkscO+htgn2Kmw==
X-Received: by 2002:a05:622a:1052:b0:3b9:fb0e:adba with SMTP id f18-20020a05622a105200b003b9fb0eadbamr20766757qte.25.1675966858465;
        Thu, 09 Feb 2023 10:20:58 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id x129-20020a376387000000b006bb82221013sm1914533qkb.0.2023.02.09.10.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:20:58 -0800 (PST)
Message-ID: <4c9eef106e893b633ab83a792d97cc5e36f408fe.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: v4l: Add Broadcom sand formats to videodev2.h
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl
Date:   Thu, 09 Feb 2023 13:20:57 -0500
In-Reply-To: <20230127153415.83126-2-jc@kynesim.co.uk>
References: <20230127153415.83126-1-jc@kynesim.co.uk>
         <20230127153415.83126-2-jc@kynesim.co.uk>
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

Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =C3=A9crit=C2=A0=
:
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
> =20
>  /* Tiled YUV formats, non contiguous planes */
>  #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  Y/Cb=
Cr 4:2:0 64x32 tiles */

I would expect updates to v4l2-common.c and v4l2-ioctl.c to be in the same
patch. And then the driver should be using the helpers there whenever possi=
ble.

regards,
Nicolas

