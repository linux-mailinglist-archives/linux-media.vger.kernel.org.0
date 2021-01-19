Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3EF2FC0CE
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbhASUUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:20:11 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33890 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728847AbhASSzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 13:55:00 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 99D6B1F45457
Subject: Re: [PATCH v2 11/14] media: v4l2-async: Fix incorrect comment
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20210118015258.3993-1-ezequiel@collabora.com>
 <20210118015258.3993-12-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <530ac7f8-e065-123c-c7e0-70afeb313e5a@collabora.com>
Date:   Tue, 19 Jan 2021 15:54:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118015258.3993-12-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On 1/17/21 10:52 PM, Ezequiel Garcia wrote:
> The v4l2_async_notifier_cleanup() documentation mentions
> v4l2_fwnode_reference_parse_sensor_common, which was actually
> introduced as v4l2_async_notifier_parse_fwnode_sensor_common(),
> in commit 7a9ec808ad46 ("media: v4l: fwnode: Add convenience function for
> parsing common external refs").
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>> ---
>  include/media/v4l2-async.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 55bfb27e404e..2144502c95e0 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -242,7 +242,7 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
>   * notifier after calling
>   * @v4l2_async_notifier_add_subdev,
>   * @v4l2_async_notifier_parse_fwnode_endpoints or
> - * @v4l2_fwnode_reference_parse_sensor_common.
> + * @v4l2_async_notifier_parse_fwnode_sensor_common.

I see that this function is only used in the framework by v4l2_async_register_subdev_sensor_common()

Shouldn't we change v4l2_async_notifier_parse_fwnode_sensor_common() to static
and remove it from this comment?

Regards,
Helen

>   *
>   * There is no harm from calling v4l2_async_notifier_cleanup in other
>   * cases as long as its memory has been zeroed after it has been
> 
