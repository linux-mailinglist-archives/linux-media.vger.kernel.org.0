Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2E93C5BC
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 10:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404418AbfFKIN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 04:13:58 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56529 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2403996AbfFKIN5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 04:13:57 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id abuhhfYv041bFabukhCs7H; Tue, 11 Jun 2019 10:13:55 +0200
Subject: Re: [RFC PATCH 0/5] Add enum_fmt flag for coded formats with dynamic
 resolution switching
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <907e0560-3b46-04c9-52ef-6c6ff7140876@xs4all.nl>
Date:   Tue, 11 Jun 2019 10:13:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190609143820.4662-1-mjourdan@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHc1SPYjJMUDlr1fsf1LuOUlJ7XeDhcoHEFBRtgcGtraFegKRYSAH9yy2hybgmP5pMi3Ab2eNMLEKHvLsJh+DIiz6OarcTbuwK4gbLm7TpY5yy40o3Gm
 kL4qsOVhYQISYY8BJac2EaxWdCE0IAcWdPIWq3+6Vqn5c/fzXvmoTZ103kapusmPAuYCIBRHZOJzfI8E4QAyu8Wdb+og9gP+wiLgB2uvrElJkscAKv+Qj0Fe
 TMWTyAyN9yibKLaG0JOZg2v0/Ruy04EHHiAnzVf8A702DFQ2I+MilZpV1n8JWdKqmt1OLu7/dl6NOZPWPT43r/hiKLzU072IRq/cXQQTMLOUG7jccMWukLzH
 oihA9K4Pzxqshpk63J/rkWk6Xc1aWxWG0MXW7Fpb8Wkw1iRxAIG+c7C0sDLlEytZ5dqKqttZbrgBJ3ZY6vE7VFJiDFsIdYtV+kssoMDTj890madf4A/M1KV7
 h9hLTOZ0O89p7icECc0mf7icWqk+pg1LrQ7kH3u38xvphSYxa0upTAkua/Yuyyq5yqINpb+oll+YsKr+/QRarCPrzljJr68Li+jVM26XqYB2b+9mDnL4RAve
 7gY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/9/19 4:38 PM, Maxime Jourdan wrote:
> Hello,
> 
> This RFC proposes a new format flag - V4L2_FMT_FLAG_DYN_RESOLUTION - used
> to tag coded formats for which the device supports dynamic resolution
> switching, via V4L2_EVENT_SOURCE_CHANGE.
> This includes the initial "source change" where the device is able to
> tell userspace about the coded resolution and the DPB size (which
> sometimes translates to V4L2_CID_MIN_BUFFERS_FOR_CAPTURE).

Shouldn't the initial source change still be there? The amlogic decoder
is capable of determining the resolution of the stream, right? It just
can't handle mid-stream changes.

Regards,

	Hans

> This flag is mainly aimed at stateful decoder drivers.
> 
> This RFC is motivated by my development on the amlogic video decoder
> driver, which does not support dynamic resolution switching for older
> coded formats (MPEG 1/2, MPEG 4 part II, H263). It does however support
> it for the newer formats (H264, HEVC, VP9).
> 
> The specification regarding stateful video decoders should be amended
> to include that, in the absence of this flag for a certain format,
> userspace is expected to extract the coded resolution and allocate
> a sufficient amount of capture buffers on its own.
> I understand that this point may be tricky, since older kernels with
> close-to-spec drivers would not have this flag available, yet would
> fully support dynamic resolution switching.
> However, with the spec not merged in yet, I wanted to have your opinion
> on this late addition.
> 
> The RFC patches also adds support for this flag for the 4 following
> stateful decoder drivers:
>  - venus
>  - s5p-mfc
>  - mtk-vcodec
>  - vicodec
> 
> Maxime Jourdan (5):
>   media: videodev2: add V4L2_FMT_FLAG_DYN_RESOLUTION
>   media: venus: vdec: flag OUTPUT formats with
>     V4L2_FMT_FLAG_DYN_RESOLUTION
>   media: s5p_mfc_dec: flag OUTPUT formats with
>     V4L2_FMT_FLAG_DYN_RESOLUTION
>   media: mtk-vcodec: flag OUTPUT formats with
>     V4L2_FMT_FLAG_DYN_RESOLUTION
>   media: vicodec: flag vdec/stateful OUTPUT formats with
>     V4L2_FMT_FLAG_DYN_RESOLUTION
> 
>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst   |  7 +++++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |  4 ++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  1 +
>  drivers/media/platform/qcom/venus/core.h           |  1 +
>  drivers/media/platform/qcom/venus/vdec.c           | 11 +++++++++++
>  drivers/media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       | 13 +++++++++++++
>  drivers/media/platform/vicodec/vicodec-core.c      |  2 ++
>  include/uapi/linux/videodev2.h                     |  5 +++--
>  9 files changed, 43 insertions(+), 2 deletions(-)
> 

