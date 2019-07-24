Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48D8E72F8C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 15:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbfGXNIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 09:08:44 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59233 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726535AbfGXNIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 09:08:44 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qH0YhIFB30QvJqH0bh9TJI; Wed, 24 Jul 2019 15:08:42 +0200
Subject: Re: tw686x driver (continued)
To:     =?UTF-8?Q?Mark_Balan=c3=a7ian?= <mbalant3@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org
References: <84ab52c4-9ea7-c526-c628-47d678ccf926@gmail.com>
 <CAAEAJfDgEVMWbYkEaVp0mp4hQXbhZq8xJQM8xqCXGmyq7OaP9w@mail.gmail.com>
 <2586e6ca-da28-ac87-35dc-dfa6ae66f67d@gmail.com>
 <35ebabef-46cc-f4d0-3e88-3d8f4243c685@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bd66b641-d11a-7794-ebe2-c7c4bbbc5208@xs4all.nl>
Date:   Wed, 24 Jul 2019 15:08:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <35ebabef-46cc-f4d0-3e88-3d8f4243c685@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGrRxIEtNnofZG4IehejPB6UtcHctIjpyFb5BixdRwFju20BHchzBJ29JfSSVYJapsts5sGBYuDFPLmysaE8WHJsgy3siw23wu4P1/0yOu5yZ1/lxdp3
 Fcu1OQv/iaXrGYYIIhxiOkb9P+1ofgCh6g2QtQ5eAx7XbrFJYaa49mQt58eYbEjVKjFLLmxgIgxQdpsDwGvprr0NJ8qd4FUEksLIVnbb5Yqv8k0DvWx85QSW
 Fkzan169VyhpTAlU9E2MlQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/24/19 2:25 PM, Mark Balançian wrote:
> Hi Ezequiel,
> 
> (sorry didn't include linux-media in first email)
> I'm not sure yet if I have my supervisor's permission to declare our 
> tool as open source, but I'll tell you the possible code paths that I 
> think may be leading our tool to think what it's thinking.
> 
> First off, it detects a write access to desc->virt without locks inside 
> tw686x_memcpy_data_free, after it is called in the calling chain 
> tw686x_probe -> allocate an interrupt line -> tw686x_video_init -> 
> tw686x_set_format -> tw686x_memcpy_dma_free.

Until the video device has been registered there is no need for locking
since there is no possibility of concurrent access.

 Further,
> spin_lock_init(&dev->lock) (line 319 of tw686x-core.c) isn't 
> correspondingly closed in the function. Is this intended?

Huh? spin_lock_init doesn't take a lock. It just initializes internal
data.

> 
> Second, there is a possibility according to how I have traced a call 
> chain that tw686x_init is going to the error: label since 

tw686x_init? I assume you mean tw686x_video_init?

> tw686x_memcpy_dma_free is getting called inside another possible calling 
> chain, going tw686x_init -> tw686x_video_free (error: label) -> 
> dma_ops->free (i.e. tw686x_memcpy_dma_free). I would assume this would 
> not be intended either.

What tw686x_video_free() does really should be done in the release function
of the video_device: vdev->release is currently set to video_device_release,
but that should be a custom function that calls dev->dma_ops->free.

> In addition, our tool detects a read access without locks to desc->virt 
> inside tw686x_audio_irq (line 72 of tw686x-audio.c). Not sure what you 
> make of that, but I'd be keen on hearing about that as well from you.

No locks should be needed for that.

It is still not clear what your actual problem is: do you have crashes
sometimes? Is there really something wrong?

Regards,

	Hans
