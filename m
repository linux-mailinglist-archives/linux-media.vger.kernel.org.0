Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D06BF6076F5
	for <lists+linux-media@lfdr.de>; Fri, 21 Oct 2022 14:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiJUMf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Oct 2022 08:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiJUMf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Oct 2022 08:35:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C021B4C52
        for <linux-media@vger.kernel.org>; Fri, 21 Oct 2022 05:35:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9974B61E5D
        for <linux-media@vger.kernel.org>; Fri, 21 Oct 2022 12:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7697C433C1
        for <linux-media@vger.kernel.org>; Fri, 21 Oct 2022 12:35:54 +0000 (UTC)
Message-ID: <dcbd69b9-2c45-7bf8-2c3f-c6bcfaf989cb@xs4all.nl>
Date:   Fri, 21 Oct 2022 14:35:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: cron job: media_tree daily build: ERRORS
Content-Language: en-US
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
References: <20221012031334.4D0E5C433D6@smtp.kernel.org>
In-Reply-To: <20221012031334.4D0E5C433D6@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

On 10/12/22 05:13, Hans Verkuil wrote:
> This message is generated daily by a cron job that builds media_tree for
> the kernels and architectures in the list below.

<snip>

> virtme: ERRORS: Final Summary: 3080, Succeeded: 3069, Failed: 11, Warnings: 0
> virtme-32: ERRORS: Final Summary: 3193, Succeeded: 3170, Failed: 23, Warnings: 0

For quite a long time now the regression tests kept failing in mysterious ways,
and I hope I have finally found the cause.

The test-media script that runs the regression has to load vivid and initialize
it in a few places:

	modprobe vivid n_devs=3 multiplanar=1,2,2 cache_hints=1,0,0
	sleep 3
	v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-cap -i3 -v width=3840,height=2160,pixelformat=NV24
	v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-out -o1 -x width=3840,height=2160,pixelformat=NM16

The two v4l2-ctl commands configure the third vivid instance so that it can be
used to export dmabufs that are large enough for use as import buffers elsewhere
in the scripts.

v4l2-ctl finds the media device and reads the topology to find the major/minor
numbers of the video device to use. Then it opens /dev/char/major:minor.

However, that can fail if CONFIG_DEBUG_KOBJECT_RELEASE=y. That makes everything
a lot slower, so after the 'sleep 3' above the /dev/char/major:minor symlink
hasn't been created yet by udev.

So even though the module was loaded, the udev rules weren't finished yet and
the v4l2-ctl commands failed. Therefor the tests that tried to export/import
dmabufs would fail because the buffers were too small. All this is of course
dependent on the speed of the CPU, phase of the moon, etc.

Increasing the sleep should fix this issue. Fingers crossed.

Regards,

	Hans
