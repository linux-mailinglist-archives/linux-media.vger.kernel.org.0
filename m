Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC370368F32
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 11:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhDWJJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 05:09:50 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:44249 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229456AbhDWJJu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 05:09:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZroClzuR6vTEDZroFlcj4K; Fri, 23 Apr 2021 11:09:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619168952; bh=x7ozyh8hBJlw/CZeD3L7ZTwGiLAUQCebajl7PyHbRo4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MmD07osS3QZbgeS68ODZUGbZWrDNrIoLF669aPAPIJiGuPPFTFy53GLDUMhNjdiwx
         pS31ly+/jPVC3rjGE71zhrWLnx6RTtHFikvhdP64/dj/XRFiC9gn+AdqBgFEC2y3og
         6Ve1YgRmp6XATK4Vt35DmeordE46pyqQgdWQzUBWjbsmfgQwu7jwTX4nWRfSIVR7DJ
         yZ+KZXLEm/fTxJaLMgiUayD4TcA+Ex4XuItqTcpms+gaP2GFXeyNVi00RvzFdm49HN
         gxl+Ip3JFPh5dk+ESSRiSgb8tePfdQjqftsN4tIJygypLV2tUsoHxeQ0LjIhqz2iQq
         nmd7LkY9Uta5A==
Subject: Re: [PATCH v3 0/6] staging: media: atomisp: code cleanup fixes
To:     Deepak R Varma <drv@mailo.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
References: <cover.1619022192.git.drv@mailo.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <449f49fa-f19b-70bc-5ee9-3187ac43a376@xs4all.nl>
Date:   Fri, 23 Apr 2021 11:09:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1619022192.git.drv@mailo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHNySfGwsTTOcRms+3SBdITadTlRgErLy0mQDD6ZG/F4PHxVt8zWdXknP61qZtztPHWTQhZPQKrdZ/hO3m7RYdXefQEPtn/6kAPUY8+Xi5hOyOg12dBZ
 TkRRkbDB8wkv6R+YhikXU8wjbabOLJDX4DORS5GWk0CAD4D+kFMlwqWPcWg0+AaCKw3enQaODkNOg8wKa5igBvYrQ1aLZwl4YrQMLqPqfSJ+3YR6nthmutHx
 8MGdB/4UYGLmB7dq/AUvL2BcdYtk4AgeGbSdVKLHxXnV4u12UWvKEE+oabt16fvBOYbaBMjlciY5sCG0nq+edihxWPUS4YdOhQoro0k6uZic+ifdRvsmtXCR
 RP060o+/NknC4EWjyJKqpW2wRslr2el57h1WrIESMB1qdF9pTpH89x07LXcTMa4gaiibvLQo2zBbSqIMXMP2ZodDGPS9qA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deepak,

Something weird is going on. This series didn't appear in patchwork
(https://patchwork.linuxtv.org/) and looking at lore.kernel.org:

https://lore.kernel.org/linux-media/20210421181101.JySzrynV5EUsi4N5Dh97QA9VUOQjMutu0mNTW7capUw@z/T/#r4d9987c800c28c26c96464bb56916bf0408b4738

it appears v3 was seen as replied to the v1 posts instead of a new thread.

It's probably related to the Message-Id field, which is the same for the
v1 and v3 posts. Not really sure how you managed that :-)

Please repost so that the v3 series is picked up by patchwork.

Regards,

	Hans

On 21/04/2021 20:11, Deepak R Varma wrote:
> This patch set addresses different kinds of checkpatch WARNING and
> CHECK complaints.
> 
> Note: The patches should be applied in the ascending order.
> 
> Changes since v2:
>    Generic change:
>    1. Correct patch versioning in patch subject
> 
>    Patch Specific change:
>    1. patch 1/6 : none
>    2. patch 2/6 : none
>    3. patch 3/6 : none
>    4. patch 4/6 :
>         a. Tag Fabio Auito for the patch suggestion
> 
>    5. patch 5/6 : none
>    6. patch 6/6:
>         a. Tag Fabio Auito for the patch suggestion
> 
> Changes since v1:
>    Generic change:
>    1. The patch set is being resent from an email account that matches with
>       the patch signed-of-by tag. Issue highlighted by Hans Verkuil.
> 
>    Patch specific changes:
>    1. patch 1/6 : none
>    2. patch 2/6 : none
>    3. patch 3/6 : none
>    4. patch 4/6 : implement following changes suggested by Fabio Aiuto
>         a. Corrected commenting style
>         b. Similar style implemented for other comment blocks in
>            the same files.
>    5. patch 5/6 : none
>    6. patch 6/6: implement following changes suggested by Fabio Aiuto
>         a. use dev_info instead of pr_info
>         b. update patch log message accordingly
> 
> 
> Deepak R Varma (6):
>   staging: media: atomisp: improve function argument alignment
>   staging: media: atomisp: balance braces around if...else block
>   staging: media: atomisp: use __func__ over function names
>   staging: media: atomisp: reformat code comment blocks
>   staging: media: atomisp: fix CamelCase variable naming
>   staging: media: atomisp: replace raw printk() by dev_info()
> 
>  .../media/atomisp/i2c/atomisp-gc0310.c        |  14 +--
>  .../media/atomisp/i2c/atomisp-gc2235.c        |  29 ++---
>  .../atomisp/i2c/atomisp-libmsrlisthelper.c    |   6 +-
>  .../media/atomisp/i2c/atomisp-lm3554.c        |   2 +-
>  .../media/atomisp/i2c/atomisp-mt9m114.c       | 106 ++++++++++--------
>  .../media/atomisp/i2c/atomisp-ov2680.c        |  43 ++++---
>  .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
>  7 files changed, 116 insertions(+), 94 deletions(-)
> 

