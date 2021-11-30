Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E39463059
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 10:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236183AbhK3J7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 04:59:18 -0500
Received: from mxout04.lancloud.ru ([45.84.86.114]:44412 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235636AbhK3J7S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 04:59:18 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 629582130919
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <64aed6cc-22ed-6ebb-c7f2-0e93a1db9991@omp.ru>
Date:   Tue, 30 Nov 2021 12:55:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] rcar-vin: Update format alignment constraints
Content-Language: en-US
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <20211125230257.1334452-1-niklas.soderlund+renesas@ragnatech.se>
 <1cd39b05-8271-5a21-95f0-ba236e0325f3@omp.ru>
 <e2fcce50-9f01-6efd-4b6f-e967f27632b6@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <e2fcce50-9f01-6efd-4b6f-e967f27632b6@omp.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29.11.2021 23:11, Sergey Shtylyov wrote:
> On 11/27/21 6:02 PM, Sergey Shtylyov wrote:
> 
>>> This change fixes two issues with the size constraints for buffers.
>>>
>>> - There is no width alignment constraints for RGB formats. Prior to this
>>>     change they where treated as YUV and as a result was more restricted
>>
>>     s/was/were/.

    Actually, scratch that -- I misread the sentence. :-/
    But what doesn't rhyme is "as" -- are you sure it should be here?

>     ... and s/where/were/ too. :-)

    That one was correctly spotted... :-)

[...]


MBR, Sergey


