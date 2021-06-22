Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928643B0F66
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 23:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhFVV0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 17:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhFVV0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 17:26:54 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEC0C061756
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 14:24:37 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id c22so585885qtn.1
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 14:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sfd2SRJTsylTEdVXKK1imeQ1mJ8YmpFBATLIhwxJuSA=;
        b=iOuLqjnzRpczw03xMHNbDOpvjiSjpeBLx4b6nNf5F+gbxeNOxdbAz9CQuIATyomTgw
         AzlviNhu+j868LtcVmo2t32CBQgGvmkg0QMTrACNukoVKyxYVgzN35NBE0ZBIU18wVyk
         GAb3GZSXrR+RMr6bscs96/2I4EQyfoKaoRwZg5G+pnugKhzpVRlEoWrov91u/jSscsF9
         dG4XWEGfuxtCxouf9tpzuNZ8/brsSNzmQKnDrmjn6ZLBRDJlVQbpzpj3UP1bt41Ayx31
         9amwx+iqSYX8jVjbbADlWYo2fYSR/wWwCCSzSi/VYDmlNr2fsxspx7RJSTKwMhtJ9iCn
         eR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sfd2SRJTsylTEdVXKK1imeQ1mJ8YmpFBATLIhwxJuSA=;
        b=nrXvuO18eT+nKZ4f0/PUJeIePTGUQmmdm3pVwLE3RXMEIa4SBIvGHgmguY3R0I9IWf
         OgDpY1ikTZ+1IO4iJ74ioOsCTR2juiLelG8NRaPVyTYtNrpn6buNWlkH3wz8hAHncMvV
         XThtjr/ZoPENUu6vBBP4tcMnB9tuxIKFTmOYDlBWY5Jv3ltBr2DidHwSJAEyyVHUP2R5
         PCAMHdIcqRzPdbpSQ8M3k581f6TD7xkQ+yM5NblK7GCbhGIAURLQy4E+1Ny4BvEjgfbS
         cDh4puLI5KYyR5OyejkhUwit84Tr7gw5ZIysKg0gwz5t8ub811VZENDv6J9qU7N5GJ4F
         qy7g==
X-Gm-Message-State: AOAM5327vyM1oBqzaW5aMKE253UDTMXcm955Jrix3qzZ3z8RMN1d577s
        Xu8j4QAIu/y17S0GoSnDWLuWKQ==
X-Google-Smtp-Source: ABdhPJwnHbeux5j214Xe+/kzO0fRpysuZtsvb1k/KLiUHg9h+yNmMZHE4XLzVRRCCJn/KwoEHQ4xXA==
X-Received: by 2002:aed:306f:: with SMTP id 102mr739209qte.197.1624397076845;
        Tue, 22 Jun 2021 14:24:36 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id x8sm13587249qkh.130.2021.06.22.14.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 14:24:36 -0700 (PDT)
Message-ID: <be4b635675df2111cb7c095013323b3ba1ac246e.camel@ndufresne.ca>
Subject: Re: [PATCH v3 4/8] media: Add P010 video format
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hverkuil@xs4all.nl, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk, jernej.skrabec@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Tue, 22 Jun 2021 17:24:34 -0400
In-Reply-To: <fbf31c292fde2f7dafb1441fc85a1ead34fdf96d.camel@collabora.com>
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
         <20210618131526.566762-5-benjamin.gaignard@collabora.com>
         <fbf31c292fde2f7dafb1441fc85a1ead34fdf96d.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 18 juin 2021 à 16:38 -0300, Ezequiel Garcia a écrit :
> Hi Benjamin,
> 
> On Fri, 2021-06-18 at 15:15 +0200, Benjamin Gaignard wrote:
> > P010 is a YUV format with 10-bits per pixel with interleaved UV.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> > version 2:
> >  - Add documentation about P010 padding
> >  - Fix the number of bits per component (16)
> > 
> >  .../media/v4l/pixfmt-yuv-planar.rst           | 78 ++++++++++++++++++-
> >  drivers/media/v4l2-core/v4l2-common.c         |  1 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
> >  include/uapi/linux/videodev2.h                |  1 +
> >  4 files changed, 79 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > index 090c091affd2..af400d37c8fd 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > @@ -100,8 +100,13 @@ All components are stored with the same number of bits per component.
> >        - Cb, Cr
> >        - No
> >        - 64x32 macroblocks
> > -
> > -        Horizontal Z order
> > +    * - V4L2_PIX_FMT_P010
> 
> Do we have support in GStreamer (or elsewhere) for this?

I believe you wanted to ask for patched framework to exercise this ? Since both
FFMPEG and GSTreamer have had that format for ages. For GStreamer:

https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/blob/master/gst-libs/gst/video/video-format.h#L102

No V4L2 mapping upstream, but this is a bit normal, can't upstream a mapping for
something that does not exist yet.

> 
> Thanks,
> Ezequiel
> 


