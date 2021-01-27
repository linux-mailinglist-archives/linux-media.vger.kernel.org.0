Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0095D30570F
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 10:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234933AbhA0Jgf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 04:36:35 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59145 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234850AbhA0JDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 04:03:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4giqll9Uq1U0p4giulzoKp; Wed, 27 Jan 2021 10:02:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611738168; bh=WM93M7GQdaTpsK01iu5vr6yjZIgGqem1aksLuP+stKM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tneJnUlq5ZaJKcbZspsKxDb6uIPrAB1yMSxNdhpXNuNCiPC8F8XCTkz92BlM8qhNb
         IOrzhpnLKl/GE52BNZ1rm+qu7xEXDBFUZDttngqNwq8X5EWVIut/eDPs7AHC+m3V/o
         9eh7nM0HVI3VlQb7lGMgIoEVPhS21VzvPP57GdvS3b/HJs2nJYsOddNnJ5n/Shto6K
         4UIa2KICmJ/eeT7YyXivtKirLx5X8j3GYYduiC11SMPvieFcYlw7tAKBl240QcDFrk
         D4MgPutjpV5T/UcJ7r/5jYVv+92qJQ8YL+kZnGy94OORRg8+r2EcWTe4pXCkpsXz9+
         kMevlc6F2yYcA==
Subject: Re: [PATCH] v4l2-ctl: print delta to current clock in verbose mode
To:     Max Schulze <max.schulze@posteo.de>, linux-media@vger.kernel.org
References: <71a724ea-ffd4-25f5-b1ca-40802a625b62@posteo.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <400c6a61-b778-0400-4ec2-cb254b9c67d5@xs4all.nl>
Date:   Wed, 27 Jan 2021 10:02:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <71a724ea-ffd4-25f5-b1ca-40802a625b62@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIKZqUy+iXuZIrp3N0shbkR9HBCc/Or8zKMTrsTD1atDS40XE1SE1BrGfjEK3c5b+drOWEH2UB2F9ZYRFMiaMRGcdUEVHKZJdgnD+FJkVnBLOpy+/gvo
 +8iNA92LTP0KHgPYfF7jhyQNSF4jLmfyjSAkapEpJuhKC/BAlqZ4nGyhIL3EyDtJ1SDcDIH7R8/jwIII6RK4YG7I6GUq+RQT/ux+0kKOBIXMPuS8m3o0eToa
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Max,

On 26/01/2021 15:24, Max Schulze wrote:
> If the Buffer Timestamp Clock is _MONOTONIC, print the delta
> to the current clock time. Useful for debugging / insights.
> 
> 
> Signed-off-by: Max Schuze <max.schulze@posteo.de>
> ---
>   utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp 
> b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index a3580595..d024f925 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -556,9 +556,15 @@ static void print_concise_buffer(FILE *f, 
> cv4l_buffer &buf, cv4l_fmt &fmt,
>           double ts = buf.g_timestamp().tv_sec + 
> buf.g_timestamp().tv_usec / 1000000.0;
>           fprintf(f, " ts: %.06f", ts);
>           if (last_ts <= 0.0)
> -            fprintf(f, " delta: %.03f ms", (ts - last_ts) * 1000.0);
> +            fprintf(f, " delta last: %.03f ms", (ts - last_ts) * 1000.0);
>           last_ts = ts;
> 
> +        if ((buf.g_flags() & V4L2_BUF_FLAG_TIMESTAMP_MASK) == 
> V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC) {
> +            timespec ts_clock;
> +            clock_gettime(CLOCK_MONOTONIC, &ts_clock);
> +            fprintf(f, " delta now: %+.03f ms", ((ts_clock.tv_sec + 
> ts_clock.tv_nsec / 1000000000.0) - ts) * 1000.0);

I have no objection to this, but I think this needs to be enabled
with a new option (e.g. --stream-show-delta-now) to avoid cluttering
the output too much.

Regards,

	Hans

> +        }
> +
>           if (fps_ts.has_fps(true))
>               fprintf(stderr, " fps: %.02f", fps_ts.fps());
> 

