Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05503273DBE
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 10:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgIVIuh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 04:50:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:46549 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbgIVIuh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 04:50:37 -0400
IronPort-SDR: Eplb0+lYCNDrVqIonlfK2WMQTZ7F+9wQE3hqX023yajvKaeGp5LZm6koAbwAIh0gBjtqifWomm
 xImgJFW4yrgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="222157064"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="222157064"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 01:50:37 -0700
IronPort-SDR: 5tlQeeJUNgDuiFdgc+722aeXREygWiSbKoXehtbSujc/kgVIksT64yARbceRvuua+nSOZBI/JC
 vlNYA68uLdwg==
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="382242063"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 01:50:32 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8377F207DA; Tue, 22 Sep 2020 11:50:29 +0300 (EEST)
Date:   Tue, 22 Sep 2020 11:50:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Leon Luo <leonl@leopardimaging.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6] dt-bindings: media: imx274: Convert to json-schema
Message-ID: <20200922085029.GM26842@paasikivi.fi.intel.com>
References: <20200912103045.14375-1-jacopo+renesas@jmondi.org>
 <b730792b-041b-01b9-9d73-c32862a5f760@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b730792b-041b-01b9-9d73-c32862a5f760@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 22, 2020 at 10:03:14AM +0200, Luca Ceresoli wrote:
> Hello,
> 
> On 12/09/20 12:30, Jacopo Mondi wrote:
> > Convert the imx274 bindings document to json-schema and update
> > the MAINTAINERS file accordingly.
> > 
> > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> This patch is also fixing the supply names from uppercase to lowercase.
> That change should go in 5.9, otherwise we'll have to stick to uppercase
> names forever, yet I don't see it in current linux-media branches.

<URL:https://patchwork.linuxtv.org/project/linux-media/patch/20200917144416.GN834@valkosipuli.retiisi.org.uk/>

-- 
Sakari Ailus
