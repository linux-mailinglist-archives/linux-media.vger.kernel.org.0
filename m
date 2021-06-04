Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5D739C285
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 23:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFDVgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 17:36:00 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:44628 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhFDVgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 17:36:00 -0400
Received: by mail-ot1-f49.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so10422232otp.11;
        Fri, 04 Jun 2021 14:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dEJoty3AiDKfWsDUJh2H2XJ9ltcF0LnUfki6o6j+39s=;
        b=gwZLXplQqwbNpl6NvRyEGjlxZP7cI1oxWwvtKcCBt5K2mjPMOuEpPL/KdvuFQ8MFN8
         H34I0/0VOYGQYGVUn/rfuoKSLyCEMnclkcmhfi2H9YrWVqgjWQdvEdLiiabXVOM9ubHR
         zoXKyUtk+qR6fdSnLcGIIzPFtz4cR/PmRWF5uh3tAHYKQLIbyZHzC2Oa0M9IoLuMeieq
         hJ0I6Ezu1xsO9kDOBmBqtmE2yBq853jYfgnb+QMU19d/j4V2cqfhDs4KoxBVc/z1ZelQ
         eAloETPq1I3p5et/luaGAGZfAPM4CKkLDpi31K11oKxz86wntxDw1T5D7wOEnsyrbOO+
         ZR2g==
X-Gm-Message-State: AOAM533hnIgckElIS6U3I2ig2tQycoUqBCkpCgFF05CIyzcGTNEkTLXs
        F14CKNfKUL3YzBCfGeI/Yg==
X-Google-Smtp-Source: ABdhPJzSC3mi3llaf70uP1xO7iKhAObZ6o3Ma+yOmRtNm7N1HP2t9yi0qLSDeVcn2byqeVz2kwwULQ==
X-Received: by 2002:a05:6830:410d:: with SMTP id w13mr5219566ott.173.1622842439748;
        Fri, 04 Jun 2021 14:33:59 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x8sm689790oiv.51.2021.06.04.14.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:33:59 -0700 (PDT)
Received: (nullmailer pid 3960127 invoked by uid 1000);
        Fri, 04 Jun 2021 21:33:57 -0000
Date:   Fri, 4 Jun 2021 16:33:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     niklas.soderlund@ragnatech.se, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, robh+dt@kernel.org, lars@metafoo.de,
        tharvey@gateworks.com, devicetree@vger.kernel.org,
        frieder.schrempf@kontron.de
Subject: Re: [PATCH v2 1/3] dt-bindings: adv7180: Introduce the 'reset-gpios'
 property
Message-ID: <20210604213357.GA3960076@robh.at.kernel.org>
References: <20210531112237.706063-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531112237.706063-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 31 May 2021 08:22:35 -0300, Fabio Estevam wrote:
> Introduce the 'reset-gpios' property to describe the GPIO that connects
> to the ADV7180 reset pin.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - None
> 
>  Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
