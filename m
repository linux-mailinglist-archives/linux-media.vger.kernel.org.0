Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3276B1E6D25
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 23:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407554AbgE1VFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 17:05:34 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:35624 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407445AbgE1VF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 17:05:27 -0400
Received: by mail-il1-f196.google.com with SMTP id a14so397268ilk.2;
        Thu, 28 May 2020 14:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hk4Dv3GPLQpOdrZKF0P13wwN6w2ZLeEznW43zeiADx0=;
        b=fjpS3skOtvYvZrUYU1asabfoO2BkMbH2O/UaJA78/IXApBZk/6klUJZf9lbL4ADui8
         ojChXeKPZd/zOGPvt1ZuU3uWfMjj+DbcDiX9TcI/DMUqKnw6wASU2g7HwZs+ppIFoIJ9
         0S/RfeSXrfZ3SWx8bX6ameYctn/3E/2wlmsPkbcfffJ3R5kXIpgLfARStMebbC3gJAUG
         IGz+7Rk8KW7hYBn+4nlCVpLZaYHYcnsqBVTZ9NGW6GkNeOsEg038A9akM+L3vt59Lbz8
         BaN9uJD1fLIsCj8RZ7imnQ99ajQXbok5nEo+krMsQbTBmRydWzEz6b4kJCAoG0Vcnkxp
         lr7w==
X-Gm-Message-State: AOAM531a9YwC9mNU/zMV0Gs8bC6JjspYh4WEgvMKyzMPvL9VN1tYVUk4
        K2xLqwxf58duJdF9bnEP1Q==
X-Google-Smtp-Source: ABdhPJz3sDumZpFFAsFr3f0K4Ivu0qZ0d2FIwN8qvSWZuZrkItYZtK69n6KFlLSaN4wGevCkuCX91Q==
X-Received: by 2002:a05:6e02:dd3:: with SMTP id l19mr4201718ilj.154.1590699926818;
        Thu, 28 May 2020 14:05:26 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f12sm3025468ioj.26.2020.05.28.14.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:05:26 -0700 (PDT)
Received: (nullmailer pid 680799 invoked by uid 1000);
        Thu, 28 May 2020 21:05:24 -0000
Date:   Thu, 28 May 2020 15:05:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: Add missing clock domain description
Message-ID: <20200528210524.GA669520@bogus>
References: <20200519074229.22308-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519074229.22308-1-geert+renesas@glider.be>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 19, 2020 at 09:42:29AM +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm/boot/dts/r7s72100-genmai.dt.yaml: camera@e8210000: 'clocks', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fix this by documenting the missing properties.
> Update the example to match reality.
> 
> Fixes: 7f464532b05dadc8 ("dt-bindings: Add missing 'additionalProperties: false'")

The above is not a error in this commit. It just exposed an error in 
the binding. So I don't think Fixes is appropriate. I'll drop when 
applying.

> Fixes: 58361eaa11d561f3 ("dt-bindings: media: renesas,ceu: Convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/media/renesas,ceu.yaml        | 11 +++++++++++
>  1 file changed, 11 insertions(+)
