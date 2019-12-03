Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7645F11202E
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 00:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbfLCXV4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 18:21:56 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37548 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfLCXV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Dec 2019 18:21:56 -0500
Received: by mail-oi1-f195.google.com with SMTP id x195so5069954oix.4;
        Tue, 03 Dec 2019 15:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nMoneiSilSnMDAbib3HTPfNytbUoEIQhC55SIxPHfWo=;
        b=h9PVpFPxygnSF/dDhTrp9M3A0hbkLuX1BtJGkiEYFf7tto21h/HvfXNogZHziWUTd3
         UNGWqJVIOKzNGScYkajZYtxj934CFTMORDPJe96gcEWfdNH0tDChlRGHv4uvaSQHfElO
         UOAPVaDdf8M28Psjd5GJkkFRkP7XjIgrElD3HAbyXme31wbXiD0g7AK5ZWLgUoUu3/Sx
         iY5AcNKN9+xRzBzVBar1pLRQjq1I6mQ0yfC89mT3RTjuWnhlMMOMRHjp+6j9naiIctHp
         mwUdSCBM4LQNQw3vWKdrXgd27cgHIdnZws4u1uige2U66hChfOYLiCpKNqgW0Pcza80f
         1W9g==
X-Gm-Message-State: APjAAAUlX+MtRkzzHBWwGIh7ukoGEre63ayKhZEyg6FhA/eF/D1ddfWj
        T+lQV68YO7R1cScijXSD/4Dc7LA=
X-Google-Smtp-Source: APXvYqxhJhXJgEJMEk2ZIIIiqHXpmLaxsyVuFCtJzAYqTceER890+3dVIzoDW5VvmDJXBeM3+0mf1A==
X-Received: by 2002:aca:a811:: with SMTP id r17mr129440oie.59.1575415315572;
        Tue, 03 Dec 2019 15:21:55 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g203sm1336799oib.17.2019.12.03.15.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 15:21:55 -0800 (PST)
Date:   Tue, 3 Dec 2019 17:21:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     mjourdan@baylibre.com, devicetree@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: amlogic,vdec: convert to yaml
Message-ID: <20191203232154.GA12580@bogus>
References: <20191120111430.29552-1-narmstrong@baylibre.com>
 <20191120111430.29552-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120111430.29552-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 20 Nov 2019 12:14:27 +0100, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic Video Controller over to YAML schemas.
> 
> This yaml bindings will then be extended to support new SoCs.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/media/amlogic,gx-vdec.yaml       | 107 ++++++++++++++++++
>  .../bindings/media/amlogic,vdec.txt           |  72 ------------
>  2 files changed, 107 insertions(+), 72 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
