Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0BFF124EA3
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 18:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbfLRRCT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 12:02:19 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42888 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727368AbfLRRCS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 12:02:18 -0500
Received: by mail-ot1-f66.google.com with SMTP id 66so3270275otd.9;
        Wed, 18 Dec 2019 09:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JaI7AY/5dEsE+PzKKfws1NegVl++uA5oApSBgLNQCls=;
        b=OPOC6z/S5Kay/I2CleJEl2T6qdDSFYINzJ1M8U814F9vbpbVUGE0uQmQOqyMBFpS/T
         xHHerFD0RuMjwJaYNH1nYGktEHbHn5lkSyttcq2t+HbRVHoFF9VcG8rII+KlOFw3WHvY
         ugl9PZ0vA74Qmn4TMX2SyWvwmYwdKRAAS+7U5ZZib4Hfvx9K2xd3QIhqKFxLqXiZx0MQ
         xvcadG7kFoGxZXN1vAh7VFGuFsCbN1oXn9TzCzjbgxwJXyP0s59aL9SdeYayHt/fl6Yr
         9isDKD13k/Pem4ql2Y7ra33gQzMeUvsuhE0fihPSb/D3seDB0mtfleGaJ3q2ByEPflhH
         ryOg==
X-Gm-Message-State: APjAAAWlFA5NucoR2DGMQCbOZy0JgSqfWCB9ugRgqC4gvUgKIVGzaKqw
        55MTrcOJiy6GligHShSZpA==
X-Google-Smtp-Source: APXvYqzOiFGi11lFLhBbyJQ2UV01N4xUjbtoI1m67WTwLSZq6goK5Ks+0SR2sX/w079C4Hu9mqDTmw==
X-Received: by 2002:a9d:7c8f:: with SMTP id q15mr3730626otn.341.1576688537723;
        Wed, 18 Dec 2019 09:02:17 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r13sm963542oic.52.2019.12.18.09.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 09:02:17 -0800 (PST)
Date:   Wed, 18 Dec 2019 11:02:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     matthias.bgg@kernel.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com,
        sean.wang@mediatek.com, sean.wang@kernel.org,
        rdunlap@infradead.org, wens@csie.org, hsinyi@chromium.org,
        frank-w@public-files.de, drinkcat@chromium.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mbrugger@suse.com,
        matthias.bgg@kernel.org
Subject: Re: [resend PATCH v6 02/12] dt-bindings: mediatek: Add compatible
 for mt7623
Message-ID: <20191218170216.GA18152@bogus>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-3-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191207224740.24536-3-matthias.bgg@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat,  7 Dec 2019 23:47:30 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> MediaTek mt7623 uses the mt2701 binings as fallback.
> Document this in the binding description.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
