Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA6B4265C6A
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 11:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgIKJXT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 05:23:19 -0400
Received: from mga05.intel.com ([192.55.52.43]:23204 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725764AbgIKJXS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 05:23:18 -0400
IronPort-SDR: TpwDP/xHxjROwi02V/eBqq3Nz+Bq7IITcnY8pTD6N6O4UMva1wm8CsrM56Iif5BnZgdPLtKkwX
 jIevQhLx68wA==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="243545237"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="243545237"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 02:23:17 -0700
IronPort-SDR: C7HG9sa2Vx4WvDEyLxFCHuctA0mzklzfk0PgBaKBKqzfcfStylldgCUdi7FLUzqVzv/waetQ2D
 AXg7AVbYB4sA==
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="334458287"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 02:23:14 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2E3B82079D; Fri, 11 Sep 2020 12:23:12 +0300 (EEST)
Date:   Fri, 11 Sep 2020 12:23:12 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: media: ov772x: Make bus-type
 mandatory
Message-ID: <20200911092312.GA26842@paasikivi.fi.intel.com>
References: <20200910162055.614089-1-jacopo+renesas@jmondi.org>
 <20200910162055.614089-3-jacopo+renesas@jmondi.org>
 <20200911053757.GF6566@paasikivi.fi.intel.com>
 <20200911085837.kyxx3p465ovowcel@uno.localdomain>
 <OSBPR01MB5048CACE31FB094F753F4F55AA240@OSBPR01MB5048.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB5048CACE31FB094F753F4F55AA240@OSBPR01MB5048.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 11, 2020 at 08:59:13AM +0000, Prabhakar Mahadev Lad wrote:
> Hi Jacopo,
> 
> > -----Original Message-----
> > From: Jacopo Mondi <jacopo@jmondi.org>
> > Sent: 11 September 2020 09:59
> > To: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>; robh+dt@kernel.org; devicetree@vger.kernel.org; linux-media@vger.kernel.org; Lad,
> > Prabhakar <prabhakar.csengg@gmail.com>; mchehab@kernel.org; hverkuil-cisco@xs4all.nl; laurent.pinchart@ideasonboard.com; linux-
> > renesas-soc@vger.kernel.org; Rob Herring <robh@kernel.org>; Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH v5 2/3] dt-bindings: media: ov772x: Make bus-type mandatory
> >
> > Hi Sakari,
> >
> > On Fri, Sep 11, 2020 at 08:37:57AM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Thu, Sep 10, 2020 at 06:20:54PM +0200, Jacopo Mondi wrote:
> > > > In order to establish required properties based on the selected
> > > > bus type, make the 'bus-type' property mandatory. As this change
> > > > documents an endpoint property, also document the 'remote-endpoint'
> > > > one now that the 'endpoint' schema has been expanded.
> > > >
> > > > Binary compatibility with existing DTB is kept as the driver does not
> > > > enforce the property to be present, and shall fall-back to default
> > > > parallel bus configuration, which was the only supported bus type, if
> > > > the property is not specified.
> > >
> > > Could you add a comment on this to the driver, so this feature isn't
> > > accidentally removed?
> >
> > Sure, can I send a patch in reply to this series to avoid a v6 ?
> If you don’t mind Ill handle this as part of bt656 additions ?

Both are fine for me.

-- 
Sakari Ailus
