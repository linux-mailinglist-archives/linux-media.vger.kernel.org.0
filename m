Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72A94472EB
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 13:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235349AbhKGNBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 08:01:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235343AbhKGNBm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Nov 2021 08:01:42 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EDC5C061570;
        Sun,  7 Nov 2021 04:58:59 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id b17so26386386uas.0;
        Sun, 07 Nov 2021 04:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3my8Z8HDjOGR5r/CaT52cYds9jrYdi67PgA2ikxov10=;
        b=g4DynHbR4l4hC377BCd7M0u8Kv3DVuD3Zs9mZ1bUsJs1Chub4+jWR0KpUyoiXS7ITb
         AeBFgZYOEu89G8MP3Z61mZpnqAOEnszGkPDHdQg5Wl3LjecIzK4yxrTixkKTLHQEktzw
         czYFMjzDqJ2nvudSrQVss7r8lVKKKQMuv+T9vzqzN3ZU1s4RL5a+uJehn6ml2/YGhRw7
         K9Gjx3duQCLnI18H2azFvsXLJ+4o9bjm16EREcraVXsaiZxqpJy9uPQenIIdB4fgzk1S
         w2g/O0T0/fA//ZV9iE8eyh9dl0KRkjtlAMIcspLPO2Sx05BhrIHCTYJ+yrcvXy3UWDcn
         Qiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3my8Z8HDjOGR5r/CaT52cYds9jrYdi67PgA2ikxov10=;
        b=Ycq6JETmB/QgRKzbue6p+C3rZ7uYqZDHa9ZTDmSiGU7owyISEs5bSfORD/kjz6INhH
         y2ZN1/hYgLMDcJhuAnEeyH6Adw5STUP85Y9p4vlT7wp/bJxtdZnSGQCsVaGzUVDnG1Iz
         2AsZ1Xru5cJhhBMgv47S2AJ2oFNLXP2EQZMhTtmKsCfd4OybPO9JRHPDclB59n7Eaolc
         l0lgBAPngrWU90Hzyd/Z7Fw0zhs8qzwqsLs4vkktulecZa1y70SGHACz9fdV8thD2OyE
         CrhKpg5MSHK3WtZBNE+HGD1op8K1ryw9UAaqwXGb+YRxQuzw/zFZtmMiPpjmMBYVNYwG
         Hdvg==
X-Gm-Message-State: AOAM531Vzn/jmwm+rTB1jpd2cdOJLk5yxn8sqm4tKNSfuTdpFbeb0vfO
        5UseihTHFvJuWT6CrusAP7zvl2HWwOGxXRBu7P0=
X-Google-Smtp-Source: ABdhPJwU7ZWfbFD0M87q53owj+YnpPOux4CT9nqWqMUcIKii/N5DrxxAd1cJaJlSuaQFNeKv5TfQmv/MQjgbxb1YVUk=
X-Received: by 2002:a05:6102:cd1:: with SMTP id g17mr8359570vst.5.1636289938725;
 Sun, 07 Nov 2021 04:58:58 -0800 (PST)
MIME-Version: 1.0
References: <20211106155427.753197-1-aford173@gmail.com> <20211106155427.753197-2-aford173@gmail.com>
In-Reply-To: <20211106155427.753197-2-aford173@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 7 Nov 2021 09:58:48 -0300
Message-ID: <CAOMZO5D=JOasLxGebtkdxPOWKDpF66=AM4vbKOrFBXnfTEZA_A@mail.gmail.com>
Subject: Re: [PATCH V2 2/5] arm64: dts: imx8mm: Add CSI nodes
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
> There is a csi bridge and csis interface that tie together
> to allow csi2 capture.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-By: Tim Harvey <tharvey@gateworks.com>
> Tested-By: Tim Harvey <tharvey@gateworks.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
