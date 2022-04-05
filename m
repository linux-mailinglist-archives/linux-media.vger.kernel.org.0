Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 671084F4ABD
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448761AbiDEWvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 18:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446330AbiDEPo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 11:44:29 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F3290CF1
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 07:14:15 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id s11so11202716qtc.3
        for <linux-media@vger.kernel.org>; Tue, 05 Apr 2022 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=qwcqA8mY0KxEQmZmip5hKmkn8YnMp99yWlNPD7XLEbA=;
        b=vxU5B3VnnU316tDuhbMaieIBKDlM3l5ZtZitOb8mUUK6l+Ch5p5ZQ4HVvp/YOhfqiL
         iG4fqJk3KpC0/ED+KfeIPhF8Oza/9X0vweQmHA5BlbV1bum+iMT+4bY9HJyPS+gqsB+E
         7/IHfXkw+Eqj8eJ4m9Z5KSCdeX+rVGgZmnM2PpLRNulnfgChki2sGZ+lmHmsH4K+J4Ta
         XYaq5ydCpmaYDP5krarcfOcAlOTAuekAAHdF/b35Hp3V/s4/jmHKEqcAIr3pyR501rPR
         ShVP5QGQJiBeBSKOMo7Ta0aPRO4WWllHy6ZyDMtfpch7o32ROKDo1jhkM8ZkY33lEsDF
         OScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=qwcqA8mY0KxEQmZmip5hKmkn8YnMp99yWlNPD7XLEbA=;
        b=cSmvGKTHL1lEiXmVchq8Lva1ndGOEdOwQ3RT91FQUqlaQpVidOSIEAe+2wjJ4F7Qnc
         brpbiOuoJ/HtmeuNcmdR0KaN66OTU7nFF13Ih796XXa2t4tG8dAlNCexLJlDgFc5GSng
         4vWhCAwsyoYzC2BoWg+UScgL63lMY4yYdp5rh37KJhv+n4Pbdl1hM5Ti6Qu5StFz6Mpv
         NwXC7QGcrmdCUn912weUDkq0LZlNOnmro3alq+Xtn6w75BOM2fzekUMD3gNtYayFzfB7
         7FFKJgHIRTrMMnQAg0EbKDOiMfgkbfODuCt9vKjtzHa4CEne95VNOW48zuNlWec7k7dT
         dCPQ==
X-Gm-Message-State: AOAM533R1egbVwXcTt1hCpxXLpS554Xes8h1PFLEFz0dkqwQOUG17I6+
        yu9wleiDURyRjruwuoWIu0QsIg==
X-Google-Smtp-Source: ABdhPJyQaWtIcc1vmujXIRt+6FBp+DpJze5+VDsg92aUPGan/7CqoJ1VeKQCD+uEKfdpoAXgCULbVA==
X-Received: by 2002:a05:622a:1051:b0:2e1:eb06:ecc2 with SMTP id f17-20020a05622a105100b002e1eb06ecc2mr3145351qte.171.1649168047789;
        Tue, 05 Apr 2022 07:14:07 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id h6-20020ac85e06000000b002e1e8a98abbsm10903086qtx.41.2022.04.05.07.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 07:14:07 -0700 (PDT)
Message-ID: <a54f89b4cb896a45bdf60ed78024fed88b9c1211.camel@ndufresne.ca>
Subject: Re: [PATCH 4/7] media: coda: disable stateful encoder ioctls for
 jpeg encoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Tue, 05 Apr 2022 10:14:06 -0400
In-Reply-To: <20220404163533.707508-4-p.zabel@pengutronix.de>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <20220404163533.707508-4-p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 04 avril 2022 =C3=A0 18:35 +0200, Philipp Zabel a =C3=A9crit=C2=A0=
:
> Use v4l2_disable_ioctl() to disable the stateful encoder ioctls
> VIDIOC_ENUM_FRAMEINTERVALS, VIDIOC_G_PARM, and VIDIOC_S_PARM for
> the jpeg encoder device, to fix this v4l2-compliance test failure:
>=20
> 		fail: v4l2-test-formats.cpp(68): node->is_m2m && !(node->codec_mask & S=
TATEFUL_ENCODER)
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: FAIL
> 		fail: v4l2-test-formats.cpp(1363): node->is_m2m && !is_stateful_enc
> 	test VIDIOC_G/S_PARM: FAIL
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/chips-media/coda-common.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/m=
edia/platform/chips-media/coda-common.c
> index c60473b18b6b..4a7346ed771e 100644
> --- a/drivers/media/platform/chips-media/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda-common.c
> @@ -2882,6 +2882,11 @@ static int coda_register_device(struct coda_dev *d=
ev, int i)
>  	if (dev->devtype->vdevs[i]->type =3D=3D CODA_INST_ENCODER) {
>  		v4l2_disable_ioctl(vfd, VIDIOC_DECODER_CMD);
>  		v4l2_disable_ioctl(vfd, VIDIOC_TRY_DECODER_CMD);
> +		if (dev->devtype->vdevs[i]->dst_formats[0] =3D=3D V4L2_PIX_FMT_JPEG) {
> +			v4l2_disable_ioctl(vfd, VIDIOC_ENUM_FRAMEINTERVALS);
> +			v4l2_disable_ioctl(vfd, VIDIOC_G_PARM);
> +			v4l2_disable_ioctl(vfd, VIDIOC_S_PARM);
> +		}
>  	} else {
>  		v4l2_disable_ioctl(vfd, VIDIOC_ENCODER_CMD);
>  		v4l2_disable_ioctl(vfd, VIDIOC_TRY_ENCODER_CMD);

