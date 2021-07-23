Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73DCF3D42FD
	for <lists+linux-media@lfdr.de>; Sat, 24 Jul 2021 00:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbhGWVyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 17:54:40 -0400
Received: from mail-il1-f173.google.com ([209.85.166.173]:38405 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhGWVyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 17:54:39 -0400
Received: by mail-il1-f173.google.com with SMTP id h18so2932086ilc.5;
        Fri, 23 Jul 2021 15:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qQxdLWyho3xwmuPp6KfF8mLtCmH5RhCLEXgrlUIh/L4=;
        b=H4ypIUhj7MlTM59SbeUerL+Z+usfCzsHARrxvGI6jc15ERz8WafQbdXPkBx0kGdXLZ
         UvuopZ18GQB0jjbYr/BxoHEk8T6H5JPqhiHYDabBQq18Dn1Mw6sF6j6z65Yky/jwcuR2
         uyhQTn1hMfs2TWGKUmadoOzOPtGXMF3HdM9WCbg2DFXJ03RLxuf2ou9FKH+kz+JgDSkZ
         y4YVjFzJYmEV5BvNy1tXwyxQr4nVGe++4C2Bifx4kSakvP3B1ZMNm3k91v6bv9jlrs3p
         REAd4IjdVnXrsVGK6ZMw0LIPVpncxBRsVeMfY0sVJH2GPe7kt8vnw0egPyGyO0XLiRtY
         Uliw==
X-Gm-Message-State: AOAM533zEwRQcLmfFLU7puEyfbrXuoM2UJ2bPOXDD3O6OkrdEIgN4fhc
        9jFUzT+KQkRS9a6pUMLdHcwJz4dRMA==
X-Google-Smtp-Source: ABdhPJwnp4BikKGksewDt2ZQql8uFbKwYjGumMljGC6abLtrr1kYbw/PexQnnWka1sOkOVsA94jrDg==
X-Received: by 2002:a92:505:: with SMTP id q5mr4606791ile.139.1627079711667;
        Fri, 23 Jul 2021 15:35:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k4sm5340302ilu.67.2021.07.23.15.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 15:35:11 -0700 (PDT)
Received: (nullmailer pid 2726106 invoked by uid 1000);
        Fri, 23 Jul 2021 22:35:08 -0000
Date:   Fri, 23 Jul 2021 16:35:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc:     linux-media@vger.kernel.org, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
        rockosov@gmail.com, narmstrong@baylibre.com,
        devicetree@vger.kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, sean@mess.org,
        mchehab@kernel.org
Subject: Re: [PATCH v7 1/2] media: rc: meson-ir-tx: document device tree
 bindings
Message-ID: <20210723223508.GA2726071@robh.at.kernel.org>
References: <20210719170506.13539-1-viktor.prutyanov@phystech.edu>
 <20210719170506.13539-2-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719170506.13539-2-viktor.prutyanov@phystech.edu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 19 Jul 2021 20:05:05 +0300, Viktor Prutyanov wrote:
> This patch adds binding documentation for the IR transmitter
> available in Amlogic Meson SoCs.
> 
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>  changes in v7:
>   - fifo-threshold property removed
> 
>  .../bindings/media/amlogic,meson-ir-tx.yaml   | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
