Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34EA4181F5
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 00:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbfEHWOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 18:14:46 -0400
Received: from retiisi.org.uk ([95.216.213.190]:50810 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726837AbfEHWOq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 May 2019 18:14:46 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 99EE1634C7B;
        Thu,  9 May 2019 01:14:02 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hOUp8-0001dU-9h; Thu, 09 May 2019 01:14:02 +0300
Date:   Thu, 9 May 2019 01:14:02 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] v4l: Add source event change for bit-depth
Message-ID: <20190508221402.6fh5k2pvep33lggj@valkosipuli.retiisi.org.uk>
References: <20190508113759.19168-1-stanimir.varbanov@linaro.org>
 <d6dcee9a-0308-855c-9819-3e7413cb617d@linaro.org>
 <a63d1c5f-806e-92c3-a6f7-e70f0686a27d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a63d1c5f-806e-92c3-a6f7-e70f0686a27d@xs4all.nl>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 08, 2019 at 06:38:49PM +0200, Hans Verkuil wrote:
> On 5/8/19 5:34 PM, Stanimir Varbanov wrote:
> > Hi Hans,
> > 
> > On 5/8/19 2:37 PM, Stanimir Varbanov wrote:
> >> This event indicate that the source bit-depth is changed during
> >> run-time. The client must get the new format and re-allocate buffers
> >> for it. This can usually happens with video decoder (encoders) when
> >> the bit-stream depth is changed from 8 to 10bits or vice versa.
> >>
> >> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >> ---
> >> Change since v1: s/BITDEPTH/BIT_DEPTH
> >>
> >>  Documentation/media/uapi/v4l/vidioc-dqevent.rst | 7 +++++++
> >>  Documentation/media/videodev2.h.rst.exceptions  | 1 +
> >>  include/uapi/linux/videodev2.h                  | 1 +
> >>  3 files changed, 9 insertions(+)
> >>
> >> diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> >> index dea9c0cc00ab..f7782cbddc5f 100644
> >> --- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> >> +++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> >> @@ -397,6 +397,13 @@ call.
> >>  	that many devices are not able to recover from a temporary loss of
> >>  	signal and so restarting streaming I/O is required in order for the
> >>  	hardware to synchronize to the video signal.
> >> +    * - ``V4L2_EVENT_SRC_CH_BIT_DEPTH``
> > 
> > I started to wonder isn't COLOR_DEPTH more appropriate? Bit-depth
> > doesn't describe what is actually deep.
> > 
> 
> I agree. COLOR_DEPTH is a better name.

Please add:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
