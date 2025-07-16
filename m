Return-Path: <linux-media+bounces-37825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 170BCB06A54
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 02:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B2054E4595
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 00:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463744A3E;
	Wed, 16 Jul 2025 00:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bgku7uGO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BDD20EB;
	Wed, 16 Jul 2025 00:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752624731; cv=none; b=BIAfJ5ZIkgk2eVS/sTaBNLDrO3NIC/+93B4tcaAqn1lqVp1CKbsG1RUQKGNsR2vrr5jXcuZ76kxKnUI0C6wBtmBVZ0GzzZZ4ohcMUv8+UgsWmXTV8rEC6osonQfyvaS+zsTKMlWY9UrnVy+10KdMHDdz/iQb8Uf/UeBOB0wSYSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752624731; c=relaxed/simple;
	bh=+u/jGslySO5xdEMu6aS2DWSW2tM57c6IFs/o/Dq1cTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zap7YutDzEr6JlTfJnLx0A1UuWfylhUD5ZWF7qeRDbIEdCBZvwjMJNsFq2oVmaU0BlYN6+WkJ2K9fKgdvM03jhJI9fXDdTOpukQzZPpZEcyQDpjeBCu/Bp6jppo4Hi59BZVhgkJZDsw+YqlfQSQTVvhfnLwi+r2WorC2+Wpbvew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bgku7uGO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 09DC07E1;
	Wed, 16 Jul 2025 02:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752624695;
	bh=+u/jGslySO5xdEMu6aS2DWSW2tM57c6IFs/o/Dq1cTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bgku7uGOMTCaysTpNMft5AZXqXl0YiW1UrpfPX5noFDwzB5JBnBTyjBsPwqc+tpX4
	 ahxSUVI6sC3YdCI5nlztvabrX3Yd/82X6CY00VQsLB1d6uqI5eSA9t1T7YNKDrUb1K
	 DGkxup6Gv6HQ3Szlaz+6a4vttnwYaFJXMM1NJZxM=
Date: Wed, 16 Jul 2025 03:12:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, ribalda@chromium.org,
	jai.luthra@ideasonboard.com, laurentiu.palcu@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, julien.vuillaumier@nxp.com,
	celine.laurencin@nxp.com
Subject: Re: [RFC 0/2] Add standard exposure and gain controls for multiple
 captures
Message-ID: <20250716001205.GG19299@pendragon.ideasonboard.com>
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250715235952.GE19299@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715235952.GE19299@pendragon.ideasonboard.com>

On Wed, Jul 16, 2025 at 02:59:54AM +0300, Laurent Pinchart wrote:
> On Fri, Jul 11, 2025 at 01:05:42AM +0300, Mirela Rabulea wrote:
> > Add new standard controls as U32 arrays, for sensors with multiple
> > captures: V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI and
> > V4L2_CID_DGAIN_MULTI. These will be particularly useful for sensors
> > that have multiple captures, but the HDR merge is done inside the sensor,
> > in the end exposing a single stream, but still requiring AEC control
> > for all captures.
> 
> It's also useful for sensors supporting DOL or DCG with HDR merge being
> performed outside of the sensor.

Regarless of where HDR merge is implemented, we will also need controls
to select the HDR mode. We have V4L2_CID_HDR_SENSOR_MODE, which doesn't
standardize the values, and that's not good enough. At least for DOL and
DCG with HDR merge implemented outside of the sensor, we need to
standardize the modes.

Can you tell which sensor(s) you're working with ?

> > All controls are in the same class, so they could all be set
> > atomically via VIDIOC_S_EXT_CTRLS, this could turn out to be
> > useful in case of sensors with context switching.
> 
> Agreed, we should be able to set them all. Are we still unable to set
> controls from multiple classes atomatically ? I thought that limitation
> has been lifted.
> 
> > Each element of the array will hold an u32 value (exposure or gain)
> > for one capture. The size of the array is up to the sensor driver which
> > will implement the controls and initialize them via v4l2_ctrl_new_custom().
> > With this approach, the user-space will have to set valid values
> > for all the captures represented in the array.
> 
> I'll comment on the controls themselves in patch 2/2.
> 
> > The v4l2-core only supports one scalar min/max/step value for the
> > entire array, and each element is validated and adjusted to be within
> > these bounds in v4l2_ctrl_type_op_validate(). The significance for the
> > maximum value for the exposure control could be "the max value for the
> > long exposure" or "the max value for the sum of all exposures". If none
> > of these is ok, the sensor driver can adjust the values as supported and
> > the user space can use the TRY operation to query the sensor for the
> > minimum or maximum values.
> 
> Hmmmm... I wonder if we would need the ability to report different
> limits for different array elements. There may be over-engineering
> though, my experience with libcamera is that userspace really needs
> detailed information about those controls, and attempting to convey the
> precise information through the kernel-userspace API is bound to fail.
> That's why we implement a sensor database in libcamera, with information
> about how to convert control values to real gain and exposure time.
> Exposing (close to) raw register values and letting userspace handle the
> rest may be better.
> 
> > Mirela Rabulea (2):
> >   LF-15161-6: media: Add exposure and gain controls for multiple
> >     captures
> >   LF-15161-7: Documentation: media: Describe exposure and gain controls
> >     for multiple captures
> 
> Did you forget to remove the LF-* identifiers ? :-)
> 
> > 
> >  .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c            |  8 ++++++++
> >  include/uapi/linux/v4l2-controls.h                   |  3 +++
> >  3 files changed, 23 insertions(+)

-- 
Regards,

Laurent Pinchart

