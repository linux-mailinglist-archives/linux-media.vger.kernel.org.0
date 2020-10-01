Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59753280883
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 22:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgJAUfA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 16:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgJAUfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 16:35:00 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32724C0613D0;
        Thu,  1 Oct 2020 13:35:00 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6A124634C87;
        Thu,  1 Oct 2020 23:34:40 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kO5Hk-0000tV-8p; Thu, 01 Oct 2020 23:34:40 +0300
Date:   Thu, 1 Oct 2020 23:34:40 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] media: dt-bindings: convert CODA VPU bindings to yaml
Message-ID: <20201001203440.GN2024@valkosipuli.retiisi.org.uk>
References: <20200923082112.26477-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923082112.26477-1-p.zabel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Wed, Sep 23, 2020 at 10:21:12AM +0200, Philipp Zabel wrote:
> Convert to YAML and add generic IP core compatibles "cnm,codadx6",
> "cnm,codahx4", "cnm,coda7541", and "cnm,coda960" in addition to the SoC
> specific compatibles. The new generic compatibles are already used in
> the SoC device trees and replace the free form comments. For example:
> 
> - compatible : should be "fsl,<chip>-src" for i.MX SoCs:
>   (a) "fsl,imx27-vpu" for CodaDx6 present in i.MX27
> 
> turns into:
> 
> properties:
>   compatible:
>     oneOf:
>       - items:
>           - const: fsl,imx27-vpu
>           - const: cnm,codadx6
> 
> This allows to properly specify the secondary JPEG unit interrupt that
> is only present on cnm,coda960.
> 
> Also add the missing "fsl,imx6dl-vpu", "cnm,coda960" compatible.
> The AXI bus connection to the internal SRAM is different between i.MX6Q
> and i.MX6DL, which requires the driver to load a different firmware
> depending on the SoC.
> 
> Further, specify the power-domain property for i.MX6 and change the
> clock order from "ahb", "per" to "per", "ahb". This order is currently
> used in all SoC device trees.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Applied with the extra blank line removed in YAML bindings.

-- 
Regards,

Sakari Ailus
