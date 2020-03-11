Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEA51812C0
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 09:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgCKIRJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 04:17:09 -0400
Received: from mga02.intel.com ([134.134.136.20]:6826 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728242AbgCKIRJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 04:17:09 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 01:17:08 -0700
X-IronPort-AV: E=Sophos;i="5.70,540,1574150400"; 
   d="scan'208";a="289313228"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 01:17:05 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 31A822096B; Wed, 11 Mar 2020 10:17:03 +0200 (EET)
Date:   Wed, 11 Mar 2020 10:17:03 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v12 06/19] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20200311081703.GF5379@paasikivi.fi.intel.com>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
 <20200309101428.15267-7-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309101428.15267-7-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Mon, Mar 09, 2020 at 11:14:15AM +0100, Marco Felsch wrote:
...
> +void v4l2_fwnode_connector_free(struct v4l2_fwnode_connector *connector)
> +{
> +	struct v4l2_connector_link *link, *tmp;
> +
> +	if (IS_ERR_OR_NULL(connector) ||
> +	    connector->type == V4L2_CONN_UNKNOWN)
> +		return;
> +
> +	list_for_each_entry_safe(link, tmp, &connector->links, head) {
> +		v4l2_fwnode_put_link(&link->fwnode_link);
> +		list_del(&link->head);
> +		kfree(link);
> +	}
> +
> +	kfree(connector->label);
> +	connector->label = NULL;
> +	connector = NULL;

No need to set connector NULL here.

> +}

-- 
Sakari Ailus
