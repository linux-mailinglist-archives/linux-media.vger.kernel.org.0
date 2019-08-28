Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5C749FC2C
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 09:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfH1Hr2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 03:47:28 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:43483 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726305AbfH1Hr2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 03:47:28 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2sfri8VpszaKO2sfuiJwX8; Wed, 28 Aug 2019 09:47:27 +0200
Subject: Re: [PATCHv10 2/2] cec: document CEC_ADAP_G_CONNECTOR_INFO and
 capability
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20190823122059.5270-1-hverkuil-cisco@xs4all.nl>
 <20190823122059.5270-3-hverkuil-cisco@xs4all.nl>
 <CALFZZQHL0WQVJiHDs6TZbgfD8-PEuAKGfyv1JGA5cLTY4LSm+g@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2dbba304-5493-9934-1745-480e364b8663@xs4all.nl>
Date:   Wed, 28 Aug 2019 09:47:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALFZZQHL0WQVJiHDs6TZbgfD8-PEuAKGfyv1JGA5cLTY4LSm+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDX/0Tg3KpITFa1Glcic4bkhqFO76n7FdHnaW1tbm6KszQ3luPPlI3HYhPY6Os3lo2pgbwYEG8T/3MhjoF/tSaCTQ53+qp/4NmYCWV6ZyW/0bGfhunBP
 zHziLuU1Yx9qhEvZK7Id9s3pj6+O2X8ASTxyB+ETgu1MFZZspwbIVT7z6tv9LT1K9Y6PMFfHAg9pxwBjF/rEopHAp7JuGV1Mx6q3SWMvBdinbHnei1M2b4jI
 WeMqfn8QRPY4LPWJApspVOaOBa1yKv/xB5273A281nI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/28/19 9:27 AM, Dariusz Marcinkiewicz wrote:
> Hi.
> 
> Should this patch also have an explicit From tag?

Oops, sorry, it was lost at some point.

This is the list of all cec patches for drm:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=cec-drm

The first 5 patches are pushed (drm_dp_cec up to vc4), but the
drm_dp_cec/i915/vc4 patches were pushed too late for kernel 5.4 :-(

So my plan is to get the others in for 5.5. I'll merge the last
two patches that enable the API early in the 5.5 cycle in the media
tree (so right after v5.4-rc1 is released) and work to get the remaining
Acks for the other drm cec patches.

Regards,

	Hans

> 
> On Fri, Aug 23, 2019 at 2:21 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Document the new CEC_ADAP_G_CONNECTOR_INFO ioctl and the new
>> CEC_CAP_CONNECTOR_INFO capability.
>>
>> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
>> Co-developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> [hverkuil-cisco@xs4all.nl: added CEC_CAP_CONNECTOR_INFO]
>> [hverkuil-cisco@xs4all.nl: added DQEVENT have_conn_info]
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
> ...
> 

