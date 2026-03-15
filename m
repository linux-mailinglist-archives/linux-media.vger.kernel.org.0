Return-Path: <linux-media+bounces-55817-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SlhVK8sOtmmS8wAAu9opvQ
	(envelope-from <linux-media+bounces-55817-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 02:43:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3310528FC5B
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 02:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75EE630856E6
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 01:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A09218EB1;
	Sun, 15 Mar 2026 01:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV5L3weC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0101015E5BB
	for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 01:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773539010; cv=none; b=j655Rkl3HClRMDfHg+ACK/p6tvOvEolMsUWdn1spSV3pQxV4pUMPQhhXa5yFsY2WdIHcWGSBWTdzhlotlMrC5q5lFscIWKWMwenJXD3MpBgds+nJRTLmE/uxvChEOIUXByZdsoj11PzrZ4fScnYkPnOMHJk42RsfgfGN296KTDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773539010; c=relaxed/simple;
	bh=qJcMV82BZwS7YiR8z9LJsdW00c/RT78rvI7sTJW6f+8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QjPfvlMaBncdrnWiEcpAKP/eTMigUWX3a4fHqRvvMucz/+lxNgL79FvZx5zxO/AIyH5pko4ZZPY57Tms29RHewQ5W6NytbkNb/6Ru92rU+e+P7MjXW+Nts6R+PRxKslWXT4608zq++PoI1/n7VgvGe0WdE5M7ylXU/ukHHH31bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV5L3weC; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso4202646d50.0
        for <linux-media@vger.kernel.org>; Sat, 14 Mar 2026 18:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773539008; x=1774143808; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJcMV82BZwS7YiR8z9LJsdW00c/RT78rvI7sTJW6f+8=;
        b=YV5L3weC8bI8c+setyknEnsaltyNfY61jnB5gQqYlj7o/GNv7L/eZzDCRqnCsLNj45
         1uIS7rIfwDAc0HebBnFD/nsUf+nS1SvTDj7UNr0EetddJgkpVH08nzF7zD/JkyneKpG6
         huTaF+0iEd1LLGpOOks9V25K5V8XJuPvgWXQfZtWsr2b1l1e5dILqNushHy/pOKS/vYX
         qJtHPPBVdTMJ+fC+eCkH4sPuM+YP4HvjyO7YmASEmGZJfR2yU073vy18EQNhn5F6Bcd6
         ih5qfadz7OzreIwOaxxfHcHMB6mgDi8ltnolt61EZImMEnAkjksIKtRKojnkpzmMmv6b
         Yu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773539008; x=1774143808;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qJcMV82BZwS7YiR8z9LJsdW00c/RT78rvI7sTJW6f+8=;
        b=FiliiuI1xfpDCO0NtTUES2H/lFJ4uqxFVzn+m6Rs8UQa7kMEUqIMuqMXqKPTyigUZR
         Kuof5/rwZmBhYbLFQJlpS6KbVFmZt4ppEOLaHl0nUGZ9zwTs3bZYCrKfxWdENIKCS82C
         AzPul3hvHDUle8QmT5i0TTGY+4tu8EHHLA985ippCwSKL+FZhqkP7/v8KYxAMsiV4jBn
         TF8pPYEjv5Hyqp9PgQArKf9w7vbW8nhcBk82a7P322S16t75dZy4xaZsDR+8dMvOJ4U7
         p8CVX01Penr6+a+6/GTar1ICy1+lpJP1Pcj0JUyMKSzxv8DxoDbiROPbdviuAkZ7WFw0
         RrHQ==
X-Gm-Message-State: AOJu0Yx4j/xgeeAb+FflmTGtzuNTEB/I06fmQLhnW6G1xiZjIhogq6Ga
	GkmZzQDf3yrVpuGdY9ec7NU96yG5kJxaMTMqzTQ6pt3hRzV4M4lZJ1Kj
X-Gm-Gg: ATEYQzwfFrODrIM2mkjMU8QHiLgJKa8YCmm9XkCh58/faWHStZx9hnkez4F83QDQsXg
	Hlnfa8A71tXEKmLarAR4AUTeuakh5tjHFhr3cIKxk991iiGtXKxKHB+f4sbu3kr3yNzfsbBF/1c
	b8hILr9tEWcjuMrdltiQoqCpfTzCRN8uiMPkKIBq46aI6erBlod4cQW5fh5k+7s93N8zF+3zUmj
	0tCh/2YaDt3F5BGBW4G6A3qPqrdC29aB/3QusTSq+/uSv2lEPIC8aq5rivAWpg70hie4UP4fUX1
	Hkr0AZ72CjaOUCK0IHX3xoK+fybVp24aEXcn2V28QQJy/AZ1gzFICIMgtf6BjD1WFSlKfrqMSVf
	DYi8qAgWxL1Yp5vTyzJZHiBv6RvkRQq24nyArL4IPT24Vluh6A+B+aam2QWPYLCJA+Be2u/ns+3
	oPAl+/4F2jEEA7XIvlshJZmutBG3KNRfHHom1plgp4/6i9HGp3JF+JxnvayjlZRcZM1hMDw1dXo
	PIkpUmp+UyOCEGno/A+EuVHdUtWL6IWp8IqGBNSOHw=
X-Received: by 2002:a05:690e:2390:b0:64c:9ac2:2cde with SMTP id 956f58d0204a3-64dc70c7270mr8125647d50.17.1773539008053;
        Sat, 14 Mar 2026 18:43:28 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b63601sm3487340d50.18.2026.03.14.18.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 18:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 20:43:07 -0500
Message-Id: <DH2Z3MYXYLOJ.MEO58GH077PO@gmail.com>
Cc: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: media: av7110: replace C++ comments with C
 style comments in sp8870.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tomasz Unger" <tomasz.unger@yahoo.pl>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260314-sp8870-cleanup-v3-1-3ec367f13aa9.ref@yahoo.pl>
 <20260314-sp8870-cleanup-v3-1-3ec367f13aa9@yahoo.pl>
In-Reply-To: <20260314-sp8870-cleanup-v3-1-3ec367f13aa9@yahoo.pl>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55817-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[yahoo.pl,kernel.org,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,yahoo.pl:email]
X-Rspamd-Queue-Id: 3310528FC5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat Mar 14, 2026 at 2:47 AM CDT, Tomasz Unger wrote:
> Replace C++ style comments (//) with C style comments (/* */) in
> sp8870.c to conform to the kernel coding style.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET

