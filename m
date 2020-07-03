Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4C4213385
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 07:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgGCFa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 01:30:29 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:4207 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgGCFa2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 01:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=xo/yFsIAH0GxZVvWQN4dcotC0B+sVKlHywCMEHdZj84=;
        b=Ug/CemuDgKYvlu2Qx6uhDhWVfr1VGAy0fE7F3Ummi3+E+e/Fajw29wFtWCRnLeOOPDwC
        dAqUtKFb6Q9Y35WrwYnzyxrHVoDnMSDi5r1tEwqiiupfxBQ2OzLzP9tLuzYQMHguEAqe+y
        g498jJG33HAuScDN6VDmrfrGLGCVle2AI=
Received: by filterdrecv-p3iad2-5b55dcd864-htmgx with SMTP id filterdrecv-p3iad2-5b55dcd864-htmgx-19-5EFEC273-3E
        2020-07-03 05:30:27.459439939 +0000 UTC m=+562871.433873292
Received: from [192.168.1.14] (unknown)
        by ismtpd0001p1lon1.sendgrid.net (SG) with ESMTP
        id cXBFHwICSHqXLOSNxkTYEw
        Fri, 03 Jul 2020 05:30:26.947 +0000 (UTC)
Subject: Re: [PATCH 1/9] media: rkvdec: h264: Support profile and level
 controls
References: <20200701215616.30874-1-jonas@kwiboo.se>
 <20200701215616.30874-2-jonas@kwiboo.se>
 <8daa49704a14764bfe0797cbf802bad3d64ede17.camel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <75d272ab-2d48-6dc6-3b60-22d5922ffd1e@kwiboo.se>
Date:   Fri, 03 Jul 2020 05:30:27 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8daa49704a14764bfe0797cbf802bad3d64ede17.camel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h4Z+dcM8ZpwQOxt2G?=
 =?us-ascii?Q?ICtVrzf2oTwZNCSv0ks9a+2RgvuYykgsmzmux9o?=
 =?us-ascii?Q?Qfdih03syJU216qxX4s2inLWcN4rbDXU2kOo1bN?=
 =?us-ascii?Q?cUCGJalpNO+PGXq+mALCXdnpGKTkHmikPGOr3CR?=
 =?us-ascii?Q?mhM58oSD93oMBueu8+1wxXxuu+X8lVDIHK8DBKf?=
 =?us-ascii?Q?wfEVRDXF8aLfxDQ=2FADREg=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-07-03 04:54, Ezequiel Garcia wrote:
> On Wed, 2020-07-01 at 21:56 +0000, Jonas Karlman wrote:
>> The Rockchip Video Decoder used in RK3399 supports H.264 profiles from
>> Baseline to High 4:2:2 up to Level 5.1, except for the Extended profile.
>>
>> Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE and the
>> V4L2_CID_MPEG_VIDEO_H264_LEVEL control, so that userspace can query the
>> driver for the list of supported profiles and level.
>>
>> In current state only Baseline to High profile is supported by the driver.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> 
> I think the patch is good so:
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> However, feel free to just drop this patch and support the profiles
> and levels at the end of the patchset, once High 10 and High 422
> support is there.

Sure, that makes more sense, will move to end in v2.

Regards,
Jonas

> 
> Thanks,
> Ezequiel
> 
>> ---
>>  drivers/staging/media/rkvdec/rkvdec.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
>> index 0f81b47792f6..b1de55aa6535 100644
>> --- a/drivers/staging/media/rkvdec/rkvdec.c
>> +++ b/drivers/staging/media/rkvdec/rkvdec.c
>> @@ -94,6 +94,19 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>>  		.cfg.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>>  		.cfg.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>>  	},
>> +	{
>> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
>> +		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
>> +		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>> +		.cfg.menu_skip_mask =
>> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
>> +		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
>> +		.cfg.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
>> +		.cfg.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
>> +	},
>>  };
>>  
>>  static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
> 
> 
