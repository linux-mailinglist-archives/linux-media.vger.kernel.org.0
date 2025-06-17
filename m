Return-Path: <linux-media+bounces-35076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 218FFADCC0B
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0925F3A3536
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 12:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB082E06EE;
	Tue, 17 Jun 2025 12:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hSxNEb/l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CBD28BA9C;
	Tue, 17 Jun 2025 12:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164842; cv=none; b=pWr/Ldcrn10deAbsPUepRfsbkEIIHGpXA+H8nbcMppg3mFS4d1Hd0NE8t/ot7SXH4B7kR6xTszjUkeMldg2ZkjuxFtTonk4849SwZ23t1mdTF7fPfIZg+YWtu/AeRYPN8B+IitjBX0kDeNNbl+U+yDvT9wFnWa2zdO/tUvDN7G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164842; c=relaxed/simple;
	bh=nsIHRKezEmziLU1IJs87s8AVlVENslTNvHbXCbMiYU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+2qMkVce9BMOFHxemq6cAVopV5vivMEoA2tlZ8FHYV3NDHHL/AMrlPlSLf5cqdgz1EYy9q4mtHBkukU18V+Bxl8jgSO/Vcx2MZtLA7tY74l99M3u8TG2dxXawbJqDcL/a2O0fyawM0sH9C+2mhGtb82zT4HX+EQAoEkEE2Qlyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hSxNEb/l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2383F7E1;
	Tue, 17 Jun 2025 14:53:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750164827;
	bh=nsIHRKezEmziLU1IJs87s8AVlVENslTNvHbXCbMiYU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSxNEb/lvXWlEa+3gXYqE5B2bVxMRu9v2oMznuyx4M+JvkLkCiTY5/Pz5EqocEb7y
	 T/xr8tCp0h6UhpLch7E5Ut5TXt79xu8TBJg+7mznUGc0wZTtuk3OnA+C9wyb5qbt2v
	 cr9vw7xrjcQGOp6dzcrvkiVA4LDu36ZGRbXnNwFQ=
Date: Tue, 17 Jun 2025 15:53:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
Message-ID: <20250617125343.GB10006@pendragon.ideasonboard.com>
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
 <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org>
 <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
 <b78cde8b-23b2-48c5-b8c6-b935a403963f@kernel.org>
 <CANiDSCuPP+EOCps0gjH_bpJWsbyJDBcD+NoOeTB-sSUjUr0=Sg@mail.gmail.com>
 <61600bf6-92dc-49cd-bad9-a7342ce2fef9@kernel.org>
 <08a426ae-be6e-4cbc-aaaf-7197bf839632@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08a426ae-be6e-4cbc-aaaf-7197bf839632@jjverkuil.nl>

On Tue, Jun 17, 2025 at 01:52:50PM +0200, Hans Verkuil wrote:
> On 16/06/2025 15:38, Hans de Goede wrote:
> > On 16-Jun-25 15:31, Ricardo Ribalda wrote:
> >> On Mon, 16 Jun 2025 at 15:26, Hans de Goede <hansg@kernel.org> wrote:
> >>> On 16-Jun-25 15:22, Ricardo Ribalda wrote:
> >>>> On Mon, 16 Jun 2025 at 15:05, Hans de Goede <hansg@kernel.org> wrote:
> >>>>> On 29-Apr-25 15:47, Ricardo Ribalda wrote:
> >>>>>> When committers contribute quirks to the uvc driver, they usually add
> >>>>>> them out of order.
> >>>>>>
> >>>>>> We can automatically validate that their follow our guidelines with the
> >>>>>> use of keep-sorted.
> >>>>>>
> >>>>>> This patchset adds support for keep-sorted in the uvc driver. The two
> >>>>>> patches can be squashed if needed.
> >>>>>>
> >>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>>>
> >>>>> I've no objections against these 2 patches, but these need to be
> >>>>> rebased on top of the latest uvc/for-next. Can you send out a new
> >>>>> version please ?
> >>>>
> >>>> I was waiting for HansV to say that keep-sorted was useful and then
> >>>> add it to the CI.
> >>>
> >>> Ok, so should we drop this series from patchwork then ?
> >>
> >> If the series does not bother you too much in patchwork let it stay
> >> there until HansV replies to the makefile series.
> 
> I did that. Basically I don't like the keep-sorted annotation unless it
> is rolled out kernel-wide. It's not something we should do just in the
> media subsystem.
> 
> That doesn't mean that a patch fixing the uvc_ids order isn't welcome,
> but just drop the annotation.
> 
> If we do that, then patch 1/2 is also no longer needed. Although it
> feels more logical that match_flags is at the end. I leave that to
> HdG and Laurent to decide.

.match_flags is first to match the order of the fields in the
usb_device_id structure. Is there a need to move it last, or is only the

	}, {

construct that the tool doesn't like ?

> > Sure that works for me.

-- 
Regards,

Laurent Pinchart

