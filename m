Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 572DA124DF7
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 17:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfLRQjd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 11:39:33 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34469 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbfLRQjd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 11:39:33 -0500
Received: by mail-oi1-f195.google.com with SMTP id l136so1346703oig.1;
        Wed, 18 Dec 2019 08:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gdAO45Po9YuV+XFMQHJe5tneYkfCGzzogZXiqxLk6H0=;
        b=H+s8C/BYvD5ofXpJfcO73xk6E6vQ4zpUV4ZLvbJJn7Af2Mopbap7FG0mU9tCjuXQy4
         x83JSzdmSLClXx6UnBL5iNbS5DtuJf0xRSwRbMqnmcB2F07hEjnIR1//vTrun2NoBqNW
         3TiwnE9jPCwUAKv0+45dnPY2NBNq/pY5RTZaVgZ9jut0RSICNjQ6qZIj6pqG3QIWZBQP
         dkCwKp/owiCjVbt1vlMo+daTkrQD6xVrN3UMywsW1AzRX+3y5RggCni/pVnDkpfvEQNY
         AtUvUakmYThs0tNx8ZstaOmHm8+5MyUIg+Nw0zCQhdxZObEN1IoJwR8QKw4U9+T+gN5g
         CCtA==
X-Gm-Message-State: APjAAAX4nKQ/Jvg2jOn2H93OuCQMFEhr/L4BJm18R9uCtTShVdo7vKAA
        eMgmF6pvEUbreXXVNkVyHQ==
X-Google-Smtp-Source: APXvYqwZzlCoqCU9R29CGoBnW4k+58a6Lpq7/BNdGzEN9RUDeQUc+tVmy/ur9JVEH+3B2/7X2EE1+g==
X-Received: by 2002:aca:cf50:: with SMTP id f77mr932786oig.60.1576687171970;
        Wed, 18 Dec 2019 08:39:31 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x15sm950375otq.30.2019.12.18.08.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 08:39:31 -0800 (PST)
Date:   Wed, 18 Dec 2019 10:39:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     matthias.bgg@kernel.org
Cc:     mark.rutland@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de,
        airlied@linux.ie, mturquette@baylibre.com, sboyd@kernel.org,
        ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com,
        enric.balletbo@collabora.com, sean.wang@mediatek.com,
        sean.wang@kernel.org, rdunlap@infradead.org, wens@csie.org,
        hsinyi@chromium.org, frank-w@public-files.de,
        drinkcat@chromium.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mbrugger@suse.com
Subject: Re: [resend PATCH v6 01/12] dt-bindings: display: mediatek: Add
 mmsys binding description
Message-ID: <20191218163930.GA18363@bogus>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-2-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191207224740.24536-2-matthias.bgg@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Dec 07, 2019 at 11:47:29PM +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The MediaTek DRM has a block called mmsys, which sets
> the routing and enalbes the different blocks.

typo

> This patch adds one line for the mmsys bindings description.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  .../display/mediatek/mediatek,disp.txt        | 28 ++++++++++---------
>  1 file changed, 15 insertions(+), 13 deletions(-)

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>
