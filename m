Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B74E33B133
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 12:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhCOLdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 07:33:03 -0400
Received: from mout01.posteo.de ([185.67.36.65]:56221 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhCOLc7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 07:32:59 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 809AC160061
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 12:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1615807977; bh=wraHZvQJ5jQQwCBLm/hm3X+rLqBjkW241ppRqSltWew=;
        h=Date:From:To:Subject:From;
        b=dDLIPCMVgeH8LN9zgtUzr580vxy4ebc0Bm9lgHYNZ1kNj3+cmDxM2vHVK2t2yO4hk
         4sYISbV4e2He5sNt9gI5VHuSOIAM11ZsYgPOpYHzt8JEh0DwOwMs12mcQJX1S/qgCi
         fliIeW8aK6zxhrqCFo6MwJziuinwt1whgSbBOfXHhvFIpUvG4qIeSR8jt8dTTcvm7k
         Wdr/JC7B9a+5bcaNGWUV7rOEX0HtAOQIxEywprrkfmYNuU6YLmH9wKT/d34NWGW0gg
         VyylmiR0KJE+OPBv0nXk7pmD5rEfpD4E8Ryh9BPRfSYzu8L4qtsaBj0axQWHB0xzEe
         PFZZng8Vn0ZKg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DzZ6J6PcXz9rxG
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 12:32:56 +0100 (CET)
Date:   Mon, 15 Mar 2021 12:32:56 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Subject: Definition for vertical/horizontal blanking and vertical/horizontal
 timing
Message-ID: <20210315113256.3ckjigj4vwoqs4r5@basti-TUXEDO-Book-XA1510>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I wanted to ask if you might be able to help me formulate a proper definition of the terms vertical/horizontal blanking and vertical/horizontal timing in the context of camera sensors. I have been searching quite a bit on the web and within the kernel documentation + kernel code. But I am not totally satisfied with the results, currently, I have this:
"Vertical blanking is the idle period after reading a frame and horizontal blanking is the idle period after reading a row, the terms stem from the past when a certain interval was required for the electron gun of a cathode ray tube to move back to the top of the screen or the start of the next line. Vertical timing is the total height of a camera's photosensor array and vertical blanking is the difference between the veritcal timing and the actively used height. The vertical blanking interval is used for reading buffers or for the ISP to process frames."

Sources: Documentation/userspace-api/media/v4l/func-read.rst, drivers/gpu/drm/drm_vblank.c, https://www.techopedia.com/definition/13467/vertical-blanking-interval-vbi

I maintain a small set of memory cards(https://www.memcode.com/courses/3184), where I work myself one concept at a time through the media subsystem and so I would like to get this information correct. :)
The current questions I have are:
- I found a lot of information in the context of GPU DRM do these
   information apply to camera sensors as well?
- Are there more things that happen within the vertical blanking
   interval than reading buffers and processing frames with the ISP?

Thank you in advance,
Sebastian
