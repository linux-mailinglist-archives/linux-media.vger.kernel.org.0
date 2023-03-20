Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91D506C0E39
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 11:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjCTKIH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 06:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjCTKHu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 06:07:50 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264A512CF9
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 03:07:30 -0700 (PDT)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A20B660304E;
        Mon, 20 Mar 2023 10:07:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679306841;
        bh=Wl5qVlGzkeOW7u76GSCEXhtv9RYTkqoyWQbHGR31C3k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jW/1mOmA6Pe9shReCSCPgVZasYx+RAr+ZisdnYzDNTVuoXX6SmeOhfi4SSvHXOPdR
         Q9QWY9rU1n89nmju4Au6qRDkK0bNKfdm1jpzgXQioQU97jpOeqzkCstPuqS3WYaOO3
         he95TJ4/Y1r4lIf/6+m8OzFJeDWmPx7IuK062Zqey/dTXGauAdLUqJKZlsPLBCtlYO
         4yXs5BaMKLaMkM6fzfj/XMeHtfZ1tjEYhQNojybQ4H1xggHlk35tuWzCqn02RpgGCJ
         qdKl/yw4webPGxrsPnzwI9mpENU5+0D4Sm8nykaHazipkopagu9KCH2Bb+JIor8tKx
         V21TD9VxT5pqg==
Message-ID: <b6468072-834b-c948-3a27-e34fc80d203f@collabora.com>
Date:   Mon, 20 Mar 2023 11:07:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC 0/2] VP8 stateless V4L2 encoding uAPI + driver
To:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <20230309125651.23911-1-andrzej.p@collabora.com>
 <4586871.LvFx2qVVIh@archbox>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <4586871.LvFx2qVVIh@archbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

+Cc Benjamin

W dniu 18.03.2023 o 10:20, Nicolas Frattaroli pisze:
> On Thursday, 9 March 2023 13:56:49 CET Andrzej Pietrasiewicz wrote:
>> Dear All,
>>
>> This two-patch series adds uAPI for stateless VP8 encoding
>> and an accompanying driver using it.
>>
>> It has been tested on an rk3399 board and there exists
>> a gstreamer user:
>>
>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3736
>>
>> example pipeline:
>>
>> gst-launch-1.0 videotestsrc num-buffers=500 !
>> video/x-raw,width=640,height=480 \ ! v4l2slvp8enc ! queue ! matroskamux !
>> filesink location=test_vp8.mkv
>>
>> I kindly ask for comments.
>>
>> Notably, the documentation for the added uAPI is missing,
>> that is to be addressed when sending a patch series proper (not RFC).
>>
>> For the RFC I also did not care to replace a BUG_ON() in the boolean
>> encoder.
>>
>> Rebased onto v6.2.
>>
>> Regards,
>>
>> Andrzej
> 
> Hello,
> 
> I can't offer much in terms on technical comments on the implementation,
> but thank you for your work on this. A more general question: Is the
> rate control done by the userspace component or the kernel or even the
> hardware?
> 
> I tried this patchset (and the gstreamer merge request) out last night
> and ran into quite noticable i-frame pulsing, and am wondering who the
> culprit of that is. Looking at the vp8 encode params in the uAPI, it
> looks like it'll be userspace in charge of rate control?
> 

Yes, rate control is entirely on userspace.

Modern codec specs (not just vp8) only mandate what constitutes a valid
bitstream and how do decode it. No word about encoding, which means that
actually many different strategies can be applied to produce a valid
bitstream. As such, these strategies look a lot like policies which do not
belong to the kernel and I'd rather provide a tool than a policy.

As far as I know the rate control mechanism used in the gst element is
nothing sophisticated, not even a (full) PID algorithm. Which, I think,
was exactly intended to get the thing running in the first place. I would
assume that the expected algorithm would be PID proper in this case.
Specifically, PID being PID will not prevent the encoding stack from
overrunning the set bandwidth for short periods of time, but exactly
because rate control belongs to userspace anyone is welcome to develop
a solution which provides hard bandwidth guarantees.

> On a related side note, since I let this run all night with different
> parameters I can happily report that it seems to be quite stable, no
> problems encountered at all.

Thank you for reporting. In the (expected) case this turns into a
patchset proper I would kindly ask for your Tested-by then.

Can you share what you used for the nightly tests, both in terms of
testing harness and unencoded video material?

Regards,

Andrzej
