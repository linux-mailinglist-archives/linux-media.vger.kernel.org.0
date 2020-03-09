Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8006D17D9BF
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 08:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgCIHV7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 03:21:59 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47251 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725796AbgCIHV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 03:21:59 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id BCjZjfNXzhVf8BCjcjElpU; Mon, 09 Mar 2020 08:21:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583738517; bh=4PbSCkUTIAYFVwtOAMQvyn2IACK+hvQavQo/9Hcrsj0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qLP4H+PEfC3ghKQRaqRI/MzMspZsV/0Sy7AqyUh8icGsa6Sh5p2shD2sr9yjUCwKk
         ClPAI5fyC7A2z4oCrkN7UhqIDhsQ+bfI6RwW1ymX23yHiJHpTjcQcbbeqUP+8WkOXz
         JetU71m7VQewkRq8139lgUl1B7Ob/9r+8OTWWGnyiBWdRgHlYPY/Hj1JeiWaM8aKIl
         ar+rdnFuwt3Vw0XMdQgp9uW1N/9lji+5EYGi8zqv2A+XRJubRPVeLQnALWvTAiEHv7
         AK2pEYaSKMzRGsfmXAc1J4JDuw3Qr/7DuolOnSE7SPhXK0iKpoFuCY9u6mEgKNIEtu
         fYrF/JPRHGAsQ==
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
 <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
 <20200307094634.GB29464@google.com>
 <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
 <20200307112838.GA125961@google.com>
 <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
 <20200309032707.GA9460@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <40cd09d9-49a6-2159-3c50-825732151221@xs4all.nl>
Date:   Mon, 9 Mar 2020 08:21:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309032707.GA9460@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCu4ti1tc0zftsFeVsBIVWMCsCkZd6R5tiuAq1i/VX5n9AdM6vlVngosxSoNrvY/Pi9nEqh1GGmohBdqzLh2d8QJPE05PRZF62yI3unkXbmiGdB17tGw
 LZYtORef+LWlDF+EATKsoj2b2s7XNA0rv73o32JhuXH4juV22Bv04hyu9oyqESXnepqLCjdgyMQhzdsHSgbQW2PndlvcAP3GFJzBDQ1Iyf8tO40BYUmvUBVM
 N95G7AkhJLHBMi57M3vg0Ds/xaqGXGvTX5PywZ6Jueerd0abn/UjWV8fzxMq9EmCCWAPMy55Tr6UXD13Yt0FrYwVykVL+zmWI+74UJUqG+bwzlHKw0uGoQxp
 zcZvFm7CFBb6T1+ekehTBko4iudnoHxrsR4DASETetiR+haFLzMuOf/um3M28DBAZNaf5MasDA6EbnY0Bx+YASZCgxL54ybzObIZtO1PHyEDo3bC66Jb/kf2
 E0ITGREwRUVY8jJXCQdSazWNRclNyZdh//qtMbzarCl8GYGmgMJ/ikGuUy9Ld7SAXm788CiXWUMGBWNE5qxwZBL/tJ2/yvvA5/140s7fk4Y26yK86x34jJI8
 OI4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/9/20 4:27 AM, Sergey Senozhatsky wrote:
> On (20/03/07 12:47), Hans Verkuil wrote:
>>
>> Create those tests in v4l2-compliance: that's where they belong.
>>
>> You need these tests:
>>
>> For non-MMAP modes:
>>
>> 1) test that V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is never set.
>>
>> If V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is not set, then:
>>
>> 1) attempting to use V4L2_FLAG_MEMORY_NON_CONSISTENT will clear the flag
>>    upon return (test with both reqbufs and create_bufs).
>> 2) attempting to use V4L2_BUF_FLAG_NO_CACHE_INVALIDATE or V4L2_BUF_FLAG_NO_CACHE_CLEAN
>>    will clear those flags upon return (do we actually do that in the patch series?).
> 
> NO_CACHE_INVALIDATE/NO_CACHE_CLEAN are cleared in vb2_fill_vb2_v4l2_buffer()
> [as was suggested], then the struct is copied back to user. But I think it
> would be better to clear those flags when we clear
> V4L2_FLAG_MEMORY_NON_CONSISTENT. We have 4 places which do something
> like
> 	"if !vb2_queue_allows_cache_hints(q) then clear flags bit".
> 
> Besides, vb2_fill_vb2_v4l2_buffer() is called only for !prepared
> buffers, so the flags won't be cleared if the buffer is already
> prepared.
> 
> Another thing is that, it seems, I need to patch compat32 code. It
> copies to user structs member by member so I need to add ->flags.
> 
>> If V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is set, then:
>>
>> 1) set V4L2_FLAG_MEMORY_NON_CONSISTENT in reqbufs, but clear in create_bufs:
>>    this should fail.
>> 2) clear V4L2_FLAG_MEMORY_NON_CONSISTENT in reqbufs, but set in create_bufs:
>>    this should fail.
>> 3) set V4L2_FLAG_MEMORY_NON_CONSISTENT in both reqbufs and create_bufs: this should
>>    work.
>> 4) clear V4L2_FLAG_MEMORY_NON_CONSISTENT in both reqbufs and create_bufs: this should
>>    work.
>> 5) you can use V4L2_BUF_FLAG_NO_CACHE_INVALIDATE or V4L2_BUF_FLAG_NO_CACHE_CLEAN
>>    without these flags being cleared in v4l2_buffer.
>>
>> All these tests can be done in testReqBufs().
> 
> I'm looking into it. Will it work if I patch the vivid test driver to
> enable/disable ->allow_cache_hints bit per-node and include the patch
> into the series. So then v4l2 tests can create some nodes with
> ->allow_cache_hints.  Something like this:

