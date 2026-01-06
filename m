Return-Path: <linux-media+bounces-50045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8886CF92C8
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 16:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE95A3065904
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 15:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3660434A3D6;
	Tue,  6 Jan 2026 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D9Stvqt7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D622C349AFF;
	Tue,  6 Jan 2026 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714339; cv=none; b=A8yiaylwCo2XUpJTlB9XOriAY5qX8O8h9/VbL/zB02N4bqj2vpqoPT2Khg6Hu5vtzZh9FTUSN8Pcf+gu4cJCvKhdWeVUYlVlBAnfYIHiUVL3k16wxtHhp44VbAVrQsX1KiGtMBITAISmgJ5t0QOUwDDoB3VedFylRqFqCS63TvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714339; c=relaxed/simple;
	bh=WT6BNwrPhPWo4DHZ9uzj/okZUUynwu/RCfbLhLGHEOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcRQ7XLOxyFpnrFpi/oGJZGgcBLn4zNp9NXCgxbYLMS/V3NJSCGnxDDBzUvm86ez0nQLWNUuSPJ4Ics9ZItqw0Sj1CpwU6EshDGPVAZOA9HhIuCBL3tIp8N1IrF/mKqmXWShg4G5Cu68MqTve5UEt7pIpbBhJJ9L/HOBT9usYsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D9Stvqt7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E505578E;
	Tue,  6 Jan 2026 16:45:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767714315;
	bh=WT6BNwrPhPWo4DHZ9uzj/okZUUynwu/RCfbLhLGHEOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9Stvqt7KjyOdq8m53e30iNqmCP4kxs/nb2MNNxtaAtwrr/5C+MjZvfSzaPg8mOhc
	 /4b8yyYKuY/C1Yd+JA/775Q7FpzWeI2VutOBhaH1jyRVXoxlcJMKq80HZHJrfikbjk
	 AZWqVrzH/Q4PhD1WwxaFu15F97ikQ/Ma+Sa4TkkA=
Date: Tue, 6 Jan 2026 17:45:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH 1/4] media: dw100: Implement V4L2 requests support
Message-ID: <20260106154517.GD26157@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-1-65af34d04fd8@ideasonboard.com>
 <40dfd12b585681d8edf9641967160c086cc120c3.camel@ndufresne.ca>
 <20260106003302.GJ10026@pendragon.ideasonboard.com>
 <176770897731.12184.12302111059048415045@localhost>
 <20260106145354.GB26157@pendragon.ideasonboard.com>
 <f4eef909a0f9b787dd4720fe005de0c4e41f5c5a.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4eef909a0f9b787dd4720fe005de0c4e41f5c5a.camel@ndufresne.ca>

On Tue, Jan 06, 2026 at 10:41:56AM -0500, Nicolas Dufresne wrote:
> Hi Laurent,
> 
> Le mardi 06 janvier 2026 à 16:53 +0200, Laurent Pinchart a écrit :
> > CC'ing Hans Verkuil for two questions below.
> > > 
> 
> [...]
> 
> > > The docs say "a buffer that was never queued to the driver but is
> > > associated with a queued request was canceled..." So to my understanding
> > > the only purpose of this function is to mark all controls in the request
> > > as being handled, so that the request can be finished.
> > 
> > That doesn't explain why it should be done twice per request. Hans,
> > could you clarify this ?
> 
> I explained it in another thread, it is only called if device_run() is not going
> to be called, so only once. vb2 does not have access to the the control handler,
> so it can't call the v4l2_ctrl_request_complete() fonction directly.

But the function is called per queue. If a buffer has been queued on
both the capture and the output queue for a request, won't the operation
be called twice with the same request ?

> [...]
> 
> > > Nicolas, if I go you right you mean that one might be tempted to do
> > > 
> > > v4l2_ctrl_request_setup()
> > > v4l2_m2m_buf_done(src)
> > > v4l2_m2m_buf_done(dst)
> > > v4l2_ctrl_request_complete()
> > > 
> > > which feels natural from the names of the functions, but the
> > > v4l2_m2m_buf_done(src) might complete the request if it has no
> > > associated controls and therefore the later v4l2_ctrl_request_complete()
> > > would fail...
> > > 
> > > I see that the usage of v4l2_m2m_buf_done_and_job_finish() is more
> > > compact and will use that in v2. For the sake of understanding: The only
> > > functional issue with my code is that v4l2_m2m_buf_done(src_buf) is
> > > called before v4l2_m2m_buf_done(dest_buf), right?
> > 
> > Is that an issue, why would the destination buffer need to be completed
> > first ?
> 
> The VB2 media_request_object is being removed from the request once the OUTPUT
> (src) buffer is marked done. If this was the last media_request_object, the
> request will move to completed state, which will signal its FD.

I'll reply to this separately, I need to read the code first.

> If you do that before you mark the CAPTURE (dst) buffer as done, an application
> that uses non blocking IOs may endup calling DQBUF(dst) too soon, which will
> return EBUSY. Since we really want the request FD to be used as the only
> synchronisation point, we made the rule that the request FD must be signalled
> last. Since its error prone, and its not illegal to synchronise on the device
> read/write/pri state, we made a condensed helper for it.
> 
> Alternatively, the manual request completion is being added for cases this
> implicit request completion does not work, or when it makes everything too
> complicated to adhere to this rule. This is the case for dual-stage video
> decoders (MTK/RPi).
> 
> [...]

-- 
Regards,

Laurent Pinchart

