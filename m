Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6E72CB0EE
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 00:35:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgLAXfK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 18:35:10 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44875 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726071AbgLAXfJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 18:35:09 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 30D0D5C016C
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 18:34:02 -0500 (EST)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Tue, 01 Dec 2020 18:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm3; bh=vEOO2v2QDn4IpSJUrT1RpNbXAEHhLaX
        CAQrs/ovbu10=; b=XFKBH0/DXrV9oNhlGZr2NGijVGYJjR1d+mEYswbwPa2dgYa
        dmCkYGUHM3y83vJqkWpWcmKMxmFMFqYJZQwLdx+XqBnviMO6I1JGIxmJbyzVjEwY
        rOa/ViliRM95FJcpSt86qzGBVueFtRduMXsvWEdpDibY/tQF1FeeJ6JIthfn83c2
        o4NQrTIgIZzzLYuQcxbsdz/RSptv8ly730Rf2+rBa6s14JGQniUhQjVyBr7h50tL
        nT/axR/ReSacZWCJFSYEKC+/Q6NabYzXNXTvTAULH5PXLi6Ri+OqeWq94ONxVlGq
        r0rHOgf8DRzGDZrUZO+ms8KqNa65i+p3D8HWS3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vEOO2v
        2QDn4IpSJUrT1RpNbXAEHhLaXCAQrs/ovbu10=; b=Ag3+ISEgUJ8019XMHDIVhD
        7P93CWOz8zeeEwhaoAirdqP/glXf/gDXGqsoUIWkzmzD29+OuubtJRJb/wscN88U
        KJl04zjg2EAyAJ13RPQTgy3iTBOlCKN58pqX+G4L3QOT7KM57Sws1vO1qWknrUft
        d6V3x63vn6c/6s4nbpVg/zGLN5cZdnjcLkl5yVzwBEhneS0AKlRHldFPEEkXihFc
        EfovSnQ5sE/w/LB901GU8DbZgxXOFb5j4KB4wob6WScX94aEfm9byLCkyParVr9E
        fHSqLUK3pcWbf/avmmxS1+z6DGWgnkt6h5w3qwvJTOpLh3NnL6v3Y6Ydgn/K9K6Q
        ==
X-ME-Sender: <xms:6tLGX32bpZIQLj4NOGlDIEYGGdjGABZf7WExiNVF0WcEo2hNPwAPFw>
    <xme:6tLGX2GeZz_fxWxrpp1HG-g-tsCbSn2uYAhMB61kDZ3-gB5_S8lvhBcKP7Di77ImL
    UratySuFEBSlGrNr08>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeifedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhs
    qeenucggtffrrghtthgvrhhnpeevgefhveevteetfeetkeejjeehudffffffhfeuffelhf
    euffdufeduleejfeeugfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:6tLGX37tNS74s7snF8yVbXAPtJB5vjiN-LKmE-dUMc3kqFy7Ryoi8w>
    <xmx:6tLGX82-YJl1_S_Dhm0WmNQGrg9pwajs6NU6VVvZAxT5zP8bG_IQuA>
    <xmx:6tLGX6Ev3SAVXWYs9Ta78olDaqk6As89YCYNtkjxzNRrjpcT-16hoA>
    <xmx:6tLGX-QYTWuYvqEKb9oeZcGqljckK76mz0LkTR6Dhf_hhVBr7x1ndw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 207DB6F6005E; Tue,  1 Dec 2020 18:33:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <27b538e4-0771-442b-8a56-991123c42ed8@www.fastmail.com>
In-Reply-To: <e692d867-54f1-4987-917c-1b0d39cf7ab3@www.fastmail.com>
References: <e692d867-54f1-4987-917c-1b0d39cf7ab3@www.fastmail.com>
Date:   Tue, 01 Dec 2020 17:33:40 -0600
From:   "Sid Spry" <sid@aeam.us>
To:     linux-media@vger.kernel.org
Subject: Re: Accelerated Video Capture on ARM
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 1, 2020, at 11:27 AM, Sid Spry wrote:
> I know this may depend on specific GPU core, but is there a way to
> do a screen capture? The usecase is capturing the video from an Android
> device, but a voiding the limited and poorly performing developer-oriented
> methods.
> 
> Thanks.
>

I made a small breakthrough and found the /dev/graphics/fb* devices.
Unfortunately many phones seem to create these but leave these unused.
The phone is a Motorola G7 based on a Snapdragon/Adreno chip. Is anyone
able to comment on how the screen buffer is accessed?

Thanks.
