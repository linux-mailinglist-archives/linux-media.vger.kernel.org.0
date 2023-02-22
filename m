Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8F769FC18
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 20:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbjBVT04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 14:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbjBVT0z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 14:26:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C889B3E603
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 11:26:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 53EE761548
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 19:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C16C433EF;
        Wed, 22 Feb 2023 19:26:35 +0000 (UTC)
Message-ID: <a00558a5-2168-8f86-5db8-a8b3f3928a37@xs4all.nl>
Date:   Wed, 22 Feb 2023 20:26:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/5] v4l2-tracer: remove trailing comma from JSON trace
Content-Language: en-US
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
References: <cover.1675920064.git.deborah.brouwer@collabora.com>
 <abcc11027eb2a9364c7ba8f6b7ea2d3688ef8f09.1675920064.git.deborah.brouwer@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <abcc11027eb2a9364c7ba8f6b7ea2d3688ef8f09.1675920064.git.deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/02/2023 07:06, Deborah Brouwer wrote:
> Put the trace file into valid JSON format by removing the trailing comma
> from the trace file array.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  utils/v4l2-tracer/v4l2-tracer.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
> index ae6f68e4..7adbe04e 100644
> --- a/utils/v4l2-tracer/v4l2-tracer.cpp
> +++ b/utils/v4l2-tracer/v4l2-tracer.cpp
> @@ -346,7 +346,7 @@ int tracer(int argc, char *argv[], bool retrace)
>  
>  	/* Close the json-array and the trace file. */
>  	trace_file = fopen(trace_filename.c_str(), "a");
> -	fseek(trace_file, 0L, SEEK_END);
> +	ftruncate(fileno(trace_file), lseek(fileno(trace_file), 0, SEEK_END) - 2);
>  	fputs("\n]\n", trace_file);

ftruncate seems overkill to me. Wouldn't it be enough to just do

fseek(trace_file, -2, SEEK_END);

since the fputs afterwards will overwrite those last two characters anyway?

(I think it is -2 for SEEK_END, I'm not 100% certain though, it could be 2)

Regards,

	Hans

>  	fclose(trace_file);
>  

