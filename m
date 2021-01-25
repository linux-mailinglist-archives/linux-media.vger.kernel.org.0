Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD183028E3
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 18:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730924AbhAYRQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 12:16:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:38598 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730878AbhAYRQS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 12:16:18 -0500
IronPort-SDR: BLjo28aGVDgyAB7cSxvQwipazReQYJ8VIzbVKSn1l1CIVxW2N59/pT1B6rJ2TCIFaPQiY+rGbf
 R+b9psjAg8Tg==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="241298485"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="241298485"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 09:14:10 -0800
IronPort-SDR: uyKGD0sEHGPxfenqmDJg7sEx6uXTt80BokbxPhVCI6nL1VdmVQ6ml+sM7Nuw1ncUs+eDUC+CiV
 Zm0mqUPKDBsg==
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="387465929"
Received: from mkrastex-mobl.ger.corp.intel.com (HELO mkrastexMOBL) ([10.104.84.23])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 09:14:08 -0800
From:   "Martina Krasteva" <martinax.krasteva@linux.intel.com>
To:     "'Sakari Ailus'" <sakari.ailus@linux.intel.com>
Cc:     <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <daniele.alessandrelli@linux.intel.com>,
        <paul.j.murphy@linux.intel.com>,
        <gjorgjix.rosikopulos@linux.intel.com>
References: <20201211105633.708-1-martinax.krasteva@linux.intel.com> <20201211105633.708-3-martinax.krasteva@linux.intel.com> <20210125130840.GK27155@paasikivi.fi.intel.com>
In-Reply-To: <20210125130840.GK27155@paasikivi.fi.intel.com>
Subject: RE: [PATCH v4 2/2] media: i2c: Add imx334 camera sensor driver
Date:   Mon, 25 Jan 2021 17:14:04 -0000
Message-ID: <000101d6f33d$7f08dc10$7d1a9430$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ+AAXszZC+XWREX7U1zNfsFhfiYwHZem/YASKTefio0poGoA==
Content-Language: en-us
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, January 25, 2021 1:09 PM
> To: Martina Krasteva <martinax.krasteva@linux.intel.com>
> Cc: linux-media@vger.kernel.org; mchehab@kernel.org; robh+dt@kernel.org;
> devicetree@vger.kernel.org; daniele.alessandrelli@linux.intel.com;
> paul.j.murphy@linux.intel.com; gjorgjix.rosikopulos@linux.intel.com
> Subject: Re: [PATCH v4 2/2] media: i2c: Add imx334 camera sensor driver
> 
> Hi Martina,
> 
> A few more comments.
> 
> On Fri, Dec 11, 2020 at 10:56:33AM +0000, Martina Krasteva wrote:
> > From: Martina Krasteva <martinax.krasteva@intel.com>
> >
> > Add a v4l2 sub-device driver for the Sony imx334 image sensor.
> > This is a camera sensor using the i2c bus for control and the
> > csi-2 bus for data.
> >
> > The following features are supported:
> > - manual exposure and analog gain control support
> > - vblank/hblank/pixel rate control support
> > - supported resolution:
> >     - 3840x2160 @ 60fps
> > - supported bayer order output:
> >     - SRGGB12
> 
> Could you add the external clock and link frequencies related properties
to the
> bindings and use them in the driver?
> 
> <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html>
> 
> Apart from these it looks good to me.

Thanks, the properties and the handling in the driver will be added in next
version
> 
> --
> Kind regards,
> 
> Sakari Ailus

Kind Regards,
Martina

