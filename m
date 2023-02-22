Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76E2A69F6AB
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 15:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbjBVOg3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 09:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjBVOg2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 09:36:28 -0500
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7D32C3B0FC
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 06:36:22 -0800 (PST)
Received: from [192.168.42.220] (host-178-72-203-9.ip.nej.cz [178.72.203.9])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 2DCDFB019
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 15:36:20 +0100 (CET)
Message-ID: <75ea622a-1e61-c6f8-7afa-e2dbbf8949a2@gpxsee.org>
Date:   Wed, 22 Feb 2023 15:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     linux-media@vger.kernel.org
From:   =?UTF-8?Q?Martin_T=c5=afma?= <tumic@gpxsee.org>
Subject: Question: kernel test robot git trees
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
Since some time, I'm trying to submit our mgb4 V4L2 driver:
https://patchwork.kernel.org/project/linux-media/patch/20230207150119.5542-2-tumic@gpxsee.org/

The driver requires a DMA sub-driver (xdma) that was only available in
the dmaengine mailing list until recently. It was merged into the
dmaengine/next git tree
(git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git) few
days ago so I could now theoretically resend it with a base-commit of
that branch. But will this help/make any sense? As far as I understand
the process, the test robot will not know the git tree anyway as it is
configured only for a special list of git trees.

Is there a way how I can/shall resubmit the patch that will help with
the review process? I'm aware that our driver can only be included in
Linux when the xdma driver is already merged into the master tree, but
I'm also a little bit afraid that the kernel test robot build fail can
make people ignore the patch until the xdma merge happens and the review
process will take longer than required. Any suggestions?

Martin Tůma
