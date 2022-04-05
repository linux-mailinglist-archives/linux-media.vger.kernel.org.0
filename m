Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDC84F4AC7
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1451632AbiDEWvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 18:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447674AbiDEPq6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 11:46:58 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009231575AE
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 07:22:42 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id t19so11239267qtc.4
        for <linux-media@vger.kernel.org>; Tue, 05 Apr 2022 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=40wcBMnT3Zuwa9qeFHwHL0p773Ckz490/I76zY5Os7g=;
        b=d4wjE9gBxnyRgyJ9PYiF9SkcNvUC3nKhgnxdtXRpEeDeKlx3mtwbhuFEn/xadyDb7u
         o9b6a8sYTuBPWpJfwR6u9oumZEh8+aKqmvwimk4UoLzEd8vU0F4We84UDS0LVjqJ0ZWn
         ChziUQ/RnOSC274WDrdor46YLwocAlZNctLBhF/tOrEE/QrpDkzE3MPjJ7hYD/Qkurf6
         0mbk3kRYJaJxShFzD2nlSXTVqZtqnTGfpERkI3oPBI0BNG+2US9keX+z9BrkZr+cw0f9
         RqWCgYEsf6N2E5xigigNQe+1x9l3f+JnREvt+jNtXhjo53j+UOSmG9J2awOgaH5q5M8j
         xiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=40wcBMnT3Zuwa9qeFHwHL0p773Ckz490/I76zY5Os7g=;
        b=j2yGE/eZ07J3lxa42UWFhCV0Z3cBeq1YPIyz3Ouq+M9ck7yuz4YmAQu503USuAb7Z+
         YVftIXE8MMqr7NLjsX4c8M7KzNNnLh6F1RPMZQJLyh4DHjvyd83Rxq9yZfl5JBRhaa4D
         1qZ/cR1v/eWdK6rWA7L3QHTEhcYvWQBt0W+BHykEp5zHMCm47I8w3DLhtD23Un1DkwJm
         gcB0LmQEblnbvCgMgFTQxDSxlrxvX76uPQWKYOA73UNVKh3V+Tg8KuTw/U61lWNqEGLx
         ceUZEOPXcisCCUmc8cmeVzU89nduADcZD4j9qT9Z3TdCZz3y2bVHPm2YffB1SWq7TGET
         U7fQ==
X-Gm-Message-State: AOAM533+xWFVfz2Cp8GWt2ugGh7VVlSdIdu9/YF82WwWIq/B8fS2a/WP
        6Zmd/JHE/pU9owwi+8vXvCv3lA==
X-Google-Smtp-Source: ABdhPJwubFIP48DOJ4cRnUYhUldIpAnvGC/35FeBSO8Ker3/X++2oD1DSL+X/WHFgAyQBMRvTYy44g==
X-Received: by 2002:ac8:5c90:0:b0:2e2:15c0:a5f3 with SMTP id r16-20020ac85c90000000b002e215c0a5f3mr3175655qta.332.1649168561786;
        Tue, 05 Apr 2022 07:22:41 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id s16-20020ac85cd0000000b002e1ed82f1e5sm11876589qta.75.2022.04.05.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 07:22:41 -0700 (PDT)
Message-ID: <bda20ff01f8aa7898416810743dac300f997e9c0.camel@ndufresne.ca>
Subject: Re: [PATCH 7/7] media: coda: enable capture S_PARM for stateful
 encoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Tue, 05 Apr 2022 10:22:40 -0400
In-Reply-To: <20220404163533.707508-7-p.zabel@pengutronix.de>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <20220404163533.707508-7-p.zabel@pengutronix.de>
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
> Allow to call S_PARM with type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT,
> to fix the following v4l2-compliance test failure:
>=20
> 		fail: v4l2-test-formats.cpp(1413): got error 22 when setting parms for =
buftype 1
> 	test VIDIOC_G/S_PARM: FAIL

That one may be missing something though. As you don't implement performanc=
e
target, you need to override the value somehow with the value you wrote int=
o the
bitstream no ? Otherwise we just ignore what userland sets silently ? I mig=
ht
not have got exactly how this case is supposed to be handled. Looking for
feedback on what is proper behaviour for drivers that do not implement
performance targets (resource reservation).

>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/media/platform/chips-media/coda-common.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/m=
edia/platform/chips-media/coda-common.c
> index 33fcd8c7d72b..cd9ff2fa4147 100644
> --- a/drivers/media/platform/chips-media/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda-common.c
> @@ -1421,9 +1421,6 @@ static int coda_s_parm(struct file *file, void *fh,=
 struct v4l2_streamparm *a)
>  	struct coda_ctx *ctx =3D fh_to_ctx(fh);
>  	struct v4l2_fract *tpf;
> =20
> -	if (a->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> -		return -EINVAL;
> -
>  	a->parm.output.capability =3D V4L2_CAP_TIMEPERFRAME;
>  	tpf =3D &a->parm.output.timeperframe;
>  	coda_approximate_timeperframe(tpf);

