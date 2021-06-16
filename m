Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394F83A9C13
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 15:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbhFPNi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 09:38:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47642 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhFPNi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 09:38:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: adalessandro)
        with ESMTPSA id 5F33E1F43696
From:   Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [v4l-utils v5 0/5] Add support for meson building
To:     kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi, rosenp@gmail.com
References: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
 <f2f72ec5-e352-132f-b8d1-718589360bf0@ideasonboard.com>
 <008aec9c-c1e6-7f8b-dde5-8fa53c1e9ee6@collabora.com>
 <92b5c1bf-f4cf-5d5e-7c16-57d4a3446f67@ideasonboard.com>
 <20210518092358.05c7a189@coco.lan>
 <78322e18-2086-1eda-3b39-bbd71160be27@ideasonboard.com>
Message-ID: <8c260749-8b96-8587-5c22-8d7b1210862e@collabora.com>
Date:   Wed, 16 Jun 2021 10:36:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <78322e18-2086-1eda-3b39-bbd71160be27@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran, Mauro,

Thanks for all the feedback, I'll try to review and address all the
comments you've posted. Just a quick comment related to the output size
and debug level.

On 5/18/21 7:18 AM, Kieran Bingham wrote:
> Hi Mauro,
> 
> On 18/05/2021 08:23, Mauro Carvalho Chehab wrote:
>> Em Mon, 17 May 2021 23:13:45 +0100
>> Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:
>>
[snip]
>> Assuming that both builds used the same compilers, a difference at 
>> the order of (tens of) MB can only be explained if Meson build
>> was very incomplete, and/or the output files don't carry the same
>> debug info.
> 
> Indeed - compiler debug info level changes could be another thing to
> check. That could account for a larger build output difference, but
> there's certainly a large discrepancy to solve.

I've just checked and autotools is building by default with -g -O2, so
meson should be built with --buildtype=debugoptimized to get the same
results.

I'll dig deeper and post more soon.

Regards,
Ariel
