Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A001ECFFE
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 14:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgFCMlt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 08:41:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:64948 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbgFCMlt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 08:41:49 -0400
IronPort-SDR: 93f2LNvkSLiXOoFGYy9qUAv5uCF0UJjimojlaMwD7+znkrZQuQc+aT66vXP0Tmure/XAoIWyTx
 ro/QNXA3wctw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 05:41:48 -0700
IronPort-SDR: wg2lZMeSDkJDKKAVordjaIC9RTwBFkDGoSR12cngbqwemtBlm8s5re3DgpMkp6kS2d4KJZPptv
 WTZ5S4qa0H7A==
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; 
   d="scan'208";a="347754281"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 05:41:46 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id EFF2E207DA; Wed,  3 Jun 2020 15:41:43 +0300 (EEST)
Date:   Wed, 3 Jun 2020 15:41:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: marvell-ccic: Add missed
 v4l2_async_notifier_cleanup()
Message-ID: <20200603124143.GF16711@paasikivi.fi.intel.com>
References: <20200603115605.1428636-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603115605.1428636-1-hslester96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chuhong,

Thanks for the patch.

On Wed, Jun 03, 2020 at 07:56:05PM +0800, Chuhong Yuan wrote:
> mccic_register() forgets to cleanup the notifier in its error handler.
> Add the missed call to fix it.
> 
> Fixes: 3eefe36cc00c ("media: marvell-ccic: use async notifier to get the sensor")
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/media/platform/marvell-ccic/mcam-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
> index 09775b6624c6..cf2a0119e679 100644
> --- a/drivers/media/platform/marvell-ccic/mcam-core.c
> +++ b/drivers/media/platform/marvell-ccic/mcam-core.c
> @@ -1940,6 +1940,7 @@ int mccic_register(struct mcam_camera *cam)
>  out:
>  	v4l2_async_notifier_unregister(&cam->notifier);
>  	v4l2_device_unregister(&cam->v4l2_dev);
> +	v4l2_async_notifier_cleanup(&cam->notifier);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(mccic_register);

The same issue appears to be present in the mcam_shutdown(), could you fix
that one as well?

-- 
Regards,

Sakari Ailus
