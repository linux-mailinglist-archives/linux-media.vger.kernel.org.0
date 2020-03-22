Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43EDD18ED2C
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2020 23:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgCVWww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Mar 2020 18:52:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57048 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgCVWww (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Mar 2020 18:52:52 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8A4C8291802
Message-ID: <d1a9e63102a2ce520f5573df5d6a6b029d4ce08f.camel@collabora.com>
Subject: Re: [PATCH v2 0/6] v4l2 JPEG helpers and CODA960 JPEG decoder
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Adrian Ratiu <adrian.ratiu@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de,
        Tim Harvey <tharvey@gateworks.com>
Date:   Sun, 22 Mar 2020 19:52:38 -0300
In-Reply-To: <87eetkgj99.fsf@collabora.com>
References: <20200318183536.15779-1-p.zabel@pengutronix.de>
         <87eetkgj99.fsf@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 2020-03-22 at 23:41 +0200, Adrian Ratiu wrote:
> Hi Philipp,
> 
> Tested-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> 
> Awesome work! I'm testing this series with the following two
> patches applied on top to extend functionality a bit. Please
> feel free to include these changes in your next version if
> you plan one.
> 
> 

I just had a chat with Adrian, and I suggested him to submit
his patches as regular patches, using the cover letter
to explain the dependency on this series.

We can then review the patches and discuss them as usual.

Also, I took a quick look at patch 2/2 and I was wondering
if maybe some more information about the use-case could
be helpful to understand the need for such change.

Thanks,
Ezequiel 

> 
> During testing a weird bug was discovered in both v1 and v2
> causing color degradation in raw YUV decoded images. Will
> send test files and exact reproduction steps in another mail.
> 
> Thanks,
> Adrian
> 
> On Wed, 18 Mar 2020, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > Hi,
> > 
> > the JPEG header parser is updated to accept up to four components,
> > baseline and extended-sequential DCT encoded images, 8-bit and 12-bit
> > precision, as well as 8-bit and 16-bit quantization tables. As a
> > consequence, all drivers will have to check the number of components,
> > precision, and quantization table lengths.
> > 
> > I have not yet added support parsing the Adobe APP14 headers to
> > determine the color encoding, as it is unclear to me how it could be
> > used to signal RGBA components - for 4-component images it is defined
> > to disambiguate between CMYK and YCCK encodings. This is implemented
> > in libjpeg.
> > Patching the header data in place to normalize the component identifiers
> > is not part of the parser and will be added in a separate patch.
> > 
> > For now the rcar_jpu, s5p-jpeg and mtk-jpeg conversions are dropped.
> > Instead, a few CODA fixes were added that should avoid alignment issues
> > with odd-sized JPEG images and that stop tricking GStreamer into
> > negotiating NV12 and then switching to YUV420 instead in S_FMT.
> > 
> > regards
> > Philipp
> > 
> > Philipp Zabel (6):
> >   media: coda: round up decoded buffer size for all codecs
> >   media: add v4l2 JPEG helpers
> >   media: coda: jpeg: add CODA960 JPEG decoder support
> >   media: coda: split marking last meta into helper function
> >   media: coda: mark last capture buffer
> >   media: coda: lock capture queue wakeup against decoder stop command
> > 
> >  drivers/media/platform/Kconfig            |   1 +
> >  drivers/media/platform/coda/coda-common.c | 188 ++++++-
> >  drivers/media/platform/coda/coda-jpeg.c   | 572 ++++++++++++++++++++
> >  drivers/media/platform/coda/coda.h        |  10 +-
> >  drivers/media/v4l2-core/Kconfig           |   4 +
> >  drivers/media/v4l2-core/Makefile          |   2 +
> >  drivers/media/v4l2-core/v4l2-jpeg.c       | 632 ++++++++++++++++++++++
> >  include/media/v4l2-jpeg.h                 | 135 +++++
> >  8 files changed, 1519 insertions(+), 25 deletions(-)
> >  create mode 100644 drivers/media/v4l2-core/v4l2-jpeg.c
> >  create mode 100644 include/media/v4l2-jpeg.h
> > 
> > -- 
> > 2.20.1


