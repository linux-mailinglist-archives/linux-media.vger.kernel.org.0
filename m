Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C338C6C7CC7
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 11:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjCXKku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 06:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjCXKks (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 06:40:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5B5E3AB
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 03:40:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DC221B82277
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 10:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466CDC433D2;
        Fri, 24 Mar 2023 10:40:43 +0000 (UTC)
Message-ID: <6c5433ff-a6c8-10f3-789b-bc231291c642@xs4all.nl>
Date:   Fri, 24 Mar 2023 11:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: saa7146: please test the vb2 conversion!
Content-Language: en-US
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Stefan Herdler <herdler@nurfuerspam.de>
Cc:     linux-media@vger.kernel.org, Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
 <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
 <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
 <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
 <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
 <c735aadc-80cd-9332-6661-638cad63afa2@xs4all.nl>
 <026b1342-2b0f-f61d-ea33-63f3992d1473@nurfuerspam.de>
 <20230208100847.3ec87576@coco.lan>
 <99397771-409b-e487-e429-d5c9feb82209@nurfuerspam.de>
 <016c57b2-8538-c630-b72f-a3c608c33a02@xs4all.nl>
In-Reply-To: <016c57b2-8538-c630-b72f-a3c608c33a02@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/03/2023 11:37, Hans Verkuil wrote:
> Hi all,
> 
> I finished the vb2 conversion and tested what I could test. I am missing
> 'full featured' hardware, so I could not test the analog video capture part
> of that. It's not clear to me if VBI capture is also supported on those
> cards, if so, then that needs to be tested as well.
> 
> Note that there is one userspace-facing change: the VBI output settings
> are kept, even if the vbi device is closed by the application.
> 
> Before you had to open the vbi device, format the slice VBI output, and
> write sliced VBI data to it. Closing the device would reset how VBI output
> behaves. That is not in spec with the V4L2 API. The format is kept after
> the device is closed.
> 
> Any application that uses VBI output and that wants to keep the same
> behavior would have to call VIDIOC_S_FMT with a struct v4l2_sliced_vbi_format
> with a service_set field set to 0 to indicate that you don't want to
> output any VBI anymore.
> 
> If this is a problem, then I can make a module option that selects the old
> behavior.
> 
> BTW, if anyone has a spare full-featured card (i.e. with analog video capture
> as well), then I would love to take it off your hands so that I can test that
> myself!
> 
> This series has been tested on the two Hexium boards, the mxb board, and two
> av7710 boards (DVB-C and DVB-T).

It does help if I point to the patches :-)

The patch series is here:

https://patchwork.linuxtv.org/project/linux-media/list/?series=10140

It's also in my git tree:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=saa7146-clean

Regards,

	Hans
