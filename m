Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B647F9B031
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 15:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395084AbfHWM44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:56:56 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56909 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732092AbfHWM44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:56:56 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i197b-0006WC-Eq; Fri, 23 Aug 2019 14:56:51 +0200
Message-ID: <1566565011.3023.15.camel@pengutronix.de>
Subject: Re: [PATCH v3 3/7] Documentation: media: Document
 V4L2_CTRL_TYPE_AREA
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Date:   Fri, 23 Aug 2019 14:56:51 +0200
In-Reply-To: <20190823123737.7774-3-ribalda@kernel.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
         <20190823123737.7774-3-ribalda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2019-08-23 at 14:37 +0200, Ricardo Ribalda Delgado wrote:
> A struct v4l2_area containing the width and the height of a rectangular
> area.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/media/uapi/v4l/vidioc-queryctrl.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> index a3d56ffbf4cc..c09d06ef2b08 100644
> --- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> @@ -443,6 +443,12 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_mpeg2_quantization`, containing MPEG-2
>  	quantization matrices for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_AREA``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_area`, containing the width and the height
> +        of a rectangular area.

Maybe explicitly mention that units depend on the use case?

regards
Philipp
