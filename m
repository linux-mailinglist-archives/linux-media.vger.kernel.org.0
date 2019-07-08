Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBD7462B65
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 00:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405049AbfGHWV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 18:21:58 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41312 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730462AbfGHWV5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 18:21:57 -0400
Received: by mail-qk1-f194.google.com with SMTP id v22so14567086qkj.8
        for <linux-media@vger.kernel.org>; Mon, 08 Jul 2019 15:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=v98Wr5FOkwMR7TY1EEt0zMu+cMb31oBbePZfYvUa/vY=;
        b=pLqKW5NFmnXuwaVv0PM2DzrEWUxtFf3juhqAHEymJEGkKc/eQ8xz6gaTsVJIxcdbxM
         RYUbKKK2X9CZBnAoCeiJYLCEviyLAsQfMyix20by0PZzegkjbNfbr3cI3JwU7fwvd6Y1
         gQrO8U/VNKnyLh7/ZKRkEqzV5YKeGH45zWB67qsNpnL8pFbhX+72cPIviQQfbbuXU5cc
         LtrDMPYSpcF92qWXxM4TJKibnTnE80YCQY8Bd2DeOBXc2D0X1qrZsD5S2p4AoZPBw0Go
         bOgkST7pq8Jf6c36wd8qBdT4Ayv9+2Mm4/r3YTAioJ4fMvweso6aW7JXAtytTBMQFSWX
         NB9A==
X-Gm-Message-State: APjAAAVPQ90vptdVuK6zR6g9HdUjH7O0iGfQ8I/IcQOm+YtKfVwih/jr
        0pBpShtkiGOzUYGGwe8FE/zHnP1BPyE=
X-Google-Smtp-Source: APXvYqx+LNo0Ut3yIziDTF9f0MPNv1eAPxja4guHBrIkYyasaZJmX/0Uno85C2W5cAnNBbm7Rwq8oQ==
X-Received: by 2002:a05:620a:47:: with SMTP id t7mr11259669qkt.381.1562624516133;
        Mon, 08 Jul 2019 15:21:56 -0700 (PDT)
Received: from [172.16.0.122] ([201.53.214.131])
        by smtp.gmail.com with ESMTPSA id x10sm11247870qtc.34.2019.07.08.15.21.53
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 15:21:55 -0700 (PDT)
From:   Helen Koike <helen@koikeco.de>
Subject: Re: Linux 5.2 - vimc streaming fails with format error
To:     shuah <shuah@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <9ceba30b-dea6-a337-da3a-20d90398cab5@kernel.org>
 <92cc3020-9017-ec85-281a-583cae5d00e8@kernel.org>
Openpgp: preference=signencrypt
Autocrypt: addr=helen@koikeco.de; keydata=
 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
Message-ID: <1fc86ce0-1c8d-2f0a-079d-d3332735741d@koikeco.de>
Date:   Mon, 8 Jul 2019 19:21:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <92cc3020-9017-ec85-281a-583cae5d00e8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shuah,

On 7/2/19 10:44 PM, shuah wrote:
> On 5/23/19 9:07 AM, shuah wrote:
>> Hi Hans and Helen,
>>
>> vimc streaming fails on Linux 5.2-rc1
>>
>> vimc: format doesn't match in link Scaler->RGB/YUV Capture
>>
>> You can reproduce this easily with v4l2-ctl
>>
>> Streaming works fine on Linux 5.1
>>
>> I narrowed it to the following commit.
>> commit b6c61a6c37317efd7327199bfe24770af3d7e799
>> Author: Helen Fornazier <helen.koike@collabora.com>
>> Date:   Wed Mar 13 14:29:37 2019 -0400
>>
>>      media: vimc: propagate pixel format in the stream
>>
>>
>> Please take a look.
>>
>> thanks,
>> -- Shuah
>>
> 
> Hi Hans and Helen,
> 
> Is there trick to being able to run v4l2-ctl --stream-mmap on vimc
> 
> I am seeing
> 
> VIDIOC_STREAMON returned -1 (Broken pipe)
> 
> since 5.2 and narrowed it to the above commit.
> 
> I am working on vimc life-time problem and unable test my patches
> because of this commit on 5.2
> 
> thanks,
> -- Shuah


Thanks you for working on this and sorry for my late reply.

The media topology requires configuration from userspace, otherwise configuration
between the media entities won't match and you'll get a Broken Pipe (this is expected).

I'll update libcamera to properly configure it, but meanwhile you should
be able to configure with the following commands:

        media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
        media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
        media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
        media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
        v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
        v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
        v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81

I hope this helps.

Thanks again,
Helen
