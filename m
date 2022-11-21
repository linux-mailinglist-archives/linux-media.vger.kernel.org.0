Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2DA632E83
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 22:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiKUVLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 16:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiKUVLR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 16:11:17 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09EE6C6978;
        Mon, 21 Nov 2022 13:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669065077; x=1700601077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o2x50bRB3reXFjn/ZB4Z7o1631ShVsoXyfcXP2+9YoY=;
  b=l5WLH4StYumlygIL0aKhOwsibKO05AmSpaqSOfkGWRRA8uTjaRbPRY7M
   7jRqHHDVd/6SN7+YjuNnitW6AAOc7LhLV8XqSO9BpuL8tppnjgwxhf7dh
   VFUwhRbkaSFR0pKlSWOeEqpUXGpL2IEBBt7+pgwK5zPUyNCdLTaT00tYp
   zEvuTipIRd86e5DlgvDi/TsKspfmZ5dcaMv7JWUisQFK5wU6328HoUs32
   vWtWgsUiPYWixKwPxLu20hUqBbjD8HemZqqlYKJCDU71o6Z/pSftpMs1i
   cJ23DVrrJ5/GK5EcusMt7sW2QpCkYNi+Ys1EnGxWPvYzeERmOCAq4OYgp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="313692926"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="313692926"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 13:10:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="635311547"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="635311547"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 13:10:49 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 91FAF20195;
        Mon, 21 Nov 2022 23:10:46 +0200 (EET)
Date:   Mon, 21 Nov 2022 21:10:46 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
Subject: Re: [PATCH v3 2/6] dt-bindings: Use new video interface bus type
 macros in examples
Message-ID: <Y3vpVtWFJLXnWu07@paasikivi.fi.intel.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-3-laurent.pinchart@ideasonboard.com>
 <YtKEzS6j0/45E7tP@valkosipuli.retiisi.eu>
 <YtLVRclLA4Jkk5i2@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtLVRclLA4Jkk5i2@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Jul 16, 2022 at 06:12:05PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Sat, Jul 16, 2022 at 12:28:45PM +0300, Sakari Ailus wrote:
> > On Thu, Jun 16, 2022 at 01:14:06AM +0300, Laurent Pinchart wrote:
> > > Now that a header exists with macros for the media interface bus-type
> > > values, replace hardcoding numerical constants with the corresponding
> > > macros in the DT binding examples.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v2:
> > > 
> > > - Go back to PARALLEL
> > > 
> > > Changes since v1:
> > > 
> > > - Rename PARALLEL to BT601
> > > ---
> > >  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 1 +
> > >  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml     | 3 ++-
> > >  Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml  | 3 ++-
> > >  .../devicetree/bindings/media/marvell,mmp2-ccic.yaml          | 3 ++-
> > >  Documentation/devicetree/bindings/media/microchip,xisc.yaml   | 3 ++-
> > >  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 4 +++-
> > >  6 files changed, 12 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > index 35a48515836e..b0e5585f93e2 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > @@ -118,6 +118,7 @@ additionalProperties: false
> > >  examples:
> > >    - |
> > >      #include <dt-bindings/gpio/gpio.h>
> > > +    #include <dt-bindings/media/video-interfaces.h>
> > >  
> > >      i2c0 {
> > >          #address-cells = <1>;
> > 
> > The definition doesn't seem to be used here. Is there a need to include
> > this?
> 
> There was, but the change that added bus-type to this binding got
> reverted in commit 979452fbc430 ("dt-bindings: drm/bridge: anx7625:
> Revert DPI support") and I forgot to drop the header when rebasing.
> 
> > I could drop this chunk while applying. There's just one trivial change
> > elsewhere in this patch to make.
> 
> Please do :-)

Applied with the following diff:

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 7fa7a667c764a..4590186c4a0b8 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -133,7 +133,6 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    #include <dt-bindings/media/video-interfaces.h>
 
     i2c0 {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 285c6075950ad..e80fcdf280f0b 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -92,7 +92,7 @@ examples:
     #include <dt-bindings/clock/stm32mp1-clks.h>
     #include <dt-bindings/media/video-interfaces.h>
     #include <dt-bindings/reset/stm32mp1-resets.h>
-    #
+
     dcmi: dcmi@4c006000 {
         compatible = "st,stm32-dcmi";
         reg = <0x4c006000 0x400>;

It seems that there's also bus-type 7 that corresponds to MIPI DPI. Could
you add a macro for this one as well? :-) In particular it's used by
Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml .

-- 
Kind regards,

Sakari Ailus
