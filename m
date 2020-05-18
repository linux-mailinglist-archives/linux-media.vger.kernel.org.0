Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1E51D7AD4
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 16:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgEROPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 10:15:47 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:37268 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgEROPr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 10:15:47 -0400
Received: by mail-il1-f195.google.com with SMTP id n11so9976723ilj.4;
        Mon, 18 May 2020 07:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NiavkdLPqGu3sdeEgEzastsxcKs5S9EbJ8pP8VASFE0=;
        b=Bk4QBE5MIBwTJ2m0hR0qL4XZyrBXuCpK9loj3X+4GAxsq07UOMIkBLp49a2wt7A/rj
         JIA5/oz+mQomLz+MXuJMPkYMSnRwu97PehVqbCDocAc4DBBV7sn2OO5BfBaX4y4UVPk3
         +ORY+7CnmGfaJXNbI2PQqIUO2mvBpVDddlOEIxUUftha29ckkxaGqK4Km2P7ntGWVpD3
         NoYWPjkIZ2mAtTaDzso3/vmdAme4YKQ0H8HO4WdpDhtoe4f9x660E8kdJta1dXGN+2Hw
         pHomSbdo9rCr4Fq8r3qE6z1vY3RFEQuuFsWAgnlihlmrfWnyp0ESmK1LiJ4it7y8TMNp
         jh+A==
X-Gm-Message-State: AOAM5306q5OT74+5Lcb9nHqBmmrgBsbprGtgEYJABVj+TFECMDzodET/
        KlsEBCz84Y0CVc+NLGm0SfpPQRM=
X-Google-Smtp-Source: ABdhPJyWaai1niB/pKI4PDVBUgD6yt6JC62eo2eqfl9jOjznl2OcupHi7LxCPkiaQa7lqygnSoUx+g==
X-Received: by 2002:a92:8415:: with SMTP id l21mr15997886ild.214.1589811346565;
        Mon, 18 May 2020 07:15:46 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id i27sm495013ilf.79.2020.05.18.07.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:15:45 -0700 (PDT)
Received: (nullmailer pid 32260 invoked by uid 1000);
        Mon, 18 May 2020 14:15:44 -0000
Date:   Mon, 18 May 2020 08:15:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff Chase <jnchase@google.com>
Cc:     robh+dt@kernel.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: Add ch7322 media i2c device
Message-ID: <20200518141544.GA31928@bogus>
References: <20200515025159.101081-1-jnchase@google.com>
 <20200515025159.101081-2-jnchase@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515025159.101081-2-jnchase@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 14 May 2020 22:51:58 -0400, Jeff Chase wrote:
> The ch7322 is a Chrontel CEC controller.
> 
> Signed-off-by: Jeff Chase <jnchase@google.com>
> ---
>  .../bindings/media/i2c/chrontel,ch7322.yaml   | 65 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  MAINTAINERS                                   |  7 ++
>  3 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/media/i2c/chrontel,ch7322.yaml#

See https://patchwork.ozlabs.org/patch/1290799

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

