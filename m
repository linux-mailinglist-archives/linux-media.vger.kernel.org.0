Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE1CF4ABEDB
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 14:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384335AbiBGMsV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 07:48:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445045AbiBGMla (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 07:41:30 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 04:32:38 PST
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A254C03EEDF
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 04:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644237158; x=1675773158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YsqjEW82Ay+rjKsB/YzvWeq6T9tkj0yXOlDBLtYlfck=;
  b=mkr0q/X+d0ag7ag0iEjr7RzY41jCZnIzIc6i14eJBkxpIIu2C7xnrvmk
   nuWlYwVhgnoCsdVRIgHv0lUPZm0YKFDLBWqq7zXz35HndqPxTwP/2v57+
   0789qi07pyts3Frwf6AZAGesW8pOJD+MfErxz0B+QgLlsCEwbD366Tudv
   U0eUaKQ/FELWa/IPGQI5GlH3JJP/eMAlMK8aKkf0wk9YcqBPjnWnOPvBg
   tR+77XJI8v1LKG8zHn3BAfCJVOj+NuqtVRr0qkMqVQmJ/ejaVuhmWgeV2
   myyEv71fxnXiuHKcN4M9uLA0CFT1NZgY9MWaIXM+PU3T5DqQ/b/mMPqmJ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="312002893"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="312002893"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 04:31:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="484405915"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 04:31:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nH3A4-001tpS-SG;
        Mon, 07 Feb 2022 14:30:28 +0200
Date:   Mon, 7 Feb 2022 14:30:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
Cc:     gregkh@linuxfoundation.org, joe@perches.com, kitakar@gmail.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH v3] staging: media: atomisp: Use BIT macro instead of
 left shifting
Message-ID: <YgEQ5GktAWCw1MKk@smile.fi.intel.com>
References: <20220130180655.22970-1-mosescb.dev@gmail.com>
 <20220206185232.21726-1-mosescb.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220206185232.21726-1-mosescb.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Feb 06, 2022 at 07:52:32PM +0100, Moses Christopher Bollavarapu wrote:
> There is a BIT(nr) macro available in Linux Kernel,
> which does the same thing.
> Example: BIT(7) = (1UL << 7)

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
> ---
>  V2 -> V3: - Remove GENMASK changes from this patch
>            - Minor style changes
>  V1 -> V2: - Use GENMASK where-ever applicable
>            - Add linux/bits.h header to modified files
> 
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  | 19 ++---
>  .../media/atomisp/pci/ia_css_acc_types.h      |  5 +-
>  .../staging/media/atomisp/pci/ia_css_env.h    |  9 ++-
>  .../media/atomisp/pci/ia_css_event_public.h   | 33 ++++----
>  .../staging/media/atomisp/pci/ia_css_irq.h    | 77 ++++++++++---------
>  .../runtime/debug/interface/ia_css_debug.h    | 31 ++++----
>  6 files changed, 90 insertions(+), 84 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 1b240891a6e2..ce44c880fb8b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -25,6 +25,7 @@
>  #include <linux/delay.h>
>  #include <linux/dmi.h>
>  #include <linux/interrupt.h>

> +#include <linux/bits.h>

Probably this can be still ordered.

