Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D62E70F64A
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjEXMY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 08:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjEXMY5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:24:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D71399
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:24:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D56A86321C
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 12:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07280C433EF
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 12:24:54 +0000 (UTC)
Message-ID: <8edc6883-de23-329f-c5ab-f32875c4e4a9@xs4all.nl>
Date:   Wed, 24 May 2023 14:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.5] Various fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 8bc27fa5d7763d376a992a1638475987ed4807e7:

  docs: uapi: media: ignore new DVB-S2X FEC values (2023-05-15 06:46:17 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.5f

for you to fetch changes up to a65431e72cac3d63e727ca7bdaf278e99eb85ff0:

  staging: media: atomisp: init high & low vars (2023-05-24 14:13:10 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (3):
      media: cec: core: disable adapter in cec_devnode_unregister
      media: cec: core: don't set last_initiator if tx in progress
      staging: media: atomisp: init high & low vars

 drivers/media/cec/core/cec-adap.c                  | 8 ++++++--
 drivers/media/cec/core/cec-core.c                  | 2 ++
 drivers/media/cec/core/cec-priv.h                  | 1 +
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 4 ++--
 4 files changed, 11 insertions(+), 4 deletions(-)
