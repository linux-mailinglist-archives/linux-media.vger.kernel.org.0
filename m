Return-Path: <linux-media+bounces-64309-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iVpXLz8wKGo8/wIAu9opvQ
	(envelope-from <linux-media+bounces-64309-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 17:24:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3359661B44
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 17:24:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fNvngS7t;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64309-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64309-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E870A303748E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 14:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E1A35E1D1;
	Tue,  9 Jun 2026 14:55:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D4A351C24
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 14:55:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016918; cv=none; b=K8nNtfUBNv5nr8HF5r1zhtwc0Wwj6xk8aMbks3HN49HBww3SRBUQdW7Xli5t6mjLKp+7fdNSZmHfDh4GQUTJMY1+qyoHUDhcV76ysASXDh9sxy3hRoSiQR58D0vtz3XdMgsEIQnAtCHjVZFEfkMHD1HTru6dfbwICG1jqLYpz3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016918; c=relaxed/simple;
	bh=2LEZZyzOt4cYATctH/ng8voyBZWlW3qfTcgOwEtJx8M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mxZyrNn6R7UcstnL+ryPYVqqFJLA8yZVcFNUVC8yyzAXxF0FKoWPUwVX5YAGfoXO6u/OStNQsQVW+F2kBpA6GCwSpTjuvOHeFm7uYb/LAD1WgCi8c2EcPQ1FcsKwH4238BuIRhyqGioPCsysbdpfvlQmidjK7Q1e+v+YeRfQwNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNvngS7t; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304A51F00893;
	Tue,  9 Jun 2026 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781016916;
	bh=TAeZErOYVWNkFFO34Gvul0iaOf+2DbKLmyHAS65zA2U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=fNvngS7tLEWTXrsk/d4csBQQumqu7jN3CqCj9KehS4ZuTV61A+bC5xZeMNVPTU1aN
	 HxstjKUH3Q5N/2w7KJaiSsfa3I4VlVHBWBQGI2r7Qtsn1I4mOdC5lRy0h+QbzR5WYw
	 umst+fQJ6R5013kMrvnar9oEa79FmCsah1IvejNLw1e6grpi6AyP8zu3V1cdHN+H8h
	 D3z9t+dQPySPaGJ0pilOXuvCA4+Km9oTPfruZdblmdErXt+i9kg4YbBfOu5JLDVbH4
	 MPrOu5FOHVfesLJdVL5ibm7eQapRwD1Nq32r9qFlLSeclVs42PJJXyzvEi9oke04EA
	 Iosr+SYgSq+KA==
Message-ID: <bd8685d9-bebe-4f81-884e-8395c8af5ec4@kernel.org>
Date: Tue, 9 Jun 2026 16:55:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v5 04/10] media: imx219: Make control handler ops for
 PIXEL_RATE NULL
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Rishikesh Donadkar <r-donadkar@ti.com>
References: <20260607215356.842932-5-sakari.ailus@linux.intel.com>
 <20260608073653.GD370380@killaraus.ideasonboard.com> <aiZ0a3nGqp6N7GD3@zed>
 <20260608080338.GF370380@killaraus.ideasonboard.com>
 <aiZ56IgNJ2FeXN0o@kekkonen.localdomain>
 <20260608082426.GA380394@killaraus.ideasonboard.com>
 <aiaXotTu4l4ZWzkd@kekkonen.localdomain>
 <20260608102755.GF772117@killaraus.ideasonboard.com>
 <aibH1-5PxiHpVdsf@kekkonen.localdomain>
 <20260608144200.GB380394@killaraus.ideasonboard.com> <aiex5gd6TnggN4wn@zed>
Content-Language: en-US, nl
In-Reply-To: <aiex5gd6TnggN4wn@zed>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64309-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3359661B44

