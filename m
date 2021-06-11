Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1F83A42D4
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 15:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbhFKNPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 09:15:05 -0400
Received: from mail-ed1-f48.google.com ([209.85.208.48]:43758 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbhFKNPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 09:15:05 -0400
Received: by mail-ed1-f48.google.com with SMTP id s6so37040401edu.10
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Hr2Qn7RQQnVZre9fhZ8UebR0WUcPtKIYg46SlclCvv4=;
        b=uHQtKMSAMu2/oJK/FSIUTSnOo0slWc+kwkkTM4ModlU0y4mG29sglhomBL3mTI4Jcl
         i/dj3csO6FyYDiu/0U9eGrbeFq7G5I7ieHKdzJ4Ib5ZJkksnN3ZCfnEbeGTD4jHfhyuh
         sQT/rJhG8NUinkPCbn+k34MMHNwQI7ug3j3zUvKWzKcABn1E8PESUGAbc7wtqahb2A9N
         4SNPE76keZLhP3Y2o6g7BTKj3IHioZT0y+NtDP/vdd/Dwe0Utk8TC+MT47hIfFFZl40V
         U70MJY0Nc7cOnocMmoTxvOfyZ5JIcC7c1Pd313SDPk/LxclEkQKXj2Dachi7mh8rwxZh
         M5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hr2Qn7RQQnVZre9fhZ8UebR0WUcPtKIYg46SlclCvv4=;
        b=dvwdYc/2KotFrb01dikayKdWux0xlLch1eGzuJRNILYEFJiTTAzn/V3TlcdJgLzw8X
         9k+deKEYPTlv4MvZAxpb02LTv7crvwSDv6UOEExik/SoAput+WDebt+V4/8AdZ4yzh+/
         rDa8vEvRpPCApqOoS5SbCfjUr6oFew5R3MjuicEp2QFJ/DDZdGduflwi+5rXm2gWGDDH
         xGMxbd9enKL6I0YFyNxma3mi8OZ3xyuUD/e6p4KtzL147N7XTRLzD6OmvnFewVKToAWK
         TEGmSDp6bTNnzNW7rVjSG+Fu1GcBPQ2kua6bl/GZb2JKkSf0oFfzT1RozSa1LxIyr93m
         zBNQ==
X-Gm-Message-State: AOAM532sXM46syPeaflpUDNzSrorsoS8qG/hvkWhmpKIFCwLsXgVKNUw
        jPly66T3yeaJlI1WjUt1mx2gwbpbUYX0lIRM
X-Google-Smtp-Source: ABdhPJzHY5eBNUOMJu3WpagNmBCGz8APwevp3XkzbqSioBUeDo2wQrA5WpCiZgGgOq4W2pMJxwgTfA==
X-Received: by 2002:a05:6402:4395:: with SMTP id o21mr3625845edc.163.1623417126537;
        Fri, 11 Jun 2021 06:12:06 -0700 (PDT)
Received: from [192.168.1.28] (hst-221-46.medicom.bg. [84.238.221.46])
        by smtp.googlemail.com with ESMTPSA id k21sm2566483edo.41.2021.06.11.06.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 06:12:06 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [RFC/WIP 0/4] HEIC image encoder
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
 <ae54a98a-c1e5-e7f9-4d3f-fa4a56b9a359@xs4all.nl>
Message-ID: <3916c03f-9996-3de3-4365-3e88abf052d2@linaro.org>
Date:   Fri, 11 Jun 2021 16:12:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ae54a98a-c1e5-e7f9-4d3f-fa4a56b9a359@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 5/27/21 10:54 AM, Hans Verkuil wrote:
> Hi Stanimir,
> 
> On 29/04/2021 15:28, Stanimir Varbanov wrote:
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
> 
> Is grid image encoding part of the spec for this format? Is this something
> that the venus hardware needs due to image resolution limitations as
> described above?

Yes, it is part of the ISO/IEC 23008-12 (2017). The spec defines Image
grid derivation, where each tile is a separate image and associated with
derived image of type _grid_ which reconstruct all tiles into a single
image for display.

> 
> Would it be possible for the driver to handle this internally? I.e.,
> if it detects that it needs to switch to grid mode, can it just encode
> each grid and copy it in the capture buffer? This assumes that there is
> metadata that can be used by a decoder do find and decode each grid.
> 

In case that is is part of the spec I don't think we have to do it.
Something more, when each tile is separate image the decoding process
could be done in parallel.

>>
>> In this mode the input image is divided on square blocks (we call them grids)
>> and every block is encoded separately (the Venus driver presently supports 
>> grid size of 512x512 but that could be changed in the future).
>>
>> To set the grid size we use a new v4l2 control.
> 
> Can the driver make a choice of the grid size, and the control just
> reports the grid size? I.e., does it make sense for userspace to set
> this?
> 

I'm not familiar with userspace implementations so far, but my feeling
is that the userspace should configure that - at least this will give
clients flexibility. References with more information [1] - [5].

> The wiki page [1] doesn't mention grids, so where does this come from?
> Is it part of some spec? Or is it a venus-specific feature?
> 
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
>>
>> Encoding the Grid mode/size in the new proposed HEIC pixel format:
>>
>>    V4L2_PIX_FMT_HEIC - Regular HEIC image encoding
>>    V4L2_PIX_FMT_HEIC_GRID_512x512 - Grid HEIC image encoding, grid size of 512x512 
>>    and so on ...
>>
>> Comments and suggestions are welcome!
> 
> I notice that this RFC just talks about the encoder, does venus also
> support a decoder? How would a HW decoder handle grids?

AFAIK the decoding part is not doing something special and
reconstructing the whole image from tiles is done by the userspace
client [6].

> 
> Regards,
> 
> 	Hans

-- 
regards,
Stan

[1] https://0xc0000054.github.io/pdn-avif/using-image-grids.html#fnref:3
[2] https://nokiatech.github.io/heif/technical.html
[3] https://github.com/lclevy/canon_cr3/blob/master/heif.md
[4]
https://github.com/nokiatech/heif/blob/master/srcs/api-cpp/GridImageItem.cpp
[5]
https://github.com/strukturag/libheif/blob/master/libheif/heif_context.cc#L163
[6]
https://github.com/strukturag/libheif/blob/master/libheif/heif_context.cc#L1317
