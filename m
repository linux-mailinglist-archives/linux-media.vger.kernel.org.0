Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 692BAB55D6
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 21:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729783AbfIQTAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 15:00:42 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37932 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729728AbfIQTAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 15:00:42 -0400
Received: by mail-oi1-f193.google.com with SMTP id 7so3838209oip.5;
        Tue, 17 Sep 2019 12:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KMFOJxSDmNk+ep/uvhUIXWKVpfvuQM6FW+WcSok7HNU=;
        b=e2NwGORjRmUMKPrH6Ucwft/jRwCWqbvGwHZF22FWIIJLwU/3T+EkZFW0jaA/HGfDzW
         92qhIrhsGIscbJBRt+jGxrdtJ4bQXH2EHu3n/kZ30FgX1GRc0JZs7EhYwD7dTSnRyEFz
         gQu5XGflB06CMPMEakCZ2+/sqhaUuIB5Xl2J7J4lqxT4D4XW5YktGS8/fLv8u9sjlE3O
         IkdwVx9Pm+3CgRkoqNbZk4Bp0s81QpuaoPfuDdbniIXRV1VqG26K5Ko5/H3SupHSNXg7
         w9aSRRSziq+LxwruWslx5yQPTMin+HLISbsqWLOlKYo0DOD2IdKPGY/iftMDtHE0NvM0
         cuaw==
X-Gm-Message-State: APjAAAVMSeoPlChgwjpW1jr6h/Fqwe3FFTVWK73th+keZZhSJ1SCloM6
        bQZkNxzvYeA1o8jpkMo7OA==
X-Google-Smtp-Source: APXvYqyPBAleJPJJgi/jVRhyloWkqDSvUnLKGRJvMyJRlfhxoL2QGkUKIRHmQ4g6WVCXP1CtVtoeVQ==
X-Received: by 2002:aca:cd58:: with SMTP id d85mr4702733oig.119.1568746841223;
        Tue, 17 Sep 2019 12:00:41 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t8sm928029oic.46.2019.09.17.12.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 12:00:40 -0700 (PDT)
Date:   Tue, 17 Sep 2019 14:00:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        lkml@metux.net, ck.hu@mediatek.com, yuzhao@chromium.org,
        zwisler@chromium.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, po-yang.huang@mediatek.com,
        Rynn.Wu@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        Jerry-ch Chen <jerry-ch.chen@mediatek.com>
Subject: Re: [RFC PATCH V3 1/3] dt-bindings: mt8183: Added FD dt-bindings
Message-ID: <20190917190039.GA6553@bogus>
References: <20190906101125.3784-1-Jerry-Ch.chen@mediatek.com>
 <20190906101125.3784-2-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906101125.3784-2-Jerry-Ch.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 6 Sep 2019 18:11:23 +0800, Jerry-ch Chen wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
