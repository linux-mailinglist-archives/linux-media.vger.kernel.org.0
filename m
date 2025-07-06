Return-Path: <linux-media+bounces-36895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0075BAFA42A
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 11:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 539F53AFE7C
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 09:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BD41FCFFB;
	Sun,  6 Jul 2025 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQAFbB6p"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF515145355;
	Sun,  6 Jul 2025 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751795559; cv=none; b=Z3t/BI9J70foYHKh5EKVTy3SHtyXjJGana5K+4ueM3WhNs8BrkrE/3vc7cYrgyE21O3GFdryW5wg2HEjgLAOxPaq2HYrnWJIhsJ2tirZog7h+Z4ZcBEr9laJ9ryvaNYfHrmQiGIgXQLQOFsxrvhPZMh2ciHOG6LFEkizaXEMeOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751795559; c=relaxed/simple;
	bh=R9AAxE/+829Tt+JSvGzFir/1HWKdhEnNQDZCmYa4sgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGjYI/7AhQdD5Ov7rWqDbqOF3QSmoxwQFqTrEfGTy0MJbnSVgzKFpZqbC75JmTcDfN0Tj1Vebno/dzUuoFYKFe7vwDs8o0zrO+x8UdCcSF6kcH1YdyroCBlV3cxfAD1MaL/W1EzUNacyJRlwLPBo3PJDNUBabY+qI+rarSHx8V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQAFbB6p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44C8C4CEF2;
	Sun,  6 Jul 2025 09:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751795558;
	bh=R9AAxE/+829Tt+JSvGzFir/1HWKdhEnNQDZCmYa4sgQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oQAFbB6pzYYEFkF83535YFt7xjYccWy5TE+0m5kZX8AYLvrz4c2zBpklxXj1fLgJj
	 31rxh7KzC8s0Q5m/ekbdd7s6f0ouY7O9c4XDG9P6ZRJEsjeI7kbfJV4do2I3tUVvu7
	 v/XeSteYxqYkDwJZqw/J6eaRbCJpSh7KwIAp2EawJt/0rA7SteaDsecwwaJrbbiZHx
	 9paBnX1SkwuqOWrZ8kLZByTLF7NreZjcQ4PMKJjgPASaI7hTPMbQlT+OltnSvaz0kw
	 lOpyVXsnVzwa+3FoF1lF+L8KaXVJFL5T8JOmnXRv82yHVwm8LiLjSx06SaTPJuW5J7
	 ICFJPCtWWTS+g==
Message-ID: <c389587a-483b-43f7-9393-cdfd8132df20@kernel.org>
Date: Sun, 6 Jul 2025 11:52:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/23] media: atomisp: gc0310: Add selection API support
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-7-hdegoede@redhat.com>
 <174751450775.281096.10701361397332094857@ping.linuxembedded.co.uk>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <174751450775.281096.10701361397332094857@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kieran,

On 17-May-25 10:41 PM, Kieran Bingham wrote:
> Quoting Hans de Goede (2025-05-17 12:40:49)
>> Add support for the selection API as expected by libcamera.
>>
>> Note the driver only supports a single fixed resolution and
>> no cropping, so this is a simple read-only implementation.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../media/atomisp/i2c/atomisp-gc0310.c        | 42 ++++++++++++++++++-
>>  1 file changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
>> index 756e56f639b7..7902e732a3ca 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
>> @@ -3,7 +3,7 @@
>>   * Support for GalaxyCore GC0310 VGA camera sensor.
>>   *
>>   * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
>> - * Copyright (c) 2023 Hans de Goede <hdegoede@redhat.com>
>> + * Copyright (c) 2023-2025 Hans de Goede <hansg@kernel.org>
>>   */
>>  
>>  #include <linux/delay.h>
>> @@ -352,6 +352,43 @@ static int gc0310_get_fmt(struct v4l2_subdev *sd,
>>         return 0;
>>  }
>>  
>> +static int gc0310_get_selection(struct v4l2_subdev *sd,
>> +                               struct v4l2_subdev_state *state,
>> +                               struct v4l2_subdev_selection *sel)
>> +{
>> +       /* Only the single fixed 656x496 mode is supported, without croping */
>> +       switch (sel->target) {
>> +       case V4L2_SEL_TGT_CROP:
>> +       case V4L2_SEL_TGT_CROP_BOUNDS:
>> +       case V4L2_SEL_TGT_CROP_DEFAULT:
>> +       case V4L2_SEL_TGT_NATIVE_SIZE:
>> +               sel->r.top = 0;
>> +               sel->r.left = 0;
>> +               sel->r.width = GC0310_NATIVE_WIDTH;
>> +               sel->r.height = GC0310_NATIVE_HEIGHT;
>> +               break;
>> +       default:
>> +               return -EINVAL;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int gc0310_set_selection(struct v4l2_subdev *sd,
>> +                               struct v4l2_subdev_state *state,
>> +                               struct v4l2_subdev_selection *sel)
>> +{
>> +       if (sel->target != V4L2_SEL_TGT_CROP)
>> +               return -EINVAL;
>> +
>> +       /* Only the single fixed 656x496 mode is supported, without croping */
>> +       sel->r.top = 0;
>> +       sel->r.left = 0;
>> +       sel->r.width = GC0310_NATIVE_WIDTH;
>> +       sel->r.height = GC0310_NATIVE_HEIGHT;
>> +       return 0;
>> +}
>> +
>>  static int gc0310_detect(struct gc0310_device *sensor)
>>  {
>>         struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>> @@ -509,6 +546,8 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
>>         .enum_frame_size = gc0310_enum_frame_size,
>>         .get_fmt = gc0310_get_fmt,
>>         .set_fmt = gc0310_set_fmt,
>> +       .get_selection = gc0310_get_selection,
>> +       .set_selection = gc0310_set_selection,
> 
> On other sensors I've worked on, we haven't implemented .set_selection()
> unless it can be changed. I think this could be simplified here? - Just
> the implementation in .get_selection should be enough I think ?
> 
> Saves a few lines when it's not configurable.

Right. I'm working on merging this series now (minus the last
patch), preparing an atomisp pull-request for 6.17, addressing
review comments as I go.

I've gone with using get_selection for set_selection while
merging this.

Regards,

Hans





> 
> In imx283.c we have no implementation of .set_selection; though in
> imx335.c - we simply set .set_selection = imx335_get_selection;
> 
> imx415.c also only sets the .get_selection callback ... so maybe I could
> already simplify imx335 too!
> 
> 
> 
>>         .get_frame_interval = gc0310_get_frame_interval,
>>  };
>>  
>> @@ -671,5 +710,6 @@ static struct i2c_driver gc0310_driver = {
>>  module_i2c_driver(gc0310_driver);
>>  
>>  MODULE_AUTHOR("Lai, Angie <angie.lai@intel.com>");
>> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
>>  MODULE_DESCRIPTION("A low-level driver for GalaxyCore GC0310 sensors");
>>  MODULE_LICENSE("GPL");
>> -- 
>> 2.49.0
>>
> 


