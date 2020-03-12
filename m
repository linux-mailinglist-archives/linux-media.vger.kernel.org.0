Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2051A182DFC
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgCLKm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:42:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:48267 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgCLKm1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:42:27 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 03:42:26 -0700
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; 
   d="scan'208";a="246327983"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 03:42:24 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 877DF208BB; Thu, 12 Mar 2020 12:42:22 +0200 (EET)
Date:   Thu, 12 Mar 2020 12:42:22 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v13 04/21] media: v4l2-fwnode: fix v4l2_fwnode_parse_link
 handling
Message-ID: <20200312104222.GN5379@paasikivi.fi.intel.com>
References: <20200312103156.3178-1-m.felsch@pengutronix.de>
 <20200312103156.3178-5-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312103156.3178-5-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 12, 2020 at 11:31:39AM +0100, Marco Felsch wrote:
> Currently the driver differentiate the port number property handling for
> ACPI and DT. This is wrong as because ACPI should use the "reg" val too
> [1].
> 
> [1] https://patchwork.kernel.org/patch/11421985/
> 
> Fixes: ca50c197bd96 ("[media] v4l: fwnode: Support generic fwnode for parsing standardised properties")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Oh well, I guess this is OK; I noticed the next patch that depends on this
one. But it should be merged with the next patch so that it won't be
accidentally backported alone.

Then, please add:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
