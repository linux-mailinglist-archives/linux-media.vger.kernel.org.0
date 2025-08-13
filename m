Return-Path: <linux-media+bounces-39828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DD3B2540F
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 321D21C28377
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 19:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CC584E07;
	Wed, 13 Aug 2025 19:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="f9YHsGSx"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1FB2F9984
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 19:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755114369; cv=pass; b=hAMJKo8UdVq8+dqrbd9oqcgrUVwtrnJk26OucMvd09n/1Oxz/kP5HdSZ+/ajy2RBtjnVEYSo4Z9sKSuNw65KqzkMSEBqNo561CZbwpLZbntk0Y6ckA/mJIzujC2ECFiouEgfw6603krjKH2oCkOFNnjk4mlYJwlg+JlIyOumk6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755114369; c=relaxed/simple;
	bh=+KhYp1URurjTSWBb9BdbJUik6KSIdwJiwZAufDr5ZOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntQn0wP8D985G/iqQPHY4D218ICQ2JGe3EkK5SD/JesqLDSINxnQzHr9KGSinzUwEsAh0AElEnBBrqt2g/yU4LHHqd12xWOpJUj+dH6g8EuLjFhnGctu62TABYHTd2cdwgvBmOblL8sMcvYWzRxb4cAAjZmHdn+2MJZpE8ZS4wA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=f9YHsGSx; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c2JlF6LVWzyQx;
	Wed, 13 Aug 2025 22:46:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1755114363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gAajVmweKJ6gWmyFn2Y+3h6ejiKMytJq+h7yu3wwKBY=;
	b=f9YHsGSxCQOwMwGgYH/cfXQo2bZOeiyeTbmENCTNt+IpwVERVSpsQcab0j9mfy976br2gC
	Y8RniI9VpMHjysMT/NuW40ewg1rWOjtzp3XDmBWt3XxFPZlZI9DEqR5RxA54nLFGCl2XO+
	Fq9XrL3iGfrWNdvB+ChoM1PuA382Dtk=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1755114363; a=rsa-sha256; cv=none;
	b=gkzgEe2aksV0vO34onLZB9MJFM4/RogqtDvDnFXJ9eCO0iCCWc2+67BJQVtpDqlnxeyYqZ
	biRWOPQb3w4APUltLpHvBksFoyMoKGj7uSnCO3QIDrCUAoe+uMhz3FTm83VMsgDlUea8x1
	3VvlIibPJjmz5wcp5ubeyT3C+teO0dE=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1755114363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gAajVmweKJ6gWmyFn2Y+3h6ejiKMytJq+h7yu3wwKBY=;
	b=pUK63Ah32MchOuAUYKD60LzEsuzd1ZkYMhkOqAkkAU4RejDtYiLjXuC95LYEa/17DAQ6jZ
	tgAAfMbN8pGMFzynsA9ZHyMKlKaBUAsaPSHKrjAeQ7eL3web16Z1gUe2CARTpZ2GxHHDKi
	kwRnR8yW4ZwrTUDprrCvdiYoJMuYlgY=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4F9B2634C93;
	Wed, 13 Aug 2025 22:45:11 +0300 (EEST)
Date: Wed, 13 Aug 2025 19:45:11 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	stanislaw.gruszka@linux.intel.com, hdegoede@redhat.com,
	arnd@arndb.de, alain.volmat@foss.st.com, andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com,
	hansg@kernel.org, jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com, khalasa@piap.pl, mani@kernel.org,
	m.felsch@pengutronix.de, matthias.fend@emfend.at,
	mchehab@kernel.org, michael.riesch@collabora.com,
	naush@raspberrypi.com, nicholas@rothemail.net,
	nicolas.dufresne@collabora.com, paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com, pavel@kernel.org, rashanmu@gmail.com,
	ribalda@chromium.org, slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 01/48] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <aJzrR8Nwy9u7-6Yo@valkosipuli.retiisi.eu>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
 <cd5ac9a7-ada2-4bdf-bc81-8290f0eb88d6@kernel.org>
 <aJyMOEs9UeiudvXh@valkosipuli.retiisi.eu>
 <20250813130831.GG20174@pendragon.ideasonboard.com>
 <70ef88ba-b7b0-488c-a5d7-f90421a1bfda@kernel.org>
 <aJymFgQQcIZVk2jX@kekkonen.localdomain>
 <46b76530-023f-4f36-bec3-1d3ab79c682c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46b76530-023f-4f36-bec3-1d3ab79c682c@kernel.org>

Hi Hans,

