Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD1B39688F
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 21:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhEaTzu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 15:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbhEaTzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 15:55:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C057C061574
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 12:54:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78DC68AB;
        Mon, 31 May 2021 21:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622490843;
        bh=DVrZn0SXyV7UdDYkLtcdBLN13wNTWLoANjfWAvpoND4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HnAmlH34Q+FTF8Ek4S5dBOFevRbJdXfCRlIDX2c9A30S4y3JOOjvzRmG2z95gJNfH
         kZeuLBErbWEyY8EFf3InwQvZVniVW4cz5ZSOZayq0OEoNSYftWYst/QZsbNrin8mwb
         n4HWMhgm3waNfdZYEgl49/lcJE+l9GG94KT7xVjw=
Date:   Mon, 31 May 2021 22:53:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ian Arkver <ian.arkver.dev@gmail.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: Implementing input IOCTLs for imx capture
Message-ID: <YLU+0aDEdyL7ska2@pendragon.ideasonboard.com>
References: <CAOMZO5BLdB_iaGrxvaOCAd4jhX6TJt9qiQd5=BYKmJF3OBhTiQ@mail.gmail.com>
 <838ee713-3bca-a6b2-0799-c0adb6800140@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <838ee713-3bca-a6b2-0799-c0adb6800140@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, May 31, 2021 at 07:22:12PM +0100, Ian Arkver wrote:
> On 31/05/2021 18:55, Fabio Estevam wrote:
> > Hi,
> > 
> > On an imx6dl based board with an ADV7280, I can successfully capture
> > from an analog camera using the following Gstreamer pipeline:
> > 
> > gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink
> > 
> > The next goal is to integrate it within the Qt multimedia application:
> > https://github.com/qt/qtmultimedia/blob/5.15.2/src/gsttools/qgstutils.cpp#L631-L687
> > 
> > The Qt app uses the VIDIOC_ENUMINPUT and VIDIOC_S_INPUT ioctl's, but
> > as these are not implemented by the imx-media-capture driver yet, it
> > causes the camera to not be detected.

I'd argue this should be fixed in Qt though :-) Those ioctls really
don't make sense for the IPU driver.

> Seems to me (naively, without looking into it in depth) that the v4l2 
> framework default should be to enumerate a single input, return that 
> input with g_input and succeed in setting that input with s_input.

This is done in

commit f645e6256bd1b12523b759fcc610861fb21c24c7
Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Date:   Tue Apr 21 15:57:38 2020 +0200

    media: v4l2-dev/ioctl: Add V4L2_CAP_IO_MC

but only when V4L2_CAP_IO_MC is set.

> Maybe there's a reason why it doesn't?
> 
> > Does anyone have any suggestions as to how to add support for
> > .vidioc_enum_input, .vidioc_g_input and .vidioc_s_input in
> > drivers/staging/media/imx/imx-media-capture.c ?
> > 
> > I tried to look at how the other drivers implement these hooks, but my
> > attempts to add support for them to the imx capture driver didn't
> > work.

-- 
Regards,

Laurent Pinchart
