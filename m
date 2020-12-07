Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4692D11AB
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 14:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgLGNR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 08:17:26 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:49007 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725772AbgLGNR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 08:17:26 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id mGNbk53Kv2G8DmGNfkuXBW; Mon, 07 Dec 2020 14:16:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607347004; bh=MF0EfDnlGKMhe9aR1KzbnkdEx29Nqv0M4PfQePqxWyc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QGtnvs2ZyKTX7y6TfGTGNTSvsqyr+dD/GMzBlma/V0+EQBAgh//BEQTEF9M7FJ+BY
         sUoq/WZyVDltfiUHbBRIketg9TMPqYEsnnf2DSSQV5BXUVZSPqlhTeMJYiFwz2UXsT
         Nw/d5NYn2wagwukavSwoTdaEonDtN5Jys1YIl5IpfcUfBvRbf5rKL+8gPAlU2O4BT9
         rE466UdM//puNytImE2O65nVAnHKUHkG+WuaROv5RqvYJNLSI4Gozb0+MyuJLp6P4O
         lotNhzlwiDngGpl4KzrWz8fouOs5EGfP45VuVuo0Wy7ViPCYx3jw96Z2Sq/5jq+f2C
         JcQKfhASeDEDQ==
Subject: Re: [PATCH] imx274: remove composition support, add
 V4L2_SEL_TGT_CROP_DEFAULT
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
References: <7940b65c-b5d8-0167-3262-4282f10e873c@xs4all.nl>
 <20201207124655.GY852@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a61e6644-cb94-6ec9-f0e0-1c256bedb0ed@xs4all.nl>
Date:   Mon, 7 Dec 2020 14:16:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201207124655.GY852@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ0zfuLfpzOze/ghBFA2ngG6AF5MTciVuk1SIgoGYhC4XfZcLXFLHIbfw9+EqwTO9KVSShfTQfHfCJFgh2t5BUgh/1QWdF1ksvHepmuGYf0vBv9Neoab
 qVDwk5BXaTa5AWWHYyj+DF5k4yDZNDedBvh2/xIZw5clmHQT0Fw5K4QWSiVE3MfQewm+gWdws4ktkSiOdQCA4eNZ1WaYB42aR12X/6MMLQVOcj20Xd7P8nV9
 fXCUW8Mp3mPeV97+5NIgNkd4SmMc33ts8jHAlm1M/ZlIAtqDK9Ges9J4uNBKswj+fMBB3IWL7zpfTuz8NuPzo4wk+KVCrdZH4FwP+nR9tKdC8ESmhDdCMA0j
 QXQsi6Vv
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/12/2020 13:46, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for the patch.
> 
> On Mon, Dec 07, 2020 at 12:18:55PM +0100, Hans Verkuil wrote:
>> This driver does not support composition, only cropping.
>> Composition means that the sensor can output e.g. 1920x1080,
>> but can compose a cropped 1280x720 image in the middle of the
>> 1920x1080 canvas, filling in the unused area with a background
>> color.
> 
> That's how this would work on V4L2 video nodes...
> 
>>
>> That's not supported at all. So drop the bogus composition support.
> 
> But this is a sub-device driver. On sub-devices the COMPOSE target is used
> for configuring scaling, binning and sub-sampling. I don't know about the
> capabilities of this particular driver but the code
> (__imx274_change_compose function in particular) looks very much such that
> it does support binning.
> 

That should be done via set_fmt. There you select the output width and height.

So if set_fmt sets 1920x1080, and the crop is 960x540, then you scale (or
do binning/sub-sampling). Compose means composing the image into a larger
canvas. For this driver the compose rectangle is always equal to the
format, so set_selection(COMPOSE) is identical to set_fmt().

If it was real composition, then there would have to be a try_compose as
well, just as there is a try_crop. Instead set_selection(COMPOSE) fills in
try_fmt. Clearly wrong.

Regards,

	Hans
