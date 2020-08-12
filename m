Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB79E242F06
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 21:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgHLTP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Aug 2020 15:15:58 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38165 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgHLTP6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Aug 2020 15:15:58 -0400
Received: by mail-io1-f66.google.com with SMTP id h4so4242701ioe.5;
        Wed, 12 Aug 2020 12:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6bmFd3LE8loSA5iYwsZ25NXI7nulgcJ7a63PMeV4Enk=;
        b=T1mpUpked1p9tNfUO7Ho0udc5QEOlpQH39dNJVomj2LSaELfFqglSBG+lYxzl4+L1u
         UI3R9LX0SggSpy3AUb4WRjKFwVci/rckwpw4sVfh+YrocxMfIBmM8UB/ROV0TzAWZeh+
         JLqg3Nkw51D+cXxhjMUB4J/mfPwlQi7p5gaM4mG61oaGXKw4zKLRsG+KucnTQU9QKs3A
         iLhbjyoZ58K+knZFy5pbpZBHHbBAXr8FLI1ObMAhdtE4GNFdqqKgQOjI+4V8WXSOdp1s
         DuIcyicMs+kq3NCDwNa9Mwnu/wIDcA3cXIcUKlKAWcei6SkCg+ywuh+12TL9FIQ//Wr0
         ljzQ==
X-Gm-Message-State: AOAM5326EVIqNpxTDy9fJxzqZi52XvIKSX+LRq3FOZ0s3qHF/4IHyAJN
        yLTvkyGH3lB3USiG5CthxysolM0=
X-Google-Smtp-Source: ABdhPJzkhDTUp4fGr5JcbsYvPTSvZvi/175AnF5oJtPz3FsfaL7w+r2SZ9PQIgIgkpvwJ+rK87Tchw==
X-Received: by 2002:a02:3e13:: with SMTP id s19mr993711jas.95.1597259757344;
        Wed, 12 Aug 2020 12:15:57 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x12sm1468420ile.14.2020.08.12.12.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 12:15:56 -0700 (PDT)
Received: (nullmailer pid 2549586 invoked by uid 1000);
        Wed, 12 Aug 2020 19:15:54 -0000
Date:   Wed, 12 Aug 2020 13:15:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, robh+dt@kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: media: ov5647: Document
 clock-noncontinuous
Message-ID: <20200812191554.GA2549533@bogus>
References: <20200810215543.113206-1-jacopo+renesas@jmondi.org>
 <20200810215543.113206-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810215543.113206-4-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 10 Aug 2020 23:55:42 +0200, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo@jmondi.org>
> 
> Document the optional clock-noncontinuous endpoint property that
> allows enabling MIPI CSI-2 non-continuous clock operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5647.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
