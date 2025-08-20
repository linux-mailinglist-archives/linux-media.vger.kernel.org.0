Return-Path: <linux-media+bounces-40407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F154B2DD1A
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C59071893C46
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BF831A053;
	Wed, 20 Aug 2025 12:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="onRefnT6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AE521ABB0;
	Wed, 20 Aug 2025 12:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755694606; cv=none; b=E+RWZMe5VjVAAUMP1erSo9NF2uI59YLUUyx+nxkh8aHdsnvVOzVLg+AMiJ4xuEuY18HEInyOn7aSMW42kDqtPDu2FklyV2n8LS04nNF6xQSnNEsg0FOsuc9onB/aOrHZmHYrTpRJPhh/9158M2HCJdgoU32zP2ws2ERYc/FsF8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755694606; c=relaxed/simple;
	bh=sRLP8uWIXlFBFWspOK+jP+grjVNRkERyBQLI1QwsgAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncRXFwlAe0mszTlRws7IvHR5GOirvp3MvG35QzDWmINolfZFxsdwkoBaxe3GJOaNJGdrw+wmIpoqAZsArcSeenhApUbx1Y3S+eTos6LDW309sHNe6XdmqLJyE7/rVcB0CZpWb8jPPbZQHDYUUwy63Hh9XfFPAQ4STA0sRsL+nQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=onRefnT6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-62-213.net.vodafone.it [5.90.62.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18666606;
	Wed, 20 Aug 2025 14:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755694544;
	bh=sRLP8uWIXlFBFWspOK+jP+grjVNRkERyBQLI1QwsgAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onRefnT6f30y52EvmkxgBRSnUq0H0g9RrMmNzR3HILYC4uIypuh2U68PGD1bkmKpT
	 IOPbJDQVeGY3NQV9Bcsis5XbeixWkis+VBq/zP/upJ9/PDctnGwqr7Az8hxkvylkcE
	 khM+GSQzt+KzTIoTkVxTdSJQZ6xGqnPeFm4yigR4=
Date: Wed, 20 Aug 2025 14:56:38 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Aliaksandr Smirnou <support@pinefeat.co.uk>, 
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: jacopo.mondi@ideasonboard.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: Pinefeat cef168 lens control board
 driver
Message-ID: <d2ka3glpjiisjs7ydx7knzzfb2dzi2lyc2r7d4hppqor33xate@2evtuolz6wah>
References: <4qxxvvzxbbdukjn5ykjxhgj6kp2yqd4bidpl74ozbrwtt2jgjj@ipleqjgnnpys>
 <20250819213234.18378-1-support@pinefeat.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819213234.18378-1-support@pinefeat.co.uk>

Hello
  +cc Hans

On Tue, Aug 19, 2025 at 10:32:34PM +0100, Aliaksandr Smirnou wrote:
> Hi Jacopo,
>
> Thank you for the review. Your remarks are very helpful. While I'll apply
> most of them, could you clarify the one regarding pm_runtime_ for me?
>
> On Tue, 19 Aug 2025 15:47:54 +0200, Jacopo Mondi wrote:
> > > +#include <linux/crc8.h>
> >
> > Do you need to "select CRC8" in Kconfig then ?
>
> Yes, I'll include it.
>
> > > +#include "cef168.h"
> >
> > Why an header file ?
>
> Ok, I'll remove the header moving everying in the .c file.
>
> > > +	for (retry = 0; retry < 3; retry++) {
> >
> > This seems a bit random, why do you need to retry three times ?
>
> The driver retries writes to work around an issue in the Raspberry
> Pi's I2C hardware, where the BCM2835 mishandles clock stretching.
> When the slave stretches the clock, the Pi can misread the SCL line
> or sample data too early, making it think the write failed. To
> improve reliability, the kernel driver automatically retries the
> write, effectively compensating for the hardware's timing bug.
>

mmm, usually a mainline driver is not the right place for introducing in
workarounds for a specific host/soc, as the assumption is that the
driver should work on all platforms equally.

Your case is certainly different as this product is pi-specific...

With a comment I wouldn't mind too much. Maybe others do :)

> > > +	    ctrl->id != CEF168_V4L2_CID_CUSTOM(data) &&
> > > +	    ctrl->id != CEF168_V4L2_CID_CUSTOM(focus_range) &&
> > > +	    ctrl->id != CEF168_V4L2_CID_CUSTOM(lens_id))
> > > +		return -EINVAL;
> >
> > If you mark them WRITE_ONLY wouldn't the core take care of this ?
>
> These controls are read-only. The data they return depens on the lens.
>

Sorry, I wasn't clear.

If you mark as WO the controls you don't accept here, will the core
handle this for you ?

> > > +	struct cef168_data data;
> >
> > I thought the compiler would complain for variables declared not at
> > the beginning of the function
>
> Ok, I'll move the variable at the beginning.
>
> > > +	pm_runtime_set_active(&client->dev);
> >
> > Is the device powered up at this point ?
> > If you depend on the pm_runtime_resume_and_get() call in open() to
> > power the device up, then you need to depend on PM in KConfig ?
>
> Yes, the device powers from 3v3 rail of a SBC, which makes it powered
> up as soon as the SBC is up. Given that, should I remove all code
> around Power Management Runtime (pm_runtime_*) as redundant?
>

Yes, I overlooked the fact you don't regiser any resume/suspend
routine, so your calls to pm_runtime_set_active/pm_runtime_put are
nops (they do at least provide usage counting, but I would anyway
remove them).

> > > +#define CEF168_V4L2_CID_CUSTOM(ctrl) \
> > > +	((V4L2_CID_USER_BASE | 168) + custom_##ctrl)
> >
> > I think you need to reserve space for your controls in
> > include/uapi/linux/v4l2-controls.h
> >
> > otherwise this will never be visible to applications ?
>
> I found there is no need for that. Custom control become available
> automatically by name via the v4l2-ctl utility. For example, the focus
> range can be read directly in the terminal as follows:
>
> v4l2-ctl -d $DEV_LENS -C focus_range
>

Yes the driver enuemrates them, but you need to add them to the main
header, otherwise USER_BASE | 168 will be take by someone else.

See in example 7c8c957ef12c41968adb66d785ce1dd5fb2f96e7 which is the
latest commit that adds a custom control space.

Hans, do we need a uapi header file with the definition of the custom
controls registered by this driver ?

Thanks
  j

> > > +/**
> > > + * cef168 data structure
> >
> > No need to kerneldoc unless you properly document all fields and
> > include the file in some of the Documentation/
>
> OK, I'll remove the comment above the structure.
>
> Kind regards,
>   Aliaksandr

