Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D773B43E48
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbfFMPsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:48:43 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39370 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731730AbfFMJSh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 05:18:37 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B89B925B7FA;
        Thu, 13 Jun 2019 19:18:34 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B35A2940483; Thu, 13 Jun 2019 11:18:32 +0200 (CEST)
Date:   Thu, 13 Jun 2019 11:18:32 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2] dt-bindings: rcar-{csi2,vin}: Rename bindings
 documentation files
Message-ID: <20190613091832.77g2ltnvd5o2hndh@verge.net.au>
References: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 12, 2019 at 11:12:41PM +0200, Niklas Söderlund wrote:
> Renesas media binding documentation files uses a naming schema of
> 'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
> pattern.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>


Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

I wonder if, as a follow-up, renesas-wdt.txt and
renesas-memory-controllers.txt should get similar treatment.


> ---
>  .../media/{renesas,rcar-csi2.txt => renesas,csi2.txt}         | 0
>  .../bindings/media/{rcar_vin.txt => renesas,vin.txt}          | 0
>  MAINTAINERS                                                   | 4 ++--
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt => renesas,csi2.txt} (100%)
>  rename Documentation/devicetree/bindings/media/{rcar_vin.txt => renesas,vin.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> rename to Documentation/devicetree/bindings/media/renesas,csi2.txt
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/rcar_vin.txt
> rename to Documentation/devicetree/bindings/media/renesas,vin.txt
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6a3bac28ebb47830..a0d21ff13c8e8989 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9807,8 +9807,8 @@ L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Supported
> -F:	Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> -F:	Documentation/devicetree/bindings/media/rcar_vin.txt
> +F:	Documentation/devicetree/bindings/media/renesas,csi2.txt
> +F:	Documentation/devicetree/bindings/media/renesas,vin.txt
>  F:	drivers/media/platform/rcar-vin/
>  
>  MEDIA DRIVERS FOR RENESAS - VSP1
> -- 
> 2.21.0
> 
