Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D83D2CB16E
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 01:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgLBAYn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 19:24:43 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58503 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726484AbgLBAYn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 19:24:43 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 0855B5C01EF
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 19:23:37 -0500 (EST)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Tue, 01 Dec 2020 19:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm3; bh=nZqapTM0e4sGsVRp03fp435NJ/8gomX
        bhTrJueflsoA=; b=KwpvGt40ijmPSX5nqzIc4JbH1upaXX+hw5DyHtpyOdgHY1l
        mm11iV1NhBBSGndQvUJOBQSXTcbYysUw8mYNFrNCYWaN9C/kvIDB0RqZZL24aIk2
        ITQB+iuGqFDT8BgteJpIKCmDM26CAlwUAtdiXKc0QqUN/mctXCm/oT6tvrtbivPD
        DWT8YN3KeBBX7hLUD9Q7EXLBUMeKCAOcmHHEQQELj3hjaBtUltnLNAi5/s+ZMPhl
        tSC41G+9SfNjiDjUzeoM0DH/ANyszdp4tAem0bi6wpfkghN7KWBApjNVtnhIUdPI
        MXMbIhdhyMNw+keJlWMO0f1kpkQFdqZa7wIYBSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nZqapT
        M0e4sGsVRp03fp435NJ/8gomXbhTrJueflsoA=; b=n1D+g/7MqtVf5/i6RIC3h6
        th9bCk1e5bmlF9HGqAI/R1OAhzDiIOmDo+x03w8S/GZcD7FUzV2gpjO/LTydc27/
        s99ZZJALSBo3HfB5KKFTe/cqo0hfpQKNy8Nwswub6bBQ0SlfWGtqhvC14YPaoCH/
        p9pKTKbICEGvGFwWk3BCXKgZg3gAEtxfwdSFWn65t0JH0EVa4JVg/JI2mXgGUIvE
        aD/MRZfxKV0ykT9jQKqBu8EEd52IMkjZf8izAAA8Uhv+ipTbRrZs4LyMaSIQQlO0
        0z7XAVe9uONwbDARpRiCgLH5ZDcWtGLJtxBtBtngfysCBjwJ6uf+vagOtv57tAsw
        ==
X-ME-Sender: <xms:iN7GX2XDZU4lHp7TBKIw5UexjXAbc0WdaOkWUwFyXRETOEHMhc-VvQ>
    <xme:iN7GXykM882fHrtNIfz8uSyKwkG5KzU9pD-pjNZaXqw79Ftf6AHTc_HAslIawejZE
    78Wr4Dg3YGn-8L4k1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeifedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhs
    qeenucggtffrrghtthgvrhhnpefhjeeigfdvhfeiffekgfekveduudeugfdujedvgfeije
    euteffkeffhfdvgfeiffenucffohhmrghinhepghhoohhglhgvshhouhhrtggvrdgtohhm
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhiug
    esrggvrghmrdhush
X-ME-Proxy: <xmx:iN7GX6ZblcjkPbLj9HMB-sTViyD0s08nGZy3AdMBF-re0a3UGZLx5A>
    <xmx:iN7GX9WV2k3Fjdmo2cks8VZlMfw2kDU0Dhl9JM2VC7wXz6X0zQ8H7w>
    <xmx:iN7GXwnuTpsqMmaci00rWtukjHSFmTah2n4VRnKuLwebFCWHX41-5g>
    <xmx:id7GX8xVY9R0hagj9hNT0iO8yTza4bcD4c-KDCk4mF0RAehZMp_3dg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D9F4C6F6005E; Tue,  1 Dec 2020 19:23:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <d099bfba-e925-4ccf-9c70-83fab7b36caf@www.fastmail.com>
In-Reply-To: <27b538e4-0771-442b-8a56-991123c42ed8@www.fastmail.com>
References: <e692d867-54f1-4987-917c-1b0d39cf7ab3@www.fastmail.com>
 <27b538e4-0771-442b-8a56-991123c42ed8@www.fastmail.com>
Date:   Tue, 01 Dec 2020 18:23:15 -0600
From:   "Sid Spry" <sid@aeam.us>
To:     linux-media@vger.kernel.org
Subject: Re: Accelerated Video Capture on ARM
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 1, 2020, at 5:33 PM, Sid Spry wrote:
> I made a small breakthrough and found the /dev/graphics/fb* devices.
> Unfortunately many phones seem to create these but leave these unused.
> The phone is a Motorola G7 based on a Snapdragon/Adreno chip. Is anyone
> able to comment on how the screen buffer is accessed?
> 
> Thanks.
>

Apologies for the quick posts, but made some more progress. Apparently the
interface is called Qualcom MDSS MDP (https://android.googlesource.com/kernel/msm/+/android-wear-5.1.1_r0.6/Documentation/devicetree/bindings/fb/mdss-mdp.txt).

Checking /sys, I find:

# cat /sys/class/graphics/fb1/msm_fb_type                                                                                                     
writeback panel

Which was indicted to me elsewhere as the the type of interface I should look for. But
I can find no documentation on how to read framebuffer data from this device (or fb1,
which represents the real screen).

Thanks in advance, I've been looking for a while.
