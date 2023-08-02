Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3465976C620
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 09:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjHBHLF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 03:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjHBHLE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 03:11:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55391FEF
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 00:10:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6C01661824
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 07:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC7DC433C8;
        Wed,  2 Aug 2023 07:10:56 +0000 (UTC)
Message-ID: <99feec9c-2bae-5850-bcae-6f4446d9c99d@xs4all.nl>
Date:   Wed, 2 Aug 2023 09:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Overview of remaining daily build errors/warnings
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The latest daily build has the following smatch issues:

drivers/media/i2c/ccs/ccs-data.c:524 ccs_data_parse_rules() warn: address of NULL pointer 'rules'

Sakari has a patch for that, but it fails some tests and it needs more investigation.

drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)

Hans de Goede is working on dropping atomisp-ov2680.c and using the mainline ov2680
driver instead, so once that's in this issue will disappear.

There is the following sparse warning:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

The siano driver embeds a struct urb in a larger struct, and that's wrong. It
should be allocated instead. Is there anyone who can look at this? Mauro, do you
still have siano hardware to test with?

There is also one warning indicating that two kernel configs are never compiled:

Check COMPILE_TEST: WARNINGS: VIDEOBUF_VMALLOC VIDEOBUF_DMA_CONTIG

This is pending the bttv driver vb2 rework: once that is merged, the old videobuf
can be removed and this warning will disappear. It's waiting for me to do final (?)
testing of the v3 of the bttv series.


Note that both sparse and smatch are updated to their latest versions whenever a
daily build starts, so if new checks are added to either project, then a new set
of warnings/errors can appear. It is, however, important to try and keep this as
clean as possible since while some are false positives, in most cases they catch
actual bugs.

If too many issues are reported, then it becomes hard to detect when a new patch
introduces new issues, and bugs will slip through (this happened to me just a few
weeks back).

If working around a false positive requires too much code, then is it best to reach
out to the sparse/smatch developers to see what can be done to improve the check.

Regards,

	Hans
