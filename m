Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AEE467434
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 10:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351406AbhLCJqu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 04:46:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242976AbhLCJqu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 04:46:50 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E43C06173E
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 01:43:25 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id t567mQ8znDFskt56BmNOcs; Fri, 03 Dec 2021 10:43:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638524603; bh=VRqxBUvHXR9p+u29GYmJtOk1DDU3u4oUg+r14RMy/K8=;
        h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From:
         Subject;
        b=K6B/Oyrk21OTKMvLAJ5MNLNfV+7X0kKa13YM7SncxzVwHk7woki7WYUQqU/OY707N
         4G1kuQVsyTJOLHlhXCJLiVt7MIQGJCHRhw8BHsdWhiqk5OayLhOoDA1pew5WZu0jVe
         eDbfAxJpnWNmLgnBl7ttC7l3YPzK1lZNVxzgeTFpsCL8jRSIzR68kcxO0Jd7JQLXU9
         G+hTAUzcQzOMb4lg9psp8Oqbz6dpMXaokR6I+iW0bzufMOEOEgsx17nJZE2Np94TS4
         KT9WhlBOZxbGf6XRAQhh2L5aGfxhGHKqIkHPRLAcvD4FRL47zB2GwmmL3TmEX/lBhl
         PoOGLvt88pegg==
Message-ID: <b881c5b5-ee29-f250-5270-66c9d7357c94@xs4all.nl>
Date:   Fri, 3 Dec 2021 10:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: ovm6211 linux driver
Content-Language: en-US
To:     Petko Manolov <petko.manolov@konsulko.com>,
        linux-media@vger.kernel.org
References: <YanepzHYQMH/DfHY@karbon.home.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <YanepzHYQMH/DfHY@karbon.home.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKcut1mV5IY+8mZVEVeAORHblGjC2UnkA1SzxWNSHW6GTpFmehlc9VHShzVuBnmJF139OgYpUvFQEQns/9yIBZeZaj6KoVg40C0cVPAumIRTLVmE0TaU
 7xCeuExVutzE2oA7zAdjYp4KBC6xB/XQNu0ccHcBe5LVklyDv6xPnIurNdUTqRXtAGunr4xHuOoXm5NFmnEj2Bp4cmhoZDWLm0Rvr2Y3X3gEktn/0ba1vlg6
 xeYSbZ2qI2Xct4XjEAVNqg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

On 03/12/2021 10:08, Petko Manolov wrote:
> 	Hi guys,
> 
> On request by certain company we've developed a media driver for OmniVision's 
> ovm6211 camera sensor.  We just got permission to mainline the code.  How shall 
> i proceed?
> 
> 
> cheers,
> Petko
> 

You found the correct mailinglist, so that's good :-)

This is a good starting page:

https://www.linuxtv.org/wiki/index.php/Developer_section

Check the 'Kernel driver development' - 'Submitting Your Work:' links.

Regards,

	Hans
