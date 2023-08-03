Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65A976E26C
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 10:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234185AbjHCIFR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 04:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234206AbjHCIEt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 04:04:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC54A76B3
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 00:55:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C3D7461C3A
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 07:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2625C433C8;
        Thu,  3 Aug 2023 07:55:30 +0000 (UTC)
Message-ID: <8d6daeb1-b62a-bbb2-b840-8759c84f2085@xs4all.nl>
Date:   Thu, 3 Aug 2023 09:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: smatch errors in ds90ub913
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

I discovered that this driver was disabled in the smatch build, and after I enabled
it I got these smatch errors:

drivers/media/i2c/ds90ub913.c:481 ub913_log_status() error: uninitialized symbol 'v1'.
drivers/media/i2c/ds90ub913.c:481 ub913_log_status() error: uninitialized symbol 'v2'.
drivers/media/i2c/ds90ub953.c:655 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
drivers/media/i2c/ds90ub953.c:655 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
drivers/media/i2c/ds90ub953.c:655 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
drivers/media/i2c/ds90ub960.c:1788 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.

That's also the case with the fixes PR for this driver that Sakari posted.

Can you take a look?

Thanks!

	Hans
