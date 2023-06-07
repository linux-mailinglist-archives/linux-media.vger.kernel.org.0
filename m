Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B267267BD
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 19:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbjFGRrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 13:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjFGRro (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 13:47:44 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C33819BB
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 10:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686160063; x=1717696063;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qdpL6QI4ks/fCKPqlqJlaHhq1rLEMP0AgSQfiLt3uAo=;
  b=KSj+J09Q2qYj4zQ8fmRpqPKvgUxHbCKkj2yqC7ONoTqqE+CqFVGhGy8Y
   04bq5klDfPZnDufMsVKGaLXRNGwqQNL6+2bIDxG79jI/3BUKkk6+UyPuf
   haLOoyLzMYUUK06O7mVOKvI04aFal0daMDIDCbOum6L9Hnih4ZNRne+ZU
   iME+VibVwfpgJ+tIJ7cFUvXboCY8xBZbx6JrvTXXSD5rNJljVhvoWPgbH
   Jc7vMYIq42ZtsdZnkFauGR8KPNauESsq5k549Vsm4K04hZNNoUba4O4sW
   tbDKRMHoi7KtqU37l7KWo3GPsvSsawck8dvCT44VDX34hDvcoDW5LyIfk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337421319"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="337421319"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 10:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687057823"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="687057823"
Received: from dperchan-mobl1.ger.corp.intel.com (HELO terminus) ([10.251.191.47])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 10:47:41 -0700
Message-ID: <a9223377febd4a494c5fc6932865a1024d3cbadd.camel@intel.com>
Subject: Re: [GIT PULL FOR v6.5] uvcvideo changes
From:   Dmitry Perchanov <dmitry.perchanov@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@intel.com>
Date:   Wed, 07 Jun 2023 20:47:38 +0300
In-Reply-To: <20230607172703.GE5058@pendragon.ideasonboard.com>
References: <20230605183025.GA22339@pendragon.ideasonboard.com>
         <2e66f338213f828b6bc1d97e30da93da08cad8fe.camel@intel.com>
         <20230607172703.GE5058@pendragon.ideasonboard.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
I saw that Jenkins failed to apply this patch..

> FAILED: patch patch patches/0002-media-uapi-v4l-Intel-metadata-format-upd=
ate.patch doesn't apply:
> Applying patch patches/0002-media-uapi-v4l-Intel-metadata-format-update.p=
atch
> can't find file to patch at input line 21

=AF\_(O_o)_/=AF

Regards,
Dmitry P.

On Wed, 2023-06-07 at 20:27 +0300, Laurent Pinchart wrote:
> Hi Dmitry,
> =

> On Wed, Jun 07, 2023 at 08:21:18PM +0300, Dmitry Perchanov wrote:
> > Hi Laurent,
> > =

> > There is path mistake for patch:
> > media: uapi: v4l: Intel metadata format update
> > =

> > Probably pull request was misformated.
> > =

> > It is submitted with correct path and I fetched your tag and file is
> > in place.
> > =

> > Thanks for your patience.
> > =

> > Dmitry P.
> >  =

> > On Mon, 2023-06-05 at 21:30 +0300, Laurent Pinchart wrote:
> > > Hi Mauro,
> > > =

> > > The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416=
e705a7:
> > > =

> > >   Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)
> > > =

> > > are available in the Git repository at:
> > > =

> > >   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git t=
ags/media-uvc-next-20230606
> > > =

> > > for you to fetch changes up to 9bfc8e4d0972d3732bd8c6038c2bf1636780d7=
27:
> > > =

> > >   media: uvcvideo: Constify descriptor buffers (2023-06-05 18:39:47 +=
0300)
> > > =

> > > Please note that this pull request is based on v6.4-rc5 as it depends=
 on
> > > a fix that was merged in that version.
> > > =

> > > ----------------------------------------------------------------
> > > Miscellaneous uvcvideo changes:
> > > =

> > > - Support for more Intel RealSense devices
> > > - Small cleanups and constifications
> > > - Drop duplicate device
> > > =

> > > ----------------------------------------------------------------
> > > Dmitry Perchanov (2):
> > >       media: uapi: v4l: Intel metadata format update
> > >       media: uvcvideo: Enable Intel RealSense metadata for devices
> > > =

> > > Laurent Pinchart (7):
> > >       media: uvcvideo: Rename uvc_streaming 'format' field to 'format=
s'
> > >       media: uvcvideo: Rename uvc_format 'frame' field to 'frames'
> > >       media: uvcvideo: Use clamp() to replace manual implementation
> > >       media: uvcvideo: Reorganize format descriptor parsing
> > >       media: uvcvideo: Increment intervals pointer at end of parsing
> > >       media: uvcvideo: Constify formats, frames and intervals
> > >       media: uvcvideo: Constify descriptor buffers
> > > =

> > > Sakari Ailus (1):
> > >       Revert "media: uvcvideo: Limit power line control for Acer Easy=
Camera"
> > > =

> > >  .../userspace-api/media/v4l/pixfmt-meta-d4xx.rst   |  55 +++++++--
> > =

> > This path above is incorrect.
> =

> git shortens long lines by removing the left-most parts of the path and
> replacing it with '...'. The file is in
> Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst, it's only
> the shortlog that shows the shortened path.
> =

> > >  drivers/media/usb/uvc/uvc_driver.c                 | 137 +++++++++++=
+++++-----
> > >  drivers/media/usb/uvc/uvc_v4l2.c                   |  79 ++++++------
> > >  drivers/media/usb/uvc/uvc_video.c                  |  20 +--
> > >  drivers/media/usb/uvc/uvcvideo.h                   |  12 +-
> > >  5 files changed, 208 insertions(+), 95 deletions(-)

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

