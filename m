Return-Path: <linux-media+bounces-20601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E289B65B4
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 15:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67BC31F21F83
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 14:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F26E1EF95E;
	Wed, 30 Oct 2024 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="j6/0HAXr"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4AB1E907F
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730298348; cv=pass; b=mIHrmwRdmQK6OO5Wlp/EYd+YZFGlo8Bbl/brfPVqjStC8NSsjrvRIQtIlOUF4qGjo4tG1x3HyN0SUQAVxYCOavJg/v7KUToKaS+Bfx5iT3EBewfizr/mQ9bi2QIhKG4z+dYfBd0tinD+NehMaNq5pFn3Eafq+FMQYwirz1Kb3FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730298348; c=relaxed/simple;
	bh=Pl+cp7xhU4WWrDqLC8+Z3u14VGQYLNf2xavVyZQLUr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/tIFWpUdAb5yPXAMXhOUqZUpf4tjyyw1qfD21Z0bIoL9yA5YzSOWZ/ASVr6zuXqu+yl9hmfrkpetZ3Zjupgv8KmVWz5GGPhn/SljrfYy4kPJAt5fWkIuAAU/JPc2LS4g+h9O3aO/YnNlqoRZ28K4x1sr+vek15CZSbHqKyEcfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=j6/0HAXr; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XdqD14ffqz49Pyt;
	Wed, 30 Oct 2024 16:25:37 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1730298338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HVwr3n2q8AZY46NgOcV0ZNqNj+d1OfQGF2snDR1ho4Q=;
	b=j6/0HAXrBsCGZmvle3sCIjEpsEKyr4u46NYgRI62/GfcqCVKi9TqdBP2zngN9RHZRRHw36
	g/Wbk3mfgeETRuXhU2uRXMyKLbjreXLW8a5rOMzSLlIOcBkvs8T5e1D9AZRQdMjsQ46AXX
	VSRFQ/ElksAHAQuz6VkH3B5O713/xhy3SQ13O+HAVkF3yrEPhzaceiSPMKPLkQr1kvxSzM
	AfSlM6S7Zn/7Vf10XmLVx+heT01EzrrAMm+l3HA2SkznHc3LOu+em9J6AkdrV4AQqy3P/F
	QfW7mU964J/xu8Cr+92aqv3JTz5b19Fpn21rfmoUktenkMOXm5qyAJ1hSt7HBg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1730298338; a=rsa-sha256;
	cv=none;
	b=mhfMmQqRUzERDryVagiCw8+tskPBbQrg7tth44FEX6P4qCmQXd0mA3UFo9P1xBBCShiiu+
	q0h2fGfcPF5u/OVVfARQnydhrYN+qSOc7/2QNjX86oi4vIJSh678VSp66q3rxcQAuzp+k8
	QD105xHe3VHPSFSFt3/YSqxhKCsP9XlDyVttfw+W+xNwUKF+b9lZ8TuwctS7rR9aHQmBro
	ftLov/+ZozIzXLdiKiHxi32RKDFq8cgwcqVIjAmwSddmwHrM5pFfGFoFtQmrzi0+mjv3hJ
	fdzgAkuqNSGVAe56aLtHw8qGHv7g414lA3cBbCrGfDO/eyD9CM352GJiKJWLXA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1730298338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HVwr3n2q8AZY46NgOcV0ZNqNj+d1OfQGF2snDR1ho4Q=;
	b=BtwTl5Q803mwnKx6dt8NU5YFhsR/wsLj+MdDc4MGq9ZTV21YHMaJEPj5JbRiDK/INtyx/Z
	f15iTzQYa8VUnV+HP+cINXoZ5yTjosbZxp0iIELTBVXNMKPJzKz5puux/lBWOO4qEI4K/y
	wYHKs6t8yxHQnZQtjLK5F55IUktUo7rRTOeGqNSq31gh0ee2a+KgKmX0V9UT3lQzBNuzIK
	MnaWht3kdE/p36iL+BPF33gN8fS+CXy59A5xbuhvZZvyPEQmGV4rXz8Jdbh/ohM7oZZaec
	X6IICwtyYEeOgGqfM58+ot8ImzRAA2Y8N/Xfn4jsjT5sFBhNIqu7zbsvl7eKmA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1EFF3634C93;
	Wed, 30 Oct 2024 16:25:37 +0200 (EET)
Date: Wed, 30 Oct 2024 14:25:36 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>
Subject: Re: UVC: Privacy gpio as subdevice
Message-ID: <ZyJB4Kxn3Gm79_MH@valkosipuli.retiisi.eu>
References: <CANiDSCuPfmV-0KLrdnvVojvtLR=OsFUzLNhnqM1m_ytvzjoNOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCuPfmV-0KLrdnvVojvtLR=OsFUzLNhnqM1m_ytvzjoNOw@mail.gmail.com>

Hi Ricardo,

On Wed, Oct 30, 2024 at 02:03:18PM +0100, Ricardo Ribalda wrote:
> Hi Hans (de Goede, but others are welcome as well :) )
> 
> Some notebooks have a button to disable the camera (not to be mistaken
> with the mechanical cover). This is a standard GPIO linked to the
> camera via the ACPI table.
> 
> 4 years ago we added support for this button in UVC via the Privacy control.
> This has two issues:
> - If the camera has its own privacy control, it will be masked
> - We need to power-up the camera to read the privacy control gpio.
> 
> We tried to fix the power-up issues implementing "granular power
> saving" but it has been more complicated than anticipated....
> 
> Last year, we proposed a patchset to implement the privacy gpio as a
> subdevice https://lore.kernel.org/linux-media/20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org/
> 
> I think it is a pretty clean solution and makes sense to use a
> subdevice for something that is a sub device of the camera :).
> 
> Before moving forward, Laurent and I would like to hear your opinion.

I remember we discussed this and I wasn't very enthusiastic about the
proposal but thinking about it again, there are situations where this is
the only feasible solution, including on raw cameras with a privacy GPIO,
besides the first issue you brought up above.

Regarding the second one, why would you need to power on the camera to get
the GPIO's value?

I'll review the set.

While in the case of UVC it's fairly clear what the sub-device is related
to, but for the general case it'd be good to have an ancillary link there.

-- 
Regards,

Sakari Ailus

