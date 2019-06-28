Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E496859D0C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 15:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfF1NhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 09:37:19 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45915 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726664AbfF1NhT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 09:37:19 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id gr3vhmL0sSfvXgr3yhS9im; Fri, 28 Jun 2019 15:37:17 +0200
Subject: Re: [PATCH v2 00/11] Venus stateful Codec API
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9c3399a8-4fc6-3117-10ee-3395cee034da@xs4all.nl>
Date:   Fri, 28 Jun 2019 15:37:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK9Yvy8TSAOpVdctQbKSiaJLdA9YrUHCjxTdzggXbbTuxa7REtky8kGOIOb0Go0+ghoOFhwS6Sd+J15tIhOPYuG6KaD46wEG65xvFborgAFOOOuojzqe
 f0k8c45tWPL0tji79rPDFc5usfkKvGzp6rVkp6TjCYuqYWLptx/W6m0x4y07y4k+XwUXjc9NyQGqgOnSIGP+WY0wOwA61KAHWqhS4n0Pmc9rKk3K2hF7XKAB
 eeVoBlkv1c+GDBvdy9YCsLTei+5Wk4e9z7qwx/Vw4ZoRdebqJmCA7JWp2hn8NlpxW2hyIyu0+c9Te/GslgwaCEv1LcdChXm0AjLWnmVZ6+lgaw4VPfhTdOYd
 wHOWhr7oK9yBfEPFHbzfaV/1QQlaISRQ3M+xqbiugi7arRhp1gc9wjCZQG4zNBq+DZ6xra5BbUmMTZf8izG5Rn6ssTJacw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/28/19 2:59 PM, Stanimir Varbanov wrote:
> Hello,
> 
> Here is v2 of the Venus transition to stateful codec API
> compliance. The v2 can be found at [1].
> 
> Changes since v1:
>  * codec_state is now enum
>  * dropped IS_OUT and IS_CAP macros and use vb2_start_streaming_called()
>  * corrected g_fmt and reconfig logic
>  * s/vdec_dst_buffers_done/vdec_cancel_dst_buffers
>  * use v4l2_m2m_ioctl_try_decoder_cmd M2M helper
>  * various fixes to make v4l2-compliance pass the streaming test
> 
> To test the streaming with --stream-from-hdr v4l2-compliance option I have
> to make the following hack (it is needed because the size of decoder input
> buffers (OUTPUT queue) is not enough for the h264 bitstream, i.e the driver
> default resolution is 64x64 but the h264 stream is 320x240):
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index c71dcf65b721..dc0fcf20d3e4 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -1294,6 +1294,11 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
>                                         fmt.s_sizeimage(fmt.g_sizeimage(p) * 2, p);
>                         }
>                         fail_on_test(q.create_bufs(node, 1, &fmt));
> +
> +                       for (unsigned p = 0; p < fmt.g_num_planes(); p++)
> +                               fmt.s_sizeimage(fmt.g_sizeimage(p) * 2, p);
> +                       node->s_fmt(fmt);
> +
>                         fail_on_test(q.reqbufs(node, 2));
>                 }
>                 if (v4l_type_is_output(type))

Does the venus driver set sizeimage based on the given output resolution?

E.g. if v4l2-compliance would first set the output resolution to 320x240,
is the returned sizeimage value OK in that case?

And this also means that the venus driver requires each buffer to have
a single compressed frame, right? I.e. it can't be spread over multiple
OUTPUT buffers.

We really need to let userspace know about such restrictions.

Stanimir, can you list the restrictions of the decoder for the various
codecs?

Regards,

	Hans
