Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608221D7341
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 10:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgERIsq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 04:48:46 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48577 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726040AbgERIsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 04:48:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id abRujsVlZtKAsabRyjKSAo; Mon, 18 May 2020 10:48:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589791723; bh=B5HJZW9KhF8IWZvanD4mNizPVuGhtFN3lNZTTzNLDWA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HWYLeEfrwewjErGv7M8JItymon6gTBDK4jQNRyR/RCfG5K7v8W1Aabq7Nz45npekl
         b0KWy73Any6jPSi45TBRxpTqcO4u9VQZiKdeaSuEj9x2WfiNkPBMQW2vW+6Di6Drcs
         AhUSiuKXjrJ3GjjbD8uAXvRmE1ACchmIdVfj+VQUnROxxSq3r9Faaz3++efgVeUloR
         7FZmXP1s/+fhTeOyu61UN+9bzFWw3yQ1KGBF0adEGK1XdVaQJryz+7BfzZS2brdPmg
         3PWwv1Uf9Sbn+W82HIA7mvjPh3SEUOAH3iI3qVABnd8HqoBSfvUWCnYv+qCnzdW9Z9
         KmQqjsq2xVqAQ==
Subject: Re: [PATCH v3 5/8] media: v4l2-subdev: Deprecate g_mbus_config video
 op
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20200514164540.507233-1-jacopo+renesas@jmondi.org>
 <20200514164540.507233-7-jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <343f94f4-e25d-5973-7f92-0cd1581f1b28@xs4all.nl>
Date:   Mon, 18 May 2020 10:48:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200514164540.507233-7-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEQ2lA+cGmMqv1mtaPqyHaXUQsJlSPhxpy7C9ynG/SxasByXCEaZzW01T9cz0td+xMUXxW0P8UuAItjUNkZaOvgaGm9jX5gPsSJpC5ogG9aAvBTX+QMf
 g9Nx/S8U2b3pGG8v9ouzKwE2JvPPPVXoZtYGBjiTM6q+9ZblpxSxCAZQXWhlN9sp1EwfZTeFeoQYLHm+D6cdv5htQdqapmV+ItPmUKvUf0fScoPp01FuBAAM
 JTgo6LkklHtWSmfANNV1lmS9Z2ZypN6CR7UJeTk4QtdgtZDuN+ui3Fd34hUP/2qp0J0ehJng5ZbXtXZtGNavv6xAFiLbNpLDMDML5t9nzF8Bqjy/FqYfqrLp
 2bQQSuRKBqwb9z/dIf9MkmNBXUpkRTasS6D5xSiE25riEGyvou/lW6wan3carFjdJF65KH/SxrTc83FqnM0EoyOQriSAt8Do+FkJAXhT1CzWet66m1YfkZwD
 DBOPAnXcwnTLNzTyejv6D6r45JGGilEQWXWvikd+jORaRpGm9th6FG6ipngi7HyRrNe6g5FzSpmm6L1InY8GHfyn4y2fzyjG3SBGKQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/05/2020 18:45, Jacopo Mondi wrote:
> Deprecate 'g_mbus_config' video operation in favor of the newly
> introduced 'get_mbus_config' pad operation.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 8d5f4a255b87..7c77092ae9b7 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -402,7 +402,9 @@ struct v4l2_mbus_frame_desc {
>   *
>   * @query_dv_timings: callback for VIDIOC_QUERY_DV_TIMINGS() ioctl handler code.
>   *
> - * @g_mbus_config: get supported mediabus configurations
> + * @g_mbus_config: get supported mediabus configurations. This operation is
> + *		   deprecated in favour of the get_mbus_config() pad operation
> + *		   and should not be used by new software.
>   *
>   * @s_mbus_config: set a certain mediabus configuration. This operation is added
>   *	for compatibility with soc-camera drivers and should not be used by new
> 

Why not just kill g/s_mbus_config? The soc_camera sensors that use it can just be marked
as BROKEN in the Kconfig.

I really don't want to keep deprecated stuff around in the kAPI unless absolutely
necessary.

This series looks good otherwise.

Regards,

	Hans
