Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC2D3C2248
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 12:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbhGIKhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 06:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbhGIKhL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 06:37:11 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2C6C0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 03:34:28 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id he13so15277200ejc.11
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EE3G7qk9YjV6WICjXG49f7wI9xsGOugrChSPRCk7KBY=;
        b=j6ueWrIhKJIqX+ueklioki6dIG0OTnmNayymWlaVcRO1HjVRRLInq8113rpC0VzsJE
         LJlOHhgMqrPL7AbRHbdrjOpH5SkezCozW4eeIWh4PO1FXTa5NEVaruBmAWnQGauz7eGj
         FQ2l2WvAoKeryPAxZP6iCnPC+YpHdEbovQavQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EE3G7qk9YjV6WICjXG49f7wI9xsGOugrChSPRCk7KBY=;
        b=VqrDyVFOKb76a23jYxt8ilmdQVg1fHN1e1yeBEPX6CppyWd0k9wxDvq8L1vbi2aOTp
         tk5QMg2qv08V8CbbB4S76VHTxic2Sa8hYArujxXjtoEu22Pz6/2ZwDUjoFVzXHDkVJuI
         Que910JdyIKyKIhOqcv0G2HjV7IvhQTfNYSi+XRE5+EilTxSq2Gt0W5bO2pVHPPzMO7q
         AK1H5vkBUtixZK4fIxWoKFGxNyq9VWWuUDGhCpkRu8TvVq98vdAsEwiqPNIIO5w3m6dg
         0vbb5QgZ611YFevouRQb0o565htMuEPqgoiTu2GhlFtCrFKlYfoq5BoIibQNo6X8EXsy
         Jg6w==
X-Gm-Message-State: AOAM533DV4bka+5djAjreXaobL6fuoumfcp2x97VFDCZXCfhVly8fQbr
        Abd7rCOaqrmUB4uNQhit7bEjnCTLfrbQ5N5C5Cc=
X-Google-Smtp-Source: ABdhPJzgvrDK0OJmw0DPMn4NmJpdrwbrX5RRSAeH20+iNyjuILMWGNgNOL4z8wfrIlpUiLglEaHWBw==
X-Received: by 2002:a17:907:1b1b:: with SMTP id mp27mr35930141ejc.538.1625826866469;
        Fri, 09 Jul 2021 03:34:26 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id h9sm2220278ejk.15.2021.07.09.03.34.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 03:34:26 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id s15so13052447edt.13
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 03:34:26 -0700 (PDT)
X-Received: by 2002:adf:f1c9:: with SMTP id z9mr12812492wro.159.1625826403104;
 Fri, 09 Jul 2021 03:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 9 Jul 2021 19:26:31 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D+Zwh6JxJqAbyLX9XeyFdnmjUgWTpFA6GvO2qNktOxBQ@mail.gmail.com>
Message-ID: <CAAFQd5D+Zwh6JxJqAbyLX9XeyFdnmjUgWTpFA6GvO2qNktOxBQ@mail.gmail.com>
Subject: Re: [PATCH v2,0/9] Support jpeg encode for MT8195
To:     "kyrie.wu" <kyrie.wu@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Xia.Jiang@mediatek.com,
        maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kyrie,

On Wed, Jun 30, 2021 at 4:31 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
>
> add component framework to using multi-HW for MT8195 jpeg encode.
>
> kyrie.wu (9):
>   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
>   media: mtk-jpegenc: Add MT8195 JPEG venc driver
>   media: mtk-jpegenc: remove redundant code of irq
>   media: mtk-jpegenc: Refactor jpeg clock interface
>   media: mtk-jpegenc: Generalize jpeg encode irq interfaces
>   media: mtk-jpegenc: Generalize jpegenc HW timeout interfaces
>   media: mtk-jpegenc: Use component framework to manage each hardware
>     information
>   media: mtk-jpegenc: Generalize jpegenc HW operations interfaces
>   media: mtk-jpegenc: Refactor jpegenc device run interface
>
>  .../bindings/media/mediatek-jpeg-encoder.yaml      |   3 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 600 +++++++++++++++++----
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  69 ++-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  | 208 +++++++
>  4 files changed, 786 insertions(+), 94 deletions(-)
>
> ---
> This patch dependents on "dt-bindings: mediatek: convert mtk jpeg decoder/encoder to yaml"[1]
>
> Please also accept this patch together with [1].
>
> [1]https://lore.kernel.org/patchwork/patch/1445298/

Thank you for the series. However, I gave reviewing it a try and
unfortunately had a very hard time following it, because of the way
the patches are organized. Please make sure to read and understand the
kernel patch submission guide[1], adjust the series appropriately and
send a new version which I'll review.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Best regards,
Tomasz
