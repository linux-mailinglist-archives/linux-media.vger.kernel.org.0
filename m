Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2CA859F5BE
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 10:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbiHXIwG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 04:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236167AbiHXIv7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 04:51:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DE277E9D
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 01:51:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0CAE86174F
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 08:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58209C433D6;
        Wed, 24 Aug 2022 08:51:47 +0000 (UTC)
Message-ID: <a5f92600-a8c9-08f6-5145-03efd7f86ad9@xs4all.nl>
Date:   Wed, 24 Aug 2022 10:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 1/7] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Content-Language: en-US
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Yunke Cao <yunkec@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20220628075705.2278044-1-yunkec@google.com>
 <20220628075705.2278044-2-yunkec@google.com>
 <7b59fffc-fb69-dc87-c3cf-4e01632154f4@xs4all.nl>
In-Reply-To: <7b59fffc-fb69-dc87-c3cf-4e01632154f4@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 24/08/2022 10:50, Hans Verkuil wrote:
> Hi Yunke,
> 
> You will need to rebase this since some of the v4l2-ctrl internals
> have changed.

Rebase to git://linuxtv.org/media_stage.git, master branch, to be precise.

	Hans
