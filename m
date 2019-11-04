Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA3D6EDA6E
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 09:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbfKDISB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 03:18:01 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:34593 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726633AbfKDISA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 03:18:00 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id RXYWiZdCM9P9bRXYeiV6Nh; Mon, 04 Nov 2019 09:17:59 +0100
Subject: Re: [PATCH 2/8] smiapp: smiapp_start_streaming(): replace return by
 goto
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
 <20191103112338.22569-3-hverkuil-cisco@xs4all.nl>
 <20191104081214.GB11844@kekkonen.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <14518024-3295-5282-afaa-38e7f0a8b1ce@xs4all.nl>
Date:   Mon, 4 Nov 2019 09:17:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104081214.GB11844@kekkonen.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHILWxPUzzC1KqYJo1uSQdHLGmqmQ9udQvXthugVezmaXYu9rAJDzOG7doOkjx/VjXN3yiN8Ig35cP+9bEWDnAoq1SFLKpHdFFs/5Juhkgb2awFJkGoi
 2/C/EzIIBROfT+yu9wXqJkQGG+bff/NIp23/PrtUzXpYFoW4KgrBlMfB/BfLpp8IsCwESsVWPBCcdymYQL+t4u/AhVXamIQngaz5n5x7xO4C2/cDTVsO/zRQ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/4/19 9:12 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Sun, Nov 03, 2019 at 12:23:32PM +0100, Hans Verkuil wrote:
>> There were still two returns in smiapp_start_streaming() that should
>> have been a goto to ensure mutex_unload was called before returning.
>>
>> This fixes this smatch warning:
>>
>> drivers/media/i2c/smiapp/smiapp-core.c:1483 smiapp_start_streaming() warn: inconsistent returns 'mutex:&sensor->mutex'.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Thanks for the patch.
> 
> Dan Carpenter submitted one with equivalent content, and it's in my pull
> request to Mauro:
> 
> <URL:https://patchwork.linuxtv.org/patch/59698/>
> 

Thanks for the info, I've dropped this patch from my series.

Regards,

	Hans
