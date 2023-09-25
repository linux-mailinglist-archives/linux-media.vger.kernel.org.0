Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B198E7AD23C
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 09:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232538AbjIYHqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 03:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbjIYHqW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 03:46:22 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCAC11B
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 00:45:48 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-7ab9ad973e6so950159241.1
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695627947; x=1696232747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mPPOD2/eXSwHT+TaXg7FJ8AbpONpDvarYE+1SHxNYM=;
        b=jM7PDkhitmr9M2ZE/HPlpywXlMBep2PCuDebSZXoaU0bZAVMOKC4JBTe5wHARdEDI8
         gTuMGf7zZEYVgJGPVKP1joIllOL/g1sxxFqZ6C005UNs0qGZCP1DOObn1/Bm61ln/VCK
         wjU/1mpdlhs7Zy50Qcd2qvtgidTQzpZA0cOah1dF1v1K91VRoXcNIiK8PDB+UiWNiafk
         RKAI2f9hzWqFvBj9I4MNH5IR+ihE4vCLm8mNdXtopbF9JENrOiXHcJ/oR7mn3mUtblct
         6yN7tvTKARMNHxxFdS6q4sxazBzn5B1Gsj1y4P1BPYjk3C/K1nnAHSTOk/+9Z8QtyDkL
         G1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695627947; x=1696232747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mPPOD2/eXSwHT+TaXg7FJ8AbpONpDvarYE+1SHxNYM=;
        b=w0hlrja9vEFQAJ9lTNcyveq7P4GlihupaFR7qh9ZQlzZ3cDtuS7vqpO3gEi487EVji
         grWzr68xapnliFDoyyl9She2HbiXR5Cfw3KQOZT5TJt6SkbpwBijJDqsMvMfv+NmQ2zx
         UcMDpqxNGeQNFmfHiN0B69uNYxI4AClleuo8j/OndcoBwZCSKY7kMs3/SErc3yMxgxlQ
         93naEmZmuIKQMFSi62/PAkaS5M+9qjCYwKHcDvcGM5/j33yW4apPn7QTQ3i5XHV9x2pz
         6U8joaS+Do0P/tpxGxQZyYPWzJIU0qOQzaNxbItM2pGcN3+MctZT9pD5R2lrR+/7q0po
         6YtQ==
X-Gm-Message-State: AOJu0YzKve4ZSL6Oe1C3hyECRvChQhKMXfJp7FuM0gD3ZXCLhszcxIap
        FbJgY+xBjeGLl3VGtUn4l68f+W2+0OxxKYCZJVc=
X-Google-Smtp-Source: AGHT+IG6BtByBxaleZxhMgqiDLHEdOVboilxLJgye6qh6nIBUG8cd8H/xYZxJTGn5u7whgFHUnmSh7H3Bb7KET0VhHY=
X-Received: by 2002:a05:6122:2228:b0:49a:3538:1908 with SMTP id
 bb40-20020a056122222800b0049a35381908mr1531966vkb.1.1695627947438; Mon, 25
 Sep 2023 00:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl> <20230923152107.283289-19-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230923152107.283289-19-hverkuil-cisco@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 25 Sep 2023 08:45:21 +0100
Message-ID: <CA+V-a8tmFYs=Pw52y2Xo_WeGh_nE0v-MNNx07sJiq17ebeArZA@mail.gmail.com>
Subject: Re: [PATCHv2 18/23] media: am437x: don't fill in bus_info
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 23, 2023 at 4:21=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> Let the V4L2 core fill this in.
>
> This fixes this warning:
>
> drivers/media/platform/ti/am437x/am437x-vpfe.c: In function 'vpfe_queryca=
p':
> drivers/media/platform/ti/am437x/am437x-vpfe.c:1279:35: warning: '%s' dir=
ective output may be truncated writing up to 35 bytes into a region of size=
 23 [-Wformat-truncation=3D]
>  1279 |                         "platform:%s", vpfe->v4l2_dev.name);
>       |                                   ^~
> drivers/media/platform/ti/am437x/am437x-vpfe.c:1278:9: note: 'snprintf' o=
utput between 10 and 45 bytes into a destination of size 32
>  1278 |         snprintf(cap->bus_info, sizeof(cap->bus_info),
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1279 |                         "platform:%s", vpfe->v4l2_dev.name);
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c | 4 ----
>  1 file changed, 4 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/med=
ia/platform/ti/am437x/am437x-vpfe.c
> index 63092013d476..5fa2ea9025d9 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -1271,12 +1271,8 @@ static inline void vpfe_attach_irq(struct vpfe_dev=
ice *vpfe)
>  static int vpfe_querycap(struct file *file, void  *priv,
>                          struct v4l2_capability *cap)
>  {
> -       struct vpfe_device *vpfe =3D video_drvdata(file);
> -
>         strscpy(cap->driver, VPFE_MODULE_NAME, sizeof(cap->driver));
>         strscpy(cap->card, "TI AM437x VPFE", sizeof(cap->card));
> -       snprintf(cap->bus_info, sizeof(cap->bus_info),
> -                       "platform:%s", vpfe->v4l2_dev.name);
>         return 0;
>  }
>
> --
> 2.40.1
>
