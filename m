Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3E26C7CBD
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 11:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbjCXKho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 06:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjCXKhn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 06:37:43 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C5B2366C
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 03:37:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C9DBECE2488
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 10:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0ACC433EF;
        Fri, 24 Mar 2023 10:37:37 +0000 (UTC)
Message-ID: <016c57b2-8538-c630-b72f-a3c608c33a02@xs4all.nl>
Date:   Fri, 24 Mar 2023 11:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: saa7146: please test the vb2 conversion!
Content-Language: en-US
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <99397771-409b-e487-e429-d5c9feb82209@nurfuerspam.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I finished the vb2 conversion and tested what I could test. I am missing
'full featured' hardware, so I could not test the analog video capture part
of that. It's not clear to me if VBI capture is also supported on those
cards, if so, then that needs to be tested as well.

Note that there is one userspace-facing change: the VBI output settings
are kept, even if the vbi device is closed by the application.

Before you had to open the vbi device, format the slice VBI output, and
write sliced VBI data to it. Closing the device would reset how VBI output
behaves. That is not in spec with the V4L2 API. The format is kept after
the device is closed.

Any application that uses VBI output and that wants to keep the same
behavior would have to call VIDIOC_S_FMT with a struct v4l2_sliced_vbi_format
with a service_set field set to 0 to indicate that you don't want to
output any VBI anymore.

If this is a problem, then I can make a module option that selects the old
behavior.

BTW, if anyone has a spare full-featured card (i.e. with analog video capture
as well), then I would love to take it off your hands so that I can test that
myself!

This series has been tested on the two Hexium boards, the mxb board, and two
av7710 boards (DVB-C and DVB-T).

Regards,

	Hans
