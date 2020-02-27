Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBB3D1711C8
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 08:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgB0HvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 02:51:05 -0500
Received: from mga05.intel.com ([192.55.52.43]:46429 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728426AbgB0HvE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 02:51:04 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 23:51:04 -0800
X-IronPort-AV: E=Sophos;i="5.70,491,1574150400"; 
   d="scan'208";a="285249023"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 23:51:00 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C5F30209DF; Thu, 27 Feb 2020 09:50:58 +0200 (EET)
Date:   Thu, 27 Feb 2020 09:50:58 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RESEND PATCH v3 02/17] media: v4l2-fwnode: Pass notifier to
 v4l2_async_register_fwnode_subdev()
Message-ID: <20200227075058.GD5379@paasikivi.fi.intel.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
 <20200215194136.10131-3-slongerbeam@gmail.com>
 <20200225150721.GO5379@paasikivi.fi.intel.com>
 <33258045-b708-1390-06e0-fde224296dfb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33258045-b708-1390-06e0-fde224296dfb@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 26, 2020 at 03:50:04PM -0800, Steve Longerbeam wrote:
> Hi Sakari,
> 
> Thanks for the feedback.
> 
> 
> On 2/25/20 7:07 AM, Sakari Ailus wrote:
> > Hi Steve,
> > 
> > On Sat, Feb 15, 2020 at 11:41:21AM -0800, Steve Longerbeam wrote:
> > > Instead of allocating a notifier in v4l2_async_register_fwnode_subdev(),
> > > have the caller provide one. This allows the caller to implement
> > > notifier ops (bind, unbind).
> > > 
> > > The caller is now responsible for first initializing its notifier with a
> > > call to v4l2_async_notifier_init().
> > > 
> > > Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> > Instead of improving v4l2_async_register_fwnode_subdev(), could you convert
> > the users (IMX driver in this case) to call the preferred APIs instead?
> 
> I presume you mean using v4l2_async_notifier_add_fwnode_remote_subdev(). Ok,
> I'll convert to use that API.

Thanks, Steve!

-- 
Sakari Ailus
