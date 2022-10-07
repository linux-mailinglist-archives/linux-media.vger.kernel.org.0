Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBC65F7749
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 13:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiJGLQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 07:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiJGLQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 07:16:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AEDB4888
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 04:16:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5674FB822AA
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 11:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951BEC433D6;
        Fri,  7 Oct 2022 11:16:30 +0000 (UTC)
Message-ID: <ce4853cf-1dae-b3d6-f3f1-f43dd15fe58d@xs4all.nl>
Date:   Fri, 7 Oct 2022 13:16:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3] media: visl: add virtual stateless decoder driver
Content-Language: en-US
To:     daniel.almeida@collabora.com
Cc:     linux-media@vger.kernel.org
References: <20221006181556.338845-1-daniel.almeida@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221006181556.338845-1-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On 10/6/22 20:15, daniel.almeida@collabora.com wrote:
> From: Daniel Almeida <daniel.almeida@collabora.com>
> 
> A virtual stateless decoder device for stateless uAPI development
> purposes.
> 
> This tool's objective is to help the development and testing of
> userspace applications that use the V4L2 stateless API to decode media.
> 
> A userspace implementation can use visl to run a decoding loop even when
> no hardware is available or when the kernel uAPI for the codec has not
> been upstreamed yet. This can reveal bugs at an early stage.
> 
> This driver can also trace the contents of the V4L2 controls submitted
> to it.  It can also dump the contents of the vb2 buffers through a
> debugfs interface. This is in many ways similar to the tracing
> infrastructure available for other popular encode/decode APIs out there
> and can help develop a userspace application by using another (working)
> one as a reference.
> 
> Note that no actual decoding of video frames is performed by visl. The
> V4L2 test pattern generator is used to write various debug information
> to the capture buffers instead.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
> 
> The visl decoder is meant as a tool to help developers working on the
> userspace stateless codec stack. It allows userspace code to run even
> when no hardware is available. It also offers tracing through debugfs
> and ftrace. It serves as yet another model for new drivers and it can be
> used in automated testing. In particular, it can be used with existing
> testing systems, one of which being the Chromium CQ.
> 
> The Chromium CQ runs test suites on submitted code before it can land in
> Chromium. Running the unit tests on a virtual machine will be made
> possible through visl. These are the same tests that are run on real
> hardware and they can be further enhanced to contain sanitizer builds.
> This means that memory leaks can be found in the Chromium stack in an
> automated way irrespective of hardware support.
> 
> Developing a second userspace stack from a working one is easier using
> visl. Its Ftrace-based tracing eliminates the cost of instrumenting the
> working stack, and provides the exact same output format for all runs.
> This is notoriously difficult to achieve with one-off printf-based
> instrumentations, as invariably these would differ slightly by printing
> out of order, or with slightly different format options, yielding a
> dirtier diff which would make debugging harder.
> 
> Note that the bitstream is not actually decoded by visl, the V4L2 TPG is
> used to generate a test pattern with useful info instead.
> 

Something else that I forgot to mention: it is a good idea to add
Documentation/admin-guide/media/visl.rst documentation. Basically
explaining how to use it, esp. the module options, debugfs and the
tracing facility. Similar to what exists for vimc and vivid.

Regards,

	Hans
