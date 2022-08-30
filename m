Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5335A5B4A
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 07:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiH3F4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 01:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiH3F4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 01:56:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0399AFBC
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 22:56:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20523612E8
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 05:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D588BC433C1;
        Tue, 30 Aug 2022 05:56:29 +0000 (UTC)
Message-ID: <94c7cef3-e7b1-bbc7-e790-c6014a1fe482@xs4all.nl>
Date:   Tue, 30 Aug 2022 07:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To:     Neil Armstrong <narmstrong@baylibre.com>, mjourdan@baylibre.com
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: staging/media/meson/vdec compiler warning: how to fix?
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
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

Hi Maxime, Neil,

After upgrading to gcc-12.2 I now get this warning from gcc:

git/drivers/staging/media/meson/vdec/codec_vp9.c:2115:3:
drivers/staging/media/meson/vdec/codec_vp9.c:1689:41: warning: 'coef_node_start' may be used uninitialized [-Wmaybe-uninitialized]
 1689 |                         coef_node_start = coef_node_start + 1;
      |                         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
drivers/staging/media/meson/vdec/codec_vp9.c: In function 'codec_vp9_threaded_isr':
drivers/staging/media/meson/vdec/codec_vp9.c:1551:19: note: 'coef_node_start' was declared here
 1551 |         int node, coef_node_start, coef_count_node_start;
      |                   ^~~~~~~~~~~~~~~

coef_node_start can indeed be uninitialized because in the adapt_coef_probs()
function there is no final 'else' clause in the coef_count_node_start for-loop.

I can't tell if it should be there or if it is sufficient to just init
coef_node_start to 0.

A patch is welcome!

Regards,

	Hans
