Return-Path: <linux-media+bounces-64313-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kB9BKVQ6KGodAgMAu9opvQ
	(envelope-from <linux-media+bounces-64313-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 18:07:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD243662268
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 18:07:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=cUS3GF2R;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64313-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64313-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C052F305354C
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 15:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8824963BE;
	Tue,  9 Jun 2026 15:57:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40033FFAD1
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 15:57:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020631; cv=pass; b=TAgdWKSvVTKlGxHiPx4L881CtW+wQbj2wjG1sfAOfFciRaJ+6ZVi90RWK8AdTcs5/W6XcuLXByo6QO7TaalXZXO+rRFcVpz+AbhB4OU0CLghkuXjowp5WYirNBsVWBQqW2abYmE1d/4MVCgZrzZCRfOAcMCkLbdzqtl9M51gJIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020631; c=relaxed/simple;
	bh=YVNAe4/QawKTyxps4GQocgHGfZncKQUSoXTSIhYoPm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzZd8eO+COCUQGtDLW/I7CvAYaP0wNEDavlUEEh+lf9JViOHdhMLiyd+bKpxXyTkQbsiMMpJPiUW4Q2TlCdom5/iMK8hXiGU03H99C5xjnRVuQBTVqr95S6Ge53DE+hl5dRHuobfnbal+IUvQJaHNRdBQacG2DLaFk8aHJGHhGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=cUS3GF2R; arc=pass smtp.client-ip=209.85.167.52
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so6103739e87.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 08:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781020627; cv=none;
        d=google.com; s=arc-20240605;
        b=CNYM06hDU+mPGGuu3CIkx3CBXP3CbWhcJcN5EVrUJtl0k0MfzGxU5X7Oog+jwqfFf/
         ZMYiX2RBvdtDw9z+zm4e7XJuKqvmCPFZxpbiSNQjoHmf8nXYaNujAEshZPhq5r8hvAoH
         BNRzZFILC8PhT6Xydlr9qwlQ+V/LlNzntYYv/XrK5TD4zjNuSMMFepoR53KLWu/LH0o8
         3LHFl9YM1gcrtkyQI4kq2XVNeZAoADV8vuOVImlZGA4tgtLgMPSAZ+VBX0ILL/5SjZ4B
         HJ8ghjMFv9WsvY/LURsdRoQrkFGtj+D/QJShEPmaIAVEdkJC4nAwyvTv+JfmuFXuTd5t
         kbAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NHaBzwWIZD1j3x92E8jFVAaGxgmDxIYSafkgnoPG2e0=;
        fh=rGsu8D6FqtZYDPPc4YISy6Fx2UoieA6IyUPb619NbZo=;
        b=HZN+XD0Y84KmjZ3NUOlssEpMHxVOkfX8Z2wrDvnEj63p+nnAb4GGjT773xg2ZGxnaa
         /C5MzGC5iprtiUzAjVyQI4N/FsMn57F9mFS3/lGnuMsLrfzdlNyUh6KSihxhaGAmKBSI
         1Ds3n9oMzTm+kyiUUXXb5M2SU/+6uXgAO+/6E7DXClWoM4ycIh9iS0Ah8C3s0NrWjFNY
         S8wPsT06UkrlJuGLVdYfVV16kcZXD1v61Gn9U9e3nbHDdDWikTViCnrGz4BLvR9tbb4N
         yDhsb+k1nP5fQfkPOboRE7Jx1/ImiF2pJnDzDsOMu/ulP5YUdbmX6VQzGZKyOHCr1nMj
         y1IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1781020627; x=1781625427; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NHaBzwWIZD1j3x92E8jFVAaGxgmDxIYSafkgnoPG2e0=;
        b=cUS3GF2RVWCh8czVviyiK5WHS2X4NRUmrDPZPvsuPZH9SY5zwjqSIpLAx5qY/4fWS7
         xG/Evrckdxrte/ODgUH9jTAP7Gq4VX6cNi0UynAcYX97+VGFlT5n2h1t2kwtsUn6coko
         oeV2JeZLCvW66LRj1uISvSwMuhWu5mckLNutqXEI0dCl3zXLEwbA58MS3DLYOj/n2PG8
         xxmVm3UWeVEukjHY3cbQpzc3VkmbMaM2CBZVLVSo10LpK0+2zXccuW2xpNut5miTrzB/
         PuXg+bVY+sHvV8DN5XmOilFg5kmeVRbEBlZegoyyfTl1iJsibdYFaarZITDml/wW8msV
         wViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020627; x=1781625427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHaBzwWIZD1j3x92E8jFVAaGxgmDxIYSafkgnoPG2e0=;
        b=VgQ7imSdOT2mJ37CSARph6WogYSqJyvpScJEARmAEM2f2Tk0LYCZQaHWiYmFYp778L
         3aWIO2ONxzaBXZn3hyiR+WO4PERnaCGcdboSq6BYrMuBwtD3iHaS5VM0wmu5h/mWFGDx
         SSB8KeAu8jq4tgsOTcH7BVbmgmvNX11WvYr9b6HQcCGi7riHymNcETzvzrAjF2PwJi7K
         zlkJnuEEaz1wutrZK0mSVE0gQGRW/uDAQHaB7QSC2BpN4aFbGFlNhO2odQTFnXygRX6W
         vxLJQ0mh7orOqZtNumwx3nyXf3A8AevaPMCGG99GCsg0DUxN0p8ivkKS9IIsyY5W8LhM
         c3+w==
X-Forwarded-Encrypted: i=1; AFNElJ9wa9O/XToLihtNiLJrqOpy59Lny4MGDD0zZbY+ElfjX/l1VYmU9XrxcHUs5Ds0qFbxvcYc8Yh/UHWPaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ixYjo4KxwdlDgKFZsAZ7q3SOUUBOG5qI+9qFrPheBEDLdlj3
	T7WFPYlvII6BxdhRt0h60jK8NwEy2+mvB21AIOZUbdy6Bx3FvI284ejV0NhPcCEWWoEb00yA6o1
	Sbd+9/RYAjIZM+55RjTNsp/7zIjtInyf0Y+xVv39VWg==
X-Gm-Gg: Acq92OGJwkPhrJIaTKXAKh/u26PqkYtRyBdeadF746tbiz0gUf9o9c0L/IX6HNQlm/J
	EVERNC0eIGYjrRTZn7owG7LFVT/qeC719Z1n+XzXLHmH7OYr47yKL+EkewTg2EwGVQcTGMOIlrC
	YRk9++d8PbpEwI4fypwMntudD6dqtlrdCyLDQEqHDMbJrzfhQ5psbwBmEAihgtCx3+m65auJ5Oq
	uAxo5mxmYiZ2tFdABvmcJ2Pfqeia12TEcVRBJ2g/280mIntfOgkmlQ4QF2ClKY0JYEr2Y2NT+vQ
	YtYBQGgO+cjkqZAix+QvXn9CAWBIR0bOxlIYPAnV7UdL558XyvxNAqvpKlB+S1Bo5HV6eJmJ/8a
	wis++N1S3UCTr8rcDMUYTnwsP4x89ObU7ieE=
X-Received: by 2002:a05:6512:a95:b0:5aa:6c57:32c6 with SMTP id
 2adb3069b0e04-5aa87bb9f53mr5215323e87.17.1781020627060; Tue, 09 Jun 2026
 08:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aiZ0a3nGqp6N7GD3@zed> <20260608080338.GF370380@killaraus.ideasonboard.com>
 <aiZ56IgNJ2FeXN0o@kekkonen.localdomain> <20260608082426.GA380394@killaraus.ideasonboard.com>
 <aiaXotTu4l4ZWzkd@kekkonen.localdomain> <20260608102755.GF772117@killaraus.ideasonboard.com>
 <aibH1-5PxiHpVdsf@kekkonen.localdomain> <20260608144200.GB380394@killaraus.ideasonboard.com>
 <aiex5gd6TnggN4wn@zed> <bd8685d9-bebe-4f81-884e-8395c8af5ec4@kernel.org> <20260609151536.GL944266@killaraus.ideasonboard.com>
In-Reply-To: <20260609151536.GL944266@killaraus.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 9 Jun 2026 16:56:48 +0100
X-Gm-Features: AVVi8CdE6kTgsAejRqI3KZgg7Z9QLFfHQNCDeAE3DQT0EkmV-dSCiRtW4k5ucyg
Message-ID: <CAPY8ntC0u1H+Z-cnwn0AkG4MbUT2nhnndmRJ-E8yYFaOdXBMwg@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] media: imx219: Make control handler ops for
 PIXEL_RATE NULL
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Rishikesh Donadkar <r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64313-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:jacopo.mondi@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:hverkuil@kernel.org,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,linux.intel.com,vger.kernel.org,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,raspberrypi.com:dkim,raspberrypi.com:email,raspberrypi.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD243662268

