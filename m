Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3C40788CC
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 11:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfG2Jq3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 05:46:29 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:42541 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726129AbfG2Jq3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 05:46:29 -0400
Received: from [IPv6:2001:983:e9a7:1:3159:f139:4aff:7185] ([IPv6:2001:983:e9a7:1:3159:f139:4aff:7185])
        by smtp-cloud9.xs4all.net with ESMTPA
        id s2EbheOcSAffAs2EdhgKYe; Mon, 29 Jul 2019 11:46:27 +0200
Subject: Re: build failures on ubuntu 16.04 (4.15.0.55.76)
To:     Vincent McIntyre <vincent.mcintyre@gmail.com>,
        linux-media@vger.kernel.org
References: <CAEsFdVMFa3qY5TdUTPqQ4=_cCx6ePzMOw31FLC+erR7_39hgFw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <54473f8a-2164-6350-5721-9347ec3630ad@xs4all.nl>
Date:   Mon, 29 Jul 2019 11:46:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAEsFdVMFa3qY5TdUTPqQ4=_cCx6ePzMOw31FLC+erR7_39hgFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDP5oMbePvnyBgyBIR3sA/aHMdFW3wctErWPUSjA3VKBN2pE5+kTpHZXIO5/BVrMRYTiJxn8tIF9PPwToQT8nDT33v679wYqO1Hb/5K8SMpGbsMr/8e4
 JleK3YS7WJoawNIdYu2afqoMuLlsmceh3IMCWADWyMHfPS8Q0uThlAtchZ4lgPcc4IawTO6ECN46n6a8twET/IRpOW80xhwxKOMU6DiVNK19yj8NIag2td1j
 //dX6ol8B79tlq5DaBojWbjXL4/VgvuMNv0G1+t/MJxVM8zOmw61/JpLkZen5SFHpniDgVgFbOHQYeT1KI7Wgg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/29/19 10:54 AM, Vincent McIntyre wrote:
> Hi,
> 
> I am getting build failures in v4l2-fwnode.c. I'm sending this because
> the daily build logs
> are not showing any errors for this kernel (version below).
> 
> I've tried flushing the git checkout and rerunning but I still get the failures.
> I can send a fuller log off-list if you like.

I just pushed a fix to the media_build git repo. Hopefully this will
fix the issue.

The cause was that I had CONFIG_OF defined in my tests, and you almost
certainly do not. So I never saw this failure.

Regards,

	Hans

> 
> /home/me/git/clones/media_build/v4l/v4l2-fwnode.c: In function
> 'v4l2_fwnode_endpoint_parse_csi2_bus':
> /home/me/git/clones/media_build/v4l/v4l2-fwnode.c:166:9: error:
> implicit declaration of function 'fwnode_property_count_u32'
> [-Werror=implicit-function-declaration]
>   rval = fwnode_property_count_u32(fwnode, "data-lanes");
>          ^
> /home/me/git/clones/media_build/v4l/v4l2-fwnode.c: In function
> 'v4l2_fwnode_endpoint_alloc_parse':
> /home/me/git/clones/media_build/v4l/v4l2-fwnode.c:527:9: error:
> implicit declaration of function 'fwnode_property_count_u64'
> [-Werror=implicit-function-declaration]
>   rval = fwnode_property_count_u64(fwnode, "link-frequencies");
>          ^
> /home/me/git/clones/media_build/v4l/v4l2-fwnode.c: At top level:
> cc1: warning: unrecognized command line option '-Wno-format-truncation'
> cc1: some warnings being treated as errors
> scripts/Makefile.build:339: recipe for target
> '/home/me/git/clones/media_build/v4l/v4l2-fwnode.o' failed
> make[3]: *** [/home/me/git/clones/media_build/v4l/v4l2-fwnode.o] Error 1
> Makefile:1552: recipe for target
> '_module_/home/me/git/clones/media_build/v4l' failed
> make[2]: *** [_module_/home/me/git/clones/media_build/v4l] Error 2
> make[2]: Leaving directory '/usr/src/linux-headers-4.15.0-47-generic'
> Makefile:51: recipe for target 'default' failed
> make[1]: *** [default] Error 2
> make[1]: Leaving directory '/home/me/git/clones/media_build/v4l'
> Makefile:26: recipe for target 'all' failed
> make: *** [all] Error 2
> build failed at ./build line 526
> 
> $ cat /proc/version_signature
> Ubuntu 4.15.0-55.60~16.04.2-generic 4.15.18
> 
> Also seen on
> Ubuntu 4.15.0-47.50~16.04.1-generic 4.15.18
> 
> $ git --no-pager log -1
> commit 5158c420e7a0929fa58c56ac437e274e8b1c37d1
> Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Date:   Fri Jul 26 09:26:30 2019 +0200
> 
>     Remove const from fwnode_property_count_u32/u64
> 
>     Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> 
> $ cd media;  git --no-pager log -1
> commit d2b4387f3bdf016e266d23cf657465f557721488
> Author: Eddie James <eajames@linux.ibm.com>
> Date:   Tue Dec 11 11:57:01 2018 -0500
> 
>     media: platform: Add Aspeed Video Engine driver
> 
>     The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs
>     can capture and compress video data from digital or analog sources. With
>     the Aspeed chip acting a service processor, the Video Engine can capture
>     the host processor graphics output.
> 
>     Add a V4L2 driver to capture video data and compress it to JPEG images.
>     Make the video frames available through the V4L2 streaming interface.
> 
>     Signed-off-by: Eddie James <eajames@linux.ibm.com>
>     Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>     Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> 
> Kind regards
> Vince
> 

