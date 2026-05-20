Return-Path: <linux-media+bounces-62388-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCh2FMNFDmoM9gUAu9opvQ
	(envelope-from <linux-media+bounces-62388-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:37:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D4B59CD30
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49204300E14F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 23:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEBC3CAE63;
	Wed, 20 May 2026 23:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDhVtNxX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990353C9EC2
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320256; cv=pass; b=NNiHjOZQuUFhwAA0w4P7W62OHLUPrHcn5wD2e+2CYX+OJbklkyDy+6Z2QoWCXApDiNUUaoOpMhg9J1t1A4/AQSJ8QBwqG5avEdlWaozEWd+UoeQmtoJWa1A65xZrjJw74DbkZ9/JJjLKzo77652nsB4KZBoDZQoJRzoKJegs6Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320256; c=relaxed/simple;
	bh=Sp6SIKeuA2uB6yGcJDbhDcgvTpERKEz2fYzJCywaX1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1p1M+OK6RINJQ6z6KZB+bjJ0rzq+6DayzPvflN1/gl8WCxDkF/5azGtnYG3mo9+K2tdvPKKKWGbKeIGF1PH3kONjX1macOp6T+u5ZYYfTDfW/qfXS5YkfpgDVoSiR29kRlCphJEKTZ0gpO+qX4CrwpfT2Fh+9BpETD5i5Mxnsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDhVtNxX; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8b74b460d77so71167206d6.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 16:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779320253; cv=none;
        d=google.com; s=arc-20240605;
        b=SLk//iCGGoEBa9vnFxNbGSuqCGWWC9sRhNcVnxczPzbdU7gCQMxzwql7XCnfsLyaGo
         2BNaoBltQGvX8/9tQULTmE7uGiUgdjC6PCaxa1F5zlxlCl4t0zku9UgJIoDmjE0AChyR
         rd3GpwqMV8eQQZN//pOqKGkQJTKMb30z2X2klSLO4LX3+OIgktwoN6g42T0OgO4cjW9F
         pC2FD+4lTsGEYsjs0jRd4cxI3oUQr5CWwfNf/rHhY4A5uW/NlOS7BPPSUxSbNnSc9bC7
         bkVLhApOHishbd0joxAfuF8sz+KXAysd1yKjoceKNg25BEDBunYz59wssyd9Y4IJHkHe
         qWHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sp6SIKeuA2uB6yGcJDbhDcgvTpERKEz2fYzJCywaX1U=;
        fh=hSE703MZuakIcR7x0NsdLKJh0EZTBEBEQOrV4xxE7QQ=;
        b=hLBZJLtHBRJ9TcFM9Af5uLUWWJvfeu0Q7Fx/IClgX5p972lmTpz9qvuyaxQO/sHeGJ
         BIFJXkX2BVh+/8iiPpNz1OWhHu7T62c3rsxZcuLQZ8gNLAm1SzSySqLFFmgkhjVBFJpH
         urpcxvUlM+lGs+Y377e0Sxq551Ls4EtfsNiQuKXcISqkhlp+gLRXTH+BEhEE0ZKuZMBq
         mOr/7Gq+Z5SbTJP7EIeaErthlGxR1Hgg60IcrhWHKzeJVLaI7xU9/OdbWRBzHQ7lLsKE
         aQLdEcqvxhjqtRGZcAPmnYch7/n3Y8vp+jsNL22TJWyuXXyCDQO3KVroNChEIidyciZy
         sDjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779320253; x=1779925053; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sp6SIKeuA2uB6yGcJDbhDcgvTpERKEz2fYzJCywaX1U=;
        b=TDhVtNxXTZk2ym66zKAa7FT1G+IS5kFAXdbt7vcPCobuP4sfGXj348UwfdikxZwg66
         drmsPYbmAl9NRYSBwTWtk6+Ib4FHDivTFVs2fJe2+EY7kMMR+Y6pvSChI8Xs6L+dr1wn
         6QkoG+5dyv+htllrNQnWI83g8WYoxbZM7cxzMmLSRw/WfQbvxGAbB/g4gSEb38QxMHM6
         B4XBYpp3L0dCFRCTclZ38v9Dya0wbwU7IcAv99Pd6Vp6+eBiJ/UnVmqvzsG7gJhI5b+K
         wcJ/+kCS3+KA17gNdYJ3EKcWwnEof50EJR86AFyJKlXdrSuA2gaX1WCsXBF3Vtv0I2jQ
         /pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779320253; x=1779925053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sp6SIKeuA2uB6yGcJDbhDcgvTpERKEz2fYzJCywaX1U=;
        b=H7/HBKrRWBSzqqEVv5VtyJYyixhkcCajMsxn+MYQaJzMmi9/AjsVPFdzNjTsiYp+7L
         Xpb3vZXTHAatqRbhM2FyeK/L3lChTg+QFz1FRLGyd9rPK4xNzV5OmKAQocliutnOejiR
         Utp6BtQ+p7gLTQ2XIjTG6yjkxBa0h+MjyXCp8rihjK6yISIpt4eYzCdWfVgl0sBDJTgA
         d7j99gV9fQ/EMpdu/M/YZkI2krl2iwi3pseQXn2jCH0iMlk0m9orposwOer80nya3DIa
         AB9PnczBQiSi7tw5EjqqmTGlnygUg3Qm56k0ORPMGqzzHyw3fYiyybjMr+60zzZUvgkR
         p0Mg==
X-Gm-Message-State: AOJu0YzcZJqaCIXj/9S1Uuk8I3n5aznvqq/e9AyqqO3zBRMS3eVAGbC7
	VyQC2PXzD5SCYOh0YlwgOkdNIqiAtzIonuQWcBHzO4cqgHxxN0qssMm5+WYXuHIRfrU6IRmCe6j
	02CTbl+9XVnk96+kBVeONaDN6AW6dB5/2Jzvt
X-Gm-Gg: Acq92OG8GF9UcpJaHE3uUWwUfvLkl2u/iONexadIP5Y0TpYvh2IUiTcbkgrKp1/+NA0
	oRkHVmracAIXUQCnehjWec5ieEO4K8Bx09zx4TtVWDs6GxLp9ESvaIj6fKMFXDmD8tYQ5WCK6ol
	IIXHB79aaGwC0e2JlCkQWrzUZt1/rCB+X5QV6wioll2rAQc6z0bsDjWExbBPci3OWY/yWcWULPj
	LF5tyiuyai+9f74ek+J07e/L8KllXEeKjsP2x/phv54owezukR5eFs8AsRpmZowIYetxhx0aY1A
	D/RYt36YMsZFJcmp80Bf70eFaUgPesvDZi8zHaVj67dQCltxjJR3iQTghpWvXWeTAAnr70OHqzV
	QGp3rqs1WTtX3
X-Received: by 2002:a05:6214:c26:b0:899:f24d:1245 with SMTP id
 6a1803df08f44-8cc6e67627emr9539666d6.43.1779320253600; Wed, 20 May 2026
 16:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 21 May 2026 09:37:21 +1000
X-Gm-Features: AVHnY4Ie1EkZP4MVWC5BJhOzB-LRjbEQVuRJFLZbvO9ezWJOak9jMyGsYRj-ryY
Message-ID: <CAPM=9tx7aP08jEtHN5KOhekfky8Qn9U5LZqUybude3D3OVZsTg@mail.gmail.com>
Subject: Re: [PATCH 00/11] media: renesas: vsp1: Modernize the driver
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62388-lists,linux-media=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ideasonboard.com:email]
X-Rspamd-Queue-Id: E3D4B59CD30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 12 May 2026 at 09:56, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Hello,
>
> This patch series modernizes the VSP1 driver by using scoped guards and
> moving loop index variable declarations to the loop statements.
>
> Patches 01/11 and 02/11 prepare for the introduction of scoped guards by
> splitting a large function to lower the indentation level. As the
> function is called by DRM clients (R-Car DU and RZ DU drivers), an
> inline compatibility wrapper is introduced. The clients are then updated
> in patches 03/11 and 04/11, and the compatibility wrapper removed in
> 11/11.
>
> Patches 05/11 to 08/11 then introduce guards and scoped guards for
> mutexes and spin locks. There isn't much to say about this, the changes
> are pretty boring, but generate a nice reduction of 148 lines. I advise
> reviewers to apply the changes and use 'git show -b', as a large part of
> the modified lines in 06/11 and 08/11 are just indentation changes due
> to scoped guards.
>
> Patch 09/11 continues with the introduction of a helper macro to
> simplifying iteration over format arrays, which occurs 6 times in the
> driver. Patch 10/11 ends the modernization effort with declaring index
> variables in for loop statements to avoid using index variables outside
> of the loop unintentionally.
>
> Patch 03/11 and 04/11 touch the DRM subsystem and depend on 02/11. They
> could be delayed by one kernel release (in which case 11/11 would need
> to be delayed by two releases), but I would prefer merging them through
> the media tree if possible if there's no objection from the DRM
> maintainers. I don't expect conflicting changes in the R-Car DU driver
> for v7.2. Dave, Sima, could you give your ack for this ?

Acked-by: Dave Airlie <airlied@redhat.com>

Dave.

