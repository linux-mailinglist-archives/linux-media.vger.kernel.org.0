Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CD6244F1F
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 22:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgHNUSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 16:18:43 -0400
Received: from mga11.intel.com ([192.55.52.93]:50211 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727108AbgHNUSm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 16:18:42 -0400
IronPort-SDR: 4+K7Q+EXBajfLgMhqnpg5fnxdlSXSyKLQDoypYwjXh2rWp26oYSTdhtGjdNbtn4nYA9teZ09ql
 pa9Cm6Lf0nAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9713"; a="152135878"
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; 
   d="scan'208";a="152135878"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 13:18:40 -0700
IronPort-SDR: lew5kb/yNL8YJWor7Kkv4vLT9k3u/na9lmw8QitI5U8lSB+cp7PlTFDys+51EAIu9Wm7XzwUV7
 DgeFuKoRrn2Q==
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; 
   d="scan'208";a="291831596"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 13:18:38 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 24CC920488; Fri, 14 Aug 2020 23:18:36 +0300 (EEST)
Date:   Fri, 14 Aug 2020 23:18:36 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 2/7] media: ipu3-cio2: Introduce CIO2_MAX_ENTRIES
 constant
Message-ID: <20200814201836.GF24582@paasikivi.fi.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
 <20200814163017.35001-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814163017.35001-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Fri, Aug 14, 2020 at 07:30:12PM +0300, Andy Shevchenko wrote:
> This constant is used in several places in the code, define it
> for better maintenance.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 13 +++++--------
>  drivers/media/pci/intel/ipu3/ipu3-cio2.h |  3 +++
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index c7c3692a6e72..79641c79df25 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -127,7 +127,7 @@ static int cio2_fbpt_init_dummy(struct cio2_device *cio2)
>  	 * List of Pointers(LOP) contains 1024x32b pointers to 4KB page each
>  	 * Initialize each entry to dummy_page bus base address.
>  	 */
> -	for (i = 0; i < CIO2_PAGE_SIZE / sizeof(*cio2->dummy_lop); i++)
> +	for (i = 0; i < CIO2_MAX_ENTRIES; i++)
>  		cio2->dummy_lop[i] = cio2->dummy_page_bus_addr >> PAGE_SHIFT;
>  
>  	return 0;
> @@ -160,8 +160,7 @@ static void cio2_fbpt_entry_init_dummy(struct cio2_device *cio2,
>  	unsigned int i;
>  
>  	entry[0].first_entry.first_page_offset = 0;
> -	entry[1].second_entry.num_of_pages =
> -		CIO2_PAGE_SIZE / sizeof(u32) * CIO2_MAX_LOPS;
> +	entry[1].second_entry.num_of_pages = CIO2_MAX_ENTRIES * CIO2_MAX_LOPS;
>  	entry[1].second_entry.last_page_available_bytes = CIO2_PAGE_SIZE - 1;
>  
>  	for (i = 0; i < CIO2_MAX_LOPS; i++)
> @@ -201,7 +200,7 @@ static void cio2_fbpt_entry_init_buf(struct cio2_device *cio2,
>  	i = 0;
>  	while (remaining > 0) {
>  		entry->lop_page_addr = b->lop_bus_addr[i] >> PAGE_SHIFT;
> -		remaining -= CIO2_PAGE_SIZE / sizeof(u32) * CIO2_PAGE_SIZE;
> +		remaining -= CIO2_MAX_ENTRIES * CIO2_PAGE_SIZE;
>  		entry++;
>  		i++;
>  	}
> @@ -841,10 +840,8 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
>  	struct device *dev = &cio2->pci_dev->dev;
>  	struct cio2_buffer *b =
>  		container_of(vb, struct cio2_buffer, vbb.vb2_buf);
> -	static const unsigned int entries_per_page =
> -		CIO2_PAGE_SIZE / sizeof(u32);
>  	unsigned int pages = DIV_ROUND_UP(vb->planes[0].length, CIO2_PAGE_SIZE);
> -	unsigned int lops = DIV_ROUND_UP(pages + 1, entries_per_page);
> +	unsigned int lops = DIV_ROUND_UP(pages + 1, CIO2_MAX_ENTRIES);
>  	struct sg_table *sg;
>  	struct sg_dma_page_iter sg_iter;
>  	int i, j;
> @@ -878,7 +875,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
>  			break;
>  		b->lop[i][j] = sg_page_iter_dma_address(&sg_iter) >> PAGE_SHIFT;
>  		j++;
> -		if (j == entries_per_page) {
> +		if (j == CIO2_MAX_ENTRIES) {
>  			i++;
>  			j = 0;
>  		}
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> index 7caab9b8c2b9..6ee5919d913b 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> @@ -4,6 +4,8 @@
>  #ifndef __IPU3_CIO2_H
>  #define __IPU3_CIO2_H
>  
> +#include <linux/types.h>
> +
>  #define CIO2_NAME					"ipu3-cio2"
>  #define CIO2_DEVICE_NAME				"Intel IPU3 CIO2"
>  #define CIO2_ENTITY_NAME				"ipu3-csi2"
> @@ -17,6 +19,7 @@
>  /* 32MB = 8xFBPT_entry */
>  #define CIO2_MAX_LOPS					8
>  #define CIO2_MAX_BUFFERS			(PAGE_SIZE / 16 / CIO2_MAX_LOPS)
> +#define CIO2_MAX_ENTRIES			(PAGE_SIZE / sizeof(u32))

How about calling this CIO2_ENTRIES_PER_LOP (or CIO2_LOP_ENTRIES) instead?

>  
>  #define CIO2_PAD_SINK					0
>  #define CIO2_PAD_SOURCE					1

-- 
Sakari Ailus
