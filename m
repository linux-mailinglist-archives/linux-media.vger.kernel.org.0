Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5C359DA9
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 16:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfF1OXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 10:23:51 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34112 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfF1OXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 10:23:51 -0400
Received: by mail-lf1-f66.google.com with SMTP id y198so4115382lfa.1
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jazJikWs53JblJlge+x05wz6lsgoAUTPWWDU+NDItRg=;
        b=Kbu36oBZoqBFezbtClxt+7rC0ANG3Cj06iz8OVSOF4191OklQuxrnD+19u2OgMYbQx
         xiRDzVRFdcvIIoi4ps9rZIN8X0A6u9C7D+DG3kStsajBj+h55epUXs5gwZiUEqoZeCU4
         Gb/HC1RbRN30dDLjlISaiwLNG3faT6bx2ME+KDZexW6tVZcxsANT+BfkF7f5LAbIohvH
         wUMipnw7PYTqQyzmXu3ZhtLus61whF5i6Dpg9m0Q61hCrrLypUnpZJBUc3Fyg+awBa3t
         i8Q+NfFQRELjO5MCd6w0dyL5mEK7JZYeGnryA3iy7OnCvSmSbVTIr5tt1A91ls3scgtz
         sGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jazJikWs53JblJlge+x05wz6lsgoAUTPWWDU+NDItRg=;
        b=XgIoHD9IjISeXAPlYkLySlQmsBkiNDDQm20TXucxJglQG1r68ww/Dtim0dl2FBpgCP
         hayUrFRzejLT2iRiU3G2pWG42L2W3PhmD7u7vpOcJo5BpCFHAfFxS9/dNeM2zBp/apMT
         L8GgoetMXTQexiiuFPE5XoNf2sU9aXh/e3gnZnnLqPdoik2OEQSw2G/1pf7MO1CpGgaY
         bCCEAWfgn+TXwCU079e30A0AQy4Ow0hq71eaKEIBU0L0ARCfZzv5g0djItg8RIa6uq+D
         e2tEWXZJ/7XGLvhOVmuqRZdnNV0kvLf8A0fDRRQwFeV75K2qHgD0KnN2+9zNZ0LJ6R4H
         FY6g==
X-Gm-Message-State: APjAAAU+4jhhq2/VLG9jOR2yiAo30ag/NVJ+PLxyODW0omc5Nb5vawf1
        aU6JgMmMA27fSKJGuOm0jLyIfA==
X-Google-Smtp-Source: APXvYqwvmQ3iMcm6en0qdMK+V/eXncZgV39i95gg4fMqCk4LLZZyqexW8nEr4lbYZXNkN9EJ0CWOVg==
X-Received: by 2002:a19:7716:: with SMTP id s22mr5136656lfc.64.1561731829204;
        Fri, 28 Jun 2019 07:23:49 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id t63sm762337lje.65.2019.06.28.07.23.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 07:23:48 -0700 (PDT)
Subject: Re: [PATCH v2 00/11] Venus stateful Codec API
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
 <9c3399a8-4fc6-3117-10ee-3395cee034da@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <997204c7-c702-868c-9a49-52fefc9ab3d2@linaro.org>
Date:   Fri, 28 Jun 2019 17:23:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <9c3399a8-4fc6-3117-10ee-3395cee034da@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 6/28/19 4:37 PM, Hans Verkuil wrote:
> On 6/28/19 2:59 PM, Stanimir Varbanov wrote:
>> Hello,
>>
>> Here is v2 of the Venus transition to stateful codec API
>> compliance. The v2 can be found at [1].
>>
>> Changes since v1:
>>  * codec_state is now enum
>>  * dropped IS_OUT and IS_CAP macros and use vb2_start_streaming_called()
>>  * corrected g_fmt and reconfig logic
>>  * s/vdec_dst_buffers_done/vdec_cancel_dst_buffers
>>  * use v4l2_m2m_ioctl_try_decoder_cmd M2M helper
>>  * various fixes to make v4l2-compliance pass the streaming test
>>
>> To test the streaming with --stream-from-hdr v4l2-compliance option I have
>> to make the following hack (it is needed because the size of decoder input
>> buffers (OUTPUT queue) is not enough for the h264 bitstream, i.e the driver
>> default resolution is 64x64 but the h264 stream is 320x240):
>>
>> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> index c71dcf65b721..dc0fcf20d3e4 100644
>> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> @@ -1294,6 +1294,11 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
>>                                         fmt.s_sizeimage(fmt.g_sizeimage(p) * 2, p);
>>                         }
>>                         fail_on_test(q.create_bufs(node, 1, &fmt));
>> +
>> +                       for (unsigned p = 0; p < fmt.g_num_planes(); p++)
>> +                               fmt.s_sizeimage(fmt.g_sizeimage(p) * 2, p);
>> +                       node->s_fmt(fmt);
>> +
>>                         fail_on_test(q.reqbufs(node, 2));
>>                 }
>>                 if (v4l_type_is_output(type))
> 
> Does the venus driver set sizeimage based on the given output resolution?

Yes.

> 
> E.g. if v4l2-compliance would first set the output resolution to 320x240,
> is the returned sizeimage value OK in that case?

Yes.

Here are few options to me:
 - set the correct resolution
 - set 0x0 and sizeimage at some arbitrary value (1 or 2MB). Despite if
the bitstream is 4K it will not be enough if the bitrate is huge.
 - invent some mechanism to trigger reconfiguration on the OUTPUT queue
as well (similar to the CAPTURE queue)

> 
> And this also means that the venus driver requires each buffer to have
> a single compressed frame, right? I.e. it can't be spread over multiple
> OUTPUT buffers.

I cannot say for sure but that is how all downstream cases uses it i.e.
one compressed frame per input buffer. I wonder if you fill input
decoder buffer with many compressed frames in one input decoder buffer
how you pass the timestamp for every packet?

> 
> We really need to let userspace know about such restrictions.
> 
> Stanimir, can you list the restrictions of the decoder for the various
> codecs?

What you mean? Restrictions like "one compressed frame per input buffer"?

-- 
regards,
Stan
