Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6982CD1BD
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 09:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729959AbgLCIvC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 3 Dec 2020 03:51:02 -0500
Received: from mga03.intel.com ([134.134.136.65]:62768 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgLCIvB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 03:51:01 -0500
IronPort-SDR: PFPwVTPv2LuBjcSVMIRoJUK723wFcCvzIu2LPsv66J2c523QqaxygBoeFZxx8bf788F2auq2p3
 AEacZjUblvyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="173254085"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; 
   d="scan'208";a="173254085"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 00:49:20 -0800
IronPort-SDR: cQvZi5eX1y5fzT9MPa6Sxjb3bdEvAmgjkBVgazQcxotxLWxjTmVMbMxLmFShgnLLjxYuEMBtJX
 6sEepy/hsRjw==
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; 
   d="scan'208";a="550409154"
Received: from mkrastex-mobl.ger.corp.intel.com (HELO mkrastexMOBL) ([10.104.88.2])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 00:49:19 -0800
From:   "Martina Krasteva" <martinax.krasteva@linux.intel.com>
To:     "'Sebastian Fricke'" <sebastian.fricke.linux@gmail.com>,
        "'Sakari Ailus'" <sakari.ailus@linux.intel.com>
Cc:     <linux-media@vger.kernel.org>
References: <20201202181955.18165-1-sakari.ailus@linux.intel.com> <20201202181955.18165-3-sakari.ailus@linux.intel.com> <20201203050040.godctaxtvafpvaw3@basti.Speedport_W_724V_Typ_A_05011603_06_001>
In-Reply-To: <20201203050040.godctaxtvafpvaw3@basti.Speedport_W_724V_Typ_A_05011603_06_001>
Subject: RE: [PATCH 2/2] Documentation: v4l: Document that link_validate op is valid for sink only
Date:   Thu, 3 Dec 2020 08:49:16 -0000
Message-ID: <00b401d6c951$30ca8140$925f83c0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG/gAqarsh0CWvJsDMWEoMkshgBPAFqTYnTAeD6lSmp+UY+gA==
Content-Language: en-us
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you, Sakari.
This will remove any confusion regarding this matter.

> 
> Thank you.
> 
> On 02.12.2020 20:19, Sakari Ailus wrote:
> >The link_validate pad op will only be called on sink pads. Document this.
> >
> >Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >---
> > Documentation/driver-api/media/v4l2-subdev.rst | 11 ++++++-----
> > 1 file changed, 6 insertions(+), 5 deletions(-)
> >
> >diff --git a/Documentation/driver-api/media/v4l2-subdev.rst
> >b/Documentation/driver-api/media/v4l2-subdev.rst
> >index d4cba0d6c4ca..6d5c799c49fe 100644
> >--- a/Documentation/driver-api/media/v4l2-subdev.rst
> >+++ b/Documentation/driver-api/media/v4l2-subdev.rst
> >@@ -122,11 +122,12 @@ Don't forget to cleanup the media entity before the
> sub-device is destroyed:
> >
> > 	media_entity_cleanup(&sd->entity);
> >
> >-In that case, the subdev driver may set the link_validate field to
> >provide -its own link validation function. The link validation function
> >is called for -every link in the pipeline where both of the ends of the
> >links are V4L2 -sub-devices. The driver is still responsible for
> >validating the correctness -of the format configuration between sub-devices
> and video nodes.
> >+If a sub-device driver implements sink pads, the subdev driver may set
> >+the link_validate field in :c:type:`v4l2_subdev_pad_ops`to provide its
> >+own link validation function. For every link in the pipeline, the
> >+link_validate pad operation of the sink end of the link is called. In
> >+both cases the driver is
> 
> s/In both cases the driver/In both cases, the driver/
> 
> >+still responsible for validating the correctness of the format
> >+configuration between sub-devices and video nodes.
> >
> > If link_validate op is not set, the default function
> >:c:func:`v4l2_subdev_link_validate_default` is used instead. This
> >function
> >--
> >2.27.0
> >

Best Regards,
Martina

