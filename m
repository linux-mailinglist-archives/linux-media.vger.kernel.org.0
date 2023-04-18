Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9C26E5A70
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 09:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjDRH3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 03:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjDRH3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 03:29:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE093C0D
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 00:29:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF98E622CB
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 07:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44ECC4339B;
        Tue, 18 Apr 2023 07:29:10 +0000 (UTC)
Message-ID: <93737d84-cfa0-ece5-4115-afa8ae74299c@xs4all.nl>
Date:   Tue, 18 Apr 2023 09:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: atomisp compiler/sparse/smatch warnings
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Can you take a look at the warnings in the daily build that are atomisp
related?

https://hverkuil.home.xs4all.nl/logs/Tuesday.log

Thank you!

Regards,

	Hans
