Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF81039DD55
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 15:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhFGNMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 09:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbhFGNMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 09:12:18 -0400
Received: from mail.turbocat.net (turbocat.net [IPv6:2a01:4f8:c17:6c4b::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B962AC061766
        for <linux-media@vger.kernel.org>; Mon,  7 Jun 2021 06:10:27 -0700 (PDT)
Received: from hps2020.home.selasky.org (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 101C4260074;
        Mon,  7 Jun 2021 15:10:26 +0200 (CEST)
Subject: Re: Genesys Logic UVC microscopes used to work with Linux, but no
 longer do
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <478e73fc-0e2c-4f1b-11d4-c71067764571@selasky.org>
 <CAPybu_0q21sgn+o-AQYifks74TpHLnS2a3F-GtqJb4CJy1VEiQ@mail.gmail.com>
From:   Hans Petter Selasky <hps@selasky.org>
Message-ID: <8e2c7b08-f282-c263-a73d-00d74bfc0281@selasky.org>
Date:   Mon, 7 Jun 2021 15:09:04 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAPybu_0q21sgn+o-AQYifks74TpHLnS2a3F-GtqJb4CJy1VEiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/6/21 9:41 PM, Ricardo Ribalda Delgado wrote:
> Hi Hans
> 
> Could you try running git bisect to figure out exactly at what commit
> the device stops working?
> https://git-scm.com/docs/git-bisect
> 
> Usually in 7 steps or so you will get an answer and it will really
> help the debug process.
> 
> Thanks!
> 

Hi Ricardo,

I did a quick bisect back to Linux 4.2 (Torvald's Linux), but was unable 
to find the offending commit. All revisions didn't work. This was done 
on FreeBSD. I'm pretty sure this has worked before, because I have some 
microscope pictures saved on my computer from 7th of February 2020. That 
UVC code was on Linux 5.10-rc6 (Torvald's Linux).

Then I didn't use the USB microscope for a year. And when I plugged it 
again recently, I only got it working with MacOSX.

Then I made a USB trace, and found that Linux sent a lot of default 
value parameters during attach.

When I removed those, the device started working again.

So maybe some timing issue then :-(

Anyways optimizing away those redundant parameters settings should be a 
good thing to reduce stress on UVC devices during attach. See separate 
patch I posted.

Thank you for your time!

--HPS
