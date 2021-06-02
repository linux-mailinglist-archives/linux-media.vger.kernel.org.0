Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13FB3399376
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 21:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhFBTZ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 15:25:58 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:45816 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhFBTZ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 15:25:56 -0400
Received: by mail-oi1-f178.google.com with SMTP id w127so3724821oig.12;
        Wed, 02 Jun 2021 12:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C5SEbz2r52xsZF4LQJGQ5XCve1taIQ8XIwDj07oOo3Y=;
        b=jarNqrLWjLPlsttDL6APR++AfLktf5maKKrwgh7BUDiOy+HfztbFDjfEGFRChCHSAc
         exRYfJzwbk7p2kbydAEog1lft+1lMIWY4ZanFduurxTDv8xQgmzeAlzfU3xmFEa9Dpbl
         Vx6FezUL91yitMXBqQYoZrk36ZVuoBjfHOEJW51j4m9ESOpUHE+MvlbC4kKKmTJtLbu3
         GSM+fdVu0yeXl7QlywfpPQoEKZ7rlvf1du11P3tLTKplmmnmXm1XCtzenW4lD8dGM5hq
         qT42nOqc6xlUkg2FKNkCg6mRJSEA8h/Augh3UVxb3b3MHPKmqu5IXRvY09epgaHUORcI
         0xpw==
X-Gm-Message-State: AOAM532+39acNnt5WdetwWLgi0PtvtBexPUoNVeftmHFGEutbKy/d6ZS
        3GqA6y++G1LY+mK4OS7tog==
X-Google-Smtp-Source: ABdhPJyVggDLjvqL2vCAzrclTC6pcaU7JiQKs9GPWuYPcTKJrk89gZ5C2lB5NqLPOAi3oesPqEMGtw==
X-Received: by 2002:a05:6808:1154:: with SMTP id u20mr22829320oiu.35.1622661837865;
        Wed, 02 Jun 2021 12:23:57 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a23sm190251otf.47.2021.06.02.12.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:23:57 -0700 (PDT)
Received: (nullmailer pid 3824407 invoked by uid 1000);
        Wed, 02 Jun 2021 19:23:55 -0000
Date:   Wed, 2 Jun 2021 14:23:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        krzysztof.kozlowski@canonical.com, pavel@ucw.cz,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        shawnx.tu@intel.com, linux-kernel@vger.kernel.org,
        mchehab@kernel.org, kernel@puri.sm, paul.kocialkowski@bootlin.com
Subject: Re: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add SK Hynix Inc.
Message-ID: <20210602192355.GA3824351@robh.at.kernel.org>
References: <20210531120737.168496-1-martin.kepplinger@puri.sm>
 <20210531120737.168496-2-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531120737.168496-2-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 31 May 2021 14:07:33 +0200, Martin Kepplinger wrote:
> SK Hynix built the already supported hi556 sensor (and probably much
> more). For more information, see https://www.skhynix.com/
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
