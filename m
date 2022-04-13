Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E51F4FFDB7
	for <lists+linux-media@lfdr.de>; Wed, 13 Apr 2022 20:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236509AbiDMS22 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Apr 2022 14:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233405AbiDMS21 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Apr 2022 14:28:27 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B5438BD2
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 11:26:05 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id z15so1958870qtj.13
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 11:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=biwzMecONP16OJhQH/FKNOs+wHfPK7aPZRPUNGPrEJU=;
        b=diwup2s1nEc9QdCOyhezJHV481K+c1mxaEwqI79kSgnAUQS+Natwz5NeIvppSXq8Q+
         TpT9xw7Dy7hJw+AQY5JOTZ4TwbH/EzDKvhFPOtRvsUll8cdGP1n5LUFT9qacfCpm+TeP
         ZJ2rM3PaxqeR3i+ZNKpITEGWjIR/1D8BmOB9cXLr2NLEM9T+LhasNjx8CIFBkPVv/rif
         5VVtmVigRaBpg5SyUpFfgsnlLdJ+VBzokTC4vU0H51quRSjArD36MsW8/HQKAUoKCELn
         BlVirzBTPdac3wzV95lZfxsahcZaD4TBskhKlrQOJgoeVU5fyOAUwpMtDaI46lFYl02/
         HOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=biwzMecONP16OJhQH/FKNOs+wHfPK7aPZRPUNGPrEJU=;
        b=neCz1sfatY46jpWQOMTEFRo9d+E1aY36GnDl+5bgqkdbs4s0T40dMpV2qzH+hlCuKq
         VustRVwyC4PqM7MxQYjiBPKuD8HPRUfCBbsJo8pHpVWOVfkelKNwsdCeyvmkbcxa/Y9Z
         gsmcaYivLannNZtzvn0jg8OFIvSigX7jFQ3DE7GMXcFdZdv6AQa46qvg8IkrugWN1fxz
         Agr8iAzXzkJSCCsr/SgJGZcSd27+PVyO1AwnettItNJOGPXIpNinOHJDooFsAiz0afSq
         XkuAuHZ/Acq9+9qvXxMr8GUGCEJZ1X7giEZ+vsmLNaCF7fX+mTnd5UqyFB8H2Xzz7t/R
         N7Gg==
X-Gm-Message-State: AOAM530EYiZo57nK5Z+fPlUgvcs7mLG9fiiODuXpNl1kEb1fWyzT0ubv
        GLfT3q1Pc+L0FfPfK1Cah2vuLA==
X-Google-Smtp-Source: ABdhPJwJIylY/WIV9aIFAbhMxv2XyDSV7kK088FKGKPQh1xIhcgg95ObNESZZBUc0O0U2zlI3rVb/Q==
X-Received: by 2002:a05:622a:1c12:b0:2ef:5061:b78e with SMTP id bq18-20020a05622a1c1200b002ef5061b78emr8368097qtb.361.1649874364491;
        Wed, 13 Apr 2022 11:26:04 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id a7-20020a05622a064700b002e238d6db02sm30335314qtb.54.2022.04.13.11.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 11:26:03 -0700 (PDT)
Message-ID: <d0b796aee7c4f31643e73efe7c50fedd61c7bfef.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: amphion: fix decoder's interlaced field
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Date:   Wed, 13 Apr 2022 14:26:02 -0400
In-Reply-To: <20220412110155.21427-1-ming.qian@nxp.com>
References: <20220412110155.21427-1-ming.qian@nxp.com>
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

Le mardi 12 avril 2022 =C3=A0 19:01 +0800, Ming Qian a =C3=A9crit=C2=A0:
> For interlaced frame, the amphion vpu will store the
> two fields sequential into one buffer, top-bottom order
> so the field should be set to V4L2_FIELD_SEQ_TB.
> fix the previous bug that set it to V4L2_FIELD_SEQ_BT wrongly.
>=20
> Signed-off-by: Ming Qian <ming.qian@nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/amphion/vdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index 09628dd0c855..0a1976852b0d 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -804,7 +804,7 @@ static void vdec_init_fmt(struct vpu_inst *inst)
>  	if (vdec->codec_info.progressive)
>  		inst->cap_format.field =3D V4L2_FIELD_NONE;
>  	else
> -		inst->cap_format.field =3D V4L2_FIELD_SEQ_BT;
> +		inst->cap_format.field =3D V4L2_FIELD_SEQ_TB;
>  	if (vdec->codec_info.color_primaries =3D=3D V4L2_COLORSPACE_DEFAULT)
>  		vdec->codec_info.color_primaries =3D V4L2_COLORSPACE_REC709;
>  	if (vdec->codec_info.transfer_chars =3D=3D V4L2_XFER_FUNC_DEFAULT)

