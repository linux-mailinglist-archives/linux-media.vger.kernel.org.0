Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18025F5ECC
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 12:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfKILju (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 06:39:50 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:34293 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726146AbfKILju (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Nov 2019 06:39:50 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id TP5kiwap4PMT8TP5niPDcx; Sat, 09 Nov 2019 12:39:48 +0100
Subject: Re: [PATCH] media:usb:cpia2: Properly check framebuffer mmap offsets
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Omer Shalev <omerdeshalev@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191108215038.59170-1-omerdeshalev@gmail.com>
 <20191108204949.GA1277001@kroah.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a1c55e7d-4710-70e9-f4d0-8fc155197f07@xs4all.nl>
Date:   Sat, 9 Nov 2019 12:39:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108204949.GA1277001@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNAeKckKDRAZWl52xYYip05gsvA0m/eTA2Ae9CdaDm8OEnv7tiZbBlho0EmZRCVrcxlSEjXi5AZT2PF+bk0hXDYCQbNPr8Ws4Gg9Z6JGXgGVjcp+6hXC
 l3sQW6V9d8gxaloV2xX76pjm0Fee6MKjnnFn7+KnM9A+lqrc8LeksfmGAO9hB9IOv81nBJAh+9zJrjVpmTeHXfL6mAOHVh0C+4uxEb/2akxj+CgVWQd3rKHJ
 YV63xfKqufxTe18e1vlGKhPuV0AxHKXCdNHq3Fmf1rqvL0ax/UYORhm9tCxCI0hg2UM+KJ6lFSMKSbKYCAm2gznHObJZeVkErrBpiz95QT1YG46YY9YyeFaY
 0YmbCh16mNBsRXN/dBgHawYJotU6d3TiCv7KQmYdLCydW2BAEg63p/SMatHse8Annyo9+TWYSgPLpDbfXmlKp3NlyXxqgM65NcX9mxM30Ff2OZxMyTk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

On 11/8/19 9:49 PM, Greg Kroah-Hartman wrote:
> On Fri, Nov 08, 2019 at 09:50:36PM +0000, Omer Shalev wrote:
>> The cpai2 driver's mmap implementation wasn't properly check for all
>> possible offset values. Given a huge offset value , the calculation
>> start_offset + size can wrap around to a low value and pass the check
> 
> I thought we checked that in the core of the kernel now, to keep all
> drivers from not having to do this type of thing (as they obviously all
> forgot to.)  Why is this still needed here as well?

Where is that checked in the core? I couldn't find anything, but I might
have been looking in the wrong place.

Regards,

	Hans

> 
> thanks,
> 
> greg k-h
> 

