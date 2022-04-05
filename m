Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF7B4F4AAE
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442709AbiDEWuo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 18:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446785AbiDEPpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 11:45:08 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 822D953A42
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 07:19:04 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id b17so10091569qvf.12
        for <linux-media@vger.kernel.org>; Tue, 05 Apr 2022 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=IYw6PvhS470ji2ZJWGOV8lAMJMGjw7GPIcjbBWZJGMc=;
        b=LY4abgrEU9/LYixYTQAGvypN4V3Gh1UWJpHqh4/vZdQvf1RILMXOzXjWH5i/qkvOZ3
         U25A1xPffy2nDp+RhTpBEgCkqStoIy6Ez0rDmGvjUZVXsoQ/ImdX07y0/to9uPjOigip
         weZpM+cPQlT5pDU45zjaQX8fkEporpqZrg2skz+Ex3T+eVl0jb0PT7f1Fsbql9I1zY8L
         F9+Qtvbm7jYOrlFJDx7iFwTrwcjDCeMAGo9IKekyq8tAQusaRDG3loT1IuJBS1KY8ip7
         gtJqeesRN36WKmlJumrnHBjQ+EtAcr06jacFKwljigZnuFaedez389t3nEjeRoRPqOf5
         jm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=IYw6PvhS470ji2ZJWGOV8lAMJMGjw7GPIcjbBWZJGMc=;
        b=e6V92lVAb9TfOJvBcC+mR2nP3+MEwe+vN+NlvUOUy/M8t0xG0T9b3Y5T41Pf2cUWFa
         pBRwdYtYHNzoPPoVF8GKoYIwHqd6mCISmvdUw0WcLyQFBBuKjRArgFPRCKWBiixc20Nu
         48Jrgfd1h3Bra+93aU1ozQAEBLqWN422nHXd7WRadff9C/wWeYIzoBB6PoFHAOlvH4Qi
         yH6SKy8Qen/EU33patJ1ntwJXM5dNPCIybhn3U7ZvC9gLImpzxFSIfi0Ercg1AGiijPj
         02L40TazDZLrIn7GpYidFFwn0XI/TeXKzcchYaetBAypNjalKtTVwi+y3d6EJ6dIbrho
         h/2w==
X-Gm-Message-State: AOAM530XQ+UrP++aUHlYtPzmjMaPOMpxzR4dZGwTtYGkib309p8YcqLy
        4cJwUWFX2iSE+1DaeWX9HDxhEgn18tqgkl04
X-Google-Smtp-Source: ABdhPJzJhYmVy5MKHf+DUH/QkVjIn+bq7fAhulzjWjgpPaWaGP3Tw9A1Upac9cCAUPpYiqCbp68xyA==
X-Received: by 2002:a05:6214:260d:b0:441:51c4:e311 with SMTP id gu13-20020a056214260d00b0044151c4e311mr2858321qvb.111.1649168343359;
        Tue, 05 Apr 2022 07:19:03 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id j8-20020a05622a038800b002e236535929sm10975883qtx.32.2022.04.05.07.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 07:19:02 -0700 (PDT)
Message-ID: <6e080d0e687f1721f20c5985a12e96a71dda1bc3.camel@ndufresne.ca>
Subject: Re: [PATCH 6/7] media: coda: enable capture G_PARM for stateful
 encoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Tue, 05 Apr 2022 10:19:01 -0400
In-Reply-To: <20220404163533.707508-6-p.zabel@pengutronix.de>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <20220404163533.707508-6-p.zabel@pengutronix.de>
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
> Allow to call G_PARM with type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE,
> to fix the following v4l2-compliance test failure:
>=20
> 		fail: v4l2-test-formats.cpp(1344): ret && node->has_frmintervals
> 	test VIDIOC_G/S_PARM: FAIL

So basically the rate written in the bitstream (if any) will be the same as=
 the
target real-time rate, which matches my reading of the new spec as what def=
ault
behaviour we should have.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/media/platform/chips-media/coda-common.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/m=
edia/platform/chips-media/coda-common.c
> index c068c16d1eb4..33fcd8c7d72b 100644
> --- a/drivers/media/platform/chips-media/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda-common.c
> @@ -1341,9 +1341,6 @@ static int coda_g_parm(struct file *file, void *fh,=
 struct v4l2_streamparm *a)
>  	struct coda_ctx *ctx =3D fh_to_ctx(fh);
>  	struct v4l2_fract *tpf;
> =20
> -	if (a->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> -		return -EINVAL;
> -
>  	a->parm.output.capability =3D V4L2_CAP_TIMEPERFRAME;
>  	tpf =3D &a->parm.output.timeperframe;
>  	tpf->denominator =3D ctx->params.framerate & CODA_FRATE_RES_MASK;

