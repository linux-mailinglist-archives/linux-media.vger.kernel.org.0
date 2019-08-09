Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC7687D10
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 16:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407037AbfHIOpc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 10:45:32 -0400
Received: from retiisi.org.uk ([95.216.213.190]:59088 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726157AbfHIOpb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Aug 2019 10:45:31 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3855A634C88;
        Fri,  9 Aug 2019 17:45:25 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hw68z-0000K6-Da; Fri, 09 Aug 2019 17:45:25 +0300
Date:   Fri, 9 Aug 2019 17:45:25 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Luis Oliveira <Luis.Oliveira@synopsys.com>
Cc:     mchehab@kernel.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        robh@kernel.org, nicolas.ferre@microchip.com,
        paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Joao.Pinto@synopsys.com
Subject: Re: [v4 4/6] dt-bindings: phy: Document the Synopsys MIPI DPHY Rx
 bindings
Message-ID: <20190809144525.GE864@valkosipuli.retiisi.org.uk>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-5-git-send-email-luis.oliveira@synopsys.com>
 <20190809144252.GD864@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809144252.GD864@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 09, 2019 at 05:42:52PM +0300, Sakari Ailus wrote:
> Hi Luis,
> 
> On Tue, Jun 11, 2019 at 09:20:53PM +0200, Luis Oliveira wrote:
> > Add device-tree bindings documentation for SNPS DesignWare MIPI D-PHY in
> > RX mode.
> > 
> > Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
> > ---
> > Changelog
> > v3-v4
> > - @Laurent I know I told you I could remove the snps,dphy-frequency on V3 but
> >   it is really useful for me here. I removed all other the proprietary
> >   properties except this one. Do you still think it must be removed?
> 
> Yes. DT is the wrong place for runtime configuration. You get that
> information using the V4L2_CID_LINK_FREQ control on the upstream
> sub-device.

And the PHY driver itself gets that in its configuration (struct
phy_configure_opts_mipi_dphy through the configure op).

-- 
Sakari Ailus
