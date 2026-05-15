Return-Path: <linux-media+bounces-61719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DEkCWQdB2omsAIAu9opvQ
	(envelope-from <linux-media+bounces-61719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 15:19:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4653550592
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 15:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D5DC3038886
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB16D318B96;
	Fri, 15 May 2026 13:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T4+/VjLZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2E930E84F;
	Fri, 15 May 2026 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778850685; cv=none; b=HLAR99lnty92LZPVhXwmKqyLd6jJDxNGz+grux5dYwg7xnOBwK1bXnwN6ZI+oTBCytdWO/wS0sNHmvO6f4URlwHVdMYPD3kKHPhuLApiciZvrush4J2eukhW1Q9qEnJNJdY4Ug5OiMWSmG8FwNIH5i2Dda/6r/SUlBVbPPCd7BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778850685; c=relaxed/simple;
	bh=RoSaEHdL/f9XfrDJuacDfbB/YoF1Ady6BjyjRnggESo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGVnI6iQLYAfWpdjUYpqvQDHXFnlEddgfWngpswKOF0/IsEg2zFk+X+9A0IQppCTXrLFssqh3zszDeao07NNVhF/zC/IUMWIOExBuOrFKJUVSk9hZSN5HtDIWZDKQEGcsGP9mBlktJs4Ifik66gUQqdzbdJEGy2kpfJASDyBbTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T4+/VjLZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F5A5454;
	Fri, 15 May 2026 15:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778850671;
	bh=RoSaEHdL/f9XfrDJuacDfbB/YoF1Ady6BjyjRnggESo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4+/VjLZQ+LE7/icqlv2kRNOPnfUFAyXSERlo7WqbvzuW1j7dK/TBlTFFb47M3HLS
	 YP0FBQcDBX1b7uVPDqC1RO6nw25LimnXkKe17zSh1GRIyl5od42ZCdXA0RPOxTehIf
	 hYa5MGIG4vgve2/y6jSap4a88O63tDGfGB4o9Nmc=
Date: Fri, 15 May 2026 15:11:18 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Keke Li <keke.li@amlogic.com>
Cc: Antoine Bouyer <antoine.bouyer@nxp.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Ricardo Ribalda <ribalda@chromium.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] media: v4l2-isp: Add support for extensible
 statistics
Message-ID: <agcaSwdqauzuQSl5@zed>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <777ea8b5-b00a-40e0-b649-59324ff0188a@nxp.com>
 <e1bb04b0-025a-44a6-91ab-edfa6edc1f64@nxp.com>
 <b97f4da9-7df7-4bfd-990e-28a23ec7a236@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b97f4da9-7df7-4bfd-990e-28a23ec7a236@amlogic.com>
X-Rspamd-Queue-Id: B4653550592
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61719-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,outlook.com:url]
X-Rspamd-Action: no action

Hi Antoine, Keke

