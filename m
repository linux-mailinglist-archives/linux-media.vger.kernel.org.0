Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7939F2852AA
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 21:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgJFTuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 15:50:13 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44187 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgJFTuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 15:50:12 -0400
Received: by mail-ot1-f66.google.com with SMTP id a2so13417059otr.11;
        Tue, 06 Oct 2020 12:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C2VdEx1qgxUjYGallz1CvIXMTJLqrZbwLPUfqsl53aQ=;
        b=a+AyPfswJlYnGWV1ExdT1LksSLDpFgyTlY1iLuPvMtcI6EiBw9UlyO4jdx5SJ8GAT9
         Jhhm+9Q6OpaZkWR0cqQszhwiGJJH8I/ngklK/cF8+zPpgVoB9MHZ0L2e31+Q+JcS5bXf
         6w0/5Yl0oAStLMuJxjbODN5gm7oLe15TZBjBj0NSgpkLkmrAAgromBUdwgotlXA9kWp5
         75s7/2SgtLaT8S3YtdtsBiGYloTyVUVYdyhh/yuStD2YCCg1m0BpHg0OLbPMCfmYvkDZ
         71+tdIAkSe9wJtizzQiSE7C1UyNnJUpqCjCiSF+yy3t7JnELlpDAy2sjDHQSZGqFM2n9
         B+6g==
X-Gm-Message-State: AOAM530X+QelDIwR8Jxw1/3CbgPDWJhZ6GzBIXemZHpDm+pCnKSof0Mk
        DSFdiIWI8DKqsEKfGPl7n/zWne34muII
X-Google-Smtp-Source: ABdhPJw9yaRSS5uQ2iC7X/JRpm+DTYvg/NaIxLusFM/1IVfbYNZsG4u4IqxpNqGotE7EhktQ8pW3aA==
X-Received: by 2002:a9d:4cd:: with SMTP id 71mr3745830otm.276.1602013811958;
        Tue, 06 Oct 2020 12:50:11 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r62sm1701429oih.12.2020.10.06.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:50:11 -0700 (PDT)
Received: (nullmailer pid 2720710 invoked by uid 1000);
        Tue, 06 Oct 2020 19:50:10 -0000
Date:   Tue, 6 Oct 2020 14:50:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH 020/100] dt-bindings: Add vendor prefix for MIPI
 Alliance
Message-ID: <20201006195010.GA2718573@bogus>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
 <20200930201914.31377-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930201914.31377-2-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 30, 2020 at 11:19:08PM +0300, Sakari Ailus wrote:
> Add a vendor prefix for MIPI Alliance, Inc.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

I guess based on the irc discussion, this is withdrawn.

> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 63996ab03521..f16b53909e6e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -663,6 +663,8 @@ patternProperties:
>      description: Miniand Tech
>    "^minix,.*":
>      description: MINIX Technology Ltd.
> +  "^mipi,.*":
> +    description: MIPI Alliance, Inc.
>    "^miramems,.*":
>      description: MiraMEMS Sensing Technology Co., Ltd.
>    "^mitsubishi,.*":
> -- 
> 2.27.0
> 
