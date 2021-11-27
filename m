Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9E045FF83
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 16:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245213AbhK0PHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Nov 2021 10:07:24 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:34782 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346576AbhK0PFY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Nov 2021 10:05:24 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru B4A0120F2400
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <1cd39b05-8271-5a21-95f0-ba236e0325f3@omp.ru>
Date:   Sat, 27 Nov 2021 18:02:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] rcar-vin: Update format alignment constraints
Content-Language: en-US
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <20211125230257.1334452-1-niklas.soderlund+renesas@ragnatech.se>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20211125230257.1334452-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 26.11.2021 2:02, Niklas Söderlund wrote:

> This change fixes two issues with the size constraints for buffers.
> 
> - There is no width alignment constraints for RGB formats. Prior to this
>    change they where treated as YUV and as a result was more restricted

    s/was/were/.

>    then needed. Add a new check to different between the two.

    Differ?

> - The minimum width and height supported is 5x2, not 2x4, this is an
>    artifact from the drivers soc-camera days. Fix this incorrect
>    assumption.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergey
