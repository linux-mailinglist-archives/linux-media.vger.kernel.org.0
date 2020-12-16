Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0D22DC892
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 23:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbgLPWAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 17:00:32 -0500
Received: from mga05.intel.com ([192.55.52.43]:8298 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729966AbgLPWAc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 17:00:32 -0500
IronPort-SDR: tAsTYMUp6MhYDV4v4nbITbnktxA7zzub86sK4hj2rTphr+PgXJ3TBPZzM8r2baUGYHE+LEbETp
 pAy2GNATjVUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="259868418"
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="259868418"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2020 13:58:46 -0800
IronPort-SDR: g6StFyQyNI6oqus3+ogWUBPUnZzHoq6z1zKSGaGYnEB/jpQHAqtKlwbg+pLHIYu61oTWezrZ+O
 //vTJhsbLJBA==
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="379412408"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2020 13:58:42 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id F2B6820726; Wed, 16 Dec 2020 23:58:40 +0200 (EET)
Date:   Wed, 16 Dec 2020 23:58:40 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
Message-ID: <20201216215840.GM26370@paasikivi.fi.intel.com>
References: <20201210211625.3070388-1-robh@kernel.org>
 <20201210211625.3070388-5-robh@kernel.org>
 <X9ofJMIivzPzi8x7@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9ofJMIivzPzi8x7@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Dec 16, 2020 at 04:52:20PM +0200, Laurent Pinchart wrote:
> > +  clock-lanes:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    # Assume up to 9 physical lane indices
> > +    maximum: 8
> > +    description:
> > +      Physical clock lane index. Position of an entry determines
> 
> s/index/indexes/ (or indices) as there are potentially multiple entries
> (even if in practice, for all bus types we currently support, only one
> clock lane is supported) ?

We could easily change it if that appears.

The property was named in plural to align with data-lanes, without
intention of having more clock lanes. We could of course allow more if that
happens, but I doubt it.

-- 
Sakari Ailus
