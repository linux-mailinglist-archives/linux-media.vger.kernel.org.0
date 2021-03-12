Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6F6338660
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 08:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhCLHIg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 02:08:36 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49339 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231812AbhCLHIJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 02:08:09 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Kbu0lxvqQ4ywlKbu3l2GxO; Fri, 12 Mar 2021 08:08:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615532887; bh=wZPYXDM2boO8aRuyJ0FpdvOA3YAYbHrMxdFXVyXaTls=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dhM8JSMY4zhZPhiwiyF8G83FL2BgQJ7n5oqT/fI8D6g1ZrrYLYsG/UZd6bOBc6AWP
         0+dzFr/osssglvvRTPeiQd7BsUDSEtQ+E2ZNG5yNWh61SAcOLv744NTiz24Rus6rE5
         zoJyqPOwto7Z6eIn5EI2t/c8yzhM80/TfRJglhIC/cJxwaB2aaD0KpKAjfIRhyE62W
         ZoZFIJDsmBF2miJyoASmgovHwjBPQ4I+812x6Um2PdvpDaDQu2zMei7gjeoIUUoPYw
         4LcSZnuGutEVy62iiUw3s79gF2HtCVWU/cDc5u/ueyiOJM47W7/rmphSghCJx58BQb
         Mp03ZGCV9EBtw==
Subject: Re: [PATCH v2 3/6] media: uvcvideo: Return -EIO for control errors
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-4-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a0311f5a-f6c8-fc32-2acf-ddb1c62ae508@xs4all.nl>
Date:   Fri, 12 Mar 2021 08:08:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311221946.1319924-4-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAo9vrAk0jv3FcMRcZBqzci6gCB+o0GP2cHif53Pk8Ff9eT3cpSLBcNTqDKGTwDzHc4lwjqOSMlZeeK9TGpcbeId264VSJGNApsb1WpTbSjlYa2vcwcJ
 +SGoLUlalm2XmF4NMNE+bFUb3U5Kpk+hZu/ydUGKlEDdOQ4LlClgDrFzUhz28DBeF7kQtrHYkm9haDMeb2H5zZMQ8m5BOYzTx1Wvc7OOVG43WktyjKxpz4Qx
 OfaK7ZgBhKHOCWXM3XNrBxSvwSm1p7pmEHfDcSNk10eyf2MqUnN3SEmeDpoQ7pjSsRiITHL6K+NcyBrvhs/d698uzRNJk8rZl84PKfVZk4JrwPp9BBnXSwnU
 WVfHIBY0f6N+ksQR3LNLY0MBPpqxAomLkPfetHZ99WG4BrwE5p0WKEWu5QNkbZikDEO5cim9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2021 23:19, Ricardo Ribalda wrote:
> The device is doing something unspected with the control. Either because
> the protocol is not properly implemented or there has been a HW error.
> 
> Fixes v4l2-compliance:
> 
> Control ioctls (Input 0):
>                 fail: v4l2-test-controls.cpp(448): s_ctrl returned an error (22)
>         test VIDIOC_G/S_CTRL: FAIL
>                 fail: v4l2-test-controls.cpp(698): s_ext_ctrls returned an error (22)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  drivers/media/usb/uvc/uvc_video.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index f2f565281e63..25fd8aa23529 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -112,6 +112,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	case 5: /* Invalid unit */
>  	case 6: /* Invalid control */
>  	case 7: /* Invalid Request */
> +		/*
> +		 * The firmware has not properly implemented
> +		 * the control or there has been a HW error.
> +		 */
> +		return -EIO;
>  	case 8: /* Invalid value within range */
>  		return -EINVAL;
>  	default: /* reserved or unknown */
> 

