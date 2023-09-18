Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBAA37A43A5
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 09:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238548AbjIRHzi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 03:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240627AbjIRHz0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 03:55:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76EA730F3
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 00:52:50 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FD9C433C9
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 07:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695023570;
        bh=WUA+XbMVRXnHet1jKJpf2kzUWmUFqaJ8ZuIVkMyWDgA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DidQBile5KpIv1rlv5ogalHnwKClG7J2JZGU3djI1A4O4K0H/lHW0pv4tt3mUkT9k
         90RIvudpqByXu/fRxtCXcMUH+9p8gcBuuSGYNk1G1GMptkW8ECln+uu3sHnr4iMwdq
         fq/IrouxzIJzgkSPDm6Z4Wg8+RiVfN6Ve9n+RejChzvR04EQxxh0BwVgCUsajqMkut
         m2dazcCNUR2kveHwoJu8rGA9W1hHe7jMZKPmQyjAKFw6OLpLUw1As5cl+VD+Rn3sVa
         BKnnhc7jXDiWimBSgtOGhSLZw8Xg7v85yTysZtzGUuw0jgnHD9DfX1XGwDB8ezbjE+
         oIVxCtuM13rJg==
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-49040dc5cedso1361040e0c.3
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 00:52:50 -0700 (PDT)
X-Gm-Message-State: AOJu0YzisfzaYCWTqgnTXCLhL595ufpt164ZTQXlj4FFLqmsFT677X7h
        pUpw9vkZDE2RxwqxY2dROK0aNakwG4AQPIUTIaI=
X-Google-Smtp-Source: AGHT+IEulIpXRX8Z+D1pi9vgHjHysjRThqO5ApL+5FCtM+mmP80g0uWxKbYC4aKLVY9h9IHRRFUwaO44RY++LOmj6Jo=
X-Received: by 2002:a1f:6241:0:b0:495:bf04:89f9 with SMTP id
 w62-20020a1f6241000000b00495bf0489f9mr3449658vkb.10.1695023569115; Mon, 18
 Sep 2023 00:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com> <20230914181704.4811-6-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230914181704.4811-6-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Mon, 18 Sep 2023 09:52:32 +0200
X-Gmail-Original-Message-ID: <CAPybu_3=V9dGFA+pw-0dm_y650_jDsKc-MvvrX3J=BUZgEK1HQ@mail.gmail.com>
Message-ID: <CAPybu_3=V9dGFA+pw-0dm_y650_jDsKc-MvvrX3J=BUZgEK1HQ@mail.gmail.com>
Subject: Re: [PATCH 05/57] media: i2c: imx214: Drop check for reentrant .s_stream()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Sep 14, 2023 at 8:17=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The subdev .s_stream() operation shall not be called to start streaming
> on an already started subdev, or stop streaming on a stopped subdev.
> Remove the check that guards against that condition.
>

In general I agree with the patch, but I think it would be safer to
land it in two stages.

first:

       if WARN_ON(imx214->streaming =3D=3D enable)
               return 0;

and in the next version replace it completely.

otherwise

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/imx214.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 2f9c8582f940..e2805173f4b1 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -775,9 +775,6 @@ static int imx214_s_stream(struct v4l2_subdev *subdev=
, int enable)
>         struct imx214 *imx214 =3D to_imx214(subdev);
>         int ret;
>
> -       if (imx214->streaming =3D=3D enable)
> -               return 0;
> -
>         if (enable) {
>                 ret =3D pm_runtime_resume_and_get(imx214->dev);
>                 if (ret < 0)
> --
> Regards,
>
> Laurent Pinchart
>
