Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3257D697482
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 03:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjBOCol convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 14 Feb 2023 21:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjBOCok (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 21:44:40 -0500
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1881F113DA
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 18:44:38 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6586324E154;
        Wed, 15 Feb 2023 10:44:35 +0800 (CST)
Received: from EXMBX164.cuchost.com (172.16.7.74) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 10:44:35 +0800
Received: from [192.168.125.168] (183.27.97.168) by EXMBX164.cuchost.com
 (172.16.6.74) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 10:44:34 +0800
Message-ID: <88408947-90ef-258d-6763-67db6a5725b0@starfivetech.com>
Date:   Wed, 15 Feb 2023 10:44:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v11 0/6] Wave5 codec driver
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "kernel@collabora.com" <kernel@collabora.com>,
        "bob.beckett@collabora.com" <bob.beckett@collabora.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "nas.chung@chipsnmedia.com" <nas.chung@chipsnmedia.com>
References: <a336c17afc9143858fb9beb82aa800a8@EXMBX164.cuchost.com>
 <2829b86c409058fb566a6a398eedff96b76cf6fe.camel@collabora.com>
 <405b9c8f-707e-9009-dafc-277f48c30749@starfivetech.com>
 <9b4cec8a18d9cce377e7ad0bb7f8794c07ccf9b3.camel@collabora.com>
Content-Language: en-US
From:   Som Qin <som.qin@starfivetech.com>
In-Reply-To: <9b4cec8a18d9cce377e7ad0bb7f8794c07ccf9b3.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [183.27.97.168]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX164.cuchost.com
 (172.16.6.74)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2023/2/15 4:12, Nicolas Dufresne wrote:
> Hi Som,
> 
> Le mardi 14 février 2023 à 15:11 +0800, Som Qin a écrit :
>> Sure we will share the test stream we met issue, via Wetransfer net
>> disk. I'm not sure if this is a driver issue or a soc cache issue, it
>> not occurs with any stream. Hope you can clarify it.
> 
> thanks for the stream, I have shared them internally with Sebastian who will
> test them on his board (a TI board). We'll be able to confirm with you if we can
> also reproduce the issues there, and that will help regarding possible SoC cache
> issues.
> 

Thank you for help.

>>
>> It did run out the ram with h264_v4l2m2m if not do some modify, it
>> should be due to alignment.
> 
> What LibreELEC dev told me is that in absence of V4L2_CID_MIN_BUFFER_FOR*
> controls, ffmpeg will allocate too many buffers and cause ram issue. We will
> have this implemented in later update, so hopefully this problem will go away.
> 

Based on what I've tried, ffmpeg re-allocate buffers as the width/height 
was changed after VIDIOC_S_FMT/VIDIOC_G_FMT, with 1080P AVC.

>>
>> p.s. are you interested in using 7110soc for verification? We can
>> provide the board for it.
> 
> Can you provide a status of what has been fixed from the SoC revision found on
> BeagleV ? We stopped using the BeagleV for testing has it has SoC issue and no
> known workaround for.
> 

We are using board VisionFive 2, basically fixed the known soc issues in 
the old BeagleV. Wave511 work quite well with omx-il on the board.

Thanks.
Som

> regards,
> Nicolas
> 