On Tue, 9 Jun 2026 at 16:15, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jun 09, 2026 at 04:55:09PM +0200, Hans Verkuil wrote:
> > On 09/06/2026 08:29, Jacopo Mondi wrote:
> > > On Mon, Jun 08, 2026 at 05:42:00PM +0300, Laurent Pinchart wrote:
> > >> On Mon, Jun 08, 2026 at 04:47:03PM +0300, Sakari Ailus wrote:
> > >>> On Mon, Jun 08, 2026 at 01:27:55PM +0300, Laurent Pinchart wrote:
> > >>>> On Mon, Jun 08, 2026 at 01:21:22PM +0300, Sakari Ailus wrote:
> > >>>>> On Mon, Jun 08, 2026 at 11:24:26AM +0300, Laurent Pinchart wrote:
> > >>>>>> On Mon, Jun 08, 2026 at 11:14:32AM +0300, Sakari Ailus wrote:
> > >>>>>>> On Mon, Jun 08, 2026 at 11:03:38AM +0300, Laurent Pinchart wrote:
> > >>>>>>>> On Mon, Jun 08, 2026 at 09:53:17AM +0200, Jacopo Mondi wrote:
> > >>>>>>>>> Hi Laurent
> > >>>>>>>>>   sorry if I reply in place of Sakari but I got this fresh
> > >>>>>>>>
> > >>>>>>>> Thanks :-)
> > >>>>>>>>
> > >>>>>>>>> On Mon, Jun 08, 2026 at 10:36:53AM +0300, Laurent Pinchart wrote:
> > >>>>>>>>>> On Mon, Jun 08, 2026 at 12:53:50AM +0300, Sakari Ailus wrote:
> > >>>>>>>>>>> The PIXEL_RATE control exists to convey the value to the userspace and has
> > >>>>>>>>>>> no configuration that would need to be programmed to the sensor. Make the
> > >>>>>>>>>>> control handler ops for the PIXEL_RATE control NULL and avoid a warning
> > >>>>>>>>>>> (as well as returning an error) from the driver.
> > >>>>>>>>>>
> > >>>>>>>>>> I thought the standard way to handle pixel rate being read only was to
> > >>>>>>>>>> set the V4L2_CTRL_FLAG_READ_ONLY flag, like we do for e.g.
> > >>>>>>>>>> V4L2_CID_LINK_FREQ. Is that not correct ?
> > >>>>>>>>>
> > >>>>>>>>> PIXEL_RATE is RO by default
> > >>>>>>>>>
> > >>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c:      case V4L2_CID_PIXEL_RATE:
> > >>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *type = V4L2_CTRL_TYPE_INTEGER64;
> > >>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > >>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c-              break;
> > >>>>>>>>>
> > >>>>>>>>> The purpose of setting the ctrl_ops member to NULL is to avoid having
> > >>>>>>>>> to handle RO controls in the driver implementation of .s_ctrl().
> > >>>>>>>>
> > >>>>>>>> Shouldn't the V4L2 control framework avoid .s_ctrl() calls for read-only
> > >>>>>>>> controls ? I thought it did already.
> > >>>>>>>
> > >>>>>>> The control may be read-only on the UAPI but the driver could still do
> > >>>>>>> something about it in its s_ctrl() callback. I don't know if any driver
> > >>>>>>> depends on this though.
> > >>>>>>
> > >>>>>> It seems to be one of the many areas where control handling should be
> > >>>>>> simplified for drivers.
> > >>>>>>
> > >>>>>> In any case, the imx219 driver creates the V4L2_CID_LINK_FREQ control
> > >>>>>> with a non-NULL ops pointer, sets the V4L2_CTRL_FLAG_READ_ONLY flag, and
> > >>>>>> does not handle V4L2_CID_LINK_FREQ in imx219_set_ctrl(). If there's an
> > >>>>>> issue for V4L2_CID_PIXEL_RATE there is also an issue for
> > >>>>>> V4L2_CID_LINK_FREQ.
> > >>>>>
> > >>>>> The ops should be set to NULL for link_freq as well.
> > >>>>>
> > >>>>>> Maybe the best short term fix would be to drop the dev_info() in the
> > >>>>>> default case of the ctrl->id switch in imx219_set_ctrl() ?
> > >>>>>
> > >>>>> Any reason why not to set ops NULL instead?
> > >>>>
> > >>>> Because that seems to be a hack. Drivers shouldn't have to set a NULL
> > >>>> ops pointer for read-only controls, when there's already a read-only
> > >>>> flag. I'd like to simplify the code on the driver side and handle this
> > >>>> in the control framework, not adding yet another arcane rule that most
> > >>>> driver authors will not be aware of.
> > >>>
> > >>> I don't think I'd necessarily call it a hack.
> > >>
> > >> It's still yet another undocumented behaviour to will be copied through
> > >> cargo-cult in a subset of drivers, making the code base more difficult
> > >> to understand and maintain. The fact that this patch addressed the
> > >> PIXEL_RATE control but not the LINK_FREQUENCY control proves my concerns
> > >> are valid :-)
> > >>
> > >> I'd like to see one scheme clearly documented, and used by all drivers.
> > >> Let's first focus on selecting one scheme and documenting it. Hans'
> > >> opinion would be useful.
> > >
> > > We discussed this very same matter a few months ago.
> > >
> > > Before having the framework handling this, by not calling into the
> > > driver's s_ctrl for RO controls, all users in-tree shall be checked to
> > > make sure they're actually not doing something with those RO controls.
> > >
> > > I even started a branch to check all drivers one-by-one and first set
> > > they're ops to NULL. I quickly got discouraged by the amount of work
> > > required and gave up.
> >
> > Userspace cannot set RO controls, EACCES is returned.
> >
> > Drivers can set RO controls (after all, RO just means that userspace can't
> > change it, but drivers can). And yes, s_ctrl (if present) will be called
> > in that case. Generally RO controls will have a NULL ops pointer, but there
> > may be cases where something needs to be done in s_ctrl.
> >
> > I can't remember that ever being needed, but I may be wrong, and in any case
> > the same control framework is used by out-of-tree drivers, so it is not
> > something I would want to change.
>
> Not that we should break out-of-tree drivers just for the fun of it, I
> don't see that as being by itself a good enough reason to avoid a change
> to an in-kernel API.
>
> > Perhaps include/media/v4l2-ctrls.h should be improved to mention that for
> > RO controls ops should probably be set to NULL unless you have a really
> > good reason not to.
>
> I'm fine with this patch if we clearly document this is the way to go
> (and with the LINK_FREQ control being addressed as well).

We do have a slight inconsistency in that v4l2_ctrl_modify_range() and
v4l2_ctrl_s_ctrl call the handler for READ_ONLY controls, but
__v4l2_ctrl_handler_setup() does not.

I hit that on my recent IMX355 patchset where the V4L2_CID_HBLANK
control had been set appropriately and I needed to set the LLP
register. I initially added the handler, only to find it wasn't
called.

I have no issues with the patch, so it gets an
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

  Dave

> > >>> The control may be changeable, but not by the user. If the driver is just
> > >>> setting the value without going through the control framework, control
> > >>> events will be omitted.
>
> --
> Regards,
>
> Laurent Pinchart

