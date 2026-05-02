Return-Path: <linux-media+bounces-60186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AhzE3cs9mlTSwIAu9opvQ
	(envelope-from <linux-media+bounces-60186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 18:55:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D119F4B2ECF
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 18:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF5AE3011113
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2026 16:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A8B386572;
	Sat,  2 May 2026 16:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DUpkp/k1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6D72874F8;
	Sat,  2 May 2026 16:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777740908; cv=none; b=bHOyXevkbZ50W+eiubP+E6rVC79aggvORGHLbgZFcrLd+bWExA38I30Jbg7o8W+gzl78Sk6aeu/c+utu21Fmu5I+cOHFqwrMt4y8gjwfxPkaQ+0svNjbzcBmCHPgJjQToZevr4HBoEFq6VIE1dtq6vzr6JP80dg8r/Zl0Bvtlkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777740908; c=relaxed/simple;
	bh=s/83jP0QTxnfhRp0m7oHmnb2y7Kc3Hs79+rsB2QjbIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKvChAw26KM8u+vURHjIUMlGQR0BMB3+VjV0xlOPC4aDbVzernPKELr+pZutMYgeXTKg4yiH/pafPZA+4Eg/WagfzJbPHCFW5hSGUAWG/OsUKw3R6BnwCjoJQBACt72EKdxxNuenu9iT66b/bnwa8JCJfX4oBhzKy+g3j1Y3Q5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DUpkp/k1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 822BA2F8;
	Sat,  2 May 2026 18:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777740896;
	bh=s/83jP0QTxnfhRp0m7oHmnb2y7Kc3Hs79+rsB2QjbIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DUpkp/k1ymQiLUSDIwn5Gmoj4tTqVtiSN5ZZftAxRu3ByvlC2zTvJCIzRf1igjnh6
	 ag5QPFOQgqU70d5vmpT2sW7PGCtwvaDaui9q1LdyqeoZwmdMPqrIVT5ahw65ElXaac
	 40QbIiFOqFZ5Mw+QKxF9GVcT3+SFymrmTNTpmKiY=
Date: Sat, 2 May 2026 19:54:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v2 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
Message-ID: <20260502165455.GB488660@killaraus.ideasonboard.com>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
 <20260501-smatch-7-1-v2-2-a2fcfb2531ac@chromium.org>
 <20260501201906.GA488660@killaraus.ideasonboard.com>
 <CANiDSCtf9ThohCR8XT7LNQUsbYeTdB=gGkmnXKc1cPjxUsVHdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtf9ThohCR8XT7LNQUsbYeTdB=gGkmnXKc1cPjxUsVHdA@mail.gmail.com>
X-Rspamd-Queue-Id: D119F4B2ECF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60186-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]

On Sat, May 02, 2026 at 09:56:19AM +0200, Ricardo Ribalda wrote:
> On Fri, 1 May 2026 at 22:19, Laurent Pinchart wrote:
> > On Fri, May 01, 2026 at 11:32:47AM +0000, Ricardo Ribalda wrote:
> > > The current code makes smatch a bit uncomfortable:
> > > drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> > >
> > > Probably because smatch is not clever enough (yet). Do a simple rewrite
> > > to make sure that smatch understands what we are doing here.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/i2c/mt9p031.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> > > index ea5d43d925ff..5c9dff030b4d 100644
> > > --- a/drivers/media/i2c/mt9p031.c
> > > +++ b/drivers/media/i2c/mt9p031.c
> > > @@ -795,7 +795,7 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
> > >                       ctrl->val &= ~1;
> > >                       data = (1 << 6) | (ctrl->val >> 1);
> > >               } else {
> > > -                     ctrl->val &= ~7;
> > > +                     ctrl->val -= ctrl->val % 8;
> > >                       data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
> >
> > I'd still like to keep the ~7 (and, while at it, making the register
> > computation easier to read). I previously proposed
> >
> >                         ctrl->val &= ~7;
> >                         data = (ctrl->val - 64) >> 3;
> >                         data = (data << 8) | (1 << 6) | 32;
> >
> > which didn't quite appease smatch. We could use an explicit mask:
> >
> >                         ctrl->val &= ~7;
> >                         data = ((ctrl->val - 64) >> 3) & 0xff;
> 
> Why 0xff and not 0x7f?
> 
> If I understand it correctly the max is 1024 and (1024-64) >> 3 is < 127.

You're right. This won't matter in practice given that the control value
is bound by the minimum and maximum gains specified when creating the
control.

> Anyway... following the mask idea what about:
> 
> ctrl->val &= ~7;
> data = (((ctrl->val - 64) & 0x3ff) << 5) | (3 << 5);
> 
> ?

The digital gain is a 7-bit value stored in bits [14:8]. As the value
has to be divided by 8, the driver shifts left by 5. This is correct,
but I find it confusing for the reader (including myself, I had to pause
when reading this patch to understand the code). Hence the proposal to
improve readability.

Separating the (1 << 6) and 32 is also meant to make the code readable.
Bit 6 is the 1-bit second analog gain stage, and bits [5:0] store the
first stage analog gain.

> >                         data = (data << 8) | (1 << 6) | 32;
> >
> > >               }
> > >
> > >

-- 
Regards,

Laurent Pinchart

