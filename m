Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7547777D2
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 14:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbjHJMFY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 08:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232500AbjHJMFX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 08:05:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E6510F5
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 05:05:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8E6C864908
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 12:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F20C433C7;
        Thu, 10 Aug 2023 12:05:20 +0000 (UTC)
Message-ID: <a2e03fce-9b12-359c-3b40-d549b3bbcb1f@xs4all.nl>
Date:   Thu, 10 Aug 2023 14:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] v4l2-ctl: fix --silent option in manual
Content-Language: en-US
To:     Andrei Cherniaev <dungeonlords789@naver.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20230609102556.31972-1-dungeonlords789@naver.com>
 <62db3c3c-341e-e098-9209-b504b151188b@naver.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <62db3c3c-341e-e098-9209-b504b151188b@naver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrei,

Sorry, I'm not taking this patch. It doesn't really add anything useful
and the text is also full of typos and grammatical errors.

The behavior of a --silent option is similar to how it is used in other
linux commands, so I don't think it needs any other explanation.

Regards,

	Hans

PS: for some reason you CC-ed linuxtv-commits@linuxtv.org, please don't
do that. linux-media is the right mailinglist for this.

On 8/10/23 13:46, Andrei Cherniaev wrote:
> silent option description not correct.
> ---
> utils/v4l2-ctl/v4l2-ctl.1.in | 15 ++++++++++++++-
> 1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl.1.in b/utils/v4l2-ctl/v4l2-ctl.1.in
> index b8cbe6d2..107dd959 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.1.in
> +++ b/utils/v4l2-ctl/v4l2-ctl.1.in
> @@ -140,7 +140,20 @@ Set the new access priority [VIDIOC_S_PRIORITY].
> \fI<prio>\fR is 1 (background), 2 (interactive) or 3 (record).
> .TP
> \fB--silent\fR
> -Only set the result code, do not print any messages.
> +
> +If operating system doesn't return error while v4l2-ctl try to read or 
> write any multimedia device parameter then --silent option is no matter.
> +If operating system return error while v4l2-ctl try to read or write 
> any multimedia device parameter then --silent option is important.
> +For example there isn't /dev/video1 in system.
> +If you don't use --silent option you will get both error message and 
> error result code
> +$ v4l2-ctl --device /dev/video1 --set-parm 25
> +VIDIOC_S_PARM: failed: Inappropriate ioctl for device
> +$ echo $? # get result code
> +255
> +
> +If you use --silent option you willn't get error message. But you still 
> can get error result code
> +$ v4l2-ctl --device /dev/video1 --set-parm 25 --silent
> +$ echo $? # get result code
> +255
> .TP
> \fB--sleep\fR \fI<secs>\fR
> Sleep \fI<secs>\fR, call QUERYCAP and close the file handle.
> 

