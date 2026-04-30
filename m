Return-Path: <linux-media+bounces-60037-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDdsJWS78mlAtwEAu9opvQ
	(envelope-from <linux-media+bounces-60037-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 04:16:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E1D49C3E8
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 04:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A4DC303FFDA
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 02:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AFE284883;
	Thu, 30 Apr 2026 02:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Wv3wlnJw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762C287263;
	Thu, 30 Apr 2026 02:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515302; cv=none; b=JqjDRQ9v5EW7BefNdpONy/CEiqXOEjzboOZ97+j3oJAD8Pq3quc4xTFDxdVhniNPBMAzr5xYvE1VjjyXuFiVWCKrfniEuJGZDccnNkW3mVfuDKWKnoYcBbJCl0SbTlOYIu/sZoMhpKNbLtXI+wlH2DSt+6g8trRD0IfSvvsyjrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515302; c=relaxed/simple;
	bh=1zCC7AKObbyieR95/cFJ9+NHzXUtcyrsCGYZkWH+vHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hZHBB4X35DVObABdROcT05UGL5QHYqhsLOvNl7bUL81sPQQgiumO3CoJpsZTQrz7wWfIXY7kOS9N1vUBma4vF7UHhdk/JNDWcJyVjk6xSh7G94tDc+HtkCG6NSogLYs1TWLvG0+fU2IDYJHLC0hamwTe7peTe4z1c/AislWVHEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Wv3wlnJw; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777515287;
	bh=HW+NJazsSNoz1Jtg9xGELfevFxqLCMTYFWcOjXN5PKY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Wv3wlnJwUfwxASUZweujIH/F4/muUUi4LBk9h0ZUB0ZWJToTiY97Db4v9tu9ItZOM
	 JxpaWxSIwIwFc4cQD7Ho8Y9xu2bzMH3mp32McSymzaNKnKkVlnBUwUDjIKUdZUnrj2
	 0ohKK3CiiNQmPM0PZYq6vAlgTE2FzXsR9XKraXPw=
X-QQ-mid: zesmtpip4t1777515277t274f69a4
X-QQ-Originating-IP: VddoJS8umxccj0SlXDjXRRJDPuzqz5Aeq5L4hpRgcm8=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Apr 2026 10:14:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2437857808746587561
EX-QQ-RecipientCnt: 14
From: Haowen Tu <tuhaowen@uniontech.com>
To: stern@rowland.harvard.edu
Cc: oneukum@suse.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	linux-usb@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	pavel@kernel.org,
	lenb@kernel.org,
	kernel@uniontech.com
Subject: Re: [RFC] USB/PM: should USB interface drivers distinguish hibernation THAW from RESTORE?
Date: Thu, 30 Apr 2026 10:14:33 +0800
Message-Id: <20260430021433.2083281-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <37c9bf07-7b21-403c-b4fe-d54ff6f811db@rowland.harvard.edu>
References: <37c9bf07-7b21-403c-b4fe-d54ff6f811db@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MMKcwIwa79XOzWP9S0oGJ8R7pp/e2PghilABU/Y/Kx6rKng6RE6qLaZP
	EkVKvn7ajABE9XrvDTPjEU/RqHf+p3Cj6XEZodMoLXs6I/odAdhlLUHvNpoZRK55bSyR70W
	CUSe4wArVZQSUSJdNZO3OQUlNJYfrhfAelNSgd0f4UVuju2axaX6THNipWoGro2dnP2aRs6
	H8vUm/KG4JLfIzBcDF9+gd8xcp8emC+mAIdfKOH/EfG+wCJgagpLudGgZglSUqka74NUoMl
	igO2dKzt/x+HPZqBNmwLk0VNPyQcKnsjAn/jCqlrPTtXAPM+BfToZ7FDO9gX+MJnBs2OBVG
	tA49GeFCzxHd+00H4vXmbSWX3ceyoErjONnqUShELHCqdwiKX1yq2S6Rxk+puxCWuOHu9Dm
	+V/Kgey6db44pOtfPAFG3NpAH7M3b5DBkzlDgGmVwCBdIniCK497ELNP9snm7mCWjLnIwdk
	E7H1WjjcslqfR4ki0B0/jATmP0D6NlK3H4+O5fAHqnWdh0Jtoqgjn60IIyGttMp6wEqiLBZ
	MhsxJ0fOLcvIN8yBs6ia2/CK43cf2shAUHzJC5HZHwHR/tDfbXYk6EshYIX34/1LL08dXbc
	CnCrr89Oz144YCV8VhlxJCzYgLtVPE/0VNcrF801hB3gWzXwmhDZaIYpVSz30idlaqqND2D
	IEkeO+Oglnu/5rxrHKHYy9/lQ0ZtuRstMZfZUWtxcEZ/GJVd8sfc32662QCd9gatdE2vuIZ
	4aQgNgfO/N36HGaxl33W8Enr+/N2PNgFXxRl09hRcMVsekSYWnflcgkzYAkQn7kMpzG76r9
	TD4TbNaYT3zUjTn3co7QCVZ5fzy3KJdBMokPAhkaeCJPRXrX6l+9pKB5ufPYmZYduBiBdoH
	GVmFn/y082fW7ovTjqG4Nnyh/mSCH1FmWEzFbedTrzk32kj5JfJGXFFaaitERNM/hevBd83
	JtW5bd33Gjw/zutNYSAOtxIZC83xhJa2Sc/oVJJUnOX0Poq7RliQXjxI8t4TpdttTrJQ=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 20E1D49C3E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60037-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[uniontech.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:dkim,uniontech.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Oliver, Alan,

Thanks for the feedback.

I think my original RFC title and framing were too narrow.

What originally triggered this discussion was a UVC camera: during the
THAW phase used for hibernation image writeout, the camera's streaming
resume path runs again and can turn the indicator LED back on. From that
observation, I started by looking at the USB side.

But after your replies, I agree that this is not really a USB-specific
problem. The more fundamental question seems to be whether, in the
current S4 flow, resuming the full device set at that point is the
intended model, or whether there is any room for resuming only the
subset of devices needed for image writeout and whatever else must
remain functional during that phase.

So the real issue I wanted to ask about is closer to this:

  during hibernation image writeout, should PM resume all previously
  frozen devices, or is there any room for a more minimal resume of only
  the devices required for writeout and their dependencies?

If writeout succeeds, the system will power off afterward, which made me
wonder whether every previously frozen device must be resumed at that
stage in the same way it would be for ordinary recovery. If not,
avoiding unnecessary resume work in that phase might also reduce the
time spent before final poweroff, although I do not have measurements
for that. On the other hand, if writeout fails, the system needs to
continue running, so the remaining devices would still have to be
recovered correctly. I agree that this failure path makes the problem
much more subtle than I described in the RFC.

I also agree with Oliver's point that this cannot be expressed as
"storage devices only". In practice, any such approach would need to
account for dependencies and for other classes of devices that may still
matter during the writeout phase.

So at this point I am no longer trying to argue for a USB-specific
interface change. Instead, I am trying to understand whether this is a
valid PM/hibernate design question at all, namely whether the writeout
phase should conceptually be treated as:

  1. a full THAW of the suspended system, as it is today, or
  2. potentially a narrower resume of only the devices needed for
     writeout, followed by broader recovery only if writeout fails.

I do not have a concrete implementation in mind yet, and I am not sure
whether such an approach would even fit well with the current PM core
model. I first wanted to check whether this is considered a valid
problem to discuss.

If the answer is that the current full-THAW behavior is simply the
intended model, that is also useful for me. In that case, I should not
treat the UVC behavior as evidence of a missing USB-side mechanism.

Thanks,
Haowen

