Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10FB7C5959
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 18:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbjJKQl0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 12:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjJKQlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 12:41:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB168F
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 09:41:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97E0C433C8;
        Wed, 11 Oct 2023 16:41:22 +0000 (UTC)
Message-ID: <3bb0d9d5-6f36-40ca-a8ec-6fc848e2ca0c@xs4all.nl>
Date:   Wed, 11 Oct 2023 18:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] v4l2-compliance: check errors returned by CREATE_BUFS
Content-Language: en-US, nl
To:     Deborah Brouwer <deborah.brouwer@collabora.com>
Cc:     linux-media@vger.kernel.org, nicolas.dufresne@collabora.com,
        sebastian.fricke@collabora.com, nas.chung@chipsnmedia.com,
        jackson.lee@chipsnmedia.com
References: <20231005024415.20212-1-deborah.brouwer@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231005024415.20212-1-deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2023 04:44, Deborah Brouwer wrote:
> If VIDIOC_CREATE_BUFS is not supported by a driver, it should return
> ENOTTY on all queues; so add a test to fail if ENOTTY is returned on only
> one queue.
> 
> If  VIDIOC_CREATE_BUFS is supported, asymmetrically, on only one queue and
> not another, then the driver should return EOPNOTSUPP for only that queue.
> Fail if the driver returns EOPNOTSUPP on both queues.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> Changes since v1:
> - add the ENOTTY test
> - use a count instead of bool to keep track of error codes
> 
> On the wave5 driver, v4l2-compliance -d0 -v shows:
> <snip>
> Buffer ioctls:
>         info: test buftype Video Capture Multiplanar
>         info: VIDIOC_CREATE_BUFS not supported for Video Capture Multiplanar
>         info: test buftype Video Output Multiplanar
>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>     test VIDIOC_EXPBUF: OK
>         info: could not test the Request API, no suitable control found
>     test Requests: OK (Not Supported)
> 
> Total for wave5-dec device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0
> 
> 
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index 6d592c9b..632da7f8 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -540,6 +540,9 @@ int testReqBufs(struct node *node)
>  	bool dmabuf_valid;
>  	int ret;
>  	unsigned i, m;
> +	int crbufs_ok_cnt = 0;
> +	int crbufs_enotty_cnt = 0;
> +	int crbufs_eopnotsupp_cnt = 0;
>  
>  	node->reopen();
>  
> @@ -690,9 +693,21 @@ int testReqBufs(struct node *node)
>  
>  			ret = q.create_bufs(node, 0);
>  			if (ret == ENOTTY) {
> +				/* VIDIOC_CREATE_BUFS is not supported at all. */
> +				crbufs_enotty_cnt++;

Just count here...

> +				fail_on_test(crbufs_enotty_cnt && (crbufs_eopnotsupp_cnt + crbufs_ok_cnt));

...and move the fail_on_test to after the loop, when all the
counter values are final.

>  				warn("VIDIOC_CREATE_BUFS not supported\n");
>  				break;
>  			}
> +			if (ret == EOPNOTSUPP) {
> +				/* VIDIOC_CREATE_BUFS is supported on one queue but not the other. */
> +				fail_on_test(crbufs_eopnotsupp_cnt && !crbufs_ok_cnt);

Also move to after the loop is done.

> +				crbufs_eopnotsupp_cnt++;
> +				info("VIDIOC_CREATE_BUFS not supported for %s\n",
> +				     buftype2s(q.g_type()).c_str());
> +				break;
> +			}
> +			crbufs_ok_cnt++;
>  
>  			memset(&crbufs, 0xff, sizeof(crbufs));
>  			node->g_fmt(crbufs.format, i);

Regards,

	Hans
