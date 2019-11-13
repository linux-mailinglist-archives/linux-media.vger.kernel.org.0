Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E13F5FB2E9
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 15:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbfKMOw5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 09:52:57 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:55047 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727168AbfKMOw4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 09:52:56 -0500
Received: from [IPv6:2001:420:44c1:2577:a0ce:57c9:cd12:de06]
 ([IPv6:2001:420:44c1:2577:a0ce:57c9:cd12:de06])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Uu0HihqTtXYiTUu0LiEjJt; Wed, 13 Nov 2019 15:52:21 +0100
Subject: Re: [PATCH v5] vivid: Add touch support
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org
References: <41670600-f97f-8c52-d13b-78fb1c44a01b@xs4all.nl>
 <20191113112057.31189-1-bnvandana@gmail.com>
 <4e30563d-de55-5b70-ca7d-e68be0ba87ce@xs4all.nl>
Message-ID: <df071b52-3840-a835-360b-92a34162e63a@xs4all.nl>
Date:   Wed, 13 Nov 2019 15:52:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4e30563d-de55-5b70-ca7d-e68be0ba87ce@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDNgN/B30o489aYL6MROJtythFopbyQJRsgpZYKhLsEdBDBXlXoh/R0rGzqMTR0pUY2ZKPMzk/VzW7X4gUhYeTujkRaMAK3fMdGuoJ/RQYpnLrmnPbNK
 5IyUK8cZZc+5ePMgCDFrUqL4NSGbpg+cKgKTJmxA2bFLIhCFcVy/xwQ6RRFFDHw0snUv+VUdI3zwVYKrIlu5mDXG4c2NM22Z8Y4o2SoWJW1Ac4X/wlZtjtti
 LbT6LHEPXsllYLLCI9Yo35smRXRTSPCCeY/FWf6l78KJvItPMjkwCIRJxOiUc7chQIb6ZPua8afkMOYth+7q4A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/13/19 3:15 PM, Hans Verkuil wrote:
> Hi Vandana,
> 
> I've been doing some testing with the Synaptics rmi4 driver that supports
> the touch API. I finally got a result, but it requires a bit of work in the
> vivid driver (and v4l2-ctl) because it means that vivid should use a different
> touch format to match what this driver returns.
> 
> Some background (based on what I understood from the driver): the Synaptics
> driver is used for touchpads on laptops. The touch API itself is meant for
> diagnostics only, and not for regular use. It 'captures' 21x12 points ('pixels')
> as an image containing the capacitance measurements.
> 
> It looks as if typically not all measuring points are available, instead only a
> subset is actually returning valid values in this diagnostic module.
> 
> Which points are available is reported in 'Function 55', which my Synaptics
> touchpad does not support, so instead the touch API falls back to the default
> of 21x12. Looking at the values I receive it appears that on my laptop only
> part of the bottom set of points in the touchpad is made available (16x1).
> Alternatively, this could be just a driver bug (I really do not trust the driver,
> I doubt it sees much testing so it could very well be a regression).

Yes, it is a regression. I am now able to get a proper 'picture' out of the driver:

      0      0      0      0      0      0      0      0      1      0      0      0      0      0      0     -1      0     -1      0      0      0
      0      0      0      0      0      0      0      0      1      1      1      0      0      0      0      0      0      0      0      0      0
      0      0      0      0      0      0      0      1      3      8      9      3      0      1      0      0      0      0      0      0      0
      0      0      0      0      0      0      0      1     11    131    132     14      3      0      0      0      0      0      0      0      0
      0      0      0      0      0      0      0      3     36    190    201     65      6      0      0      0      0      1      0      0      0
      0      0      0      0      0      0      0      2     41    189    200     76      1      0      0      2      0      0      1      1      1
      0      0      0      0      0      0      0      0      7     65     76     10      2      0      0      0      0      0      0      0      0
      0      0      0      0      0      0      0      0      0      0      0      0      0      0     -1      0      0      0      0      0      0
      0      0      0      0      0      0      0      0      0      0      0      0      0     -1      0      0      0      0      0      0      0
      0      0      0      0      0      0      0      0      0      0     -1      0     -1      0     -1      0      0      0      0      0      0
      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
      0      0      0      0      0      0     -1      0      0     -1      0      0      0      0      0     -1      0      0      0      0      0

This is my finger resting in the middle of the touchpad.

Regards,

	Hans
