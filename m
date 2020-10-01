Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABEA28039B
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 18:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732699AbgJAQLW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 12:11:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:16789 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732627AbgJAQLU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 12:11:20 -0400
IronPort-SDR: MEAHRNDmoPOOP9X4dw3FnkG9+6b8uAxiUVBNyv8GUIotAmKwKo83Ga5nQKTSdbjjRC2TNacZ0a
 /+jE90kZojOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="162007652"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="162007652"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 09:11:14 -0700
IronPort-SDR: X4cIzrx2LkcqnKPNl5RwDAZKWO5ls0m7u2ka9YhbMTlWDb6Eqi9ulGOopk/bzp0xYAFxFy7GB9
 9ReDN53dfzoA==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="346138436"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 09:11:13 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 36AB72068C; Thu,  1 Oct 2020 19:11:11 +0300 (EEST)
Date:   Thu, 1 Oct 2020 19:11:11 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>
Subject: Re: [PATCH v2 4/5] media: mt9p031: Make pixel clock polarity
 configurable by DT
Message-ID: <20201001161111.GQ26842@paasikivi.fi.intel.com>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930105133.139981-4-s.riedmueller@phytec.de>
 <20201001161031.GP26842@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001161031.GP26842@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 01, 2020 at 07:10:31PM +0300, Sakari Ailus wrote:
> > @@ -1079,6 +1094,9 @@ mt9p031_get_pdata(struct i2c_client *client)
> >  	of_property_read_u32(np, "input-clock-frequency", &pdata->ext_freq);
> >  	of_property_read_u32(np, "pixel-clock-frequency", &pdata->target_freq);
> >  
> > +	pdata->pixclk_pol = !!(endpoint.bus.parallel.flags &
> > +			       V4L2_MBUS_PCLK_SAMPLE_RISING);
> 
> Could you document this in DT bindings? And the default, too.

Please make it a separate patch.

-- 
Sakari Ailus
