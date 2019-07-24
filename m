Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9278473433
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 18:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387714AbfGXQtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 12:49:41 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37744 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387618AbfGXQtl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 12:49:41 -0400
Received: by mail-io1-f66.google.com with SMTP id q22so91003354iog.4;
        Wed, 24 Jul 2019 09:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lzLxr/ZHFALs7HXjKuWkfuLA5VhCZtI1OXBLZOHTWp8=;
        b=lXPQIo7VDuTijjGWIXFk94xGmnz3m2bjtYUjX0sWcb+LVYkt3mbBTfHIRnlYtn2MiJ
         0Nn0mHMGHjYWe9YeODPqOM9hGaa4l1FK/Yli8VOTKiKygdKnO7rhuBT38MH0IbHq4xnj
         x9bzJMMwXT2nbbkecjpVdsgx+OzR83lNzk8GESKCXOV9/WQrFtVsErcxariFY16zUW05
         0PPqxJqmlpL+f/QOD3RI0O3giiIzsN03TmJpKg6+zMHwzHZabIk2CElv3cFpqT/YerKY
         zraYkmyUUR8a2QspEkPZMboHrr2nXZ7bj/yqH96dYVaJcof1CrkGUK1oY8XWrZ201ziP
         9o3w==
X-Gm-Message-State: APjAAAXRkMjRwJl7lmzGDkZvR3VgJ7V7w/pfTDLaECTQXBCAd+owKDWQ
        1WJSM66RwZKzXVKYPuKz1g==
X-Google-Smtp-Source: APXvYqycVXE/3Diq36JRVdilGAeFPoocp/x5uykh8vdo3CPw1BlwOUJzQuvKMNLrDaaaN0Mc+FiZ+Q==
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr1401889iop.293.1563986979919;
        Wed, 24 Jul 2019 09:49:39 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id j23sm37899229ioo.6.2019.07.24.09.49.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 09:49:39 -0700 (PDT)
Date:   Wed, 24 Jul 2019 10:49:38 -0600
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
Subject: Re: [RFC PATCH V2 1/6] dt-bindings: mt8183: Added DIP dt-bindings
Message-ID: <20190724164938.GA25542@bogus>
References: <20190708110500.7242-1-frederic.chen@mediatek.com>
 <20190708110500.7242-2-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708110500.7242-2-frederic.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 8 Jul 2019 19:04:55 +0800, <frederic.chen@mediatek.com> wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
