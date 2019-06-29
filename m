Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2132A5AA8A
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 13:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfF2LmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 07:42:24 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:42604 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfF2LmY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 07:42:24 -0400
Received: by mail-lj1-f182.google.com with SMTP id t28so8480546lje.9
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2019 04:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ARsUqhTcfekfGOD2PbhwTlNzJtctbe2O37h1LNJHIHU=;
        b=q4xy8KuEMucFdLkMwT+L86mA031mQ3/+oh9/QCXy1DvadiOFlUEKj+vpwoXK4BfVkk
         wInU0u3sm3XjLUIVcwL2rUT1737Ie2eKQrXgls8FtO7hJ1xHwRkncTZ9nbbYAc57K5Hm
         gOtPRsHK55UDdCzB6DW+D9bLxQJaPeT8/PthLUfgeRgKPCM2eh/UYkc0MdQRSLKcNo/1
         Hw6jAeXZVFCzKKoR4QjSx5PGsQFcivNaKjWUC6dhEZ0Femc7z3aORURgmzNyAQewk/5G
         ztFdxqYALpmnr1YZMMXt24Y082/b3k9U27YGLDpzqp2SWAeaBZ1hcBi+8+KHmvmnslFC
         BO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ARsUqhTcfekfGOD2PbhwTlNzJtctbe2O37h1LNJHIHU=;
        b=fW/nPyGbZjVnGLQzyD6o0rlr+t0GETUXAgBM4QYFb7rx6JkgEQKozxak5Fjp/vwbtm
         Nwyi95F9ZQPYuPsJAhHGYj8O5O2iTZLvEJ05f0YHaEQEVTxDM/LJkocflGGjRGlkVexa
         4tBdAApe+w8m88ISSfgkzmosEYnQzUNOvvUnFTU8+OQ5AbrDvzha/feaY74KkhJPAhTn
         8IjXZB7Hbm8p2xwP5tOiGC3qWTPAOp6tIGDyOykBL67rQ8I9n/5Nj+D3ZPDhJ6RfohG1
         itfYcaegmfzVRCiF6D+t2kWoIM+bwBVleBRNFUWCfhnLXKSmQoxTy/6W4M3msycHiYzX
         e0pA==
X-Gm-Message-State: APjAAAWg/LXZSiZ7JUiOmKzzkJLd6NWkno2aTijGbAMiPuUsjBFasi4p
        8d5qxxqmn6SDvetsoKrfVSHo9okPvt4kiB59qtx3ajzRifk=
X-Google-Smtp-Source: APXvYqyMwiajaE5L4XqRkYl8/ueTDMmqsL9eO2CeLT8rSMKBtOnnC3ga6y82ux+s55quyY32RWHtSQI3QTihAtBZtOQ=
X-Received: by 2002:a2e:8650:: with SMTP id i16mr8896035ljj.178.1561808541815;
 Sat, 29 Jun 2019 04:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5A4zhpxf7PQV17vpi43M743Q0R5+ONpSc05-fxFbQDG0Q@mail.gmail.com>
 <CAOMZO5DktjDM-YE7g-bu+DgOZT2SA+FAta_cj2PZV0SLbiXK3g@mail.gmail.com> <20190629091239.yrjyxd56imytvedg@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190629091239.yrjyxd56imytvedg@valkosipuli.retiisi.org.uk>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 29 Jun 2019 08:42:18 -0300
Message-ID: <CAOMZO5BW3WJyKY1EnSFBstv_PehPJfHXDgyRqE4Wrxec_pzkyw@mail.gmail.com>
Subject: Re: Setting up the links for imx7-mipi-csis
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sat, Jun 29, 2019 at 6:13 AM Sakari Ailus <sakari.ailus@iki.fi> wrote:

> What does media-ctp -p say?

Thanks for this hint!

I managed to fix the media-ctl failure by looking at media-ctl -p output.

Documentation/media/v4l-drivers/imx7.rst mentions "csi_mux", but
media-ctl says "csi-mux", so I needed to change it to:

media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi-mux':1[1]"

and then I see no errors after the media-ctl command.

I will send a patch fixing Documentation/media/v4l-drivers/imx7.rst .

Thanks,

Fabio Estevam
