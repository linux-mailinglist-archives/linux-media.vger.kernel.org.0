Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F19891355
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 23:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfHQVcg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Aug 2019 17:32:36 -0400
Received: from retiisi.org.uk ([95.216.213.190]:38934 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726163AbfHQVcf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Aug 2019 17:32:35 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3FABE634C87;
        Sun, 18 Aug 2019 00:32:08 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hz6Ix-0001KY-Kr; Sun, 18 Aug 2019 00:32:07 +0300
Date:   Sun, 18 Aug 2019 00:32:07 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, menghui.lin@mediatek.com,
        shengnan.wang@mediatek.com, tfiga@google.com, drinkcat@chromium.org
Subject: Re: [RFC,V2,1/2] media: dt-bindings: media: i2c: Add bindings for
 OV02A10
Message-ID: <20190817213207.GC3504@valkosipuli.retiisi.org.uk>
References: <20190704084651.3105-1-dongchun.zhu@mediatek.com>
 <20190704084651.3105-2-dongchun.zhu@mediatek.com>
 <20190723074153.GA4606@paasikivi.fi.intel.com>
 <ef65288c523f405396991bd6d757bba0@mtkmbs02n1.mediatek.inc>
 <1566013985.21623.9.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566013985.21623.9.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Sat, Aug 17, 2019 at 11:53:05AM +0800, Dongchun Zhu wrote:
...
> > > +
> > > +The device node shall contain one 'port' child node with an
> > > +'endpoint' subnode for its digital output video port, in accordance
> > > +with the video interface bindings defined in
> > > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > +The endpoint optional property 'data-lanes' shall be "<1>".
> > 
> > How many lanes does the module (or the sensor) have?
> > 
> 
> From sensor datasheet, OV02A10 supports 1-lane MIPI interface.

If only one lane is supported, the property should be omitted: there's
nothing that the driver needs to know here.

-- 
Sakari Ailus
