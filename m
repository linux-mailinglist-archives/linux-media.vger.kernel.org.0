Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47DD243DCEC
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 10:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhJ1I3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 04:29:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41322 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1I3g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 04:29:36 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0D0A276;
        Thu, 28 Oct 2021 10:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635409628;
        bh=Mw5k7uCXCBesHKijGS3bvBqAuKgbwyTS+hcscIeV9CE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Z9mXLBqGvv7EmKPEDxPsrwu0NJo5Un7zg+vHCfSLtN4eG9hftKFkl/8jwBiiDfh/8
         pDjBjY1a0NcV8rvyTJOEvmT7Lfsvp2SM4naRVdnR2kRRYzY59Lf26Wa3wsK9ilY/nm
         YLBHf/a6epMmR/WPlg9UKsjhD3FLPFMiPidd5zoI=
Subject: Re: [PATCH v2 06/13] media: subdev: Add for_each_active_route() macro
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-7-jacopo+renesas@jmondi.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <04b63dbf-28ee-23d4-5d75-a33729e9f332@ideasonboard.com>
Date:   Thu, 28 Oct 2021 11:27:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211017182449.64192-7-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 17/10/2021 21:24, Jacopo Mondi wrote:
> Add a for_each_active_route() macro to replace the repeated pattern
> of iterating on the active routes of a routing table.
> 
> Replace the existing occurrences of such pattern in the codebase.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>   drivers/media/i2c/ds90ub913.c             |  8 ++------
>   drivers/media/i2c/ds90ub953.c             |  7 ++-----
>   drivers/media/i2c/ds90ub960.c             |  8 ++------
>   drivers/media/i2c/max9286.c               | 10 ++--------
>   drivers/media/platform/ti-vpe/cal-video.c |  9 ++-------
>   drivers/media/v4l2-core/v4l2-subdev.c     | 18 ++++++++++++++++++
>   include/media/v4l2-subdev.h               | 11 +++++++++++
>   7 files changed, 39 insertions(+), 32 deletions(-)

I'll pick this one to my branch, if you don't mind.

  Tomi
