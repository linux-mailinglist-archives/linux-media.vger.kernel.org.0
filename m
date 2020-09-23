Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1EF275C10
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 17:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgIWPix (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 11:38:53 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33829 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbgIWPix (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 11:38:53 -0400
Received: by mail-io1-f66.google.com with SMTP id m17so24245341ioo.1;
        Wed, 23 Sep 2020 08:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ysCpx9pUUcz0KZte0FR3aV5ITFXG37+Rp3i9KP/L4TI=;
        b=ufpX9ZJOd6N8tq1O92vjGkFMhcR4gypPqnAxkDzYpAlrBNfyhqVxdw5oAzlOeTt+Yg
         oMtVSsbMFAQKAndby2iDOyAYSFyzdHSW8gLtLhgV90Nbv4pYzoC5wetS+xCEG5+XoWij
         LqyD4HVPJ9H5xxTkp/u4EgBUrFLDBMch8VG2q9kq3QmqsDzKzI5zUbN0rJ86ENnb28yd
         9A/nbglr9r7uMBNde6s53fTtxnQlqs79ouSJtmtVZYq5MLaigFwh3WRGZShCTPitvZBu
         2e6yLbmUv3FpdS+K5gXWxcDLvoD7oh4fhsEKxvwmIQ7tzQyVkk4SnT0jrmCp1GT/VplW
         IGrg==
X-Gm-Message-State: AOAM532QlHOuseWpe3L2oqOZxVjvcW0IPp1qtdAtMAQ+LD2bfDcFlu5J
        xwzhoWoVrAJ+qMT+m/Ic9Q==
X-Google-Smtp-Source: ABdhPJznu/p3EAh6RkBatd0VNA7uYjMa7oLDfzGLVSOz2TUSk3ngY0iNOOAK8ct6BiSO5LB6Fy/w1Q==
X-Received: by 2002:a05:6602:21cd:: with SMTP id c13mr120017ioc.54.1600875532135;
        Wed, 23 Sep 2020 08:38:52 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 64sm5258ilv.0.2020.09.23.08.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 08:38:51 -0700 (PDT)
Received: (nullmailer pid 797169 invoked by uid 1000);
        Wed, 23 Sep 2020 15:38:50 -0000
Date:   Wed, 23 Sep 2020 09:38:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: dt-bindings: media: renesas,drif: Add
 r8a77990 support
Message-ID: <20200923153850.GA797140@bogus>
References: <20200916105949.24858-1-fabrizio.castro.jz@renesas.com>
 <20200916105949.24858-4-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916105949.24858-4-fabrizio.castro.jz@renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 16 Sep 2020 11:59:49 +0100, Fabrizio Castro wrote:
> The r8a77990 (a.k.a. R-Car E3) device tree schema is
> compatible with R-Car H3 and M3-W schema.
> 
> Document r8a77990 support within renesas,drif.yaml.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v1->v2:
> * No change
> 
>  Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
