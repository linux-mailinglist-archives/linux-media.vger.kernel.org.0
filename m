Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C9B3A670F
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 14:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbhFNMxX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 08:53:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48788 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233721AbhFNMxK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 08:53:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D30551F4035A
Message-ID: <96e63be705b04b40a943307c81ed71e8c573ef96.camel@collabora.com>
Subject: Re: [PATCH v2 7/8] media: hevc: Add scaling matrix control
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk, jernej.skrabec@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Mon, 14 Jun 2021 09:50:46 -0300
In-Reply-To: <d5b010c8-c0c5-8800-b2c3-9371923ca10c@collabora.com>
References: <20210610154442.806107-1-benjamin.gaignard@collabora.com>
         <20210610154442.806107-8-benjamin.gaignard@collabora.com>
         <87a1e585-688e-7c4d-b9a9-24f42772a1a8@xs4all.nl>
         <d5b010c8-c0c5-8800-b2c3-9371923ca10c@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-06-14 at 09:43 +0200, Benjamin Gaignard wrote:
> 
> Le 14/06/2021 à 09:27, Hans Verkuil a écrit :
> > On 10/06/2021 17:44, Benjamin Gaignard wrote:
> > > HEVC scaling lists are used for the scaling process for transform
> > > coefficients.
> > > V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED has to set when they are
> > > encoded in the bitstream.
> > Comparing H264 with HEVC I noticed that the corresponding flag for H264 is
> > called V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT.
> > 
> > Should those names be aligned? Also, it is part of PPS for H264 and SPS in HEVC,
> > is that difference correct?
> 
> In ITU specifications ("7.4.3.2.1 General sequence parameter set RBSP semantics") this flag is define like that:
> scaling_list_enabled_flag equal to 1 specifies that a scaling list is used for the scaling process for transform coefficients.
> scaling_list_enabled_flag equal to 0 specifies that scaling list is not used for the scaling process for transform coefficients.
> 
> So for me the naming is correct.
> 

The bitstream is really parsed in userspace (gstreamer, ffmpeg, chromium).
Not all bitstream parameters need to be passed as-is, because the kernel
is actually a sort of low-level layer in the decoder stack.

I think it's probably most appropriate to follow our H.264 interface
semantics, see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=54889c51b833d236228f983be16212fbe806bb89.

The H.264 story goes like this:

* Default scaling list is used for decoding, but can be modified
  by a bitstream-provided scaling list.
   
* The scaling list modification can be in SPS or in PPS.

* For each frame, the SPS and PPS headers will tell if
  a modified scaling list must be used for decoding,
  and if it's provided in the SPS header or the PPS header.

The userspace parser must take care of this, and pass
a scaling matrix to the kernel via V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
setting PPS_FLAG_SCALING_MATRIX_PRESENT.

This flag is at the PPS control, so the scaling modification
can be applied on each frame.

In other words, the kernel interface is simpler, it just
receives a scaling matrix and a flag telling if it must be used or not. 

We should probably clarify the documentation, so this process is more clear.

From the HEVC spec, it seems the process should be similar.
The only difference is the SPS "scaling_list_enabled_flag" parameter,
which doesn't exist in H.264.

Nicolas: what do you think?

Thanks,
Ezequiel

