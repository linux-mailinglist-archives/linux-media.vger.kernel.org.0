Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D76C673330
	for <lists+linux-media@lfdr.de>; Thu, 19 Jan 2023 09:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbjASIBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Jan 2023 03:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbjASIA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Jan 2023 03:00:26 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F72E521E1;
        Wed, 18 Jan 2023 23:59:39 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CDBEA80F1;
        Thu, 19 Jan 2023 07:59:38 +0000 (UTC)
Date:   Thu, 19 Jan 2023 09:59:37 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 4/6] ARM: dts: omap: Use new media bus type macros
Message-ID: <Y8j4aZBuyxeK994P@atomide.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-5-laurent.pinchart@ideasonboard.com>
 <Y8LMNDIoSZzFBLMB@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8LMNDIoSZzFBLMB@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [230114 15:37]:
> Tony, could you take this patch in your tree for v6.3 ? The two patches
> that it depends on have both been merged in v6.2.

OK applying into omap-for-v6.3/dt.

Thanks,

Tony
