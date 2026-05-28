Return-Path: <linux-media+bounces-62979-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN+0OXW3GGqkmQgAu9opvQ
	(envelope-from <linux-media+bounces-62979-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 23:45:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 614755FA881
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 23:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5496302BA55
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 21:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E4A360EED;
	Thu, 28 May 2026 21:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j+ShT424"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B1C35DA6E
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 21:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780004719; cv=none; b=QItjkmTSq95FMzcxI8+nH7e4/d4HxQeUJZnB1WrUDQ7M2gC1pB2Mghvte7dWpldJ33X3fWuxOcBiPOYJtsLEj3UztMfst9yDr16NGXILvshPR50AVOkv0ZzYNqhpS14aMvcPR77CNO7f0ZR/TAeSpjCieMMN6MfRojC49MsIqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780004719; c=relaxed/simple;
	bh=fP4fsn5reJhuxunWjkjAxJLAcmtrBogpH2NDPagoadk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=efAd+FtOcHRzVyB5dq8tBZE2CyclOIiXLWmE2w5tLqEomZFvTPI0JD8/sq3qfiGhWa8LuXEA64B71EjRkAQJdH0Lp3d9R9uWZTENeHPERkuJ4M1S50CanhCR1yiOrvm71CYpD+R1VllS6xnmDeaKN8KBkF06UDSyp55YFrpcwaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j+ShT424; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-914c5898245so480366785a.1
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 14:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780004717; x=1780609517; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zoDD6ZqMX8b56NCykNpitUIpGJvL7EGCCpEPzQxswSI=;
        b=j+ShT424sf5QoNNwYhtFHOuIUv130OTf7/NGA3w/xUHPzz+Jk9XKdRbFqdzu6QiIHg
         vBMYUTGUBcryURVfGRPVrshWzVYQ86Lf+DA0TW3YTMClE8upAbzfvM/m2f5+SZyXuCOA
         Mibjv3JgchL6qH/c9KS99lUwglzJ3xEBJTz2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780004717; x=1780609517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoDD6ZqMX8b56NCykNpitUIpGJvL7EGCCpEPzQxswSI=;
        b=iyNeh/bKwMeOPkbxJCYUSlb1xKDuaBqBDrI7x0FRAZOXqtyk+rRPGEhXpmqJPvI+J8
         Ou9YJYGRhH80M2sGlgOnZnJs8JM/NmBYvmwauGnPsW87TymoetOzYQeqDo23+WUCJHH1
         izja0LzcuTfYJ3Lxfsk2Mo0j4kLiys2jE7r6Yqq5xNYRAPcsySpNudwKmCnuWlJ/oF1E
         9Tlat2ytdAq6bbKby7oM/ldlbdqcv0IFh4D0Ja/Eq/PW0PCgNXfyVkHB78KFyIly0F++
         Q3x68F/XbAhntYROqbLYj/oEElI27QWPKzAJJKtua8QTXyovd2Ldn+07hqxxLXn6TonG
         /H6Q==
X-Gm-Message-State: AOJu0Yyf1lyTHDIq0YnaYDvjcfzTYp5FYeOO0i3yrz1vgeIhQi2o6eyy
	HhIJQ4M9FdO5ajCEyMibXbuDzMn6ZSRwEXBoLoPz0N8kURBFMPBLBVlagJmWgwc1P8M4d2/Mh58
	DhfcXuA==
X-Gm-Gg: Acq92OEvixHQQkjq+6V3EWgYIr/XI4pXHtgEy0D31LbXEpn7bBPMAxH2Uf5vaem80p3
	bzy/djVWQ6YZFRvk2glIxOuCCPWEJicma71l9vOh0XNbz5FPHSCE9Xg1Zlxva6Oh0aG6U3nm+nF
	xHzNRxoB1iVuV2YFKBdrB2xiFR9iioIN7ZTrVnQwJol0n2hE5TfiCYeHYoLyVhmCMvPfYqh6csG
	kestBoPCD62DcLTVjW4Bz/v3fWALe3CtnMkNBv2K8yAU8nPOLMAY+cKul1/4RPk+73fwiKNdAbA
	7F5Z8YyF0IB4e1RfnPh9yDZirauXZj0rI+1iTWS7qBIFBNg5d2t3aDpaqgot005brMagvxnrHzs
	ZywKLBjMir+6ScdoTOVd3P1poPCmPsCfcYPybBxvmIMZ885MirC4fo85ks+cFUKcYumCx3Sxn+v
	MF1ybSKQsGEw9WyBN2Mv2FdGCciVCMKDxz0Zt7Ff5myubdGUrqPVheJk6HBUbfUUjPmeKqN3U=
X-Received: by 2002:a05:620a:454e:b0:915:2121:7be5 with SMTP id af79cd13be357-9152fcd2ffemr20946385a.1.1780004716583;
        Thu, 28 May 2026 14:45:16 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9152fd42585sm9761385a.12.2026.05.28.14.45.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 14:45:15 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8bb4e8a5240so166183876d6.1
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 14:45:15 -0700 (PDT)
X-Received: by 2002:a05:6214:33c2:b0:8ca:2fb7:664 with SMTP id
 6a1803df08f44-8cce21a3eeamr19914906d6.35.1780004714922; Thu, 28 May 2026
 14:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCunFkyGqz5n15ezW0LHCHqU92g6xeVK43zRcqohS-QsdQ@mail.gmail.com>
 <177998407808.933414.10133969094530331086@freya>
In-Reply-To: <177998407808.933414.10133969094530331086@freya>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 May 2026 23:44:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCuMUdh6MWw5O+nhFJzexMcGJRTZ38Fq1anihe7=zu5K2w@mail.gmail.com>
X-Gm-Features: AVHnY4Luc9qGgJFNqPm5fsa-hP8kAdGJY8Mi09oPDvYrMAm6ggXU8xSwklTI7oo
Message-ID: <CANiDSCuMUdh6MWw5O+nhFJzexMcGJRTZ38Fq1anihe7=zu5K2w@mail.gmail.com>
Subject: Re: Adding Linux-media to Sashiko
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-62979-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 614755FA881
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jai

I thought that we agreed to experiment with cc to the list to evaluate
the quality of the review and then decide how to configure it.

But I might also be miss-remembering it.


The current PR in sashiko has landed, but it is very easy (and fast)
to upload a change.


Regards!!!

On Thu, 28 May 2026 at 18:01, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Quoting Ricardo Ribalda (2026-05-28 20:41:56)
> > Hi
> >
> > As we discussed in the media summit, I just created the Pull request
> > to add linux-media to Sashiko.
> >
> > https://github.com/sashiko-dev/sashiko/pull/224
>
> Thank you. Does the cc option mean the list will get emails from Sashiko as
> well?
>
> I thought the consensus during the summit was to keep the replies only to
> the author (and maintainers can check sashiko manually) but maybe I'm
> misremembering it.
>
> >
> > Please let me know if something does not work as expected
> >
> > Regards!!!
> >
> > --
> > Ricardo Ribalda
> >
>
> Thanks,
> Jai



-- 
Ricardo Ribalda

