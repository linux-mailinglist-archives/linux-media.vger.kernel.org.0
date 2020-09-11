Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6579F2658E0
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 07:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgIKFiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 01:38:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:61639 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgIKFiE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 01:38:04 -0400
IronPort-SDR: T69mPdDQYAesGPq+bhAz83fRn2VB/zYL5CFOiHsliSoYIWOW3/RvicGXUrSGaIApOj3SF4YeMc
 q7Grbnye9/bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="176760657"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="176760657"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 22:38:03 -0700
IronPort-SDR: jJ5tJ0klxr3CXIlyPpFiB9RZkK05zVqMSM3a9/yMZBYoAQkUjWFCfnR8gBtL3NmMT86bIQ+AOH
 4J2eZ8sOc+dw==
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="407983723"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 22:37:59 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 899832079D; Fri, 11 Sep 2020 08:37:57 +0300 (EEST)
Date:   Fri, 11 Sep 2020 08:37:57 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: media: ov772x: Make bus-type
 mandatory
Message-ID: <20200911053757.GF6566@paasikivi.fi.intel.com>
References: <20200910162055.614089-1-jacopo+renesas@jmondi.org>
 <20200910162055.614089-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910162055.614089-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Sep 10, 2020 at 06:20:54PM +0200, Jacopo Mondi wrote:
> In order to establish required properties based on the selected
> bus type, make the 'bus-type' property mandatory. As this change
> documents an endpoint property, also document the 'remote-endpoint'
> one now that the 'endpoint' schema has been expanded.
> 
> Binary compatibility with existing DTB is kept as the driver does not
> enforce the property to be present, and shall fall-back to default
> parallel bus configuration, which was the only supported bus type, if
> the property is not specified.

Could you add a comment on this to the driver, so this feature isn't
accidentally removed?

-- 
Regards,

Sakari Ailus
