Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D622100BDA
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 19:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfKRSwW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 13:52:22 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58800 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfKRSwV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 13:52:21 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1042F29051B
Message-ID: <7fd4bf99fd6316da8acaf0a27b6845bedbf4b25f.camel@collabora.com>
Subject: Re: [PATCH v11 00/11] Rockchip ISP Driver
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, linux-media@vger.kernel.org,
        jacob-chen@iotwrt.com, zhengsq@rock-chips.com
Date:   Mon, 18 Nov 2019 15:52:01 -0300
In-Reply-To: <996a9b6a-0e45-d627-9263-539c22e5f1c0@xs4all.nl>
References: <20191114051242.14651-1-helen.koike@collabora.com>
         <996a9b6a-0e45-d627-9263-539c22e5f1c0@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for taking care of this.

On Thu, 2019-11-14 at 09:42 +0100, Hans Verkuil wrote:
> On 11/14/19 6:12 AM, Helen Koike wrote:
> > Hello,
> > 
> > This series adds the Rockchip Image Signal Processing Unit v1 driver to
> > staging.
> > 
> > The main reason to be in staging is that people are already using it from the
> > mailing list (including libcamera), and having it in mainline makes the workflow
> > easier. Also, it is easier for other people to contribute back (with code
> > or testing the driver).
> > 
> > We plan to actively work on this driver to get it our of staging.
> > 
> > This patchset is also available at:
> > https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v11
> > 
> > Libcamera patched to work with this version:
> > https://gitlab.collabora.com/koike/libcamera
> > (also sent to the mailing list)
> > 
> > The major difference in v11 are:
> > - Fixed compiling warnings found with W=1
> > - Fixed checkpatch errors
> > - Add clock-names values in dt-bindings
> 
> Looking at checkpatch I see a few remaining issues that I believe should be
> fixed before merging this:
> 
> CHECK: spinlock_t definition without comment
> #575: FILE: drivers/staging/media/rkisp1/isp_stats.h:43:
> +       spinlock_t irq_lock;
> 
> CHECK: struct mutex definition without comment
> #581: FILE: drivers/staging/media/rkisp1/isp_stats.h:49:
> +       struct mutex wq_lock;
> 
> CHECK: spinlock_t definition without comment
> #1648: FILE: drivers/staging/media/rkisp1/isp_params.h:25:
> +       spinlock_t config_lock;
> 
> CHECK: spinlock_t definition without comment
> #2058: FILE: drivers/staging/media/rkisp1/capture.h:145:
> +       spinlock_t vbq_lock;
> 

I'd rather merge this as-is, adding a TODO entry stating
we need to revisit locking specifically, because I'd like
to take a close look at these spinlocks/mutex,
instead of just addding comments for then.

> Once this is done together with the Jacob Chen email clarification
> it is ready to be merged for v5.6.
> 

I'll find out more about this.

> It passes all the sparse/smatch tests, so that's very good.
> 

Great!

Thanks,
Ezequiel

