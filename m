Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C003FB254
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 15:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbfKMOPL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 09:15:11 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:43499 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727445AbfKMOPL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 09:15:11 -0500
Received: from [IPv6:2001:420:44c1:2577:a0ce:57c9:cd12:de06]
 ([IPv6:2001:420:44c1:2577:a0ce:57c9:cd12:de06])
        by smtp-cloud8.xs4all.net with ESMTPA
        id UtQGihVFmXYiTUtQKiEOnU; Wed, 13 Nov 2019 15:15:08 +0100
Subject: Re: [PATCH v5] vivid: Add touch support
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org
References: <41670600-f97f-8c52-d13b-78fb1c44a01b@xs4all.nl>
 <20191113112057.31189-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4e30563d-de55-5b70-ca7d-e68be0ba87ce@xs4all.nl>
Date:   Wed, 13 Nov 2019 15:15:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191113112057.31189-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfG9vrp4YsZgqxRkitynxghcbqhdAbibnTSvgc948yTNWMaqgSRDTbPBEFxIhA0567kxPo6dFnOYZzeY0LBtDaWgVL8nepRBHOP3ExsGTuMNLQ3Imipvq
 Z8GfP9NcNPya6bhOIxmyVnuctQSxxk0vsQu36MdarTqw+/Hqd+stgzu7N0d9j0INEVTCPseKJryszviQZS79/DdRyhfpFtXmfHiYwARC0Teb8UOM3Gd8sp2j
 q48pFNkHy/lDD1VMWR3vC+SV3h/N2gj+po4DMALROKLBzyJ0AKjItTezUM9Unw46ddgxico8ncJudyH/3OH4kQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vandana,

I've been doing some testing with the Synaptics rmi4 driver that supports
the touch API. I finally got a result, but it requires a bit of work in the
vivid driver (and v4l2-ctl) because it means that vivid should use a different
touch format to match what this driver returns.

Some background (based on what I understood from the driver): the Synaptics
driver is used for touchpads on laptops. The touch API itself is meant for
diagnostics only, and not for regular use. It 'captures' 21x12 points ('pixels')
as an image containing the capacitance measurements.

It looks as if typically not all measuring points are available, instead only a
subset is actually returning valid values in this diagnostic module.

Which points are available is reported in 'Function 55', which my Synaptics
touchpad does not support, so instead the touch API falls back to the default
of 21x12. Looking at the values I receive it appears that on my laptop only
part of the bottom set of points in the touchpad is made available (16x1).
Alternatively, this could be just a driver bug (I really do not trust the driver,
I doubt it sees much testing so it could very well be a regression).

In any case, this is sufficient to see what sort of data values are used.

This is with input 0 of the v4l-touch0 device which uses this format:

https://hverkuil.home.xs4all.nl/spec/uapi/v4l/pixfmt-tch-td16.html

Also, this format returns the data in little endian format. I suspect that
the documentation for this touch formats is wrong since that indicates big-endian.

So vivid/v4l2-ctl should be modified to use this instead of V4L2_TCH_FMT_TU16.

Below is a dump of what happens if I move my finger from left to right. Each
line is a single frame. As you can see, the background values are around 0.
When pressed that max value is around 200 and you see a small Bell-curve
of lower values around it stretching 3-4 points.

I'm not sure if it is worth reproducing that Bell curve in vivid, I think it
is OK to just set a single value. The background noise can be something like
a random number between -3 and 3, and the pressure point a random number between
200-220.

