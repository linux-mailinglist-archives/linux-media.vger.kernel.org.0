Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F294366AD71
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 20:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjANTo4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 14:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjANToy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 14:44:54 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06871A5C9
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 11:44:52 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pGmSP-00HWDl-UE; Sat, 14 Jan 2023 19:44:49 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pGmSL-00ABdL-0L; Sat, 14 Jan 2023 19:44:45 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.3] uvcvideo changes (#88916)
Date:   Sat, 14 Jan 2023 19:44:44 +0000
Message-Id: <20230114194444.2427953-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Y8ME2oZc7SRlhBCP@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Y8ME2oZc7SRlhBCP@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/273347/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/Y8ME2oZc7SRlhBCP@pendragon.ideasonboard.com

Build aborted due to a fatal error:
FAILED: can't fetch patches from 1b929c02afd37871d5afb9d498426f83432e71c2 to fd957081cff04668f390c6f290bdcc7fc009a0f1
