Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD1338E73B
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 15:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbhEXNR6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 09:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbhEXNR5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 09:17:57 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BF1C061574
        for <linux-media@vger.kernel.org>; Mon, 24 May 2021 06:16:29 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b17so31942515ede.0
        for <linux-media@vger.kernel.org>; Mon, 24 May 2021 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NteyrlulQjjznatG/TX6O9GBExvzsPylyJMvJfSFCOQ=;
        b=RX/6UK6jD+NP8z6hQhTYVUdEN8Oab14tAkF5V1K+4521YQhjndxtX4uRLm1Ij5MVGs
         UNQ2UjCCnkvz9xbHPvvj0UWLFu5CTLyBTmAw7AEG+7oK9/LTf2gzYIXZT6YA3+AbiXWb
         mfYdlHwszN+aJj7V8u7N2jak9OWEiG7yWYylKIIXvS7JKD2MHnCwAtpcpvqQoW+ieoyI
         7cMSccrZwzaJAqE4bcRoBTIlxAgS3ChX7MC/QuJ12vUhOUuHgx6bfXhdn/gm8FU/BIUr
         GEptqvAXHHF2PSMVgHLR+43361qYJI3tAWgUFNGdme+xymYqhFLqEwN4Sx+UHGJsEeY4
         c1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NteyrlulQjjznatG/TX6O9GBExvzsPylyJMvJfSFCOQ=;
        b=CzrFWVYSEWU+u+FLxuczV4e9t2/9Oh4w/mbuOPBhvnNADYfTNfMgS2akts1nZPiE94
         7ft2x1QFZ1zvhqGTZZ6H+6uaXa19WYYoO3BtbgLSjEPzOqdRtANSCaCwXNXV5V7FCZBU
         VV2m9dor0qb7qAbzLC9EIx4UQx9rUUenBbLwaqQmBU7ZbgFTavph4Bh/7whypIllo8k/
         VWirQw6k8vuTM8AEr/k/2yqJpftDfKmBu+WpaWkKpJYC1qJZ620393nzyMJlRZkYcC3D
         zCFo0mW6zuzUpDGEB1TKdJlDyhe+ttB1RHJW1HYZxgxber2i/6zQAsSsRJn90ZGOajva
         iSdQ==
X-Gm-Message-State: AOAM531bRUcBxSrM4SEyBGs6HIZlBZCT6hvXed1tCATihcz2Y+5zgiWM
        n+jX4fgpoj5j3w8zIHqpMPKoGQ==
X-Google-Smtp-Source: ABdhPJw9HCOdmGupxAgbmBBs0BwFiCsdVjm9O2w68VTLcxya5u1x0xiwp6ajb0WMkkk4p8eYHLw8LQ==
X-Received: by 2002:a05:6402:128e:: with SMTP id w14mr11816314edv.99.1621862187926;
        Mon, 24 May 2021 06:16:27 -0700 (PDT)
Received: from [192.168.1.12] (hst-208-222.medicom.bg. [84.238.208.222])
        by smtp.googlemail.com with ESMTPSA id r17sm9219964edt.33.2021.05.24.06.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 06:16:27 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [RFC/WIP 0/4] HEIC image encoder
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
 <3a9c6b170817c0d9456539b683439ed1681953a2.camel@ndufresne.ca>
Message-ID: <5b3d53b5-f4cf-bd47-047d-d554a56ac8d0@linaro.org>
Date:   Mon, 24 May 2021 16:16:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3a9c6b170817c0d9456539b683439ed1681953a2.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

Thanks for comments!

On 5/18/21 8:07 PM, Nicolas Dufresne wrote:
> Le jeudi 29 avril 2021 à 16:28 +0300, Stanimir Varbanov a écrit :
>> Hi,
>>
>> HEIC (High-Efficiency Image Container) is a variant of HEIF (High
>> Efficiency Image File Format) where HEVC/h265 codec is used to encode
>> images.  For more info see [1].
>>
>> In this RFC we propose a new compressed pixel format V4L2_PIX_FMT_HEIC.
>> The name is debatable and could be changed (V4L2_PIX_FMT_HEVC_HEIF is
>> also an option).
>>
>> There are two encoding modes which should be selectable by clients:
>>     1. Regular image encoding
>>     2. Grid image encoding
>>
>> 1. Regular image encoding
>>
>> Propose to reuse stateful video encoder spec [2].
>>
>> - queuing one OUTPUT buffer will produce one CAPTURE buffer.  The
>> client could trigger Drain sequence at any point of time.
> 
> Do you know the rationale why the normal HEVC encoder isn't used and then muxed
> into the HEIF container ? It is these days quite atypical for HW to handle the
> container part. Perhaps they hacked the header, I am not so familiar with these
> new ISOMBF based image format (AV1 got something very similar, though less
> convoluted).

