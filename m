Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC32A78B1CF
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 15:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjH1NaI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 09:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjH1N3s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 09:29:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0A2A7
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 06:29:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 632CE64408
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 13:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB30C433C8;
        Mon, 28 Aug 2023 13:29:43 +0000 (UTC)
Message-ID: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
Date:   Mon, 28 Aug 2023 15:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, nl
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxtv-ci@linuxtv.org
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Introducing build scripts to test
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

We have been working on simplifying the media maintenance, and one part of that is
standardizing on build tools, in particular to make it easier for patch submitters
to run their patches through the same set of tests that the daily build does.

This helps detect issues before you submit your patches.

I have been working since July on transforming my hackish scripts to something
that is easier to use and of better quality. While there are still a few rough
edges, I consider it good enough to have others start to use it.

To get the build scripts run:

git clone git://linuxtv.org/hverkuil/build-scripts.git

All the test builds will happen within this directory. It is completely separate
from where you do you normal development, instead you point it to where your
git repository is.

See the README contained in the build-scripts git repo for all the details on
how to set it up.

Currently the scripts expect a debian 12-based distro (likely debian 11 will work
as well). I have no idea if it works well on Red Hat or Suse. If you use one of
those distros, and you get it to work, then a patch updating the README file with
the correct list of packages to install would be welcome.

Please note that running the regression tests using virtme-ng is currently only
supported on Debian 12, not on e.g. Ubuntu. Someone is looking into that, and
hopefully we can support that in the future. Running regressions tests are
primarily useful when making changes to core frameworks and public APIs, and
it is possible to run them manually (see the README).

Since running this locally can take a fair amount of time, we hope to have
build servers available in the future so this can be offloaded.

To give an idea of the expected build times:

On an AMD Ryzen 9 6900HX (8 cores) a standard build of the staging tree
(build.sh -test all) takes 39 minutes.

On an AMD Ryzen Threadripper 3970X (32 cores) it takes a bit over 13 minutes.

Regards,

	Hans
