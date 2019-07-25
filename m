Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF27749A6
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 11:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390305AbfGYJQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 05:16:47 -0400
Received: from mga01.intel.com ([192.55.52.88]:23947 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390290AbfGYJQr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 05:16:47 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jul 2019 02:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,306,1559545200"; 
   d="scan'208";a="369585957"
Received: from eunjooki-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.249.33.131])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 02:16:44 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id E6B6222086; Thu, 25 Jul 2019 12:14:06 +0300 (EEST)
Date:   Thu, 25 Jul 2019 12:14:06 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "Zhi, Yong" <yong.zhi@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Akihiro Tsukada <tskd08@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: pci: Use dev_get_drvdata where possible
Message-ID: <20190725091406.GB2335@kekkonen.localdomain>
References: <20190723115014.18537-1-hslester96@gmail.com>
 <EE45BB6704246A4E914B70E8B61FB42A15C77041@SHSMSX104.ccr.corp.intel.com>
 <CANhBUQ1uODBgoiHk8nrMrtdJ2E-C70PgRJm7zLkWGoQDovKpzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANhBUQ1uODBgoiHk8nrMrtdJ2E-C70PgRJm7zLkWGoQDovKpzg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 24, 2019 at 09:23:41AM +0800, Chuhong Yuan wrote:
> On Tue, Jul 23, 2019 at 10:39 PM Cao, Bingbu <bingbu.cao@intel.com> wrote:
> >
> >
> >
> > ________________________
> > BRs,
> > Bingbu Cao
> >
> >
> > -----Original Message-----
> > From: Chuhong Yuan <hslester96@gmail.com>
> > Sent: Tuesday, July 23, 2019 7:50 PM
> > Cc: Zhi, Yong <yong.zhi@intel.com>; Sakari Ailus <sakari.ailus@linux.intel.com>; Cao, Bingbu <bingbu.cao@intel.com>; Mauro Carvalho Chehab <mchehab@kernel.org>; Akihiro Tsukada <tskd08@gmail.com>; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Chuhong Yuan <hslester96@gmail.com>
> > Subject: [PATCH] media: pci: Use dev_get_drvdata where possible
> >
> > Instead of using to_pci_dev + pci_get_drvdata, use dev_get_drvdata to make code simpler.
> >
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> > ---
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 3 +--
> >  drivers/media/pci/pt1/pt1.c              | 6 ++----
> >  drivers/media/pci/pt3/pt3.c              | 6 ++----
> >  3 files changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > index c1d133e17e4b..50a34bcd4d14 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > @@ -2000,8 +2000,7 @@ static int __maybe_unused cio2_suspend(struct device *dev)
> >
> >  static int __maybe_unused cio2_resume(struct device *dev)  {
> > -       struct pci_dev *pci_dev = to_pci_dev(dev);
> > -       struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
> > +       struct cio2_device *cio2 = dev_get_drvdata(dev);
> >
> > Thanks for your patch.
> > I think using pci_get_drvdata() here mainly make a pair with the pci_set_drvdata() in probe.
> 
> Thanks for your reply.
> I will change pci_set_drvdata() to dev_set_drvdata() in the next
> version to keep their consistency.

Sorry guys; I like this one better. These pci_*() functions are just
wrappers around the dev_*() equivalents; you can use the one you like at
any given occasion. In this case the pci prefixed one is more convenient.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
