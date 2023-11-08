Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3ED87E556D
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 12:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235615AbjKHLZq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 06:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjKHLZa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 06:25:30 -0500
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9F22113
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 03:25:27 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mx.kolabnow.com (Postfix) with ESMTP id 25575300D3C4;
        Wed,  8 Nov 2023 12:25:25 +0100 (CET)
Authentication-Results: ext-mx-out013.mykolab.com (amavis);
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-transfer-encoding:content-type:content-type:in-reply-to
        :from:from:references:content-language:subject:subject
        :mime-version:date:date:message-id:received:received:received;
         s=dkim20160331; t=1699442723; x=1701257124; bh=iYVP3iGJUli2QBmz
        SBHuVh05aEMlOSC+X7mAKrTWqlw=; b=GxBAsnDxqMiIfJotFHqHy2l01CmzsUtK
        w6WoQY2Irk3jsQkUl1GvPIkj3JHi+J9lMH6HItKnAz5HmdMmnJH5WODKXHV/USaU
        6I9pgvX/KMuXkwrmDoMU0r0RH3suU/0AyJt5YwL3P0w7PVj/vRIvb00GKuupq3c0
        0crPyxGKwn2oRLsFlRYfnWnA1XJPawyOE61JGahsCXmswhS0XnX1f7+se5F+O9Px
        l8nrjBB6UkdZ99S4m2hMcu7q4feD0aj0NtmGLk5e73yugUA4gh2giwMBwGrJ62f/
        IQcbZHdyWqO3AiMziXljzJv/H+w4U4rSz6ms/+y65ZX0+7d6KXtH6PoV01z1H3Ym
        fBAZ/pc0msDroii0Ctd6iyf4VSHw4SPVyOwWekd0OWXCXD/G7Y2oc5gcxrMRAeA5
        Y4QRWObsnYKIqzMNrRout0WgQ3mcg1TjG8BTMLMbej5LV+LcH3GI+YotLp6b/GMW
        cenieyjY6w+bRH6NP6odgrc9D7XkChwlY2TyaUiJkRB+LL0YLml1/31Ht6R67Ynh
        YwQD5ZorTXD0jYKE3aM3IABzvZlVMUqc4ORyiX8a6v1swKd+52yx0woIhM5VXdQi
        4oYtmdvwOI+lXz6AVQKSgEUBt9+gaKIV34xM2CS9LtQLCXsXHEXJpcYQIj4Ur81R
        sUWSPFNJWO0=
X-Virus-Scanned: amavis at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1
X-Spam-Level: 
X-Spam-Status: No, score=-1 tagged_above=-10 required=5 tests=[ALL_TRUSTED=-1]
 autolearn=ham autolearn_force=no
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out013.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id dny97K6r-Voa; Wed,  8 Nov 2023 12:25:23 +0100 (CET)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
        by mx.kolabnow.com (Postfix) with ESMTPS id 77899300D36F;
        Wed,  8 Nov 2023 12:25:21 +0100 (CET)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
        by int-mx011.mykolab.com (Postfix) with ESMTPS id E365E30C01E2;
        Wed,  8 Nov 2023 12:25:20 +0100 (CET)
Message-ID: <a3184b70-e0b3-4227-94af-2412fd565724@hansg.org>
Date:   Wed, 8 Nov 2023 12:25:19 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
Content-Language: en-US, nl
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-2-bingbu.cao@intel.com>
From:   Hans de Goede <hans@hansg.org>
In-Reply-To: <20231024112924.3934228-2-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/24/23 13:29, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Intel Image Processing Unit 6th Gen includes input and processing systems
> but the hardware presents itself as a single PCI device in system.
> 
> IPU6 PCI device driver basically does PCI configurations and load
> the firmware binary, initialises IPU virtual bus, and sets up platform
> specific variants to support multiple IPU6 devices in single device
> driver.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Suggested-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
> ---
>  .../media/pci/intel/ipu6/ipu6-platform-regs.h | 179 ++++
>  drivers/media/pci/intel/ipu6/ipu6.c           | 952 ++++++++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6.h           | 352 +++++++
>  3 files changed, 1483 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h

<snip>

> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> new file mode 100644
> index 000000000000..84960a283daf
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -0,0 +1,952 @@

<snip>

> +static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
> +{
> +	int ret;
> +
> +	/* disable IPU6 PCI ATS on mtl ES2 */
> +	if (is_ipu6ep_mtl(hw_ver) && boot_cpu_data.x86_stepping == 0x2 &&
> +	    pci_ats_supported(dev))
> +		pci_disable_ats(dev);
> +
> +	/* No PCI msi capability for IPU6EP */
> +	if (is_ipu6ep(hw_ver) || is_ipu6ep_mtl(hw_ver)) {
> +		/* likely do nothing as msi not enabled by default */
> +		pci_disable_msi(dev);
> +		return 0;
> +	}
> +
> +	ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);

This does not work on TGL systems (and is not reached on ADL and RPL).

The out of tree driver instead uses:

        ret = pci_enable_msi(dev);

and that does work correctly on TGL.

Regards,

Hans


