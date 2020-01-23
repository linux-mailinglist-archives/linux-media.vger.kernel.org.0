Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80455146650
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 12:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgAWLIi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 06:08:38 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:39011 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726026AbgAWLIi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 06:08:38 -0500
Received: from [IPv6:2001:983:e9a7:1:1bd:458:b834:7f13]
 ([IPv6:2001:983:e9a7:1:1bd:458:b834:7f13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id uaLiixt49T6sRuaLjixWHh; Thu, 23 Jan 2020 12:08:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579777716; bh=n0bbi5reB6btYraVhNownfDKq5l4b7KiRDlNRMAIbV8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iZZrAHuKVni3DbpCO5XU1+OM2sL3jMYnSeK1YO4BioiOvDNQjb+xgEo30EMOlOfTq
         KXRKK+9V857ZAJaX84zuYdx7TtUmK4+cxJByHfhn/i+ok0wPNhnh5QmJU6LuiuskEZ
         QdcD2vHUlCrfW47VFZ5K4xEgNd4mVpITXp/dt7KbyV+SSJv4gra0+V6ucNPYavVbKN
         nKtze3JrQhXtpYv4AZGRbvreKtrx9pt8Bl/kTXiCHpg1EipKAJ2p5f4/hi3vq8C8hs
         UMrDKaLjoCo5brD5ivffVHh89HUY5O7LUp8YSmQaRp++w0BS2Qwv0WuGfVSVExeNMU
         QQ3v3czxDCX+Q==
Subject: Re: [RFC][PATCH 05/15] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT in REQBUFS
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-6-senozhatsky@chromium.org>
 <8d0c95c3-64a2-ec14-0ac2-204b0430b2b4@xs4all.nl>
 <20200122021805.GE149602@google.com> <20200122034826.GA49953@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7c4accc6-56f2-ecd0-1549-a4114b339ce8@xs4all.nl>
Date:   Thu, 23 Jan 2020 12:08:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200122034826.GA49953@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOclX7/0TmC/wSsftm7U8GyP5KhyI0dBeMH8ozix/GKMBMuloalMwkCDnJ8sUU9FVHiTjl6KI/hQqhjFKt46GRlSo+I0KEcnM/ykFt7+XlPRJqPHyvZy
 akPVxqLy0tVAx7rkmoirlcektaqPBF0lWC7MW5gWhYmXLB5WcgkoeVvIp72RQF+V7KxdwG6NDVfozQXfhrl3AbFx/K0QH17vvXfDmMonxr9FLspZwn1UfkHR
 G/sbXbRwlPLm1IiXDGs6BPMFPDDNl7KC1TZzQf0c7D8aNjOJ5P6/uRxx4ufQvbQnzqxfLVh+v8YApY9lyJdmv9VgSIfVi4Ya7dVM9YQa6QOwAIq9uI+V+Tpk
 T0tG1M3ZeLkDCVtTHj5CNcYZ4h8/5w3cWzb+PD2OPsWIskr/Mp9rYsQv5i0UYeAHvT0zgI/1bjXFz1ezeLR0EsDRPNfQpZYsTNCz11T1IemOvq//9JDQX5MF
 CHacnvwzuxEbzGvOEzHEBOOy8iOIQxBq4NdajdrvL0yVIDV8BbfBfyUbdJW6R9mU8gaQyPib80k4ml5PG3CWr702dpMZhkg3p0UrjgluKOV5b8aHVve2jjsH
 I3W+8JctKOCfwins7Np1TDZrSW77gcKY0Bf1LprtNGLOPQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/22/20 4:48 AM, Sergey Senozhatsky wrote:
> On (20/01/22 11:18), Sergey Senozhatsky wrote:
> [..]
>>>> +    * -
>>>> +      - __u32
>>>>        - ``reserved``\ [1]
>>>>        - A place holder for future extensions. Drivers and applications
>>>> -	must set the array to zero.
>>>> +	must set the array to zero, unless application wants to specify
>>>> +        buffer management ``flags``.
>>>
>>> I think support for this flag should be signaled as a V4L2_BUF_CAP capability.
>>> If the capability is not set, then vb2 should set 'flags' to 0 to preserve the
>>> old 'Drivers and applications must set the array to zero' behavior.
>>
>> The patch set adds V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS towards the end of the
>> series, I guess I can shuffle the patches and change the wording here.
> 
> Or I can add separate queue flag and V4L2_BUF_CAP:
> 
> struct vb2_queue {
> ...
> 	allow_cache_hints:1
> +	allow_consistency_hints:1
> ...
> }
> 
> and then have CAP_SUPPORTS_CACHE_HINTS/CAP_SUPPORTS_CONSISTENCY_HINTS.

Don't these two go hand-in-hand? I.e. either neither are supported, or
both are supported? If so, then one queue flag is sufficient.

Regards,

	Hans

> 
> 	-ss
> 

