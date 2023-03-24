Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA0A6C7E9B
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 14:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbjCXNSi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 09:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCXNSh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 09:18:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F3E10261
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 06:18:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F224762AD7
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 13:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CCCC4339B;
        Fri, 24 Mar 2023 13:18:34 +0000 (UTC)
Message-ID: <71d4adac-e844-aec0-e7e4-b47900cc940a@xs4all.nl>
Date:   Fri, 24 Mar 2023 14:18:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: cec-ctl does not monitor key presses from my tv remote control
Content-Language: en-US
To:     John 1000 <john1000@telfort.nl>
References: <1216962218.457209.1679601732095@kpc.webmail.kpnmail.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <1216962218.457209.1679601732095@kpc.webmail.kpnmail.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

On 23/03/2023 21:02, John 1000 wrote:
> Key presses from my televison remote control via CEC are not being monitored by cec-ctl -m.
> I use the HDMI port next to the headphone jack from my Raspberry Pi 4B
>  
> cec-ctl -d/dev/cec1 --tv -S | grep Philips
> gives
> Vendor ID : 0x00903e (Philips)
>  
> cec-ctl -d/dev/cec1 --test-power-cycle
> turns the TV on and off in a cycle.
> => CEC works correctly.
>  
> I also tried cec-ctl -d /dev/cec1 -M which returns:
> Monitor All mode is not supported, falling back to regular monitoring
>  
> In the past I used cec-client, which showed the key pressses.
>  
> Will monitoring key presses from a remote control be possible in the future?

I don't see anything in the code that would suggest that it doesn't pass
on received key presses.

What's the output of 'cec-ctl -d /dev/cec1'?

And why do you configure it as a TV? I assume this is the video source
to the TV, so this would typically be 'cec-ctl -d/dev/cec1 --playback'.

Regards,

	Hans
