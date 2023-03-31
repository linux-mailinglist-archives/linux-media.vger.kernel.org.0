Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAD16D2238
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 16:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbjCaOTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 10:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbjCaOTE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 10:19:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D6B1E73C
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 07:18:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9335362686
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 14:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA23C4339B;
        Fri, 31 Mar 2023 14:18:53 +0000 (UTC)
Message-ID: <6e60952b-96f6-e510-3920-76f538180181@xs4all.nl>
Date:   Fri, 31 Mar 2023 16:18:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: v4l2-tracer: use of __FILE__
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

After switching over to meson the __FILE__macro adds '../utils/v4l2-tracer/' to the
filename (since it is compiling from a relative path).

It is nicer to use __FILE_NAME__ instead of __FILE__, but that is not available
for every compiler.

See https://git.linuxtv.org/v4l-utils.git/commit/?id=de7b731c4d4a191a530322d7c6dc42ba9c7c16d8

v4l2-tracer uses __FILE__ a lot, but that really should be modified to use a
macro, just like v4l2-compliance etc. do.

It's generally one of these two variants:

utils/v4l2-tracer/trace-helper.cpp:             fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
utils/v4l2-tracer/trace-helper.cpp:             fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);

It's rather ugly to see that duplicated some 60+ times.

Can you replace it with a macro or something? And use __FILE_NAME__ in the macro?

No hurry, but this definitely can be improved.

Regards,

	Hans