>  #include <asm/iosf_mbi.h>
>  
> @@ -626,11 +627,11 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
>  	 * IRQ, if so, waiting for it to be served
>  	 */
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -	irq = irq & 1 << INTR_IIR;
> +	irq &= BIT(INTR_IIR);
>  	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
>  
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -	if (!(irq & (1 << INTR_IIR)))
> +	if (!(irq & BIT(INTR_IIR)))
>  		goto done;
>  
>  	atomisp_css2_hw_store_32(MRFLD_INTR_CLEAR_REG, 0xFFFFFFFF);
> @@ -643,11 +644,11 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
>  		return -EAGAIN;
>  	} else {
>  		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -		irq = irq & 1 << INTR_IIR;
> +		irq &= BIT(INTR_IIR);
>  		pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
>  
>  		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -		if (!(irq & (1 << INTR_IIR))) {
> +		if (!(irq & BIT(INTR_IIR))) {
>  			atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
>  			goto done;
>  		}
> @@ -666,7 +667,7 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
>  	* HW sighting:4568410.
>  	*/
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -	irq &= ~(1 << INTR_IER);
> +	irq &= ~BIT(INTR_IER);
>  	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
>  
>  	atomisp_msi_irq_uninit(isp);
> @@ -1549,7 +1550,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  	start = pci_resource_start(pdev, ATOM_ISP_PCI_BAR);
>  	dev_dbg(&pdev->dev, "start: 0x%x\n", start);
>  
> -	err = pcim_iomap_regions(pdev, 1 << ATOM_ISP_PCI_BAR, pci_name(pdev));
> +	err = pcim_iomap_regions(pdev, BIT(ATOM_ISP_PCI_BAR), pci_name(pdev));
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to I/O memory remapping (%d)\n", err);
>  		goto ioremap_fail;
> @@ -1838,11 +1839,11 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  	 */
>  
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -	irq = irq & 1 << INTR_IIR;
> +	irq &= BIT(INTR_IIR);
>  	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
>  
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -	irq &= ~(1 << INTR_IER);
> +	irq &= ~BIT(INTR_IER);
>  	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
>  
>  	atomisp_msi_irq_uninit(isp);
> @@ -1854,7 +1855,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  		dev_err(&pdev->dev, "Failed to switch off ISP\n");
>  
>  atomisp_dev_alloc_fail:
> -	pcim_iounmap_regions(pdev, 1 << ATOM_ISP_PCI_BAR);
> +	pcim_iounmap_regions(pdev, BIT(ATOM_ISP_PCI_BAR));
>  
>  ioremap_fail:
>  	return err;
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> index d0ce2f8ba653..a20879aedef6 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> @@ -24,6 +24,7 @@
>  #include <type_support.h>
>  #include <platform_support.h>
>  #include <debug_global.h>

> +#include <linux/bits.h>

Ditto.

>  #include "ia_css_types.h"
>  #include "ia_css_frame_format.h"
> @@ -466,7 +467,7 @@ struct ia_css_acc_fw {
>  
>  enum ia_css_sp_sleep_mode {
>  	SP_DISABLE_SLEEP_MODE = 0,
> -	SP_SLEEP_AFTER_FRAME = 1 << 0,
> -	SP_SLEEP_AFTER_IRQ = 1 << 1
> +	SP_SLEEP_AFTER_FRAME  = BIT(0),
> +	SP_SLEEP_AFTER_IRQ    = BIT(1),
>  };
>  #endif /* _IA_CSS_ACC_TYPES_H */
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_env.h b/drivers/staging/media/atomisp/pci/ia_css_env.h
> index 3b89bbd837a0..42bb1ec1c22d 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_env.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_env.h
> @@ -18,6 +18,7 @@
>  
>  #include <type_support.h>
>  #include <linux/stdarg.h> /* va_list */

> +#include <linux/bits.h>

Ditto.

>  #include "ia_css_types.h"
>  #include "ia_css_acc_types.h"
>  
> @@ -28,10 +29,10 @@
>  
>  /* Memory allocation attributes, for use in ia_css_css_mem_env. */
>  enum ia_css_mem_attr {
> -	IA_CSS_MEM_ATTR_CACHED = 1 << 0,
> -	IA_CSS_MEM_ATTR_ZEROED = 1 << 1,
> -	IA_CSS_MEM_ATTR_PAGEALIGN = 1 << 2,
> -	IA_CSS_MEM_ATTR_CONTIGUOUS = 1 << 3,
> +	IA_CSS_MEM_ATTR_CACHED     = BIT(0),
> +	IA_CSS_MEM_ATTR_ZEROED     = BIT(1),
> +	IA_CSS_MEM_ATTR_PAGEALIGN  = BIT(2),
> +	IA_CSS_MEM_ATTR_CONTIGUOUS = BIT(3),
>  };
>  
>  /* Environment with function pointers for local IA memory allocation.
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_event_public.h b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
> index 76219d741d2e..b052648d4fc2 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_event_public.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
> @@ -24,6 +24,7 @@
>  #include <ia_css_err.h>		/* ia_css_err */
>  #include <ia_css_types.h>	/* ia_css_pipe */
>  #include <ia_css_timer.h>	/* ia_css_timer */

> +#include <linux/bits.h>

Ditto.

>  /* The event type, distinguishes the kind of events that
>   * can are generated by the CSS system.
> @@ -35,38 +36,38 @@
>   * 4) "enum ia_css_event_type convert_event_sp_to_host_domain"	(sh_css.c)
>   */
>  enum ia_css_event_type {
> -	IA_CSS_EVENT_TYPE_OUTPUT_FRAME_DONE		= 1 << 0,
> +	IA_CSS_EVENT_TYPE_OUTPUT_FRAME_DONE		= BIT(0),
>  	/** Output frame ready. */
> -	IA_CSS_EVENT_TYPE_SECOND_OUTPUT_FRAME_DONE	= 1 << 1,
> +	IA_CSS_EVENT_TYPE_SECOND_OUTPUT_FRAME_DONE	= BIT(1),
>  	/** Second output frame ready. */
> -	IA_CSS_EVENT_TYPE_VF_OUTPUT_FRAME_DONE		= 1 << 2,
> +	IA_CSS_EVENT_TYPE_VF_OUTPUT_FRAME_DONE		= BIT(2),
>  	/** Viewfinder Output frame ready. */
> -	IA_CSS_EVENT_TYPE_SECOND_VF_OUTPUT_FRAME_DONE	= 1 << 3,
> +	IA_CSS_EVENT_TYPE_SECOND_VF_OUTPUT_FRAME_DONE	= BIT(3),
>  	/** Second viewfinder Output frame ready. */
> -	IA_CSS_EVENT_TYPE_3A_STATISTICS_DONE		= 1 << 4,
> +	IA_CSS_EVENT_TYPE_3A_STATISTICS_DONE		= BIT(4),
>  	/** Indication that 3A statistics are available. */
> -	IA_CSS_EVENT_TYPE_DIS_STATISTICS_DONE		= 1 << 5,
> +	IA_CSS_EVENT_TYPE_DIS_STATISTICS_DONE		= BIT(5),
>  	/** Indication that DIS statistics are available. */
> -	IA_CSS_EVENT_TYPE_PIPELINE_DONE			= 1 << 6,
> +	IA_CSS_EVENT_TYPE_PIPELINE_DONE			= BIT(6),
>  	/** Pipeline Done event, sent after last pipeline stage. */
> -	IA_CSS_EVENT_TYPE_FRAME_TAGGED			= 1 << 7,
> +	IA_CSS_EVENT_TYPE_FRAME_TAGGED			= BIT(7),
>  	/** Frame tagged. */
> -	IA_CSS_EVENT_TYPE_INPUT_FRAME_DONE		= 1 << 8,
> +	IA_CSS_EVENT_TYPE_INPUT_FRAME_DONE		= BIT(8),
>  	/** Input frame ready. */
> -	IA_CSS_EVENT_TYPE_METADATA_DONE			= 1 << 9,
> +	IA_CSS_EVENT_TYPE_METADATA_DONE			= BIT(9),
>  	/** Metadata ready. */
> -	IA_CSS_EVENT_TYPE_LACE_STATISTICS_DONE		= 1 << 10,
> +	IA_CSS_EVENT_TYPE_LACE_STATISTICS_DONE		= BIT(10),
>  	/** Indication that LACE statistics are available. */
> -	IA_CSS_EVENT_TYPE_ACC_STAGE_COMPLETE		= 1 << 11,
> +	IA_CSS_EVENT_TYPE_ACC_STAGE_COMPLETE		= BIT(11),
>  	/** Extension stage complete. */
> -	IA_CSS_EVENT_TYPE_TIMER				= 1 << 12,
> +	IA_CSS_EVENT_TYPE_TIMER				= BIT(12),
>  	/** Timer event for measuring the SP side latencies. It contains the
>  	     32-bit timer value from the SP */
> -	IA_CSS_EVENT_TYPE_PORT_EOF			= 1 << 13,
> +	IA_CSS_EVENT_TYPE_PORT_EOF			= BIT(13),
>  	/** End Of Frame event, sent when in buffered sensor mode. */
> -	IA_CSS_EVENT_TYPE_FW_WARNING			= 1 << 14,
> +	IA_CSS_EVENT_TYPE_FW_WARNING			= BIT(14),
>  	/** Performance warning encounter by FW */
> -	IA_CSS_EVENT_TYPE_FW_ASSERT			= 1 << 15,
> +	IA_CSS_EVENT_TYPE_FW_ASSERT			= BIT(15),
>  	/** Assertion hit by FW */
>  };
>  
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_irq.h b/drivers/staging/media/atomisp/pci/ia_css_irq.h
> index 3b81a39cfe97..26b1b3c8ba62 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_irq.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_irq.h
> @@ -23,6 +23,7 @@
>  #include "ia_css_err.h"
>  #include "ia_css_pipe_public.h"
>  #include "ia_css_input_port.h"

> +#include <linux/bits.h>

Ditto.

>  /* Interrupt types, these enumerate all supported interrupt types.
>   */
> @@ -46,49 +47,49 @@ enum ia_css_irq_type {
>   * (SW) interrupts
>   */
>  enum ia_css_irq_info {
> -	IA_CSS_IRQ_INFO_CSS_RECEIVER_ERROR            = 1 << 0,
> +	IA_CSS_IRQ_INFO_CSS_RECEIVER_ERROR            = BIT(0),
>  	/** the css receiver has encountered an error */
> -	IA_CSS_IRQ_INFO_CSS_RECEIVER_FIFO_OVERFLOW    = 1 << 1,
> +	IA_CSS_IRQ_INFO_CSS_RECEIVER_FIFO_OVERFLOW    = BIT(1),
>  	/** the FIFO in the csi receiver has overflown */
> -	IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF              = 1 << 2,
> +	IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF              = BIT(2),
>  	/** the css receiver received the start of frame */
> -	IA_CSS_IRQ_INFO_CSS_RECEIVER_EOF              = 1 << 3,
> +	IA_CSS_IRQ_INFO_CSS_RECEIVER_EOF              = BIT(3),
>  	/** the css receiver received the end of frame */
> -	IA_CSS_IRQ_INFO_CSS_RECEIVER_SOL              = 1 << 4,
> +	IA_CSS_IRQ_INFO_CSS_RECEIVER_SOL              = BIT(4),
>  	/** the css receiver received the start of line */
> -	IA_CSS_IRQ_INFO_EVENTS_READY                  = 1 << 5,
> +	IA_CSS_IRQ_INFO_EVENTS_READY                  = BIT(5),
>  	/** One or more events are available in the PSYS event queue */
> -	IA_CSS_IRQ_INFO_CSS_RECEIVER_EOL              = 1 << 6,
> +	IA_CSS_IRQ_INFO_CSS_RECEIVER_EOL              = BIT(6),
>  	/** the css receiver received the end of line */
> -	IA_CSS_IRQ_INFO_CSS_RECEIVER_SIDEBAND_CHANGED = 1 << 7,
> +	IA_CSS_IRQ_INFO_CSS_RECEIVER_SIDEBAND_CHANGED = BIT(7),
>  	/** the css receiver received a change in side band signals */
> -	IA_CSS_IRQ_INFO_CSS_RECEIVER_GEN_SHORT_0      = 1 << 8,
> +	IA_CSS_IRQ_INFO_CSS_RECEIVER_GEN_SHORT_0      = BIT(8),
>  	/** generic short packets (0) */
> -	IA_CSS_IRQ_INFO_CSS_RECEIVER_GEN_SHORT_1      = 1 << 9,
> +	IA_CSS_IRQ_INFO_CSS_RECEIVER_GEN_SHORT_1      = BIT(9),
>  	/** generic short packets (1) */
> -	IA_CSS_IRQ_INFO_IF_PRIM_ERROR                 = 1 << 10,
> +	IA_CSS_IRQ_INFO_IF_PRIM_ERROR                 = BIT(10),
>  	/** the primary input formatter (A) has encountered an error */
> -	IA_CSS_IRQ_INFO_IF_PRIM_B_ERROR               = 1 << 11,
> +	IA_CSS_IRQ_INFO_IF_PRIM_B_ERROR               = BIT(11),
>  	/** the primary input formatter (B) has encountered an error */
> -	IA_CSS_IRQ_INFO_IF_SEC_ERROR                  = 1 << 12,
> +	IA_CSS_IRQ_INFO_IF_SEC_ERROR                  = BIT(12),
>  	/** the secondary input formatter has encountered an error */
> -	IA_CSS_IRQ_INFO_STREAM_TO_MEM_ERROR           = 1 << 13,
> +	IA_CSS_IRQ_INFO_STREAM_TO_MEM_ERROR           = BIT(13),
>  	/** the stream-to-memory device has encountered an error */
> -	IA_CSS_IRQ_INFO_SW_0                          = 1 << 14,
> +	IA_CSS_IRQ_INFO_SW_0                          = BIT(14),
>  	/** software interrupt 0 */
> -	IA_CSS_IRQ_INFO_SW_1                          = 1 << 15,
> +	IA_CSS_IRQ_INFO_SW_1                          = BIT(15),
>  	/** software interrupt 1 */
> -	IA_CSS_IRQ_INFO_SW_2                          = 1 << 16,
> +	IA_CSS_IRQ_INFO_SW_2                          = BIT(16),
>  	/** software interrupt 2 */
> -	IA_CSS_IRQ_INFO_ISP_BINARY_STATISTICS_READY   = 1 << 17,
> +	IA_CSS_IRQ_INFO_ISP_BINARY_STATISTICS_READY   = BIT(17),
>  	/** ISP binary statistics are ready */
> -	IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR            = 1 << 18,
> +	IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR            = BIT(18),
>  	/** the input system in in error */
> -	IA_CSS_IRQ_INFO_IF_ERROR                      = 1 << 19,
> +	IA_CSS_IRQ_INFO_IF_ERROR                      = BIT(19),
>  	/** the input formatter in in error */
> -	IA_CSS_IRQ_INFO_DMA_ERROR                     = 1 << 20,
> +	IA_CSS_IRQ_INFO_DMA_ERROR                     = BIT(20),
>  	/** the dma in in error */
> -	IA_CSS_IRQ_INFO_ISYS_EVENTS_READY             = 1 << 21,
> +	IA_CSS_IRQ_INFO_ISYS_EVENTS_READY             = BIT(21),
>  	/** end-of-frame events are ready in the isys_event queue */
>  };
>  
> @@ -103,23 +104,23 @@ enum ia_css_irq_info {
>   * different receiver types, or possibly none in case of tests systems.
>   */
>  enum ia_css_rx_irq_info {
> -	IA_CSS_RX_IRQ_INFO_BUFFER_OVERRUN   = 1U << 0, /** buffer overrun */
> -	IA_CSS_RX_IRQ_INFO_ENTER_SLEEP_MODE = 1U << 1, /** entering sleep mode */
> -	IA_CSS_RX_IRQ_INFO_EXIT_SLEEP_MODE  = 1U << 2, /** exited sleep mode */
> -	IA_CSS_RX_IRQ_INFO_ECC_CORRECTED    = 1U << 3, /** ECC corrected */
> -	IA_CSS_RX_IRQ_INFO_ERR_SOT          = 1U << 4,
> +	IA_CSS_RX_IRQ_INFO_BUFFER_OVERRUN   = BIT(0),  /** buffer overrun */
> +	IA_CSS_RX_IRQ_INFO_ENTER_SLEEP_MODE = BIT(1),  /** entering sleep mode */
> +	IA_CSS_RX_IRQ_INFO_EXIT_SLEEP_MODE  = BIT(2),  /** exited sleep mode */
> +	IA_CSS_RX_IRQ_INFO_ECC_CORRECTED    = BIT(3),  /** ECC corrected */
> +	IA_CSS_RX_IRQ_INFO_ERR_SOT          = BIT(4),
>  	/** Start of transmission */
> -	IA_CSS_RX_IRQ_INFO_ERR_SOT_SYNC     = 1U << 5, /** SOT sync (??) */
> -	IA_CSS_RX_IRQ_INFO_ERR_CONTROL      = 1U << 6, /** Control (??) */
> -	IA_CSS_RX_IRQ_INFO_ERR_ECC_DOUBLE   = 1U << 7, /** Double ECC */
> -	IA_CSS_RX_IRQ_INFO_ERR_CRC          = 1U << 8, /** CRC error */
> -	IA_CSS_RX_IRQ_INFO_ERR_UNKNOWN_ID   = 1U << 9, /** Unknown ID */
> -	IA_CSS_RX_IRQ_INFO_ERR_FRAME_SYNC   = 1U << 10,/** Frame sync error */
> -	IA_CSS_RX_IRQ_INFO_ERR_FRAME_DATA   = 1U << 11,/** Frame data error */
> -	IA_CSS_RX_IRQ_INFO_ERR_DATA_TIMEOUT = 1U << 12,/** Timeout occurred */
> -	IA_CSS_RX_IRQ_INFO_ERR_UNKNOWN_ESC  = 1U << 13,/** Unknown escape seq. */
> -	IA_CSS_RX_IRQ_INFO_ERR_LINE_SYNC    = 1U << 14,/** Line Sync error */
> -	IA_CSS_RX_IRQ_INFO_INIT_TIMEOUT     = 1U << 15,
> +	IA_CSS_RX_IRQ_INFO_ERR_SOT_SYNC     = BIT(5),  /** SOT sync (??) */
> +	IA_CSS_RX_IRQ_INFO_ERR_CONTROL      = BIT(6),  /** Control (??) */
> +	IA_CSS_RX_IRQ_INFO_ERR_ECC_DOUBLE   = BIT(7),  /** Double ECC */
> +	IA_CSS_RX_IRQ_INFO_ERR_CRC          = BIT(8),  /** CRC error */
> +	IA_CSS_RX_IRQ_INFO_ERR_UNKNOWN_ID   = BIT(9),  /** Unknown ID */
> +	IA_CSS_RX_IRQ_INFO_ERR_FRAME_SYNC   = BIT(10), /** Frame sync error */
> +	IA_CSS_RX_IRQ_INFO_ERR_FRAME_DATA   = BIT(11), /** Frame data error */
> +	IA_CSS_RX_IRQ_INFO_ERR_DATA_TIMEOUT = BIT(12), /** Timeout occurred */
> +	IA_CSS_RX_IRQ_INFO_ERR_UNKNOWN_ESC  = BIT(13), /** Unknown escape seq. */
> +	IA_CSS_RX_IRQ_INFO_ERR_LINE_SYNC    = BIT(14), /** Line Sync error */
> +	IA_CSS_RX_IRQ_INFO_INIT_TIMEOUT     = BIT(15),
>  };
>  
>  /* Interrupt info structure. This structure contains information about an
> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> index e37ef4232c55..fff89e9b4b01 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> @@ -20,6 +20,7 @@
>  
>  #include <type_support.h>
>  #include <linux/stdarg.h>

> +#include <linux/bits.h>

Ditto.

>  #include "ia_css_types.h"
>  #include "ia_css_binary.h"
>  #include "ia_css_frame_public.h"
> @@ -53,21 +54,21 @@ extern int dbg_level;
>   *  Values can be combined to dump a combination of sets.
>   */
>  enum ia_css_debug_enable_param_dump {
> -	IA_CSS_DEBUG_DUMP_FPN = 1 << 0, /** FPN table */
> -	IA_CSS_DEBUG_DUMP_OB = 1 << 1,  /** OB table */
> -	IA_CSS_DEBUG_DUMP_SC = 1 << 2,  /** Shading table */
> -	IA_CSS_DEBUG_DUMP_WB = 1 << 3,  /** White balance */
> -	IA_CSS_DEBUG_DUMP_DP = 1 << 4,  /** Defect Pixel */
> -	IA_CSS_DEBUG_DUMP_BNR = 1 << 5,  /** Bayer Noise Reductions */
> -	IA_CSS_DEBUG_DUMP_S3A = 1 << 6,  /** 3A Statistics */
> -	IA_CSS_DEBUG_DUMP_DE = 1 << 7,  /** De Mosaicing */
> -	IA_CSS_DEBUG_DUMP_YNR = 1 << 8,  /** Luma Noise Reduction */
> -	IA_CSS_DEBUG_DUMP_CSC = 1 << 9,  /** Color Space Conversion */
> -	IA_CSS_DEBUG_DUMP_GC = 1 << 10,  /** Gamma Correction */
> -	IA_CSS_DEBUG_DUMP_TNR = 1 << 11,  /** Temporal Noise Reduction */
> -	IA_CSS_DEBUG_DUMP_ANR = 1 << 12,  /** Advanced Noise Reduction */
> -	IA_CSS_DEBUG_DUMP_CE = 1 << 13,  /** Chroma Enhancement */
> -	IA_CSS_DEBUG_DUMP_ALL = 1 << 14  /** Dump all device parameters */
> +	IA_CSS_DEBUG_DUMP_FPN = BIT(0),  /** FPN table */
> +	IA_CSS_DEBUG_DUMP_OB  = BIT(1),  /** OB table */
> +	IA_CSS_DEBUG_DUMP_SC  = BIT(2),  /** Shading table */
> +	IA_CSS_DEBUG_DUMP_WB  = BIT(3),  /** White balance */
> +	IA_CSS_DEBUG_DUMP_DP  = BIT(4),  /** Defect Pixel */
> +	IA_CSS_DEBUG_DUMP_BNR = BIT(5),  /** Bayer Noise Reductions */
> +	IA_CSS_DEBUG_DUMP_S3A = BIT(6),  /** 3A Statistics */
> +	IA_CSS_DEBUG_DUMP_DE  = BIT(7),  /** De Mosaicing */
> +	IA_CSS_DEBUG_DUMP_YNR = BIT(8),  /** Luma Noise Reduction */
> +	IA_CSS_DEBUG_DUMP_CSC = BIT(9),  /** Color Space Conversion */
> +	IA_CSS_DEBUG_DUMP_GC  = BIT(10), /** Gamma Correction */
> +	IA_CSS_DEBUG_DUMP_TNR = BIT(11), /** Temporal Noise Reduction */
> +	IA_CSS_DEBUG_DUMP_ANR = BIT(12), /** Advanced Noise Reduction */
> +	IA_CSS_DEBUG_DUMP_CE  = BIT(13), /** Chroma Enhancement */
> +	IA_CSS_DEBUG_DUMP_ALL = BIT(14), /** Dump all device parameters */
>  };
>  
>  #define IA_CSS_ERROR(fmt, ...) \
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


