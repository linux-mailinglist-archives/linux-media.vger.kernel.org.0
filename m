Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20A41CF568
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 15:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730074AbgELNQU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 09:16:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36208 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729917AbgELNQT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 09:16:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 025572A1AB2
Subject: Re: [GIT PULL FOR v5.8] Various fixes/enhancements
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <6a56ccf7-4c26-b3ad-eb3a-0647944c2f95@xs4all.nl>
 <20200421173100.2f1f9471@coco.lan>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <fca735e1-c668-8e1b-b689-564f619ca6e4@collabora.com>
Date:   Tue, 12 May 2020 15:16:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421173100.2f1f9471@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 21.04.20 17:31, Mauro Carvalho Chehab wrote:
> Em Fri, 17 Apr 2020 10:18:44 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> The following changes since commit ceab3ac1e60d70afb4e25147d60817c513f235f7:
>>
>>    media: dvb-frontends: DUMMY_FE should depends on DVB_CORE (2020-04-17 09:21:47 +0200)
>>
>> are available in the Git repository at:
>>
>>    git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8c
>>
>> for you to fetch changes up to 0f72df4db95844184f49bbdfeaae013919c12c1b:
>>
>>    dt-bindings: media: rockchip-rga: add power-domains property (2020-04-17 10:05:10 +0200)
>>
>> ----------------------------------------------------------------
>> Tag branch
>>
>> ----------------------------------------------------------------
>> Dafna Hirschfeld (8):
>>        media: staging: rkisp1: remove mbus field from rkisp1_sensor_async
>>        media: staging: rkisp1: replace the call to v4l2_async_notifier_parse_fwnode_endpoints_by_port
>>        media: staging: rkisp1: cap: cleanup in mainpath config for uv swap format
>>        media: staging: rkisp1: cap: fix value written to uv swap register in selfpath
>>        media: staging: rkisp1: cap: change the logic for writing to uv swap register
>>        media: staging: rkisp1: cap: support uv swap only for semiplanar formats
>>        media: staging: rkisp1: cap: support uv swapped planar formats
> 
> There were two merge conflicts on rksip1 patches. The first one was
> trivial, and I already addressed...
> 
>>        media: staging: rkisp1: cap: remove unsupported formats
> 
> But this one is not so trivial.
> 
> Dafna,
> 
> Please rebase this patch on the top of upstream and re-submit.

Hi, I was able to rebase the patch from the latest version without conflicts: https://patchwork.kernel.org/patch/11484161/

Thanks,
Dafna

> 
> 
> Thanks,
> Mauro
> 
