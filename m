Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A84C19C63
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 13:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbfEJLSH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 07:18:07 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:60451 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727052AbfEJLSH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 07:18:07 -0400
Received: from [IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215] ([IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215])
        by smtp-cloud9.xs4all.net with ESMTPA
        id P3XPhdN8xsDWyP3XQhc7iO; Fri, 10 May 2019 13:18:04 +0200
Subject: Re: [PATCH v4 0/8] Switch to sync registration for IPU subdevs
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org
References: <20190503224326.21039-1-slongerbeam@gmail.com>
 <m3ftpr5lne.fsf@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ad321dec-4352-205e-3c04-e13865a279d5@xs4all.nl>
Date:   Fri, 10 May 2019 13:18:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <m3ftpr5lne.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFtCTxdRGndZ7QMeZk84e7dHMFo9Ki2rWHImDrtvHvou/uI5JyY7vxlGwaWRmSFepjD+8L25hiX4wTlJeXDsausuM6GWmLsO5VnSCFEzh06fQuLQmTHc
 r7e2aB9+/v/Ub+MZvxWLI9PFJKnzGUBaZJFlnlJ8fH1AE7KylPHJahkoPKbYXEITcHD9rM7/+TmLO6sdBATxv0qO8z6rJT5WSGq6MJwTa1ImYRxNuzjOOg9B
 UuoE1Wm6Lp199pW21kZ5Jt3G2CO/MQNQnsotf7BW0kaUwN4SENoN+etJUpxbhmw8YMsUse8os7NG7EHLnBiEZ6NdDho5pNLyzZu4EDc6i8o=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/6/19 11:16 PM, Rui Miguel Silva wrote:
> Hi Steve,
> On Fri 03 May 2019 at 23:43, Steve Longerbeam wrote:
>> Switch to sync registration for the IPU internal sub-devices, re-organize
>> modules, and a few other miscellaneous cleanups.
> 
> Thanks for the series and the fixes. Now everything works as
> before. So, for the all series and related to imx7:
> 
> Tested-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
> 
> My only concern is that Hans already pull requested to v5.2 [0] my
> previous patch that your series do not apply on top of.
> 
> So, @Hans will you push this series to v5.2 and add a revert
> of [1]? or this will go only to v5.3?

This will only go to v5.3.

I believe that Mauro plans to get [0] into 5.2, probably as a pull request
once v5.2-rc1 has been released. So once that is merged Steve probably needs
to do a rebase of this series.

Regards,

	Hans

> 
> ---
> Cheers,
> 	Rui
> 
> 
> [0]: https://lore.kernel.org/linux-media/d5b4a68d-520e-0e93-d44e-07974058d690@xs4all.nl/
> [1]: https://lore.kernel.org/linux-media/20190412164400.1270-1-rui.silva@linaro.org/
> 
> 
>>
>> History:
>> v4:
>> - Add **cc arg to __capture_try_fmt_vid_cap() to validate colorspace,
>>   instead of calling ipu_pixelformat_to_colorspace().
>> - Add error message if capture format validation failed.
>> v3:
>> - A couple patches did not compile/link. All patches now build so the
>>   series is fully bisectable. No functional changes.
>> v2:
>> - Added a patch that improves the pipeline upstream/downstream search
>>   functions, which no longer require the media device.
>> - Add a patch to remove getting media device from v4l2_dev driver data.
>>
>>
>> Steve Longerbeam (8):
>>   media: staging/imx: Switch to sync registration for IPU subdevs
>>   media: staging/imx: Pass device to alloc/free_dma_buf
>>   media: staging/imx: Move add_video_device into capture_device_register
>>   Revert "media: imx: Set capture compose rectangle in
>>     capture_device_set_format"
>>   media: staging/imx: Remove capture_device_set_format
>>   media: staging/imx: Re-organize modules
>>   media: staging/imx: Improve pipeline searching
>>   media: staging/imx: Don't set driver data for v4l2_dev
>>
>>  drivers/staging/media/imx/Makefile            |  18 +-
>>  drivers/staging/media/imx/imx-ic-common.c     |  68 +--
>>  drivers/staging/media/imx/imx-ic-prp.c        |  36 +-
>>  drivers/staging/media/imx/imx-ic-prpencvf.c   |  88 ++--
>>  drivers/staging/media/imx/imx-ic.h            |   6 +-
>>  drivers/staging/media/imx/imx-media-capture.c |  90 ++--
>>  drivers/staging/media/imx/imx-media-csi.c     |  45 +-
>>  .../staging/media/imx/imx-media-dev-common.c  | 346 +++++++++++++-
>>  drivers/staging/media/imx/imx-media-dev.c     | 449 +-----------------
>>  drivers/staging/media/imx/imx-media-fim.c     |   9 -
>>  .../staging/media/imx/imx-media-internal-sd.c | 357 ++++++--------
>>  drivers/staging/media/imx/imx-media-of.c      |  41 +-
>>  drivers/staging/media/imx/imx-media-utils.c   | 170 +++----
>>  drivers/staging/media/imx/imx-media-vdic.c    |  84 +---
>>  drivers/staging/media/imx/imx-media.h         | 113 +++--
>>  drivers/staging/media/imx/imx7-media-csi.c    |  43 +-
>>  16 files changed, 857 insertions(+), 1106 deletions(-)
> 

