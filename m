Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF2D3AC8B3
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 12:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233540AbhFRKYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 06:24:12 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:57241 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230329AbhFRKYB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 06:24:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uBd9lCbRQhqltuBdDl4lQQ; Fri, 18 Jun 2021 12:21:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624011707; bh=XZ6lmmj6mFLoYrteU10UHsdLg3t5r9MlCkdOEPx+iys=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FjT7K/AE+OKMKmnYv1NnQKSTg4Ldf1JkWQpy3F15ah9CkklmSdEg+Fm4d2aDF4tLn
         AA/IOYCo5liW8NoD53oEykSqyS9YAMjyZDzJVHGwdRfKowfk63QLfqnhnZ/IxyigX/
         4S3tOwR03TfaltdCsILDRj74eRVHcZD4iVCJLpIxqdNBLMBCw0tYLKaMiDIa7if9U5
         ktdWI88CXJm7sVSvVytDJsjz3SfD2jB54V5h0m4hWO44P0+NjzdPY/Kxh3PAtlqCgt
         wx5jXJT+ssI+LlP/fsC5yJ5HCESddpD//H+EDQsLxaKsZ+OxDx7Hfk2WUB1Iz0QSs1
         V9fVKrPQusViw==
Subject: Re: [RFC 0/4] media: Introduce post_register() subdev operation
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20210617171611.80542-1-jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c97229bf-84a0-f5ba-b5fc-a14b563c2684@xs4all.nl>
Date:   Fri, 18 Jun 2021 12:21:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210617171611.80542-1-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOomyovm5iMH+qP+/KMiqCpaGFX4qCTSWNK6QPIKvNkFYA6tyAP6Quby5K82EpeM3iqtVuXQcYVsZExYsFrILlQEKo3rdP4cw60mBOaq5fNRuA0C2bvL
 KpIz2ByMXKUVUBE0W9W/kuQSpRdVmCiNFDhd9fis7Dt8KPS8NY/d/TqnHWg7ZXBP6QX4ctZ1z13Oute/VSgSI38WYFJUWz1NXmJsCDYU0pNtzeYj3DUWjgA2
 63tJhVkiY+Hh+4AUt1rGNQOtEfaj38Tb3M45IG+8Xxxg0yAntP5tis4vihSHKf9E
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/06/2021 19:16, Jacopo Mondi wrote:
> Hello Hans,
>    this is the result of the discussion we had yesterday, sent out just to
> have a taste of how it looks like.
> 
> I won't pretend I like the outcome: it feels a bit hackish and meant to support
> this precise use case.
> 
> Compared to the proposal to resurect 'init()' it indeed has the advantage that
> the subdevice driver works in both deffered and non-deferred mode, but the
> notifier flags seems really custom.
> 
> Also, being the new flag part of the notifier it won't be available for i2c
> subdevs.
> 
> What do you think ? Does the result match your understanding ?

That's what I came up with, yes. I think some of the names can be improved,
but otherwise the mechanism is what I had in mind.

Regards,

	Hans

> 
> Thanks
>   j
> 
> Jacopo Mondi (4):
>   media: v4l2-subdev: Introduce post_register() core op
>   media: v4l2-async: Add notifier flags
>   media: v4l2-async: Call post_register() subdev op
>   media: i2c: gmsl: Defer camera intialization
> 
>  drivers/media/i2c/max9286.c          | 21 ++++++--
>  drivers/media/i2c/rdacm20.c          | 81 ++++++++++++++++------------
>  drivers/media/v4l2-core/v4l2-async.c | 11 ++++
>  include/media/v4l2-async.h           | 10 ++++
>  include/media/v4l2-subdev.h          |  3 ++
>  5 files changed, 89 insertions(+), 37 deletions(-)
> 
> --
> 2.31.1
> 

