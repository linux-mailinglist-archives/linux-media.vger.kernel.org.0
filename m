Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E18E1EBB90
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 14:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgFBMW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 08:22:26 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:45571 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728091AbgFBMV2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 08:21:28 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g5uyjjRB3nv5ng5v2jpLOD; Tue, 02 Jun 2020 14:21:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591100486; bh=wnxhpBOR8cxLlCxEru5iXAFOeqCtZF0eI6TnTRpTQ4k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mnj2X7BtqgiwxsqKNO/Gme6ym8NfylrxRhcToLZ2Jvv3pXnELWguDd0MQ9SrPJeic
         vBE6fp1/oDqTDT7zfU1aJIr6L05uNZZsm9ctGubcWavmUJSJoVeCm/BfHyfUkQKDfG
         M6UOwKF68yUJWQ1KuAyMkME94sS4Mta/H0wBl4FwJPDnK0H2oY7K6ertG+WQDjqRvX
         r+SrtwlqUBAl/omOC0/PeSNBQebgliirOc9ujm2zrJtrdRXA/SEP5ril8AAEPGKoCZ
         udHUGJm/1/hjH8ahdoBAn0JXxrFwvZolOBk+KY6KtHLWruzIkBiLCV1pIfOyplId4J
         EZRKDh9MFG0Bw==
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
 <9ec2618b-0cce-b00e-08cf-b579d9aa1d5d@xs4all.nl>
 <20200602121049.GB617@jagdpanzerIV.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9c6a347e-1cbf-3486-896a-124375fd225c@xs4all.nl>
Date:   Tue, 2 Jun 2020 14:21:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200602121049.GB617@jagdpanzerIV.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB8xLrDohS5YChC2UdUEKUAgITcrA2xd5BVFjYQiOblLsFTmwikPFUXRvD8jTyG5ep3cDCjG/Sv7pz4guYWvnkNJzSSsVCsnsguovEkVK1jP6L7uNMQP
 b+dT3G6UJ8Ihk2lGIa6OeA727A4s97n5qF+bN9c2DrNvROnxRG8sOkO/wZxl2Jk8Ajtn+Er1SyiVHVNzbXyLJKPunFQ9g5psaAP2AjWAR63W6n+Lw5H9Cnnt
 s2wo1Uc2dfybHIUk6O7jw/xoCMctsfNNeJtz+DLSOkhwBLu7a72V1Ay2P9FoHi1bCOFPD7oaOZIVuub73834fNhQ1QuMTB17gnYIuWzo7AG/fDXO8XZMWiAw
 C2ZpRGCs4QpOBWib4oQzgf7osEyUNSfhT1MTDEUCpVU9D1XcdFI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/06/2020 14:10, Sergey Senozhatsky wrote:
> On (20/06/02 12:27), Hans Verkuil wrote:
> [..]
>>> Sorry, Hans, do you suggest to have something like this:
>>>
>>> 	if (q->memory == VB2_MEMORY_DMABUF) {
>>> 		vb->need_cache_sync_on_finish = 0;
>>> 		vb->need_cache_sync_on_prepare = 0;
>>> 		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
>>> 		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
>>> 		return;
>>> 	}
>>>
>>> I didn't clear the ->flags there because we clear the vb flush/sync
>>> flags: ->need_cache_sync_on_finish/prepare are zeros for DMABUF memory
>>> type. Which is equivalent to passing V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
>>> V4L2_BUF_FLAG_NO_CACHE_CLEAN. IOW we would clearing both "vb's do cache
>>> sync" and request's "do not cache sync".
>>
>> Ah, yes. In that case the v4l-utils patch is likely wrong.
>> Can you take a look at that patch?
> 
> Hans, are we talking about "v4l2-utils: test cache_hints for MMAP queues"
> patch? I can take a look, yes.

Yes, that's the one.

	Hans
