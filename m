Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2248626AE8A
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 22:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgIOUMW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 16:12:22 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:33518 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbgIOUME (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 16:12:04 -0400
Received: by mail-il1-f196.google.com with SMTP id x2so4292377ilm.0;
        Tue, 15 Sep 2020 13:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AiyxLpi/Iqmmwnxk8O+6JfWOo6yTa0l1HQ+P0CDDU94=;
        b=ipp2fs9QHVOheqiSHaYj/2uQhW2LcBofHl16OZnJ6lGr8RWUeZnaXtWOikdPOT7KbF
         uvyiLfcIMKfiC37hl1A/Qmtgc6GY2RPN5NxS/SP5729ZA4/i3kgxqRM8r3GfhzM2eWW5
         629CYqqBec821SE0vGFVWvIOhJU1sZ/KVt8RbP9/P7gkTsb4V5RbsH4EZ4OwG/R5meZY
         gADNimaealzCRcpWsRk/tWdWzQNuBDZlarxcwJcT5s+MJL2/6AnmwZbi5md5r55zYOJ8
         pe34OJ0O+nGIR5VxfilTMW6o3lEFTUSut3GSax1gEDSdFL4+A07FzWGeppbdl1YXZ/6a
         Q/cg==
X-Gm-Message-State: AOAM532c+U7e7yG3ETAhGec3EEDgduNibUOZYoZT2NJnUJWnhr5Q6nIY
        jJeugN3XeE4mmwXhkHrAgw==
X-Google-Smtp-Source: ABdhPJz7ub0ek4UhkXlI4O4Vyla7eaIMyGd1aq18LwwunB96JIZcYVTBAU50yAZfsEZI0yCLVqf5bg==
X-Received: by 2002:a92:7004:: with SMTP id l4mr177657ilc.189.1600200723259;
        Tue, 15 Sep 2020 13:12:03 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 137sm8301419ioc.20.2020.09.15.13.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 13:12:02 -0700 (PDT)
Received: (nullmailer pid 2428141 invoked by uid 1000);
        Tue, 15 Sep 2020 20:12:01 -0000
Date:   Tue, 15 Sep 2020 14:12:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        mchehab@kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v5 3/3] dt-bindings: media: ov772x: Document endpoint
 props
Message-ID: <20200915201201.GA2428103@bogus>
References: <20200910162055.614089-1-jacopo+renesas@jmondi.org>
 <20200910162055.614089-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910162055.614089-4-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 10 Sep 2020 18:20:55 +0200, Jacopo Mondi wrote:
> Document endpoint properties for the parallel bus type and
> add them to the example.
> 
> Specify a few constraints:
> - If the bus type is BT.656 no hsync or vsync polarities can be
>   specified.
> - If the bus width is 10 bits, not data-shift can be applied.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/media/i2c/ovti,ov772x.yaml       | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
