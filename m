Return-Path: <linux-media+bounces-60713-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG47Cpoj/GnWLwAAu9opvQ
	(envelope-from <linux-media+bounces-60713-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 07:31:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCDD4E31BD
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 07:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82DEC300AC8D
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 05:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AC532BF5A;
	Thu,  7 May 2026 05:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E47IX78W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EB940DFA3
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 05:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778131862; cv=none; b=aFcqEYAyHkn7Iwn4Re7jiJQNsxzcGLVgGjI46QWNpfQGMLS1qLiRjMarOWNlN18jI3tZ7+tfmQu+Su9QdP/O/btpOhDyVakXWZhTb/lyCBNJ42nGvbxBV3M1dvq5QvWhZFWVWheTT3I7bWi4IWqG+6vEGpuYoHyZv8/88C139kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778131862; c=relaxed/simple;
	bh=0B5APbRvbvIpLVwFqNV6VYiD+SX6luICyFidPWM3nLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFTv7vq48KtoduK+lBF6+F/Awd3YokdHj72HJ5zYXElFpDTfkwL/1rE762LYafFd+J37AvuY3pq7lUw6tuaIjvZRrQO9VtJ98OFBlC+PACkSlZ2NDb8kafEf18F6/xtmbcRb63nGfUkZB6WH929mq5QvKWKcGQlhDOjLi/C39jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E47IX78W; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9358bc9c50so64775866b.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 22:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778131858; x=1778736658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JE61xIPWkUIdloFJv0Sn9GNYrFac/2jD5sF/IXzAqEc=;
        b=E47IX78W8sSsUyW7pJ7vzsywdkjBYur6TwYgnTyDvqQykx3IWVunze0I+5n/5jK5cu
         H8l3RR3RhSw00DBrs7blFSEBsK4e02EDs+8Q7UoK+4U5MDDEe+Vu/Z8WfzRNWOzJGmZR
         ZP52PNw5ueThtg0sZmr/JBqmf90NHguvYdICg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778131858; x=1778736658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JE61xIPWkUIdloFJv0Sn9GNYrFac/2jD5sF/IXzAqEc=;
        b=kpr9kkeT0mLGL50AUTTmTS14CEMviokR8xl7Vf1ILP1jcppB0tQOO7ixLebm2ZzdsV
         0CMAHTr864o3aVoYEZSn/w+kr2E0mPVco6OEVy56P4P5nw4x5tRvCjVp+73Mytmwxwg2
         bYpxO98PZ0Gf4DA6HjiYlI9iKmf3a5UUqMya6k9+M13BYBtblb80dZL0yIMhiuxDACCx
         dvY8L2gGQLkY4KtftVqGTfy6CtBOXS9pBJkaOMxl+v2VPXWgjKJj6WzX7/jtW758SIED
         w6I+Em4qcMiIJRIh+tfeOvztT7PPeL3E7yAeI1/uNNN3+bTLMI9unA9XpMbeU6oKblQ5
         NQ6g==
X-Gm-Message-State: AOJu0YxEicdxj5aYiJlOgZ7f0Qht4tcJuApaH2w/LEx7XMewb2EJDaXg
	m6JQTUXRqil5dqv7bkbmxSiOQteGpzUiobEzbmyVZs/YRG6/op2StA6JcXGubUFV3GYvaVDz8xv
	RHzNSVSrQ
X-Gm-Gg: AeBDieuiUnFAtZtt6NwlWrXX2dFZ/5YGBScDN3sMpXqS7jFrkFA6okVrWxOyAuSLV5q
	8PUmzjsE/CYU8FWcIgAPCXhdgUxmSgauR86FTdOcmayhlySoosUI23vUdroSbw88hUuQinwUyN2
	QP/oMKaU13Sd5SLhLmKKiHKfNLu7epB3VdR3ucTWzeOtkD4HWwNCSab3ni0brpuwwYQGMQMWFpS
	P4jxk5Cn88pDgikV9vvzhQFbOvmVQEGEFNlRdjLFrRlz1Y0v68fwY2MG4lYuror3kR+cARqL9XY
	lfCys3b9N+1q4FwO2jQKP2y6vK6VErfrIHSECodnh0goyGzYMCwOcxZllU2RDWkO15crZZAM8co
	dMR9OxR0xjS3ga6mVTliypm0B0BvpcYBi8nP9QKKpF4n9dT3JvHlRb+R0d6p1ND2RqGHbOdRPiS
	rxyYbQdYwxmaMEzwc4rMuvkALzgRtXRh5IFbQPUHUL1RabXT6bB4KKeDpnzxJ3Rxv47K42UJ4=
X-Received: by 2002:a17:907:934a:b0:ba2:4338:e9fb with SMTP id a640c23a62f3a-bc56e606965mr388350966b.32.1778131858450;
        Wed, 06 May 2026 22:30:58 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc81cd34ce8sm41855066b.9.2026.05.06.22.30.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 22:30:57 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bc64ad08bf9so66478566b.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 22:30:57 -0700 (PDT)
X-Received: by 2002:a17:906:4fd6:b0:bc6:bafb:ea59 with SMTP id
 a640c23a62f3a-bc6bafbf3dfmr130694666b.25.1778131856140; Wed, 06 May 2026
 22:30:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
 <69fbc7c8.9d0a0220.1bdb77.e857@mx.google.com> <20260506231134.GD1778786@killaraus.ideasonboard.com>
In-Reply-To: <20260506231134.GD1778786@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 7 May 2026 07:30:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCvfB3xJGfwwSAgXEBHQEU8qoyLOrtSEEfGaBwMWYaCG4w@mail.gmail.com>
X-Gm-Features: AVHnY4JYXt-fLM1IBHLQnMvS4I8gmASaJDMwMm8zTciZYrJmIDlyi6bJs50bfwY
Message-ID: <CANiDSCvfB3xJGfwwSAgXEBHQEU8qoyLOrtSEEfGaBwMWYaCG4w@mail.gmail.com>
Subject: Re: [v2,0/2] media: renesas: vsp1: Fix display pipeline regression
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: ABCDD4E31BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60713-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,pages.freedesktop.org:url,ideasonboard.com:email,mail.gmail.com:mid,ribalda:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

Hi Laurent

On Thu, 7 May 2026 at 01:11, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, May 06, 2026 at 03:59:20PM -0700, Patchwork Integration wrote:
> > Dear Laurent Pinchart:
> >
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> >
> > # Test media-patchstyle:./0001-Revert-media-renesas-vsp1-Initialize-format-on-all-p.patch media style
> > ERROR: ./0001-Revert-media-renesas-vsp1-Initialize-format-on-all-p.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
> > ERROR: Commit 133ac42af0a1b389e8b7b3dc7c1cc8c30ff162b6 found in the stable tree, but stable@vger.kernel.org not in Cc:
> >
> > # Test media-patchstyle:./0002-Revert-media-renesas-vsp1-brx-Fix-format-propagation.patch media style
> > ERROR: ./0002-Revert-media-renesas-vsp1-brx-Fix-format-propagation.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
>
> I'm not going to add your SoB to my patches :-)

You did not get the memo. From now on, all patches in the kernel need
to be SoB my me :P

Sorry about that, Yesterday I had to recreate the local repo and
forgot to set the proper committer. It should be fixed now.

>
> > ERROR: Commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f found in the stable tree, but stable@vger.kernel.org not in Cc:
>
> I don't see these commits in any of the stable branches. Does the
> message mean the mainline tree, not the stable tree ?

It means the stable tree

ribalda@ribalda:~/work/linux$ git fetch
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
937f3e6b51f1cea079be9ba642665f2bf8bcc31f
From git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux
 * branch
937f3e6b51f1cea079be9ba642665f2bf8bcc31f -> FETCH_HEAD


>
> Given that this series should be merged in v7.1 as a regression fix, why
> should it CC stable ?

Somehow that patch has been backported, so I guess it should cc stable.

>
> > Please fix your series, and upload a new version. If you have a patchwork
> > account, do not forget to mark the current series as Superseded.
> >
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99198847/artifacts/report.htm .
> >
> >
> >
> > Best regards, and Happy Hacking!
> > Media CI robot on behalf of the linux-media community.
> >
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > to this message.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

