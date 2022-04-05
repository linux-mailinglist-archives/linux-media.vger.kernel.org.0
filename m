Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58B34F4B08
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1573823AbiDEWxZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 18:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444549AbiDEPlj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 11:41:39 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30ED2F94D1
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 07:05:50 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id j21so11196930qta.0
        for <linux-media@vger.kernel.org>; Tue, 05 Apr 2022 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=+cpcJenwRzUg0nDdeKywta6BLntPgSYmI6GpCNc7oP8=;
        b=f6GA7JbX0+R11t6JxzSrUPO13d8raNSU9UOwbsVJG09ReVL7TriLkd2bsJq3YHw2m3
         OtQeeqgs4CSvVgOc+6H8EvxAkBHKPsF3oVbak7toTFYz0PZZa0cyRbZflwzJ93tRefKt
         LSKp8vAswC7pmHSZu674RgB/g2IYy8XXXysEXmkUzVratqGJXyHumnNwIY+V8P7xTLkc
         8ax8Ar9I3eQBGPVI4xtgK57tFWmJ7YZ654TnoMxPfPeBsAgqiTQpIPIT/VCEGKH8+Fcg
         DlOfT8cevMihP8+RSLKn2D3PeoVNTl+XimQlAwwtXURGr9Mx1O235Jd7LqQIhBpXE13X
         oqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=+cpcJenwRzUg0nDdeKywta6BLntPgSYmI6GpCNc7oP8=;
        b=UPJjFn228dutI1grhZEd1k73AjQCs0cW+ZPeQNgNn7MEUkpUvzEH+i+dc7eErm96/K
         N+KDKVjM8e+prfDIHdIlfEzyMh6tAcYU4ip//QduNtrG7M5olSLSxe/UinQgA2336gdc
         2IHCI7ks5WqZXiFUuWG1zmRSb38Kn0nDhRKcWD8cf9cvXanmrucJP1Do1CqcOIPVJ6TP
         zY12jm2iIv1+AIppKBLV8HxFryO3yFQxYQ3DUnfion3XauDuQAJYB+LNqEictXcJJv6N
         l0vZPLAnA18CUDP4VucfWVu9rc157flsFjP8W5W1uMhO8eVhHAXCcip6eaMuQEpJkCVR
         3nqw==
X-Gm-Message-State: AOAM532eTZLaXEi8M/P7vqqV+KkIjPPp5kb78CsG4exfyaUoqvWx67KQ
        jkRqNWFEgAh43WNT5kCvItHXig==
X-Google-Smtp-Source: ABdhPJzyujbP/oy1fiY0w3L4j8s+GjdCRlLzsYslDERm3/ps9npp2rRxHNTrbzSnGnS44UGRuoRx6w==
X-Received: by 2002:a05:622a:348:b0:2e1:d42f:d3be with SMTP id r8-20020a05622a034800b002e1d42fd3bemr3105184qtw.26.1649167549321;
        Tue, 05 Apr 2022 07:05:49 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id v3-20020a05622a014300b002e1dcd4cfa9sm11114181qtw.64.2022.04.05.07.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 07:05:48 -0700 (PDT)
Message-ID: <f87c9c6c58e06cb63f2cbce1913aab81ca60d7a4.camel@ndufresne.ca>
Subject: Re: [PATCH 1/7] media: coda: set output buffer bytesused to appease
 v4l2-compliance
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Tue, 05 Apr 2022 10:05:47 -0400
In-Reply-To: <20220404163533.707508-1-p.zabel@pengutronix.de>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
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
> The V4L2 specification states:
>=20
>  "If the application sets this to 0 for an output stream, then bytesused
>   will be set to the size of the buffer (see the length field of this
>   struct) by the driver."
>=20
> Since we set allow_zero_bytesused, we have to handle this ourselves.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/chips-media/coda-bit.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/platform/chips-media/coda-bit.c b/drivers/medi=
a/platform/chips-media/coda-bit.c
> index c484c008ab02..705a179ea8f0 100644
> --- a/drivers/media/platform/chips-media/coda-bit.c
> +++ b/drivers/media/platform/chips-media/coda-bit.c
> @@ -381,6 +381,9 @@ void coda_fill_bitstream(struct coda_ctx *ctx, struct=
 list_head *buffer_list)
>  		/* Dump empty buffers */
>  		if (!vb2_get_plane_payload(&src_buf->vb2_buf, 0)) {
>  			src_buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +			vb2_set_plane_payload(&src_buf->vb2_buf, 0,
> +					      vb2_plane_size(&src_buf->vb2_buf,
> +							     0));
>  			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
>  			continue;
>  		}

