Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF6D2C19A6
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 01:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgKWX4S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 18:56:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727437AbgKWX4P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 18:56:15 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CCCC061A4D
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 15:56:15 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id l11so26371913lfg.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 15:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YnhR1hhTDdb79Txd40YmmmMbIC/AjLNuqdONwWnI2dg=;
        b=kZ+79z/uBo/qRjmY7Jjq0rAD+9AspnfTp6Dw62PbqgrQK57nOMVbJoQvY4j8kmwJeB
         s3vxfoE4mGEJGt+x+84wAJGICr4wuyd3cRiP0ZB4zw80Dr88IMov5y9wp/i6Ksl+3N6O
         HNPOKbOWzXIWbfPCWIQoqsldoNScc49jdbcEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YnhR1hhTDdb79Txd40YmmmMbIC/AjLNuqdONwWnI2dg=;
        b=uSMWy/iWzFCEmQgWrGIBYkYehtvfgHF6h3zRiz1oL/cfWev1YZIzFNEiD9eRZnRHwA
         QSCTTwDZhRtcS3QLLbV9C3JF7iL2nmpXgrZyqAb4cCP6INMdmePr9U3E/fN91Lu0oThH
         PNUmXSbPBwIlJPRjqn1TzuWkxLiM57rUWUYIwRp5RgvvYOvI5ZgH2+SJBUJk/UPL+KeA
         QHA7y2uRXB60sEqCUuXiz7nIs2kfcH8OfL0+OM7gKwhKAjiu8QhijIhH4EApkO49ajZu
         kyQlCfpCj3PhBk6nEzM2SeBPQY3VeDTwcgXG8WXnJ9i7CBxp5cn8oYeHYVvxaeQToXwJ
         dddA==
X-Gm-Message-State: AOAM531v1WJxyiagZfe4D3hyLzvR9bIf3t19PKGHQZ65PRYgaR0OB0Mu
        9J7hYxq/R08FgpQl9LJL5zw/1kAU4FSjfg==
X-Google-Smtp-Source: ABdhPJx8cpp9mONMECQwXFepETLdwOFGhnnDWunz71sFvLvBuYYr49fnqwA9DrjvF8Sme8Gu3w5RKQ==
X-Received: by 2002:ac2:5dca:: with SMTP id x10mr589751lfq.74.1606175773561;
        Mon, 23 Nov 2020 15:56:13 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id k9sm1533717lfk.288.2020.11.23.15.56.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 15:56:12 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id e139so26338418lfd.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 15:56:12 -0800 (PST)
X-Received: by 2002:a05:6512:5d7:: with SMTP id o23mr598966lfo.272.1606175772082;
 Mon, 23 Nov 2020 15:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20201013124428.783025-1-acourbot@chromium.org>
In-Reply-To: <20201013124428.783025-1-acourbot@chromium.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 24 Nov 2020 08:56:00 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVM81dQyLJANUH7j8b5uhpk8ERdm9gpsGkF4k1Y-ZkYDQ@mail.gmail.com>
Message-ID: <CAPBb6MVM81dQyLJANUH7j8b5uhpk8ERdm9gpsGkF4k1Y-ZkYDQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] media: mtk-vcodec: fix builds when remoteproc is disabled
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Gentle ping about this - we are already well into the 5.10 cycle so we
don't have much time left if we want to merge this build breakage
fix...


On Tue, Oct 13, 2020 at 9:44 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> No functional changes since v3, but it does the job at fixing the build
> breakage. :) Please kindly take a look.
>
> Changes since v3:
> * Removed obsolete Acked-bys
> * Fixed indentation in Kconfig file
>
> Changes since v2:
> * Use the FOO || !FOO magic suggested by Hans to ensure a built-in
>   module does not try to link against symbols in a module,
> * Added a patch to split the VPU and SCP ops into their own source files
>   and make the optional build cleaner,
> * Control the build of firmware implementations using two new transparent
>   Kconfig symbols.
>
> Changes since v1:
> * Added Acked-by from Randy.
> * Fixed typo in Kconfig description.
>
> Alexandre Courbot (2):
>   media: mtk-vcodec: move firmware implementations into their own files
>   media: mtk-vcodec: fix build breakage when one of VPU or SCP is
>     enabled
>
>  drivers/media/platform/Kconfig                |  28 ++-
>  drivers/media/platform/mtk-vcodec/Makefile    |  10 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   2 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   2 +-
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 174 +-----------------
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |   7 +-
>  .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  |  52 ++++++
>  .../platform/mtk-vcodec/mtk_vcodec_fw_scp.c   |  73 ++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_fw_vpu.c   | 109 +++++++++++
>  9 files changed, 277 insertions(+), 180 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
>
> --
> 2.29.0.rc1.297.gfa9743e501-goog
>
