Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C2B2D71B9
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 09:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436922AbgLKI0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 03:26:08 -0500
Received: from mga04.intel.com ([192.55.52.120]:54519 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436929AbgLKIZ6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 03:25:58 -0500
IronPort-SDR: rbU1ZWPFqYRhr37SQGrjNbUN7AF7eEuW7VIpz2m/N5LlL4bfJnBRae18KiPfkV7qaQwC1AmIHi
 cP1XPyDc5Vew==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="171833704"
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="171833704"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 00:24:07 -0800
IronPort-SDR: XE+342oezvdlXiIo8E8dCGWsWJ1fCNaKga7uCy3EJY4PeJI3X9Gpc/DFDQ9OVeTUQfrBw06wNX
 Z8usK1NLLTcg==
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="365306384"
Received: from mkrastex-mobl.ger.corp.intel.com (HELO mkrastexMOBL) ([10.104.80.6])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 00:24:03 -0800
From:   "Martina Krasteva" <martinax.krasteva@linux.intel.com>
To:     "'Rob Herring'" <robh@kernel.org>
Cc:     <robh+dt@kernel.org>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>,
        <daniele.alessandrelli@linux.intel.com>,
        <gjorgjix.rosikopulos@linux.intel.com>,
        <devicetree@vger.kernel.org>, <sakari.ailus@linux.intel.com>,
        <paul.j.murphy@linux.intel.com>
References: <20201207160109.490-1-martinax.krasteva@linux.intel.com> <20201207160109.490-2-martinax.krasteva@linux.intel.com> <20201210035143.GA1627250@robh.at.kernel.org>
In-Reply-To: <20201210035143.GA1627250@robh.at.kernel.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: media: Add bindings for imx334
Date:   Fri, 11 Dec 2020 08:23:59 -0000
Message-ID: <010e01d6cf96$fdeb7940$f9c26bc0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGsqVwHu/71coFvg7c0oMYy8kQsOgFDl0OsAW5z5eWqMEqxUA==
Content-Language: en-us
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you, Rob

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Thursday, December 10, 2020 3:52 AM
> To: Martina Krasteva <martinax.krasteva@linux.intel.com>
> Cc: robh+dt@kernel.org; mchehab@kernel.org; linux-media@vger.kernel.org;
> daniele.alessandrelli@linux.intel.com;
gjorgjix.rosikopulos@linux.intel.com;
> devicetree@vger.kernel.org; sakari.ailus@linux.intel.com;
> paul.j.murphy@linux.intel.com
> Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add bindings for imx334
> 
> On Mon, 07 Dec 2020 16:01:07 +0000, Martina Krasteva wrote:
> > From: Martina Krasteva <martinax.krasteva@intel.com>
> >
> > - Add dt-bindings documentation for Sony imx334 sensor driver.
> > - Add MAINTAINERS entry for Sony imx334 binding documentation.
> >
> > Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> > Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> > Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> > Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> > ---
> >  .../devicetree/bindings/media/i2c/sony,imx334.yaml | 62
> ++++++++++++++++++++++
> >  MAINTAINERS                                        |  8 +++
> >  2 files changed, 70 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> >
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Best Regards,
Martina

