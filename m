Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46DEC595E72
	for <lists+linux-media@lfdr.de>; Tue, 16 Aug 2022 16:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233879AbiHPOjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 10:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbiHPOjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 10:39:14 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34250B81D0
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 07:39:13 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id b9so2676129qka.2
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=7VGZA0Vew62u25faumdytcpJGC3drao9At9ODOgTXdk=;
        b=XOTYR5LjvYCMH4w7b4u24Zl5Axh3XDcphJPmhE9oxuD05DEvt4Uon1cPnGz1wQIV9x
         tgUNsPNfA2igV7qASBowLPqpSkO1lbC/7wN5qCxlpfZr5DOI8DrMiPeIfzKGNyqbt4ft
         1uff6Hi7bq8aYlBSyIMyMrnyyUtQoOivr3EsXhJglsnvLZPyPV5ovLS3ApTe/KWEqJ60
         tHyepam2ajpeiist7zFRR+moUnRO06Q9IGoPzjXHy5rvM0VaZ9tGJiDrrYbFisRkyCQ6
         3L8t/EHYBkaMdyyZ9CrJiJ2n7pSLgWLefpuyZDmHBCjHwaUpxaMpifMYw8KM76cTjzEF
         cS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=7VGZA0Vew62u25faumdytcpJGC3drao9At9ODOgTXdk=;
        b=efv84B0VQSIcxEjhjpoCml2RwsBIad0b6flnAypFAUfZYyMcuK8qYhGP/kTSw00jnh
         px1LYVcUl5dya3bOmVrkkTnYObuN1mWMhcJPwvAJi3pkV3D/7EbYBmreGakSDBazROOf
         iMLgLqZGkROjUCT+cxnCEXT+8v70RtqQx38J4c9oCqYIBf8Q5Qmg2Lp/EfSnoV36VdE7
         /lzT9ej8wQ45CUZ4hHTktGbm6IUJuWBOjbcwH90oeHr7CS2bJbVhCFAFR2MJRQCLpJbh
         8fqHWypeV9A8klDlkWDKxjcxQXYZGTWgeQc0UGrL3+5gok4zlQ/vwOA0Y2L+xRF5yGjB
         o9YA==
X-Gm-Message-State: ACgBeo2UfxGC4LRyiLVJl+b0omoHQ0IPR+REB5Uul7wlFSEwYJtspilM
        zV+h+j/Qu52ZR1ra6WLQ5gxVKAZj+bWsQg==
X-Google-Smtp-Source: AA6agR5OjFQINuH5ZxfGwp9PFXJG80CYZBXSk0+g4ea+0hGLsIf90x4mwc4G4tep90zkaSSD8bgvGg==
X-Received: by 2002:a05:620a:2627:b0:6b8:c8c3:78f9 with SMTP id z39-20020a05620a262700b006b8c8c378f9mr14998083qko.641.1660660752335;
        Tue, 16 Aug 2022 07:39:12 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id m6-20020a05620a24c600b006b60d5a7205sm12655729qkn.51.2022.08.16.07.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 07:39:11 -0700 (PDT)
Message-ID: <b729f0f418838390e14781c5f58649659b0c7199.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-ctrls: Fix typo in VP8 comment
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, daniel.almeida@collabora.com
Date:   Tue, 16 Aug 2022 10:39:10 -0400
In-Reply-To: <20220811203756.124673-1-deborah.brouwer@collabora.com>
References: <20220811203756.124673-1-deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 11 ao=C3=BBt 2022 =C3=A0 13:37 -0700, Deborah Brouwer a =C3=A9crit=
=C2=A0:
> The comment for the VP8 loop filter flags uses the partially wrong name
> for the flags. Unlike the other VP8 flag names, the loop filter flag name=
s
> don't have "_FLAG" in them. Change the comment so that it matches the
> actual flag definitions in the header.

oops, perhaps it should have had that, but can't change it anymore.

Nice catch!

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Fixes: 363240ce1c08 ("media: uapi: move VP8 stateless controls out of stagi=
ng")


>=20
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  include/uapi/linux/v4l2-controls.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 5f46bf4a570c..a1363c59902d 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/
>=20
> include/uapi/linux/v4l2-controls.h
> @@ -1730,7 +1730,7 @@ struct v4l2_vp8_segment {
>   * @sharpness_level: matches sharpness_level syntax element.
>   * @level: matches loop_filter_level syntax element.
>   * @padding: padding field. Should be zeroed by applications.
> - * @flags: see V4L2_VP8_LF_FLAG_{}.
> + * @flags: see V4L2_VP8_LF_{}.
>   *
>   * This structure contains loop filter related parameters.
>   * See the 'mb_lf_adjustments()' part of the frame header syntax,

