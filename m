Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9514C345919
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 08:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhCWHxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 03:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhCWHxC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 03:53:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9649EC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 00:53:01 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lObqU-0000Gz-Sn; Tue, 23 Mar 2021 08:52:58 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lObqU-0003Xg-K5; Tue, 23 Mar 2021 08:52:58 +0100
Date:   Tue, 23 Mar 2021 08:52:58 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] allegro-dvt/nal-h264.h: fix kernel-doc: hdr -> hrd
Message-ID: <20210323075258.GC31778@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <03e0ce22-1ebe-24f4-0f49-f4c41ae8f598@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <03e0ce22-1ebe-24f4-0f49-f4c41ae8f598@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:51:42 up 33 days, 11:15, 80 users,  load average: 0.37, 0.42,
 0.36
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 23 Mar 2021 08:49:13 +0100, Hans Verkuil wrote:
> Give typo in kernel-doc documentation: hdr -> hrd
> 
> Fixes this warning:
> 
> drivers/media/platform/allegro-dvt/nal-h264.h:33: warning: expecting prototype for struct nal_h264_hdr_parameters. Prototype was for struct
> nal_h264_hrd_parameters instead
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
> diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/nal-h264.h
> index 2ba7cbced7a5..8cc5a28bf237 100644
> --- a/drivers/media/platform/allegro-dvt/nal-h264.h
> +++ b/drivers/media/platform/allegro-dvt/nal-h264.h
> @@ -12,7 +12,7 @@
>  #include <linux/types.h>
> 
>  /**
> - * struct nal_h264_hdr_parameters - HDR parameters
> + * struct nal_h264_hrd_parameters - HRD parameters
>   *
>   * C struct representation of the sequence parameter set NAL unit as defined by
>   * Rec. ITU-T H.264 (04/2017) E.1.2 HRD parameters syntax.
> 
