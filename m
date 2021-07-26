Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA3A3D5A56
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 15:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbhGZMtF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 08:49:05 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:52099 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233194AbhGZMtE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 08:49:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 80fhmvzPsXTlc80fjmKQRB; Mon, 26 Jul 2021 15:29:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627306171; bh=h/Xw2UcbRVWSLNqmSQVbzgcQMICMQ0w2HVQpEQVBjAY=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cYaKQNDEX01W7/+fQMK2vZTZH5z05iICOUSGekcUSBYXVToc6zP2PFmnYMZGev6NS
         LFMIatTiS+JuieCvr/shtPDIVQh1tHMQj4iSGg7UGCO+UF7NhT48MpVyQ8DWvnE8Uv
         4PmAVAmwOhOHBnWr7RGyTkm8hSCL/twtBOGcxCtIRKR2MD9Wf1ul5oWje5wFd8+jIU
         MRtG2sKpV7VpKrbBH1tsLldYiVbnAFv2n9Hd1cHO0DtMnoYrsLDweZ1y3bKKpaDDyX
         kkly90msqkX4keZYqvh6ykGZ6YbbOpJvXPUYon64sAaULmBfcwVU/Pmif5oH9NjmTk
         yyXz1BIlvPDMg==
Subject: Re: [GIT PULL FOR v5.15] rcar-vim/isp: add r8a779a0 support
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <a10d5622-62f2-57aa-6031-e937470dd83b@xs4all.nl>
Message-ID: <10c22c19-62f4-9d29-e3af-331fefbcd3f1@xs4all.nl>
Date:   Mon, 26 Jul 2021 15:29:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a10d5622-62f2-57aa-6031-e937470dd83b@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFC3xirWnDjIYzv/zsTqx58ywLtxYYElrd1lUCXohW3pyOIJ3sraxTPw067Diveg+tu07tI9Rm6hEH3Ypmi7tAFUMM0D1u57xxMqgZCAgnIJMh3jaTNW
 09oy9Qoei4v8IPdLPOoJJGBVYErE7LXfJ1T8L85D8DWBTJ19rtJC9gYu7BAtI423W45R8dnW3xQVLGqe2J1LfzXUz3yrZSNLHZLowtfeByK7W2UGLEUUm42D
 oCLUBQoBC3KUn0QqKg4EiXbI0PJxu7Ya3SiMyNlob1ZrqhOEduCWEMCfGU47tRwrGSPqYt5MNjdrjLeAm5v1lCBRBsduiOEE7HQ/5zsrAjx66BEn/ipxcaz+
 rCCRuAH1ogPIwnb25W/ZobOiyOxR6AQNaaujvtpZsijfOGwaMlA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This PR has been dropped as requested by Sakari since it conflicts with a pending
PR with async notifier renames.

Sakari will pick up the rebased patches.

Regards,

	Hans

On 22/07/2021 10:11, Hans Verkuil wrote:
> The following changes since commit 379e205dab9d7f9761984728e7d6f5f8305cc424:
> 
>   media: usb: dvb-usb-v2: af9035: let subdrv autoselect enable si2168 and si2157 (2021-07-12 14:28:49 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15c
> 
> for you to fetch changes up to 325f8c6441a46b549fce94b494c860bc730f4847:
> 
>   media: rcar-isp: Add Renesas R-Car Image Signal Processor driver (2021-07-22 10:00:30 +0200)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Niklas Söderlund (12):
>       rcar-vin: Refactor controls creation for video device
>       rcar-vin: Fix error paths for rvin_mc_init()
>       rcar-vin: Improve async notifier cleanup paths
>       rcar-vin: Improve reuse of parallel notifier
>       rcar-vin: Rename array storing subdevice information
>       rcar-vin: Move group async notifier
>       rcar-vin: Extend group notifier DT parser to work with any port
>       rcar-vin: Create a callback to setup media links
>       rcar-vin: Specify media device ops at group creation time
>       rcar-vin: Move and rename CSI-2 link notifications
>       rcar-vin: Add r8a779a0 support
>       media: rcar-isp: Add Renesas R-Car Image Signal Processor driver
> 
>  MAINTAINERS                                 |    1 +
>  drivers/media/platform/Kconfig              |   16 +
>  drivers/media/platform/Makefile             |    1 +
>  drivers/media/platform/rcar-isp.c           |  505 ++++++++++++++++++++++++++++
>  drivers/media/platform/rcar-vin/rcar-core.c | 1059 +++++++++++++++++++++++++++++++++-------------------------
>  drivers/media/platform/rcar-vin/rcar-dma.c  |   22 +-
>  drivers/media/platform/rcar-vin/rcar-vin.h  |   25 +-
>  7 files changed, 1151 insertions(+), 478 deletions(-)
>  create mode 100644 drivers/media/platform/rcar-isp.c
> 

