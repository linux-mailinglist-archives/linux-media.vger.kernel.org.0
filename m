Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139151B105D
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 17:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgDTPjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 11:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgDTPjs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 11:39:48 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7256C061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 08:39:47 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id x18so12790378wrq.2
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tBfo4+pFkKrmU6eIwlLF4X+B899vvtUyHYmb/XCzx4I=;
        b=yQ4s7D65uv2uVCEayVB9UfkCDO4B+2i2UYrsiDEiPzOQ+f+tC1O+TMav/Ou9kKsIOi
         +Dr6E+ev8R+xURDDrJQZW9OOesA9UbKpIBjA9fhCJuoz56nh+Ic5cUJYHdevspCAMSCb
         6rY03bgYW2Q017CDUvCYNbVSQ2UNiEX554FoYEk+VH/z8wYl6+7ezK7aTaKLVd62BOWT
         ENK726NNSJOgj1op25fzEbaV02897zbZlvr6Q6WlGL+KZejjUGqytG/tVDmU6D7yFF5u
         +YoIy+BY2JhZk4WMD7PlL98vbu3OYf34q9D6QG0zrGa7+1zOAXOM5KVXdfyiWgPTBt3i
         Rxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tBfo4+pFkKrmU6eIwlLF4X+B899vvtUyHYmb/XCzx4I=;
        b=Kj/xS+CFPPLdjqgNAgDJfXxQfPekcg1t2i0bofAIYRhScHoNnT9eNDdumtYENsN2Uj
         56QNe6QTL2i3mn/WPSvIjOj+UYr86HQAGQTGw+PyQXCw1s7Dv/6wio04llgN5O7lolX7
         KqfLSk7543cU7ogvz83Pscbwiwh/c+jKi1ulTVKz9bmV7fXHEuqxjVY+3/Bf2hR3sOfi
         d5WFaq5u5VboftDkw4gyHwneCQsDlSsnu03l9KujMHo6kLIBX5KJZPLCOuwWT9cNe9X3
         HTOO6lc4DChC7VvZJMD+902QZa5dT5NgBXGiCmUz8yCWZCGvTmqFs2eJ/VklPkBdh4Je
         2QAg==
X-Gm-Message-State: AGi0PuaXTz4MpSk+kL+o5Piu40pyON2WVZsU6xyD/IE9v0d9yi+CbvA0
        WD2gzY5dPGbORxKjbo6Afs9B+RCiQMJNBQ==
X-Google-Smtp-Source: APiQypJg198wWgr/yfSHqlXDvexQFspmVz6ovTRMJ+Cz1Sszqpa907srBbuQeWoca6/4us+Fjwo/tw==
X-Received: by 2002:a05:6000:1287:: with SMTP id f7mr19891134wrx.345.1587397186466;
        Mon, 20 Apr 2020 08:39:46 -0700 (PDT)
Received: from [192.168.1.5] (212-5-158-142.ip.btc-net.bg. [212.5.158.142])
        by smtp.googlemail.com with ESMTPSA id c83sm1947059wmd.23.2020.04.20.08.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 08:39:45 -0700 (PDT)
Subject: Re: decode sync frames only
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
References: <9a58a501-8348-2230-2ab5-534471d866ca@linaro.org>
 <b4471541-aeaf-462b-ee36-14ac4e2845f8@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <00202b06-1cfb-e3d1-bd1b-117789b031a1@linaro.org>
Date:   Mon, 20 Apr 2020 18:39:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b4471541-aeaf-462b-ee36-14ac4e2845f8@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 4/20/20 5:48 PM, Hans Verkuil wrote:
> On 20/04/2020 16:38, Stanimir Varbanov wrote:
>> Hi,
>>
>> I need to port a decoder v4l2 control in mainline Venus driver which
>> instructs the decoder to decode sync frames only (I frame/ IDR frame).
>> In practice the usage of such control is to generate thumbnails for
>> particular video.
>>
>> To do that I researched what we have currently in v4l2-controls.h and
>> found something similar but for encoders:
>>
>> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME
>> "Force a key frame for the next queued buffer. Applicable to encoders.
>> This is a general, codec-agnostic keyframe control."
>>
>> I think I have two options:
>>
>> 1. reuse V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME for the decoder and document it
>>
>> 2. create a new v4l control V4L2_CID_MPEG_VIDC_VIDEO_SYNC_FRAME_DECODE
> 
> Make a new v4l control. The encoder control is for something quite different.
> 
> How about V4L2_CID_MPEG_VIDEO_DEC_KEY_FRAMES_ONLY?

What you mean by "_DEC_" in the name - DECODER or DECODE?

I've found
V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE and
V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER

in v4l2-controls.h which use the whole word "DECODER", thus I wonder
what is proffered word to follow the v4l2-controls.h naming style.

-- 
regards,
Stan
