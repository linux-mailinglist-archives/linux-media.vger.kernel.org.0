Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDC44472E9
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 13:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235337AbhKGNBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 08:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232575AbhKGNBJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Nov 2021 08:01:09 -0500
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00E6C061570;
        Sun,  7 Nov 2021 04:58:26 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id d128so6872843vkf.11;
        Sun, 07 Nov 2021 04:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9eV/fdHf8QRKIzUhm9qgNCJRObaanecr1jKTW7PsmiE=;
        b=YweIuKvSjvNXAv5B1ORFz3gmKdwNAYjzjYysp3f1OlylgxFJy49Xnftk0tm7B9nA9K
         tL7hd8vxkTkfM043NUmgjiaRlMXWtVKOJ78czGS/WAl/EFOLiNr6SMCmJ7Z5SXI0FmdZ
         kMePv3P/jKbRQ1ErhZp3Gng90mC9nLdwQvftFUNbQfx/op1e9AuWf79w8TvC5mHUSCR+
         QSOnAoomPvl9/o7PIvPy4jphdRFqKtGSq50DZ+MvqvEa+2ifL3mazObY8af1+k+WBvPF
         Z/T3lP6dMHGsoGNQzLDu13PX/XG1wzr9AQVI90hoHR9MXFE9AZlc0B9trlMoi5E4NWF+
         4SYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9eV/fdHf8QRKIzUhm9qgNCJRObaanecr1jKTW7PsmiE=;
        b=Ujjv5I+fhUV0ZGjh4D6AA52Jz01RJUC0uYNczjIrVSvB8eFe4p6F2OszpNuWO0+Vc6
         qFYzM9BAanyePoZrE4RHGUU+peMBqDB05nkCMqcpoxFFZjY+eXsRgDHD50WdXpRyN8fF
         96KQZ1ejJsXx4VLJHSEUa4WylaUUPKVy+0wrJTRvRnukHzvIx3upkUdbEFSVz3LTeXxo
         FwkzN2pCOCngI+0vIWo3P0iFI3+qfIAzYuugDzTwEZ+LwhiOeHCFRYfQpGkiID4PLgBC
         MgRg8eEjCLT8JoN9r4b3TWw/3ZII6LZUJiLRSgciVCoNY1aVHMxqDUhNyiQOh4itFi2O
         7RtQ==
X-Gm-Message-State: AOAM532dxAzD3ZUUtbPHHFhnfnL2xJEdAkgrCqU1HxSbjSvSQe6DmUXQ
        Ci8I5lnEnH0rXTQHr4HeNWpuNy9gSDrDNwNYyWc=
X-Google-Smtp-Source: ABdhPJw4DjqiCXrpo2VfjymWHq7nqcAz8E1V9PCFd+PGP3AwtaysBg/9QAcNjYY2wFEWeuh0v/lpvhvPf8yi04v8SRw=
X-Received: by 2002:a1f:9158:: with SMTP id t85mr19564442vkd.8.1636289905985;
 Sun, 07 Nov 2021 04:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20211106155427.753197-1-aford173@gmail.com>
In-Reply-To: <20211106155427.753197-1-aford173@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 7 Nov 2021 09:58:15 -0300
Message-ID: <CAOMZO5AZLT7SmpH007S5oZg7k+qJdmHTxb+CpvyXXZJtXQf4ww@mail.gmail.com>
Subject: Re: [PATCH V2 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
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

Hi Adam,

On Sat, Nov 6, 2021 at 12:54 PM Adam Ford <aford173@gmail.com> wrote:
>
> Most of the blk-ctrl reset bits are found in one register, however
> there are two bits in offset 8 for pulling the MIPI DPHY out of reset
> and these need to be set when IMX8MM_DISPBLK_PD_MIPI_CSI is brought
> out of reset or the MIPI_CSI hangs.
>
> Fixes: 926e57c065df ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
