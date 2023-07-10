Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2AA74C9B2
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 03:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjGJBqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jul 2023 21:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjGJBqX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jul 2023 21:46:23 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC072EC
        for <linux-media@vger.kernel.org>; Sun,  9 Jul 2023 18:46:21 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7656652da3cso320752285a.1
        for <linux-media@vger.kernel.org>; Sun, 09 Jul 2023 18:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688953581; x=1691545581;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nOheXOtT8oVSq9QK8cxfIIzcDjPSoT/Tqkhbz7VQPhE=;
        b=GWN7T0NyWldWANNrocPiSSsMSDSn5hJXAI14rTSwEcfjyEMb4IryrOEI5c6iRfodTN
         FheBw7dfJb6Vzjr5DgVTR69y54HvkIDv6wiyk/D3jK3wKGhKJJSYzPAE2ygJQNnIWfzV
         DR11wccNP7xYRjourlF6dFoCxLbN1X94HMopev/FIgIT9PGAtBJMmuUJfVN6tzWSJgPv
         UJFJX2oFyoPSF6FWC37NA/sCk1Z/jVE0x/1R5uERoP1M4UkXKuHIvLcnY6mfkyp4uUNX
         mK++j3Xne4kIbDJd04F/atANrUkrBxCUYbBBQn0j1VLWcvlzhj2JZwJKUMTZ9JUsY4DY
         LZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688953581; x=1691545581;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nOheXOtT8oVSq9QK8cxfIIzcDjPSoT/Tqkhbz7VQPhE=;
        b=IWMN0j6Cr1c/Ej05XlYvk1LoqGIWKVMKz1V4cjaD19/jTckh9CXZtYyHm9OFnTjpPO
         InahKB6HPZUZU24CcJX/QJeEkDD7shPiYw3akR1lWgOen/yle9ZNUKNwSAV1Lr/WD1XL
         Ewn3dCGvBf3fkTnxqbokbK85U+5n/QMxs8HlydnPHkl/HYms/eVCR3u6KodbhvDuY44p
         SNFVjNtce/ZODQvPkAY4NLwA1ztmjg4K9qFRQpdX3xqb29EE1bV1ClHxUhFQu8dOCxiN
         4RqwfmGMgt0sz5lHufaNnlvF0SJRPTerlPAJ7+EEb3ml30strqLhGBvts8V9maucZQDj
         CT5A==
X-Gm-Message-State: ABy/qLZSBbtmeqI7Pmim+aYs9+AR1HIrknKv833kEZogOr+TZJ5hP6qh
        asuJSXOyv3Y871QuLg/kyrftxcYCyLk=
X-Google-Smtp-Source: APBJJlFjR4tVj8WN2SH5cixfgXHgHgpl/v6dnefNVxJhcFQlqi6mcdM5R+I42fNUlgAgam1b2mxJSQ==
X-Received: by 2002:a05:620a:1707:b0:75b:23a1:832f with SMTP id az7-20020a05620a170700b0075b23a1832fmr10904549qkb.42.1688953581050;
        Sun, 09 Jul 2023 18:46:21 -0700 (PDT)
Received: from ?IPv6:240b:c020:422:b306:98a0:ded8:6808:aa23? ([240b:c020:422:b306:98a0:ded8:6808:aa23])
        by smtp.gmail.com with ESMTPSA id ju4-20020a170903428400b001aaed55aff3sm6932118plb.137.2023.07.09.18.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 18:46:20 -0700 (PDT)
Message-ID: <53c0943dc46a8d17ca66d2c028f40e9a80ca7cee.camel@gmail.com>
Subject: Re: [PATCH] media: dvb-usb-v2: gl861: Fix null-ptr-deref in
 gl861_i2c_master_xfer
From:   Akihiro TSUKADA <tskd08@gmail.com>
To:     Zhang Shurong <zhang_shurong@foxmail.com>, crope@iki.fi
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org
Date:   Mon, 10 Jul 2023 10:45:36 +0900
In-Reply-To: <tencent_0CAE84EB4D452DD8560158AD0792021B6A06@qq.com>
References: <tencent_0CAE84EB4D452DD8560158AD0792021B6A06@qq.com>
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Is the first chunk of your patch really necessary?
`msg[0].len < 2` includes the `msg[0].len =3D=3D 0` case,
so the `msg.buf =3D=3D NULL && msg.len =3D=3D 0` case is (seemed to me)
safely ejected as it is.

> --- a/drivers/media/usb/dvb-usb-v2/gl861.c
> +++ b/drivers/media/usb/dvb-usb-v2/gl861.c
> @@ -97,7 +97,7 @@ static int gl861_i2c_master_xfer(struct i2c_adapt
>=20
> er *adap, struct i2c_msg msg[],
>  	/* XXX: I2C adapter maximum data lengths are not tested */
>  	if (num =3D=3D 1 && !(msg[0].flags & I2C_M_RD)) {
>  		/* I2C write */
> -		if (msg[0].len < 2 || msg[0].len > sizeof(ctx->buf)) {
> +		if (msg[0].len =3D=3D 0 || msg[0].len > sizeof(ctx->buf)) {
>  			ret =3D -EOPNOTSUPP;
>  			goto err;
>  		}

regards,
akihiro

