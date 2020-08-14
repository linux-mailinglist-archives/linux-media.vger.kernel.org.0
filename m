Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB9E2446FC
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 11:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHNJ2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 05:28:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:33704 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726311AbgHNJ2s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 05:28:48 -0400
IronPort-SDR: 5k8o4vZoiut52odJZB0YdPKJBauFmbyi4BZkJ+V9NbWLPhYpuLwv3zxWYth4s69D/2XI8aCAmY
 a+limIlhQTWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="239210509"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; 
   d="scan'208";a="239210509"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 02:28:46 -0700
IronPort-SDR: aqUYj7ltjTq82s8rsDc3oNY2sVj4IIVSXo8FEsMzGW31WRNanjQ4Uz02fSfZyBx4xpl+FNQA+K
 ddLN5e6owzcQ==
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; 
   d="scan'208";a="318827143"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 02:28:45 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1A8FD20699; Fri, 14 Aug 2020 12:28:43 +0300 (EEST)
Date:   Fri, 14 Aug 2020 12:28:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: imx214: select V4L2_FWNODE
Message-ID: <20200814092842.GD24582@paasikivi.fi.intel.com>
References: <20200622164352.605546-1-jacopo@jmondi.org>
 <20200812214928.GA22974@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812214928.GA22974@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 13, 2020 at 12:49:28AM +0300, Laurent Pinchart wrote:
> Hi Sakari, Mauro,
> 
> Could we get this merged ? It fixes a v5.8 regression. It's obviously
> too late for v5.8, can we merge it as a v5.9 fix ?

Yes.

-- 
Sakari Ailus
