Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C18114D6253
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 14:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348876AbiCKNYF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 08:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238805AbiCKNYE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 08:24:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD6076E2F
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 05:22:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 59DE161E32
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 13:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC03C340E9;
        Fri, 11 Mar 2022 13:22:55 +0000 (UTC)
Message-ID: <857e12d1-a803-bb97-813d-02e4df0e237e@xs4all.nl>
Date:   Fri, 11 Mar 2022 14:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
To:     Dan Carpenter <dan.carpenter@oracle.com>
Content-Language: en-US
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: False 'uninitialized symbol' messages in latest smatch
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

Hi Dan,

With the latest smatch I get a lot of 'uninitialized symbol' errors that
all appear to be related to the use of the min/max/abs macros.

It's clearly seen here:

include/media/v4l2-rect.h:127 v4l2_rect_intersect() error: uninitialized symbol 'bottom'.
include/media/v4l2-rect.h:128 v4l2_rect_intersect() error: uninitialized symbol 'right'.

drivers/media/usb/uvc/uvc_v4l2.c:445 uvc_v4l2_set_streamparm() error: uninitialized symbol 'maxd'.
drivers/media/usb/uvc/uvc_v4l2.c:457 uvc_v4l2_set_streamparm() error: uninitialized symbol 'd'.

The logs of my daily media build from last night are here:

https://hverkuil.home.xs4all.nl/logs/Friday.log

Too many of these appear to be incorrect errors.

Can you take a look?

Regards,

	Hans
