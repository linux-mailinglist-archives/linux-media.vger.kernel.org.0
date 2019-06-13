Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18853445B2
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730323AbfFMQpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:45:54 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47215 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730319AbfFMFoV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 01:44:21 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id bIX1hL32N5qKabIX4hDxVJ; Thu, 13 Jun 2019 07:44:19 +0200
Subject: Re: [PATCH 0/2] Use Media Dev Allocator to fix vimc dev lifetime bugs
To:     helen.koike@collabora.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1558667245.git.skhan@linuxfoundation.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c9160fe7-e880-4070-3959-b9e9177acf54@xs4all.nl>
Date:   Thu, 13 Jun 2019 07:44:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cover.1558667245.git.skhan@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDwxpIXPhJN75Jw4Kp1rhsRbTfMtOhFu8gNd1BX+22wfx+C4LbiSCZR9QW2IynSwuVRELuLWlzdy123Z9GqnH8K5Ut/QIsYFRlAz8e0zn4l6PAyDEFF/
 8e5YMZHzequKkwwJdLY6CDvGb6f67csd4nqD0iAmn5DG+zJOYvS2GJhtfMdwRNhsusrA9doOHJSgntKDjUYCKH3PYUxKW3v7DiivRZS2/2y5kkIK/M9krJ3w
 nAjQl97buif4pFG7oZdhdmwC0o4QazU2MJ2AM5aYGV0Ex+YrIZPXv2BRycaklV+EvDc/9SX4cMhE95rGSGmURw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/24/19 5:31 AM, Shuah Khan wrote:
> media_device is embedded in struct vimc_device and when vimc is removed
> vimc_device and the embedded media_device goes with it, while the active
> stream and vimc_capture continue to access it.
> 
> Fix the media_device lifetime problem by changing vimc to create shared
> media_device using Media Device Allocator API and vimc_capture getting
> a reference to vimc module. With this change, vimc module can be removed
> only when the references are gone. vimc can be removed after vimc_capture
> is removed.
> 
> Media Device Allocator API supports just USB devices. Enhance it
> adding a genetic device allocate interface to support other media
> drivers.
> 
> The new interface takes pointer to struct device instead and creates
> media device. This interface allows a group of drivers that have a
> common root device to share media device resource and ensure media
> device doesn't get deleted as long as one of the drivers holds its
> reference.
> 
> The new interface has been tested with vimc component driver to fix
> panics when vimc module is removed while streaming is in progress.

Helen, can you review this series? I'm not sure this is the right approach
for a driver like vimc, and even if it is, then it is odd that vimc-capture
is the only vimc module that's handled here.

My gut feeling is that this should be handled inside vimc directly and not
using the media-dev-allocator.

Regards,

	Hans

> 
> Shuah Khan (2):
>   media: add generic device allocate interface to media-dev-allocator
>   vimc: fix BUG: unable to handle kernel NULL pointer dereference
> 
>  drivers/media/Makefile                     |  4 +-
>  drivers/media/media-dev-allocator.c        | 39 ++++++++++++++
>  drivers/media/platform/vimc/vimc-capture.c | 17 +++++-
>  drivers/media/platform/vimc/vimc-core.c    | 60 ++++++++++++----------
>  include/media/media-dev-allocator.h        | 46 ++++++++++++++---
>  5 files changed, 130 insertions(+), 36 deletions(-)
> 

