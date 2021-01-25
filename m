Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F22D303288
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 04:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbhAYJlJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 04:41:09 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:38123 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727015AbhAYJks (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 04:40:48 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3yDIlSnCqiWRg3yDLlfekq; Mon, 25 Jan 2021 10:31:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611567076; bh=lyAPFBaE1Bq0jra7Y6NTG5IHiOXadujAN/CxHQ1wQQ4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vRgIN1Zn3QWtnrfSaaTy6vqsBpaIDZjDb4olGfFCXDC8I1cioJVmjgkDYrqhyjq4S
         RmI7GwPAGGZMpVmKHkvyUNV2hl3Sdk47U21uOm0G+Qsg+6iP4VYrOoLCO45PVQ5Mhy
         RDGuzr0dYYm7/vZe+K7BYGE1MAtjTMOHW7Vn00njRezCiMEV31zAnfCFAdku8gzjNs
         QVlILdOb7lIbotZs4UU3TwodZdhG4fDn+hbg6gG+O+A2Ea8eFUSuT6tZg4f2pFlHGt
         tNdy7gOinOVuFYAcAwSa2Vm/jx6yBJ8EnLx9X54UJ5WRlf8CLLWthRUnjMBNySSniG
         EwMeleBw9fY8w==
Subject: Re: [PATCH 2/3] media: videodev2.h: clarify
 v4l2_pix_format_mplane.sizeimage docs when to set to zero
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org
References: <20210114180149.1755892-1-helen.koike@collabora.com>
 <20210114180149.1755892-3-helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <acae9f51-f8ca-b5f6-9af0-f0acc04e911d@xs4all.nl>
Date:   Mon, 25 Jan 2021 10:31:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114180149.1755892-3-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMoo6eUXuuO8P7YSv4WF1BSMR/THkRGfW5U8tJJ+Kn9qZpbg15ZNXBuih0rT2YqOimyVrG1Iqc7e+Z4SHjKnF1k1+hxdlPzrrnCA89xlHa5t/NU75r58
 /iXEePZhioTqnPeR0Es6SwLXZ6WqupllAlhH0ow5NCRdbIzs31nIoSd/jc3kZeT8N6XuZ0tmuAcLaW01yV3EMjhAFhX9GO6huTlpLGHqCDdGwc4FGQX5NTV7
 O9pFM0Qh5h9b9trykUXAnKSpvVe6seF07ds6J19rXD9LQQgOTFgmiK8hgfJyUjCjaNQOqqK6wdY4UbR0Hxzv9Ak1G692PdJcZb3ivacCVQx8irN5dWH9bNV2
 psLX7RQMnOVqlhQti6/e4w3uv6qoX2PizvXbQqLUvzeNuJK6G3g=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/01/2021 19:01, Helen Koike wrote:
> sizeimage field should be set to zero for unused planes, even when
> v4l2_pix_format_mplane.num_planes is smaller then the index of planes.

then -> than

> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> I caught this with v4l2-compliance, which throws an error if we dirty
> planes, even if invalid, so I would like to make it clear in the docs.

What is the error? And with which driver?

I wonder if this isn't a v4l2-compliance bug. And if we want this to be
zeroed, then it wouldn't it be better to do that in the V4L2 core rather
than bother drivers with this?

> ---
>  include/uapi/linux/videodev2.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 79dbde3bcf8d..d9b7c9177605 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2227,6 +2227,7 @@ struct v4l2_mpeg_vbi_fmt_ivtv {
>   * struct v4l2_plane_pix_format - additional, per-plane format definition
>   * @sizeimage:		maximum size in bytes required for data, for which
>   *			this plane will be used
> + *			Drivers should be set it zero for unused planes.

This sentence is a bit garbled.

You probably meant: Drivers must set this to zero for unused planes.

But it makes no sense to just zero this field. I would zero the whole struct
contents for the unused planes.

>   * @bytesperline:	distance in bytes between the leftmost pixels in two
>   *			adjacent lines
>   */
> 

The API doesn't mention whether unused plane formats should be zeroed or not,
but it does make sense that they are. I don't think that the userspace API
should be changed (esp. since there are apparently already drivers that do
not zero these unused plane formats), but it makes sense that the compliance
test does verify this, and that the V4L2 core would zero unused plane formats.

I never like it when undefined values are allowed in an API, so it makes sense
that this is done.

Regards,

	Hans
