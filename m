Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCBA3D8A7A
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 11:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhG1JTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 05:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbhG1JTl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 05:19:41 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC98C061757
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 02:19:39 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id o5-20020a1c4d050000b02901fc3a62af78so3774314wmh.3
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 02:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=buJqm/dCB73ItqK6pgbJFqFbtKIP0sK2wyz9Qt55G2U=;
        b=CYowGiXH++aRbh5n2sJqiOK9ORUNz+figoQedVHYRrA0gxktIndlJSibKJKU1XPoo4
         MoGqlN1bsh0K21dil81zewscjqxvcumUsN0hJJvyvOxORSNi8XTQn/aJt0iM1SSIInim
         Edmqj8RoSehm2fWO204226OGZz5cEfW2Lf22L7WajJrsfT1T4H/spJ/5Ll12RfMF1oCr
         qAkNZmwF55MCFkkK+rqutnaaj+9GEChxhQRcus/bYr2HIeyjN77fz99mEfFtHFfAKxRh
         LfqWIUxMnNC5KICnHDpi2tIwg4Z6xx+GRENX7nHkii8m0Tngl6UtfiLLwe+Pm378AWUg
         xO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=buJqm/dCB73ItqK6pgbJFqFbtKIP0sK2wyz9Qt55G2U=;
        b=WCu557DrZ0xRs5V3MEKHIi3bFgJt0Z8wJg8MUUSqNIOGSdtxUkkCnvotcA9GfYEPQd
         c4sdX4aaqw9KY4YigV128VdYH6xA8pr1TUu5LRbf8HadmJG/d0g7XndYdxS6hEmL844v
         xfHoPlofpFcYqztU68tZuvjoyt+m9VklQw0woX8oAXgipC460vvcd6QsdqGymQ+1PvPv
         +2sb9hTuAiKhMghEiG3k+UAJLNdFBy7VsD5uaXHFIdz/UbKIzKdmhOBqWc75Z9SW6KUv
         vkbkZDNfBzh6FKJCmuUxUsWgrzTWsXTOKSn7nI8l78Od0s2xwr/Sx7GDMfnk+GG8Szkn
         1vPQ==
X-Gm-Message-State: AOAM530FEhChNo9Z1vq+/9sf/fGQjDVfmnpMf//t3bwCUoeo7H54/lUY
        jwja3xs2mdjMtbhQnKKw8VU=
X-Google-Smtp-Source: ABdhPJzOowzK6QiWrDHb70+RW4c53qcwb91lQqBN56Sb66ca4yo67Hppt64IOnt63iygh3m1xLl/qA==
X-Received: by 2002:a05:600c:204a:: with SMTP id p10mr26308981wmg.136.1627463978304;
        Wed, 28 Jul 2021 02:19:38 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id y24sm5179881wmo.12.2021.07.28.02.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 02:19:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 28 Jul 2021 10:19:36 +0100
Message-Id: <CD4NTXN3E6YR.2T29V4FEH13PB@arch-thunder>
Cc:     "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Marek Vasut" <marek.vasut@gmail.com>, <kernel@pengutronix.de>,
        <linux-imx@nxp.com>
Subject: Re: [PATCH] media: imx: imx7-media-csi: Fix buffer return upon
 stream start failure
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Martin Kepplinger" <martin.kepplinger@puri.sm>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
References: <20210519005834.8690-1-laurent.pinchart@ideasonboard.com>
 <09087c452885b0da779258b4962a349dbde1aec7.camel@puri.sm>
In-Reply-To: <09087c452885b0da779258b4962a349dbde1aec7.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,
On Wed Jul 28, 2021 at 9:50 AM WEST, Martin Kepplinger wrote:

> Am Mittwoch, dem 19.05.2021 um 03:58 +0300 schrieb Laurent Pinchart:
> > When the stream fails to start, the first two buffers in the queue
> > have
> > been moved to the active_vb2_buf array and are returned to vb2 by
> > imx7_csi_dma_unsetup_vb2_buf(). The function is called with the
> > buffer
> > state set to VB2_BUF_STATE_ERROR unconditionally, which is correct
> > when
> > stopping the stream, but not when the start operation fails. In that
> > case, the state should be set to VB2_BUF_STATE_QUEUED. Fix it.
> >=20
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > =C2=A0drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++------

<snip>

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0imx7_csi_deinit(csi, VB2_BUF_STATE_ERROR);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0csi->is_streaming =3D !=
!enable;
>
>
> This patch has not yet been accepted. Any specific reason? I need it.

Good question, I gave my reviewed in May [0], maybe got lost in the
merge process somewhere. Mauro?

[0]: https://lore.kernel.org/linux-media/CBHA8BLTAJM1.1DIYC729ZMAYY@arch-th=
under/

------
Cheers,
     Rui

>
> Tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>
>
> thank you very much



