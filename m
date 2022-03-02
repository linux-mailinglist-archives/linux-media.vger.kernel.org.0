Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55DA84CA0E3
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 10:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240546AbiCBJcr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 04:32:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240597AbiCBJco (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 04:32:44 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7CA9BDE59
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 01:31:51 -0800 (PST)
Received: from localhost (unknown [IPv6:2a02:3030:d:b7a5:8b71:bf50:4a7d:6a8b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sebastianfricke)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5DB801F4451F;
        Wed,  2 Mar 2022 09:31:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1646213510;
        bh=MsyW8coBQyTi8T0fSSVSM3Iz22/ieeF7xQkA5lyqq2A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VV/ssbyQIOBdP3+6nOIVQXN4ofO307Nm6bqadVoObn6Wblozhhuha+BDklyxy81Gt
         RGFiU3sNRvpJ4fuJbj4/zdII4ltbIWOiJzCZIaDZoQtkQKK0VQEhOeCxuZb+joDSvc
         EC9MsjudKNcpvvYPdZL+3JIn+msI8v2HCuCdJgPDr4iSPGIIhkTl8mr2bMcmp7zkMa
         tW6Nrq//kEM6zD1Zgsx3uYM/PGT8KGE8++DDcvsd54gIDBCAHyJIbYpRZVF+0MOXgI
         cmw+Y5FvXZsr++U7OofelVMmh8y7ZO8nQgoYi33ksX7nWABnPf8LQBeOaeZHp5uL1Y
         gKg81BPgdBx+w==
Date:   Wed, 2 Mar 2022 10:31:46 +0100
From:   Sebastian Fricke <sebastian.fricke@collabora.com>
To:     Clemens Arth <clemens.arth@gmail.com>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: RockPro65 RK3399 chipset, ISP and IMX214 camera
Message-ID: <20220302093146.esmu6qkyg7mcaep3@basti-XPS-13-9310>
References: <dbb69fc2-d46f-ee91-d089-46e7370a2a14@gmail.com>
 <164570696256.4066078.10553504447380276248@Monstersaurus>
 <CAPuf0ENRRjMafZUOXS45PJxQrpcK_tdCRREoHn43t54pSbVhDg@mail.gmail.com>
 <411433596.ldbydfAV7o@phil>
 <CAPybu_2ZwYBLy13KAbznErGU-2=hLcot081WE7ZLZbZaEwC0ag@mail.gmail.com>
 <dc0a22f7-80c3-12b9-d3ec-38fdf51e374c@gmail.com>
 <CAPybu_0j6csK29_LNDZwmu2Xxs+tLPD3QGqxktgpj-=BKO8G-A@mail.gmail.com>
 <6d75fd81-e6da-966b-ce50-32bd1749411e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <6d75fd81-e6da-966b-ce50-32bd1749411e@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Clemens,

On 02.03.2022 09:43, Clemens Arth wrote:
>Hi all,
>
>so I have good news. With the help of one of the pinetab developers, I 
>finally managed to get a working DT together. I did not realize I had 
>to use another clock to drive it, but the rest of the DT was already 
>ok.

That is good to hear, congratz.

>
>While I played around with the IMX driver trying to improve it, I 
>finally went back to the current mainline branch version testing it 
>with the rkisp1 and - voila! - the large 13M res does not work, but 

Oh that sounds very familiar I worked on a fix for this for a while as I
had the same problem with OV13850:
https://patchwork.kernel.org/project/linux-media/patch/20210329061637.14921-1-sebastian.fricke@posteo.net/

I haven't finished it yet, as I stopped working on the OV13850.
If you want to you can finish the patch, the remaining problem was that
result should be centered automatically.
I remember that one issue with the high resolution format were the very
low FPS (15).

>the 1920x1080 worked out immediately, using the pure command-line 
>config of media-ctl and video-ctl - the libcamera refuses operation 
>due to the missing database info and the lack of certain caps in the 
>driver.

Can you add your log to the mail?

>
>There are a few things on my list though and I wanted to hear your 
>thoughts before I move on now.
>
>1) First of all, the image seems to be very badly balanced in terms of 
>color and brightness. I assume it has to do with not properly 
>adjusting parameters of the camera. I did not play around with it, as 
>I have no graphical user interface on the board - it would make more 
>sense I do that once I am able to visualize changes in real-time. 
>@Ricardo, would you be willing to review changes I do to the IMX214 
>driver in the kernel based on the application guide I shared earlier? 
>As I'm not a driver guy AT ALL, fixing things for me might break 
>things for others, and I don't know how to verify that without having 
>anyone else to check (I mean, do more than just code review, 
>probably).

Could you provide a link to a frame via imgur or something similar?

>
>2) The DT overlay - it is nice that I have it now, but I had to put 
>everything together myself - should I contribute it into mainline (or 
>armbian), does that make sense and what is the procedure?
>
>3) I don't have any other camera to work with, as I just ordered FPC 
>FCC pinouts for 24-pin cams and have to rewire/solder a converter for 
>the RockPro64. That might happen as soon as I get them from China - no 
>Amazon or anything available right now. Still the DT seems to be the 
>most valuable part of all of this right now.
>
>4) The libcamera fix - I saw lc_compliance and gst-video work already 
>after a few minor copy/paste fixes, but by pulling the driver from 
>mainline broke it again expectedly. What's the plausible roadmap? 
>Fixing libcamera alone resorts to fixing 10 lines of code probably, 
>but that does not make sense without fixing the IMX214 driver in the 
>kernel first, right?

This is also a bit to vague, please provide logs that describe your issues.
What did you fix, can you maybe provide a diff/patch?

>
>Best
>Clemens

Greetings,
Sebastian
