Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974A03A4A2E
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 22:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhFKUgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 16:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhFKUgu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 16:36:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA8EC061574
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 13:34:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 656064A8;
        Fri, 11 Jun 2021 22:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623443689;
        bh=HbLHeE5LsVnfU4brFQDUwKYWAR/uYeu2QJDnKFnk8Hg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fNjFPqhawYcu9mH+GTxbUAAdgI/1Wvg22mhHz9Hh/jHkMWb2WyMXSl5+5jQvDhgPx
         J9rH1M0QDEqUsdGQrxcx1xW9DZXRfmpj6h8tKvcwJ8SM9M1Ev4AiLgLEpTfK6T1HHY
         cVcFyamQuCrh5b4GjYyUymGsc69EqSQ2PIPaxI2Y=
Date:   Fri, 11 Jun 2021 23:34:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Benjamin Drung <bdrung@posteo.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [GIT PULL FOR v5.14] uvcvideo fix
Message-ID: <YMPI1pBRQz2gIPWr@pendragon.ideasonboard.com>
References: <YMMUgjx67yfqvKNV@pendragon.ideasonboard.com>
 <65086b171d258d37c38b6542e80f18817675a8af.camel@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65086b171d258d37c38b6542e80f18817675a8af.camel@posteo.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

(CC'ing Mauro and the linux-media mailing list)

On Fri, Jun 11, 2021 at 06:38:59PM +0000, Benjamin Drung wrote:
> Hi Laurent,
> 
> The mail subject says pull for v5.14. Does that mean it will only be
> merged into mainline after the release of 5.13? If so, can we get this
> one merged into 5.13 as bugfix? I haven't found any documentation how
> the concrete workflow for this subsystem works.

Merging patches as fixes during the -rc cycle is usually reserved to
regressions that were introduced in the same kernel, or for critical
bugs. That being said, if Mauro is fine merging this as a v5.13 fix, I
don't mind at all.

> On Fri, 2021-06-11 at 10:45 +0300, Laurent Pinchart wrote:
> > Hi Mauro,
> > 
> > The following changes since commit 5b448065febe1c6bb6693735844f2fb2b7b654dc:
> > 
> >   media: pci: tw5864: avoid usage of some characters (2021-06-04 08:11:12 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/pinchartl/media.git tags/uvc-20210611
> > 
> > for you to fetch changes up to 8387e8c7534ca5fafa4db0551bf85f2349a99ad7:
> > 
> >   media: uvcvideo: Fix pixel format change for Elgato Cam Link 4K (2021-06-10 17:10:08 +0300)
> > 
> > ----------------------------------------------------------------
> > - uvcvideo fix
> > 
> > ----------------------------------------------------------------
> > Benjamin Drung (1):
> >       media: uvcvideo: Fix pixel format change for Elgato Cam Link 4K
> > 
> >  drivers/media/usb/uvc/uvc_video.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)

-- 
Regards,

Laurent Pinchart
