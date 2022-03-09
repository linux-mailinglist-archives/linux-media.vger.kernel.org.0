Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 470C94D2FFC
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 14:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbiCINe0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 08:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiCINeZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 08:34:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DE313CA09
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 05:33:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4E334B82165
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 13:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285EAC340E8;
        Wed,  9 Mar 2022 13:33:21 +0000 (UTC)
Message-ID: <c662ab37-6e47-59f1-0bbc-4003b905f70a@xs4all.nl>
Date:   Wed, 9 Mar 2022 14:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [bug report] media: amphion: add vpu core driver
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>, ming.qian@nxp.com
Cc:     linux-media@vger.kernel.org
References: <20220309104337.GA29869@kili>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220309104337.GA29869@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 3/9/22 11:43, Dan Carpenter wrote:
> Hello Ming Qian,
> 
> The patch 9f599f351e86: "media: amphion: add vpu core driver" from
> Feb 24, 2022, leads to the following Smatch static checker warning:
> 
> 	drivers/media/platform/amphion/vpu_core.c:654 vpu_core_probe()
> 	warn: pm_runtime_get_sync() also returns 1 on success

Odd, I didn't get this warning when I ran smatch.

I'm running smatch from the master branch of git://repo.or.cz/smatch.git.

To be honest, I don't see the string 'also returns' at all in the git repo.

I'd really like to see this warning since it's so easy to get pm_runtime_get_sync()
wrong, and to miss it as a reviewer as well.

Regards,

	Hans
