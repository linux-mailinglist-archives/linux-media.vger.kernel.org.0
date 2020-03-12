Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99731182662
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 01:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387486AbgCLAzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 20:55:49 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39175 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387404AbgCLAzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 20:55:49 -0400
Received: by mail-pf1-f196.google.com with SMTP id w65so2322410pfb.6
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 17:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HQdjkKpBz7yEFg2fY92kWUE8JymTANsWv8RztaIPcIM=;
        b=FHLtJ2t3rSxY5RoqL24Db8KwTm38P69ofz4hDkiunbhIgaD2qzWm6WAjQo5QvlDDpV
         w0DKadbM08nShzZHvFFxZfjRbP/nObaConPEnY0GfuU135qiZJS6zvnHtDKcpUGCla0Y
         MKdPq1MFwRmQ2WytmtcIOxY/mvP/HEwnPSqLtoBP7Qut37fN6yPcQ2/i5ZobYb//+nY2
         YeO5e5yi6U6Trsvm8I/ISzCDo883k0Q75EaAAbxHh/0Vk2S3b0ptzX284CUpgnlILdsr
         SBDAzNzKFdeynt+Y0W3au31FhE+RUhEZZdCaRx8pIRJ4KBw49/H0CzCszmB6y/qCPa4r
         RRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HQdjkKpBz7yEFg2fY92kWUE8JymTANsWv8RztaIPcIM=;
        b=Ue3AHSR95OTYN8kR/VKPny1plnhUurCyItJrMGdgvpaYyDLWgS3tN+XqxRnBTX+G7t
         EhMJtVVu7ensq0/xI5u8FLIrV1dedVMSPEyFhZVdzpqbvFHclBkH6LKFkdbnoM6qXQtd
         d/DKOhioqdj44AG72i1iVknnAMEkapFaEpkPqN9gDqVGHxArR8QjyKF1TigAea+xWP5n
         +mkxAw7SbkIKPp/O63y9LehOhQdqgM2xnw1A7+43gCgUleE/upS8DcmYJ2Y3QKvKL+t3
         iScipCVK968GP1Lm2D3p9d1P1dBWxhnu9z3qqe7DMfDvugDSQMxO5p1JuWrOwpfHzImh
         Cd/w==
X-Gm-Message-State: ANhLgQ2xtD8mN0yG9q6snipaf4fKxcc+gy0mbB5ubYUscWTVvZBu+l/6
        1TTHLXIw5sPgWuBjj4POdtM=
X-Google-Smtp-Source: ADFU+vsJo//0jAuPFYADX6OP8i4N3OMIywJ9YALbo9Jc+SRL6+Kmwia933v/e8lEQmdJV0Gzim4j7g==
X-Received: by 2002:a63:e141:: with SMTP id h1mr5030313pgk.129.1583974547638;
        Wed, 11 Mar 2020 17:55:47 -0700 (PDT)
Received: from ?IPv6:2605:e000:d445:6a00:bd03:a881:a59:15cb? ([2605:e000:d445:6a00:bd03:a881:a59:15cb])
        by smtp.gmail.com with ESMTPSA id 129sm46322500pgf.10.2020.03.11.17.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 17:55:47 -0700 (PDT)
Subject: Re: [PATCH 0/8] media: imx: Miscalleanous format-related cleanups
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
 <5b773016-8a71-9739-237d-69c0dc8bd349@gmail.com>
 <20200312004735.GG1639@pendragon.ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <73211643-9b87-4d66-6b3c-83803a76366b@gmail.com>
Date:   Wed, 11 Mar 2020 17:55:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312004735.GG1639@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/11/20 5:47 PM, Laurent Pinchart wrote:
> Hi Steve,
>
> On Wed, Mar 11, 2020 at 05:16:49PM -0700, Steve Longerbeam wrote:
>> Hi Laurent,
>>
>> I agree that the find/enum format code in imx-utils needs cleanup, it's
>> too confusing. I will be ready to give my ack to the imx-utils patches
>> once I do some smoke testing on a sabre target when I return from vacation.
>>
>> Note that Phillip also submitted a fixup patch to the find/enum format
>> code, IIRC it did more consolidating of the imx_media_pixfmt tables. I
>> can't find it and it has gotten lost, but I tested and provided a
>> reviewed-by at the time.
> I've found them in the mail archive. There were 3 patches, Hans said he
> would take the first two, but only the first one got merged. I'll take
> the two others and build on top of them, fixing the issues pointed out
> by the kbuild robot and addressing Hans concerns.

Thanks!

Steve

>
>> On 3/10/20 9:18 AM, Laurent Pinchart wrote:
>>> Hello,
>>>
>>> This patch series started as an attempt to fix the format get and set
>>> subdev operations on the i.MX7 CSI-2 receiver subdev, which it does in
>>> patch 1/8. Patch 2/8 further cleans up the format-related code in that
>>> subdev.
>>>
>>> Patches 3/8 to 8/8 pushes the cleanups further as I was attempting to
>>> fix the format enumeration on the video node at the end of the pipeline.
>>> I realized as part of that effort that there's more work than I
>>> anticipated, and I'm currently evaluating the possible options.
>>> Nonetheless, I think the cleanups make sense even without what I wanted
>>> to build on top of them, so I'm sending them out already.
>>>
>>> Laurent Pinchart (8):
>>>     media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
>>>     media: imx: imx7-mipi-csis: Centralize initialization of pad formats
>>>     media: imx: utils: Inline init_mbus_colorimetry() in its caller
>>>     media: imx: utils: Handle Bayer format lookup through a selection flag
>>>     media: imx: utils: Simplify IPU format lookup and enumeration
>>>     media: imx: utils: Make imx_media_pixfmt handle variable number of
>>>       codes
>>>     media: imx: utils: Remove unneeded argument to (find|enum)_format()
>>>     media: imx: utils: Rename format lookup and enumeration functions
>>>
>>>    drivers/staging/media/imx/imx-ic-prp.c        |   8 +-
>>>    drivers/staging/media/imx/imx-ic-prpencvf.c   |   6 +-
>>>    drivers/staging/media/imx/imx-media-capture.c |  22 +-
>>>    .../staging/media/imx/imx-media-csc-scaler.c  |   2 +-
>>>    drivers/staging/media/imx/imx-media-csi.c     |  26 +-
>>>    drivers/staging/media/imx/imx-media-utils.c   | 313 ++++++++----------
>>>    drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
>>>    drivers/staging/media/imx/imx-media.h         |  24 +-
>>>    drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
>>>    drivers/staging/media/imx/imx7-mipi-csis.c    | 138 ++++----
>>>    10 files changed, 271 insertions(+), 289 deletions(-)

