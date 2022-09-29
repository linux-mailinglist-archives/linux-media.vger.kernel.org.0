Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3445EFA06
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 18:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235310AbiI2QQl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 12:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236100AbiI2QQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 12:16:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE6A7E030
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 09:16:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 243D9B823E6
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 16:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4800FC433C1;
        Thu, 29 Sep 2022 16:16:22 +0000 (UTC)
Message-ID: <3a6676cb-98d7-e1de-0c34-904a38ea5440@xs4all.nl>
Date:   Thu, 29 Sep 2022 18:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.2] Four camss fixes
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

The following changes since commit d67614f276c1499ad939fa5c1aadd35498cc6b34:

  Merge fixes into media_stage (2022-09-27 10:27:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.2a

for you to fetch changes up to 26f2088165c4e6eb3eab1743e64ee0cd2a8a553f:

  media: camss: Split power domain management (2022-09-29 18:03:40 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Vladimir Zapolskiy (4):
      media: camss: Clean up received buffers on failed start of streaming
      media: camss: Do not attach an already attached power domain on MSM8916 platform
      media: camss: Collect information about a number of lite VFEs
      media: camss: Split power domain management

 drivers/media/platform/qcom/camss/camss-vfe-170.c | 20 +++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 20 +++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-video.c   |  3 ++-
 drivers/media/platform/qcom/camss/camss.c         | 61 ++++++++++++++++++++++++++++++++++++++-----------------------
 drivers/media/platform/qcom/camss/camss.h         |  1 +
 5 files changed, 79 insertions(+), 26 deletions(-)
