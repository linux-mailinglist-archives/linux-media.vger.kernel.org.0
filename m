Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 539C06BBD34
	for <lists+linux-media@lfdr.de>; Wed, 15 Mar 2023 20:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjCOTYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Mar 2023 15:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232909AbjCOTYL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Mar 2023 15:24:11 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DB942BE5
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 12:24:05 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id n2so1283313qtp.0
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 12:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1678908244;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epiIRY8r+DpVkMjZsgsAihrGpAPUc7DdbAsWcUU5QX0=;
        b=RPgsjKVhQQAPsm3dYNULY/KQ5it9qAq+4pu+aiuBBvbxmrvkU7VOFnuMiiE3o+AdLC
         uDK1YmVgs0Ipnpog262xdxqREGwUczuTot4kzjZNy1HHb+r3iV5Vlp/5mLmKQ9FRw5zz
         n/8AJACH1ldS2rNheCGWv6lgFCd06XGalJNpvdP7/UrGit8No0jc04QLs2uJjhO+VC7n
         q2tBDeEqyDkEREMrMoTcY6hiuAAR73E/a6Tu3DJBELPl92ULh0Byr/068UHnZ2WP0H1d
         0lmLNHLGjN9A0T80Xo2m77fBsFu4djibx6oL3m6fqlyhVCfkOF3EPHplL71uhLEbeU5P
         yirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678908244;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=epiIRY8r+DpVkMjZsgsAihrGpAPUc7DdbAsWcUU5QX0=;
        b=0E7vnLB5pj0g2X6zHszWw2C+oNC0EBNJVCHPbAEEN/2+BWUEyXdVrnJl2XX++8+O0/
         iSJWGJzrX+5DrHHBIHgFzICrHFGe+FzTMgLYZQaFlO6UyR/MrgPkO8e6EFnZ/51U27Yi
         oSck/hHglLls4mVulxDPmOVsvTfGRlgsnPFK5uRl7FaCdTedKgsa7sRkaM5pKqikynth
         cgZLQxcbOLMfNf7kIynjaq6WCFZOHMlRexvGIgMaAihxsF6LJ1XyLPUdI6p1TntmfTLX
         wP7GV17i2I5fmwj/g4ioSDioSDl268YI0YsEX+smHJGh6A+5/51tR/oRc6ET5/W0UIaf
         sWeQ==
X-Gm-Message-State: AO0yUKVLgKmlDyEj88nJdWfkd21Ke38HHvDDPzrWZy+v0BJYYpePqeiO
        DThrRDIaNszbgcoKRZ9qiXlaY29Y6fvyl6SJ3K4=
X-Google-Smtp-Source: AK7set8cpXZiAyNf9f0OaGsMp8iwi+UlMYnZHmiyO0bwQ3XwIpbDiEc/f9FCorMCSj52Zw7hBGg00A==
X-Received: by 2002:ac8:7dc6:0:b0:3bf:e05a:f2f2 with SMTP id c6-20020ac87dc6000000b003bfe05af2f2mr1750551qte.31.1678908244686;
        Wed, 15 Mar 2023 12:24:04 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id 9-20020a370b09000000b007339c5114a9sm4306212qkl.103.2023.03.15.12.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 12:24:04 -0700 (PDT)
Message-ID: <87f736bdfc4f1136ebf957df27b3f21ca2c8035c.camel@ndufresne.ca>
Subject: Re: [PATCH v2 4/5] media: v4l: Add Broadcom sand format
 descriptions to v4l2-ioctl.c
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Date:   Wed, 15 Mar 2023 15:24:03 -0400
In-Reply-To: <20230310194121.61928-5-jc@kynesim.co.uk>
References: <20230310194121.61928-1-jc@kynesim.co.uk>
         <20230310194121.61928-5-jc@kynesim.co.uk>
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

Le vendredi 10 mars 2023 =C3=A0 19:41 +0000, John Cox a =C3=A9crit=C2=A0:
> Add short descriptions for Broadcom 8 and 10-bit packed 128 byte
> column formats to v4l2-ioctl.h
>=20
> Signed-off-by: John Cox <jc@kynesim.co.uk>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index b26da2650289..3120548aa139 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1353,6 +1353,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  	case V4L2_PIX_FMT_NV12_16L16:	descr =3D "Y/UV 4:2:0 (16x16 Linear)"; br=
eak;
>  	case V4L2_PIX_FMT_NV12_32L32:   descr =3D "Y/UV 4:2:0 (32x32 Linear)"; =
break;
>  	case V4L2_PIX_FMT_P010_4L4:	descr =3D "10-bit Y/UV 4:2:0 (4x4 Linear)";=
 break;
> +	case V4L2_PIX_FMT_NV12_C128:	descr =3D "Y/UV 4:2:0 (128b column)"; brea=
k;
> +	case V4L2_PIX_FMT_P030_C128:	descr =3D "10-bit Y/UV 4:2:0 (128b column)=
"; break;
>  	case V4L2_PIX_FMT_NV12M:	descr =3D "Y/UV 4:2:0 (N-C)"; break;
>  	case V4L2_PIX_FMT_NV21M:	descr =3D "Y/VU 4:2:0 (N-C)"; break;
>  	case V4L2_PIX_FMT_NV16M:	descr =3D "Y/UV 4:2:2 (N-C)"; break;

