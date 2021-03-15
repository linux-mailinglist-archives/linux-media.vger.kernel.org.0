Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E602D33AC21
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 08:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbhCOHVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 03:21:37 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:45471 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229644AbhCOHVh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 03:21:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id LhXel9aPejVXQLhXjl2GWU; Mon, 15 Mar 2021 08:21:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615792895; bh=PxwjQdmQXVIfaFVmDp3Grp0RSqrCbSaNgggp1ct0iSw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XVbAQbbhqMlaDGwGi7NcTxSwBy4XnyVYrAuEVaFimcdEpDCYD86Ze6wCLGxdTYlEX
         f35RiTpdYUN34WiWxjUZmA6CsAzRIt/3dkHVsQmi0xfbkTrRSG3++7Z5NVwfFhVb8Q
         /0VDs283JMija6kzkFpBMoudXABHyXNvit25Qkj9xz6AwpLq4Ku9R7hc3Zy37uouM1
         eYdi7xpNJzawJczmb2ClT977JMA1buq0y1jHYMhxnLG14lowYcYbGFyssby3J0fZrH
         4lFzIZqkkxX5GZYLpmqwvIked3hrnxgraYt0VnEN7niuDb0tJqtpemIkEMORL6/USx
         lGhOPYg+dMUAQ==
Subject: Re: [PATCH] v4l-utils tpg GCC 11 fix
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     linux-media@vger.kernel.org
References: <E1lHUCT-0000OM-9X@paradis.debian.org>
 <CAJxGH0-c4eU0Tpwws+jpvf=_+3hJj-rSroQGb9xuZ5ii-KwR+Q@mail.gmail.com>
 <8169ff5a-8dba-088b-e3b3-1901246d5aec@googlemail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <82010354-64cc-54ea-45bf-c892288d11f2@xs4all.nl>
Date:   Mon, 15 Mar 2021 08:21:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8169ff5a-8dba-088b-e3b3-1901246d5aec@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLtOkq3XqdDvoXQNXyZjfVFLOAYqdLkK/o8qGbnD8LNWI3R6xC1mQCPlU4TcocZJptJh5cND6mHoKAa3no2xzbLuMkhAPBpZp95UBdXhOI5KYgl3r2n3
 UCnnvUF3X+3EOHzkTnY12PpuPwhA6RfGb2K553lp1bwf/ZEhL9Z1ZkX0/DrHioNts9/bKM6TcTRPRlEEyvbFPZHmq2wrdAtyca7HlBc6xe9t81m9q/Is4DNh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

On 14/03/2021 22:51, Gregor Jasny wrote:
> Hello Hans,
> 
> On 04.03.21 17:25, Gregor Jasny wrote:
>> qv4l fails to build with GCC 11:
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=984381 
>>
>> The reason is that min/max are defined as macros here:
>> https://git.linuxtv.org/v4l-utils.git/tree/utils/common/v4l2-tpg.patch#n200 
>> <https://git.linuxtv.org/v4l-utils.git/tree/utils/common/v4l2-tpg.patch#n200>
>>
>> should I apply a fix which prefixes the min/max/3 macros with libv4l_?
> 
> Could you please take a look at the patch below and tell me if I should 
> apply it to v4l-utils master (or of cause, apply it yourself)?
> 
> https://sources.debian.org/patches/v4l-utils/1.20.0-3/fix-gcc-11-ftbfs.diff/

This isn't right:

The changes to capture-win-gl.cpp are definitely wrong since this is openGL code,
so this should remain as-is.

The code from v4l2-tpg.patch can be simplified: the only place min and max is used
is in the min3 and max3 defines. So it is enough to rename the min/max defines to
tpg_min/max.

I've made that change to v4l-utils and pushed it. Please check if this resolves
the issue.

Regards,

	Hans
