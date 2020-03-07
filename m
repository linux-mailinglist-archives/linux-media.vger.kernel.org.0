Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A450717CD46
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 10:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgCGJcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 04:32:46 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40605 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725878AbgCGJcq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Mar 2020 04:32:46 -0500
Received: from [IPv6:2001:983:e9a7:1:558f:c736:2117:17d1]
 ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AVp4jx1PZ9Im2AVp5jJ1Ey; Sat, 07 Mar 2020 10:32:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583573564; bh=qWaLrRMEa0H6bqFO0jtJCqfA8jNFPKhl2ErMRoaoQHw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IElGU+NnXTMjTHcDTz3x3maihzMdU9BCsmCqwtlCfQbPKjOtltUN+d2RZubmHKfe0
         RkEZwiPlftL5fgaOm4VWKVXnO6uR4k2v9HY/ik63nqs3POHFpSMiZSjlCFErMhe7A5
         ccZUIMtgGJQx/A8ScvcaCcVJDdn9qkzbPfpPp+weVNZJW0g5QLJgePQJbFzCx9gTa7
         RMJgJLZ0GdlikC5gODepvK9VhoDRI15Tfm3YkD31lXGw62Bw/zqJUqz0NSSTkbrscT
         eUnN8c+oyD5SwW7OORyS8/2nXp7J+sCsK91j/MxRe3Ckl+sIcOiRF/D8QNzuOUoM07
         cy98CrsQAmgRg==
Subject: Re: [PATCHv4 10/11] videobuf2: add begin/end cpu_access callbacks to
 dma-sg
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-11-senozhatsky@chromium.org>
 <f99cd8d2-26a2-acd1-a986-aee66cd2ba12@xs4all.nl>
 <20200307052628.GB176460@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8150bc6c-f6a4-fa2c-4e2e-552dcb168df0@xs4all.nl>
Date:   Sat, 7 Mar 2020 10:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307052628.GB176460@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEwhK2PpFlwrt7pMeGwxfncC4Y00enycjjuQwazf0ibd9yUp4vxgG4AvMSJNNj2kB3ed5tB894CI84FMbXT4t5g/2Hgg4XahtISRrM6WeFxwK2Z1DLLw
 z3FUPumVEVBvHvTr0G1cDpyWdC43q9+frV1Cd0GtaiSTVlgW4yCzsQdjbVSwwjH3S+bT12C4SZHcBs40tgmMTO/Qf5Cij6b8l6DEVTt7WRGLl1PPklPJXlDr
 275IJDkjWZ7kbGsHy/BKgnZJzUcX3dkrqWBU0+3DlTXGtjLFSIk8d+7wunDYWM8hxqEYaM2REqrK8MU5oFuPy8dJsydKCX8HowMuQm9rID+qe7R90V6/pN8x
 9hKs2bUjf/WtctevvjgoBVQncvbHuvVOdbk5oC9dRLs1Qy+RNyP3t9rnCP/hbDCTn2sfPH4UQTPDX8g6VCTYga4Q4qvWGNP6oDHWRJP2Lau+6Jj7oeyGzMmJ
 3u0NeEhSIDAnNbCXPORa650Y3mHy25PHWISggQZB6LM4VOviXReQZEfd8QmnWl0eBNG5fuHf2FfwKm+yXokt/Viw5Euu6zGXpU6Jt6P4eslS2272q+zSi2m9
 FPITVQRyvgEJDIf3/7CXKKAwNa+aUpcpiWKU7rA5AeAzbA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/03/2020 06:26, Sergey Senozhatsky wrote:
> On (20/03/06 15:04), Hans Verkuil wrote:
> [..]
>>> +	/*
>>> +	 * NOTE: dma-sg allocates memory using the page allocator directly, so
>>> +	 * there is no memory consistency guarantee, hence dma-sg ignores DMA
>>> +	 * attributes passed from the upper layer. That means that
>>> +	 * V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
>>> +	 */
>>>  	buf->pages = kvmalloc_array(buf->num_pages, sizeof(struct page *),
>>>  				    GFP_KERNEL | __GFP_ZERO);
>>>  	if (!buf->pages)
>>> @@ -470,6 +476,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
>>>  	vb2_dma_sg_put(dbuf->priv);
>>>  }
>>>  
>>> +static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>>> +					enum dma_data_direction direction)
>>
>> I suggest you use this style to avoid checkpatch warnings:
>>
>> static int
>> vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>> 				       enum dma_data_direction direction)
> 
> OK, will do.
> 
> Just for information, my checkpatch doesn't warn me:
> 
> $ ./scripts/checkpatch.pl outgoing/0010-videobuf2-add-begin-end-cpu_access-callbacks-to-dma-.patch

We use the --strict option to checkpatch.

Regards,

	Hans

> total: 0 errors, 0 warnings, 46 lines checked
> 
> outgoing/0010-videobuf2-add-begin-end-cpu_access-callbacks-to-dma-.patch has no obvious style problems and is ready for submission.
> 
> 	-ss
> 

