Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E602216E07
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 15:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgGGNtR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 09:49:17 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:34527 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726745AbgGGNtR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jul 2020 09:49:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id snxJjDIFRBncFsnxMjwUKh; Tue, 07 Jul 2020 15:49:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594129755; bh=3CryfpPj5Do1ZItyekJki5G7lyvyg9roaY/6FR/l7/E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Rqugp7yQ/CKx1FGmR7a6Q1ONUb1RVVIkU6UjkXrXNY6TayT92yE05oC79rDuya6Jf
         6t89eeUzzGPjE2RWoOA93E0dGSKmZCr3ZWSvx0OLERcHFXPeE9/iJIJlVRSZ1WveSp
         NBJrs2Z05T2sXsHFQSyJEKrbhhDHcqUrMUBW/J37VNIndlIBB7H++Qy3xT6mjIagJY
         P92R2631AhOYlm9USSAiF7XDlsc5EaVUlw8v80Injr2JOWOHgMCX1iwlIYOt+43vI5
         HWF4wQi3yRudmAy7LxMZ8iRXFEQ+FfbkEN10rcMcmyzafLCV/0VQLtyJL3S72hwtji
         I5DWVcTjC1r6Q==
Subject: Re: v4l2-compliance tests for cache flags
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <CAPY8ntAogTZHd7Oh_7L+ghh4_DP9AzZ4DuJ9xChN_EmVbGXb1Q@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <34df23a8-6ab1-aaba-19f7-5193d18a60b0@xs4all.nl>
Date:   Tue, 7 Jul 2020 15:48:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntAogTZHd7Oh_7L+ghh4_DP9AzZ4DuJ9xChN_EmVbGXb1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOFmWP1UUcdSc7ZPjBSR9z4Iljsz8ASe+i1eLfCEog+f3Si3Cx0WOqacxvMVPKOEllJ5/3vAqdxog5U9/rLp/D0RZt/f3If1gTH5UvLl/TcJAIG2E3WI
 ksUDwXLy9xsJ0eElUMm5KpYtxuYU7bXP+gFMNBT2SUEmjZc3wVLK4OzvMUICpZmbfrpqK2Rm7S5tm8AOWF8y76QVFDSo49QbpgBiuSC4B729YaH30P5vSM2N
 02uP2ju9WbJ7ONwPuJU0fDR5ZPOf9OkBSGBGCudj7J+ZOvc2BZGp4Sg76jyNpeUr247/B3I+9izQ4wR6L+rprw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/07/2020 15:33, Dave Stevenson wrote:
> Hi Hans, Sergey, & the list.
> 
> I'm running the latest v4l2-compliance (85ec2917 "v4l2-compliance: fix
> stateful encoder tests") against the Raspberry Pi vendor 5.4 kernel
> tree. That means the kernel isn't supporting
> V4L2_BUF_FLAG_NO_CACHE_[INVALIDATE|CLEAN] flags on the buffers, nor is
> anything advertising V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS. I'm
> getting failures in setupMmap.
> 
> With patch "784be6a v4l2-utils: test cache_hints for MMAP queues" the
> test deliberately sets V4L2_BUF_FLAG_NO_CACHE_INVALIDATE and
> V4L2_BUF_FLAG_NO_CACHE_CLEAN on the buffers that it queues.
> Nothing in the kernel is expecting to manipulate those flags as the
> behaviour wasn't really defined before, but the test is failed if they
> aren't cleared. The v4l2 core would only clear them if the kernel
> includes the patch "f5f5fa7 media: videobuf2: handle V4L2 buffer cache
> flags", which currently means only linuxtv/master as that patch isn't
> even in 5.8-rc3.
> 
> Is it really valid to look at the V4L2_BUF_FLAG_NO_CACHE_* flags at
> all if V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS isn't set? If the
> capability isn't advertised, surely the state of those bits is
> undefined.

v4l2-compliance tests are in sync with our master and it expects that
that kernel is used.

It is possible in rare cases to add a version check (use the version
field returned by QUERYCAP) to determine if a feature is in the latest
kernel. It's not done anywhere in the current compliance test, but I'd
accept a patch that disables this test for kernels < 5.9 (since this feature
will land in 5.9).

Regards,

	Hans
