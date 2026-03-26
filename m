Return-Path: <linux-media+bounces-57141-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGwJC0shxWmC7AQAu9opvQ
	(envelope-from <linux-media+bounces-57141-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:06:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1BD334EDF
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3970930034B2
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 11:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CD23F65E7;
	Thu, 26 Mar 2026 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fpy7/WFm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601693B6341
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526161; cv=none; b=ukFbeq2sgAmcLjrDUyha1yfbGrD2lJzqBTVaQkZzYSqm//+vTuyLgLXZ8GkajRB3Fb5thP037+mmhIQOfeBTbQJmfl7WiYvQItgGpDSEIsmsjuRrvTQ5C2MTdJb4vY8/6jjyOW3aDXqXDk1B/aqLxYH3qxjdIAU2wXovhTuNyfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526161; c=relaxed/simple;
	bh=wzmkPOH/ul+d5N3kQuPZg3oGSHed9O4SRuzSBsbfMn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUGb/ePGOpFerBCtZzmfisWmSQCS2/IlMmkzvA0fJiTxT2hKD3OIjOshbOnmJFauxnMDYnUBgRB1KqM97KgLmzdF2d9yfcHGuanxlBPRJvRVHM8jQKlrUnWs77pZjuV/8HJWOijDgcy1A8t9+Pgw7hL6aXIF++xiMST2772zHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fpy7/WFm; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso125947666b.3
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774526156; x=1775130956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TnPTTZ8zwBCkkhVfsAo6JxPxFtZTUAsnPoPyWZufs8s=;
        b=Fpy7/WFmbMzYAbtr95GqmYOrPnYQvR73ZkUMfPKjkVe76x6PV1pdPCgywzzkiBSFjR
         Vk30fiQA9xx2MzH5jEkIJ4B21zXKmYR9hDtFn/qrhQsgoDFY8shIE4fr28lzUQ0Vo14L
         yDGdTE61aNDd9T2KBA4pkffq3AmlQJU2g+qZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526156; x=1775130956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnPTTZ8zwBCkkhVfsAo6JxPxFtZTUAsnPoPyWZufs8s=;
        b=CgZZlNLxfUh1EuX80M42zNdXK0f/VX/fi0jMK9FQC8Mlb8Fk/3nCPRZour40P3hz/h
         C2H0GQuKAquU+Q2FbyBEANPCFoj7Fz7VHK3Klx7mdUU6hqfAQ1Jgx3tjV28lOt1MgxeC
         GRltterwOSr/B/B5/dvP9GUahe4SDi5Y8mZU83/oV5xAZhe/zsIMdXQKDPPv79Hz08KK
         O4QfeN36hMypUEFl2Kqq2ZYaEAUPXunqJY4N3ActeHvgf1E1T9VimJWq+gtx4T0x0wjb
         o9z7oED3UqZQgoVCBKMDpFf5xllB2HgGE/y17NBONUozi4GoUE/++KdHaxWzNTX3MmX0
         ZwzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt4IiOO4dJhq3UqpVJk2CglBdlel62Ae6WHy6HVbXFUbToWorBVXOGCgreqUGZyMzLkaLqt/xhBe6S0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU0+TGhUKcVyRIhj4UR32a3HXqST5lZSod90knjLwGBF/A/gX8
	m1bjy3BtN3asNw92B6Y2tVF0RroDYsjjQsNfSp20Eow6fuiMUmYzugObJgJD0PQpE22k7G/MFrO
	aFRHkYg==
X-Gm-Gg: ATEYQzzeJtRnUX6E8QsWcFDGa6Owd4tiIRlvNzVrC/SRT97aL73PXSOBkUmP90LgBiI
	arqb9f6igwFuQR77L2MUf0nm0UDTjRNKmEERBucnLjTfIw9Z97pC8KnyWLzfahlLsndBoFNabYh
	hFN/jP3KFbPAStTbqIDIOkc4qKnU426hRRIBeXdH6vCDaDEmbOx0OyJHJnV7iMGOeiLvYLlGKXv
	ERHnhVeXue1Vh/4ZMWb0G6QeneaBJr3PJHSt79O1HSvQt+EdoQgBiuMbpcchmhSvT1Yk7FDCBcy
	Bl9PKTo0T7PdWFxdbbJXd/8zz1GbMUfiXChXg44l8USkPlR8vtj1CyjJ68S9MMpHvBLgSCO1Hxs
	+AVZ6io/lfq1qS7N6qJ9temDMsxIrXjcofyCuCX8ZheUJvzGkiKMLJZ/Gpz9DXOyMW/kFs8AP/g
	BjjBWevN3EOeWoZ5DRl1OB93eiFe6M4ixcl59IOa/+frJ4WDq4HgnK2Ao1m+d+MEUrbRMpT8A=
X-Received: by 2002:a17:907:d40e:b0:b97:1db4:e5b7 with SMTP id a640c23a62f3a-b9a54224304mr430717466b.33.1774526155812;
        Thu, 26 Mar 2026 04:55:55 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b200206c3sm110717466b.0.2026.03.26.04.55.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 04:55:54 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso125939866b.3
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 04:55:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXm4u77JlWzpr7bhsMd1FH2ntXToW3ljl8bo9sWbntcqIAY0e2C3vHppIDbW9oP/2Scx79R0bF7sXG2kQ==@vger.kernel.org
X-Received: by 2002:a17:907:1b1a:b0:b97:f2b3:49b8 with SMTP id
 a640c23a62f3a-b9a542719cemr461688266b.47.1774526153378; Thu, 26 Mar 2026
 04:55:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org> <20260319013657.155efeb0.michal.pecio@gmail.com>
 <CANiDSCsBjgZL0MGFgkDzbTaJ03hE0gZbV3tu3fKo7k6KaAcMZw@mail.gmail.com>
 <20260319120856.09f2f15a.michal.pecio@gmail.com> <CANiDSCvw8+KAbrqqSr76eLpdyMoG_o6miy_nGEyS6bRqR4j0PA@mail.gmail.com>
 <20260324130713.5c9c3633.michal.pecio@gmail.com>
In-Reply-To: <20260324130713.5c9c3633.michal.pecio@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 26 Mar 2026 12:55:41 +0100
X-Gmail-Original-Message-ID: <CANiDSCtG5GBX6JL-OxpviD8vVdf+3q8TvsvHRRh2MVha4sVJxg@mail.gmail.com>
X-Gm-Features: AQROBzCcT3XECU5Iu-CGqCzk6rLSclQQSyag8sP-mWZa943uBv1mFIp1bJCElxM
Message-ID: <CANiDSCtG5GBX6JL-OxpviD8vVdf+3q8TvsvHRRh2MVha4sVJxg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] media: uvcvideo: Introduce allow_privacy_override
 module parameter
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57141-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2A1BD334EDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal

