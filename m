Return-Path: <linux-media+bounces-63208-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMCODG0oHWq6VwkAu9opvQ
	(envelope-from <linux-media+bounces-63208-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:36:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3F861A3E2
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0678C3004681
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 06:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE72370D7C;
	Mon,  1 Jun 2026 06:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vj1GX+oO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A9D367B82
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 06:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295781; cv=none; b=GZJb3K+HhySSXkax6QW1WJn+ne4G2MR0vLTwzCyyo4X0SFRb4daD6Ztm8qTsPjJatH+OiwYSUUOYSTsv0VFR9sv8HgYOooawPX0uyvb6YAn2d272Opp/kSih2s5/I8e7spRolez7A8Hv73BSjtevJ/vR9np7IdGW6bO/Lx6Rr8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295781; c=relaxed/simple;
	bh=y4GKVfH2JQeuqjvflWYfOWAYA1kmZFJDg/A9ORaS3UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fk4B7Ffho2apnhKFRif1Pj615cR3dNz4pvM1sJE3XilyBZo8PmC5hMeTK8okgA5J419yPJ514Zivz+S0Urs4uBHNE/OyqtatHLAoRZzPhWTysHq9YrrmpkhosFpUDxf+wnLUnTrQK/8yr2sg3Im8QXktnxsxr+pm1VG26PZK3rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vj1GX+oO; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68c08bfe5afso4951789a12.2
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 23:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780295778; x=1780900578; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cu+lUD0AJcyduTbR8bo4KdmmgIOlIKzQTx5RzeA9hE4=;
        b=Vj1GX+oOVZgtlMvPmYy9rg/7WcZurJaE/eHzG8iAfKRTFKdwNXYgtEXobJxU7fTXSd
         hgmJyeCeFDddJc2EHVR9aCHX3A5Gv7EA/uyg51G9Gq1bnK2XhLoo3ZmTE3oCiR1bJuLb
         MrwHXqiafyhVstqt8bP6lUaGRTrzBbjFxK/Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295778; x=1780900578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cu+lUD0AJcyduTbR8bo4KdmmgIOlIKzQTx5RzeA9hE4=;
        b=EouH2KCm257CLeUCvvrQyraNvhlaIOH2Sb4HNbtosnvUUrQ9BU7xYhorDPcNnp76/w
         NhHb5W98pbxAmJ6DFeuyswNhW8i+UntoyqDL7gR+Zxi2z8Y2dWDmaLpsPLbG47nUOdBN
         hKe76Lvplqa9wiwsPAou+Y2V5AkO8PjNDIREqpqHLXNR0n5OKCBZGuCM38+NlUoyvUlY
         8Bn4J7Hd/4unF01SxzhAX4ltT6NwSNCIXBfKUyZIrIy28ItGGVL2JZN532c2kfpESBuj
         S4XB96fGnjviqglC/kn5zcxh0m27k0B96wI0e5pYrx6Ry+9VEaNRc500A1HSASpfYn7o
         G1QQ==
X-Gm-Message-State: AOJu0YwzM+JZ2hV0/KYY0zVXT4NirdyKbB+MELd4MSVZjJrUzkss9ndK
	tKxKnQ84LEWsDXl/ztNfksMSKRTX69WO+DCXfLEDPzuwFkSdR9l582w/vXoIXt1BOO4p3rdn8cL
	mEAan3Q==
X-Gm-Gg: Acq92OH0GeVlpLLIgNQTL2PyQieFQpRGBjRYkcWVv2fcPWaeScXCJm+abk+EPsHWgQz
	svJVi8zH5K7E10z+bgBhCDj7wAz2jAMp2D01xALXHST2jmuUkSP0bb98wwIcPhHomyqucxgx63D
	LXtbgIPg3VujKO6jheykwDiQwUGSToEDVBfCPO+Gx4YoyxlveLHVtj+nifo2PJ9ZRTNhSYohuuD
	zeTZLkN+r6duEipMAZkq5u3z6O6iTV0ZW03Rlkf4YoOsFnxhg6OhvxzOVyJxJyfQBW5KlFNGwPk
	CuFrkyePO1pRKqpxcbIhMiBLolgayH7cgK/ALiQrb/70zG/3qSfDoWh8XhPLD2bdUtMxC1oucgk
	w4TM9NJ1Kyc575pkOmSQVVIvlKNAjsTYPBomXZQyYWdVXGcabSxiOvRFzgvewGMoPpshNrRcrLB
	hvx8z51mgCwoM80SI3zXxhrIJO2vlSCsc4XTXKkSIvpCSFZ5VqpJ6c4CfFJVRQghOdSbBdC3E=
X-Received: by 2002:a05:6402:2112:b0:68b:117b:215d with SMTP id 4fb4d7f45d1cf-68c8ab31605mr4615061a12.15.1780295777943;
        Sun, 31 May 2026 23:36:17 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb79176asm1619730a12.4.2026.05.31.23.36.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:36:16 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-beb44f97561so140765666b.0
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 23:36:15 -0700 (PDT)
X-Received: by 2002:a17:906:fd87:b0:bea:2fbc:4ef5 with SMTP id
 a640c23a62f3a-beab394ad93mr598245766b.44.1780295774343; Sun, 31 May 2026
 23:36:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522225402.247080-1-sakari.ailus@linux.intel.com>
 <CANiDSCtH7treRe_2Y7h9YoiAfRGXZoX9pHNpLhcaoT2qS5+mFA@mail.gmail.com>
 <ahVZAJrW8RxpWe8U@kekkonen.localdomain> <CANiDSCufMS4b14QJxaC0vs2joy1r4y04AFDMOphFObwUOLasRA@mail.gmail.com>
 <ahycERlz_hbEiY1p@kekkonen.localdomain>
In-Reply-To: <ahycERlz_hbEiY1p@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 1 Jun 2026 08:36:02 +0200
X-Gmail-Original-Message-ID: <CANiDSCuoj1Ke60W4Rf-aaFZM-to_VqHp98tKHBCY_XgAv=3npQ@mail.gmail.com>
X-Gm-Features: AVHnY4JT27cHwPtWlHISTFWbqGW9qKbU2jhGomzrz8y-7SBIggqPRm0SAN_qFQE
Message-ID: <CANiDSCuoj1Ke60W4Rf-aaFZM-to_VqHp98tKHBCY_XgAv=3npQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] staging: media: ipu3-imgu: Ensure correct binary selection
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63208-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2D3F861A3E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Sun, 31 May 2026 at 22:37, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Tue, May 26, 2026 at 10:32:56AM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > On Tue, 26 May 2026 at 10:25, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Mon, May 25, 2026 at 05:08:51PM +0200, Ricardo Ribalda wrote:
> > > > Hi Sakari
> > > >
> > > >
> > > >
> > > > On Sat, 23 May 2026 at 00:55, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > The ImgU has two sets of binaries, those that support striping (fixed at
> > > > > 2) and those that don't. There's overlap between the stripes and so that
> > > > > implies a minimum width for the images themselves, or the Bayer downscale
> > > > > rectangle in particular.
> > > > >
> > > > > Take this account in binary selection.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > > Hi Ricardo,
> > > > >
> > > > > I'm not sure if this makes smatch happy but it somehow addresses the issue
> > > > > it found. In the end it's up to the userspace to configure this
> > > > > correctly...
> > > >
> > > > Smatch should be calmed now:
> > > >
> > > > https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/c32fe4c4918c9aa49f61359e3b42619c4d8686de
> > >
> > > I dislike that because it's written simply to appease smatch and does not
> > > properly even try to address a problem. Can you try to revert it once
> > > this patch is merged? At the very least we need a comment on why that check
> > > is there.
> >
> > I think instead of reverting the patch, I think it would make more sense to do:
> >
> > - if (offset > 65535)
> > + if (WARN_ON(offset > 65535))
> >
> > I believe it would be safer, that way if the condition changes in the
> > caller we will catch this error earlier.
>
> Is there a need for an extra check in the code if smatch can perform it at
> build time?

There are no guarantees regarding how smatch will behave in future versions.

Also, smatch stops testing the code after some "effort", if the code
is more complex it will not test it.

The only way to be sure there are no errors is with asserts.

>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

