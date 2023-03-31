Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCF986D28BA
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 21:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbjCaTgK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 15:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232317AbjCaTgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 15:36:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158BC22E8D
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 12:36:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 96335B831FD
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 19:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4108C433D2;
        Fri, 31 Mar 2023 19:36:00 +0000 (UTC)
Message-ID: <f688b904-06ba-d9e2-5d16-1775fa4b9101@xs4all.nl>
Date:   Fri, 31 Mar 2023 21:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] v4l2-tracer: use __FILE_NAME__ if available
Content-Language: en-US
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
References: <20230331185958.10111-1-deborah.brouwer@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230331185958.10111-1-deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/03/2023 20:59, Deborah Brouwer wrote:
> Use __FILE_NAME__ if available to avoid printing the entire relative path
> in verbose and debug messages, otherwise fall back to __FILE__.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  utils/v4l2-tracer/libv4l2tracer.cpp      | 12 +++---
>  utils/v4l2-tracer/retrace-helper.cpp     | 16 ++++----
>  utils/v4l2-tracer/retrace.cpp            | 52 ++++++++++++------------
>  utils/v4l2-tracer/trace-helper.cpp       | 18 ++++----
>  utils/v4l2-tracer/trace.cpp              |  4 +-
>  utils/v4l2-tracer/v4l2-tracer-common.cpp |  4 +-
>  utils/v4l2-tracer/v4l2-tracer-common.h   |  6 +++
>  utils/v4l2-tracer/v4l2-tracer.cpp        | 28 ++++++-------
>  8 files changed, 73 insertions(+), 67 deletions(-)
> 
> diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
> index a9f039c7..fc6f3939 100644
> --- a/utils/v4l2-tracer/libv4l2tracer.cpp
> +++ b/utils/v4l2-tracer/libv4l2tracer.cpp
> @@ -69,7 +69,7 @@ int open(const char *path, int oflag, ...)
>  	int fd = (*original_open)(path, oflag, mode);
>  
>  	if (is_debug()) {
> -		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
> +		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);

That's not quite what I had in mind.

All these messages are all the same, it's much better to introduce a macro
for it, similar to e.g. the info macro in v4l2-compliance.h.

That way these '__FILE__, __func__, __LINE__' bits are only used in the macro,
and it simplifies all these messages in v4l2-tracer.

Something like this goes into trace.h:

#ifndef __FILE_NAME__
#define __FILE_NAME__ __FILE__
#endif

#define info(fmt, args...)                                      \
        do {                                                    \
                fprintf(stderr, "%s:%s:%d" fmt, ##args, __FILE_NAME__, __func__, __LINE__);       \
        } while (0)


>  		fprintf(stderr, "fd: %d, path: %s\n", fd, path);

And then this becomes:

		info(": fd: %d, path: %s\n", fd, path);

I'm not sure if calling it 'info' is the right name in this case,
I leave that to you.

Regards,

	Hans


