Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6365193012
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 19:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgCYSKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 14:10:00 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46113 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgCYSKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 14:10:00 -0400
Received: by mail-pf1-f195.google.com with SMTP id q3so1411697pff.13
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kHhtZb9BdOMmIM9dI5kq3Pvqrt9Ka9bZcdFJXR+4aR8=;
        b=d2WplmfLACUicAh1J03oOjeDAwM8J48IOz0IOm72ed9/NZ+leRqvN7LbI470/sijTO
         HAnHks3iIgVjYe7Qk58s/jIY8c+w0QlmDtYrJl/9JUzrAxLtGaky2kuy8v61V9Eax6Ue
         sY1OmKUSgoMCkLWkTeZoKPliCbSZGNKvZY9bmZh18AG/X2WjB2G8SKb/GP4R9d3oMf2c
         NgcSpRXhaNLEnunbUDxUkGBYtvUrKKo4krZNs8zt7qGGBor9I/Eyt/X6bAQjb/lnsqb/
         bgGgmVX2IFdsnaYacY3oOwSCZfXhTJKr2av7NEYMPkLRBmLLab8FRHmmk8Js7IJzfxQ9
         tp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kHhtZb9BdOMmIM9dI5kq3Pvqrt9Ka9bZcdFJXR+4aR8=;
        b=sAgSx0dRQQ5PkoyZpqCYnMiUR0zigvb9SP+5YOa6bKHQlfbcqsh+ifQwAjAy5/lI8/
         8ljfwAxEL8JJcWqdhJWgEFtZjxywQJqTz+EpGVxHFbbdUeCzjE67s7qROde7UNuomOan
         8nZ01O7wTcNztQTvwWbBTw1yyPuK6pdB7bXgueGzv8KKuE/tDxEBzABYp9IVI3QAIZoj
         yfys2JUtC6CvNesDNOAfURJlCPSfdtdhF1+cikf4hzbRHCJ5i97j8/t98Vc2lm9h39tu
         GgcgpEGJR61u/NxS1xlhy8SPzBaIN9ss1f/6P6GPEYMM6T3A1zroTWtz9JzO9ycJPKSr
         GHfg==
X-Gm-Message-State: ANhLgQ1SqNhkMw4dOwYZFS1XxzvTOFIc0Dx3AEIMg611Tw57LWt2HB6c
        ifevFsSpOkXNwWJgqDhabeU=
X-Google-Smtp-Source: ADFU+vtTJPsInKcm/78S4PZAreU02DbGKJ5tJ48wIHk8fGS/waftci1/fzv8+5uwlGgDRoscaSvz7w==
X-Received: by 2002:aa7:8f03:: with SMTP id x3mr4831642pfr.40.1585159799144;
        Wed, 25 Mar 2020 11:09:59 -0700 (PDT)
Received: from [192.168.2.82] (104-10-251-90.lightspeed.sntcca.sbcglobal.net. [104.10.251.90])
        by smtp.gmail.com with ESMTPSA id y18sm18243520pfe.19.2020.03.25.11.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 11:09:58 -0700 (PDT)
Subject: Re: [PATCH v4 00/17] media: imx: Create media links in bound
 notifiers
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <2ed0b76d-a1b1-ba5d-4ac1-a6e7c28d3838@gmail.com>
Date:   Wed, 25 Mar 2020 11:09:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

When you have time can you review this series.

TIA!

Steve

On 3/3/20 3:42 PM, Steve Longerbeam wrote:
> Move media link creation into the notifier bound callbacks in the
> minimum set of subdevices required by imx (imx5/6/7 CSI,
> imx6/7 MIPI CSI-2, and video mux).
>
> History:
>
> v4:
> - Removed the endpoint parsing callback APIs from video-mux and imx drivers
>    as suggested by Sakari, replacing with endpoint parsing local to the
>    drivers and the use of v4l2_async_notifier_add_fwnode_remote_subdev().
>    As a result convenience function v4l2_async_register_fwnode_subdev()
>    is no longer used and is reverted.
>
> v3:
> - The changes to the default behaviour in media_entity_get_fwnode_pad(),
>    and the fixes to current media drivers that call it inconsistently, have
>    been put-off to another time. Instead this version implements the
>    get_fwnode_pad operation where required in the imx and video-mux
>    subdevices to make media link creation work correctly. The
>    improvements to media_entity_get_fwnode_pad() can wait to another
>    patch series.
>
> v2:
> - rename/move the notifier-to-state inlines in imx7-mipi-csis.c and
>    imx7-media-csi.c, suggested by Rui Silva.
> - rewrite imx_media_create_links() to only add the missing media links
>    from the imx6 MIPI CSI-2 receiver.
>
>
> Steve Longerbeam (17):
>    media: entity: Pass entity to get_fwnode_pad operation
>    media: video-mux: Parse information from firmware without using
>      callbacks
>    media: imx: Parse information from firmware without using callbacks
>    Revert "media: v4l2-fwnode: Add a convenience function for registering
>      subdevs with notifiers"
>    media: imx: csi: Implement get_fwnode_pad op
>    media: imx: mipi csi-2: Implement get_fwnode_pad op
>    media: video-mux: Implement get_fwnode_pad op
>    media: imx: Add imx_media_create_fwnode_pad_link()
>    media: video-mux: Create media links in bound notifier
>    media: imx: mipi csi-2: Create media links in bound notifier
>    media: imx7: mipi csis: Create media links in bound notifier
>    media: imx7: csi: Create media links in bound notifier
>    media: imx: csi: Create media links in bound notifier
>    media: imx: csi: Lookup upstream endpoint with
>      imx_media_get_pad_fwnode
>    media: imx: Create missing links from CSI-2 receiver
>    media: imx: silence a couple debug messages
>    media: imx: TODO: Remove media link creation todos
>
>   drivers/media/mc/mc-entity.c                  |   2 +-
>   drivers/media/platform/video-mux.c            | 185 ++++++++++++++++--
>   drivers/media/v4l2-core/v4l2-fwnode.c         |  62 ------
>   drivers/staging/media/imx/TODO                |  29 ---
>   drivers/staging/media/imx/imx-media-csi.c     | 136 ++++++++-----
>   .../staging/media/imx/imx-media-dev-common.c  |  50 ++---
>   drivers/staging/media/imx/imx-media-dev.c     |   2 +-
>   .../staging/media/imx/imx-media-internal-sd.c |   6 +-
>   drivers/staging/media/imx/imx-media-of.c      | 114 -----------
>   drivers/staging/media/imx/imx-media-utils.c   | 124 ++++++++++++
>   drivers/staging/media/imx/imx-media.h         |   9 +-
>   drivers/staging/media/imx/imx6-mipi-csi2.c    | 119 +++++++++--
>   drivers/staging/media/imx/imx7-media-csi.c    | 100 +++++++---
>   drivers/staging/media/imx/imx7-mipi-csis.c    | 105 +++++++---
>   include/media/media-entity.h                  |   3 +-
>   include/media/v4l2-fwnode.h                   |  38 ----
>   16 files changed, 654 insertions(+), 430 deletions(-)
>

