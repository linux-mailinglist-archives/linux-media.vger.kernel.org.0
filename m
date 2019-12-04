Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 623E6113543
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 19:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbfLDS6Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 13:58:16 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33679 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfLDS6P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 13:58:15 -0500
Received: by mail-ot1-f68.google.com with SMTP id d17so263814otc.0;
        Wed, 04 Dec 2019 10:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bhAw5EIrwwGC1eqIzLBcurAl7dDZA4dCCIXam/BMZgA=;
        b=G3uAdrZgBx5I7Y/Xw2v6uUKz6XsuLJ2njfif0yqpNHFKKGIpt81sulEBlkSTmeq6In
         bdG/0jE5ojWz86HQqPxV5aiFS5C5XNkhoQoQaacsoThT2um0VmW8+HEzg579HYaPtMT1
         gfZ1aRgekgOYPPqZ4c2WNpAjZheKcSICuSHlx2lrMtJ5Hz0eSLXQAVt6otw1liWbQR7p
         5UokoCuYETlbDq0JmDl5Nv7J+/eOb5AnBiON3p7g7FeY7AE0Jib7tA42DuqLjjJj/jqZ
         po+JLJZtwV7f5dboU4Q/NabW3Jv+0kblbeZbeyYRqoqI/KpnID3YWSWHXWfMllEL0En2
         jYfQ==
X-Gm-Message-State: APjAAAUrvxMWYgLhpTabvvcx4lYRdrp/3SLgXiqdkbP5DNaryTzjAVAb
        dL82aBc6VNaiEk3TalG0DA==
X-Google-Smtp-Source: APXvYqyhikx3yghkHjt5R9cmpYpMgQpTzsJXnZPaFUw1zHqWLWzLrAfwaR2k5BK5VzCtPrWZ+QpwoQ==
X-Received: by 2002:a9d:630d:: with SMTP id q13mr3480338otk.31.1575485894893;
        Wed, 04 Dec 2019 10:58:14 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v24sm2456801ote.38.2019.12.04.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 10:58:14 -0800 (PST)
Date:   Wed, 4 Dec 2019 12:58:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        pihsun@chromium.org, yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, Rynn.Wu@mediatek.com,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org,
        Jerry-ch Chen <jerry-ch.chen@mediatek.com>
Subject: Re: [RFC PATCH V4 2/4] dt-bindings: mt8183: Added FD dt-bindings
Message-ID: <20191204185813.GA23184@bogus>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-3-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204124732.10932-3-Jerry-Ch.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 4 Dec 2019 20:47:30 +0800, Jerry-ch Chen wrote:
> From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> 
> This patch adds DT binding documentation for the Face Detection (FD)
> unit of the Mediatek's mt8183 SoC.
> 
> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8183-fd.txt     | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
