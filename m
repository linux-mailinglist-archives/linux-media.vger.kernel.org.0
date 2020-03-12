Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84887182626
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 01:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731507AbgCLAQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 20:16:53 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41052 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731448AbgCLAQx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 20:16:53 -0400
Received: by mail-pl1-f193.google.com with SMTP id t14so1874445plr.8
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 17:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ED6WFt086qwoc3VqLhszguYRr+O7uIKQyWuBFcr8TI8=;
        b=ofLMreV6CRPcgvWJAPe9RJHAEVhrLno0ktCXtJNlYkMs3GKrRqxAgW1jrpb6ku0EkR
         48/7HP2gMPhXQ4pa1jkTYhbHEhKzQA2GndjSSW4fNO2vDJb0Z2sE0ViAOTMcD4kCSzM2
         pqqUtf8ASaGxVdPC5ZE+7oU663iw+AEvD+w9ukb2BRi478idC3CqgJoBvLNvUVQKFwj0
         y+eIzJsSmYmtWzJquEN5MLfUS/Ttyk/8TLHofnXuKZXbAl47FpodJOO4JSpl7HRXJXMJ
         +/rlYQbidIrxxcwoTYyLkLrhkSV8oHElnP6HsE2Glhh7rzI+xTMbOytI9Dohs9l5SmIU
         hLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ED6WFt086qwoc3VqLhszguYRr+O7uIKQyWuBFcr8TI8=;
        b=pQepmc4rhhWafv+bTUrKYL3hpMfSXBKp+cibmFuqFLPSxpfHwguwJh35/DL/drWGd3
         m7OIXjffHTM1xZgbAsAhHVfNFbQed04nqRfU4YDJPJ7fw3YTRoR58d/VP0uIz6QDYJT4
         wOmSkTSe7nJQH1qWWl78VgwkJKVx7/MFBSLvUyqt2oz3GCz2CMNhNK8DNlp1EM1SG90H
         IiEdQ7neHVauYh88olI8l7go7eORY3DoVr3SZN8URqLRKqqd2wrKK7wrmUea3wNS3eX9
         AP+RGSE6hCi/bz6MOpgfuBU/N2H6Ph+42KCW//bp1q7psyqemnl0Q10QNd/wjJAhjAQP
         5tew==
X-Gm-Message-State: ANhLgQ0HAbZx8/RTZCo1UOyybNeduFdiOV7HBmooYu7znNXw7p48TcLu
        DnOZHT0mCqGN6HaOMzp5w7YC0kv6OEU=
X-Google-Smtp-Source: ADFU+vv1s58G+l1HN1LLbOMv93nhjvKoykoCAMXZdOapkcICSMYMXfez/AEJsWDFuL24a3hYgYByhw==
X-Received: by 2002:a17:90a:8915:: with SMTP id u21mr1225214pjn.87.1583972212220;
        Wed, 11 Mar 2020 17:16:52 -0700 (PDT)
Received: from ?IPv6:2605:e000:d445:6a00:a54b:c8f0:3b71:1a5b? ([2605:e000:d445:6a00:a54b:c8f0:3b71:1a5b])
        by smtp.gmail.com with ESMTPSA id 15sm46825477pfp.125.2020.03.11.17.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 17:16:51 -0700 (PDT)
Subject: Re: [PATCH 0/8] media: imx: Miscalleanous format-related cleanups
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <5b773016-8a71-9739-237d-69c0dc8bd349@gmail.com>
Date:   Wed, 11 Mar 2020 17:16:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

I agree that the find/enum format code in imx-utils needs cleanup, it's 
too confusing. I will be ready to give my ack to the imx-utils patches 
once I do some smoke testing on a sabre target when I return from vacation.

Note that Phillip also submitted a fixup patch to the find/enum format 
code, IIRC it did more consolidating of the imx_media_pixfmt tables. I 
can't find it and it has gotten lost, but I tested and provided a 
reviewed-by at the time.

Steve


On 3/10/20 9:18 AM, Laurent Pinchart wrote:
> Hello,
>
> This patch series started as an attempt to fix the format get and set
> subdev operations on the i.MX7 CSI-2 receiver subdev, which it does in
> patch 1/8. Patch 2/8 further cleans up the format-related code in that
> subdev.
>
> Patches 3/8 to 8/8 pushes the cleanups further as I was attempting to
> fix the format enumeration on the video node at the end of the pipeline.
> I realized as part of that effort that there's more work than I
> anticipated, and I'm currently evaluating the possible options.
> Nonetheless, I think the cleanups make sense even without what I wanted
> to build on top of them, so I'm sending them out already.
>
> Laurent Pinchart (8):
>    media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
>    media: imx: imx7-mipi-csis: Centralize initialization of pad formats
>    media: imx: utils: Inline init_mbus_colorimetry() in its caller
>    media: imx: utils: Handle Bayer format lookup through a selection flag
>    media: imx: utils: Simplify IPU format lookup and enumeration
>    media: imx: utils: Make imx_media_pixfmt handle variable number of
>      codes
>    media: imx: utils: Remove unneeded argument to (find|enum)_format()
>    media: imx: utils: Rename format lookup and enumeration functions
>
>   drivers/staging/media/imx/imx-ic-prp.c        |   8 +-
>   drivers/staging/media/imx/imx-ic-prpencvf.c   |   6 +-
>   drivers/staging/media/imx/imx-media-capture.c |  22 +-
>   .../staging/media/imx/imx-media-csc-scaler.c  |   2 +-
>   drivers/staging/media/imx/imx-media-csi.c     |  26 +-
>   drivers/staging/media/imx/imx-media-utils.c   | 313 ++++++++----------
>   drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
>   drivers/staging/media/imx/imx-media.h         |  24 +-
>   drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
>   drivers/staging/media/imx/imx7-mipi-csis.c    | 138 ++++----
>   10 files changed, 271 insertions(+), 289 deletions(-)
>

