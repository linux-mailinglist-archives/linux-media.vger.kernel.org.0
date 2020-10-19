Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37AAC293012
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 22:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731811AbgJSUtZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 16:49:25 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42987 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727723AbgJSUtZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 16:49:25 -0400
Received: by mail-ot1-f67.google.com with SMTP id h62so1052386oth.9;
        Mon, 19 Oct 2020 13:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VF8WhyOYxc6TogxeINHMmYzt1J7GZgkJjEGtMkCxL0s=;
        b=kFWwECKoOgax1l+C/pIqggrq5da9fo2HUVa4A8jyEqqmmivkkxF+hD/kfBxISfE7dT
         qidv+T68p+tBM0ibX2WLiFHzN6wh1hZtUkRkKUjKsX3wMro0yhVFfGnFGQi6HIB5b0BP
         ZH/xmNeoj19x8U+C3Z/516t7ZSi4Hfq5XSBNN9g9HPhAOEzoBeD4zLh747vDnrjCCiR4
         If35UpWPJxcJjRm7TgkwYuNbFhBBgLIuuuwkC7ASmrjxfb4sdMumK6y0gSwkmHJwcjlt
         p5u3WMA/b13ZodDyHGQ8XE+s1BsLqIS1/bN2STLVlmJfZwfiz9hSKQfbP3+xxFqLOGbq
         uNVA==
X-Gm-Message-State: AOAM531snPJglXGYbyV7L5xtyi5347Wd0WcVd9Uj+IqKnlesI2e1mbwI
        CKlKPE432CN6XMoLow8zEQXF6bLtYg==
X-Google-Smtp-Source: ABdhPJzZxIr6EV5zzMSKx7mzxwW0uKsXstbfyfnAtrTiSwNA3TVRZvQdOp3Gaeb64pihflei2otyPQ==
X-Received: by 2002:a9d:6e17:: with SMTP id e23mr1207141otr.354.1603140564245;
        Mon, 19 Oct 2020 13:49:24 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l184sm300548ooc.10.2020.10.19.13.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:49:23 -0700 (PDT)
Received: (nullmailer pid 3579377 invoked by uid 1000);
        Mon, 19 Oct 2020 20:49:22 -0000
Date:   Mon, 19 Oct 2020 15:49:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/5] media: dt-bindings: media: renesas,drif: Add
 r8a77965 support
Message-ID: <20201019204922.GA3579303@bogus>
References: <20201014155719.15120-1-fabrizio.castro.jz@renesas.com>
 <20201014155719.15120-5-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014155719.15120-5-fabrizio.castro.jz@renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 14 Oct 2020 16:57:18 +0100, Fabrizio Castro wrote:
> The r8a77965 (a.k.a. R-Car M3-N) device tree schema is
> compatible with the already documented R-Car Gen3 devices.
> 
> Document r8a77965 support within renesas,drif.yaml.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> * No change
> v2->v3:
> * New patch
> 
>  Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
