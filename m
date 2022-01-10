Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50EA148A11E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 21:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343528AbiAJUrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 15:47:09 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:38596 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239437AbiAJUrJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 15:47:09 -0500
Received: by mail-ot1-f41.google.com with SMTP id r7-20020a05683001c700b005906f5b0969so16414905ota.5;
        Mon, 10 Jan 2022 12:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Aujx0enqwMGbtkWJK2CD58Y8qDPkeXpEwvKKVBnt4A=;
        b=SXwqaby61j9Bo9uPxVyrCYWQGImpCfFNEko+eqpzR8BWtgUt8RtoOUg2FvEEdR4mRI
         RKkiVFhhPlgPvA+RzojPPlLYCQ+4CT9EcTNIOlKLTUMVM2bvKLOEMLUo8qDpOeX3laFL
         eXADP9wBAD4ZlWd5gZvvb65fBXbhV+kfHtUbwuKh+ChYLOVwcNIQkU/6dB5+AtuRPGgO
         GIQeGOieo8HBBsGgNueTGLBQYUN7e0hnnyGeI2H6Cz1LYQR+kbBkSmbekGelf/MSqMLH
         JdZSs973Y1/pe8fwy8ReEZxpaw7rERRhGlMN48Cj3KMeq5UHZAg8XLkK0i55fWNpv14T
         T4TQ==
X-Gm-Message-State: AOAM530/S1MSHb3x5GQcg4KSzIL5Ya71yMcLP5J4wf14Vp1wUBphboQr
        Sw7YlsxL4NZPBEKBgJdL3WpLtaqyBQ==
X-Google-Smtp-Source: ABdhPJweTugUTZTWFKsnwwOHenTDH+rCLYdDRLCjd5s8zO/W8wDgKGjNJJ9qKvMaZeUxqGV5BExqfA==
X-Received: by 2002:a9d:d08:: with SMTP id 8mr1233313oti.334.1641847628466;
        Mon, 10 Jan 2022 12:47:08 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u75sm1331985oie.34.2022.01.10.12.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 12:47:07 -0800 (PST)
Received: (nullmailer pid 1478298 invoked by uid 1000);
        Mon, 10 Jan 2022 20:47:06 -0000
Date:   Mon, 10 Jan 2022 14:47:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        Thomas Nizan <tnizan@witekio.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: media: i2c: max9286: Add support
 for per-port supplies
Message-ID: <YdybSgL0CdiZgRpI@robh.at.kernel.org>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220101182806.19311-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 01 Jan 2022 20:27:56 +0200, Laurent Pinchart wrote:
> Power supplies for the ports can be controlled per port depending on the
> hardware design. Support per-port supplies in the DT bindings, mutually
> exclusive with the global supply.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Simplify mutual exclusion condition
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml          | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
