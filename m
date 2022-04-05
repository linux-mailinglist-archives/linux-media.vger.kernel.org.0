Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561C04F4A99
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235049AbiDEWtv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 18:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446291AbiDEPo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 11:44:26 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE3225D4
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 07:13:36 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id i15so4168871qvh.0
        for <linux-media@vger.kernel.org>; Tue, 05 Apr 2022 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=nDG3RXvuao+esWgoe/QBqcrUrhfucrvjlO0xEEd514E=;
        b=w5QgW25OlfgzhlOSob2UeQVOWWTsLhgL6RaROKiWlBO5UVvTeday+s+tAlYt52SWt+
         52VlbZlCCfQ7P7Rk/y5Nhh0C4LOjyr0eLrbnvgI/JjmQtQfosidRjuvziJD+SPL9j72i
         cFYPgfHUJpReEoJotaFcBrrtZwPbm2zaTO81gvvNYSaow5/2qrOidhylSBedS6gb7Yq7
         knndMJaFJbEpjKogTrvG4b3uKOjnvi/+0C6jISEDg+sg+09dnG5jJVnO1VLHJ6xqrrsU
         uxvzziKA1h0NJWF6/b5C5Arg7XiOO1f5nSopharhRo+mcGJk6pMrYqTtYe/ZePehZmus
         4u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=nDG3RXvuao+esWgoe/QBqcrUrhfucrvjlO0xEEd514E=;
        b=bvisCr2FPIUC2VVAOmbhkCatYpDX2S22RZaS9Hj3iX+j2lUUcOq9Wj/v1VKKwgE06Z
         NorI9o2V7MSCvI0aolKsK2PSaIx3RMGqM5tZBws73VzL5tZsYzl/M4rBtGLrEFSmi8eC
         uKuLWBT5r/0yoVASZr/29xn7Wx48/vgBknSmUx+2zgV9n9oMX1HlvgbOKzCMxnAw5BJ2
         b0SdNbD0IXztPZ32guNaeCu1ONdgp86fN4C9Q8Vq7+qO5fsZt6JiG0VYEa0ElQAtU9oN
         mkFT8ZxO/Wnh5BzB6DgJAQ8eNlBqD2Ud8yiHSu5Mtuuf8uulNiFDEzQrUazFzDeCpLWI
         70Jg==
X-Gm-Message-State: AOAM532JA+dl0rCqLuDprtx74EoHUiNT7aJg75eAcwUOiWR+bUWrBqL5
        9L0l/nNYGV0M+UZI0U+rMdiQaSAITSijbkXc
X-Google-Smtp-Source: ABdhPJyB6XDNiAgkyvmumI+vLOtbfa1HDPDLHwVpT15mNk8lKqdx04AOsACBi+PVHTVwTEyjoyCVxw==
X-Received: by 2002:a05:6214:5185:b0:443:a821:31fc with SMTP id kl5-20020a056214518500b00443a82131fcmr3051707qvb.129.1649168015668;
        Tue, 05 Apr 2022 07:13:35 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id t19-20020ac85893000000b002e1afa26591sm11903132qta.52.2022.04.05.07.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 07:13:35 -0700 (PDT)
Message-ID: <6c010a7ccf7af30bb711091179d7d2e7492bd085.camel@ndufresne.ca>
Subject: Re: [PATCH 3/7] media: coda: disable encoder ioctls for decoder
 devices
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Tue, 05 Apr 2022 10:13:34 -0400
In-Reply-To: <20220404163533.707508-3-p.zabel@pengutronix.de>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <20220404163533.707508-3-p.zabel@pengutronix.de>
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
> Use v4l2_disable_ioctl() to disable the encoder ioctls
> VIDIOC_ENUM_FRAMESIZES, VIDIOC_ENUM_FRAMEINTERVALS, VIDIOC_G_PARM, and
> VIDIOC_S_PARM, to fix this v4l2-compliance test failure:
>=20
> 		fail: v4l2-test-formats.cpp(1363): node->is_m2m && !is_stateful_enc
> 	test VIDIOC_G/S_PARM: FAIL

nit: Perhaps this comment can be improved. VIDIOC_ENUM_FRAMESIZES (even tho=
ugh
it could arguably be nicer to implement it for decoders) was returning ENOT=
TY
already, so I think its unlikely it was causing a test failures. For other =
it
G/S_PARM that looks logical, we usually don't use these for decoding unless=
 the
decoders can report the rate from the VUI or something, though this is not =
yet
specified.

For the change itself, which looks all right.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/media/platform/chips-media/coda-common.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/m=
edia/platform/chips-media/coda-common.c
> index dc75133b0ead..c60473b18b6b 100644
> --- a/drivers/media/platform/chips-media/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda-common.c
> @@ -1269,9 +1269,6 @@ static int coda_enum_framesizes(struct file *file, =
void *fh,
>  	struct coda_q_data *q_data_dst;
>  	const struct coda_codec *codec;
> =20
> -	if (ctx->inst_type !=3D CODA_INST_ENCODER)
> -		return -ENOTTY;
> -
>  	if (fsize->index)
>  		return -EINVAL;
> =20
> @@ -2888,6 +2885,10 @@ static int coda_register_device(struct coda_dev *d=
ev, int i)
>  	} else {
>  		v4l2_disable_ioctl(vfd, VIDIOC_ENCODER_CMD);
>  		v4l2_disable_ioctl(vfd, VIDIOC_TRY_ENCODER_CMD);
> +		v4l2_disable_ioctl(vfd, VIDIOC_ENUM_FRAMESIZES);
> +		v4l2_disable_ioctl(vfd, VIDIOC_ENUM_FRAMEINTERVALS);
> +		v4l2_disable_ioctl(vfd, VIDIOC_G_PARM);
> +		v4l2_disable_ioctl(vfd, VIDIOC_S_PARM);
>  	}
> =20
>  	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, 0);

