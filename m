Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530B122F6B0
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 19:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731084AbgG0RbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 13:31:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:51502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730662AbgG0RbH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 13:31:07 -0400
Received: from localhost (mobile-166-175-191-139.mycingular.net [166.175.191.139])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B9CAA2073E;
        Mon, 27 Jul 2020 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595871067;
        bh=osqvklvmaTXGOifhXvDFzV85j8Kp/evJwoU4aORbmY8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=GMi82eX9ZWYMrzDcjH+j+OtuU0r+iZUyVTpL1xTVnTNY4glD78FZ6guoGH5v/JiDs
         uIDCUp1QDlH2pOgyLcoDK51r4Jg4JwhAEGABhEe3h8NRk1e6M2KQnvoD5eW7mT9t4/
         tv2sTSfYNO1aNpt19NxZ1dtpgrAtnBdNSzupyzA8=
Date:   Mon, 27 Jul 2020 12:31:05 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: Fix email typo and correct name of Tianshu
Message-ID: <20200727173105.GA1758148@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR11MB3028D74ABDBEBCED28ADFB9EDE720@BL0PR11MB3028.namprd11.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 04:20:39AM +0000, Qiu, Tian Shu wrote:
> Reviewed-by: Tianshu Qiu <tian.shu.qiu@intel.com>

This doesn't really make sense.  The patch already contains your
Signed-off-by, which means you participated in its development (see
Documentation/process/submitting-patches.rst), and I don't think it
makes sense to review your own patch.

> > -----Original Message-----
> > From: Cao, Bingbu <bingbu.cao@intel.com>
> > Sent: Monday, July 27, 2020 12:12 PM
> > To: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; helgaas@kernel.org
> > Cc: sakari.ailus@linux.intel.com; Qiu, Tian Shu <tian.shu.qiu@intel.com>; Cao, Bingbu <bingbu.cao@intel.com>;
> > bingbu.cao@linux.intel.com
> > Subject: [PATCH] MAINTAINERS: Fix email typo and correct name of Tianshu
> > 
> > Fix the typo in email address of Tianshu Qiu and correct the name.
> > 
> > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > Signed-off-by: Tianshu Qiu <tian.shu.qiu@intel.com>

Also, Documentation/process/submitting-patches.rst says "the last
Signed-off-by: must always be that of the developer submitting the
patch," which means these should be reversed, since Bingbu submitted
the patch.

> > Reported-by: Bjorn Helgaas <helgaas@kernel.org>

I don't care whether you include this or not, but if you do, it would
typically go first, since the report comes before the writing of the
patch.

> > ---
> >  MAINTAINERS | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5392f00cec46..638dfa99751b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8765,7 +8765,7 @@ INTEL IPU3 CSI-2 CIO2 DRIVER
> >  M:	Yong Zhi <yong.zhi@intel.com>
> >  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> >  M:	Bingbu Cao <bingbu.cao@intel.com>
> > -R:	Tian Shu Qiu <tian.shu.qiu@intel.com>
> > +R:	Tianshu Qiu <tian.shu.qiu@intel.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  F:	Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
> > @@ -8774,7 +8774,7 @@ F:	drivers/media/pci/intel/ipu3/
> >  INTEL IPU3 CSI-2 IMGU DRIVER
> >  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> >  R:	Bingbu Cao <bingbu.cao@intel.com>
> > -R:	Tian Shu Qiu <tian.shu.qiu@intel.com>
> > +R:	Tianshu Qiu <tian.shu.qiu@intel.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  F:	Documentation/admin-guide/media/ipu3.rst
> > @@ -12609,7 +12609,7 @@ T:	git git://linuxtv.org/media_tree.git
> >  F:	drivers/media/i2c/ov2685.c
> > 
> >  OMNIVISION OV2740 SENSOR DRIVER
> > -M:	Tianshu Qiu <tian.shu.qiua@intel.com>
> > +M:	Tianshu Qiu <tian.shu.qiu@intel.com>
> >  R:	Shawn Tu <shawnx.tu@intel.com>
> >  R:	Bingbu Cao <bingbu.cao@intel.com>
> >  L:	linux-media@vger.kernel.org
> > --
> > 2.7.4
> 
