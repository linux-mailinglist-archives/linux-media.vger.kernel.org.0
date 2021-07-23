Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67A43D369D
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 10:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234355AbhGWHoX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 03:44:23 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:35999 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229907AbhGWHoX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 03:44:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 6qUImWbWFXTlc6qUJmAKUw; Fri, 23 Jul 2021 10:24:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627028696; bh=G/gLVG+vEvPnW/X47dF5+ZZLjjYd169DWpYlduozbnk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qx0fsSh4b8Bx9ZALtSJj7P3jqc6Mv+tb5nZttUQoYxl/Bf96l1jm8XHzGuscR9Kfc
         2cjbw90oS/gIbnrvHdWAd6daxKUE4LyI1VumopGB+YLzPAdOBRBrxYYgyYLTbDMSgY
         k8ybhjwJRHNnK/fncQ6BFF3l8pmF4vRcPLQUml5I88A8j/RQSha8Df42lNQ6DIY/Ud
         g8ubT324NtcMEZiGgWXwg8eO99ogW71pHTeWkQobswbMcBLWLxhiSDtg0DOUyv/ljm
         ywCbA/eyWp8JrcJOzNvayZEY6kkMWS3oX+hKIMHS9+18OVdxegqJ13ty9+s99BllIb
         YprgyOe9yIuCA==
Subject: Re: [PATCH REPOST] TDA1997x: replace video detection routine
To:     =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
References: <m3k0lmejlw.fsf@t19.piap.pl>
 <68bd6e41-4c32-240f-aa83-fd2b96929d45@xs4all.nl> <m3mtqedfsg.fsf@t19.piap.pl>
 <m3im12df1m.fsf@t19.piap.pl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b2d74079-4858-1a2d-55b0-9504ebabc5e3@xs4all.nl>
Date:   Fri, 23 Jul 2021 10:24:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <m3im12df1m.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHhHGfiYtyj8PIqP3pooduSYtcUcgIPrNFBO6nPMztw2MN4qyN4Yt8nNqaXGvWHudh5Jl53ISfpd/M6y5gWkOVlmXB3EWRQyir1GrUjf6EaFE7NGHmEx
 Mns3fJH/XtJR8Bdu0X+rhSRILjRyQMzSARVWysdbPPWd/PV66exagDVNoykD3tmWBSjkXiO2zMsZO4tBBLLounmChFAP5FQQ+Jtg9l4PgxnrTF4RZwEJ+Wyq
 O/GJVl1wLvWID6dO9PWBEOUehbknPFVSZ6Ew3IW9exMzV2CIsQ99vm/wFGa94cHvlDJjTcBGQhK+eHu3K+zPem1+SR7oqEwSCyIRj9im4orN+MH5j3nhdLor
 5LlFr69VGiONwsjCB70Wxsl+6Zw3LTAkR9d+hWt1v55p3qnyf5A=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On 22/07/2021 08:43, Krzysztof Hałasa wrote:
> Also, I have spotted an interesting loop condition in
> drivers/media/v4l2-core/v4l2-dv-timings.c (dated 2013,
> d1c65ad6a44b0ff79d2f0bf726fa6fd9248991f4).
> It obviously works (unless the table grows to 600+ entries), but I guess
> I should make it "standard", shouldn't I?

Thanks for catching this!

I've posted a patch fixing it. Luckily it never broke anything, but it definitely
had to be fixed.

Regards,

	Hans

> 
> The first case is pretty normal:
> @@ -159,10 +161,10 @@ int v4l2_enum_dv_timings_cap(struct v4l2_enum_dv_timings *t,
>      u32 i, idx;
>  
>      memset(t->reserved, 0, sizeof(t->reserved));
> -    for (i = idx = 0; i < ARRAY_SIZE(timings); i++) {
> -        if (v4l2_dv_valid_timings(timings + i, cap) &&
> +    for (i = idx = 0; v4l2_dv_timings_presets[i].bt.width; i++) {
> +        if (v4l2_dv_valid_timings(v4l2_dv_timings_presets + i, cap) &&
>              idx++ == t->index) {
> -            t->timings = timings[i];
> +            t->timings = v4l2_dv_timings_presets[i];
>              return 0;
>          }
>      }
> 
> This is the interesting part:
> @@ -179,10 +181,10 @@ bool v4l2_find_dv_timings_cap(struct v4l2_dv_timings *t,
>      if (!v4l2_dv_valid_timings(t, cap))
>          return false;
>  
> -    for (i = 0; i < ARRAY_SIZE(timings); i++) {
> -        if (v4l2_dv_valid_timings(timings + i, cap) &&
> -            v4l2_match_dv_timings(t, timings + i, pclock_delta)) {
> -            *t = timings[i];
> +    for (i = 0; i < v4l2_dv_timings_presets[i].bt.width; i++) {
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +        if (v4l2_dv_valid_timings(v4l2_dv_timings_presets + i, cap) &&
> +            v4l2_match_dv_timings(t, v4l2_dv_timings_presets + i, pclock_delta)) {
> +            *t = v4l2_dv_timings_presets[i];
>              return true;
>          }
>      }
> 

