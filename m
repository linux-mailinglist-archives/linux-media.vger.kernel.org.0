Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D224621F5
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 21:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbhK2UQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 15:16:52 -0500
Received: from mxout01.lancloud.ru ([45.84.86.81]:45848 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233900AbhK2UOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 15:14:51 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 0970B2063D6A
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] rcar-vin: Update format alignment constraints
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <20211125230257.1334452-1-niklas.soderlund+renesas@ragnatech.se>
 <1cd39b05-8271-5a21-95f0-ba236e0325f3@omp.ru>
Organization: Open Mobile Platform
Message-ID: <e2fcce50-9f01-6efd-4b6f-e967f27632b6@omp.ru>
Date:   Mon, 29 Nov 2021 23:11:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1cd39b05-8271-5a21-95f0-ba236e0325f3@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/27/21 6:02 PM, Sergey Shtylyov wrote:

>> This change fixes two issues with the size constraints for buffers.
>>
>> - There is no width alignment constraints for RGB formats. Prior to this
>>    change they where treated as YUV and as a result was more restricted
> 
>    s/was/were/.

   ... and s/where/were/ too. :-)

>>    then needed. Add a new check to different between the two.
> 
>    Differ?
> 
>> - The minimum width and height supported is 5x2, not 2x4, this is an
>>    artifact from the drivers soc-camera days. Fix this incorrect
>>    assumption.
>>
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> [...]

MBR, Sergey
