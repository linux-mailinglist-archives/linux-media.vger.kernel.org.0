Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA1A317685A
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 00:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgCBXk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 18:40:27 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38738 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgCBXk0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 18:40:26 -0500
Received: by mail-oi1-f194.google.com with SMTP id 2so1121823oiz.5;
        Mon, 02 Mar 2020 15:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9vV5PavoKMjDsMnqHBiR5ea2gdjD5MmrYM/2QvxafIs=;
        b=dgq6O59wi5Y+WWE1ipZbc5pgbf9qBCAoZh7bRG6hnKFT54cnmn3q+VNLvrO2CrXGx2
         0P8zan3yQ/mEo7Yva3ICpK4rLIRU35fo/IaYoogb93Hteen8CZ5sYZ8evAzJorpmlj/Z
         sXwEF5zZVIgpWhtH1S6O7gWldE0iFviujigXJ8TLgJ4l90sCSilqkW3fEx9hrq5Xbjwx
         EdXbJNMVYyLIgWOI0l/FXZB0Gu88Cb0pJtPLqO0d494+wJYiNcbYvpOUIBVwEWNRvC61
         49X5bfHMEp+tKFWt8m45VFribaNeEV5KCrXzPTq2fp6RXJevQM/1cIq0R2Gk1XB/4JNu
         UhQQ==
X-Gm-Message-State: ANhLgQ3hbACVlRPOks4Xk49Intgx3TOPvGr3UQnyp5ph9+xoj7nVyF0N
        6akUKM8Oa6MjyyC1EAr3yA==
X-Google-Smtp-Source: ADFU+vtgcYVuJTNmsDp6or+nYg6nhWTDc+Rs/i0JWWu7H1wds1V1X0/hmCpu4JSt66QSVVmXpfJv+w==
X-Received: by 2002:aca:c709:: with SMTP id x9mr609649oif.130.1583192425557;
        Mon, 02 Mar 2020 15:40:25 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j4sm3556682otr.30.2020.03.02.15.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 15:40:24 -0800 (PST)
Received: (nullmailer pid 20489 invoked by uid 1000);
        Mon, 02 Mar 2020 23:40:22 -0000
Date:   Mon, 2 Mar 2020 17:40:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        rdunlap@infradead.org, dri-devel@lists.freedesktop.org,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        linux-clk@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>, wens@csie.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sean.wang@mediatek.com, frank-w@public-files.de,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
        Matthias Brugger <mbrugger@suse.com>,
        linux-arm-kernel@lists.infradead.org,
        Richard Fontana <rfontana@redhat.com>,
        linux-kernel@vger.kernel.org, matthias.bgg@kernel.org,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v11 2/5] dt-bindings: mediatek: Update mmsys binding to
 reflect it is a system controller
Message-ID: <20200302234022.GA20424@bogus>
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302110128.2664251-3-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon,  2 Mar 2020 12:01:25 +0100, Enric Balletbo i Serra wrote:
> The mmsys system controller is not only a pure clock controller, so
> update the binding documentation to reflect that apart from providing
> clocks, it also provides routing and miscellaneous control registers.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
> 
> Changes in v11: None
> Changes in v10:
> - Update the binding documentation for the mmsys system controller.
> 
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> 
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