On Wed, Aug 13, 2025 at 05:14:42PM +0200, Hans Verkuil wrote:
> On 13/08/2025 16:49, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Wed, Aug 13, 2025 at 03:23:18PM +0200, Hans Verkuil wrote:
> >> On 13/08/2025 15:08, Laurent Pinchart wrote:
> >>> On Wed, Aug 13, 2025 at 12:59:36PM +0000, Sakari Ailus wrote:
> >>>> On Wed, Aug 13, 2025 at 12:15:29PM +0200, Hans Verkuil wrote:
> >>>>> On 26/06/2025 15:33, Mehdi Djait wrote:
> >>>>>> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> >>>>>> platforms to retrieve a reference to the clock producer from firmware.
> >>>>>>
> >>>>>> This helper behaves the same as devm_clk_get() except where there is
> >>>>>> no clock producer like in ACPI-based platforms.
> >>>>>>
> >>>>>> For ACPI-based platforms the function will read the "clock-frequency"
> >>>>>> ACPI _DSD property and register a fixed frequency clock with the frequency
> >>>>>> indicated in the property.
> >>>>>>
> >>>>>> This function also handles the special ACPI-based system case where:
> >>>>>> The clock-frequency _DSD property is present.
> >>>>>> A reference to the clock producer is present, where the clock is provided
> >>>>>> by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> >>>>>> In this case try to set the clock-frequency value to the provided clock.
> >>>>>
> >>>>> On irc I wondered about the name of the new function since it is sensor
> >>>>> specific, and if it can also be used for e.g. video receivers, then it
> >>>>> should be renamed to something more generic.
> >>>>>
> >>>>> According to Laurent there is no ACPI standard for video receivers, so
> >>>>> that's the reason this is sensor specific.
> >>>>>
> >>>>> I'd like to see that documented in this patch. Either in the commit log,
> >>>>> or, preferred, in the header in the function description.
> >>>>
> >>>> Given this patch has been around for quite some time and I've sent a PR on
> >>>> it, I'd prefer to proceed with the current PR. I'm fine with adding more
> >>>> documentation though if you think we should do that.
> >>>
> >>> How about a separate patch that Hans can merge just on top of your PR ?
> >>> Could you send one ?
> >>
> >> I'd like to have the rationale of why this is a sensor-only function
> >> documented. If I wondered about that, then someone else will likely have
> >> the same question.
> >>
> >>>
> >>>>> I made a suggestion below.
> >>>>>
> >>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>>>> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> >>>>>> ---
> >>>>>>  drivers/media/v4l2-core/v4l2-common.c | 52 +++++++++++++++++++++++++++
> >>>>>>  include/media/v4l2-common.h           | 27 ++++++++++++++
> >>>>>>  2 files changed, 79 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> >>>>>
> >>>>> <snip>
> >>>>>
> >>>>>> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> >>>>>> index 0a43f56578bc..1c79ca4d5c73 100644
> >>>>>> --- a/include/media/v4l2-common.h
> >>>>>> +++ b/include/media/v4l2-common.h
> >>>>>> @@ -100,6 +100,7 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
> >>>>>>  struct v4l2_device;
> >>>>>>  struct v4l2_subdev;
> >>>>>>  struct v4l2_subdev_ops;
> >>>>>> +struct clk;
> >>>>>>  
> >>>>>>  /* I2C Helper functions */
> >>>>>>  #include <linux/i2c.h>
> >>>>>> @@ -620,6 +621,32 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> >>>>>>  			     unsigned int num_of_driver_link_freqs,
> >>>>>>  			     unsigned long *bitmap);
> >>>>>>  
> >>>>>> +/**
> >>>>>> + * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
> >>>>>> + *	for a camera sensor.
> >>>>>> + *
> >>>>>> + * @dev: device for v4l2 sensor clock "consumer"
> >>>>>> + * @id: clock consumer ID
> >>>>>> + *
> >>>>>> + * This function behaves the same way as devm_clk_get() except where there
> >>>>>> + * is no clock producer like in ACPI-based platforms.
> >>>>>> + *
> >>>>>> + * For ACPI-based platforms, the function will read the "clock-frequency"
> >>>>>> + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> >>>>>> + * in the property.
> >>>>>> + *
> >>>>>> + * This function also handles the special ACPI-based system case where:
> >>>>>> + *
> >>>>>> + * * The clock-frequency _DSD property is present.
> >>>>>> + * * A reference to the clock producer is present, where the clock is provided
> >>>>>> + *   by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> >>>>>> + *
> >>>>>> + * In this case try to set the clock-frequency value to the provided clock.
> >>>>>
> >>>>>     *
> >>>>>     * While ACPI has standardized sensor support, there is no standard support for
> >>>>>     * e.g. video receivers. So this function is specific to sensors, hence the
> >>>>>     * chosen function name.
> >>>>>
> >>>>> Better suggestions are welcome.
> >>>>
> >>>> ACPI itself does not standardise camera sensor support. What driver authors
> >>>
> >>> But there's a de facto standard that makes this helper function
> >>> suitable, isn't there ?
> >>>
> >>>> should know indeed is that this function provides a clock that can be at
> >>>> least queried for frequency, independently of how that clock is controlled
> >>>> or how its frequency is configured.
> >>>>
> >>>> How about:
> >>>>
> >>>>  * This function may be used in camera sensor drivers only.
> >>
> >> That just restates what is also in the function name. It's the 'why' that I'd
> >> like to know. Even if you simply don't know if this will work for non-sensor
> >> driver, just stating that will help.
> > 
> > As I replied on #linux-media:
> > 
> > devm_v4l2_sensor_clk_get() in practice provides a clock to camera sensors
> > which is what they need; other types of devices generally don't care much
> > about clocks. Why camera sensors are special is that they have a PLL and a
> > CSI-2 RX the configuration of which depend on the external clock.
> > 
> > Is something like this what you're looking for, or something more
> > elaborate? There are different ways the clock can be obtained but I'm not
> > sure we'll need to go to that in the function documentation.
> > 
> 
> Yes, that's sufficient. If you can make a patch adding that, then I'll add it
> to the PR. No need to make a new PR for this, I can just add it myself.

Ack, Ḯ'll post the patch tomorrow.

-- 
Regards,

Sakari Ailus

