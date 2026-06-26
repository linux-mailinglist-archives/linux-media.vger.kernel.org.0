Return-Path: <linux-media+bounces-65720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id li0lKtRyPmo/GQkAu9opvQ
	(envelope-from <linux-media+bounces-65720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:38:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2E76CD118
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:38:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MhirYvIC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65720-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65720-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99EAB3016D2F
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A68B3F4DFC;
	Fri, 26 Jun 2026 12:38:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5273CE0AE
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 12:38:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477513; cv=pass; b=Diq/OuxDUDdh1Yvxou7ryxGczExVaWrQVum2oMpI7yvDPnNNvPRccgclt1h+fTxagwCUJUEKZd+vV9tTwBwNOscno5Pfdqfh0mMD1YnPToPwiCrgLmGUCKgf5sBIPHxUe/WjEG/Qx1lVmRt56aHmsAHbjSBIM7u8OS3Z8apZ8oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477513; c=relaxed/simple;
	bh=FHE24Esf7ZACzZX3hr5BkL/1ragaLXiwUjw1Use/2sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVt9Lj7VxmlvWJXQWu1+Dxz7D4xakWxtfvvDheAv8kSdndXQfrNVch78Ac5+3YSGLVcHwBbhvs665EZb0dKMq9qoGI8Oy7IJwGAkk4caV8gwUDEtRZMBZ9TkX9xz/aI+fUt6YxpmfT0yIVQrsmkpf5ULXco1nNnmB/AfGGB1pLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhirYvIC; arc=pass smtp.client-ip=209.85.219.52
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8dc87f7d68bso9578226d6.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 05:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782477512; cv=none;
        d=google.com; s=arc-20260327;
        b=n3SfSGbkqT0+U45weWwbGsdBM+x/mstcKCqSEYQEKHa097odQkSN8OJknTqF0RYqcY
         fGXy5O8Pm4qO0C+c1pEI+VyXCekHU0NZiIv5LwqyHb3f33MOgkcZRxz8mcEwHFtxTK1d
         hUNFqJGlwYx4EEnHgiswZn3aD7e8vfaOcL/rHTdQlacB6GUB0+nfS8rDs+FFLaJ51j1r
         aOSL6496blVMfDWdeSX8o7remmKGAu/+aV7XC4qOEaP0TPczXZvAl9f+e+Mrec35aR6W
         CABK3rct+TObtgqIIVVP4+4Hx/81q+1GNNL5hUy1JIDGcSyBYLupJbXBrk8ivnznNrkD
         WZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FHE24Esf7ZACzZX3hr5BkL/1ragaLXiwUjw1Use/2sM=;
        fh=Ka/pQabsBHfOj2PZed+huFlTY+BWaQXUENCCdRTbJYo=;
        b=pzTGrULEjjQfvC8PKEwJfA+L76ThIfmKroBjIAnDi01Dm8WOv8No5PxaZuG9T7MUZo
         Cn0/Htvw9qacHAqMKU9lErJg60SMyHzJlU2M+iR/lshc8H7iA82vHvpZ1dYw/4lZEF6b
         cFmpI9QBTCxvSPpMItLrQIKVC8FE0v64MWSgNx6vLwFzYbkboQgYLBoeM/moc52sygia
         rd9ukveoRtUtp0/4FAOBIaqoFMXL+m0g1lWXMNxogEKfHV5M2LQXuNLE7QrY3+pbzWsS
         R3EwRWY0lv79sP9UEFnSKKkwFDxq+FZ+Ue8EhgAOJqZ4+yWS//ax4jb9c2NPIdid4hqF
         5ASg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782477512; x=1783082312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FHE24Esf7ZACzZX3hr5BkL/1ragaLXiwUjw1Use/2sM=;
        b=MhirYvICs61kLhtuK3BKw3E3hwWtimQuKaPiTT6oXJJZRVha35JezgblonHipyKWFw
         mBL4XpvAJagvszKpMVXtsFKNDsPvtJoLk9Ml0D4Cmk+O+7EUvC03K0uEAEioKdC7aN/B
         ywcpeHEAJg7IdfXv2UW7Dh0WHI81UnJmupEseGc4p7c2tQf//TMNvwUc8qZLzIzRRFVQ
         d1Z1hzCrJqYG/tvIY3JS0Oe+muDHFq7OysIdcl0sRfZWaRj9oLQVH23I1ELBroSihusJ
         2JY83KtIl06G8y5vSPy4H18JMVUOS7NdvIpvRLm4Qp7osehDrcP9ln4pLIs5jgq2sbsg
         n2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477512; x=1783082312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHE24Esf7ZACzZX3hr5BkL/1ragaLXiwUjw1Use/2sM=;
        b=nrR4Av1zD0KQN/gpIFBi4xJlozB+00C3fHlH5ve3ytJ5kyHESJnrSJzxc5JrKmyqCz
         RkHtnefVnRovhPbiSaNrYwbE/fDOygSHiN5KrHreQhVnUQCO6h0UaeqPDDfhtNZO7RlB
         F6rC7dvwKOeP6amsaRTu0Dmenf45ZpLLM0CMJQg/5VNOIkxG92I7RgVPsNylTB0+tMCS
         XAZhjrHqY105wtmNcNAqxEUPA9KvaWACFSz9aHyaPfMPlB7X8+4QiwVvL9So02ypJw7M
         LYgw/N0xtXnYl+mwyjsRTUXO+RhK6u9cGH0tE0nuh0lfT2l/Ilz8AEtb8OU0IK1ye+YZ
         YMEg==
X-Forwarded-Encrypted: i=1; AFNElJ8Djeeypri7Br2FZhV1jUIaL/nMchtDQbVN6tBR6ljhbPxYdl0vLCwRrTSsSPrG00bLOVE3xh5reOCkPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySwlnZf5ovWTLYs5fZM4NyV/emXn0QhKxDcFIszf/Bg4kYoRF3
	hzr7WI8Qx1ReNGlBq2JfOl3vTcgvtkoaxlqKx60UB4/qtThCD3SQX9BvzkYPQnDG3VQ98Hh3FEC
	W7v8hlGjtLx8X1GHr0qzItQf7kuKlUm4=
X-Gm-Gg: AfdE7cmy7NzYw3ZRBTld/0SN4IR4InNvUfHG1A90YR9PQDh1oJcLp1ek5eLrqMB5j2k
	jDfNLhIAxu8Lwlkn1Q6emCt0UBjTZdFVwsEzxL+UGHnB/ZFHkhZRw94Eq9Koc/Tg0lLkFU4Ze0P
	niKe2XD09LoOQsZs8DOgMCFjXQCDfa8x4kLJR/cBpie2NV5JOHjDE8e1KjkB4nJxCNfF3UnG9XD
	FK82mVJHtCfi8l1G1TcjdR0nbcfkLmkcX+PdJFA0RX1VNDs3vmBweo3pygCpxQUTG/293z21LfC
	O+ctmLbm6K6kW2k/HGqLte4TYc+A4o4NNUS+MFtajrN5vOJ6IcBH7hBBDBs6L6Y=
X-Received: by 2002:a05:620a:4589:b0:915:8865:dc01 with SMTP id
 af79cd13be357-9293ddb0539mr1062831085a.46.1782477511763; Fri, 26 Jun 2026
 05:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625160228.59672-1-tharitt97@gmail.com> <178246824177.1799417.1678746966574660598@freya>
In-Reply-To: <178246824177.1799417.1678746966574660598@freya>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Fri, 26 Jun 2026 19:38:20 +0700
X-Gm-Features: AVVi8CcFyQoU98IjgiX9d9v5xaZ8339Wm9OfGaHdAcfegTSWA-faGgeYzWknwZs
Message-ID: <CACak8wPuBaGCBbBrpoPQ5ftQRtqwijvN_VJoRGs7FzYBGck-iA@mail.gmail.com>
Subject: Re: [PATCH] media: imx219: fix test pattern ordering and add patterns
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-65720-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel-mentees@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E2E76CD118

Hi Jai,

Thanks for the review

> Do you have a strong reason to switch this to the datasheet values?

I must say there is no strong reason. I'm totally new here and come from
the perspective of someone studying how to write a camera sensor driver.
The datasheet says that writing 0x1 to reg 0x0601 will set the mode to solid
color test pattern. So it is "natural" to expect that I should set
test_pattern=1 to do so via v4l2-ctl.

> I ask because this might break what userspace applications expect
> (libcamera) and also automated capture tests (that compare md5sums of the
> test pattern) in vendor board-farms.

This was totally oblivious to me when I made the change.
I agree with you on this point. Breaking userspace does not sound like
a good idea.

I'm open to making a v3 patch and only introduce new test patterns to
the driver.

Best,
Tharit

