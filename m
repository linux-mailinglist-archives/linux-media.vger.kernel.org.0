Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBED398F33
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 11:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733178AbfHVJUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 05:20:19 -0400
Received: from ns.iliad.fr ([212.27.33.1]:37954 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbfHVJUT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 05:20:19 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 4F7CD204C5;
        Thu, 22 Aug 2019 11:20:17 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 3861C20116;
        Thu, 22 Aug 2019 11:20:17 +0200 (CEST)
Subject: Re: [PATCH v4] media: si2168: Refactor command setup code
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
References: <06171488-7530-d4e4-1b94-f82905ed383d@free.fr>
 <499bea86-f483-f776-4512-510c5df9d78f@free.fr>
 <20190822091002.7v7slkrilwfz3d3c@gofer.mess.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <bde5db81-5920-dcd3-7f79-6dc08a3a24d7@free.fr>
Date:   Thu, 22 Aug 2019 11:20:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822091002.7v7slkrilwfz3d3c@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Aug 22 11:20:17 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/08/2019 11:10, Sean Young wrote:

> On Mon, Aug 19, 2019 at 01:54:53PM +0200, Marc Gonzalez wrote:
>
>> On 15/07/2019 11:50, Marc Gonzalez wrote:
>>
>>> Use cmd_init() to fill a struct si2168_cmd command.
>>>
>>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>>> ---
>>> Changes from v1:
>>> - Use a real function to populate struct si2168_cmd *cmd, and a trivial
>>> macro wrapping it (macro because sizeof).
>>> Changes from v2:
>>> - Fix header mess
>>> - Add Jonathan's tag
>>> Changes from v3:
>>> - Drop Jonathan's tag after rewrite
>>> - Completely drop macro, and explicitly provide 'wlen' argument
>>> ---
>>>  drivers/media/dvb-frontends/si2168.c | 152 ++++++++-------------------
>>>  1 file changed, 44 insertions(+), 108 deletions(-)
>>
>> Brad, Sean, Antti,
>>
>> I believe this patch is good to go. Is anything still wrong with it?
> 
> It's been accepted:
> 
> https://git.linuxtv.org/media_tree.git/commit/?id=619f6fc390909fce3247c3e07e6882b868b645da

Cool, thanks.
