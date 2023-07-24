Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 532FB75EC27
	for <lists+linux-media@lfdr.de>; Mon, 24 Jul 2023 09:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjGXHCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jul 2023 03:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjGXHCb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jul 2023 03:02:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6E8D2
        for <linux-media@vger.kernel.org>; Mon, 24 Jul 2023 00:02:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 15FE260F36
        for <linux-media@vger.kernel.org>; Mon, 24 Jul 2023 07:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC9DC433C7;
        Mon, 24 Jul 2023 07:02:27 +0000 (UTC)
Message-ID: <b7c26317-2723-b8b7-0adb-c513be96fa99@xs4all.nl>
Date:   Mon, 24 Jul 2023 09:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [GIT PULL FOR v6.6] Various codec fixes/enhancements
Content-Language: en-US
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Juerg Haefliger <juergh@gmail.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Ming Qian <ming.qian@nxp.com>, Zheng Wang <zyytlz.wz@163.com>,
        Emma Christy <emma.t.christy@gmail.com>
References: <540fbe91-5dc4-1c75-379d-1ff89669ba96@xs4all.nl>
 <CAGXv+5EGpNTgp-cjmmdCfYps-y_7ycjwaGWCrGrBEA5=dfKvVQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAGXv+5EGpNTgp-cjmmdCfYps-y_7ycjwaGWCrGrBEA5=dfKvVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/07/2023 05:57, Chen-Yu Tsai wrote:
> Hi Hans,
> 
> On Fri, Jul 21, 2023 at 7:04 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> The following changes since commit 28999781d15f94046e6c23a9a7d92ad28a436abf:
>>
>>   media: i2c: ov01a10: Switch back to use struct i2c_driver::probe (2023-07-19 12:57:51 +0200)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6e
>>
>> for you to fetch changes up to 9c2d629e7ea3d5c5d5c1203b3aaa9807053d0c7d:
>>
>>   media: amphion: ensure the bitops don't cross boundaries (2023-07-21 12:27:38 +0200)
>>
>> ----------------------------------------------------------------
>> Tag branch
>>
>> ----------------------------------------------------------------
>> Benjamin Gaignard (1):
>>       media: rkvdec: increase max supported height for H.264
>>
>> Chen-Yu Tsai (1):
>>       media: mtk-jpeg: Set platform driver data earlier
> 
> This really needs to be merged for v6.5, as I mentioned in the footer.

I missed that, thank you. Posted updated PRs.

Regards,

	Hans
