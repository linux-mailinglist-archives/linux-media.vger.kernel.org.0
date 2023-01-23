Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2445B677E2C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 15:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbjAWOf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 09:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbjAWOf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 09:35:56 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689207DA7
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 06:35:55 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="313945834"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="313945834"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:35:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="907043904"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="907043904"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jan 2023 06:35:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pJxvK-00DmVU-11;
        Mon, 23 Jan 2023 16:35:50 +0200
Date:   Mon, 23 Jan 2023 16:35:50 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 12/57] media: atomisp: Propagate set_fmt() errors in
 queue_setup()
Message-ID: <Y86bRqq86Ev28qbV@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-13-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-13-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:20PM +0100, Hans de Goede wrote:
> If set_fmt() fails make queue_setup() actually return the error instead of
> returning 0.
> 
> This fixes the following oops on set_fmt() failures:
> 
> [ 1060.378662] ------------[ cut here ]------------
> [ 1060.378805] WARNING: CPU: 0 PID: 2080 at drivers/media/common/videobuf2/videobuf2-core.c:840 vb2_core_reqbufs+0x3f7/0x430 [videobuf2_common]
> ...
> [ 1060.381414] RIP: 0010:vb2_core_reqbufs+0x3f7/0x430 [videobuf2_common]
> ...
> [ 1060.382066]  vb2_ioctl_reqbufs+0x9d/0xe0 [videobuf2_v4l2]
> [ 1060.382181]  __video_do_ioctl+0x18e/0x3c0 [videodev]

Should we rather keep this at the beginning of the series?
Just for the logical split of fixes go first.

Yes, I know that it doesn't make much sense for the staging drivers,
but still grouping might help.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_fops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index 4643bb0db995..682239ea042f 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -80,7 +80,7 @@ static int atomisp_queue_setup(struct vb2_queue *vq,
>  
>  out:
>  	mutex_unlock(&pipe->asd->isp->mutex);
> -	return 0;
> +	return ret;
>  }
>  
>  static int atomisp_buf_init(struct vb2_buffer *vb)
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


