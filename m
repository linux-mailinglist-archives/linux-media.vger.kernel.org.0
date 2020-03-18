Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97A8A1896A5
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 09:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgCRIJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 04:09:44 -0400
Received: from mga05.intel.com ([192.55.52.43]:23169 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbgCRIJo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 04:09:44 -0400
IronPort-SDR: xr1h9kt92B+Eu9zL4V2G7UaCg+FyJWN51Gqq1M4dFh1s+X+6aux4skrrcMCTh0OEnFzW9sb8rV
 YtJeX6P4oa1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2020 01:09:43 -0700
IronPort-SDR: SYeGGI/zMfxiDiUqCzYhWZ+2jm1KNnPSyWfZxkCXU8ZO37cfu22TERAlTZtbtDlD+M/pjATiZW
 VdULDqwXNogw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; 
   d="scan'208";a="238130765"
Received: from jsowinsk-mobl.ger.corp.intel.com (HELO mara.localdomain) ([10.249.156.87])
  by fmsmga008.fm.intel.com with ESMTP; 18 Mar 2020 01:09:41 -0700
Received: from sailus by mara.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jETli-0000YQ-Ou; Wed, 18 Mar 2020 10:09:38 +0200
Date:   Wed, 18 Mar 2020 10:09:38 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: v4l2-async: Pass notifier pointer to match
 functions
Message-ID: <20200318080937.GB2101@mara.localdomain>
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200318002507.30336-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318002507.30336-3-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 18, 2020 at 02:25:05AM +0200, Laurent Pinchart wrote:
> The notifier is useful to match functions to access information about
> the device matching a subdev. This will be used to print messages using
> the correct struct device and driver name.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
