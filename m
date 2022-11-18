Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 462E962F117
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 10:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241652AbiKRJXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 04:23:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbiKRJXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 04:23:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201C1391DB;
        Fri, 18 Nov 2022 01:23:50 -0800 (PST)
Received: from pyrite.rasen.tech (h175-177-042-159.catv02.itscom.jp [175.177.42.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2595FAF4;
        Fri, 18 Nov 2022 10:23:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668763428;
        bh=7C+athZv7kSEaIkUaRi7GZVI+Rosz/qwDDS/Xg83iGI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HQ8UJrG3TlMuin8TgVJ0u6M3cvqVdWw2apIjy13yeZTzSo6IiGzY1GbVFl9zHk6Lz
         RyD5teiV4pBeed8S2IUmrylWh9Dnnay+nZoCZ1eoiPnwLeV/oEGVz4/SBIPlgQK1op
         Shx2bRghzbFCD/syDUQ/8hZkAfZzgpZFiiOxmQJk=
Date:   Fri, 18 Nov 2022 18:23:38 +0900
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 0/6] dt-bindings: Add macros for video interface bus
 types
Message-ID: <Y3dPGkFaz/qo/drw@pyrite.rasen.tech>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <YtOyCBOqCR71uG1i@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtOyCBOqCR71uG1i@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Gentle ping.

On Sun, Jul 17, 2022 at 06:54:00AM +0000, Sakari Ailus wrote:
> Folks,
> 
> > Laurent Pinchart (6):
> >   dt-bindings: media: Add macros for video interface bus types
> >   dt-bindings: Use new video interface bus type macros in examples
> >   ARM: dts: freescale: Use new media bus type macros
> >   ARM: dts: omap: Use new media bus type macros
> >   ARM: dts: renesas: Use new media bus type macros
> >   ARM: dts: stm32: Use new media bus type macros
> 
> What's the preference on the tree through which these would be merged?
> 
> The two first should probably go through the media tree but what about the
> DTS? There's a dependency to the first patch. I can take these all if
> people are fine with that.

How is this going?


Thanks,

Paul
