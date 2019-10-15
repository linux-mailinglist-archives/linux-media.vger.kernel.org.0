Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF74D786F
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 16:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732713AbfJOO1c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 10:27:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44146 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732710AbfJOO1c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 10:27:32 -0400
Received: by mail-lj1-f193.google.com with SMTP id m13so20434940ljj.11
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 07:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r6wokyxgmz1CH4AYG9M6WGEBZNGfasrsS5Z0VdPHhII=;
        b=TjB+IGC9TNXHfUD+bPaS76M3IQQ9F7gulCuGtgNs2j7JCcnc8AWH6oPCCfO0hX8bG+
         DAqjisENL40t+enQ+1je0yBuW9i8iHtpoL0/HhAuXotvPTeOBG4QV99pc3y3WjNKzGb4
         kl1C6PcjDle7rnnVXeSftmi/BfePebdnqCRBitHtRX5ZAdZtFD+0JksHUoIK0m+swKDF
         HYuC/b089qpbSPMDpoSW3tFch1UP+yZB9qXAQC8m+G4h1toVdquviiPgkUeBqeUscG6w
         yoIZ3EJlUntELi8pPlcNcjmorTW79QRzLvOSEj5hQkq7M5xZspTF1zBDxj8pMuJ4wDSd
         u0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r6wokyxgmz1CH4AYG9M6WGEBZNGfasrsS5Z0VdPHhII=;
        b=X4bafRGSBUUJ6ffV2Sjh6oOLuu8zPy9U/7pIBNGEo5lw2g32WugUfsYxurz/oX4Kzi
         LURYx2946Doz4GSyhJo2E+ZV0jLpuoLRLRjZpAzLF5Sgzy/j6s0LnFkGWA09FzNWHluz
         aFl/duhh8okC8+pt33kr+Nu7d4XPSL37+dqKPOLmuTOSgirFLPNxuaVOHO4TOhmqSvNg
         KwkfnuI+F0fQx5hGbSrcCXBV2WcLuL0JHcPIPgXTB+9VF1DCXpov69bX+Xh3zjSdewMD
         jzoo7Tkr44Pwkz3oe3Y/Xf48caMnIWQsXJciUpkgK+IZNaV5MrV/zkKiKH5b6CJjFI4W
         YYfA==
X-Gm-Message-State: APjAAAXKt2GYEgTosvhDIXDuCHo9cLecVmnqc+4JoSfD5RHjT5mcI88g
        BmDGQ6/R0svdJtHMzmZkk2EUzHDKluu7LvdrNj0=
X-Google-Smtp-Source: APXvYqzsqb8VZbhR3Wgp5FMzurWUy6/QcC2GbPi+dJrZVHztwPrItieUiK1B/939nzf2WJWDyEqGnsqMj/qh2jVomjg=
X-Received: by 2002:a2e:b4d5:: with SMTP id r21mr22098830ljm.149.1571149650422;
 Tue, 15 Oct 2019 07:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191014135424.7000-1-festevam@gmail.com> <20191014135424.7000-3-festevam@gmail.com>
 <dd72d8a5-3067-b640-12b6-052d3ecf57ca@gmail.com>
In-Reply-To: <dd72d8a5-3067-b640-12b6-052d3ecf57ca@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 15 Oct 2019 11:27:26 -0300
Message-ID: <CAOMZO5BCkrdm=nibu1W0pLMKor1A__G2AkuBxJEQ6D9LSqxmTw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: imx.rst: Provide instructions for the
 i.MX6DL sabreauto
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Mon, Oct 14, 2019 at 2:20 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> should be "'adv7180 4-0021:0".

Will fix it.

> should be "'ipu1_csi0_mux':5".

Will fix it.

> > +   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
> > +   media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
> > +   media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
> > +   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
>
> Please add (after above line):
>
> # Configure "ipu1_ic_prpvf capture" interface (assumed at /dev/video1)
>     v4l2-ctl -d1 --set-fmt-video=field=none

Will add it and will change it to /dev/video2, which is the correct
interface on imx6dl-sabreuto.

> If you don't mind while you are on this, can you please add this
> v4l2-ctl step to the i.MX6Q PAL example, it is missing there as well.

Yes, I can add it.

What is the video device node for "ipu1_ic_prpvf capture" on the imx6q
sabreauto?

Thanks
