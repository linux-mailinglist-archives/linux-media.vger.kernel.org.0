Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA1DF5992E3
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 04:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243424AbiHSCEk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 22:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242485AbiHSCEj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 22:04:39 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA51D1E33
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 19:04:36 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id x23so2975165pll.7
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 19:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=yWnGR4BfNcCxaolOEwdABM0xrkDmvU/Nz95OHmVgHpY=;
        b=CKdOJPCpiGK2pst0jaTU8SrcYynJsuK62XVv3IFePFxHNQL4V141nVLxN0ZNcHxFXl
         Xl7+COUPX860QF7hcqbpFpXgrfIxE+tEKWXFErStovXtPHt8uLrXkpa90aJSDOdCo2yz
         JRCiMhPcyM2YG8b5B8w+XiVGEM3WDGRSZQRkOWYict5yHoRGssMJcmkbd9HxqqUXNQ5d
         VbBerp9+QCY2l6JuMGBbzFqjhAggIiC0yPe/wiCglSSYK55oRLRygMrOVSHsZWDnUyYI
         K7HAw/E8zWWOjMTJAiVEZPe40i6giR99WQkchf/mdyVof+e4lumk4gXJrH6teyOWH90r
         n5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=yWnGR4BfNcCxaolOEwdABM0xrkDmvU/Nz95OHmVgHpY=;
        b=1kuk+RQSOWfWCeQY5mt3iH4/Ics75Ug+3q6KTEv9xci6zOYimtJuhXmgvMY43e4E0R
         auTCpk998hu3l21PCDjgKgSxXA9qz5I0V7a4s5TZDMsQ9cHB3dZcNXfeLySUj1eJqZX2
         1AYHknIG63NVoBuXqzwHLmqoWvXuoVH6/04ayuxrd69OAQk18af99gmZDp7AX8Eex8HN
         zc9UT3k7l2vjsvYA8WVm/AFASiwdwCl0SF03diDNhHhmwxlFMRIOhyei77PMbNPYffyS
         NsuO8SpMJYsX6Xosu19t8AgWXVkBGyIoYCxYvxSiG/Ws5qEZkqFUFxBz90/krekdypTF
         G3eQ==
X-Gm-Message-State: ACgBeo1+nJ1oT5KSJgKvl+/CmJAyBaBVf3qGKULbcF2+hCnRch0bbENd
        mAwygJbRAnQSP27gWNX5I7vDjA==
X-Google-Smtp-Source: AA6agR77yF176KGnuoLrW0gShmHJO44HmBTThFl7HukDhxAMO22PTiMWwJ62uxXlia3c7Kp1c1F7IQ==
X-Received: by 2002:a17:902:d54e:b0:16e:f3e4:8c88 with SMTP id z14-20020a170902d54e00b0016ef3e48c88mr5068468plf.94.1660874675416;
        Thu, 18 Aug 2022 19:04:35 -0700 (PDT)
Received: from smtpclient.apple (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id d5-20020a623605000000b0052b94e757ecsm2276872pfa.213.2022.08.18.19.04.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Aug 2022 19:04:35 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 1/3] media: vsp1: add premultiplied alpha support
From:   Takanari Hayama <taki@igel.co.jp>
In-Reply-To: <Yv7u5cFdXIeGm5PQ@pendragon.ideasonboard.com>
Date:   Fri, 19 Aug 2022 11:04:31 +0900
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B54257A9-E017-42DF-827F-1D77DAEDD431@igel.co.jp>
References: <20220810083711.219642-1-taki@igel.co.jp>
 <20220810083711.219642-2-taki@igel.co.jp>
 <Yv7u5cFdXIeGm5PQ@pendragon.ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

> 2022/08/19 11:01=E3=80=81Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>=E3=81=AE=E3=83=A1=E3=83=BC=E3=83=AB:
>=20
> Hi Hayama-san,
>=20
> Thank you for the patch.
>=20
> On Wed, Aug 10, 2022 at 05:37:09PM +0900, Takanari Hayama wrote:
>> To support DRM blend mode in R-Car DU driver, we must be able to pass
>> a plane with the premultiplied alpha. Adding a new property to
>> vsp1_du_atomic_config allows the R-Car DU driver to pass the
>> premultiplied alpha plane.
>>=20
>> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
>> ---
>> drivers/media/platform/renesas/vsp1/vsp1_drm.c | 2 ++
>> include/media/vsp1.h                           | 2 ++
>> 2 files changed, 4 insertions(+)
>>=20
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c =
b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> index 0c2507dc03d6..019e18976bd8 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> @@ -856,6 +856,8 @@ int vsp1_du_atomic_update(struct device *dev, =
unsigned int pipe_index,
>> 	rpf->mem.addr[1] =3D cfg->mem[1];
>> 	rpf->mem.addr[2] =3D cfg->mem[2];
>>=20
>> +	rpf->format.flags =3D (cfg->premult) ? =
V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;
>=20
> I'll drop the parentheses when applying.

Thank you!

>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
>> +
>> 	vsp1->drm->inputs[rpf_index].crop =3D cfg->src;
>> 	vsp1->drm->inputs[rpf_index].compose =3D cfg->dst;
>> 	vsp1->drm->inputs[rpf_index].zpos =3D cfg->zpos;
>> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
>> index cc1b0d42ce95..48f4a5023d81 100644
>> --- a/include/media/vsp1.h
>> +++ b/include/media/vsp1.h
>> @@ -51,6 +51,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned =
int pipe_index,
>>  * @dst: destination rectangle on the display (integer coordinates)
>>  * @alpha: alpha value (0: fully transparent, 255: fully opaque)
>>  * @zpos: Z position of the plane (from 0 to number of planes minus =
1)
>> + * @premult: true for premultiplied alpha
>>  */
>> struct vsp1_du_atomic_config {
>> 	u32 pixelformat;
>> @@ -60,6 +61,7 @@ struct vsp1_du_atomic_config {
>> 	struct v4l2_rect dst;
>> 	unsigned int alpha;
>> 	unsigned int zpos;
>> +	bool premult;
>> };
>>=20
>> /**
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

Cheers,
Takanari Hayama, Ph.D. <taki@igel.co.jp>
IGEL Co., Ltd.
https://www.igel.co.jp/