On Tue, 24 Mar 2026 at 13:07, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> On Thu, 19 Mar 2026 12:43:21 +0100, Ricardo Ribalda wrote:
> > > > We can then decide if we need a specialized API for their use
> > > > case or a Kconfig option, rather than leaving the current "anyone
> > > > can turn off the privacy LED" status quo.
> > >
> > > Why not just add the specialized API right away?
> >
> > We don't know the exact use cases yet, and I do not want to design
> > an API without understanding the users for it.
> >
> > At this moment, we have only identified these usecases:
> >
> > - Disabling the LED to avoid reflections in glasses. (This is
> >   generally a non-issue with modern hardware).
> > - Baby monitors. (I would argue that physical tape is the correct
> >   solution for a sleep-disturbing light).
>
> Indeed it was a rhetorical question, I suspect this won't go anywhere
> beyond the module parameter for lack of interest from users. Apparently
> it's a niche thing and it already works well enough for those who care.
>
> Kconfig could make more sense to exclude this whole "filtering" logic
> for those who don't care and may not appreciate bloat, e.g. embedded.
>
> > I rely on my LEDs. I know they are wired to the sensor power supply,
> > so the LED is definitely on when the camera is in use.
> > I want all users to be able to trust their LEDs like I do.
>
> This is objectively impossible without a soldering iron, and trust in
> something that's not even real is ralely a good thing.
>
> Ultimately it's just a software controllable LED. Anyone can drive it
> through USBFS. You have a point that restricting this in uvcvideo may
> keep some sandboxed applications on some HW from behaving in a manner
> unexpected by some users, but that's about the limit of it.

Just one clarification. Not every user has permission to unbind the
uvcdriver and use ubsfs. Only priviledged users can do that.

From my point of view it is similar to the filesystem. "Anyone" can
read/write files (if they have permission) but just priviledge users
can `dd of=/dev/sda`

>
> And I wish that you enjoyed the same flexibility as those Logitech
> camera owners. But you wouldn't want me to try make it happen ;)
>
> Regards,
> Michal



-- 
Ricardo Ribalda

