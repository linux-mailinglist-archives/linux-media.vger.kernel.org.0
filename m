Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83FCD4F63E0
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 17:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236520AbiDFPlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 11:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236477AbiDFPlB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 11:41:01 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6519F57D5CC
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 06:14:59 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id b17so2148891qvf.12
        for <linux-media@vger.kernel.org>; Wed, 06 Apr 2022 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=8N0CvfLws0NLfRseiGnNqJN6eohHipGooNObOqOlBoc=;
        b=EvQQ/HwBH9nTQj1t5326cVr1a8c+tpiFpSw2vuQcKK4x1e0TX8OBzNpnPZ096XFsrE
         0ReG2cE6XRXkl41gyZjT1S/DgUXamBCWr4HVULUDSQM2wWOOPKeRifJ5M6EXG2QzqlZc
         rW69m0WEf3gxCTxUmY2EuNEMZu9dgd4aWHjmhCZHXdDbhC8OSIdOWbLE64/7BLNiW3X2
         kBP2BEgL7y7aFgyN3ebhig0yxbvsPW0+UHATP2UhXGdpweSmVBjQq/HX9htgqGjYbsQg
         jjAWm0ttcxyAOtfp1LxwQ0cRTv8+AsL2Fx1Y2MQxfqDJ3dvKWOVv0BxVUknTX3MAsC6A
         3Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=8N0CvfLws0NLfRseiGnNqJN6eohHipGooNObOqOlBoc=;
        b=O+CUsiqyfyp7yi8g2uImCsUj0BSaIzvRViP0Do4i3Px9sEortxuNX4G1NO+nqSpjON
         NX12eUxHeqNxDtPRRGc4CqxAzgtUtOc2wVSzrcob3vLy8xEYsNvsZp/YKmr8yAM0Tyrg
         P3TVk5WYqEg96YVsA8dhIHxMni2Wj4ZIoEccjOrTifUdMS99/E6yRg2hrzlosp7flW1j
         KwNIk++PTqi91pgdGZPexxVNodLWzi8gduT5fuKyG7G61GPGFzIAH4iKf4696NfTvnDe
         EIspFX5/1iN42xZ92wPtHoOM7YtxQhR6mzGIsRx4IqWLmmV2Om39//fAkKKGn0J84ele
         DxAQ==
X-Gm-Message-State: AOAM530vB7DnemJ1lkW3NAqB6+b8dMHFSfeimoezGJq2BrLo48RGIeDp
        aQIruv64A5Ptu7ilFRe78cbeoQ==
X-Google-Smtp-Source: ABdhPJySaVPBdyzFHzfJKSHKkPd1JA+dpYpBIJIxwqBWJeTCDsXQB8+GyZydfPlDh/ZW4wIZUkA5IQ==
X-Received: by 2002:a05:6214:4011:b0:443:e253:61fc with SMTP id kd17-20020a056214401100b00443e25361fcmr6868372qvb.110.1649250896805;
        Wed, 06 Apr 2022 06:14:56 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id t67-20020ae9df46000000b006809a144ac1sm10369209qkf.99.2022.04.06.06.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 06:14:56 -0700 (PDT)
Message-ID: <5c200bbb0e2d73642115649f05f945840b0ef67a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix v4l2 compliance decoder
 cmd test fail
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
Cc:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Date:   Wed, 06 Apr 2022 09:14:54 -0400
In-Reply-To: <20220406012048.5970-1-yunfei.dong@mediatek.com>
References: <20220406012048.5970-1-yunfei.dong@mediatek.com>
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

Le mercredi 06 avril 2022 =C3=A0 09:20 +0800, Yunfei Dong a =C3=A9crit=C2=
=A0:
> Will return -EINVAL using standard framework api when test stateless
> decoder with cmd VIDIOC_(TRY)DECODER_CMD.
>=20
> Using another return value to adjust v4l2 compliance test for user
> driver(GStreamer/Chrome) won't use decoder cmd.
>=20
> Fixes: 8cdc3794b2e3 ("media: mtk-vcodec: vdec: support stateless API")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> changes compared with v2:
> - add reviewed-by tag
> changes compared with v1:
> - add Fixes: tag
> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/dr=
ivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 3859e4c651c6..69b0e797d342 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -51,8 +51,7 @@ static int vidioc_try_decoder_cmd(struct file *file, vo=
id *priv,
> =20
>  	/* Use M2M stateless helper if relevant */
>  	if (ctx->dev->vdec_pdata->uses_stateless_api)
> -		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
> -								cmd);
> +		return -ENOTTY;
>  	else
>  		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
>  }

