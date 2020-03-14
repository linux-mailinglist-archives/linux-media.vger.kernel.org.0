Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 448F418586B
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 03:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbgCOCHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Mar 2020 22:07:22 -0400
Received: from mail-qv1-f68.google.com ([209.85.219.68]:46937 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgCOCHW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Mar 2020 22:07:22 -0400
Received: by mail-qv1-f68.google.com with SMTP id m2so6892952qvu.13
        for <linux-media@vger.kernel.org>; Sat, 14 Mar 2020 19:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=26fQMwgOmUVjg2NR4Ril0ENTtqR6i1LeAMUYZjFOB2w=;
        b=NLG2toN++mXrz6ifcb54qpsHQReXH2h6NAYLiWbMCxI9xFntGkpkhSiGa+yuX4vNzY
         VF1MhIqNy/a24ZJsGytfPMhcPDMn8S9Se7oHwaapuJrj60Xb0Kha6y386xsGmPX+irfh
         L3rh3sGcJFDePELs7MRzgltmBsVAGzrWTQcpHodKHav0yq07q5KkVfkTC0/p7FrJCtNe
         JA/lNuIvlGV5s+mUNbfOotOSdog3L68ee/htGHlCeHO3evQEA8ZoU1PNGFq0V64lKDj7
         e9ff3XEhw3BJcCwRik0jWOrI+y7IYe8iKPlBSjMEaSfIEMVQ/otyQrmv70HeMi3MQ1Sf
         RqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=26fQMwgOmUVjg2NR4Ril0ENTtqR6i1LeAMUYZjFOB2w=;
        b=WYEj6+Amk/TCSvhvcEXHh6avg07Q4i7PheJMgCjZ5LuM8GXBXC25OC+7Rcb6BG4Xbg
         3FkL2fcaiSzgSMR0OSwJ9NcOJAeNveOeTs20rrfNRQX3msuC/UxLldkXH7B40cmjE9Ux
         cmIz2XyGezMjiDS9yTQGJIdjZ3FGAPdGMbyvs2YTut0KbgLyyST6YIL6e5VVB/ujeC3s
         UbMbIghffTKAxsV1bkgU4cG1sbP6j7Old7GDk+AL7t+qHPBRBYXrwz/9V180Hwzp1psO
         dF9f+x+6ZbyiwZGvtLJ2/4NQLrr3ytQ1YOVvxGRXxdj0zFn6VcJ90vbxTMEy0pWWD6ZA
         ih3g==
X-Gm-Message-State: ANhLgQ2OffG2HMKBQXjNxfKtsrf7B/LvP4/E9bJepd1fhVteAv8wpTeX
        DR9iSkeVZ1YTAIvzLDr/6OpB2T2sshs=
X-Google-Smtp-Source: ADFU+vvpRGeLjzT6r6SqaCYQvpXDe0AxNcj6BJEup4MolBFuQumaihuOuC8LD5ukwQRp4Z8dT6/Cfg==
X-Received: by 2002:aa7:94b5:: with SMTP id a21mr18646039pfl.290.1584225056216;
        Sat, 14 Mar 2020 15:30:56 -0700 (PDT)
Received: from ?IPv6:2605:e000:d445:6a00:bd03:a881:a59:15cb? ([2605:e000:d445:6a00:bd03:a881:a59:15cb])
        by smtp.gmail.com with ESMTPSA id g6sm12154169pjv.13.2020.03.14.15.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2020 15:30:55 -0700 (PDT)
Subject: Re: [PATCH 0/8] media: imx: Miscalleanous format-related cleanups
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
 <5b773016-8a71-9739-237d-69c0dc8bd349@gmail.com>
 <20200312004735.GG1639@pendragon.ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <1a10d9b2-3e5b-4cbd-d703-5012fa8fa6ad@gmail.com>
Date:   Sat, 14 Mar 2020 15:30:53 -0700
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

Hi Laurent,

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

I found the thread finally. In fact I did some work on this set already, 
I fixed the kbuild warnings as well as added some function headers 
describing all the format search criteria arguments. Also changed a 
local var in enum_formats() to better document the enum algorithm.

Unless you've started on this work already, I will be returning from 
vaca tomorrow and can pick this up again, merging in your patches, as 
well as splitting up find|enum_formats() into find|enum_formats() and 
find|enum_codes(), which is the remaining suggestion from Hans.


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

