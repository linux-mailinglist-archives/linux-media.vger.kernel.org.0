Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB1C532704
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 12:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236015AbiEXKD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 06:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbiEXKD4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 06:03:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E48573546
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 03:03:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C2A360BAA
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 10:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F093C34100
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 10:03:53 +0000 (UTC)
Message-ID: <32288c08-3220-25ce-36e2-7c98ff81a264@xs4all.nl>
Date:   Tue, 24 May 2022 12:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] media_build git repo no longer maintained
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

Hi all,

This is to announce that I stopped maintaining media_build.git
(https://git.linuxtv.org/media_build.git/). I made the last fixes
for this compatibility build system today, and verified that it
compiles for both the current staging tree (commit 340ce50f75a6)
and the v5.18 kernel release. I have tagged the last media_build
version with the label 'for-v5.18'.

It is able to make compatibility builds for kernels 4.4 to 5.17,
although all I can guarantee is that it compiles, if it actually
works is a very different matter. Some recent reports suggest that
it might not actually work for old kernels anymore.

The need for compatibility builds has greatly diminished since it
was means for regular amd64/i686 distros where newer USB and PCI
drivers were missing support in the distro's kernel. But new USB and
PCI media drivers are rarely added these days, and distros tend to
be a lot closer to mainline than was common many years ago.

Maintaining media_build became too time consuming, and since it is
rarely used these days I decided to stop working on this.

The daily build will also stop building this. Which should reduce my
electricity bill as well :-)

If someone wants to continue maintaining this for some reason, then
please contact me.

Regards,

	Hans
