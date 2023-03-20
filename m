Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0A86C0D74
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 10:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbjCTJgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 05:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbjCTJgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 05:36:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A9D1EBDE
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 02:35:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C647D61297
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 09:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C916AC433EF;
        Mon, 20 Mar 2023 09:35:46 +0000 (UTC)
Message-ID: <72058b54-6d85-cd91-b557-f9f8b54ab3a7@xs4all.nl>
Date:   Mon, 20 Mar 2023 10:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: v4l-utils: dvb_frontend.h is copied to lib/include for some reason
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

When I tried to sync v4l-utils to the latest kernel I noticed that the
dvb-frontend.h header was copied by lib/libdvbv5/gen_dvb_structs.pl
from lib/include/libdvbv5/dvb-frontend.h to lib/include/dvb-frontend.h.

But no code uses it, and it does not seem to be installed anywhere either.

This was added in this commit:

commit cc4651d52dfea736cc7d6e32c939793da707ea1a
Author: Gregor Jasny <gjasny@googlemail.com>
Date:   Sun May 20 19:46:35 2012 +0200

    libdvbv5: Correct output paths of gen_dvb_structs and write missing header

Can I remove the copy line in gen_dvb_structs.pl? Or is it used for something
that I am not aware of?

Regards,

	Hans
