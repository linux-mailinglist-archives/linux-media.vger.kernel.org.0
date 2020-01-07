Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22AEB13287C
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 15:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgAGOKt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 09:10:49 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:33755 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727658AbgAGOKt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jan 2020 09:10:49 -0500
Received: from [IPv6:2001:420:44c1:2577:cd88:93ae:ae73:3d6c]
 ([IPv6:2001:420:44c1:2577:cd88:93ae:ae73:3d6c])
        by smtp-cloud7.xs4all.net with ESMTPA
        id opZ8iL4ypN9dwopZCiVgkS; Tue, 07 Jan 2020 15:10:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578406247; bh=pguEJtr3YXsgCMYRTcoUdJnzwuGYLyzb8Cqh5UoRA1k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oxg8jTOdB9aQeOquKcvgu3W5i7CI7h/35bf+7sNccPY2SaPOvJK1cdtUYy9mgYuWb
         cb1EVgsNXPa/+Nrcdd2XRBesn3H0Rdo/67Y3r8BKWjqW3RzFa/mcT4qd7fkTOmPet1
         ZXpgF3h/7sj2pU7VWdmdBtQxA+Uu+JuyR+/j3nNpmsojSW4z8APTh35npprgt7sqGV
         BSfM0latdE7FNgcJh/NvW4Qbk0VWJMilL4DT7tfIPo2FU8A9gn4vrhdmtbogt8Y7N7
         6jhMiQPKHYDUtpRNMJLp0E0JeiPWdao1eohc9c54FkUFklN1OUDn6IJxiZ8Y1XfmVo
         DphCJRqdg5cvw==
Subject: Re: [v6, 3/5] media: videodev2.h: Add new boottime timestamp type
To:     Jungo Lin <jungo.lin@mediatek.com>, tfiga@chromium.org,
        laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, ddavenport@chromium.org,
        robh@kernel.org, Sean.Cheng@mediatek.com, sj.huang@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        frankie.chiu@mediatek.com, ryan.yu@mediatek.com,
        Rynn.Wu@mediatek.com, yuzhao@chromium.org, zwisler@chromium.org,
        shik@chromium.org, suleiman@chromium.org
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
 <20191219054930.29513-4-jungo.lin@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <081d7d77-2bf7-0fc2-60ea-8ba8faa5b6af@xs4all.nl>
Date:   Tue, 7 Jan 2020 15:10:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191219054930.29513-4-jungo.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNg4Lmkr4KIIXG1nUIxZodemjtl4ShWQ0W2evICZB55dno8LGxE67kMCEJw9sSghQohHNcrwouG4xpcjlzHo5Am0JLdlwqzGkeDEGKBS8PFZ3G18isZO
 9y68pV3DDBBH2gHfJlefyat2LFY87Yl1ozoyJaC1mUt5IX9Dxp1vIeZdznQ0f5g8fBEuK24VslrsKJkRgK2BgFQTlkO0VPRuEgCMYdJ8H+T5iJgOI7gYQKcl
 S5xjJUmQlbst7HeNE3OuEsXyJD8bJJVxcI6tsIS9zpfz21hmAy9oOAng5W6z2Zbpul54997m4hJhF745kDW9gUi7lIFt9UHabq1MQ0RM+revMjo86GXAx0v8
 Khy+oGhi/oJfbHDf1pbsa1DRSm3rVdPhME/aRxeA9AZyBtMekjUtLUZq/llR2jQrNH56k9V4MkMhhszzJJIVyY7aUyyKBJiDFluwrwihF2Tbtn+vMEB7EDMX
 uXtHwhA+GUKCgvls6GADlmRvrJTw2Z6SCQLrltn+OeuWuWJLUM+zp8O5g+GAYFnRBwzHLRDJcNzzxXh4vAFCMCCL3FbnEuvyoM//hizLbmcoQRO59PbfFMWP
 nqqA73mVkF1j7fLqxTSplzbyK5PA7dNx4k7wPlSHzWggbO4jLD/YGMT6HhnbGxwnhgw0w7cJWj6DdMeoYxhZDmERqAXeW7f0ZfU0CUFjBH3pzBcZxoR5Extv
 tKR4aDsSsVNh+bNhwOkS/soscBxba/BesNT4rnQqpJ+2zdaTZOY1bGw7mCcUck/sLXN6A/IRQr30AQ92Ai7S6RpJHebqWR83WWbxrK76aX09ShGRVIiKkBE8
 al+Ehmq7QTKMTaSTWNVmvC/ooqg2Qc7/PT+7pbEq+dQjkCKhjTLripcwgbI9hsNLvg3ZHhFeUQ3qMxEDYYoSXGeiW/binPzepZQS57EKnXnPfHuYm6XICZt0
 LzDtl3IcIUjRkhdbmtREjqqUa8Ua33Q0EbcK0tNs4d9cuRC78f4aMgini6RZNpV+kUdXCzVd5AaZamenIWNXP8ai8YnItD2Ga7Q52nL6eNvpZvNPDzjWTRIv
 henkShlLsNx/GCZystKzkyNUL5dvf6HVTpo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/19/19 6:49 AM, Jungo Lin wrote:
