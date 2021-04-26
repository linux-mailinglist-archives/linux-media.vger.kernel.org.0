Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F9436AC44
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 08:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhDZGeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 02:34:37 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56431 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231616AbhDZGeg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 02:34:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id auoUla4xMXsivauocl3UiF; Mon, 26 Apr 2021 08:33:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619418834; bh=3kK/jJq5s+rF83Ejs3REbu2F3wsLKvLdb73BGzaWgFU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=t/Ox7uG9MLun1yXr5qCf+pqltK+6c+bTv1a0lZGflrNuYNMYDzOEbT+tA0hPRyFwk
         GFiUOZ/KqwIWMq2yG7z+UmOkvzw+04Lrtvs+XxMCwDI6FJsVvoicExt6ApNkaV8zFU
         LdxtgvfgEK4eyHyQrWtVIJYWARwuRftLnL3zSkqtquboG7mJ/CAta0GB53IjkXlUBc
         Wuca3cSKcGGKpC41zvzzKOGxEsQ2GFCNPUeFkIKZf6AelL4M3t2W5BWw96HvP2mbK9
         Ty2OFK8cN/BtVqM9ZP0i5gYjVUrFmMvvZSDl1qCKYSARybUSYpd8BVVjZKW2eBH8Mj
         ICK6dsT5tGoRA==
Subject: Re: [PATCH v2 1/2] cec-follower: increase precision of Audio Rate
 Control active sensing
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
References: <cover.1619389023.git.deborahbrouwer3563@gmail.com>
 <359f2292a67679b5dab5d9d1fda280bc80f34c40.1619389023.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <543c665e-80b8-8acf-5259-47031084b41b@xs4all.nl>
Date:   Mon, 26 Apr 2021 08:33:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <359f2292a67679b5dab5d9d1fda280bc80f34c40.1619389023.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ+jBkht+u8snmGLUUsY5zMMLMz3C4rvQ9uGc/x+ELMiX79wYVq0lQaPFIPFMUvM9vTtcfejSIB5w4wDCkc2EIPJpGO/AQ1W2AEQF8YuPihXRA0kYjre
 5sj55N2WKIfED3EbAsR52ed25iS7j3Z377jwKmV42+W30KW9GFadiIQTa256/ecoX91LrjFM/wKwxQ3o4WJ5DFj7G7qIryo9SzeqV05M8z1xWKjNEM50RkzE
 +CfrTrbWD7HXe2G3DQF6Lw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/04/2021 00:54, Deborah Brouwer wrote:
> Measure the interval since the last audio rate control message in
> nanoseconds instead of seconds. Increasing the precision catches audio
> rate messages that are late by less than a second.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-follower/cec-processing.cpp | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 93db4059..243c9d09 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -29,8 +29,8 @@
>  /* Time between each polling message sent to a device */
>  #define POLL_PERIOD 15000
>  
> -/* The maximum interval in seconds between audio rate messages as defined in the spec */
> -#define MAX_AUD_RATE_MSG_INTERVAL 2
> +/* The maximum interval in nanoseconds between audio rate messages as defined in the spec */
> +#define MAX_AUD_RATE_MSG_INTERVAL 2000000000

It's a bit easier to read if you write this as:

#define MAX_AUD_RATE_MSG_INTERVAL_NS (2 * 1000000000ULL)

It's helpful to add the unit as a suffix to the define name and to
write it as a multiplication of seconds times nsecs_per_sec.

Also ULL helps cast the expression to an unsigned long long (64 bit).

Not strictly necessary, but since we check intervals using __u64 it
doesn't hurt either.

Regards,

	Hans

>  
>  struct cec_enum_values {
>  	const char *type_name;
> @@ -241,7 +241,8 @@ static void aud_rate_msg_interval_check(__u64 ts_new, __u64 ts_old)
>  	 * turned off the audio rate control.
>  	 */
>  	if (ts_old) {
> -		unsigned interval = (ts_new - ts_old) / 1000000000;
> +		__u64 interval = ts_new - ts_old;
> +
>  		if (interval > MAX_AUD_RATE_MSG_INTERVAL) {
>  			warn("The interval between Audio Rate Control messages was greater\n");
>  			warn("than the Maxiumum Audio Rate Message Interval (2s).\n");
> 

