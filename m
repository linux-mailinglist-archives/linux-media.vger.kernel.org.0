Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D2B45C91F
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 16:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242021AbhKXPuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 10:50:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbhKXPuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 10:50:21 -0500
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84475C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 07:47:11 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id puUDmg0nyCMnApuUGmwarS; Wed, 24 Nov 2021 16:47:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637768829; bh=T7Aj/ep1xaktQSpMVXu8sCHEqVw+/2CbceT0AI8RIcQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jjANxp77wXBz+xC6/FT+5BNvYTjoQ1IPmoXJY9HVS2sqapUyCvBXVp8E379DZk7Tc
         vp1wpHkw7uQD5QINwmIoSTqMZDHi7RLG4484gHzewDmQ4qspQIcIxRhJecxXX+xYTZ
         5aNqyrm2joh2DB5OKguirRxt8WJuAyHp+KfNZ+5cURgF2gqUiqWb7tERuGKTYa3Qct
         zuK+FctDJrRV7Cb6DiP07hN1o33K2ROqQjwHL4W99TdtOu7ST3LMEC5VoTHTg2MOFE
         qMZE2Z25AVyVunb3Y1YNY+0S+gMoxr6wySWjpJGy5hEawasg87cxMzndWtDeP0TSt6
         u31auNaMD8BNg==
Subject: Re: [PATCH v2 2/2] media: videobuf2: add WARN_ON if bytesused is
 bigger than buffer length
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20211111152640.1537-1-dafna.hirschfeld@collabora.com>
 <20211111152640.1537-3-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bad9cd33-7cff-6966-9e4d-da1f0be5df9b@xs4all.nl>
Date:   Wed, 24 Nov 2021 16:47:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211111152640.1537-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH+hWOFKNxvwGnLa0XATOzxlWtWFL1UvWDynLcMNtz5fehXKuSFV0TFnoT9rxHBSkZhFXdUu1vR+O1rSzmAQ4M8IvgO2wcarMWx2H76y7byoc2Lv33/R
 HsyOS4aeQz/xMiD+TDFrPW+KuUvMDCGMH5rwttzVU14yI+i+nwAvM3RMd82qh4vK1oyDAJUC5yPB+kwhERExW1AlOwl2I1DOJlTaXum5cpLjQaOE6VUvCg/+
 nHl3UKN9Ia/FxZCjeOz9eEsz2Jebt1so3Ww3BcDbd6LLjXCboKIhoqh3HZx9q2PakfKG5kbFiMFcdTY9nZFllgPZpGgii1jec3B8pA8lTtGV0QP5oLNYbmuq
 crMXbR1poV6VT/nBHvmQ/8QSgJH4jlbIhN877Y26SMUa27DInTVs95bHUeJGtpVrdAWsdzB6
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/11/2021 16:26, Dafna Hirschfeld wrote:
> In function vb2_set_plane_payload, report if the
> given bytesused is bigger than the buffer size,
> and clamp it to the buffer size.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  include/media/videobuf2-core.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 2467284e5f26..e06c190265f0 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -1155,8 +1155,14 @@ static inline void *vb2_get_drv_priv(struct vb2_queue *q)
>  static inline void vb2_set_plane_payload(struct vb2_buffer *vb,
>  				 unsigned int plane_no, unsigned long size)
>  {
> -	if (plane_no < vb->num_planes)
> +	/*
> +	 * size must never be larger than the buffer length, so
> +	 * warn and clamp to the buffer length if that's the case.
> +	 */
> +	if (plane_no < vb->num_planes) {
> +		WARN_ON_ONCE(size > vb->planes[plane_no].length);

This doesn't clamp size to the buffer length, so this needs to be added.

Also, the subject talks about WARN_ON instead of WARN_ON_ONCE.

Regards,

	Hans

>  		vb->planes[plane_no].bytesused = size;
> +	}
>  }
>  
>  /**
> 

