Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6CEB654244
	for <lists+linux-media@lfdr.de>; Thu, 22 Dec 2022 15:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbiLVOBR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Dec 2022 09:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235309AbiLVOBO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Dec 2022 09:01:14 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADDA810576
        for <linux-media@vger.kernel.org>; Thu, 22 Dec 2022 06:01:10 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id z12so1378634qtv.5
        for <linux-media@vger.kernel.org>; Thu, 22 Dec 2022 06:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBYHoKwjQArM9LB7va7yba+zWUDZ0lSQxJbhHePp+Bk=;
        b=UuaxYsIaNDRY0Pa19OFmUNoA2PBEv9u9nBdzxSo5R5xPkdSR8UIUb2/1ViFm3Mpgji
         Cr3Zn3gfpL8ev5HqBZgnWDII+J4UqUCTi4COWQ5UpWeFCuuW9BnTvYeG6NHBucdE24Ej
         yqWvnrJs5O6FJMv9+EdyPQCXvmEUoEvXZiX/s4458CehUaxufF4iovPeZuWHRwdKmBlX
         nF8ftQcNitOmpWtrWdEBWrtGwTLOSYcivUzlNOLX/0jGkXnJzzU0CV8u+6T6uvM/eAXk
         T604KCkOtPndIefDBr7t7Z4GekyjpfgzYfwPpMb0XEptvIEnwy4pTM8Nx7LCoCc/HvxT
         Lupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SBYHoKwjQArM9LB7va7yba+zWUDZ0lSQxJbhHePp+Bk=;
        b=qQreVEyofQOIR+fWQyqeOkyuGsORpTZ1+ohhJbG6aH2N9mojzwyJHPUHP9pD5mgZfD
         HLeDNBNixRgP/Y0yIPcyeRllbzCidB2y6p9OtCsqk15AikPsrb2beIoxkX5P6yE1Tkg0
         4rvteMvuykf4XK57P6pOS3nnGgjqmIB5ZmeGCFIVUmTEQwI1ZRW8fUtT5EwYRDko3JxX
         OTzBX7fa2gwJXXVBMTFMs0tAeax0qWGAvwLyBH/HKgPD6wAUsTP3zhxUSFFKbXhedTNG
         bbCUP1XrveA7cpfprtppaz3QJYvifSfPCua7bgg1rT/Hh9TUgz2IbeNyydYFjCqk9qTY
         YSTQ==
X-Gm-Message-State: AFqh2krDmjYVYhypWlx5daeoJOPDsQj2tNxSOaxYTFHSmNKUXraxpZlu
        esnYxUWlqHg2bCsU31/cl82MQw==
X-Google-Smtp-Source: AMrXdXvRkI2U6gES0TIzmcGbc9xurURxGvcBNfn1RoVNkwjnkstY+t71tFXIkaUF7C6JpXap3icAPA==
X-Received: by 2002:ac8:4646:0:b0:3a4:3137:79b6 with SMTP id f6-20020ac84646000000b003a4313779b6mr8218504qto.24.1671717669873;
        Thu, 22 Dec 2022 06:01:09 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id t16-20020a05620a451000b006fa8299b4d5sm316173qkp.100.2022.12.22.06.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 06:01:09 -0800 (PST)
Message-ID: <1110c180e6586e213ea180920cbe6215b68a42be.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-ctrls: Fix doc for
 v4l2_ctrl_request_hdl_find
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Miaoqian Lin <linmq006@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 22 Dec 2022 09:01:04 -0500
In-Reply-To: <20221222115638.768143-1-linmq006@gmail.com>
References: <20221222115638.768143-1-linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 22 d=C3=A9cembre 2022 =C3=A0 15:56 +0400, Miaoqian Lin a =C3=A9cri=
t=C2=A0:
> We should call v4l2_ctrl_request_hdl_put() instead of
> v4l2_ctrl_request_put_hdl(). Fix the typo.
>=20
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  include/media/v4l2-ctrls.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index e59d9a234631..7788eeb3e2bb 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -1343,7 +1343,7 @@ void v4l2_ctrl_request_complete(struct media_reques=
t *req,
>   * @parent: The parent control handler ('priv' in media_request_object_f=
ind())
>   *
>   * This function finds the control handler in the request. It may return
> - * NULL if not found. When done, you must call v4l2_ctrl_request_put_hdl=
()
> + * NULL if not found. When done, you must call v4l2_ctrl_request_hdl_put=
()
>   * with the returned handler pointer.
>   *
>   * If the request is not in state VALIDATING or QUEUED, then this functi=
on

