Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F68E387E3C
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 19:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344186AbhERRJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 13:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239478AbhERRJH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 13:09:07 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71665C061573
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 10:07:49 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id l129so9962455qke.8
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 10:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ZoeBzd2qIYnpyFwHkst81r+c/yX9fIxmhQRsqSYuafU=;
        b=fkBQ4rd0eL02xmwLfEC9OW2Yxu5xGnbDzI/eCsTkr6kVj5zZ+as09RxnuvpT1n3MQB
         eYsWv/Fm1z+58FJUQs52teI5YZUB8g5NDIXD3phfTPasF/AfxkOqoORPayDHl89WEI/t
         Rj6Yk0TF3wRIPWj7sKGkBpY0lu6/AwgUU7N2YsYQDUzknFNPParf+CzGQ6UQC8yaa7sw
         Vy1fKTDmxD5+wUCKTytqEzPcNXt+t3q3rt/gXXc9p4uwLd/Je6lZo7X+D3Xog7Tuizmr
         aZh8TpKoJPa2fXozWdpAAF8OjAkqAgO6kgHoNQY6u8rRXroHWJs7TatpR4e3+Rt9yNBI
         sGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZoeBzd2qIYnpyFwHkst81r+c/yX9fIxmhQRsqSYuafU=;
        b=c5N96s0mxYgNp3auBykWAflDMhJqld49T1rLaxcMzajWIPkRgs3KCitDcd8HmbTSLT
         a/f7/aksLyDqHQLRw8obD/Aw7UtuxWDPUM8SG8zK9RyowijYc/k5WXPlpy7n6ufqTmVU
         XEmDAcd4PNAY+Kiz6x6jG3F1yRyl4p75irt5Ny3frtZPtrtHP5PbJsBrEbmXEvyAtL9D
         3irtkCDVxu7r0sgb2JmmHFvV4MS0sKjVAenOik8Ou2p1W/rHSknIJOdpraC/MKB0AGAD
         eJQZEeg/Uf9gatw0qrhr5ew1tCcpE++ONQcSHnTThDCpK5iY+knn8oJEaF/N3RHmZvzA
         Rp6Q==
X-Gm-Message-State: AOAM532Rt/2McN/OjtePPS4HVewS/TVasIfISMR2Pz2WGMWz+OEQtq7K
        IAG2unKX/nn3Ctdf3HkPYBpilQ==
X-Google-Smtp-Source: ABdhPJymeAQZkd/N+VpKrntqIAo/AYnGQDIZI8gcjjYZgDqDbXT+7v4ka2Y4+QcmUNutn9Nlx2quNw==
X-Received: by 2002:ae9:ef46:: with SMTP id d67mr3514691qkg.312.1621357668584;
        Tue, 18 May 2021 10:07:48 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id g25sm12821395qtu.93.2021.05.18.10.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 10:07:48 -0700 (PDT)
Message-ID: <3a9c6b170817c0d9456539b683439ed1681953a2.camel@ndufresne.ca>
Subject: Re: [RFC/WIP 0/4] HEIC image encoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Tue, 18 May 2021 13:07:47 -0400
In-Reply-To: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 29 avril 2021 à 16:28 +0300, Stanimir Varbanov a écrit :
> Hi,
> 
> HEIC (High-Efficiency Image Container) is a variant of HEIF (High
> Efficiency Image File Format) where HEVC/h265 codec is used to encode
> images.  For more info see [1].
> 
> In this RFC we propose a new compressed pixel format V4L2_PIX_FMT_HEIC.
> The name is debatable and could be changed (V4L2_PIX_FMT_HEVC_HEIF is
> also an option).
> 
> There are two encoding modes which should be selectable by clients:
>     1. Regular image encoding
>     2. Grid image encoding
> 
> 1. Regular image encoding
> 
> Propose to reuse stateful video encoder spec [2].
> 
> - queuing one OUTPUT buffer will produce one CAPTURE buffer.  The
> client could trigger Drain sequence at any point of time.

