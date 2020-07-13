Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B18121E415
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 01:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgGMX7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 19:59:38 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33763 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGMX7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 19:59:38 -0400
Received: by mail-io1-f66.google.com with SMTP id d18so15481400ion.0;
        Mon, 13 Jul 2020 16:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=459d77cK5HS2FH2dcRqpFw2lnIuuj+dUdJALm7saacU=;
        b=cMhUOmG0+FKgOAfAy15EqUG23VZkgW+qSw/7Gp86i0a+OU0ArWbPWDvabAXNxGomz/
         3PYN9o0lQqF+3hBir9CaevsBQKcliLF4CD+IvIrTv8/DnVGEfoK2x25uskaOs7uXE4Z5
         KFp679S6MOr3xjtBIM9ZU0B8NmGCjaH+Io9lesoCUWNd++iUARfBuWM3s9ppjnRtPE8i
         NkFUvpaKvtxJ0TCrKF4mzZ0kxw7WCz4v5AQSTjfDrGLqkaOjYFfPn/AtRtYoxQkcHj9h
         odwV4aoOtU43CIsakvaKcDvv0/4HpmA0CC/BeDsKJQCrg34kosq6+JtT0lx51penO/XK
         jCwg==
X-Gm-Message-State: AOAM530kUnP6vzB/Wuo5bndErVaVkEZ4/jNqhRug5e0hgmJ6x1HVH9f+
        F8z/wtsk8jbOaw7q/RCOuy9H1oRlR8Hi
X-Google-Smtp-Source: ABdhPJyPlbc1aSPv3+AKY7qOpV+xg3N05oqCGPQx7urbOOGaG7CZ/c1mLdcI+ruLuZoGOJzCXS9DwQ==
X-Received: by 2002:a6b:6e11:: with SMTP id d17mr2391954ioh.102.1594684777722;
        Mon, 13 Jul 2020 16:59:37 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a1sm8971534ilq.50.2020.07.13.16.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 16:59:37 -0700 (PDT)
Received: (nullmailer pid 961887 invoked by uid 1000);
        Mon, 13 Jul 2020 23:59:36 -0000
Date:   Mon, 13 Jul 2020 17:59:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/8] dt-bindings: media: renesas, fcp: Make
 power-domains mandatory
Message-ID: <20200713235936.GA961843@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-3-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 21 Jun 2020 03:47:28 +0300, Laurent Pinchart wrote:
> All DT source files in the kernel tree specify the power-domains
> property. Make it mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> 
> - Fix typo in commit message
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