> For Camera AR(Augmented Reality) application requires camera timestamps
> to be reported with CLOCK_BOOTTIME to sync timestamp with other sensor
> sources.
> 
> The boottime timestamp is identical to monotonic timestamp,
> except it also includes any time that the system is suspended.
> 
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> ---
> Changes from v6:
>  - No change.
> ---
>  Documentation/media/uapi/v4l/buffer.rst | 11 ++++++++++-
>  include/uapi/linux/videodev2.h          |  2 ++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
> index 9149b57728e5..f45bfce7fddd 100644
> --- a/Documentation/media/uapi/v4l/buffer.rst
> +++ b/Documentation/media/uapi/v4l/buffer.rst
> @@ -662,13 +662,22 @@ Buffer Flags
>        - 0x00002000
>        - The buffer timestamp has been taken from the ``CLOCK_MONOTONIC``
>  	clock. To access the same clock outside V4L2, use
> -	:c:func:`clock_gettime`.
> +	:c:func:`clock_gettime` using clock IDs ``CLOCK_MONOTONIC``.

IDs -> ID

>      * .. _`V4L2-BUF-FLAG-TIMESTAMP-COPY`:
>  
>        - ``V4L2_BUF_FLAG_TIMESTAMP_COPY``
>        - 0x00004000
>        - The CAPTURE buffer timestamp has been taken from the corresponding
>  	OUTPUT buffer. This flag applies only to mem2mem devices.
> +    * .. _`V4L2_BUF_FLAG_TIMESTAMP_BOOTIME`:

You mistyped BOOTTIME as BOOTIME in a lot of places. Please check.

> +
> +      - ``V4L2_BUF_FLAG_TIMESTAMP_BOOTIME``
> +      - 0x00008000
> +      - The buffer timestamp has been taken from the ``CLOCK_BOOTTIME``
> +	clock. To access the same clock outside V4L2, use
> +	:c:func:`clock_gettime` using clock IDs ``CLOCK_BOOTTIME``.

IDs -> ID

> +	Identical to CLOCK_MONOTONIC, except it also includes any time that
> +	the system is suspended.
>      * .. _`V4L2-BUF-FLAG-TSTAMP-SRC-MASK`:
>  
>        - ``V4L2_BUF_FLAG_TSTAMP_SRC_MASK``
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 04481c717fee..74ef9472e702 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1060,6 +1060,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
>  #define V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN		0x00000000
>  #define V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC	0x00002000
>  #define V4L2_BUF_FLAG_TIMESTAMP_COPY		0x00004000
> +#define V4L2_BUF_FLAG_TIMESTAMP_BOOTIME		0x00008000

This should be 0x00006000.

(flags & V4L2_BUF_FLAG_TIMESTAMP_MASK) is a value that determines the timestamp
source, so these timestamp defines are values, not bitmasks.

However, I don't like your approach. Whether to use MONOTONIC or BOOTTIME is really
a userspace decision, and locking a driver to one of these two options seems
wrong to me.

Instead add new V4L2_BUF_FLAG_USE_BOOTTIME flag that userspace can set when queuing
the buffer and that indicates that instead of the MONOTONIC timestamp, it should return
the BOOTTIME timestamp. This requires a simple helper function that returns either
ktime_get_ns or ktime_get_boottime_ns based on the vb2_v4l2_buffer flags field.

It's definitely more work (although it can be limited to drivers that use vb2),
but much more useful.

Regards,

	Hans

> +
>  /* Timestamp sources. */
>  #define V4L2_BUF_FLAG_TSTAMP_SRC_MASK		0x00070000
>  #define V4L2_BUF_FLAG_TSTAMP_SRC_EOF		0x00000000
> 