Do you know the rationale why the normal HEVC encoder isn't used and then muxed
into the HEIF container ? It is these days quite atypical for HW to handle the
container part. Perhaps they hacked the header, I am not so familiar with these
new ISOMBF based image format (AV1 got something very similar, though less
convoluted).

> 
> 2. Grid image encoding
> 
> Propose to reuse stateful video encoder spec [2].
> 
> - queuing one OUTPUT buffer will produce a number of grids CAPTURE
> buffers.  The client could trigger Drain sequence at any point of time.
> 
> This image encoding mode is used when the input image resolution is
> bigger then the hardware can support and/or for compatibility reasons
> (for exmaple, the HEIC decoding hardware is not capable to decode higher
> than VGA resolutions).
> 
> In this mode the input image is divided on square blocks (we call them grids)
> and every block is encoded separately (the Venus driver presently supports 
> grid size of 512x512 but that could be changed in the future).

Are the blocks always power of two ? Or multiple of 16 ? How do you expose this
information to application ? It sounds like an HW decoder would also need to
expose these restrictions. Userspace will need to be able to check without
trying if the HW decoder handles the grid side to be able to fallback to
software decoding.

> 
> To set the grid size we use a new v4l2 control.
> 
> The side effect of this mode is that the client have to set the v4l2
> control and thus enable grid encoding before setting the formats on
> CAPTURE and OUTPUT queues, because the grid size reflects on the
> selected resolutions. Also the horizontal and vertical strides will
> also be affected because thеy have to be aligned to the grid size
> in order to satisfy DMA alignment restrictions.
> 
> Using of v4l2 control to set up Grid mode and Grid size above looks
> inpractical and somehow breaks the v4l2 and v4l2 control rules, so
> I'd give one more option. 

The stasteless decoders uses a control that must be set after the OUTPUT format,
but before enumerating capture formats. Not exactly the same, but there is a
control that interact with the format negotiation.

> 
> Encoding the Grid mode/size in the new proposed HEIC pixel format:
> 
>    V4L2_PIX_FMT_HEIC - Regular HEIC image encoding
>    V4L2_PIX_FMT_HEIC_GRID_512x512 - Grid HEIC image encoding, grid size of 512x512 
>    and so on ...

I would be worry of the about of formats that may generates.

> 
> Comments and suggestions are welcome!
> 
> regards,
> Stan
> 
> [1] https://en.wikipedia.org/wiki/High_Efficiency_Image_File_Format
> [2] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-encoder.html
> 
> 
> Stanimir Varbanov (4):
>   media: Add HEIC compressed pixel format
>   v4l2-ctrls: Add HEIC grid size control
>   venus: helpers: Add a new helper for buffer processing
>   venus: Add HEIC image encoder
> 
>  .../media/v4l/pixfmt-compressed.rst           |   12 +
>  drivers/media/platform/qcom/venus/Makefile    |    2 +
>  drivers/media/platform/qcom/venus/core.h      |   10 +
>  drivers/media/platform/qcom/venus/helpers.c   |   20 +
>  drivers/media/platform/qcom/venus/helpers.h   |    1 +
>  drivers/media/platform/qcom/venus/hfi_cmds.c  |   10 +-
>  .../media/platform/qcom/venus/hfi_helper.h    |    5 +
>  drivers/media/platform/qcom/venus/ienc.c      | 1348 +++++++++++++++++
>  drivers/media/platform/qcom/venus/ienc.h      |   14 +
>  .../media/platform/qcom/venus/ienc_ctrls.c    |   83 +
>  drivers/media/v4l2-core/v4l2-ctrls.c          |    3 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>  include/uapi/linux/v4l2-controls.h            |    1 +
>  include/uapi/linux/videodev2.h                |    1 +
>  14 files changed, 1510 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/qcom/venus/ienc.c
>  create mode 100644 drivers/media/platform/qcom/venus/ienc.h
>  create mode 100644 drivers/media/platform/qcom/venus/ienc_ctrls.c
> 


