Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A72952255D0
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 04:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgGTCP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jul 2020 22:15:27 -0400
Received: from mga01.intel.com ([192.55.52.88]:10176 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726312AbgGTCP1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jul 2020 22:15:27 -0400
IronPort-SDR: 9mm0DynQ/t2anGi0P1xnSf3wHOX5ISoOxqPIQvdqFGohn1HTm+AG9YhRGBBOVTrfgFz21qADe4
 5hwP/6xN4oLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="167969291"
X-IronPort-AV: E=Sophos;i="5.75,373,1589266800"; 
   d="scan'208";a="167969291"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2020 19:15:26 -0700
IronPort-SDR: d1WB62cRq5P0pr0r6xP2Hg/eqqZBXqKV6bOHhVI7I8LLvNTj9FgDXdEHA/OLmPSFM51auLff9M
 NsEQ0rn1BaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,373,1589266800"; 
   d="scan'208";a="461513294"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga005.jf.intel.com with ESMTP; 19 Jul 2020 19:15:23 -0700
Subject: Re: [PATCH] staging: media: ipu3: Replace depracated MSI API.
To:     Suraj Upadhyay <usuraj35@gmail.com>, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200718133238.GA11982@blackclown>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <8dc91dd2-b165-bd97-00f7-16c4cb266163@linux.intel.com>
Date:   Mon, 20 Jul 2020 10:17:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200718133238.GA11982@blackclown>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Upadhyay,

Thanks for your patch. Please correct the typo in message.

On 7/18/20 9:32 PM, Suraj Upadhyay wrote:
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
> 

-- 
Best regards,
Bingbu Cao
