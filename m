Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3284A413C79
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 23:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235209AbhIUVct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 17:32:49 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:40855 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233068AbhIUVcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 17:32:48 -0400
Received: by mail-ot1-f45.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so447527otq.7;
        Tue, 21 Sep 2021 14:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4HRlaxqi3DKlxy+NTO/40GEg0kbUa1ldA49zM9cQTRQ=;
        b=fGFgYkvbcHA+mNhhdUPExA10S9E0qtZ8RQLIt3FEdj4Is/pmF1OewcIELi2y1+S3Ci
         jDf9f8+XLWltYmv+mJM1n8jWoDat1il1Lt7r+fHRAHVZJS/+h7P1J2iKWLOraz2QCvva
         l3tShB+SAXiV/8mBh0fNHmzfekPGBGyyMZO2prBM3t936D9hmKOYyJsXqgzMNlxdXlrg
         Tqd26upekgXmcxo7WHUlTTmxRInm87UlMZ9VuU5vi67EOb4DGYJEs1nW0Jok4/7bIeye
         FENC3w7xcCgEoNlKVN4wh/XYiJMePnaw1RuZ9D39st4I6EgwOwy7wrqFdz8ygG8xJcYO
         gIag==
X-Gm-Message-State: AOAM533d9T2EZqyRUNpqRFPlEIKGa7+6pu771Pcg+4G4pStsEiPTieoP
        6uRkwv2PuyKIhY8uJfIirkV/5jr9jQ==
X-Google-Smtp-Source: ABdhPJza/iHBMISsz4PLbLLbXK2hUNYT8aUNrYifa5omZRW5OKvtS7W4CI0VgDjX28hkTRbp20QCWg==
X-Received: by 2002:a05:6830:4389:: with SMTP id s9mr27631638otv.138.1632259879149;
        Tue, 21 Sep 2021 14:31:19 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id i1sm57858ooo.15.2021.09.21.14.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:31:18 -0700 (PDT)
Received: (nullmailer pid 3357603 invoked by uid 1000);
        Tue, 21 Sep 2021 21:31:17 -0000
Date:   Tue, 21 Sep 2021 16:31:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Nikhil Devshatwar <nikhil.nd@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Benoit Parrot <bparrot@ti.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 09/11] media: dt-bindings: Make sure items in
 data-lanes are unique
Message-ID: <YUpPJTrSsWdi/T/i@robh.at.kernel.org>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-10-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-10-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 15 Sep 2021 17:32:38 +0530, Pratyush Yadav wrote:
> The data-lanes property maps the logical lane numbers to the physical
> lane numbers. The position of an entry is the logical lane number and
> its value is the physical lane number. Since one physical lane can only
> map to one logical lane, no number in the list should repeat. Add the
> uniqueItems constraint on the property to enforce this.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v4:
> - New in v4.
> 
>  Documentation/devicetree/bindings/media/video-interfaces.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
