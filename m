Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C7028BFD1
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 20:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389070AbgJLSft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 14:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387655AbgJLSft (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 14:35:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5A7C0613D0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 11:35:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FF4EA42;
        Mon, 12 Oct 2020 20:35:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602527746;
        bh=PM3Bgc06mOjZ6cas5YwZlaY/p27Hl//G6dBz6zDkbhU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eUXUQgLkjEjgdPQalfMUgrKLddz9G7lBbZUp2N+gyD86vX3iqqp9AiUOhBhETExFd
         DQiMkhEHm1mLgae67ufyCRVKIfuqwsx6Y2jg4VElBRfaY9jGcGeZoQ1or7qvm6wlm4
         Y7Q1MZylw/ZeL2+POgOwG/3fgLfUADap8lk0KTl0=
Date:   Mon, 12 Oct 2020 21:35:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tsuchiya Yuto <kitakar@gmail.com>,
        bingbu.cao@intel.com, Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v3 8/8] ipu3-cio2: Remove traces of returned buffers
Message-ID: <20201012183500.GB740@pendragon.ideasonboard.com>
References: <20201012180414.11579-1-sakari.ailus@linux.intel.com>
 <20201012180414.11579-9-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201012180414.11579-9-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Oct 12, 2020 at 09:04:14PM +0300, Sakari Ailus wrote:
> If starting a video buffer queue fails, the buffers are returned to
> videobuf2. Remove the reference to the buffer from driver's queue as well.
> 
> Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: stable@vger.kernel.org # v4.16 and up
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index d9baa8bfe54f..51c4dd6a8f9a 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -791,6 +791,7 @@ static void cio2_vb2_return_all_buffers(struct cio2_queue *q,
>  			atomic_dec(&q->bufs_queued);
>  			vb2_buffer_done(&q->bufs[i]->vbb.vb2_buf,
>  					state);
> +			q->bufs[i] = NULL;

This looks good, and with Andy's comment addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

However, should we replace this with a linked list ?

>  		}
>  	}
>  }

-- 
Regards,

Laurent Pinchart