Regards,

	Hans


     -2     -4     -2     -2     -3     -3     -3     -3     -4     -5     -5     -5     -3     -4     -4     -4
      1      0      1      0      0      0      0      0      0      0      0      0      0      0      0      0
     -2     -3     -2     -2     -3     -4     -3     -4     -4     -3     -4     -4     -4     -4     -3     -4
     13      1      1      0      0      0      0      0      0      0      0      0      0      0      0      1
     49      0     -2     -2     -2     -4     -3     -4     -4     -5     -5     -4     -3     -4     -4     -3
    201     65      3      0      0      0      0      0      0      0      0      0      0      0      0      0
    191    143      3     -2     -2     -3     -3     -4     -5     -5     -5     -5     -4     -5     -4     -5
    198    155      8      1      0      0      0      0      0      0      0      0      1      0      1      0
    190    159      5     -1     -2     -3     -3     -3     -4     -5     -4     -6     -4     -5     -4     -6
    145    214     56      1      1      0      0      0      0      0      0      0      1      0      0      2
     90    211     91      0     -2     -3     -3     -4     -4     -5     -3     -5     -3     -4     -4     -4
     32    203    171     12      2      0      0      0      0      0      1      0      1      0      1      0
      0     71    211    143      2     -3     -3     -3     -3     -3     -3     -3     -2     -3     -3     -3
      1     18    193    209     31      1      1      0      0      0      0      0      0      0      0      0
     -2     15    192    206     29     -2     -2     -2     -4     -3     -4     -4     -3     -3     -4     -3
      2     21    197    215     37      2      1      0      0      0      0      0      0      0      0      0
     -2     15    190    209     33     -1     -3     -3     -4     -4     -4     -4     -3     -4     -3     -4
      0      3    100    220    153      6      1      0      0      0      0      0      1      0      0      0
     -3     -2     20    200    211     35     -1     -2     -3     -3     -2     -4     -3     -3     -2     -2
      0      0      6    150    222    105      3      0      0      0      1      0      1      0      0      1
     -4     -4     -2     35    208    192     24     -1     -4     -3     -2     -3     -2     -3     -3     -2
      0      0      1     35    212    198     29      1      0      0      0      0      0      0      0      0
     -3     -3     -2      3    157    198     93      0     -3     -3     -3     -3     -2     -3     -3     -2
      0      0      0      0     30    191    197     44      1      0      1      0      2      1      1      1
     -3     -4     -3     -3     -1     66    192    182      8     -2     -2     -4     -3     -3     -3     -3
      0      0      0      0      0      5    133    212    134      5      1      1      1      1      1      1
     -3     -5     -3     -5     -4     -3     19    191    208     51     -1     -4     -3     -4     -3     -3
      1      0      0      0      0      0      6    141    212    133      6      1      2      1      2      2
     -4     -4     -3     -4     -4     -4     -1     48    206    198     19     -3     -2     -4     -3     -3
      0      0      0      0      0      0      0      3    112    214    162      6      1      1      2      1
     -3     -4     -4     -5     -5     -4     -3     -2      9    175    202     66     -1     -3     -3     -3
      0      0      0      0      0      0      0      0      2     63    205    205     22      1      1      1
     -3     -5     -2     -4     -4     -4     -4     -4     -3     28    191    214     40     -2     -3     -5
      0      0      0      0      0      0      0      0      0     14    169    223     86      3      1      1
     -3     -4     -3     -4     -4     -3     -3     -4     -4     -1     58    213    184      7     -2     -3
      0      0      0      0      0      0      0      0      0      0     10    200    225     83      2      1
     -4     -5     -4     -5     -5     -5     -5     -4     -5     -4      1    165    218    105      0     -4
      0      0      0      0      0      0      0      0      0      0      2     76    222    192     13      1
     -3     -4     -4     -4     -5     -5     -4     -4     -5     -6     -5     -1    107    214    149      0
      0      0      0      0      0      0      0      0      0      0      0      0     14    181    211     83
     -3     -4     -3     -4     -4     -4     -3     -4     -4     -4     -4     -4      0     54    205    191
      0      0      0      0      0      0      0      0      0      0      0      0      1      7    136    210
     -3     -4     -4     -4     -5     -5     -5     -4     -5     -4     -4     -5     -4     -3     14    179
      0      0      0      0      0      0      0      0      0      0      0      0      0      0      3     74
     -3     -4     -3     -5     -4     -5     -4     -4     -4     -4     -5     -6     -5     -4     -4     -1
      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
     -3     -4     -3     -3     -4     -4     -3     -4     -5     -5     -5     -5     -5     -4     -4     -4
      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
     -3     -4     -3     -4     -4     -5     -4     -4     -4     -5     -5     -6     -5     -5     -4     -4
      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
     -3     -4     -3     -4     -4     -4     -4     -4     -5     -4     -5     -6     -4     -5     -5     -5
      0      0      0      0      0      0      0      0     -1     -1      0     -1      0     -1      0      0
     -3     -4     -2     -4     -3     -4     -4     -4     -4     -4     -4     -5     -4     -5     -3     -3
      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
