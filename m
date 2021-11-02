Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9C7443388
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 17:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234950AbhKBQrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 12:47:07 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:38778 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234774AbhKBQrC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 12:47:02 -0400
Received: by mail-ot1-f52.google.com with SMTP id c2-20020a056830348200b0055a46c889a8so10106369otu.5;
        Tue, 02 Nov 2021 09:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IlPOJgGOo4bJ93R7WE1TPyotJtl1kL8cB6BhFupd7dU=;
        b=JJ4A96w9EYmK9f4+N369+e54nbJmDudROXUMeqqbp0ekcBFNHSUrmFgpsMvE9zj0pb
         meXNmfhFWB9AbCMSuRtzolb7IdHf1SzgstBqYk0niVFN7tPnvE0ijLdBXShDSByJYKen
         bDo04YfyI4pg6sSspL+m+WYa7xnqb3mCyr4FZTohKwLbKdUAYJbOsqMeiMvEB9BqEyqx
         UcdTIeRH6WlUPmxy7LiaNfEamuKyafWfNlqeE4shX/AYK1N7q5Xq+j1Y/wWJymWnkZye
         Uku34Z726dPuOrgX8ljiqZg1J44mh/+gGLTEPauO7g5p2mGEmSBtX8Zsv0JJWZi+pFeX
         wS/g==
X-Gm-Message-State: AOAM533vH44el0XkgpLOmXQT1KQIJRZGqFwVgOIYEE0gOWyizjVf3GU1
        6DBP0saOfhLKsyopDbBFXA==
X-Google-Smtp-Source: ABdhPJzc8qp+aAtj6hV4bRyxszUSjUyI1EcKb6/X6zAAyEc+tvCtmPnXJXwXacjX7gogAMgJ64kt0A==
X-Received: by 2002:a05:6830:2058:: with SMTP id f24mr13140404otp.248.1635871467129;
        Tue, 02 Nov 2021 09:44:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n10sm2892051ooj.42.2021.11.02.09.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:44:26 -0700 (PDT)
Received: (nullmailer pid 3040017 invoked by uid 1000);
        Tue, 02 Nov 2021 16:44:25 -0000
Date:   Tue, 2 Nov 2021 11:44:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4] dt-bindings: adv748x: Convert bindings to json-schema
Message-ID: <YYFq6X1Gsy7rYbGy@robh.at.kernel.org>
References: <20211028093749.2878541-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211028093749.2878541-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 28 Oct 2021 11:37:49 +0200, Niklas Söderlund wrote:
> Convert ADV748X analog video decoder documentation to json-schema.
> 
> While converting the bindings extend it to enforce that all port@n nodes
> shall be encapsulated inside a ports node. This change does not have an
> effect on drivers parsing the ports@n nodes.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> * Changes since v3
> - For 'interrupt-names' use the pattern
>     minItems: 1
>     maxItems: 3
>     items:
>       enum: [ intrq1, intrq2, intrq3 ]
> 
>  Instead of an items list with three '- enum: [ intrq1, intrq2, intrq3 ]'
>  rows.
> 
> * Changes since v2
> - Add adv748x.yaml to MAINTAINERS.
> - Update commit message.
> - Add myself to under the maintainers section after talking with Kieran.
> - Split reg in examples in two lines to match reg-names.
> 
> * Changes since v1
> - Update commit message to mention the added ports node.
> 
> Hello,
> 
> This conversion revealed a problem with the Renesas DTSI files for the
> adv7482 nodes. A fix for that have been submitted in a separate patch,
> 
>     [PATCH] arm64: dts: renesas: Add ports node to all adv7482 nodes
> 
> Kind Regards,
> Niklas Söderlund
> ---
>  .../devicetree/bindings/media/i2c/adv748x.txt | 116 ----------
>  .../bindings/media/i2c/adv748x.yaml           | 212 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 213 insertions(+), 116 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
