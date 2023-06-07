Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 143E2726717
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 19:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjFGRVe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 13:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjFGRVb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 13:21:31 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6B21BDC
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 10:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686158489; x=1717694489;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=knNsCKLltH/IpX099sfSofE3fW6ij88VCE2rpkgHW74=;
  b=DmD6hRZ8vH8yRzqDLSu0o6qWGTInZOJ23MwxDjoU4GKbGCol0yqQfxw/
   0g8pdLDdblpjFAIi6bjSAmUS2ILQzdqy6sSIUwo2KPVRPT7wK/lpxJ5/F
   Z4mSeVM0EvBdxm42W8YeQjgxjE3ZdNHOwE5yT4Tbcx/k85mAt/m2Nd/8i
   t81q/oT2uGD3gzntjwGQDmBxmw9/FhAJqjJbK2LCtUE7CdP15GEjvpKLY
   SDuS5tNmDteSSQ9+9jUImhtvBYdXE2yQz2bYd7+wCpnw0MU4b/5eHUOK1
   AYCJwA1piQlZfMKxj+m2pMS66yVrpMbxcTE8hW22xgq/yBTCcrMsy59nR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="359523568"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="359523568"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 10:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="703739336"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="703739336"
Received: from dperchan-mobl1.ger.corp.intel.com (HELO terminus) ([10.251.191.47])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 10:21:20 -0700
Message-ID: <2e66f338213f828b6bc1d97e30da93da08cad8fe.camel@intel.com>
Subject: Re: [GIT PULL FOR v6.5] uvcvideo changes
From:   Dmitry Perchanov <dmitry.perchanov@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@intel.com>
Date:   Wed, 07 Jun 2023 20:21:18 +0300
In-Reply-To: <20230605183025.GA22339@pendragon.ideasonboard.com>
References: <20230605183025.GA22339@pendragon.ideasonboard.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

There is path mistake for patch:
media: uapi: v4l: Intel metadata format update

Probably pull request was misformated.

It is submitted with correct path and I fetched your tag and file is in pla=
ce.

Thanks for your patience.

Dmitry P.
 =

On Mon, 2023-06-05 at 21:30 +0300, Laurent Pinchart wrote:
> Hi Mauro,
> =

> The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705=
a7:
> =

>   Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)
> =

> are available in the Git repository at:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/=
media-uvc-next-20230606
> =

> for you to fetch changes up to 9bfc8e4d0972d3732bd8c6038c2bf1636780d727:
> =

>   media: uvcvideo: Constify descriptor buffers (2023-06-05 18:39:47 +0300)
> =

> Please note that this pull request is based on v6.4-rc5 as it depends on
> a fix that was merged in that version.
> =

> ----------------------------------------------------------------
> Miscellaneous uvcvideo changes:
> =

> - Support for more Intel RealSense devices
> - Small cleanups and constifications
> - Drop duplicate device
> =

> ----------------------------------------------------------------
> Dmitry Perchanov (2):
>       media: uapi: v4l: Intel metadata format update
>       media: uvcvideo: Enable Intel RealSense metadata for devices
> =

> Laurent Pinchart (7):
>       media: uvcvideo: Rename uvc_streaming 'format' field to 'formats'
>       media: uvcvideo: Rename uvc_format 'frame' field to 'frames'
>       media: uvcvideo: Use clamp() to replace manual implementation
>       media: uvcvideo: Reorganize format descriptor parsing
>       media: uvcvideo: Increment intervals pointer at end of parsing
>       media: uvcvideo: Constify formats, frames and intervals
>       media: uvcvideo: Constify descriptor buffers
> =

> Sakari Ailus (1):
>       Revert "media: uvcvideo: Limit power line control for Acer EasyCame=
ra"
> =

>  .../userspace-api/media/v4l/pixfmt-meta-d4xx.rst   |  55 +++++++--

This path above is incorrect.

>  drivers/media/usb/uvc/uvc_driver.c                 | 137 +++++++++++++++=
+-----
>  drivers/media/usb/uvc/uvc_v4l2.c                   |  79 ++++++------
>  drivers/media/usb/uvc/uvc_video.c                  |  20 +--
>  drivers/media/usb/uvc/uvcvideo.h                   |  12 +-
>  5 files changed, 208 insertions(+), 95 deletions(-)
> =

> =


---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

