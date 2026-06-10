Return-Path: <linux-media+bounces-64407-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vE4oKa1DKWoVTQMAu9opvQ
	(envelope-from <linux-media+bounces-64407-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:59:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 178AD668832
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:59:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iCZe9cpj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64407-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64407-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 893AC3230784
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC043DCD85;
	Wed, 10 Jun 2026 10:43:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD203FC5AD
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 10:43:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088208; cv=none; b=hNJNUPTc4+iU7aRBTB5N/7i57ykmUuMQjtBguPDp23C0J8ucAx5pIgDJFS45vEcEpUkDnrXKEhsUx9ViCfP6tjNKrRGBf0KhYhixDm4Sq13U8/MSx4gEdksNv9zm3D/WlaD6tw0hVmXbt5UkrgJ2m0aY9W54annluHBmtVPwh/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088208; c=relaxed/simple;
	bh=k6kFMwUAdF2B+R0Fmb8DBKqbHpaYQzNnuqU/VJxgx1k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=B0MvIDkCRpXmdG6QUgC3t50Auvy2faAUB/CPJYN/elhexlMRDiM03PlK5v0cc27de828rKrz6ZOqdB/AZcyv7lzpjU8ufvIyUv5tjKSjOQObioKS5EZCFa6QtKVfyJIgDzEs3lU6OxN9j0t4FpRelqx4s5fAlLtP7fP2t2zxOcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCZe9cpj; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-692491fec0bso3080906a12.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781088205; x=1781693005; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVbrD2t2ulKBTgQFMKkzp21clFhntPxcEbJMRFx6ZO8=;
        b=iCZe9cpjNJDJ/jA9sFLTrYpYL48RVG1ssEe3kykGVsLLu2rjt/Uzhwa/UAhMh1iPD2
         r9sWBedt1XMdQY8Tyn+xtQj2P9wpeahtUiTxkev+H6+MgWNTqRlhQRN7cXKLKtN30Ews
         Bes1+4mCp5BtmASNpuckTKck33pcdMM35tR906L0OWKh+6D918CAd3Ayvp8ksKIDjqxL
         iOsQguFUIucFqITcYc1ocy1J8dVwbDRX0CDo806+j7wdIfqsqyi/3aby7wRSOw3oUVty
         UQ6ibYC67SJhD75N/HPVDUENiSZfRN/0tJ1MNlDlQZz4JZhTcTqyXRLRE9o9Fzg+ki3G
         SmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781088205; x=1781693005;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVbrD2t2ulKBTgQFMKkzp21clFhntPxcEbJMRFx6ZO8=;
        b=oa4iiZEpy7z8aVRhP/8H3BKyy/RFWatDq5ithKsfrv/58SAOcq6tyQRAyDW4GGUdIz
         OCjTEAHKXfolyK6QWccA73U56Pse5AyfFe+7XUiKUZLEFw4PQgiQ5zhL73qyQr+55Zr1
         bfwrCGMh6WX5fAvdbRgJd6W+sJK111xeqDjgtoW2tVb4GvTkES513jofu6tDKZUxtinM
         zEQjWw3uV0fNGRmwhdvTCiNeHECRbE4Y3ojjV0ewpt83HplX3vhLsuB02fGCKghGidKi
         sxSwk4fimVaCN8KFw1zPs+DXiFu58HPWx4jOdDCEv8sAY7uBh64T6R8emc3wDsg7G7c8
         /MXA==
X-Gm-Message-State: AOJu0YwjNUapWw2lozkfuRv82HV0G8Y+ajGlYhZxl1pWzFvLAWrYLOWT
	B3uFFfS2WTSHY1QgRXnW2HlfoPFEclaUu12a6Binw+AtKW1jfEWdM/57SOqwlg==
X-Gm-Gg: Acq92OG+qdehQyAQbAjef23D9FQvSgkoYxAfKGUan14JGKrBhIycsNNQ81lVe54Vzs4
	e9kYWrMHKEmyBmxs3IzahhpFFLjOgTwbHOqDdDJ90JbG6RcxwnYuHm8cVeES7VNJ8Bh0v+1jzhV
	jjPLSiS50wjS2lcLL3eHB1EGxvyCQofqtyIj+hTspZizfEhr6TqezPtWtdtXnPQiOlK3UU5fjB2
	NlJwmbL26Or3Aec9gS0Gj8XkUe4WzPj+YPYZcvuPjXW8iQdEH48kNNSimhJTUT/z36sA4OAVnZu
	OTxwn5vHvRQCIg0pApkq0stpsAEwjaeF35AXavZfdxKtuA7ZOHENniqmfWYy1foJMArldojgPJp
	HJzeclb2ErE5SKnm8pTcZ/yYirLeYr6Ph8LdHyEW4kiCHBZgar+pAIDYZW+CS29t4pQzH0lLV6q
	PxtYNn5bFeeRHa1B6XXoHdC7uRO5rmB2PTJ/3giOnl4qhIxAGj3/RHYP8s8TzZA3yYjRuMa7HVQ
	JnNRDFzVOJSLgxrjuiy
X-Received: by 2002:a17:906:8e15:b0:be2:208a:a8ae with SMTP id a640c23a62f3a-bf370f6ac02mr1367077866b.22.1781088205164;
        Wed, 10 Jun 2026 03:43:25 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553060dasm1178612666b.44.2026.06.10.03.43.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2026 03:43:24 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <4b3a9f32-807a-4b9e-8df2-d22f872d288e@symple.nz>
Date: Wed, 10 Jun 2026 12:43:13 +0200
Cc: linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2CB1844A-3DB7-4973-98E0-0C141DD38B45@gmail.com>
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
 <5939C396-3A70-458F-8E6B-A55319929564@gmail.com>
 <4b3a9f32-807a-4b9e-8df2-d22f872d288e@symple.nz>
To: Simon Wright <Simon@symple.nz>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64407-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:detlev.casanova@collabora.com,m:Simon@symple.nz,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[piotroniszczuk@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piotroniszczuk@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ibb.co:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 178AD668832

Simon, pls see inline

> Wiadomo=C5=9B=C4=87 napisana przez Simon Wright <Simon@symple.nz> w =
dniu 10 cze 2026, o godz. 00:14:
>=20
>=20
>    git clone https://github.com/SympleNZ/rkvdec-vdpu383-vp9
>    cd rkvdec-vdpu383-vp9
>    # against your running kernel's headers/source:
>    KBUILD_MODPOST_WARN=3D1 make -C /lib/modules/$(uname -r)/build =
M=3D$PWD/src modules
>=20
>    sudo rmmod rockchip_vdec 2>/dev/null    # unload the in-tree driver
>    sudo insmod src/rockchip-vdec.ko        # warmup is default-on, no =
params needed
>=20

Many thx for detailed hints.

I decided to go with alternative path: I incorporated Your code directly =
into in-tree on 7.1 mainline, recompiled and give test run on rock4d. =20=

I think I'm getting Your code running as in dmesg I see: =
https://gist.github.com/warpme/51bce9532baa37ccb59e1c69a5c2ef43

Unfortunately mine rk3576 h264 issues still happens (approx 5-40% =
failure rate; only on 3576; only on h264)=20
Visually issue is like this: https://ibb.co/gZT6vMZD

Interesting is: mine issue symptoms are imho similar to yours:
1. approx. 5-20% failure rate (but varies per board)
2. only on 3576
3. only on h264

Ad1: some boards have quite low rate: nanopi is few % while rock4d is =
really high (20-40%)

Ad2: i have single appliance image for >40 boards and only 3576 has this =
issue

Ad3: on 3576 issue happens only on h264. HEVC, vp9, etc are ok.=20


> (If rockchip-vdec is built into your kernel rather than a module, =
you'll need it as
> a module - or blacklisted - first. The module name may differ slightly =
on your
> build.)
>=20
> Then decode your H.264 as usual (v4l2slh264dec) and compare against =
avdec_h264 - the
> rows-4/12 corruption should be gone. That repo is the VP9 work, but =
its src/ builds
> the full VDPU381/383 H.264/H.265/VP9/AV1 driver, so H.264 is included.

Should I collect stats on mine hw or rather maybe I should test the =
solution (when we will have it)? =20

>=20
> One honest caveat for the media-player use case: the warmup fixes =
correctness (the
> wrong pixels), not throughput - and the throughput limit isn't =
specific to H.264.

Indeed - I see also issue with throughput on 3576.
Iirc 3588 can go with 300mbps samples while 3576 starts to drop on =
13...15mbps=20



