Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41C44472F7
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 14:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235382AbhKGNGG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 08:06:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235343AbhKGNGF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Nov 2021 08:06:05 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6C6C061570;
        Sun,  7 Nov 2021 05:03:23 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id l43so26296360uad.4;
        Sun, 07 Nov 2021 05:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VSjDGs9178HW7/He6MTHqePG+3ZLhttJu6XCzVLRUA8=;
        b=JMZVXMd6v9IVS8zFQTFeg1o5BVeEsewh3OnhGY7lBJlWXy2iBwjEyzHO0Iko+dVlsJ
         s06vSg3jxUdyrEn/1Q79PT18RyBXusrxnfDB8EvH7b0/hXj8d4sgCDF11gzKMHB5Wmmq
         xkkljAxMZFkq9xYaZiCCAdetEczjau3V9C/DtLa5TtA96wM2QQlAWLIohtMnHiVFFIIk
         RRXHHuJ2Xj7O84mro7HKJR8PxFRVH+5HNSIJYQbd426eEtUPXUChE4yomnSyxG8C2vWD
         oi5/wgspI/hpZ7xyohSYqiNoW1LJFHLIp2/0KIsZmZHsB4KiZ94p71Jynqvk9AjJFQoy
         B0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VSjDGs9178HW7/He6MTHqePG+3ZLhttJu6XCzVLRUA8=;
        b=qrbsD2djzG8yA9ZirAKnw3sZBVpq+6WpHakBUnBYTNgR22/Ap2Oe11TRsHYIxtNx4W
         oaRPKfgmGXXJalLtadcVPXoRiqw+peUI1JwLjCHuk1CDWuGSvFeXBeKwVzmASKpodnn8
         FaYiynlonK3MJEJkOh6eFnEquZOdctiiwta6f1t+nETjg8XhMuUDDhBoCj3BQ5+AtzrT
         4iBYIfQ0l+q/vCNbU+3E1sdRu+EWA3pTgbDwWCBQx19GznBDVPSmttBvGDJNSS+t6BBn
         tyYFMEOBJiTmFRHR1CQLZqL73mo5fn6ef7A+f4YE+EaMEJG4RFkzrVApdWva39WQjp1j
         ISWQ==
X-Gm-Message-State: AOAM533/h/WTjE7K+D3Svlf0obkypc6x31timY8nZG70uWhYTePU8fn3
        skwUoCmdGmL9rgU72klkHo/BQj2PplJV8QLILfQ=
X-Google-Smtp-Source: ABdhPJwhDnkTVAGaINE5999hfgR7W987xT6LOzeED8k4xFjm5dmo6vvQuTK6rmUOJOEGl18ClVMrrAPrlXtE2nKRaUc=
X-Received: by 2002:ab0:6f47:: with SMTP id r7mr78305487uat.85.1636290202269;
 Sun, 07 Nov 2021 05:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20211106155427.753197-1-aford173@gmail.com> <20211106155427.753197-5-aford173@gmail.com>
In-Reply-To: <20211106155427.753197-5-aford173@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 7 Nov 2021 10:03:11 -0300
Message-ID: <CAOMZO5D6gmCXw+xaXUUjYBU-YNNiuev3Oys1TJzB6+bEeWzeVA@mail.gmail.com>
Subject: Re: [PATCH V2 5/5] arm64: defconfig: Enable OV5640
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
> The Beacon EmbeddedWorks imx8mm development kit has a TD Next 5640
> Camera.  Enable the OV5640 driver to use the camera.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Maybe this one could be squashed with the other defconfig patch. Either way:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
