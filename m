Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735424472F1
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 14:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235361AbhKGNEH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 08:04:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235343AbhKGNEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Nov 2021 08:04:06 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCDCC061570;
        Sun,  7 Nov 2021 05:01:23 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id az37so26268102uab.13;
        Sun, 07 Nov 2021 05:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G81Tb0nYAJNkIIZ2L38RTLt0+P8fN4hX677GFQWczrg=;
        b=Ass+g+U/0SDSfSMDHkp05ocPQEOyU1ujWEdetulrG1YidOkDXGdnYo+/fKSai9/G3P
         xFyD8QFUIVspUoMeXXZN14Obp6oDA6DHveeFA8alzSLZX00Bfc5DJBxSYm0rcAVb6NSc
         3sUecJYn2h6ChEUFnNG51KiyYTGHHMEezzxZSqwVC0/a7BB1VarumKQJ7xRXsNvV9UAu
         OW45enZ8lFpZariykma3R5MKkNFz1drlaPZ+IhoBhBCNX1y1naPWSkj6dZ8fnqNi/30t
         uKe1BVC2IsquDkkb5yidcd8p/EX5muqjh97akat6SeprXY2RRHiRNwa3z5hDXlFciSfD
         QgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G81Tb0nYAJNkIIZ2L38RTLt0+P8fN4hX677GFQWczrg=;
        b=jj+28rh1UOx8LkUHrcmA4ZkCAVdGY7MDEwC/2+c1S9gWRdVOOClFNWfhbxJPEzmyJe
         7o1MdXlRIbejm/qdld0eucilqqqFR+JBaOPZPGatz1ME5I3IRXnmiKnNDo9eYoNvoVRS
         769Sr918G7Xsmfv9sQIRChrxwCwx25up+4svnYuQRgiFmLgP+BBa9Xixv/1A+jgEZSnw
         NUaj37TcYc2opjV95pvnxjc0jstTFoDLSRVMV72FEgdKTKlbN5WX8xuS5C8WjQ6mdz+J
         zzRVZWmy2HDpWRuMX6ZhXiygwnzPNjmjET2byU/CCSNM7HqY4386OfC/1C+y0x15zuDy
         l6kg==
X-Gm-Message-State: AOAM532k1mQURTT6KoS2VXLTRwi0mv6Z7QWMLMoJ0PR1dYAiJLTdekFQ
        H43QCkW7O+OXVMZzi9YvhT2LLicLeffxHNxoPXY=
X-Google-Smtp-Source: ABdhPJyyW14Pp/OLNHaLaqVQdl/GF8znZUDeUkfxpudoaw+8Svj4Zcof9gDufpEsk+tRZlvLAemj/VPGgfFIRvM2hqI=
X-Received: by 2002:a67:c308:: with SMTP id r8mr63928280vsj.20.1636290081640;
 Sun, 07 Nov 2021 05:01:21 -0800 (PST)
MIME-Version: 1.0
References: <20211106155427.753197-1-aford173@gmail.com> <20211106155427.753197-3-aford173@gmail.com>
In-Reply-To: <20211106155427.753197-3-aford173@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 7 Nov 2021 10:01:10 -0300
Message-ID: <CAOMZO5BQ_cUo=rLCr0vxtPk0F+gioaCG3_m=AHv208gz7Ob15A@mail.gmail.com>
Subject: Re: [PATCH V2 3/5] arm64: defconfig: Enable VIDEO_IMX_MEDIA
To:     Adam Ford <aford173@gmail.com>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Adam Ford-BE <aford@beaconembedded.com>,
        cstevens@beaconembedded.com,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 6, 2021 at 12:54 PM Adam Ford <aford173@gmail.com> wrote:
>
> To use a camera, the CSIS and CSI drivers need to be enabled with
> VIDEO_IMX_MEDIA.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
