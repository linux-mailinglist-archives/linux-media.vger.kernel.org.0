Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1627DB278C
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 23:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390171AbfIMVtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 17:49:01 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36347 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390169AbfIMVtB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 17:49:01 -0400
Received: by mail-oi1-f194.google.com with SMTP id k20so3898428oih.3;
        Fri, 13 Sep 2019 14:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=3ui0eUxYUk9AGgzSlQ7m/osQuaMVwY1YZdYH8n3luq8=;
        b=uY+c4JNj55i4u++eKNAMOAGMybqJtgwQXeM0/lmDDOIqxOszzsaOiRODZSecuatL9Q
         Y7AjcK+Qt4vlUIgKow1USulhIt43BlutFRfgQfLg/lRehZR5vHwD6kTDjHUmMwK/uVCi
         fNMMJsXnmJavK6jXB/VS7TrhTGJjoS8GkPVzOW78z5+uYuzilM6OT5S/QY+basYwDp9v
         zNnCE51eCVmPDBJZTuyzmv1rGDzFTJZ4aSY52MXXkELwFO43MoQjC9WYoYZdELE+Wxbo
         0Qb4iTuA9dcKzeJZs4zuh+GcdNDQXBuXpjLT43W3W4uqrgGrvmD59SrDiT3gUf1bAOwH
         rRCA==
X-Gm-Message-State: APjAAAWLVEuj94/GyFk2wcPTqYZfsaVFCGHRoeKT6XQIfh3f7zbiUIqO
        lKzX2USuHoUvahKKoX25qg==
X-Google-Smtp-Source: APXvYqwrX78qL+fphXmP83YaXehBjj7lGvQnlNkImVCOv6wfycHSII+8QXVN1ACQV9qwo7LJNutSCA==
X-Received: by 2002:aca:f3d4:: with SMTP id r203mr5157914oih.164.1568411340561;
        Fri, 13 Sep 2019 14:49:00 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d17sm10106995otl.25.2019.09.13.14.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 14:49:00 -0700 (PDT)
Message-ID: <5d7c0ecc.1c69fb81.2f580.64bb@mx.google.com>
Date:   Fri, 13 Sep 2019 16:48:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     frederic.chen@mediatek.com
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        shik@chromium.org, suleiman@chromium.org, Allan.Yang@mediatek.com
Subject: Re: [RFC PATCH V3 1/5] dt-bindings: mt8183: Added DIP dt-bindings
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
 <20190909192244.9367-2-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909192244.9367-2-frederic.chen@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 10 Sep 2019 03:22:40 +0800, <frederic.chen@mediatek.com> wrote:
> From: Frederic Chen <frederic.chen@mediatek.com>
> 
> This patch adds DT binding documentation for the Digital Image
> Processing (DIP) unit of camera ISP system on Mediatek's SoCs.
> 
> It depends on the SCP and MDP 3 patch as following:
> 
> 1. dt-bindings: Add a binding for Mediatek SCP
>    https://patchwork.kernel.org/patch/11027247/
> 2. dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
>    https://patchwork.kernel.org/patch/10945603/
> 
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8183-dip.txt    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