I would add a 'cache_hints' module parameter (array of bool) to tell vivid
whether cache hints should be set or not for each instance. It would be useful
to have this in vivid. Don't forget to update Documentation/media/v4l-drivers/vivid.rst
as well.

Regards,

	Hans

> 
> ---
>  drivers/media/platform/vivid/vivid-core.c     | 6 +++++-
>  drivers/media/platform/vivid/vivid-core.h     | 1 +
>  drivers/media/platform/vivid/vivid-meta-cap.c | 3 +++
>  drivers/media/platform/vivid/vivid-meta-out.c | 3 +++
>  4 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
> index c62c068b6b60..9acbb59d240c 100644
> --- a/drivers/media/platform/vivid/vivid-core.c
> +++ b/drivers/media/platform/vivid/vivid-core.c
> @@ -129,7 +129,8 @@ MODULE_PARM_DESC(node_types, " node types, default is 0xe1d3d. Bitmask with the
>  			     "\t\t    bit 16: Framebuffer for testing overlays\n"
>  			     "\t\t    bit 17: Metadata Capture node\n"
>  			     "\t\t    bit 18: Metadata Output node\n"
> -			     "\t\t    bit 19: Touch Capture node\n");
> +			     "\t\t    bit 19: Touch Capture node\n"
> +			     "\t\t    bit 20: Node supports cache-hints\n");
>  
>  /* Default: 4 inputs */
>  static unsigned num_inputs[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 4 };
> @@ -977,6 +978,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  		return -EINVAL;
>  	}
>  
> +	/* do we enable user-space cache management hints */
> +	dev->allow_cache_hints = node_type & 0x100000;
> +
>  	/* do we create a radio receiver device? */
>  	dev->has_radio_rx = node_type & 0x0010;
>  
> diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
> index 99e69b8f770f..2d311fc33619 100644
> --- a/drivers/media/platform/vivid/vivid-core.h
> +++ b/drivers/media/platform/vivid/vivid-core.h
> @@ -206,6 +206,7 @@ struct vivid_dev {
>  	bool				has_meta_out;
>  	bool				has_tv_tuner;
>  	bool				has_touch_cap;
> +	bool				allow_cache_hints;
>  
>  	bool				can_loop_video;
>  
> diff --git a/drivers/media/platform/vivid/vivid-meta-cap.c b/drivers/media/platform/vivid/vivid-meta-cap.c
> index 780f96860a6d..6c28034d3d58 100644
> --- a/drivers/media/platform/vivid/vivid-meta-cap.c
> +++ b/drivers/media/platform/vivid/vivid-meta-cap.c
> @@ -33,6 +33,9 @@ static int meta_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  	if (vq->num_buffers + *nbuffers < 2)
>  		*nbuffers = 2 - vq->num_buffers;
>  
> +	if (dev->allow_cache_hints)
> +		vq->allow_cache_hints = true;
> +
>  	*nplanes = 1;
>  	return 0;
>  }
> diff --git a/drivers/media/platform/vivid/vivid-meta-out.c b/drivers/media/platform/vivid/vivid-meta-out.c
> index ff8a039aba72..d7b808aa5f6d 100644
> --- a/drivers/media/platform/vivid/vivid-meta-out.c
> +++ b/drivers/media/platform/vivid/vivid-meta-out.c
> @@ -33,6 +33,9 @@ static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  	if (vq->num_buffers + *nbuffers < 2)
>  		*nbuffers = 2 - vq->num_buffers;
>  
> +	if (dev->allow_cache_hints)
> +		vq->allow_cache_hints = true;
> +
>  	*nplanes = 1;
>  	return 0;
>  }
> 

