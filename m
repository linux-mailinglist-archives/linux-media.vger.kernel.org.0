Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3EC921E4A0
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 02:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgGNAiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 20:38:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:48846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbgGNAiS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 20:38:18 -0400
Received: from localhost (mobile-166-175-191-139.mycingular.net [166.175.191.139])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43BF721835;
        Tue, 14 Jul 2020 00:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594687097;
        bh=pFcNS2ygVqW7ey6A2Cca3OTCddtdMGr4gJx98JrrPYY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=s042KyzvtI4w4VGAyAkcy2v2y653tZtfuqChNgbbl0qQaDRvArLmp56nOPblDDmFX
         exgh+cqRpD+VVSxisUJXcDotaJf7qZEJrbzrGDxsyVrzVeo1F/OeYxIXhJeZBTbSRu
         QXaXwEPSGMFFUJ2ZslA7SJPv7Ne89gWFHQYESUhI=
Date:   Mon, 13 Jul 2020 19:38:14 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>, bjorn@helgaas.com,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
Subject: Re: [PATCH v1 2/6] [media] cx23885: use generic power management
Message-ID: <20200714003814.GA292013@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4a46846-208f-c834-56d7-02543c395795@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 13, 2020 at 12:01:51PM +0200, Hans Verkuil wrote:
> On 29/06/2020 09:36, Vaibhav Gupta wrote:
> > The .suspend() and .resume() callbacks are not defined for this driver.
> > Still, their power managemgement stucture can be easily upgraded to
> 
> management structure
> 
> > gemeric, without affecting its normal behaviour.
> 
> generic
> 
> > Hence, define them NULL and use struct dev_pm_ops type to bind them.
> > 
> > Compile-tested only.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/media/pci/cx23885/cx23885-core.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
> > index 7e0b0b7cc2a3..da9ee7270dfd 100644
> > --- a/drivers/media/pci/cx23885/cx23885-core.c
> > +++ b/drivers/media/pci/cx23885/cx23885-core.c
> > @@ -2230,14 +2230,18 @@ static const struct pci_device_id cx23885_pci_tbl[] = {
> >  };
> >  MODULE_DEVICE_TABLE(pci, cx23885_pci_tbl);
> >  
> > +#define cx23885_suspend NULL
> > +#define cx23885_resume NULL
> > +
> > +static SIMPLE_DEV_PM_OPS(cx23885_pm_ops, cx23885_suspend, cx23885_resume);
> > +
> >  static struct pci_driver cx23885_pci_driver = {
> > -	.name     = "cx23885",
> > -	.id_table = cx23885_pci_tbl,
> > -	.probe    = cx23885_initdev,
> > -	.remove   = cx23885_finidev,
> > +	.name      = "cx23885",
> > +	.id_table  = cx23885_pci_tbl,
> > +	.probe     = cx23885_initdev,
> > +	.remove    = cx23885_finidev,
> >  	/* TODO */
> > -	.suspend  = NULL,
> > -	.resume   = NULL,
> > +	.driver.pm = &cx23885_pm_ops,
> 
> I don't entirely understand this. Wouldn't it be sufficient to just
> drop the .suspend/.resume assignments here? It is now required for
> driver.pm to be non-NULL?
> 
> I'm not up to speed on the changes, but normally you can leave things
> NULL if you don't support a feature (PM in this case).

I think this patch will break things.  Previously, we had:

  cx23885_pci_driver.suspend == NULL
  cx23885_pci_driver.resume == NULL
  cx23885_pci_driver.driver.pm == NULL

pci_pm_suspend() looks like:

  if (pci_has_legacy_pm_support(pci_dev))
    return pci_legacy_suspend(dev, PMSG_SUSPEND);

  if (!pm) {
    pci_pm_default_suspend(pci_dev);
    return 0;
  }

pci_has_legacy_pm_support() was false since drv->suspend and
drv->resume are both NULL, so we'd take the pci_pm_default_suspend()
path.  After this patch, driver.pm would no longer be NULL, so we'd
take a different path that is clearly not equivalent.

I think you should do this:

  - 	/* TODO */
  -	.suspend  = NULL,
  -	.resume   = NULL,

and leave .driver.pm NULL by not mentioning it at all.  That should be
identical at the object code level since those are the defaults
anyway.

That almost looks like useless churn, but the point of this patch is
to remove use of PCI legacy PM (pci_driver.suspend and .resume) so we
can completely remove that infrastructure from the PCI core, including
the .suspend and .resume members of struct pci_driver, so we really do
need to do it.

Bjorn
