Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0332C94BF
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 02:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731272AbgLABgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 20:36:11 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:41346 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbgLABgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 20:36:11 -0500
Received: by mail-il1-f194.google.com with SMTP id p5so98008iln.8;
        Mon, 30 Nov 2020 17:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GVpuIFWzwjWwv3nZSyTHsP20wE6qwR6Pcp5yFWMuI+c=;
        b=LGelxJ+mSwXS9RMWz+7/+OPDPjndH+/5Ub4U0dqTFrUv0GVErNzs7d43Imqe8AOvkk
         7tubfbqbRs089Dlc72pwLxyi/wSeiwTaylICknHlIOGIPsPcmqii0Pxl6mjOb/6yUkN8
         1Aco0U/sAT2AWi3+jmnVks4+OaJ4fRHXqliB75f0YXcBO7vT3/ZlZqweHwsRyXEbAMx/
         oMvaYVtahXmpe2RM1D1EuUdeKhB57e/YEHs8OOVz2IqnUS88NB0I6wtOn/5M4dbwcfnL
         cSbeUXww+hKKyKjrRpT0DHv8Xj6uK7X9nJZofz9oCjv6Chi1QpWQsR/x/epP9C2q595h
         kNzQ==
X-Gm-Message-State: AOAM533kcTNhhP92GKDoPZ4WaKFNERXhcwDDbLtoAJy4ma6/t240Sn4q
        u7quFm/AIjDGw8XGAcTk0w==
X-Google-Smtp-Source: ABdhPJwUlN5l3Gh7+xqYqg3UP+GDBb5GmRGKTM4mwYtbcsbfdWR7c6k4BnU7cVtaPzTijBI9x6+sng==
X-Received: by 2002:a92:50b:: with SMTP id q11mr528232ile.49.1606786529992;
        Mon, 30 Nov 2020 17:35:29 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id b15sm186046ilg.83.2020.11.30.17.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 17:35:29 -0800 (PST)
Received: (nullmailer pid 3440973 invoked by uid 1000);
        Tue, 01 Dec 2020 01:35:26 -0000
Date:   Mon, 30 Nov 2020 18:35:26 -0700
From:   Rob Herring <robh@kernel.org>
To:     Daoyuan Huang <daoyuan.huang@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, drinkcat@chromium.org, acourbot@chromium.org,
        pihsun@chromium.org, menghui.lin@mediatek.com,
        sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
        moudy.ho@mediatek.com, srv_heupstream@mediatek.com
Subject: Re: [PATCH v4 1/4] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
Message-ID: <20201201013526.GA3327634@robh.at.kernel.org>
References: <1605839346-10648-1-git-send-email-daoyuan.huang@mediatek.com>
 <1605839346-10648-2-git-send-email-daoyuan.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605839346-10648-2-git-send-email-daoyuan.huang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 20, 2020 at 10:29:03AM +0800, Daoyuan Huang wrote:
> From: daoyuan huang <daoyuan.huang@mediatek.com>
> 
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8183-mdp3.txt   | 208 ++++++++++++++++++
>  1 file changed, 208 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt

In the year since last posting, DT bindings are now in schema format.

Rob
