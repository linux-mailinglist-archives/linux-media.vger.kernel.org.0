Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941F82440CF
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 23:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgHMVke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 17:40:34 -0400
Received: from mga07.intel.com ([134.134.136.100]:21835 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726192AbgHMVke (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 17:40:34 -0400
IronPort-SDR: gPoFmbQDoB1sDdpDiSZvlAfgi5Z+JycgLiMmEIDJMraSRPKbjrgY/O9iirrap9s8a+IrBwrljE
 w418qxt8/Ggg==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="218658444"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; 
   d="scan'208";a="218658444"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 14:40:33 -0700
IronPort-SDR: bX8ONL1waEA2CrBviOzY+VKb8U80uMrAcyaqIj14Gd/WWboRHPcItAtuddgJCTpYnJBIOOL3yW
 0yyEl7tzj6cQ==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; 
   d="scan'208";a="439920140"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 14:40:31 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0B7A120699; Fri, 14 Aug 2020 00:40:29 +0300 (EEST)
Date:   Fri, 14 Aug 2020 00:40:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Suraj Upadhyay <usuraj35@gmail.com>
Cc:     bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu3: Replace depracated MSI API.
Message-ID: <20200813214028.GB24582@paasikivi.fi.intel.com>
References: <20200718133238.GA11982@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200718133238.GA11982@blackclown>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Suraj,

Thanks for the patch.

On Sat, Jul 18, 2020 at 07:02:38PM +0530, Suraj Upadhyay wrote:
> Replace depracated psi_enable_msi with pci_alloc_irq_vectors.
> And as a result modify how the returned value is handled.
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>  drivers/staging/media/ipu3/ipu3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> index ee1bba6bdcac..54690e7442be 100644
> --- a/drivers/staging/media/ipu3/ipu3.c
> +++ b/drivers/staging/media/ipu3/ipu3.c
> @@ -602,9 +602,9 @@ static irqreturn_t imgu_isr(int irq, void *imgu_ptr)
>  static int imgu_pci_config_setup(struct pci_dev *dev)
>  {
>  	u16 pci_command;
> -	int r = pci_enable_msi(dev);
> +	int r = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
>  
> -	if (r) {
> +	if (r < 0) {
>  		dev_err(&dev->dev, "failed to enable MSI (%d)\n", r);
>  		return r;
>  	}

I believe fixing this requires also releasing it, i.e. a call to
pci_free_irq_vectors(). This seems to have been missing.

-- 
Kind regards,

Sakari Ailus
