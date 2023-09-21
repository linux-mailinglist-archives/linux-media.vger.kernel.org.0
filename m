Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 725627A96A4
	for <lists+linux-media@lfdr.de>; Thu, 21 Sep 2023 19:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjIURIH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Sep 2023 13:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjIURHw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Sep 2023 13:07:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3EB273A
        for <linux-media@vger.kernel.org>; Thu, 21 Sep 2023 10:05:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2EFC4E682;
        Thu, 21 Sep 2023 13:24:06 +0000 (UTC)
Message-ID: <143aedaf-aaed-4c2b-b4a3-86be93bf3184@xs4all.nl>
Date:   Thu, 21 Sep 2023 15:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Jenkins] stage-drivers-build #90: build failed for x86_64
 allyesconfig x86_64 allmodconfig x86_64 no PM
Content-Language: en-US, nl
To:     mchehab@kernel.org, media-committers@linuxtv.org,
        linux-media@vger.kernel.org, mchehab@linuxtv.org
References: <1290169131.3.1695300707458@builder.linuxtv.org>
 <1300942645.5.1695301504759@builder.linuxtv.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <1300942645.5.1695301504759@builder.linuxtv.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/09/2023 15:05, Jenkins Builder Robot wrote:
> Some tests failed:
> 	PASS: arm32 allmodconfig
> 	PASS: arm32 allyesconfig
> 	FAIL: x86_64 allyesconfig
> 	FAIL: x86_64 allmodconfig
> 	FAIL: x86_64 no PM
> 	PASS: arm64 allyesconfig
> 	PASS: arm64 allmodconfig
> 	PASS: clang15 allmodconfig
> 

These build errors are due to this:

../drivers/staging/media/omap4iss/iss_csi2.c: In function ‘csi2_init_entities’:
../drivers/staging/media/omap4iss/iss_csi2.c:1268:57: error: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size 22 [-Werror=format-truncation=]
 1268 |         snprintf(sd->name, sizeof(sd->name), "OMAP4 ISS %s", name);
      |                                                         ^~   ~~~~
../drivers/staging/media/omap4iss/iss_csi2.c:1268:9: note: ‘snprintf’ output between 11 and 42 bytes into a destination of size 32
 1268 |         snprintf(sd->name, sizeof(sd->name), "OMAP4 ISS %s", name);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Since these "may be truncated" warnings are now enabled, and apparently the kernel configs
for these targets have warnings being treated as errors, this now fails.

Regards,

	Hans


> GENERAL INFO
> 
> BUILD SUCCESSFUL
> Build URL: https://builder.linuxtv.org/job/stage-drivers-build/90/
> Project: stage-drivers-build
> Date of build: Thu, 21 Sep 2023 13:00:10 +0000
> Build duration: 4 min 54 sec and counting
> 
> 
> CHANGE SET
> 
>   	 Revision  by hverkuil: (media: atomisp: remove left-over videobuf include)
> 
> 	 change: edit drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> 
>   	 Revision  by hverkuil: (media: remove the old videobuf framework)
> 
> 	 change: edit Documentation/driver-api/media/v4l2-core.rst
> 
> 	 change: delete drivers/media/v4l2-core/videobuf-dma-contig.c
> 
> 	 change: delete drivers/media/v4l2-core/videobuf-core.c
> 
> 	 change: delete drivers/media/v4l2-core/videobuf-dma-sg.c
> 
> 	 change: delete include/media/videobuf-dma-sg.h
> 
> 	 change: edit Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
> 
> 	 change: edit Documentation/driver-api/media/v4l2-dev.rst
> 
> 	 change: edit drivers/media/v4l2-core/Makefile
> 
> 	 change: delete include/media/videobuf-core.h
> 
> 	 change: delete include/media/videobuf-dma-contig.h
> 
> 	 change: delete drivers/media/v4l2-core/videobuf-vmalloc.c
> 
> 	 change: delete Documentation/driver-api/media/v4l2-videobuf.rst
> 
> 	 change: edit drivers/media/v4l2-core/Kconfig
> 
> 	 change: delete include/media/videobuf-vmalloc.h

