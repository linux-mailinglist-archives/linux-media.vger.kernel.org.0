Return-Path: <linux-media+bounces-20639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 671589B78DE
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 11:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 993A61C233DD
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AD919AA41;
	Thu, 31 Oct 2024 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ipfmD2k9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA16199FCD
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730371351; cv=none; b=pdzzlaEuXVw2+T5RSc+oVjLzhbsFrnJiA2cIBaIxfQK0ZCtKYBO9hqdsuAi672/Cs3KFXDoTGwcRSUST2ublBTtTnDquuLEpuqDyFqmbWDubo2L+QtddqYtuTYIbrlg97X+/2IO1mGVVC8PoSlL08IMXwTlGQviguOScq7xWD9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730371351; c=relaxed/simple;
	bh=Tb2AAyxawFX+WuFvZpBTwXf7Ij/FAORlAwfN5kr3Z4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSztFCOy1Mjr5i7GIcuGrnNuhZugTg61bprPTrjVuROqoX5YhGPzz7v3zOptiFSB7n2L3DmNxgql2mL2TxgSX5Wu5/AROD3CXFrqQdUSsPCSGW9nDiuBJmX206o0iutIOShYDd1rQ2jxcg2dnv3wJ4IrDQOuVNd1ejw7dt+X+dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ipfmD2k9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FB479EC;
	Thu, 31 Oct 2024 11:42:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730371343;
	bh=Tb2AAyxawFX+WuFvZpBTwXf7Ij/FAORlAwfN5kr3Z4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipfmD2k9hrw7BRVh4ParJIsL3apuOpHhsYHzT5h26zqOMlq69Hmd8D4V+jnmkUCnX
	 Dc79/n20Mn0gYLuvIzykpO/zXxGFyGv/6rbXOXKEA4CxwtmVyU87G2DCIy8RmsRjZl
	 7ejwEvs89/NIOZE2nMPKmnMjT6o0KZjXSo7bD0DQ=
Date: Thu, 31 Oct 2024 12:42:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH] Documentation: media: improve
 V4L2_CID_MIN_BUFFERS_FOR_*, doc
Message-ID: <20241031104219.GF2473@pendragon.ideasonboard.com>
References: <93d078e5-deba-4060-a32e-94bce677453c@xs4all.nl>
 <20241031101141.GD2473@pendragon.ideasonboard.com>
 <2a61ded3-4cea-4a1a-9d16-aa74dbb22f74@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a61ded3-4cea-4a1a-9d16-aa74dbb22f74@xs4all.nl>

On Thu, Oct 31, 2024 at 11:26:47AM +0100, Hans Verkuil wrote:
> On 10/31/24 11:11, Laurent Pinchart wrote:
> > Hi Hans,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Oct 31, 2024 at 08:50:04AM +0100, Hans Verkuil wrote:
> >> Clearly state that the V4L2_CID_MIN_BUFFERS_FOR_OUTPUT and
> >> V4L2_CID_MIN_BUFFERS_FOR_CAPTURE controls are required for
> >> stateful codecs.
> > 
> > Wouldn't it be better for this kind of information to be centralized in
> > a stateful decoder document ? That would make it easier for developers
> > to see all they need to implement. Otherwise they would need to read
> > through the whole documentation to pick the parts of the API they need
> > to support in their drivers.
> 
> It's also already mentioned in the documentation for the stateful de/encoders here:
> 
> https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-mem2mem.html

OK, then it's fine to have it here too I think.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Also, once this vicodec patch is merged:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/1dd09050-40ca-4c5b-b985-819731140388@xs4all.nl/
> 
> I plan to push v4l2-compliance patches that explicitly test for the presence of
> these controls and fail if they are missing (like they are now in vicodec).
>
> >> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> >> ---
> >>  Documentation/userspace-api/media/v4l/control.rst | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> >> index 57893814a1e5..9253cc946f02 100644
> >> --- a/Documentation/userspace-api/media/v4l/control.rst
> >> +++ b/Documentation/userspace-api/media/v4l/control.rst
> >> @@ -290,13 +290,15 @@ Control IDs
> >>      This is a read-only control that can be read by the application and
> >>      used as a hint to determine the number of CAPTURE buffers to pass to
> >>      REQBUFS. The value is the minimum number of CAPTURE buffers that is
> >> -    necessary for hardware to work.
> >> +    necessary for hardware to work. This control is required for stateful
> >> +    decoders.
> >>
> >>  ``V4L2_CID_MIN_BUFFERS_FOR_OUTPUT`` ``(integer)``
> >>      This is a read-only control that can be read by the application and
> >>      used as a hint to determine the number of OUTPUT buffers to pass to
> >>      REQBUFS. The value is the minimum number of OUTPUT buffers that is
> >> -    necessary for hardware to work.
> >> +    necessary for hardware to work. This control is required for stateful
> >> +    encoders.
> >>
> >>  .. _v4l2-alpha-component:
> >>

-- 
Regards,

Laurent Pinchart

