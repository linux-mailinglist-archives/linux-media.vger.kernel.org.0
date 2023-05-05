Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE4F26F7D34
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 08:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjEEGpt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 02:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjEEGpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 02:45:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AECC160BD
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 23:45:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D076E63B8A
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 06:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5CBC433EF;
        Fri,  5 May 2023 06:45:42 +0000 (UTC)
Message-ID: <a02d481b-562c-803a-a71d-b8d95ba7ebb5@xs4all.nl>
Date:   Fri, 5 May 2023 08:45:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BTTV] [FSL P50x0] [PASEMI] TV Time doesn't work anymore after
 dropping the overlay support
Content-Language: en-US
To:     Christian Zigotzky <chzigotzky@xenosoft.de>,
        linux-media@vger.kernel.org
Cc:     Darren Stevens <darren@stevens-zone.net>,
        mad skateman <madskateman@gmail.com>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
References: <94a617be-00b3-6dc8-eb7d-ae13c6fffae5@xenosoft.de>
 <cb82b6c1-035c-cc6b-2843-6b87ed6315ac@xenosoft.de>
 <f23204ec-ff42-5907-fa28-c1975a87f4e6@xs4all.nl>
 <79ea7cc5-6981-a791-7fed-7a6e27225000@xenosoft.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <79ea7cc5-6981-a791-7fed-7a6e27225000@xenosoft.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2023 08:25, Christian Zigotzky wrote:
> On 02 May 2023 at 08:57 am, Hans Verkuil wrote:
>> If v4l2-ctl fails, then try again
>> after applying this series:
>>
>> https://patchwork.linuxtv.org/project/linux-media/cover/cover.1682995256.git.deborah.brouwer@collabora.com/
> Your patch series solved the issue. Thanks a lot!

Nice, but somewhat unexpected :-)

I'm a little bit unsure how to proceed: the 6.4 kernel will remove destructive overlay
support, but it won't have this series yet, that's for 6.5. But that would make 6.4
unusable for you.

I might have to revert the overlay removal, at least for bttv.

Regards,

	Hans
