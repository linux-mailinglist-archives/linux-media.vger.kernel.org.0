Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24656748B9
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 10:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388988AbfGYIEo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 04:04:44 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57013 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387586AbfGYIEo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 04:04:44 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qYjuhCFwXLqASqYjyhSAIU; Thu, 25 Jul 2019 10:04:42 +0200
Subject: Re: [PATCH 2/2] Revert "media: vimc: propagate pixel format in the
 stream"
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel@collabora.com,
        skhan@linuxfoundation.org
References: <e144e6f5aae4e3d932e464fbf741d7cbaaf55980.1562701396.git.helen.koike@collabora.com>
 <8450c879beff8c86dde7333f1f2d688eef380de4.1562701396.git.helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <47703594-f336-3006-5ae0-7b459e48110f@xs4all.nl>
Date:   Thu, 25 Jul 2019 10:04:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8450c879beff8c86dde7333f1f2d688eef380de4.1562701396.git.helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF3+WuifdXyrzyLYdY3HGxRMUEXbkZCsnBqP3qn+DVu8FhP+gz5yphjZIyz/RMALPeO6z0qj7bpwMp/p1kjQSnaHYh7vpWZmrNJRSa/HoBBt0iSwUoAJ
 LItKK9F+uUfy3Vn7JVwc5aesNrZBGMacwTQfNgL6b5GzBHiLbg9KL/ecc1cZ28WUr9++ZQQyMTtOaTUTNLksnCZz90QtnfKAgM/F+wlibGQfU+rMqNk+3AFU
 lPTp2g7oSbqUqYvPe3ycnl67YCsRXOmBgAn43ZVRxdprGY05uMOR11dbkRg31ysS6SSRlB27d3/MSzJi7TmO2bK9wELo8+87IEihAR4MtqM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On 7/9/19 9:43 PM, Helen Koike wrote:
> This reverts commit b6c61a6c37317efd7327199bfe24770af3d7e799.
> 
> The requested pixelformat is being propagated from the capture to the
> tpg in the sensor.
> 
> This was a bad design choice, as we start having the following issues:
> 
> * We set a pixelformat in the capture;
> * We set matching media bus formats in the subdevices pads;
> * Link validate looks fine (sizes matches, media bus formats matches);
> * Issue: if some of the subdevice doesn't know how to generate the
> requested pixelformat in the capture, then stream_on fails. This is bad
> because capture says it supports that pixelformat, everything looks
> fine, but it is not, and there is no way to find it out through the
> links.
> 
> This patch was implemented so we could request any pixelformat from the
> pipeline regardeless of the media bus format configured between pads.
> Not all pixelformat can be mapped into a media bus code (e.g.
> multiplanar formats), so with this patch we could request those
> pixelformats from the tpg.
> 
> Solution: map pixelformats to media bus codes as before, and implement
> conversions to other pixelformats in the capture to support multiplanar.
> 
> So first step to this solution is to revert this patch.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
>  drivers/media/platform/vimc/vimc-capture.c  |  76 ++---
>  drivers/media/platform/vimc/vimc-common.c   | 309 ++++++++++++--------
>  drivers/media/platform/vimc/vimc-common.h   |  58 ++--
>  drivers/media/platform/vimc/vimc-debayer.c  |  83 ++----
>  drivers/media/platform/vimc/vimc-scaler.c   |  63 ++--
>  drivers/media/platform/vimc/vimc-sensor.c   |  51 +++-
>  drivers/media/platform/vimc/vimc-streamer.c |   2 -
>  drivers/media/platform/vimc/vimc-streamer.h |   6 -
>  8 files changed, 342 insertions(+), 306 deletions(-)
> 

Unfortunately this patch no longer applies.

Can you respin this series?

Also, should this be backported to 5.3 as well?

Regards,

	Hans
