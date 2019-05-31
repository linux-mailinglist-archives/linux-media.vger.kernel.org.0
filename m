Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4825F30D8E
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 13:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfEaLwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 07:52:02 -0400
Received: from retiisi.org.uk ([95.216.213.190]:48378 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726518AbfEaLwC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 07:52:02 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 4711C634C7B;
        Fri, 31 May 2019 14:51:57 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hWg4j-0000K7-EL; Fri, 31 May 2019 14:51:57 +0300
Date:   Fri, 31 May 2019 14:51:57 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, rmfrfs@gmail.com, zhengsq@rock-chips.com,
        prabhakar.csengg@gmail.com, corbet@lwn.net,
        wenyou.yang@microchip.com, lkundrak@v3.sk,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        jacopo+renesas@jmondi.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 0/6] Avoid v4l2_subdev_get_try_ ifdef dance
Message-ID: <20190531115157.upmjmowz64hzsafb@valkosipuli.retiisi.org.uk>
References: <20190404074002.18730-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190404074002.18730-1-m.felsch@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Thu, Apr 04, 2019 at 09:39:56AM +0200, Marco Felsch wrote:
> Hi,
> 
> during my work on [1] I prepared a patch to avoid driver interal ifdef
> dances for:
>  - v4l2_subdev_get_try_format
>  - v4l2_subdev_get_try_crop
>  - v4l2_subdev_get_try_compose
> helper functions. Jacopo did some comments on it so I picked Lubomir's
> series [2] as base and prepared a new one since this series didn't got
> merged.
> 
> During discussion on [2] Sakari mentioned Hans RFC Patch [3] which didn't
> got merged too due to Mauro's concerns.
> 
> The driver changes are only compile tested due to the lack of missing
> hardware. It would be cool if someone can verify my changes.
> 
> [1] https://patchwork.kernel.org/cover/10786553/
> [2] https://patchwork.kernel.org/patch/10703029/
> [3] https://patchwork.linuxtv.org/patch/53370/
> 
> Marco Felsch (6):
>   media: v4l2-subdev: add stubs for v4l2_subdev_get_try_*
>   media: ov2659: get rid of extra ifdefs
>   media: ov2680: get rid of extra ifdefs
>   media: ov5695: get rid of extra ifdefs
>   media: ov7670: get rid of extra ifdefs
>   media: ov7740: get rid of extra ifdefs

Assuming that this patch gets merged:

<URL:https://patchwork.linuxtv.org/patch/56482/>

With the above patch, calling these functions when subdev API is disabled
becomes clearly a driver bug. Instead of returning an error from the
functions, I'd suggest adding dummy format and selection configurations
(which are memset to zero by the call to obtain the said configuration)
that would be returned by these functions. Calling these functions should
also emit a warning.

That would be much safer and also would make it easier to catch API misuse.

-- 
Kind regards,

Sakari Ailus
