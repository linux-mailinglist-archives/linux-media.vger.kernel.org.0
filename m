Return-Path: <linux-media+bounces-1177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E39097FAD9F
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 23:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 209D61C20B55
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 22:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A368246522;
	Mon, 27 Nov 2023 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB71A5;
	Mon, 27 Nov 2023 14:40:21 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6d812988394so1614399a34.3;
        Mon, 27 Nov 2023 14:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701124821; x=1701729621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4CgTDLrqo43Kyf/LgZjsGgVZ8Z3ry5fGgtV85NxSeI=;
        b=YXJlMbCrN+ZZMIHX4DplCWPayCFZA1Ol48ychqKjpB3me47N14Fq+lnHIZw49f+M04
         PMa+63HEhoGaZAANAtwsalQ0LLQ4u7l4qqTAoGighxwu/GtXj9Ul7DDWirXg0OWV0wX9
         aMEMiKAdom9mpDHZAw/Jq4GuHmRKnM+38jAx0/KsT0UsDY0e4b7PhvTliOxczN/tOQHq
         yPQ5JfYTQSRMoqm6ndEbZHIHdYFlChD0hl56TFO/2d3BBfKyRp2rYFbOp33H+RtB8qSS
         /AgbC+yMcMkwuWtKUG1TxG1lED0tqOASczawFj00O1gYSyYr4Q1PKlSWqwtAY635WGbM
         8YZg==
X-Gm-Message-State: AOJu0YzjL3uuRGIO3EWjGkBPYTYE8VyR8cUqDdFUuIX0NKcXigqbkU3s
	SOsqnfW7v1ZYNWTNiudlCw==
X-Google-Smtp-Source: AGHT+IGHUk0bQUoMccERlph1sluFh0ugcccL1xo+q0Nojc+0Jdb5MQuRp4d3NAvQKw6jU5wQaH7ubw==
X-Received: by 2002:a05:6870:ed8a:b0:1ef:b62d:24c9 with SMTP id fz10-20020a056870ed8a00b001efb62d24c9mr18649387oab.5.1701124820972;
        Mon, 27 Nov 2023 14:40:20 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z20-20020a056870385400b001fa2823dc13sm1436090oal.0.2023.11.27.14.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 14:40:20 -0800 (PST)
Received: (nullmailer pid 198331 invoked by uid 1000);
	Mon, 27 Nov 2023 22:40:19 -0000
Date: Mon, 27 Nov 2023 16:40:19 -0600
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: conor+dt@kernel.org, sakari.ailus@linux.intel.com, Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, rfoss@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: dt-bindings: Use bus-types definitions from
 video-interfaces.h
Message-ID: <170112481872.197252.15517458443819093476.robh@kernel.org>
References: <20231126125320.4024456-1-festevam@gmail.com>
 <20231126125320.4024456-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126125320.4024456-2-festevam@gmail.com>


On Sun, 26 Nov 2023 09:53:20 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> To improve readability, replace hardcoding numerical constants with the
> corresponding definitions from video-interfaces.h.
> 
> Based on commit c4cfd47eb4ac ("media: dt-bindings: Use new video interface
> bus type macros in examples").
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 3 ++-
>  .../devicetree/bindings/media/i2c/toshiba,tc358746.yaml       | 3 ++-
>  Documentation/devicetree/bindings/media/microchip,csi2dc.yaml | 4 +++-
>  .../devicetree/bindings/media/starfive,jh7110-camss.yaml      | 4 +++-
>  .../devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml       | 3 ++-
>  5 files changed, 12 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


