Return-Path: <linux-media+bounces-65343-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1Bp8Mjr/OGqhlAcAu9opvQ
	(envelope-from <linux-media+bounces-65343-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:24:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E436AE2D5
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:24:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=AFin6F0M;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65343-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65343-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D984130AD07D
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 09:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830EA3A05FC;
	Mon, 22 Jun 2026 09:04:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468139A067;
	Mon, 22 Jun 2026 09:04:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119084; cv=none; b=gTWSluhzQmjCLjNANcstIWX52oOu1VKTQJqo4+NZTNZw4YcmeqjEoPA+FDdhYustNi9swOSoUpEYQhtOEg5BrGC7ByNRHN2wCJLx2Vup7LhAjuGP8yYR9hIlg6EWdTTRGASrtrhleE2hXjmgBU42GqUfYbnurAsRYkr64OUipvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119084; c=relaxed/simple;
	bh=+l20Gakqj5SaWpf6y3GLgwyC4XvPjzneg+BqMMRN7Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHn052G4nFMB7ZYAzewgiw7I0PEf46jDNCDEaBMVaeaEevnzJkv2Ufd5sKpXHMO6i5Ew6K0G8Oz2VXSYu98Y++axCq6mgsnzQxNUdIyqrxdPHqhtYOxAbhr9avkiOobG2Hyz6iwECknjP4dDsfFJmSOtmljJYGIZLXC0FJmGyhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AFin6F0M; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F40EA9CE;
	Mon, 22 Jun 2026 11:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782119036;
	bh=+l20Gakqj5SaWpf6y3GLgwyC4XvPjzneg+BqMMRN7Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AFin6F0MOeNIqBrLEkhwIwUz3pfXNmbLIEZFdh+8XVt4d4qaVIFXPQSl/UlVwjjEZ
	 mL9HqYsYRgMfkeRIFZs8/+xi+gUoHuzjNZH/UQ8iB9HkAn5kjxbg5/38nk+jI6f67K
	 elVMZgVVemUrCTUeBHzaW4ot0NwHly3BxLPAT/U8=
Date: Mon, 22 Jun 2026 12:04:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"luca.weiss@fairphone.com" <luca.weiss@fairphone.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] media: i2c: add imx576 image sensor driver
Message-ID: <20260622090432.GL3552167@killaraus.ideasonboard.com>
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
 <20260619125439.55311-3-himanshu.bhavani@siliconsignals.io>
 <20260620132749.GE3552167@killaraus.ideasonboard.com>
 <PN0P287MB20199A3EF8F3183176AC1E559AEF2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PN0P287MB20199A3EF8F3183176AC1E559AEF2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65343-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:himanshu.bhavani@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:luca.weiss@fairphone.com,m:hardevsinh.palaniya@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:elgin.perumbilly@siliconsignals.io,m:contact@schnwalter.eu,m:hpa@redhat.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.intel.com,fairphone.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4E436AE2D5

On Mon, Jun 22, 2026 at 06:02:24AM +0000, Himanshu Bhavani wrote:
> > On Fri, Jun 19, 2026 at 06:24:32PM +0530, Himanshu Bhavani wrote:
> >> Add a v4l2 subdevice driver for the Sony imx576 sensor.
> >>
> >> The Sony IMX576 image sensor with an active
> >> array size of 5760 x 4312
> >>
> >> The following features are supported:
> >> - Manual exposure an gain control support
> >> - vblank/hblank control support
> >> - Supported resolution: 2880 x 2156 30fps (SRGGB10)
> >
> >You've been asked in v1 to make this driver dynamically compute
> >registers instead of hardcoding modes. Please do so in v3. Nack on v2.
> 
> As I mentioned earlier, I don't have the full datasheet yet, so I
> can't implement this now.

You have been given a link to the datasheet in a private reply.

> Link to discussion:
> https://lore.kernel.org/linux-media/PN0P287MB2019AFCBDF0E24BFEF8E0E399A0F2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM/

-- 
Regards,

Laurent Pinchart