On Wed, May 13, 2026 at 09:04:27AM +0800, Keke Li wrote:
>
> On 5/12/26 17:26, Antoine Bouyer wrote:
> > [ EXTERNAL EMAIL ]
> >
> > Le 05/05/2026 à 18:49, Antoine Bouyer a écrit :
> > > On 5/5/26 4:12 PM, Jacopo Mondi wrote:
> > > >
> > > >
> > > > This series breaks out from Antonie's
> > > > https://eur01.safelinks.protection.outlook.com/?
> > > > url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
> > > > media%2Flist%2F%3Fseries%3D24043&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605732002%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=FXaz7QYQvS3s%2B4l9AFMrGgE7kmXlEil%2FKD6DibB0%2FJY%3D&reserved=0
> > > >
> > > > the extensible stats support and adds a few more patches on top to:
> > > >
> > > > - add support for per-block validation as suggested during the
> > > > review of
> > > >    Ricardo's
> > > >    https://eur01.safelinks.protection.outlook.com/?
> > > > url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
> > > > media%2Fpatch%2F20260504-smatch-7-1-v3-6-
> > > > fda125c30058%40chromium.org%2F&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605751612%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=AiRH8MhIbXt3dr%2B2r3I6STE6TJAChylnH%2Fz3tLdS36k%3D&reserved=0
> > > >
> > > >
> > > > - add two helper functions to v4l2-isp to ease handling of extensible
> > > >    statistics for drivers. An early user, based on a preliminary
> > > > version
> > > >    of the patches is available here as a reference:
> > > >    https://eur01.safelinks.protection.outlook.com/?
> > > > url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
> > > > media%2Flist%2F%3Fseries%3D24703&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605763086%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2Fpsb7Z3lb8ingDILxc3LoEWKTojl5BGMbk6FiR%2FcO9I%3D&reserved=0
> > > >
> > > >
> > > > Antonie: I took the liberty to fold in your patches changes to address
> > > > my comments on your v1. I pushed an un-squased version of the patches
> > > > here:
> > > > https://eur01.safelinks.protection.outlook.com/?
> > > > url=https%3A%2F%2Fgitlab.freedesktop.org%2Flinux-
> > > > media%2Fusers%2Fjmondi%2F-%2Ftree%2Fb4%2Fextensible-stats-
> > > > unsquashed&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605775020%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=iF2BE0GZ8HcVPmOJDhbmLsXQDOXV9JvqfMK6DRPPvrg%3D&reserved=0
> > > >
> > > > so you can easily get the diff from this and your version. Please feel
> > > > free to comment on these as you're the original author.
> > >
> > > Hi Jacopo
> > >
> > > Thanks for the rework and the links. I'm fine with your [SQUASH]
> > > commits.
> > >
> > > If there are no other comments, I assume I can reuse the common patches
> > > in my v2 then, and also apply the new helpers to neoisp driver changes.
> > > They look very useful (especially to prevent out-of-bounds crashes I
> > > observed when data_size was not set before filling stats :( ). I'll
> > > check in your user example.
> > >
> > > BR
> > > Antoine
> >
> > Hi Jacopo
> >
> > Do you think it would make sense to create a new generic V4L2_META_FMT
> > too ? which can be used by all user of v4l2-isp extensible params a/o
> > stats. To avoid each driver creating its own meta fmt with same purpose.
> >
> > Or do you think it could have side effects ?
> >
> > BR
> > Antoine
> >
> > >
> I think this proposal is excellent.
> 🙂

To me, platform-specific formats mostly serve for documenting the ISP blocks.
In example
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/metafmt-rkisp1.html

There might be ways to handle it without defining a dedicated format
indeed.

Sakari Laurent and Hans are in cc, what do they think ?



> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > ---
> > > > Antoine Bouyer (2):
> > > >        media: uapi: v4l2-isp: Add extensible statistics
> > > >        media: Documentation: uapi: Update V4L2 ISP for extensible stats
> > > >
> > > > Jacopo Mondi (4):
> > > >        media: v4l2-isp: Rename v4l2_isp_params_buffer_size
> > > >        media: v4l2-isp: Add per-block validation callback
> > > >        media: amlogic-c3: Implement per-block validation
> > > >        media: v4l2-isp: Add helpers for stats buffer
> > > >
> > > >   Documentation/userspace-api/media/v4l/v4l2-isp.rst |  45 ++++++--
> > > >   .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  42 ++++++-
> > > >   .../media/platform/arm/mali-c55/mali-c55-params.c  |  12 +-
> > > >   drivers/media/v4l2-core/v4l2-isp.c                 |  56 +++++++++
> > > >   include/media/v4l2-isp.h                           |  94 +++++++++++
> > > > ++---
> > > >   include/uapi/linux/media/v4l2-isp.h                | 125 +++++++++++
> > > > ++--------
> > > >   6 files changed, 294 insertions(+), 80 deletions(-)
> > > > ---
> > > > base-commit: d9c8c4adf23d17549c0ec9c85b99d85a0ee6cf18
> > > > change-id: 20260504-extensible-stats-f2d6befcc1ce
> > > >
> > > > Best regards,
> > > > --
> > > > Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > >
> > >
> >
>

