Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 780836828D3
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 10:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbjAaJ21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 04:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbjAaJ2Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 04:28:25 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D875CDC7
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 01:28:21 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d14so13560985wrr.9
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 01:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Y7RXD6voZXZlqj2GUlN6f/gj+QHAqThUQqF5BED1Y=;
        b=XBlBZHRPmpCL/4fNWzBx75CPzM4Yra+0jCi7ZEpRL1SAohjv6sMtEe+HoikRHSFlME
         DUx1tw12ABC5hT5gQehjHRLpdtKIzs2GCp20vho/jCeeb37/bkgC35Dxt7VfjB/SCWb2
         +xb9i461imQMrnveTfwJvQ8ClW/i19lGAX22c4Lp/XphedgChuhSeqz1V7K2VVrfDq2N
         gZMkhf1Wwr072lcMnc6uuI+AM0KuwypTPA0qt+xSqivhSQEXEXEB9UluMJ+rY2TqkpJt
         asd83blCwDlRHENJ+qXgGrBdtbiorVvZD7QfA/pu5vB7IcAjobOYaNYcbUIlDx7TIUUV
         iYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Y7RXD6voZXZlqj2GUlN6f/gj+QHAqThUQqF5BED1Y=;
        b=YEc+BO3eW7EWKutIa+4abWHhY7q6ezQZu3ds+MmCufa25rDBb6qs+Bk4JLvm53nz5r
         sZLK2AArR05aQ3XftZEUxABFkgEjFUTLGaz8uQJ9StjvOz3uXw+Oh20tIizo5F6pwJnu
         AcFhbHaKVnCD28v9Z3edGraZZxM8qnaJKpaxZQkoPM9vTcGrO0q8SyAzX0MbwYzVhUeI
         4QT1U3Xk1AkH8L8CR56QzJMu0z05PY82LeEL4H+Zh4Bn5In5yx/iBLqqNX/oLCfY+mLo
         ofoLEA+nUORrQLLFM8j1gM5EmyW7W2xzhtLnpZOD/Ve3NnzZUzHSblmU+m08fuKoJLsD
         G+Lw==
X-Gm-Message-State: AFqh2kpvJ7lBmjQZ6n39nt4T1cU/eO1URME9qwnuIvLZpO1TVt/jqBjx
        57Qt2KzYL30pub+pxrYv43U=
X-Google-Smtp-Source: AMrXdXv12XVHxHhhGYCtcIShcZmDeGCPOivhRB/aO80Okdeq67J+d9jyx2g9v6R9D4TsRNPDyUoalg==
X-Received: by 2002:a5d:6f1c:0:b0:2be:103a:c825 with SMTP id ay28-20020a5d6f1c000000b002be103ac825mr51264434wrb.18.1675157300046;
        Tue, 31 Jan 2023 01:28:20 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d53d1000000b0024cb961b6aesm13898374wrw.104.2023.01.31.01.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 01:28:19 -0800 (PST)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH v1 0/5] media: imx-mipi-csis: Move to subdev active state
In-Reply-To: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
References: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
Date:   Tue, 31 Jan 2023 09:28:18 +0000
Message-ID: <m3pmavcatp.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Laurent,
Thanks for all the cleanups and updates.

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> Hello,
>
> This small series moves the imx-mipi-csis driver to use the subdev
> active state. Patches 1/5 to 3/5 are small preparatory cleanups, with
> the main change in 4/5. Patch 5/5 is further cleanup that could have
> been included in 4/5, but that should be easier to review as a separate
> patch.
>
> The series has been tested on the i.MX8MP with the ISI, and IMX296 and
> IMX327 camera sensors.
>
> Laurent Pinchart (5):
>   media: imx-mipi-csis: Rename error labels with 'err_' prefix
>   media: imx-mipi-csis: Don't take lock in runtime PM handlers
>   media: imx-mipi-csis: Pass format explicitly to internal functions
>   media: imx-mipi-csis: Use V4L2 subdev active state
>   media: imx-mipi-csis: Implement .init_cfg() using .set_fmt()

LGTM, for the all series.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
    Rui

>
>  drivers/media/platform/nxp/imx-mipi-csis.c | 249 +++++++++------------
>  1 file changed, 103 insertions(+), 146 deletions(-)
>
> -- 
> Regards,
>
> Laurent Pinchart
