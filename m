Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE1D21E442
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 02:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgGNACe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 20:02:34 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:34051 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGNACe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 20:02:34 -0400
Received: by mail-il1-f194.google.com with SMTP id t4so12806522iln.1;
        Mon, 13 Jul 2020 17:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HdkxFP6RySWIBJNgeXU3DOswKHXBO1oVzLiJk/Yo1J0=;
        b=WT8JCUECHiIUGuhoyefJdgx9fpZwg90n998//5BzZ66RyQWTheGUE5Mm0MuCbHsuU0
         PGgI480J9PmB+PEiC3AgclkMGrkXcbJNJQ+h4XkAUKmEpyUVxTN3491q4AP/Lts82yYq
         MP2YbbxUrXoh/I4KFeMIQ3GfCjIQmUVmh4QkRWXhsoisaR1SGkNF+Qlvsb9ypulaZhBK
         Pds2HuUoil561jAM4NlOWRgjtxAVRPp1rh9lqO3ruq/K36Hbfut5VPo9fYQbq30Triuw
         s4fW+Gq0K8DoLhCbBtQc85AUhRxMzHbULXW2bHrR9ojqEWxBJeMclLWd2EVwIexbGLWo
         wkqw==
X-Gm-Message-State: AOAM533LQvV7qO6nU1vx4TV7GAktrhJPPqi26ffxQFR5GP/vkS94KcSZ
        uuXNNgyc8kfZMAphRW3sUw==
X-Google-Smtp-Source: ABdhPJzkMFBVjplcCCONjH2uvM40l21gPZTa/5pBmaoQH0Y0NKi5HsLtcSW8OLDgOWsaAs0rVbPE3A==
X-Received: by 2002:a05:6e02:48b:: with SMTP id b11mr2345337ils.87.1594684953219;
        Mon, 13 Jul 2020 17:02:33 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id q5sm9071188ilm.73.2020.07.13.17.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 17:02:32 -0700 (PDT)
Received: (nullmailer pid 966436 invoked by uid 1000);
        Tue, 14 Jul 2020 00:02:31 -0000
Date:   Mon, 13 Jul 2020 18:02:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 8/8] dt-bindings: media: renesas, vsp1: Add
 power-domains and resets
Message-ID: <20200714000231.GA966388@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-9-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-9-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 21 Jun 2020 03:47:34 +0300, Laurent Pinchart wrote:
> The power-domains and resets properties are used in all DT sources in
> the kernel but are absent from the bindings. Document them and make them
> mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/media/renesas,vsp1.yaml    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
