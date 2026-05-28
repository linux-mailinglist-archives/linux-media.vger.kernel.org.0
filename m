Return-Path: <linux-media+bounces-62951-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCh6JlEXGGoAdAgAu9opvQ
	(envelope-from <linux-media+bounces-62951-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 12:22:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA75F086C
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 12:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57B29300D76E
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE583B27EE;
	Thu, 28 May 2026 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="URRIknMp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A78337882E
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779963726; cv=pass; b=UkDjxnGvuhne8cU6KFM4TLbWbC0rPRUU9HSWUhUsO7Viwj7t53QkSEXp9pePOKFYo+kOizY5kSbnBBdctAD/VU7r3pqSPS6r7XbqwfxPS+jS8lidk/sXBDKatyN2pUqyNxi0pqX6yuVpxJSPrFvSQa34zV0zGXy72balAHaHDyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779963726; c=relaxed/simple;
	bh=MXe6/m1adBwYTlEORw/Q2sCRsFwWpRWFlxkD3XmtGUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=diKqwSahmuIpd9BD/kYzUuVN7PCJwhkvGcgYwl/BxQPH+LoYjxbAHCbeFVn57id61/x9am6t7pNsWLEuEzlKRdX9x7kKqRfjFf2SDRjrtyo3OZLNB3NwNSjoodyIKJZmYtg8ubN3Rbss898gy7Az4cledJmwCngD5xtMtE5t41U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=URRIknMp; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7dc67a5e102so4887537b3.1
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 03:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779963723; cv=none;
        d=google.com; s=arc-20240605;
        b=WHNO6RtfO7r3OvC9ENfL/Qd+5hYvMetakKaXikj4MOIR7MvlNSFF1KFlOxKMJ9kHMR
         wT3BtgxPTqWSPDf/T0JTymhw+qB4/XR8LbS13EfgnlnS16OmHBpvXflViaP8JYEqsm3R
         qZWRdsSuwlVFJKeHxUiucp5KIwm4lBjBeJApoOjBGICtJZHcRNv+6uHcE3wUZKnuBXRR
         jsYhC45JxfxTf9Wy2H1E9igXCxedjFHWFt51kAaR0qCds6GZ5kZQ07dZn0QHm+8diG+M
         JCKNP6PqPC+zDa6ZhkBWfSVKumxdZGccbH1bhaqMQvLyJZJSkN/hIaVa6+A6TzUGyhMq
         4EoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wd/GrZ3dwCewj0fDH+YsTtXc7Etu1moxohRG7C189RI=;
        fh=lT/9CRaNbUI5/6pvT1wIanGjJW02v1X4Sq5+UV2lwM8=;
        b=A6x/EtSgpBP7SFnDGSrclropYmD3Zb7GAQgBPLP43AnH2KBL+HpdJEIO1bCY6hR2aW
         oNtxdts1PAlpMDoh7B6GoXNd3oHkGkIOjCScZAnmAYByp1c7ikHgxgc7CRYPat1dKHkq
         f+soB5Q5dxqJwLOmmBO7swkv7vdZTDpPDxrnJiQu7v65E1/tXaYLNy8qboX3kK+bvZeu
         oR41A4f1FTnN/QBdrExI9wuPza9fNanos0+TUYSvGsDCcSAYhgRt0t5p4k9EzkCv/DXQ
         Tvq4rpJH25j2Es+0RSzXBoReoMFiim6ngiwv5vXO2vhCGGLoCezuOwxAHjF4PlePspSb
         XGuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779963723; x=1780568523; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wd/GrZ3dwCewj0fDH+YsTtXc7Etu1moxohRG7C189RI=;
        b=URRIknMp5OzQ1gJ3N/mclHoRpvnbPHLsFb0VWKAO6icm9krRoZeVeKOmnudV0kLH9x
         uDkrAEETKItzLhMnJz2J2YJMccHio+s2CjQMZTG6n9xWmckgNCpR6tvRh355yJDvo3LW
         Dd1DzuIsYZ0lPrnrNhjB0D5o7ZQJfO1DXg61bkhSJX6Pxv93msyaKU5j2UzxT66b7l9I
         0D2omQn8wLqA51vhQMWiw5Jo72gOjm+Mmm3DpDVKfNx9l0a/T2+xd+jCXEUhhRhE426/
         zumC3PRrpp6Drc2fL2JX7htPTc0VU7j5T+XnXw3MDiaSC44l4SXYE/bEYBuYboMiHupo
         nFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779963723; x=1780568523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wd/GrZ3dwCewj0fDH+YsTtXc7Etu1moxohRG7C189RI=;
        b=dCBMCp4JPHAsHGAy8RwTO0F9THfK7x9FnWAv8LNB5N5M6PFwiX1vGkUeJpuYrRQHls
         UOpuUi50/WZeTuLZAd+hZ8LZO7KNfEJRlTWCXveGcCcgMfN4DSJtt/PjmVHq7tgc3NrB
         JmhzCqdgsaLCJi538EM7BYpuLY/7t8LwMRc0banApiGT9QFKGRN6+AvLx9g2ZYPD3fd4
         VrIhnTOlLCfLzb0tP+DNVQymciakztHZJ1PNwTKe2kb3+1gSKRgNCFwdidwiWzbUPc/w
         LkwRmbNzy0N0fbRiFZCBz3hUASvHTEyPjQWbAIJThpb1/0bBgzO9y1khPAoDidnDiLaQ
         2bKA==
X-Forwarded-Encrypted: i=1; AFNElJ+P3iU7NEjCMnUYEvwKrwZzzzOztQERGTDM7nncLwjo74eBhKP+lTYpxfJ7g2mN0wSKiGkvZk3/t3EB4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqA5gg66LFk+ddBZYY2kpod/wlJUhxSQ+KFnDsWE6iatls6CZq
	KEjJOJVIf2IWsR/0bUckgE7SYNt549x46Qr8QpbC4s2Vb1Gyrd8oDrvJB0ZD8MsbUiNZCnDTm2p
	UMyGQEwNXnORMDogYBZ6CZjeo1lnjpxkyCDpKWTB9hw==
X-Gm-Gg: Acq92OGhvSOT7TBt2p5oWqp7jM1UTc9Rj5QunnLdM9wTsxnqn6dg+pz3Cegr9RDCcHw
	dDYmkoAxDlXUTCnIKkZIVX8XZKqDbinKhSVnzUuYr2sqVEqbpcvzuZI81c4sSlUtqGgZAHWaIVd
	kWFU7dlygD4QK69ujg1Qwhc4gOCh6Onqgg49ncSJH1uK1RaDZypWBV20DMbTC6L7GGFLeSwaRwu
	HJzhTjnSnvtxUQUP17jk3A6QM37s8MODSnCzHZ28fo9HBkJpAw79Ro9mAsTIgHfxaim8aRgc+TF
	IqRLz6gHKnVrx5xTFhUVqTXeQEN22SP03DoPeuVANvfF0ys/COwaon9F1N01HeNnmBk2rxU0BEZ
	nadHf0GF0HFwZpfUA5P5XvR5gGDTOEFv6kNo=
X-Received: by 2002:a05:690c:e04d:20b0:7d9:222a:d7ac with SMTP id
 00721157ae682-7d9222ae1c3mr113086107b3.25.1779963723419; Thu, 28 May 2026
 03:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526214131.51118-1-dave.hansen@linux.intel.com> <aham35tbJEbDc1Ee@kekkonen.localdomain>
In-Reply-To: <aham35tbJEbDc1Ee@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 28 May 2026 11:21:47 +0100
X-Gm-Features: AVHnY4K4usxCpRpBe2NVLGn_gRHFzwAbSJtJA5zV9bklOiMG0ROEVp_bFM-szT0
Message-ID: <CAPY8ntBFG=FzJdWjU+jnjx9k5H=pSyb9AVGiYwH+Kqu2kLMLTw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove bouncing Intel media maintainers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	Yong Zhi <yong.zhi@intel.com>, Dan Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lixu Zhang <lixu.zhang@intel.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62951-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,raspberrypi.com:dkim]
X-Rspamd-Queue-Id: 07AA75F086C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari & Dave

On Wed, 27 May 2026 at 09:10, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Tue, May 26, 2026 at 02:41:31PM -0700, Dave Hansen wrote:
> > Tianshu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
> > media drivers (7 and 9 respectively). Both of their emails are
> > bouncing.
> >
> > Remove the bouncing entries and update driver status in cases where
> > there are no M:'s left.
>
> I can pick at least some of these. I'll send v2.

If Intel have no/limited interest in IMX355 any more, then I'm happy
to step up as the maintainer as we have a customer looking to use it.
I was going to add that as an extra patch to v2 of my recent patchset
for it, but haven't sent it out yet.

Based on recent commits I had pinged David Heidelberg (added to cc)
and Richard Acayan too as other potential folk with an interest. David
has agreed to be a reviewer, but Richard hasn't the spare capacity at
present.

I don't mind if you add that to your V2 of this set, or I'll try and
get my v2 imx355 set out in the next week.

  Dave

> --
> Kind regards,
>
> Sakari Ailus
>