Maybe I did not explain well, but the Venus (and all the knowledge I
have is based on it) does not implement the container part. The
container part is implemented in client. For example I used libheif to
create .heic image file from Venus encoded hevc bitstream.

>>
>> 2. Grid image encoding
>>
>> Propose to reuse stateful video encoder spec [2].
>>
>> - queuing one OUTPUT buffer will produce a number of grids CAPTURE
>> buffers.  The client could trigger Drain sequence at any point of time.
>>
>> This image encoding mode is used when the input image resolution is
>> bigger then the hardware can support and/or for compatibility reasons
>> (for exmaple, the HEIC decoding hardware is not capable to decode higher
>> than VGA resolutions).
>>
>> In this mode the input image is divided on square blocks (we call them grids)
>> and every block is encoded separately (the Venus driver presently supports 
>> grid size of 512x512 but that could be changed in the future).
> 
> Are the blocks always power of two ? Or multiple of 16 ? How do you expose this

I guess the blocks will definitely be a power of two. As far as for
multiple of 16, I guess grid size should be multiple of CTUs (32x32 or
64x64) in case of HEVC. It might be different for the other codecs.

> information to application ? It sounds like an HW decoder would also need to
> expose these restrictions. Userspace will need to be able to check without
> trying if the HW decoder handles the grid side to be able to fallback to
> software decoding.

Depending on what we will decide :
 - use v4l2 control for setting the grid size then we can use
VIDIOC_QUERYCTRL
 - if we decide to set the grid size on the CAPTURE queue SFMT the we
can use VIDIOC_ENUM_FMT

> 
>>
>> To set the grid size we use a new v4l2 control.
>>
>> The side effect of this mode is that the client have to set the v4l2
>> control and thus enable grid encoding before setting the formats on
>> CAPTURE and OUTPUT queues, because the grid size reflects on the
>> selected resolutions. Also the horizontal and vertical strides will
>> also be affected because thеy have to be aligned to the grid size
>> in order to satisfy DMA alignment restrictions.
>>
>> Using of v4l2 control to set up Grid mode and Grid size above looks
>> inpractical and somehow breaks the v4l2 and v4l2 control rules, so
>> I'd give one more option. 
> 
> The stasteless decoders uses a control that must be set after the OUTPUT format,
> but before enumerating capture formats. Not exactly the same, but there is a
> control that interact with the format negotiation.

I'd try to avoid such control if possible.

> 
>>
>> Encoding the Grid mode/size in the new proposed HEIC pixel format:
>>
>>    V4L2_PIX_FMT_HEIC - Regular HEIC image encoding
>>    V4L2_PIX_FMT_HEIC_GRID_512x512 - Grid HEIC image encoding, grid size of 512x512 
>>    and so on ...
> 
> I would be worry of the about of formats that may generates.
> 
>>
>> Comments and suggestions are welcome!
>>
>> regards,
>> Stan
>>
>> [1] https://en.wikipedia.org/wiki/High_Efficiency_Image_File_Format
>> [2] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-encoder.html
>>
>>
>> Stanimir Varbanov (4):
>>   media: Add HEIC compressed pixel format
>>   v4l2-ctrls: Add HEIC grid size control
>>   venus: helpers: Add a new helper for buffer processing
>>   venus: Add HEIC image encoder
>>
>>  .../media/v4l/pixfmt-compressed.rst           |   12 +
>>  drivers/media/platform/qcom/venus/Makefile    |    2 +
>>  drivers/media/platform/qcom/venus/core.h      |   10 +
>>  drivers/media/platform/qcom/venus/helpers.c   |   20 +
>>  drivers/media/platform/qcom/venus/helpers.h   |    1 +
>>  drivers/media/platform/qcom/venus/hfi_cmds.c  |   10 +-
>>  .../media/platform/qcom/venus/hfi_helper.h    |    5 +
>>  drivers/media/platform/qcom/venus/ienc.c      | 1348 +++++++++++++++++
>>  drivers/media/platform/qcom/venus/ienc.h      |   14 +
>>  .../media/platform/qcom/venus/ienc_ctrls.c    |   83 +
>>  drivers/media/v4l2-core/v4l2-ctrls.c          |    3 +
>>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>>  include/uapi/linux/v4l2-controls.h            |    1 +
>>  include/uapi/linux/videodev2.h                |    1 +
>>  14 files changed, 1510 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/media/platform/qcom/venus/ienc.c
>>  create mode 100644 drivers/media/platform/qcom/venus/ienc.h
>>  create mode 100644 drivers/media/platform/qcom/venus/ienc_ctrls.c
>>
> 
> 

-- 
regards,
Stan
