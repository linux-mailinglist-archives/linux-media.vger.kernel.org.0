Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CFF2F7FF5
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 16:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbhAOPq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 10:46:27 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:33981 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbhAOPq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 10:46:26 -0500
Received: by mail-ot1-f52.google.com with SMTP id a109so8949722otc.1;
        Fri, 15 Jan 2021 07:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CAVo+erasOTevyP/72Qi2ybUcxE9hqUJxgq3h+H1dpA=;
        b=Ttgv3Ahqo4mCztAZXhb0eEtPzr1EjQQH56CVF0pCPkw4K6x3JlaA8keRzO9i8sZk76
         WCbiUqIreO2izMep48IopDMpXfTK82mWJI4882NUk+QWUubo/a5N5nFGOizX3NdHQITt
         DdqgDxBAifZYZqr4y6aOU872kvZR2plBx5tpVGEzjhXhiTu4oLDilakNf120HVvpFd8S
         Dv0adBFZMMDNAZ3JAEqkjh2SArHtYpFoQiY3dYZgUSWnkaG9reltxwqMXeejXiiEtueI
         +RsNVf8l+2JQU9+iumOrCb4nPO7tRcNcNzxP0tCXdYj5iyu/pNZFSimoay6KDCvTta58
         F2cA==
X-Gm-Message-State: AOAM532M5QXjOrJ7m7L86qRPMYS3E49RLffTNXw68plx95ys3uWpdL8H
        AnZDP0gnssPrH/SoUvGB7sbQxM0A/A==
X-Google-Smtp-Source: ABdhPJwLrd6B6y7mp+t0817rPMZ2yAaOp4E8lU0oG+WhJxaPnixXpus0itdgsRCFCCJ0n1sM0pMDew==
X-Received: by 2002:a9d:3ef6:: with SMTP id b109mr8838462otc.288.1610725545186;
        Fri, 15 Jan 2021 07:45:45 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s23sm1888422oot.0.2021.01.15.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:45:44 -0800 (PST)
Received: (nullmailer pid 1322391 invoked by uid 1000);
        Fri, 15 Jan 2021 15:45:43 -0000
Date:   Fri, 15 Jan 2021 09:45:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: ov5647: Fix filename
Message-ID: <20210115154543.GA1320747@robh.at.kernel.org>
References: <20210115101652.9275-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115101652.9275-1-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 15, 2021 at 11:16:52AM +0100, Jacopo Mondi wrote:
> Commit 1b5071af8240 ("media: dt-bindings: media: i2c: Rename
> ov5647.yaml") renamed the bindings file but did not update the
> Id: field there.
> 
> Fix it by using the new filename.
> 
> Fixes: 1b5071af8240 ("media: dt-bindings: media: i2c: Rename ov5647.yaml")
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> index 280c62afae13..429566c9ee1d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/i2c/ov5647.yaml#
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5647.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>  title: Omnivision OV5647 raw image sensor
> --
> 2.29.2
> 
