Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E551F1C0AF9
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 01:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgD3X1t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 19:27:49 -0400
Received: from retiisi.org.uk ([95.216.213.190]:39332 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726384AbgD3X1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 19:27:48 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id A13DF634C8F;
        Fri,  1 May 2020 02:27:38 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jUIag-0000VL-Fm; Fri, 01 May 2020 02:27:38 +0300
Date:   Fri, 1 May 2020 02:27:38 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        helen.koike@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        dafna3@gmail.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] media: i2c: imx219: Fix a bug in imx219_enum_frame_size
Message-ID: <20200430232738.GQ867@valkosipuli.retiisi.org.uk>
References: <20200331180630.5703-1-dafna.hirschfeld@collabora.com>
 <CAPY8ntD=4i6VnxTHakt2dnfM3BLfNsBPEhJt6qS229rOfCHZmg@mail.gmail.com>
 <CA+V-a8unuigag-c0fgJopMG30cxXz6c6yGf67pY=TUQ8JvCaSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8unuigag-c0fgJopMG30cxXz6c6yGf67pY=TUQ8JvCaSw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 03, 2020 at 11:28:52AM +0100, Lad, Prabhakar wrote:
> On Fri, Apr 3, 2020 at 11:23 AM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Dafna
> >
> > Thanks for the patch.
> >
> > On Tue, 31 Mar 2020 at 19:06, Dafna Hirschfeld
> > <dafna.hirschfeld@collabora.com> wrote:
> > >
> > > When enumerating the frame sizes, the value sent to
> > > imx219_get_format_code should be fse->code
> > > (the code from the ioctl) and not imx219->fmt.code
> > > which is the code set currently in the driver.
> > >
> > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> > Agreed that v4l2-ctl --list-formats-ext doesn't list the frame sizes
> > for the mode that isn't selected without this patch. With this patch
> > you get the full list.
> >
> > Does it warrant a "Fixes: 22da1d56e ("media: i2c: imx219: Add support
> > for RAW8 bit bayer format")"? I'd probably say yes.
> >
> +1

Thanks, all!

I've added:

Fixes: 22da1d56e982 ("media: i2c: imx219: Add support for RAW8 bit bayer format")

-- 
Sakari Ailus
