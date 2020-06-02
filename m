Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8D61EB999
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 12:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgFBK1q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 06:27:46 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:42953 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726110AbgFBK1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 06:27:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g48xjX0vFCKzeg490jIunX; Tue, 02 Jun 2020 12:27:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591093662; bh=iuv0MyxiDVS1VP2KQKdfxyHqb0vjm3MOthTbbsyfbPQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VYwKIl5kMJ5R+E27jJvlC58ntB0zcL/5dTUuoQ5KtCgGfStECfjXvK/I1kC3RMfX9
         xcN6zpYj9Xpa5XX0l3WyfpvehX19yx8aVDWzmI7ZrDchd24DnYYAPdANe0AcsD3/jv
         04ds24dCi8Vu29bWhhJbXLlcpbcb4K0P40W1YnoAq53v0Wojr1ode7LUqfjwvEnNhI
         VelZrI1SrqShZ3nox17rh0xtXOapoaxzOfpbxGAjLAs13Mr4EyUYjFM0wx7HWwU5lf
         8OCTdqFyQzBATSaOu72SSAQayF4/yesOaUWnR63l6/TYtexMaxhBTwIXKZ4vfyLU9X
         IUvFaBI5MOKrw==
Subject: Re: [PATCH v6 03/14] videobuf2: handle V4L2 buffer cache flags
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
 <20200514160153.3646-4-sergey.senozhatsky@gmail.com>
 <b34ae09b-7c20-7255-6adc-3370680555cd@xs4all.nl>
 <20200602101834.GA617@jagdpanzerIV.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9ec2618b-0cce-b00e-08cf-b579d9aa1d5d@xs4all.nl>
Date:   Tue, 2 Jun 2020 12:27:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200602101834.GA617@jagdpanzerIV.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA7xmdWiozyMD6B5+eR1LK/gS74fhnvHCQZ7gp2EFkWbTN6gaRN2tooo5agavEOzbxm+ZFbaIivhiMIblhLhBthNmEX07pxRPFHUOyRFAb2C7ameIUDb
 IkVlDSlEJsbUv7lOlIya7A3i3uZP2EgL8KcohM7lzMcSL/PRohvVRX9nALZuSCVFbplebdR9RWyd3BhoojSTTBex/20cCK5KTb3v1+63c4tpdTe360q9LThK
 O/gnogKSSaBcvLeN9FQKlqF5K+Zwcdq9RFs9ZwGz4prNdpCbi4sSB5FCINquzm+iiXbr2INzF7Ik5ehxYOMQC35iIolBJ7397+f366aptWlLDXkp8R14/MjM
 0jp2pAfRYuKr+Y49en1iOR8IJmb1lVxvUTsH80UQW+w2o+j52KA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/06/2020 12:18, Sergey Senozhatsky wrote:
> Hi Hans,
> 
> On (20/06/02 11:51), Hans Verkuil wrote:
>> Hi Sergey,
>>
>> While doing final testing for this patch series (together with the v4l-utils patch)
>> I found one remaining issue:
> 
> Thanks for the report.
> 
>>> +static void set_buffer_cache_hints(struct vb2_queue *q,
>>> +				   struct vb2_buffer *vb,
>>> +				   struct v4l2_buffer *b)
>>> +{
>>> +	/*
>>> +	 * DMA exporter should take care of cache syncs, so we can avoid
>>> +	 * explicit ->prepare()/->finish() syncs. For other ->memory types
>>> +	 * we always need ->prepare() or/and ->finish() cache sync.
>>> +	 */
>>> +	if (q->memory == VB2_MEMORY_DMABUF) {
>>> +		vb->need_cache_sync_on_finish = 0;
>>> +		vb->need_cache_sync_on_prepare = 0;
>>> +		return;
>>> +	}
>>> +
>>> +	/*
>>> +	 * Cache sync/invalidation flags are set by default in order to
>>> +	 * preserve existing behaviour for old apps/drivers.
>>> +	 */
>>> +	vb->need_cache_sync_on_prepare = 1;
>>> +	vb->need_cache_sync_on_finish = 1;
>>> +
>>> +	if (!vb2_queue_allows_cache_hints(q)) {
>>> +		/*
>>> +		 * Clear buffer cache flags if queue does not support user
>>> +		 * space hints. That's to indicate to userspace that these
>>> +		 * flags won't work.
>>> +		 */
>>> +		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
>>> +		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
>>> +		return;
>>> +	}
>>
>> These two flags need to be cleared for VB2_MEMORY_DMABUF as well in the test above.
>> This bug is causing v4l2-compliance failures (use the test-media script in contrib/test
>> in v4l-utils: 'sudo test-media vim2m').
> 
> Sorry, Hans, do you suggest to have something like this:
> 
> 	if (q->memory == VB2_MEMORY_DMABUF) {
> 		vb->need_cache_sync_on_finish = 0;
> 		vb->need_cache_sync_on_prepare = 0;
> 		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
> 		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
> 		return;
> 	}
> 
> I didn't clear the ->flags there because we clear the vb flush/sync
> flags: ->need_cache_sync_on_finish/prepare are zeros for DMABUF memory
> type. Which is equivalent to passing V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
> V4L2_BUF_FLAG_NO_CACHE_CLEAN. IOW we would clearing both "vb's do cache
> sync" and request's "do not cache sync".

Ah, yes. In that case the v4l-utils patch is likely wrong. Can you take a
look at that patch?

In any case, *something* is wrong.

Regards,

	Hans

> 
>> It's enough to post a v6.1 for this patch, everything else is fine.
> 
> Thanks!
> 
> 	-ss
> 

