Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCFE3C64B9
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236672AbhGLUIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:08:41 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:39445 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbhGLUIk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:08:40 -0400
Received: by mail-io1-f52.google.com with SMTP id h6so24271720iok.6;
        Mon, 12 Jul 2021 13:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hSkemDrItXKnMgWqMMqlby26nSWhNiqnVksd+yGmk6Q=;
        b=PIP6VRia/zs4OHfXgkWEHC5JPHkCvFc8wkOo5fqVf1bHjDSM1XTYwSXvYQYjRv/zKH
         7Jr+r8RXGjWBvK51blhvOba6mPDAsQpL4omU4cIDbymVN8TXEtwWE2S/bCBM3EgSIKPh
         rhYK38KaBq/6pcPm3ETpbzWCOZ4if6CXm5XcEc9u70ETyuoaqkNLwoaYhB8JnAo4OkgP
         XZyvsB2b1kHtAAGCvMFIkxB8JYqmIm9ZnvLHLcnMTYbQnipklZJBUp7sG9d+9emD1mTj
         OptqjXlGoGjV5ehnQaZ8HimWo8w5hoIfxJfU4jaQ3K4sVmrx+7dnQqOsbl4V3arW+629
         Z0iQ==
X-Gm-Message-State: AOAM5325qZ5RMsDSwFXJ60wUFWcKEFldKx7yOJoztg+7+/jebcte4lpa
        XZerAH3tTmWyme1rnpMzqw==
X-Google-Smtp-Source: ABdhPJy/5pOCxcYIQVQY1hSUtcEnec6S1Ig3CVmYMdFZBYL8q6fgOdFo45C8xi+EagDgkPgp4BQoQA==
X-Received: by 2002:a05:6638:348c:: with SMTP id t12mr639166jal.1.1626120351732;
        Mon, 12 Jul 2021 13:05:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g20sm8986263ilk.81.2021.07.12.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:05:51 -0700 (PDT)
Received: (nullmailer pid 2398804 invoked by uid 1000);
        Mon, 12 Jul 2021 20:05:47 -0000
Date:   Mon, 12 Jul 2021 14:05:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        hverkuil-cisco@xs4all.nl, dafna.hirschfeld@collabora.com,
        robh+dt@kernel.org, ezequiel@collabora.com, mchehab@kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 03/10] dt-bindings: media: rkisp1: document different
 irq possibilities
Message-ID: <20210712200547.GA2398747@robh.at.kernel.org>
References: <20210618130238.4171196-1-heiko@sntech.de>
 <20210618130238.4171196-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618130238.4171196-4-heiko@sntech.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 18 Jun 2021 15:02:31 +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Some variants have one irq signaling all of MI, MIPI and ISP events
> while some rkisp1 variants use separate irqs for each.
> 
> Adapt the binding to handle both cases.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  .../bindings/media/rockchip-isp1.yaml         | 45 +++++++++++++------
>  1 file changed, 31 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
