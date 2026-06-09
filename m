Return-Path: <linux-media+bounces-64323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NOFrJrtKKGrLBgMAu9opvQ
	(envelope-from <linux-media+bounces-64323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 19:17:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED5662D72
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 19:17:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=GVKpQK9N;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64323-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64323-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9F8931769E8
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 16:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D384963DF;
	Tue,  9 Jun 2026 16:45:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4561E4949F6
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 16:45:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023510; cv=pass; b=hlgnsjZknQX6E4yLstH53OXT9CYfkrEZBLsHOyrcmkcS77dpxYbjpouy6ecOVdqQhdj3UhUS17N4zJsDI/MGjogGGe4bRZsrJm0pd6MSW0ZOs0WrSb6Aaaw8YoP/ETBjLj0FpwmqM44RPwsFqYXLuWFql6ZBhX8ruzVy8fSIgv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023510; c=relaxed/simple;
	bh=y+Juj2unpyw19+4KBFTPoaFxKJdr/wUo5cSz9uYlm1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFW79ABzfYDKa3FcpLLcH4nuLZ64Tt2hKiBUs3MHXorSYh87io19qS8/oanQ/0DyKM6q0/7S8e6PTg8DJws3A3As/woHHgT0Ep5jFI3Em7gSOAX1qZFi7wGsUupK8if7wHcgY5a87bJSqjRp885B1f0KyciQFQf2ficcMXWxNR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GVKpQK9N; arc=pass smtp.client-ip=209.85.167.44
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa88b4f792so4870071e87.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 09:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781023506; cv=none;
        d=google.com; s=arc-20240605;
        b=gbksuEaA01GMND5SwFVGQazUm/FJvjJC3ZKguDFAabGDdWyBG8Fu8/nOBFDERlJDMa
         P6cEOoi4DoY0OkO7PlZtp7ABdvOWn4HPurCJ95KH0XGbBxHYOydBJRqB3ysjrQXqRZFq
         JNme79hCvJiIaTEuWHwuTI1OoGqWQiofQBLshVvz0FLkpXtSwPDlrBEUUQtpaWXVElX1
         qH/60wU1ujde0pShq68QqXj6ZOs9dFyTM4dt3HqQEVYB2dc5vdjhIKqzt1fohAjMsAug
         gwrRkLUSFnIRtKfiJlWaR4OzBkqa+qkKWzaGuMEH6WPOLOrEaPd6mcrOFJLz94wZwrXh
         uGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=64YmqLTS7OVR/ClbPAvU8Tp+zpVxnGdESqwNmXDEEEs=;
        fh=Q2YQsAHf8qRtk0hKdYuVwSPX8E+W5d34zBodwPpZpfY=;
        b=SPPzR9GFx1YwTwSUh75uW7eYgAZ1hjoyZIiBtBF6VDjTx8LY+5U7oCpoCXzVFgXjUN
         451+rV03Lo7JP+bDGoffhCTLBi1hHQ8ujZZi3z0hhnoBGXE9YsdxmPbbqdkXw/c9xmPO
         aT/Gitqt/bEZ2PPxhOeE+faBmZIG0kCwhbHYEfA5OZib5iJ6wQMLqAkk749iKc/svyAr
         VlVZO0qOX9+5syhbOZz6A4lNePzw48NS7OhjGbultIySdgVFw23YN7wIrCR/268hJc/s
         ZAiRWMl+pydrkZgZxpQYqSi5qTaEQX/PdJObsAKh7/CUCXgW11DNi02NxJfhljJYmWVY
         NmEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1781023506; x=1781628306; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=64YmqLTS7OVR/ClbPAvU8Tp+zpVxnGdESqwNmXDEEEs=;
        b=GVKpQK9N2iu3j5fgnFV6TK+dWha/MHzydeFCqtuaMXJAP9q+PzIavH5OLFBYRopuLf
         tGbz1bb0VRz6Z0NPncHR9I3lA4RMjaNY5D4z1gKRmbXtC2MDYt1RhdpxYH4rXxSGqG6O
         k6Wk5sA8RPwvflC8XysnbH1MODNx9CkWrURHLSmPZjxbNF3riiIrAJSgchThL/yUkeHk
         ZaGKtG7rTydwfUlpCFWf9J/RtMKsvDFv+L/yDLe4qeh7/5oZM2eRFfH+VFiLmNlBpXLz
         z60sDw6vwqRBks5t+/rVZRfnnTaUW9xzVHvpJjY3Pvt1v52ndInSFz1FQLR1KnXkqeF/
         0V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023506; x=1781628306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64YmqLTS7OVR/ClbPAvU8Tp+zpVxnGdESqwNmXDEEEs=;
        b=Lb1KAHkhhOIjMCIFz5Wfh83selFixG7093mayTnNVDLSoJFH2CINSWk82rZvvGm30D
         LYcMvSfEsHcXJCEa9kNlehpti8uIaUl1h1R5DMhRhDRUgZnJWWonKF7wZHfCit/VhbzG
         2aLIByqJ2xXqRCnMQ+0rgixMetVe13gvvoF1a3TKeJDxLRDI7AuN5uqPzDEZa7M6WfTx
         zDkz0Bo0teXUJge9GwxjrDkhF+wLoT87cCmABKa+EbEECaJaBOoymfia8mep6kl7ing6
         nIVJvMtePyRIeawaRW+MrpG9DyUVRSlbkb8dKqHLlqecvy+20aUOf22s5lsdb9ISgh7G
         SmDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hevbaq8++ghDWqPCVD2AiUMm4AFKHLHVe+611ndRzswFVXmZvOrmhlE+od4cWrFsRnxdPeV9H4RTqbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZqkw4NR5cnrlUW79WqPe7rnlwPlDNUzE38ZmCe3j2jr3ox3U4
	xN60UCSPnD5Z2fkRq+9y0PQ0QeF2gXVQoxiTyuEBMyh4aGkagI1tV+9aZNCdpLx8RLuNsuz/h7W
	3nxrV/C3jNR6wp04V8MqIP3sFYhzO6u14Ip0lRu7hIPjAC8XEGKLyQJM=
X-Gm-Gg: Acq92OElxOUGlBSZaxj8sVhy0KumGjS0eosTAT3w/ecfYydVUwTbVHutFs6hUwCi0Sr
	K9Hq70Ij+eYxSeJq/kRXVyMijNK4e6c660EycNotVz1MC+twt2D1f0TUjLu/T/wOqC+Gp+zE42b
	LQdJq8GLdBQRm12asB69WJpCkCYIjiCtM7tdjFA32PjvloAuUnDsrEdAR1P+jyIYMefEwBl0AWS
	MyktjtSMCyYJMd0BYomw6RPGf97eKphol4IrLnVdCoKa2+Fx4+uqQaZOMcAAm1RY7e/+JP/0ALx
	+9YHfulMgtSXxWhAi7esPsH3HsZk7DECs+6VdlZQ59pXlHaf8gOVlSunfZ/NqMgpAegxwItAZke
	DCtQBIyo/l6+cpKqRLu5q9vOvlPT2CL/dyRaWL9L3nAi9ew==
X-Received: by 2002:a05:6512:3413:b0:5aa:7a70:c01d with SMTP id
 2adb3069b0e04-5aa8865d768mr4830462e87.1.1781023506120; Tue, 09 Jun 2026
 09:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aiZ56IgNJ2FeXN0o@kekkonen.localdomain> <20260608082426.GA380394@killaraus.ideasonboard.com>
 <aiaXotTu4l4ZWzkd@kekkonen.localdomain> <20260608102755.GF772117@killaraus.ideasonboard.com>
 <aibH1-5PxiHpVdsf@kekkonen.localdomain> <20260608144200.GB380394@killaraus.ideasonboard.com>
 <aiex5gd6TnggN4wn@zed> <bd8685d9-bebe-4f81-884e-8395c8af5ec4@kernel.org>
 <20260609151536.GL944266@killaraus.ideasonboard.com> <CAPY8ntC0u1H+Z-cnwn0AkG4MbUT2nhnndmRJ-E8yYFaOdXBMwg@mail.gmail.com>
 <20260609160715.GA1125735@killaraus.ideasonboard.com>
In-Reply-To: <20260609160715.GA1125735@killaraus.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 9 Jun 2026 17:44:48 +0100
X-Gm-Features: AVVi8Cf2xwMp_Fgfc-ZhjgGJhg4f_5wipI4dv3sgMrgJPrG1S_x0PCdQ1bLfRyo
Message-ID: <CAPY8ntCwh=aYKO_GF+4--DviAVpJjyJM6yeGT5ORdah4CqBvVA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:jacopo.mondi@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:hverkuil@kernel.org,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64323-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email,raspberrypi.com:dkim,raspberrypi.com:email,raspberrypi.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5ED5662D72

On Tue, 9 Jun 2026 at 17:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jun 09, 2026 at 04:56:48PM +0100, Dave Stevenson wrote:
> > On Tue, 9 Jun 2026 at 16:15, Laurent Pinchart wrote:
> > > On Tue, Jun 09, 2026 at 04:55:09PM +0200, Hans Verkuil wrote:
> > > > On 09/06/2026 08:29, Jacopo Mondi wrote:
> > > > > On Mon, Jun 08, 2026 at 05:42:00PM +0300, Laurent Pinchart wrote:
> > > > >> On Mon, Jun 08, 2026 at 04:47:03PM +0300, Sakari Ailus wrote:
> > > > >>> On Mon, Jun 08, 2026 at 01:27:55PM +0300, Laurent Pinchart wrote:
> > > > >>>> On Mon, Jun 08, 2026 at 01:21:22PM +0300, Sakari Ailus wrote:
> > > > >>>>> On Mon, Jun 08, 2026 at 11:24:26AM +0300, Laurent Pinchart wrote:
> > > > >>>>>> On Mon, Jun 08, 2026 at 11:14:32AM +0300, Sakari Ailus wrote:
> > > > >>>>>>> On Mon, Jun 08, 2026 at 11:03:38AM +0300, Laurent Pinchart wrote:
> > > > >>>>>>>> On Mon, Jun 08, 2026 at 09:53:17AM +0200, Jacopo Mondi wrote:
> > > > >>>>>>>>> Hi Laurent
> > > > >>>>>>>>>   sorry if I reply in place of Sakari but I got this fresh
> > > > >>>>>>>>
> > > > >>>>>>>> Thanks :-)
> > > > >>>>>>>>
> > > > >>>>>>>>> On Mon, Jun 08, 2026 at 10:36:53AM +0300, Laurent Pinchart wrote:
> > > > >>>>>>>>>> On Mon, Jun 08, 2026 at 12:53:50AM +0300, Sakari Ailus wrote:
> > > > >>>>>>>>>>> The PIXEL_RATE control exists to convey the value to the userspace and has
> > > > >>>>>>>>>>> no configuration that would need to be programmed to the sensor. Make the
> > > > >>>>>>>>>>> control handler ops for the PIXEL_RATE control NULL and avoid a warning
> > > > >>>>>>>>>>> (as well as returning an error) from the driver.
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> I thought the standard way to handle pixel rate being read only was to
> > > > >>>>>>>>>> set the V4L2_CTRL_FLAG_READ_ONLY flag, like we do for e.g.
> > > > >>>>>>>>>> V4L2_CID_LINK_FREQ. Is that not correct ?
> > > > >>>>>>>>>
> > > > >>>>>>>>> PIXEL_RATE is RO by default
> > > > >>>>>>>>>
> > > > >>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c:      case V4L2_CID_PIXEL_RATE:
> > > > >>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *type = V4L2_CTRL_TYPE_INTEGER64;
> > > > >>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > >>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c-              break;
> > > > >>>>>>>>>
> > > > >>>>>>>>> The purpose of setting the ctrl_ops member to NULL is to avoid having
> > > > >>>>>>>>> to handle RO controls in the driver implementation of .s_ctrl().
> > > > >>>>>>>>
> > > > >>>>>>>> Shouldn't the V4L2 control framework avoid .s_ctrl() calls for read-only
> > > > >>>>>>>> controls ? I thought it did already.
> > > > >>>>>>>
> > > > >>>>>>> The control may be read-only on the UAPI but the driver could still do
> > > > >>>>>>> something about it in its s_ctrl() callback. I don't know if any driver
> > > > >>>>>>> depends on this though.
> > > > >>>>>>
> > > > >>>>>> It seems to be one of the many areas where control handling should be
> > > > >>>>>> simplified for drivers.
> > > > >>>>>>
> > > > >>>>>> In any case, the imx219 driver creates the V4L2_CID_LINK_FREQ control
> > > > >>>>>> with a non-NULL ops pointer, sets the V4L2_CTRL_FLAG_READ_ONLY flag, and
> > > > >>>>>> does not handle V4L2_CID_LINK_FREQ in imx219_set_ctrl(). If there's an
> > > > >>>>>> issue for V4L2_CID_PIXEL_RATE there is also an issue for
> > > > >>>>>> V4L2_CID_LINK_FREQ.
> > > > >>>>>
> > > > >>>>> The ops should be set to NULL for link_freq as well.
> > > > >>>>>
> > > > >>>>>> Maybe the best short term fix would be to drop the dev_info() in the
> > > > >>>>>> default case of the ctrl->id switch in imx219_set_ctrl() ?
> > > > >>>>>
> > > > >>>>> Any reason why not to set ops NULL instead?
> > > > >>>>
> > > > >>>> Because that seems to be a hack. Drivers shouldn't have to set a NULL
> > > > >>>> ops pointer for read-only controls, when there's already a read-only
> > > > >>>> flag. I'd like to simplify the code on the driver side and handle this
> > > > >>>> in the control framework, not adding yet another arcane rule that most
> > > > >>>> driver authors will not be aware of.
> > > > >>>
> > > > >>> I don't think I'd necessarily call it a hack.
> > > > >>
> > > > >> It's still yet another undocumented behaviour to will be copied through
> > > > >> cargo-cult in a subset of drivers, making the code base more difficult
> > > > >> to understand and maintain. The fact that this patch addressed the
> > > > >> PIXEL_RATE control but not the LINK_FREQUENCY control proves my concerns
> > > > >> are valid :-)
> > > > >>
> > > > >> I'd like to see one scheme clearly documented, and used by all drivers.
> > > > >> Let's first focus on selecting one scheme and documenting it. Hans'
> > > > >> opinion would be useful.
> > > > >
> > > > > We discussed this very same matter a few months ago.
> > > > >
> > > > > Before having the framework handling this, by not calling into the
> > > > > driver's s_ctrl for RO controls, all users in-tree shall be checked to
> > > > > make sure they're actually not doing something with those RO controls.
> > > > >
> > > > > I even started a branch to check all drivers one-by-one and first set
> > > > > they're ops to NULL. I quickly got discouraged by the amount of work
> > > > > required and gave up.
> > > >
> > > > Userspace cannot set RO controls, EACCES is returned.
> > > >
> > > > Drivers can set RO controls (after all, RO just means that userspace can't
> > > > change it, but drivers can). And yes, s_ctrl (if present) will be called
> > > > in that case. Generally RO controls will have a NULL ops pointer, but there
> > > > may be cases where something needs to be done in s_ctrl.
> > > >
> > > > I can't remember that ever being needed, but I may be wrong, and in any case
> > > > the same control framework is used by out-of-tree drivers, so it is not
> > > > something I would want to change.
> > >
> > > Not that we should break out-of-tree drivers just for the fun of it, I
> > > don't see that as being by itself a good enough reason to avoid a change
> > > to an in-kernel API.
> > >
> > > > Perhaps include/media/v4l2-ctrls.h should be improved to mention that for
> > > > RO controls ops should probably be set to NULL unless you have a really
> > > > good reason not to.
> > >
> > > I'm fine with this patch if we clearly document this is the way to go
> > > (and with the LINK_FREQ control being addressed as well).
> >
> > We do have a slight inconsistency in that v4l2_ctrl_modify_range() and
> > v4l2_ctrl_s_ctrl call the handler for READ_ONLY controls, but
> > __v4l2_ctrl_handler_setup() does not.
> >
> > I hit that on my recent IMX355 patchset where the V4L2_CID_HBLANK
> > control had been set appropriately and I needed to set the LLP
> > register. I initially added the handler, only to find it wasn't
> > called.
>
> Hans, any objection against changing that behaviour and call .s_ctrl()
> from __v4l2_ctrl_handler_setup() too ?

That change is likely to cause more issues. If a driver returns an
error on an unhandled control in s_ctrl, then v4l2_ctrl_handler_setup
will then abort. I guess you could ignore the error if the control is
read only, but that feels messy

It is documented that v4l2_ctrl_handler_setup doesn't set read only
controls, but I was just raising it that we have inconsistent
behaviour within the core with regard the flag.
I've only really seen NULL being passed as the ctrl_ops within the
last year or so, so perhaps it's just an awareness thing that is now
on more people's radar.

  Dave

> > I have no issues with the patch, so it gets an
> > Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > > > >>> The control may be changeable, but not by the user. If the driver is just
> > > > >>> setting the value without going through the control framework, control
> > > > >>> events will be omitted.
>
> --
> Regards,
>
> Laurent Pinchart

