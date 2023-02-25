Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A48F6A2C9C
	for <lists+linux-media@lfdr.de>; Sun, 26 Feb 2023 00:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjBYXjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Feb 2023 18:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjBYXjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Feb 2023 18:39:40 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5B8D315;
        Sat, 25 Feb 2023 15:39:38 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id kb15so2675961pjb.1;
        Sat, 25 Feb 2023 15:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pio0uRP/ewoQJQAm/tSRW/tGkbea/TOip01WmAMHVzo=;
        b=FO5Jb1+wDZrmKC1gE6gtni9QN39RJ74fJZm3VMr582oRKOwFt0N2fK5tXG2Y2NvWXs
         3flNlNgc8YSguTXnMZrQyzOrkkP9MOIz+Jv75lhaa81O2rWJgoIN7JhvySJjv+S+6eGG
         sWWRt5G3DCTGSJSe1oFD8CQzBjOdL1rp15IY1XPJfK68FUrjiB/SZphDLAuZwE58l4jw
         zuu/SkPOoNrgP+P+/Z2jd02qjZKOaJvxFRZEHsD6INVi/fqrTOFuzrvOTuepwJD63BpL
         DuXaqqE8f0p5R3WImzdCAEVAUzP2Uu2sLlac16M6mIQlmC8dupzyikNOvJxEnnB46H4K
         IF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pio0uRP/ewoQJQAm/tSRW/tGkbea/TOip01WmAMHVzo=;
        b=DIVDyhKEqRz0i2jwmJfCGCJVQXcqPFY8j4rJ2tWr65KEtqov8SFfJEPkpcbJTkjPiM
         IpTWyybAuYnHvwncLjnBuebD8LO1ubvpyv2+Pue5/G92JaND6X+4sGqUT9/RJrsxH9iP
         JXGpSUP7K/WPp3Vl5sEfIxfdVjx808DFrH/T881hC8BaeKMk9W/cUT70+5Z9VR+vA2/S
         YgBqHkAPxYl5V0CkdlZSKWlNgR1cEqQGtv6ZADUOPfBUdZSlxXyKEQHXtMXeEVdXkzyX
         OOl4047r0ZcMma4vWmClM1yMyXsYg0rT+1TvimmBm9Ta68BvnN7Mh5T+W1eGLJFZ5udM
         dPVA==
X-Gm-Message-State: AO0yUKUBFesxB2do5+PwOkneD5ViARA4nJqb4IJgXIIzEaV1630N0gWv
        A8ZiGD7Ly1qBReOOEiPZRms=
X-Google-Smtp-Source: AK7set89d/ivG7PS04MXWl/22Xdl6Zd0rGjXDVOF53H4hiShuf17qLdp5MNCESTV6PwDgFeKAvng2w==
X-Received: by 2002:a17:903:8ce:b0:199:3a4a:d702 with SMTP id lk14-20020a17090308ce00b001993a4ad702mr4223586plb.0.1677368378086;
        Sat, 25 Feb 2023 15:39:38 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id e6-20020a170902d38600b0019cb8ffd592sm1761602pld.163.2023.02.25.15.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Feb 2023 15:39:37 -0800 (PST)
Message-ID: <307dbafd-6fe7-1b75-a484-67553529a5e0@gmail.com>
Date:   Sun, 26 Feb 2023 08:39:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] media: Fix building pdfdocs
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Airlie <airlied@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[+CC: Jon, linux-doc]

On Wed,  8 Feb 2023 10:29:16 +0200, Tomi Valkeinen wrote:
> Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
> documatation for a few new RGB formats. For some reason these break the
> pdfdocs build, even if the same style seems to work elsewhere in the
> file.
> 
> Remove the trailing empty dash lines, which seems to fix the issue.
> 
> Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
Link: https://lore.kernel.org/r/12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com/

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> 
> Note: the offending patch was merged via drm tree, so we may want to
> apply the fix to the drm tree also.

So, the offending commit is now in mainline without this fix...
I believe this build regression -- a real build error of "make pdfdocs"
-- should be fixed ASAP.

Tomi, Laurent has suggested a typo fix in the Changelog.
Can you respin ?

Or, Laurent, can you do the fix on your own?

Hopefully, the fix can make v6.3-rc1.

        Thanks, Akira

> 
>  Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index d330aeb4d3eb..ea545ed1aeaa 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -868,7 +868,6 @@ number of bits for each component.
>        - r\ :sub:`4`
>        - r\ :sub:`3`
>        - r\ :sub:`2`
> -      -
>      * .. _V4L2-PIX-FMT-RGBA1010102:
>  
>        - ``V4L2_PIX_FMT_RGBA1010102``
> @@ -909,7 +908,6 @@ number of bits for each component.
>        - r\ :sub:`4`
>        - r\ :sub:`3`
>        - r\ :sub:`2`
> -      -
>      * .. _V4L2-PIX-FMT-ARGB2101010:
>  
>        - ``V4L2_PIX_FMT_ARGB2101010``
> @@ -950,7 +948,6 @@ number of bits for each component.
>        - r\ :sub:`6`
>        - r\ :sub:`5`
>        - r\ :sub:`4`
> -      -
>  
>  .. raw:: latex
>  
