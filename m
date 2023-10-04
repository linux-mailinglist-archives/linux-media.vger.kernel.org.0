Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8C0D7B7C87
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 11:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242069AbjJDJou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 05:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242061AbjJDJot (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 05:44:49 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E81A7
        for <linux-media@vger.kernel.org>; Wed,  4 Oct 2023 02:44:45 -0700 (PDT)
X-KPN-MessageId: a55cff68-629a-11ee-90ec-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id a55cff68-629a-11ee-90ec-00505699b430;
        Wed, 04 Oct 2023 11:44:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=tCQwTOg6EZKsFKGY5sd1RNw/73pN54y1SZSPjSAVn8I=;
        b=oezxJrbr/5RfXfBOSjdu+s1GfCosGCieowWwfcVTt67mz3mzTTR3WUOofIOqSKwTT4K5V6WUWMAoj
         fxh1fwxgjJhzcZ1ghcheqxJYTUCGcN5M4R3FM2SubhBoLTbxDS09hcQAeI5wJSYLMnx/EB54lchgZf
         C939FWzE7DzKYZ4ugGnsqiFtDog6M+3pbe0eLx0F8YkVGz6S2OtNmqnHtbdEzigNSEMnYkglrAhmvE
         lTxueqX2nmJDwJ+YD0xRKpwcdnAKgetdISnb3rB+kRIZKGKdIuLARCrEFl2XAjsa8R52MBgppU7G+f
         5JDsh0AnLl4MsW8q1iTyZ4PTM0AoOFA==
X-KPN-MID: 33|Xd2evYbjuV5WodjIv7ET3yz4MvAFrxM4WViBb/7fy555PjwH3usDI52Zuluo6ay
 3rJ2RRQ/6dYUeDvlbVPs0GuS4n+709RhxBFgMG2R/WAY=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|75fSE3b2QWEuqiHfLRtQWid1FHJBGvTZe3i6M7ZKEpfN0IpQSyDjQm98kiR87tU
 vQaL5h0k94vgbfICUJiqdPQ==
X-Originating-IP: 173.38.220.46
Received: from [10.47.77.214] (unknown [173.38.220.46])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id a4ba84e5-629a-11ee-9dc8-00505699772e;
        Wed, 04 Oct 2023 11:44:43 +0200 (CEST)
Message-ID: <3173f083-ae6c-4f57-be00-05203bf798a3@xs4all.nl>
Date:   Wed, 4 Oct 2023 11:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] v4l2-compliance: add EOPNOTSUPP for create_bufs
To:     Deborah Brouwer <deborah.brouwer@collabora.com>
Cc:     linux-media@vger.kernel.org, nicolas.dufresne@collabora.com,
        sebastian.fricke@collabora.com, nas.chung@chipsnmedia.com,
        jackson.lee@chipsnmedia.com
References: <20231003224536.13199-1-deborah.brouwer@collabora.com>
Content-Language: en-US
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231003224536.13199-1-deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

On 10/4/23 00:45, Deborah Brouwer wrote:
> If VIDIOC_CREATE_BUFS is supported on one queue but not the other, then
> the driver should return EOPNOTSUPP for the unsupported queue only.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> On the wave5 driver, v4l2-compliance -d0 -v now shows:
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
>  utils/v4l2-compliance/v4l2-compliance.h     | 1 +
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index 7caf254b..99c98916 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -165,6 +165,7 @@ struct base_node {
>  	bool supports_orphaned_bufs;
>  	// support for this was introduced in 5.9
>  	bool might_support_cache_hints;
> +	bool create_bufs_on_one_queue_only;

No need to add this here.

>  };
>  
>  struct node : public base_node, public cv4l_fd {
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index 6d592c9b..e709580b 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -693,6 +693,14 @@ int testReqBufs(struct node *node)
>  				warn("VIDIOC_CREATE_BUFS not supported\n");
>  				break;
>  			}
> +			if (ret == EOPNOTSUPP) {
> +				/* VIDIOC_CREATE_BUFS is supported on one queue but not the other. */
> +				fail_on_test(node->create_bufs_on_one_queue_only);
> +				node->create_bufs_on_one_queue_only = true;
> +				info("VIDIOC_CREATE_BUFS not supported for %s\n",
> +				     buftype2s(q.g_type()).c_str());
> +				break;
> +			}

It is sufficient to have it as a local variable in this function.

>  
>  			memset(&crbufs, 0xff, sizeof(crbufs));
>  			node->g_fmt(crbufs.format, i);

In any case, the logic needs to be improved a bit:

keep track of the q.create_bufs(node, 0) return values: crbufs_enotty_cnt,
crbufs_eopnotsupp_cnt and crbufs_ok_cnt (for any ohter return values).

Fail if (crbufs_enotty_cnt && (crbufs_eopnotsupp_cnt + crbufs_ok_cnt), since
if ENOTTY is returned once, it has to be returned always.

Also fail if (crbufs_eopnotsupp_cnt && !crbufs_ok_cnt), since EOPNOTSUPP indicates
that it is supported in some cases, but not others, so you need to see at least
some successful calls.

I think that is a better test, because that checks for ENOTTY abuse as well.

Regards,

	Hans
