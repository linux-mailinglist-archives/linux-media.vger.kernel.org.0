Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B74EB3A12
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 14:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbfIPMPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 08:15:48 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:44193 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726875AbfIPMPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 08:15:48 -0400
Received: from [IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8] ([IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 9puzip4DfV17O9pv0iDn1e; Mon, 16 Sep 2019 14:15:46 +0200
Subject: Re: [PATCHv2 1/2] v4l: Add macros for printing V4L fourcc values
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
 <20190916100433.24367-2-hverkuil-cisco@xs4all.nl>
 <20190916120708.GP843@valkosipuli.retiisi.org.uk>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e508377b-10df-cb4b-1b5a-fd585d7fd533@xs4all.nl>
Date:   Mon, 16 Sep 2019 14:15:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190916120708.GP843@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDpuFKzBW9ttCACGkuO/Bvk9zCvVtExHwhm8GSlSLW3MDNW3P4nhgQqTSqL2ygFSm8nPadc5sPVgvJEP1ZNpBf0RAFcFtR75/bmfw6x6CHGRNYs/4LQY
 IpRbNuKMN8FptnXkQbtZrdTfBHIxR0byJV0BhBx0QsrgbgXJvsjOdr9AUq2xloRDFvufCRbI1gQVwhE0GDNoid5eS6TdMbXpOhnSY4xCX4Z29dpW9RAK1ch+
 lN7bm3Re2ndyDS46MQ2G3AVVmixY8nKOxnUX3a+vde543SyTOf+jafGkNU1s4HnSOX3Bhm+72+JbZdFqGf/B11ysyO0KvIkvfEtqUGSz5PSQo3fUitbAnZpS
 008o++uysZpbVha/mB+NmpTKLOAB3nzseXw+0/IQYMkt+f+LfcE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/16/19 2:07 PM, Sakari Ailus wrote:
> On Mon, Sep 16, 2019 at 12:04:32PM +0200, Hans Verkuil wrote:
>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>> Add two macros that facilitate printing V4L fourcc values with printf
>> family of functions. v4l2_fourcc_conv provides the printf conversion
>> specifier for printing formats and v4l2_fourcc_args provides the actual
>> arguments for that conversion specifier.
>>
>> These macros are useful in both user and kernel code whenever you want
>> to report a pixelformat, therefore put them into videodev2.h.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> [hverkuil-cisco@xs4all.nl: rename v4l2_fourcc_to_conv to v4l2_fourcc_args]
>> [hverkuil-cisco@xs4all.nl: add () around ? : expression]
>> [hverkuil-cisco@xs4all.nl: add comment about fourcc reuse]
>> [hverkuil-cisco@xs4all.nl: update Documentation/media/videodev2.h.rst.exceptions]
> 
> Were you going to add your SoB when merging the patch to your tree? Or is
> it just missing here?

My SoB will be added when I merge it. It's 90% your work, so I don't feel
I have any authorship rights for this patch.

> 
> Feel free to add:
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 

Regards,

	Hans
