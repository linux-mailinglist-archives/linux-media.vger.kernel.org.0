Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFBF786FEF
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 15:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238945AbjHXNIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 09:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239004AbjHXNI0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 09:08:26 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15E7198A
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 06:08:23 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F1C1D86418;
        Thu, 24 Aug 2023 15:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1692882501;
        bh=nO7zXAD+fh+afIFBfu7isdOiAx5EKoa5ejHe8jheNz8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pRGyFn1iuyON8Kt63CjHWRnzePy/vHXXGJFylekjJsCwLQq3lWPBjU5q3bzx0CO03
         F6P0Ju/R/AdnGWDUjV8ZU8WJ5+b7EkKX6LTEilV38+uDWWLkQyChpwHEtdWTPXruFn
         vHno+axKUv5A6HGaHl3ikM16T0KD1zBtMc1m0gE0aP0lyFGMRTiF23UFsx7zFCGcSl
         nqJWKfKvF2Z1+l1seJE+Fpn0Z6SE1LSgeS2Tl3y0YgT0iHLTqR0XLp38TrJaZRNvpE
         XKUbHDkcnmIZaZV8RGoTC0ROeL7zi5i4x+vdjwC0zYiZPLd0s9r+jvttgmMsuNA6es
         LUl4DfMyoKLew==
Message-ID: <80d9a66f-c703-6057-e084-1a6d2214d775@denx.de>
Date:   Thu, 24 Aug 2023 15:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] media: hantro: Check whether reset op is defined before
 use
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-rockchip@lists.infradead.org
References: <20230824013858.303105-1-marex@denx.de>
 <CAHCN7xLDmMv7T_fT7vY3iq+KMWuPM9tBP_2AJ-X04L7ZTRWPOw@mail.gmail.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAHCN7xLDmMv7T_fT7vY3iq+KMWuPM9tBP_2AJ-X04L7ZTRWPOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/24/23 12:39, Adam Ford wrote:
> On Wed, Aug 23, 2023 at 8:39 PM Marek Vasut <marex@denx.de> wrote:
>>
>> The i.MX8MM/N/P does not define the .reset op since reset of the VPU is
>> done by genpd. Check whether the .reset op is defined before calling it
>> to avoid NULL pointer dereference.
>>
>> Note that the Fixes tag is set to the commit which removed the reset op
>> from i.MX8M Hantro G2 implementation, this is because before this commit
>> all the implementations did define the .reset op.
> 
> I am surprised I didn't have issues when I was testing the 8MQ and
> 8MM, but this makes sense.

You need to trigger the VPU watchdog to trigger the crash, that means 
you have to get the VPU into some weird state where it fails to decode 
frame. Then it triggers the reset and ... boom.

See this patch, that contains a gstreamer invocation to generate such 
trigger condition input data:

[PATCH] media: verisilicon: Do not enable G2 postproc downscale if 
source is narrower than destination

"
To generate input test data to trigger this bug, use e.g.:
$ gst-launch-1.0 videotestsrc ! 
video/x-raw,width=272,height=256,format=I420 ! \
                  vp9enc ! matroskamux ! filesink location=/tmp/test.vp9
To trigger the bug upon decoding (note that the NV12 must be forced, as
that assures the output data would pass the G2 postproc):
$ gst-launch-1.0 filesrc location=/tmp/test.vp9 ! matroskademux ! 
vp9parse ! \
                  v4l2slvp9dec ! video/x-raw,format=NV12 ! videoconvert 
! fbdevsink
"
