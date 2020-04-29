Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A21A1BEBA4
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 00:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbgD2WJ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 18:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728021AbgD2WJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 18:09:25 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E791FC03C1AE;
        Wed, 29 Apr 2020 15:09:24 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id g14so3137869otg.10;
        Wed, 29 Apr 2020 15:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8oqwTr93GONiIRzdNlX+cz19aB6zUtjVhJXAzceD5NI=;
        b=mbT0/nGlQVzYagaookGp3cEt7WpHHYBvOZ0eg9smcL5aJUbT99dEyaKCU+lwAoXgpi
         3XWCQanM4wWlKeU1lcb3ywJ046tsjFk0WKR2ctNr2fSHkzgR3Rchv3lQkOLxODyhgi7W
         zdpySIQe8y3fRub9I9zVCXi362IIZXiEe+OR71DOkOHSpux73eGW9th2DUh4b7wqU9Fs
         s/CdEqtDZSE0o+8lKUVxEA8+D84EcxNJbzeimiuaCUf3prxmEggk9gmRNSSVQDnbwyXs
         WWzsP3h99/+yez6l4AhJBHTyVPBHNtzOtu6C/P+mI3kpV3VtW3NIxfcGr3FRNhvcrqlV
         UdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8oqwTr93GONiIRzdNlX+cz19aB6zUtjVhJXAzceD5NI=;
        b=pIBCbyUQw2OWGo6wc0lNJtQi5JAqrhgtThExihwYKGV6RQhIJfgkJ7Rc5S0keXkimH
         VaRhFOwiiCRh07HIgSD9zdZFEHAJsrVP2STm/treUV70iz3k12XUU81zo4wu51/K8fnx
         CgrrTzCFybW6zQL+QInwv+0jRBcS3GAKkJcIlrAT0ncwnm6Xs61hdiwEV7drgctQA4cL
         19wIKWPzamgvILy8wj2YpHH945SdveLo/3fITTyfXhNoc/AlOGtKU0uaTsUDk+0BegdW
         VRCuJXWQTtf/xRxJ9aNgmlSy9Ub0pgiDLDNRZc/dX/+3P+piv4oO1pVjntyST57KvGxI
         y2Lg==
X-Gm-Message-State: AGi0PuZppdDoRbPUoiZMkuIurz0mom53ya3bwUd7C3dwADTHeHxCI9pu
        DfaEeZBgKn4p1Lm4z/PSWBF2e9Km+1kdUbsIZeNRhk4j
X-Google-Smtp-Source: APiQypKobiQJJqpqNRhFSNXeLIHjEz81s3WISBQksQoAKf9VSaGW8bghC6rpb+qGC5zWjSngm/v2nXCxiH0QCiwVw68=
X-Received: by 2002:a9d:7390:: with SMTP id j16mr94578otk.43.1588198164341;
 Wed, 29 Apr 2020 15:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <1586945948-11026-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1586945948-11026-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 29 Apr 2020 23:08:58 +0100
Message-ID: <CA+V-a8s+rU8PV9nzERGSeiauxekP7MOgMXMOtx579OqnVmMHrA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] media: rcar-vin: Enable MEDIA_BUS_FMT_SRGGB8_1X8 format
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Apr 15, 2020 at 11:19 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi,
>
> This patch series adds support for MEDIA_BUS_FMT_SRGGB8_1X8 format for vin
>
> Cheers,
> --Prabhakar
>
> Changed for v4:
> * patch 1/3 is new patch which adds a check for conversion from input to
>   output.
> * patch 2/3 added a comment while setting VNIS_REG for RAW format as
>   suggested by Niklas
>
> Changes for v3:
> * Dropped patch 1/1 from v2 as this handled neatly by patches
>   https://patchwork.linuxtv.org/project/linux-media/list/?series=1974
> * Included Ack from Niklas for patch 2/2
> * Updated commit message for patch 1/1.
>
> Changes for v2:
> * Added support for matching fwnode against endpoints/nodes.
> * Separated patch for rcar-vin and rcar-csi2.c which added
>   MEDIA_BUS_FMT_SRGGB8_1X8.
>
> Lad Prabhakar (3):
>   media: rcar-vin: Invalidate pipeline if conversion is not possible on
>     input formats
>   media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
>   media: rcar-csi2: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
>
Gentle ping.

Cheers,
--Prabhakar

>  drivers/media/platform/rcar-vin/rcar-csi2.c |  1 +
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 21 +++++++++++++++++++--
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
>  3 files changed, 24 insertions(+), 2 deletions(-)
>
> --
> 2.20.1
>
