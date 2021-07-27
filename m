Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73413D755A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 14:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236320AbhG0Mx0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 08:53:26 -0400
Received: from mga06.intel.com ([134.134.136.31]:37225 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232125AbhG0MxZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 08:53:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="273515263"
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; 
   d="scan'208";a="273515263"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2021 05:53:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; 
   d="scan'208";a="634400839"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2021 05:53:23 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id BA66420726;
        Tue, 27 Jul 2021 15:53:21 +0300 (EEST)
Date:   Tue, 27 Jul 2021 15:53:21 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v3 3/6] v4l: async: Rename async nf functions, clean up
 long lines
Message-ID: <20210727125321.GI3@paasikivi.fi.intel.com>
References: <20210624084046.13136-1-sakari.ailus@linux.intel.com>
 <20210624084046.13136-4-sakari.ailus@linux.intel.com>
 <4b50c5cd-52de-f1f4-1b23-424b06c9c9b7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b50c5cd-52de-f1f4-1b23-424b06c9c9b7@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 27, 2021 at 01:41:26PM +0100, Kieran Bingham wrote:
> Hi Sakari,
> 
> On 24/06/2021 09:40, Sakari Ailus wrote:
> > Rename V4L2 async notifier functions, replacing "notifier" with "nf" and
> > removing "_subdev" at the end of the function names adding subdevs as you
> > can only add subdevs to a notifier. Also wrap and otherwise clean up long
> > lines.
> 
> Removing _subdev sounds reasonable, I have a slight distaste on the 'nf'
> shorthand, as it's not very clear. I don't instantly associate the 'nf'
> as a 'notifier' and started looking for an acronmym definition ...
> 
> 
> But taste shouldn't necessarily block that, and it does shorten lines on
> some ... really long function names ...
> 
> 
> I see below one local variable is 'ntf' and that 't' helps bring in a
> bit of context vs nf ... but I don't think that's particilarly worth
> changing this series.
> 
> I can't spot anything else, so
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks.

"Nf" always comes with "async_" before it, so I don't think it should
really leave much room for interpretation. The more letters you add the
less is the effect of the rename, the main reason for which was to shorten
the names.

-- 
Sakari Ailus
