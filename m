Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205E97304D6
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 18:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbjFNQYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 12:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233064AbjFNQYL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 12:24:11 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE63109
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 09:24:10 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-3f9b5ec058aso20849061cf.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 09:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686759849; x=1689351849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDOHQI8bWafZ1bNMq81NOk5r9CB0D7gMPZXAIEA5R7o=;
        b=jdODcAN4IhsghwtLcZxJe9Z7In95fM1PMUV6gTv6Yi4JcINLkw5veiHnVj33j2W+bN
         5ZU2O6h4xbDLAdrHrlNPCLlO6Ebyu+3eb38VmQOaUkfM69+QQc4XaH5zYIZ52dHL03TW
         /gmPyAduypoU4MK18vLcYyzMPByE2UDOvsIcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686759849; x=1689351849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDOHQI8bWafZ1bNMq81NOk5r9CB0D7gMPZXAIEA5R7o=;
        b=KOAXXn/jQHMqiWkzFvYlFxfpDXsSV8GouWUn+XcJVPkiANcWxQDLbHqm3GAA1CGhcn
         3xnk/OjvcSgFzoHrl+9ZipUL1T31wG45GvCMMXimqBxUMo7rJ1rBybXnGMYi9VrNVf45
         9YQY/q/ihxXnvMK2anfx8iPGnAIBrem/rdupvcC99aM2qQhgCnz8n+6lRdVNGiDQvBjh
         lxjmDM+MsBDlolu6WNJgP2F4LV2g/f9iJ4IaEk8mourkuUOh8ijGwUOBUk0DWZWKnHU7
         QWyFb/20m0jcM39UOe3J0Ca+rw6F7szdh9bX2XuS6IMEeUizuHjaDjIC9YU5OnTU9s1F
         eaWw==
X-Gm-Message-State: AC+VfDz2HSM3pMoq9E+uiAzRAjHhi3nnoJeRmmjtNW/MisFQDSNBwKEK
        tvb6UvUrghbjCGX3zngLE6wcl3n1rm/Lw7RoN8sjFQ==
X-Google-Smtp-Source: ACHHUZ7cDmQZKf7AZyT4RcJ3pqmA3bcdDRsMXdZwFnOrLo5AmMf6+h6T/H70dyiMNxRlWF6T6O/wtw==
X-Received: by 2002:a05:622a:1111:b0:3f0:a426:5f29 with SMTP id e17-20020a05622a111100b003f0a4265f29mr3057535qty.11.1686759849321;
        Wed, 14 Jun 2023 09:24:09 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id d20-20020ac84e34000000b003f6ac526568sm5131316qtw.39.2023.06.14.09.24.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 09:24:04 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-3f9df7eb837so20617851cf.2
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 09:24:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1902:b0:3f5:c9f:1b27 with SMTP id
 w2-20020a05622a190200b003f50c9f1b27mr3883593qtc.1.1686759844040; Wed, 14 Jun
 2023 09:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230328092608.523933-1-harperchen1110@gmail.com>
In-Reply-To: <20230328092608.523933-1-harperchen1110@gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 15 Jun 2023 01:23:52 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CqhZgtCJ_-6M0=dYAfVs0TFeBjPURvosS_24qgour=Ow@mail.gmail.com>
Message-ID: <CAAFQd5CqhZgtCJ_-6M0=dYAfVs0TFeBjPURvosS_24qgour=Ow@mail.gmail.com>
Subject: Re: [PATCH] media: vcodec: Fix potential array out-of-bounds in vb2ops_venc_queue_setup
To:     Wei Chen <harperchen1110@gmail.com>
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        yunfei.dong@mediatek.com, mchehab@kernel.org,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 28, 2023 at 6:26=E2=80=AFPM Wei Chen <harperchen1110@gmail.com>=
 wrote:
>
> variable *nplanes is provided by user via system call argument. The
> possible value of q_data->fmt->num_planes is 1-3, while the value
> of *nplanes can be 1-8. The array access by index i can cause array
> out-of-bounds.
>
> Fix this bug by checking *nplanes against the array size.
>
> Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/dr=
ivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> index d65800a3b89d..1ea02f9136f6 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> @@ -821,6 +821,8 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *=
vq,
>                 return -EINVAL;
>
>         if (*nplanes) {
> +               if (*nplanes !=3D q_data->fmt->num_planes)
> +                       return -EINVAL;
>                 for (i =3D 0; i < *nplanes; i++)
>                         if (sizes[i] < q_data->sizeimage[i])
>                                 return -EINVAL;
> --
> 2.25.1
>

Thanks for the patch, it makes sense indeed.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
