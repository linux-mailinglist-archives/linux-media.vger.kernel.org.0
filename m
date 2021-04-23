Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B678F369BBE
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 23:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243960AbhDWVDW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 17:03:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41506 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhDWVDK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 17:03:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: adalessandro)
        with ESMTPSA id BD4031F412B6
Subject: Re: [v4l-utils v4 2/5] Add support for meson building
To:     Gregor Jasny <gjasny@googlemail.com>, linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com, sakari.ailus@iki.fi
References: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
 <20210317172227.620584-3-ariel.dalessandro@collabora.com>
 <7096f897-1e48-c1e5-5503-008fff60d2b2@googlemail.com>
From:   Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <e9dc1ebd-9a68-adc6-2a61-5555d622ccf3@collabora.com>
Date:   Fri, 23 Apr 2021 18:02:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7096f897-1e48-c1e5-5503-008fff60d2b2@googlemail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

Following up on this patchset after some time.

On 3/20/21 1:56 PM, Gregor Jasny wrote:
> Hello,
> 
> Thank you again for these patches. Building v4l-utils has never been so 
> fast and easy. It will accelerate my Debian / Ubuntu packaging and 
> really sparks joy!

Happy to see it being useful :-)

> 
> On 17.03.21 18:22, Ariel D'Alessandro wrote:
>> Supports building libraries and tools found in contrib/, lib/ and
>> utils/ directories, along with the implemented gettext translations.
> 
> Here's a patch on top of your tree:
> https://gitlab.com/gjasny/v4l-utils/-/commit/a9853f79c2675bf08fc3e93f15aa4158c9769bdd 
> 
> 
> I changed the following:
> * Use pkgconfig to detect libbpf (like configure.ac does)
> * check for libbpf presence in the keytable subdir (like it's done for 
> libelf
> * refined the empty rc_keymaps dir hack with something supported by 
> meson: https://github.com/mesonbuild/meson/issues/2904 (your hack 
> stopped working for me with meson on Ubuntu 20.04.2)
[snip]
> Tested-by: Gregor Jasny <gjasny@googlemail.com>

Thanks a lot for your changes! LGTM, I'll add these changes, test and 
post a v5 asap.

Ariel
