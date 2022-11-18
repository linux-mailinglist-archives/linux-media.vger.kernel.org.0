Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3AC962F125
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 10:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241477AbiKRJ1t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 04:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiKRJ1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 04:27:48 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC15FCC4;
        Fri, 18 Nov 2022 01:27:47 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id gv23so11625008ejb.3;
        Fri, 18 Nov 2022 01:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LTV53IjLyTX2vAYvhYKIedftAswCCwSYXuzFP2rpIUI=;
        b=U5nkdhkssFKgO2+KPFBYapfmiiCyAZG4HigPiK6IhbIpajA3a6gdNzNiBX6DF8ipQX
         LTS53kvCO8yhoJqfYgA+WBXpfrGnuR2C4nx03HGZV/qBD0R3L2EOtNDqIp01Wsg7MLJ0
         C7pppXLsTM2LBYtnJitETl0y6WzSZF6XnF26U2vzrVdm2BsGsJqSm9jVxOpwrGzJ9OND
         p2SWrDlTLkFumPFWphxsbLdYqDKr5FpQEuxqHJzKPiLEHQZcPN45TxpxkoTAYdbVXA5K
         VEDFmM6qtPlq7HkFJJd6ZSfnjQ670sZTSDVEESDkwlYjzOzIwBiZwY5dmfLhbeGrwS4x
         ALyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTV53IjLyTX2vAYvhYKIedftAswCCwSYXuzFP2rpIUI=;
        b=FITFfmAQUELHj1riTbPPzo+wV186tuA+Er29Cx8+2QGbE6CMhf+HFeMYb6ELx9e4Fo
         xPQeiJ1qTmUWoknnM0os7tzvRHCm/3uAx1VGPGxQqOv3h9MrNKVI+4PunhPiDHzFxYjV
         /5SoRS8QSN9VyQM/lr6ROtcbaiJnpMCqHgUYRreynS+dL5W6VhZUH8sZU9nk3AcRUSRm
         NQ4a5RRe5B4quD6QNf8rc6tCCfM0dQgdZiw9SrDLqVyYNyJokoInBaWCirNQolSfBWf9
         5LMs8w2R+3Iz1/5Rde9SoPbDT8YrdSBWhPBgJYDrBI4voR8zVJhnWLVJUS1snxxhPUTK
         2VMw==
X-Gm-Message-State: ANoB5plivjLKotKUYJud2wYS5eHnDNII3uy8vggf/zsKoRpMvmcn8iFt
        vrHNdNolgOgyndJv78cjXiRVPYGvQojJP6C1fTc=
X-Google-Smtp-Source: AA0mqf4b+pEbOxW77G+RWw6jQ4Ltx2BWetsnWN5Oklb/xBQtx86Xlt1Ohg8mLxGQO4vb/T+5dqfILCX3keBBsd9gALg=
X-Received: by 2002:a17:907:7650:b0:781:e568:294f with SMTP id
 kj16-20020a170907765000b00781e568294fmr5332578ejc.447.1668763665960; Fri, 18
 Nov 2022 01:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com> <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 18 Nov 2022 09:27:19 +0000
Message-ID: <CA+V-a8vy-wj6oyA76Z6+rPDxes1pt-uxYynT1_OjCNCa2A0qNw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] ARM: dts: renesas: Use new media bus type macros
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the patch.

On Wed, Jun 15, 2022 at 11:21 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Now that a header exists with macros for the media interface bus-type
> values, replace hardcoding numerical constants with the corresponding
> macros in the DT sources.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
>  .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
>  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
>  3 files changed, 13 insertions(+), 6 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar
