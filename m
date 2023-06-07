Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F01D1725CCD
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 13:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235880AbjFGLN4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 07:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234131AbjFGLNy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 07:13:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98445124
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 04:13:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33766633BF
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 11:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3283C433EF;
        Wed,  7 Jun 2023 11:13:50 +0000 (UTC)
Message-ID: <216922d8-820d-a8c5-c79f-27b811f80fa5@xs4all.nl>
Date:   Wed, 7 Jun 2023 13:13:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] v4l2-compliance: call select before dequeuing event
Content-Language: en-US
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
Cc:     nicolas.dufresne@collabora.com
References: <20230607021029.30466-1-deborah.brouwer@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230607021029.30466-1-deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/06/2023 04:10, Deborah Brouwer wrote:
> When the streaming option is called with a stateful decoder,
> testUserPtr() and testDmaBuf() will hang indefinitely when attempting to
> dequeue a source change event. To prevent this call select() with a
> timeout.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> It looks like this was the same issue that was previously fixed for testMmap()
> in commit f0a5b17d9 ("v4l2-compliance: add timeout when waiting for event").
> 
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index a097a0ff..0396e17e 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -1746,8 +1746,17 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
>  
>  		if (node->is_m2m) {
>  			if (node->codec_mask & STATEFUL_DECODER) {
> +				int fd_flags = fcntl(node->g_fd(), F_GETFL);
> +				struct timeval tv = { 1, 0 };
> +				fd_set efds;
>  				v4l2_event ev;
>  
> +				fcntl(node->g_fd(), F_SETFL, fd_flags | O_NONBLOCK);
> +				FD_ZERO(&efds);
> +				FD_SET(node->g_fd(), &efds);
> +				ret = select(node->g_fd() + 1, nullptr, nullptr, &efds, &tv);
> +				fail_on_test_val(ret < 0, ret);
> +				fail_on_test(ret == 0);
>  				fail_on_test(node->dqevent(ev));

This code keeps the fd in non-blocking mode. You need to add a
fcntl(node->g_fd(), F_SETFL, fd_flags) line here. See also testMmap().

>  				fail_on_test(ev.type != V4L2_EVENT_SOURCE_CHANGE);
>  				fail_on_test(!(ev.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION));
> @@ -1949,8 +1958,17 @@ int testDmaBuf(struct node *expbuf_node, struct node *node, struct node *node_m2
>  
>  		if (node->is_m2m) {
>  			if (node->codec_mask & STATEFUL_DECODER) {
> +				int fd_flags = fcntl(node->g_fd(), F_GETFL);
> +				struct timeval tv = { 1, 0 };
> +				fd_set efds;
>  				v4l2_event ev;
>  
> +				fcntl(node->g_fd(), F_SETFL, fd_flags | O_NONBLOCK);
> +				FD_ZERO(&efds);
> +				FD_SET(node->g_fd(), &efds);
> +				ret = select(node->g_fd() + 1, nullptr, nullptr, &efds, &tv);
> +				fail_on_test_val(ret < 0, ret);
> +				fail_on_test(ret == 0);
>  				fail_on_test(node->dqevent(ev));

Ditto.

>  				fail_on_test(ev.type != V4L2_EVENT_SOURCE_CHANGE);
>  				fail_on_test(!(ev.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION));

Regards,

	Hans
