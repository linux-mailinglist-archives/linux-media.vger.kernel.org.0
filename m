Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBE333CECA
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 08:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbhCPHpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 03:45:45 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47049 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229646AbhCPHpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 03:45:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M4OHl0ONq4ywlM4OMlA8RY; Tue, 16 Mar 2021 08:45:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615880730; bh=KbB6mdeP/3sRZ4m9VmiHVsbE3XcXiYRdYC8cTM6so1E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qa20UExEqVb0p2JOoW7pT3jS+mM4n5ZYnMT70WKDPzIz4lkiPlmF4/mdKmfttdijD
         kPAvMbfT2xwz9wWIp7TungtXN7EKVshK7J3oWiEr+2gfSbtUv0W5dHV+tbzBS7C6gj
         3gNxbRbWI8Avg0C4VFcTMmZBAGdZdQsuBzQjOES6GuqPLIxHJkf/HQFCvqVFJyhj4x
         AIA6G/4ak4Jx/jDSXVJVK1y+lV30wTRQ1MLZ8qQrf4Kbb8jesQakQDY3OlRWD6dTfJ
         fLe8iYz0nwoKGDimsqxo39TuvC+Bj2IYAqSkgr6p3yZpjfb5/5FEo6mTV+ANh+RW6a
         45ylImII3k2hQ==
Subject: Re: [PATCH] Rectify spelling and grammar
To:     Xiaofeng Cao <cxfcosmos@gmail.com>
Cc:     gustavoars@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiaofeng Cao <caoxiaofeng@yulong.com>, mchehab@kernel.org
References: <20210311072044.388-1-cxfcosmos@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <126298ca-15c3-22f8-50f5-b7bf4cc281ec@xs4all.nl>
Date:   Tue, 16 Mar 2021 08:45:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311072044.388-1-cxfcosmos@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLNYPDKqG+xg1M/EqfPkWz+LWOFxoYYw3E57ZR3RVEyTmcq7jd3MHx96DsbK2zmu97pnbKV6eylUPhdOuj2/1C49IEsWKp1zm2dV15vXXLDyptNLAkn6
 sLQoGQosNC3xRJ8dE5tXz8yd5QKjPcA3pA4o+tJmmWdN0u6xqfNyDQe+mgqlVVOS7GdkTkDkn9CYhVEa6PYOZ9ZN91lygkprXAYHJathOc8VswBGsVbeQ4G3
 sZYpVIwbGCTGUCVJxn11XSwtXmYb73cFNRPq7NV8H15fuKkoFCzFbZlb2TCnX/x4qr5fH7m7qxAjo5YWdD578jy5QIIu4zUMGOWm1y/GAJIGYVlEWnhyfmGL
 6o2zXSwNiR/2kJiMAEy4hFulCQSR7LG5vwUSwonXJK8OcXhAxNz5h7TZ2aaX/LZcKEXV7JCs
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xiaofeng Cao,

The patch is good, but scripts/checkpatch.pl complains about a mismatch:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Xiaofeng Cao <cxfcosmos@gmail.com>' != 'Signed-off-by: Xiaofeng Cao
<caoxiaofeng@yulong.com>'

Which is the one I should use?

Regards,

	Hans

On 11/03/2021 08:20, Xiaofeng Cao wrote:
> Change 'inaccesable' to 'inaccessible'
> Change 'detrmine' to 'determine'
> Delete 'in' grammatically
> 
> Signed-off-by: Xiaofeng Cao <caoxiaofeng@yulong.com>
> ---
>  drivers/media/radio/radio-si476x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/radio/radio-si476x.c b/drivers/media/radio/radio-si476x.c
> index 23997425bdb5..b39a68f83c5f 100644
> --- a/drivers/media/radio/radio-si476x.c
> +++ b/drivers/media/radio/radio-si476x.c
> @@ -152,7 +152,7 @@ static struct v4l2_ctrl_config si476x_ctrls[] = {
>  
>  	/*
>  	 * SI476X during its station seeking(or tuning) process uses several
> -	 * parameters to detrmine if "the station" is valid:
> +	 * parameters to determine if "the station" is valid:
>  	 *
>  	 *	- Signal's SNR(in dBuV) must be lower than
>  	 *	#V4L2_CID_SI476X_SNR_THRESHOLD
> @@ -255,7 +255,7 @@ struct si476x_radio;
>   *
>   * This table holds pointers to functions implementing particular
>   * operations depending on the mode in which the tuner chip was
> - * configured to start in. If the function is not supported
> + * configured to start. If the function is not supported
>   * corresponding element is set to #NULL.
>   *
>   * @tune_freq: Tune chip to a specific frequency
> @@ -917,7 +917,7 @@ static int si476x_radio_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_RDS_RECEPTION:
>  		/*
>  		 * It looks like RDS related properties are
> -		 * inaccesable when tuner is in AM mode, so cache the
> +		 * inaccessible when tuner is in AM mode, so cache the
>  		 * changes
>  		 */
>  		if (si476x_core_is_in_am_receiver_mode(radio->core))
> 

