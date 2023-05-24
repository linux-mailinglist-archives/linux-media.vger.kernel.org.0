Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E628E70FA9B
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 17:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237399AbjEXPlr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 11:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236857AbjEXPld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 11:41:33 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D682199F
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 08:40:40 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f60410106cso9027105e9.1
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 08:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684942772; x=1687534772;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCt27JdlGxjhVB77hVhQnd8TPlzY6SW2uD1NMwVC+VY=;
        b=f3icOfY5ILxgd7wBBIcvqKZHqlf+fKbLzhOPwfIM22f46XLLz/HJI45YM/TvJxtsaY
         ii8FYvqss0LHEXCtdTZLqLiyK4NZbNy+LpOOYHxlptPZDNt0sltRFOnf2tosCQ9AXMKX
         Snou9PpvBbYQr1iQcPnRqgTkAR/JMMlj8lzYpgzZKwL/PeIIggNTHjgeo0sN+AmF1WaA
         IHDahHj+bVomz0Ad8ht1gQOaQz3mYnQ4/3w9g6ncXufv2bic1zLN4NDKQ7Od1zt3J/S5
         Pe8mF+UyE8Edohp0JQ6chBvElp5uyIxBoIFm8JIwfQuGzsCIYs3siQ99OGnzCfO8cuLC
         ZKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684942772; x=1687534772;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCt27JdlGxjhVB77hVhQnd8TPlzY6SW2uD1NMwVC+VY=;
        b=COr/Ymly+X1NCU3LOEc5Mi3lc0wqs5kcOuWVrtnycA/oLfz8D8HjoHKE1Po7swdBRA
         mkplBr4nF7eYO8UQmcg7NL+lpq0FQ4CGkQ6wub+g9jX5uZ0KuJhldK9tyKYb4juKFyb0
         nFvOlhK2xjd0X6ZxtoXAeWCxyprap9jZHIDKQKinWnPTPFGKRjbaNjwIw+9NoTliz4ml
         dpieVTyWGWmSiPIe60ZfIk79YXYUcuTuUnyDpHSS1Z+2Wj0r4zotM9gQoKMiVRRz1sYE
         FE4jdVIsQibQmsWyiUICjj9oPPcgezfx9k2dC+O9h4svmbMwAnjd0L2LDBQ69G+i5lfj
         OKgg==
X-Gm-Message-State: AC+VfDwDtBWWwqxgfEspgJ0H5VCz5dV+6J2NP8eFTyjiMHg7wkVf8g4g
        p+N4RQj4+SR4ZwOcH7VGEhw=
X-Google-Smtp-Source: ACHHUZ7e0vAte6tnVkj5DmLsnjBv7hIN7w+WD4JRFDNaNegfsHD3TphImhSKVJqbo4dHGRiO8Y8a3g==
X-Received: by 2002:a5d:58d5:0:b0:309:3698:7feb with SMTP id o21-20020a5d58d5000000b0030936987febmr128922wrf.46.1684942771698;
        Wed, 24 May 2023 08:39:31 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id q12-20020a5d574c000000b00307925ff35bsm14902895wrw.49.2023.05.24.08.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 08:39:31 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] Fix imx7-media-csi format settings
In-Reply-To: <2686251.mvXUDI8C0e@steina-w>
References: <20230419070712.1422335-1-alexander.stein@ew.tq-group.com>
 <2686251.mvXUDI8C0e@steina-w>
Date:   Wed, 24 May 2023 16:39:30 +0100
Message-ID: <m3o7m9kabx.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Alexander Stein <alexander.stein@ew.tq-group.com> writes:

> Hello,
>
> Am Mittwoch, 19. April 2023, 09:07:08 CEST schrieb Alexander Stein:
>> Hi,
>>=20
>> v4 also incorporates feedback and improves commit messages a lot.
>> Patch 3 is simplified now with hardware alignment constraintd being figu=
red
>> out.
>
> Ping, any more reviews?

The all series LGTM, FWIW:
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

I think Laurent can pull request this on his tree.

Cheers,
  Rui
>
> Thanks
> Alexander
>
>> Thanks,
>> Alexander
>>=20
>> Alexander Stein (3):
>>   media: imx: imx7-media-csi: Get rid of superfluous call to
>>     imx7_csi_mbus_fmt_to_pix_fmt
>>   media: imx: imx7-media-csi: Remove incorrect interlacing support
>>   media: imx: imx7-media-csi: Relax width constraints for non-8bpp
>>     formats
>>=20
>> Laurent Pinchart (1):
>>   media: imx: imx7-media-csi: Init default format with
>>     __imx7_csi_video_try_fmt()
>>=20
>>  drivers/media/platform/nxp/imx7-media-csi.c | 94 ++++++---------------
>>  1 file changed, 24 insertions(+), 70 deletions(-)
>
>
> --=20
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
