Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5209487D23
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 16:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406923AbfHIOre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 10:47:34 -0400
Received: from retiisi.org.uk ([95.216.213.190]:59170 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726342AbfHIOrd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Aug 2019 10:47:33 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 98C9A634C89;
        Fri,  9 Aug 2019 17:47:27 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hw6Ax-0000KC-ST; Fri, 09 Aug 2019 17:47:27 +0300
Date:   Fri, 9 Aug 2019 17:47:27 +0300
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
Message-ID: <20190809144727.GF864@valkosipuli.retiisi.org.uk>
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
> > +The Synopsys MIPI D-PHY controller supports MIPI-DPHY in receiver mode.
> > +Please refer to phy-bindings.txt for more information.
> > +
> > +Required properties:
> > +- compatible		: Shall be "snps,dw-dphy-rx".
> > +- #phy-cells		: Must be 1.
> > +- bus-width		: Size of the test interface data bus (8 bits->8 or
> > +			  12bits->12).
> 
> Hmm. This seems like runtime configuration as well.

And it's for the parallel busses.

I'd like to see the bindings that have the other interface described as
well if there are parameters that affect device configuration there.

-- 
Sakari Ailus
