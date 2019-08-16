Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E85A8F961
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 05:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfHPDKF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 23:10:05 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54590 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfHPDKF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 23:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:
        Subject:Sender:Reply-To:To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=4j8pzC9X6BV/0Cgmn/vHlvEwxdtoqsY8m8EAgZ/56aI=; b=cjB+2UDwKTYOFgYTe9TsclryD
        fRTu6IgBmoFI+mvs9rUzSWQMIe8my5zq4ZZJaggyvAyurUvssi8NzmQ+IDgkvfZFbUJhXwBTWiyT9
        1BxwxTOR4XitmL/hXXt3KYaV8F1+grwZoZc6lsF+l8YTZhKQosVb2Vm5JZmgWSyhN8wG19zuICD9y
        3M85yq3D6DDgv2vI5vwrxFdo2YRbIlYT3Zegg2t+5N4MqPpcwoAV6fyo/8Z7qfOs0hpcb0A8fQf1i
        jpBMBFZEX/TRG3IOR0UX6AKwBOyqKYcdrITx8HSCB6o3pvWlM/2RU0MAqeElqVT7g/LrxSY1C4PMm
        5oQ3KzFTA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=[192.168.1.17])
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hyScu-0006Dn-JI; Fri, 16 Aug 2019 03:10:04 +0000
Subject: Re: Linux Kernel 5.2.8 (uvc or i915? <<<)
References: <CAONH+Jm-O6=DQ+K2n5pNTNMg2Sq1KcVNFLuweVh6W82OPEFJoQ@mail.gmail.com>
 <abcae5c9-b3dc-7403-d628-5d7543d19702@infradead.org>
 <CAONH+JnZpbpdiwdajP7ke7X7wQGU7m4YoyZRDbLHKmRufkD6mQ@mail.gmail.com>
Cc:     Nathaniel Russell <naterussell83@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5d637638-12d1-6c39-8f76-824a0e875feb@infradead.org>
Date:   Thu, 15 Aug 2019 20:10:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAONH+JnZpbpdiwdajP7ke7X7wQGU7m4YoyZRDbLHKmRufkD6mQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[adding mailing lists etc. with Nathaniel's test info]


On 8/15/19 7:21 PM, Nathaniel Russell wrote:
> Well i surpressed the uvcvideo driver and you are right Randy it
> definitely is not the uvcvideo driver. There is something going on in
> the i915 driver.
> 
> 
> On 8/15/19, Randy Dunlap <rdunlap@infradead.org> wrote:
>> On 8/15/19 6:15 PM, Nathaniel Russell wrote:
>>> I would really like help with the kernel error with my uvcvideo driver.
>>>
>>
>> Hi again.
>>
>> What makes you think that the problem is related to the uvcvideo driver?
>> Does some previous kernel version work correctly?  If so, what version(s)?
>>
>>
>> Does this warning message only happen when the uvcvideo driver is being
>> loaded?
>> Can you suppress loading of the uvcvideo driver to find out?
>>
>> Most of the problems/errors/warnings that I see are related to the i915
>> driver:
>>
>> [   13.032341] timed out waiting for port C ready: got 0x20, expected 0xe0
>> [   13.032872] WARNING: CPU: 1 PID: 239 at
>> drivers/gpu/drm/i915/intel_display.c:1597 vlv_wait_port_ready+0x99/0xe0
>> [i915]
>> [   13.033632] RIP: 0010:vlv_wait_port_ready+0x99/0xe0 [i915]
>>
>> although there are a few uvcvideo warnings:
>> [   13.039305] uvcvideo 1-5:1.0: Entity type for entity Extension 4 was not
>> initialized!
>> [   13.039318] uvcvideo 1-5:1.0: Entity type for entity Extension 3 was not
>> initialized!
>> [   13.039330] uvcvideo 1-5:1.0: Entity type for entity Processing 2 was not
>> initialized!
>> [   13.039339] uvcvideo 1-5:1.0: Entity type for entity Camera 1 was not
>> initialized!
>>
>>
>> Laurent, do you see any uvc issues here?  Any ideas/suggestions?
>>
>>
>> @intel-gfx:  any ideas about what is going on here with the i915 driver?
>>
>>
>>
>> Original message to lkml:
>> https://lore.kernel.org/lkml/CAONH+Jm-O6=DQ+K2n5pNTNMg2Sq1KcVNFLuweVh6W82OPEFJoQ@mail.gmail.com/T/#u
>>
>> Previous message for 5.1.21 kernel:
>> https://lore.kernel.org/lkml/CAONH+JkTFujY9vEyNNuem+9rJ2qBKkf-PbKk9=DBSVEp6kW=yw@mail.gmail.com/
>>
>>
>> thanks.
>> --
>> ~Randy
>>


-- 
~Randy
