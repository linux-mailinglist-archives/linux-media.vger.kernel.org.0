Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC7D456DD9
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 11:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234766AbhKSK7q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 05:59:46 -0500
Received: from mga02.intel.com ([134.134.136.20]:33828 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231796AbhKSK7q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 05:59:46 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="221613387"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; 
   d="scan'208";a="221613387"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 02:56:44 -0800
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; 
   d="scan'208";a="455727550"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 02:56:43 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id AD50920556;
        Fri, 19 Nov 2021 12:56:40 +0200 (EET)
Date:   Fri, 19 Nov 2021 12:56:40 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Peiwei Hu <jlu.hpw@foxmail.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ccs: complement the return check of
 pm_runtime_get_if_active()
Message-ID: <YZeC6DVSsFTL5vg4@paasikivi.fi.intel.com>
References: <tencent_101DAE60627DF40AE031220023065E77EB07@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_101DAE60627DF40AE031220023065E77EB07@qq.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Peiwei,

On Fri, Nov 19, 2021 at 01:34:26PM +0800, Peiwei Hu wrote:
> pm_runtime_get_if_active() can return the negative value. The
> operator ! confuses the negative one with positive situation.
> 
> Signed-off-by: Peiwei Hu <jlu.hpw@foxmail.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 5363f3bcafe3..84e810451dd4 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -670,7 +670,7 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_status = pm_runtime_get_if_active(&client->dev, true);
> +	pm_status = pm_runtime_get_if_active(&client->dev, true) > 0;
>  	if (!pm_status)
>  		return 0;

This is intentional --- pm_runtime_get_if_active() returns an error if
runtime PM is disabled.

-- 
Regards,

Sakari Ailus
