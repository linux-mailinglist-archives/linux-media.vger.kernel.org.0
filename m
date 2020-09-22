Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1895C274CFE
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 01:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgIVXA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 19:00:27 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39991 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIVXA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 19:00:27 -0400
Received: by mail-io1-f66.google.com with SMTP id j2so21556626ioj.7;
        Tue, 22 Sep 2020 16:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RVMguUIzmTtaxt/UzDSsjScytUJaBesIrEnv/YQ+RmI=;
        b=ZzXR5/Z4ACK66TNrVddy75qOjLkOq1qoe68axTotW5sUyo/DoTiOWPCjIetiLiqgDq
         sGzbG8zeJdi3Yz2Mk8fawNuhh9d13nxIy2c1nxX7MGQ+b1qAsjNTuBDHRRHK8zzKGn8/
         3+ka3Xt80cXkH9w3UL8JbqXhd5PMhv0BkQtG0hbuA4zssn44VLOUF7rU053C9cLjS3yV
         LrSGspVs3y0AP93cMn2Vc/UmrlF5N6CaBjPdSE7iJQh2ldzwA0uprQrsG/as0IwcfUjq
         diclh3p94/nPpsHbVPAM3f0wp4m9vjNvRv2/RrurOO+A+au07YYhOvcHMxgDQMR/pX5F
         WBqg==
X-Gm-Message-State: AOAM532LJnM4pqb7tAG7bfSztohvhK9F60oZlKpW/p4ckrV6Qr7pybFo
        tDqqFE4m0bmPXn/G0JlZpw==
X-Google-Smtp-Source: ABdhPJz26l6SojL0Zz2qL3wOe+3ynhmyzZn2NCaiBJEE5oKVykLJ0KiIKrfvPkaL31K0xDj2zzRltg==
X-Received: by 2002:a05:6602:2043:: with SMTP id z3mr5017770iod.93.1600815626986;
        Tue, 22 Sep 2020 16:00:26 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l6sm1841382ils.6.2020.09.22.16.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 16:00:26 -0700 (PDT)
Received: (nullmailer pid 3424647 invoked by uid 1000);
        Tue, 22 Sep 2020 23:00:25 -0000
Date:   Tue, 22 Sep 2020 17:00:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martin Cerveny <m.cerveny@computer.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: sram: allwinner,
 sun4i-a10-system-control: Add V3s compatibles
Message-ID: <20200922230025.GA3424613@bogus>
References: <20200912143052.30952-1-m.cerveny@computer.org>
 <20200912143052.30952-3-m.cerveny@computer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200912143052.30952-3-m.cerveny@computer.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 12 Sep 2020 16:30:48 +0200, Martin Cerveny wrote:
> Allwinner V3s has system control similar to that in H3.
> Add compatibles for system control with SRAM C1 region.
> 
> Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
> ---
>  .../bindings/sram/allwinner,sun4i-a10-system-control.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
