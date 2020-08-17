Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC06246462
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 12:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgHQKWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 06:22:38 -0400
Received: from mga05.intel.com ([192.55.52.43]:17819 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728029AbgHQKWa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 06:22:30 -0400
IronPort-SDR: EWAw+k/qt96TbiyDQodBfd3aqwKEl6LeJE8MYyYvmraJ0Yy7KD2gUMbSm/sXzVyEUqNQ8ovVSF
 l0a+plv/7ObQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="239493833"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="239493833"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 03:22:29 -0700
IronPort-SDR: OA44cBuLyYK9qJcYKy84xRkmNXXpjE64mN2MIOgCv8Wzpk1D2brDdJ/cfVyMxZLM5BLZgV0SP+
 Upi1CD8Yyqzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="319666852"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2020 03:22:27 -0700
Subject: Re: [PATCH v1 5/7] media: ipu3-cio2: Replace infinite loop by one
 with clear exit condition
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
 <20200814163017.35001-5-andriy.shevchenko@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <aa68f5ec-359c-70ce-ecf6-ee013497230a@linux.intel.com>
Date:   Mon, 17 Aug 2020 18:21:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814163017.35001-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/15/20 12:30 AM, Andy Shevchenko wrote:
> Refactor cio2_buffer_done() to get rid of infinite loop by replacing it by one
> with clear exit condition. This change also allows to check for an error ahead.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index eee7f841050d..f4175dc1501a 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -541,7 +541,7 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
>  {
>  	struct device *dev = &cio2->pci_dev->dev;
>  	struct cio2_queue *q = cio2->cur_queue;
> -	int buffers_found = 0;
> +	struct cio2_fbpt_entry *const entry;
No 'const' here.

>  	u64 ns = ktime_get_ns();
>  
>  	if (dma_chan >= CIO2_QUEUES) {
> @@ -549,15 +549,18 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
>  		return;
>  	}
>  
> +	entry = &q->fbpt[q->bufs_first * CIO2_MAX_LOPS];
> +	if (entry->first_entry.ctrl & CIO2_FBPT_CTRL_VALID) {
> +		dev_warn(&cio2->pci_dev->dev,
> +			 "no ready buffers found on DMA channel %u\n",
> +			 dma_chan);
> +		return;
> +	}
> +
>  	/* Find out which buffer(s) are ready */
>  	do {
> -		struct cio2_fbpt_entry *const entry =
> -			&q->fbpt[q->bufs_first * CIO2_MAX_LOPS];
>  		struct cio2_buffer *b;
>  
> -		if (entry->first_entry.ctrl & CIO2_FBPT_CTRL_VALID)
> -			break;
> -
>  		b = q->bufs[q->bufs_first];
>  		if (b) {
>  			unsigned int bytes = entry[1].second_entry.num_of_bytes;
> @@ -579,13 +582,8 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
>  		atomic_inc(&q->frame_sequence);
>  		cio2_fbpt_entry_init_dummy(cio2, entry);
>  		q->bufs_first = (q->bufs_first + 1) % CIO2_MAX_BUFFERS;
> -		buffers_found++;
> -	} while (1);
> -
> -	if (buffers_found == 0)
> -		dev_warn(&cio2->pci_dev->dev,
> -			 "no ready buffers found on DMA channel %u\n",
> -			 dma_chan);
> +		entry = &q->fbpt[q->bufs_first * CIO2_MAX_LOPS];
> +	} while (!(entry->first_entry.ctrl & CIO2_FBPT_CTRL_VALID));
>  }
>  
>  static void cio2_queue_event_sof(struct cio2_device *cio2, struct cio2_queue *q)
> 

-- 
Best regards,
Bingbu Cao
