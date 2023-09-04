Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABEB791A8E
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 17:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244726AbjIDPXd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 11:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbjIDPXd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 11:23:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7001BCD4;
        Mon,  4 Sep 2023 08:23:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0197261870;
        Mon,  4 Sep 2023 15:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9E3C433BA;
        Mon,  4 Sep 2023 15:23:19 +0000 (UTC)
Message-ID: <1f45225f-95ec-626d-3bb5-bf9eafd11e19@xs4all.nl>
Date:   Mon, 4 Sep 2023 17:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 00/18] Add DELETE_BUF ioctl
Content-Language: en-US, nl
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/09/2023 14:43, Benjamin Gaignard wrote:
> Unlike when resolution change on keyframes, dynamic resolution change
> on inter frames doesn't allow to do a stream off/on sequence because
> it is need to keep all previous references alive to decode inter frames.
> This constraint have two main problems:
> - more memory consumption.
> - more buffers in use.
> To solve these issue this series introduce DELETE_BUFS ioctl and remove
> the 32 buffers limit per queue.
> 
> VP9 conformance tests using fluster give a score of 210/305.
> The 24 resize inter tests (vp90-2-21-resize_inter_* files) are ok
> but require to use postprocessor.
> 
> Kernel branch is available here:
> https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/commits/remove_vb2_queue_limit_v6
> 
> GStreamer branch to use DELETE_BUF ioctl and testing dynamic resolution
> change is here:
> https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/VP9_drc

FYI: I still need to review and test patches 17 and 18. Either tomorrow or Wednesday.

Regards,

	Hans

> 
> changes in version 6:
> - Get a patch per driver to use vb2_get_buffer() instead of directly access
>   to queue buffers array.
> - Add lock in vb2_core_delete_buf()
> - Use vb2_buffer instead of index
> - Fix various comments
> - Change buffer index name to BUFFER_INDEX_MASK
> - Stop spamming kernel log with unbalanced counters
> 
> changes in version 5:
> - Rework offset cookie encoding pattern is n ow the first patch of the
>   serie.
> - Use static array instead of allocated one for postprocessor buffers.
> 
> changes in version 4:
> - Stop using Xarray, instead let queues decide about their own maximum
>   number of buffer and allocate bufs array given that value.
> - Rework offset cookie encoding pattern.
> - Change DELETE_BUF to DELETE_BUFS because it now usable for
>   range of buffer to be symetrical of CREATE_BUFS.
> - Add fixes tags on couple of Verisilicon related patches.
> - Be smarter in Verisilicon postprocessor buffers management.
> - Rebase on top of v6.4
> 
> changes in version 3:
> - Use Xarray API to store allocated video buffers.
> - No module parameter to limit the number of buffer per queue.
> - Use Xarray inside Verisilicon driver to store postprocessor buffers
>   and remove VB2_MAX_FRAME limit.
> - Allow Versilicon driver to change of resolution while streaming
> - Various fixes the Verisilicon VP9 code to improve fluster score.
>  
> changes in version 2:
> - Use a dynamic array and not a list to keep trace of allocated buffers.
>   Not use IDR interface because it is marked as deprecated in kernel
>   documentation.
> - Add a module parameter to limit the number of buffer per queue.
> - Add DELETE_BUF ioctl and m2m helpers.
> 
> Regards,
> Benjamin
>  
> Benjamin Gaignard (18):
>   media: videobuf2: Rework offset 'cookie' encoding pattern
>   media: videobuf2: Stop spamming kernel log with all queue counter
>   media: videobuf2: Use vb2_buffer instead of index
>   media: amphion: Use vb2_get_buffer() instead of directly access to
>     buffers array
>   media: mediatek: jpeg: Use vb2_get_buffer() instead of directly access
>     to buffers array
>   media: mediatek: vdec: Use vb2_get_buffer() instead of directly access
>     to buffers array
>   media: sti: hva: Use vb2_get_buffer() instead of directly access to
>     buffers array
>   media: visl: Use vb2_get_buffer() instead of directly access to
>     buffers array
>   media: atomisp: Use vb2_get_buffer() instead of directly access to
>     buffers array
>   media: videobuf2: Access vb2_queue bufs array through helper functions
>   media: videobuf2: Be more flexible on the number of queue stored
>     buffers
>   media: verisilicon: Refactor postprocessor to store more buffers
>   media: verisilicon: Store chroma and motion vectors offset
>   media: verisilicon: vp9: Use destination buffer height to compute
>     chroma offset
>   media: verisilicon: postproc: Fix down scale test
>   media: verisilicon: vp9: Allow to change resolution while streaming
>   media: v4l2: Add DELETE_BUFS ioctl
>   media: v4l2: Add mem2mem helpers for DELETE_BUFS ioctl
> 
>  .../userspace-api/media/v4l/user-func.rst     |   1 +
>  .../media/v4l/vidioc-delete-bufs.rst          |  73 ++++
>  .../media/common/videobuf2/videobuf2-core.c   | 379 ++++++++++++------
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  99 ++++-
>  drivers/media/dvb-core/dvb_vb2.c              |   6 +-
>  drivers/media/platform/amphion/vpu_dbg.c      |  22 +-
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    |   6 +-
>  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |   2 +-
>  drivers/media/platform/st/sti/hva/hva-v4l2.c  |   4 +
>  drivers/media/platform/verisilicon/hantro.h   |   9 +-
>  .../media/platform/verisilicon/hantro_drv.c   |   4 +-
>  .../platform/verisilicon/hantro_g2_vp9_dec.c  |  10 +-
>  .../media/platform/verisilicon/hantro_hw.h    |   4 +-
>  .../platform/verisilicon/hantro_postproc.c    |  95 ++++-
>  .../media/platform/verisilicon/hantro_v4l2.c  |  27 +-
>  drivers/media/test-drivers/vim2m.c            |   1 +
>  drivers/media/test-drivers/visl/visl-dec.c    |  28 +-
>  drivers/media/v4l2-core/v4l2-dev.c            |   1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  17 +
>  drivers/media/v4l2-core/v4l2-mem2mem.c        |  20 +
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |   2 +-
>  include/media/v4l2-ioctl.h                    |   4 +
>  include/media/v4l2-mem2mem.h                  |  12 +
>  include/media/videobuf2-core.h                |  29 +-
>  include/media/videobuf2-v4l2.h                |  11 +
>  include/uapi/linux/videodev2.h                |  16 +
>  26 files changed, 664 insertions(+), 218 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst
> 