On 09/06/2026 08:29, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Mon, Jun 08, 2026 at 05:42:00PM +0300, Laurent Pinchart wrote:
>> On Mon, Jun 08, 2026 at 04:47:03PM +0300, Sakari Ailus wrote:
>>> On Mon, Jun 08, 2026 at 01:27:55PM +0300, Laurent Pinchart wrote:
>>>> On Mon, Jun 08, 2026 at 01:21:22PM +0300, Sakari Ailus wrote:
>>>>> On Mon, Jun 08, 2026 at 11:24:26AM +0300, Laurent Pinchart wrote:
>>>>>> On Mon, Jun 08, 2026 at 11:14:32AM +0300, Sakari Ailus wrote:
>>>>>>> On Mon, Jun 08, 2026 at 11:03:38AM +0300, Laurent Pinchart wrote:
>>>>>>>> On Mon, Jun 08, 2026 at 09:53:17AM +0200, Jacopo Mondi wrote:
>>>>>>>>> Hi Laurent
>>>>>>>>>   sorry if I reply in place of Sakari but I got this fresh
>>>>>>>>
>>>>>>>> Thanks :-)
>>>>>>>>
>>>>>>>>> On Mon, Jun 08, 2026 at 10:36:53AM +0300, Laurent Pinchart wrote:
>>>>>>>>>> On Mon, Jun 08, 2026 at 12:53:50AM +0300, Sakari Ailus wrote:
>>>>>>>>>>> The PIXEL_RATE control exists to convey the value to the userspace and has
>>>>>>>>>>> no configuration that would need to be programmed to the sensor. Make the
>>>>>>>>>>> control handler ops for the PIXEL_RATE control NULL and avoid a warning
>>>>>>>>>>> (as well as returning an error) from the driver.
>>>>>>>>>>
>>>>>>>>>> I thought the standard way to handle pixel rate being read only was to
>>>>>>>>>> set the V4L2_CTRL_FLAG_READ_ONLY flag, like we do for e.g.
>>>>>>>>>> V4L2_CID_LINK_FREQ. Is that not correct ?
>>>>>>>>>
>>>>>>>>> PIXEL_RATE is RO by default
>>>>>>>>>
>>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c:      case V4L2_CID_PIXEL_RATE:
>>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *type = V4L2_CTRL_TYPE_INTEGER64;
>>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>>>>>> drivers/media/v4l2-core/v4l2-ctrls-defs.c-              break;
>>>>>>>>>
>>>>>>>>> The purpose of setting the ctrl_ops member to NULL is to avoid having
>>>>>>>>> to handle RO controls in the driver implementation of .s_ctrl().
>>>>>>>>
>>>>>>>> Shouldn't the V4L2 control framework avoid .s_ctrl() calls for read-only
>>>>>>>> controls ? I thought it did already.
>>>>>>>
>>>>>>> The control may be read-only on the UAPI but the driver could still do
>>>>>>> something about it in its s_ctrl() callback. I don't know if any driver
>>>>>>> depends on this though.
>>>>>>
>>>>>> It seems to be one of the many areas where control handling should be
>>>>>> simplified for drivers.
>>>>>>
>>>>>> In any case, the imx219 driver creates the V4L2_CID_LINK_FREQ control
>>>>>> with a non-NULL ops pointer, sets the V4L2_CTRL_FLAG_READ_ONLY flag, and
>>>>>> does not handle V4L2_CID_LINK_FREQ in imx219_set_ctrl(). If there's an
>>>>>> issue for V4L2_CID_PIXEL_RATE there is also an issue for
>>>>>> V4L2_CID_LINK_FREQ.
>>>>>
>>>>> The ops should be set to NULL for link_freq as well.
>>>>>
>>>>>> Maybe the best short term fix would be to drop the dev_info() in the
>>>>>> default case of the ctrl->id switch in imx219_set_ctrl() ?
>>>>>
>>>>> Any reason why not to set ops NULL instead?
>>>>
>>>> Because that seems to be a hack. Drivers shouldn't have to set a NULL
>>>> ops pointer for read-only controls, when there's already a read-only
>>>> flag. I'd like to simplify the code on the driver side and handle this
>>>> in the control framework, not adding yet another arcane rule that most
>>>> driver authors will not be aware of.
>>>
>>> I don't think I'd necessarily call it a hack.
>>
>> It's still yet another undocumented behaviour to will be copied through
>> cargo-cult in a subset of drivers, making the code base more difficult
>> to understand and maintain. The fact that this patch addressed the
>> PIXEL_RATE control but not the LINK_FREQUENCY control proves my concerns
>> are valid :-)
>>
>> I'd like to see one scheme clearly documented, and used by all drivers.
>> Let's first focus on selecting one scheme and documenting it. Hans'
>> opinion would be useful.
>>
> 
> We discussed this very same matter a few months ago.
> 
> Before having the framework handling this, by not calling into the
> driver's s_ctrl for RO controls, all users in-tree shall be checked to
> make sure they're actually not doing something with those RO controls.
> 
> I even started a branch to check all drivers one-by-one and first set
> they're ops to NULL. I quickly got discouraged by the amount of work
> required and gave up.

Userspace cannot set RO controls, EACCES is returned.

Drivers can set RO controls (after all, RO just means that userspace can't
change it, but drivers can). And yes, s_ctrl (if present) will be called
in that case. Generally RO controls will have a NULL ops pointer, but there
may be cases where something needs to be done in s_ctrl.

I can't remember that ever being needed, but I may be wrong, and in any case
the same control framework is used by out-of-tree drivers, so it is not
something I would want to change.

Perhaps include/media/v4l2-ctrls.h should be improved to mention that for
RO controls ops should probably be set to NULL unless you have a really
good reason not to.

Regards,

	Hans

> 
>>> The control may be changeable, but not by the user. If the driver is just
>>> setting the value without going through the control framework, control
>>> events will be omitted.
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
> 


