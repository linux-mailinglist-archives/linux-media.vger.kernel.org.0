Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75F6B66BB43
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 11:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjAPKJx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 05:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbjAPKJS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 05:09:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E4E1A97B
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 02:08:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D0B4FB80B14
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 10:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2A8C433D2;
        Mon, 16 Jan 2023 10:08:38 +0000 (UTC)
Message-ID: <86c7f052-152a-6199-5a00-2db7b3d7cad6@xs4all.nl>
Date:   Mon, 16 Jan 2023 11:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCHv2 00/16] staging/media: remove most deprecated drivers
Content-Language: en-US
To:     Corinna Vinschen <vinschen@redhat.com>
Cc:     linux-media@vger.kernel.org,
        Rudy Zijlstra <rudy@grumpydevil.homelinux.org>
References: <Y8UepVxVuihu4Vjj@calimero.vinschen.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <Y8UepVxVuihu4Vjj@calimero.vinschen.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Corinna,

On 16/01/2023 10:53, Corinna Vinschen wrote:
> Hi Hans,
> 
> I only learned about this yesterday, so I hope I'm not too late.
> 
> Please don't do that.  You're about to remove working drivers used by a
> lot of people.
> 
> If you remove them from the Linux kernel, you will leave *lots* of DVB-C
> and DVB-S card users behind.  They will update their TV recording
> machines to a newer system at one point and suddenly their ability to
> record from TV is gone forever.
> 
> I'm personally affected by this as well.  We're using a machine with
> four Technotrend S2-3200 Budget DVB-S2 cards for TV recordings using
> the VDR package.  This card is apparently handled by the code under
> drivers/staging/media/deprecated/saa7146.
> 
> If this code goes away, we will have to keep the machine running on
> an old kernel for a long time.
> 
> I'm fortunate that I even learned about this developement, being a
> developer myself, but how's a normal user to know that a Linux driver
> they are using every day is about to be removed from the kernel?  Again,
> please don't break the equipment of us users of these DVB-C and DVB-S
> cards for the future.  

I've dropped the PR for now. Is the concern specifically for the saa7146
based hardware?

I.e., from Red Hat's point of view, are there any concerns about removing
vpfe_capture, tm6000, zr364xx, stkwebcam, fsl-viu, cpia2 and meye?

The core problem with saa7146 (and the other deprecated drivers) is that
it is using the old videobuf framework, which has known problems and we
want (need!) to get rid of it, either by dropping drivers or converting
them.

One partial solution would be to drop analog video support from saa7146,
since that's the bit that uses this framework. DVB would remain working,
but analog video support would die, unless someone steps up to do the
conversion from vb1 to vb2.

So support for the old MXB, Hexium Gemini and Hexium Orion would die, but
for the other DVB devices it would stay alive.

I'm honestly quite surprised that these old DVB PCI cards are still in
use, I did not expect that.

Regards,

	Hans
