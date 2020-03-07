Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2005417CDE8
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 12:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgCGLrE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 06:47:04 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:34213 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726073AbgCGLrE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Mar 2020 06:47:04 -0500
Received: from [IPv6:2001:983:e9a7:1:1586:2568:209f:70b3]
 ([IPv6:2001:983:e9a7:1:1586:2568:209f:70b3])
        by smtp-cloud7.xs4all.net with ESMTPA
        id AXv2j7V2sEE3qAXv3jEQxb; Sat, 07 Mar 2020 12:47:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583581621; bh=80WwQrQ/p8cnQL54LmjoJhB/o3YhB3T/bByi4ZAEShA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ehCCfPwwwa8WymgmuyV7n5tRvEa7IbeKYg7FTBJ1nejyY2nduo1YbEYKkKSKcbFUv
         XahAlW17og20GFwzKmpvmLBAeQhPr0svhglIT3vOY8Cu1bb2fi5LvPp1dfuA9cZPfQ
         4Br7KOMjym1SVO0/YzSulDlrPxS1LlKon4mWIktptDUdTJ5PBcuXjSLSeRfMP8HmvZ
         1g7XOpGso5+1MI+8np90t73t3qoplVLqTkGy6n1K9KcmvmqaX2EyoWha55TajOPTcF
         6l5fFIclV4V8Q1/pbxFhfP2rPnFq5eYnxZladKnOLb43ozATj1qDvBHK4BtlZFvETy
         mV4qTkO/AVWfA==
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
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
 <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
 <20200307094634.GB29464@google.com>
 <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
 <20200307112838.GA125961@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
Date:   Sat, 7 Mar 2020 12:47:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307112838.GA125961@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfISfwr9ZJrP5bmFIUfMuLk8cVVxIyO0SaCDCO6+zq3uo+EqLg0AHYVmtDsA/ieQ5ei99sLgtf24J3qh3+X/WJO+hFLRm/61TgwjAwbndS3J0aqPRD21y
 H9QmY7THlaLEfDOUmqmP4esr/tenbDzf62//QBCRjWcPShMTwAM1Njnj+WCu8Zk3SkO0YN3JZj68JJzo4bnIIHFLNcvdqWCNG722P6tpx97tkNuPhKaOfdHv
 EKlpAQPt04Ni2gjfqyfYm+qTYEJ0xT7UKffG3qfYu1yCBLNBaLQoozXI6eKOoO5Td+1ni4mdw4kqWwdz/tRsaA+lxPAK+NSc/FSh3XzJJoB50+aN5cM5/nd8
 nC1TxbP5D/sqhmuwTquSy7rKqdJIz8o0+zne+xmQ2uCa5z5UPA20cvtu0JPUTsjJo8j/+AyUYoZCaKZRoHf5gPn+EB5k5aFpWcp+XKKXSn5RpyBgZV9T8AsQ
 TaSSs7BAJnPnwV4ihEzvC/A//JWLGtBcTVf++yAusJt3ZFjNBHwyrnkqYb19Ld1tbtkPdfiVzzUgnYroqjdg3DJ5PEFURg3/11KBc6igJj+qnJbhu7OdVMTh
 HOJPqXIqiNzTs8YKqRza5d2vDwuCCR/+mUKPNW2WRKC19Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/03/2020 12:28, Sergey Senozhatsky wrote:
> On (20/03/07 11:10), Hans Verkuil wrote:
> [..]
>>>>> @@ -564,6 +573,7 @@ struct vb2_queue {
>>>>>  	unsigned			requires_requests:1;
>>>>>  	unsigned			uses_qbuf:1;
>>>>>  	unsigned			uses_requests:1;
>>>>> +	unsigned			allow_cache_hints:1;
>>>
>>> Shall I use "unsigned int" here instead of "unsigned"?
>>
>> The vb2_queue bitfields are the only places in that header were 'unsigned' is
>> used. I think that that should be fixed in a separate patch. It's nice to have
>> it consistent.
>>
>> Put that patch in the beginning of the series, that way I can pick it up in the
>> next pull request.
> 
> OK, done.
> 
> For the time being the series has moved to github public repo [0],
> I'll try to run more 'twisty' cases and re-submit once it survives
> beating.

Create those tests in v4l2-compliance: that's where they belong.

You need these tests:

For non-MMAP modes:

1) test that V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is never set.

If V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is not set, then:

1) attempting to use V4L2_FLAG_MEMORY_NON_CONSISTENT will clear the flag
   upon return (test with both reqbufs and create_bufs).
2) attempting to use V4L2_BUF_FLAG_NO_CACHE_INVALIDATE or V4L2_BUF_FLAG_NO_CACHE_CLEAN
   will clear those flags upon return (do we actually do that in the patch series?).

If V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is set, then:

1) set V4L2_FLAG_MEMORY_NON_CONSISTENT in reqbufs, but clear in create_bufs:
   this should fail.
2) clear V4L2_FLAG_MEMORY_NON_CONSISTENT in reqbufs, but set in create_bufs:
   this should fail.
3) set V4L2_FLAG_MEMORY_NON_CONSISTENT in both reqbufs and create_bufs: this should
   work.
4) clear V4L2_FLAG_MEMORY_NON_CONSISTENT in both reqbufs and create_bufs: this should
   work.
5) you can use V4L2_BUF_FLAG_NO_CACHE_INVALIDATE or V4L2_BUF_FLAG_NO_CACHE_CLEAN
   without these flags being cleared in v4l2_buffer.

All these tests can be done in testReqBufs().

Regards,

	Hans

> 
> [0] https://github.com/sergey-senozhatsky/v4l2-mmap-cache-flags
> 
> 	-ss
> 

