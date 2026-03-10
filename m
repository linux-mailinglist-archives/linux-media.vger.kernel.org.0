Return-Path: <linux-media+bounces-55155-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOi7InEfsGmCgAIAu9opvQ
	(envelope-from <linux-media+bounces-55155-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:41:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED85B2509C0
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 074A233687AC
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 13:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7993C5DDB;
	Tue, 10 Mar 2026 12:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hy/lnYq8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B63B47E2
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145714; cv=pass; b=c7YgMEltPZcvLGS7IUrJ6fEbbVV/rMSUMLZoigoODBou3mw4AGtFmgXHL3A/IrLUR+cxXDs/3YHcwB8Mf/nxWwbhVv8XzfsIlSwL3D6lfK7/bsDAfSTrMybw8MCNNDWODU3M1aA/xYCdOVGQU7sO8OpFwDi5sl3mp71piTmad0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145714; c=relaxed/simple;
	bh=Dh2txzJtipbH29/fAPCR6ZkGmUH4iYcJegcv0MEz4UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=qMG1yaW7vIgx0L4GSwnJ0ECSMK2vja5iJsv4hWzKKSM+pGbzSa8v8X3WD5wLlSpE8PCj/d/ed7Gq7LhtI0BmilI4MH6TWTKvG7aO+wuNT8vk6sYO5WCLJe5VRr9HsGyF/UWFUCvMMymW8nWfgsBSf8lrX1PaFUacd0v4LNPkzZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hy/lnYq8; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-128b9b7e3edso487127c88.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 05:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773145710; cv=none;
        d=google.com; s=arc-20240605;
        b=X7JEcnsa+dlBcBK4qRWMl4aJV0RTtyfxat13OwbRhfm4cpjpk1r3z+agRfQEjyfWuR
         6/gKGhNUwj/I1ayM2SA4jzN0W7Wr7lqjj/jVFiG1A4BDLo3guQX+11ACY8ex3CbN2yJk
         l94gMSxoPcxGIXTNA6dbF2ZfBAox1I9yay5GcJLL1G12Vj4vagYTzEwWdOpa+Bz5UzhQ
         obrk+h9wApsaaTO0IM+OPt+JTeLeGbIwq0AeWF5QXVdAn//2JmWZXWd4mJ6Sasw36698
         LiGZEK5DW/l71gVZJYBjxJkBkmZ/gxTaA61TE96aM5Xa+K/z4H3xu0OWc2Re63+pxedq
         5SJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Yzh77/j5ISEB79JePy6lmFNfdGStY3Ny9G1u510Smc=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=S61Joe/daoQfePhsmEFFkfGWt8sr0oRriAJu60g0BQhV2hbxDA/i+oHLSFRM6L8+ho
         YJoxRUPR48XK5DTHzUPzLX11YnKnKvg7W5bq4XtuZHZyNnAXcfd08tsyj9BXNxwN6Hbw
         8qft+FlITDJehgVJx0xniFZsS3pjPwhjKAN3RtcCUhRDsJ4ls2WWijmG4X0gKz1QbP+C
         AXNYS3g36umGJHWPX12jgjR35SXqukcpyIzlyd/oDojYJcWdMPo6JE/SBfECQiYpZ9KB
         4XVx+Nxa85Xzt61cEuB63ef6rftVAaaEwRmWMkUUmJ6FkEKUWOcYWVVbRhyUD3yh+WVp
         mpBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773145710; x=1773750510; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Yzh77/j5ISEB79JePy6lmFNfdGStY3Ny9G1u510Smc=;
        b=hy/lnYq8OKpGtS/uIQ6yZvW7rc6vXZYILsO9eM5XXGK4rvjx4mdz6u6A1oPKZC9xfP
         f8jVMuJbiEwpKCPD+fTYbikwffkX3jGuhbX8F/m1wK7WuoOmVtKoIAz3KAGreNOaIA8l
         n8+tqu+W/VurYFGoZdj4xFMrSaOQsAQ60S0SFG/mKM8VpF9VZ0xZRXvukUbC7rEYbFS2
         3Pc6JoQPSfYWcupMbz+duHEBAjk6C3Cz5X2ZOYkViGnuWnA0GZXsZoB2HzA6xQzg6UY+
         AK0dQDUiXZegaXiJ8Jz2LZLPo4HqSwzgCkZgSaQdF2anlrqiAmkiucp7kNDLxp8DAMB1
         QgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145710; x=1773750510;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Yzh77/j5ISEB79JePy6lmFNfdGStY3Ny9G1u510Smc=;
        b=Y+iRmD21Lv1eoaTFlBowe9IrqjusYmTmleJBGY9tjJ8PBlwDXMs0/7kTeK3pCFt3fl
         MDKL+bViy63TgOzT0byP9qm13buZZnoH3395n7LkhMkTrz8Agq2MQWm/l96h8NxpdAyo
         7oeJKOXCSxeeNxSXK9zgY3EjfrTPZftWWs7n9HIAIYj+33+G4KJ7Lr1aFO5YMkXPYh7k
         j6NjfRqZGvjK8U3LI4/3Qrn4qGMWMZ9x0wR+zkjeoKm1/yWPbsrWjGWLfiiBTNNVymZF
         sRPd9yY32o13YnqRICS1eZVEEOCH7q6fXXix0MN80dUGKYzXutzGFe+DzaTUEyqX9HDZ
         rL6g==
X-Gm-Message-State: AOJu0Yzs6SUpJ/aicsGWI4iMEQkA45tK/XJYHNNnaGXjVS4b0/Kp3nYQ
	ZK1f3zlht5f79Ugnl57XpTyEhKOvDJ3lUX/rYop+EAgiZiQ+eWNqQEysw6v0h/6Rd7VJI86ghle
	cosST279mYgOmX9uGND1dQZGz/XyfhuqKg806JbFE4qlt
X-Gm-Gg: ATEYQzypiwm15ZbErkMudOaCn/aLol7UR0vAQJHk/75LcUGamHaoabUwfJ8FxxBFUyH
	cL29o0rYDo07IzPbVwa4wLzpFYLtOD1WXPmJmQqHxCHkNyZyAnwELpV85seMQ7JOuLZEr9P1wDO
	7NFzV1aH2f/Yr6KZYR8G2VZGPAnY6U6qufy5hdlBzD4/ON+WrThgCCYnxNRJ7GrEdMkgUU+Kcaq
	Ldbgmb3nirnTn/WfhdMToyYJEjxpz4ss2xs+VRAGE4llXZqdfU8G6wSvPL8GCcu4PFd494gCv1N
	q8SBn4wVX2wojKZ/0CD5EXwFPI5OFMyNghGdqT7t
X-Received: by 2002:a05:7022:313:b0:128:d24a:a5c1 with SMTP id
 a92af1059eb24-128d24aa95dmr4388310c88.28.1773145710407; Tue, 10 Mar 2026
 05:28:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOKSTBu_aCODd_AxkBuA=sU=SJhCfVR7-FXo3tfOLS9Y=+1WHQ@mail.gmail.com>
In-Reply-To: <CAOKSTBu_aCODd_AxkBuA=sU=SJhCfVR7-FXo3tfOLS9Y=+1WHQ@mail.gmail.com>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Tue, 10 Mar 2026 09:27:51 -0300
X-Gm-Features: AaiRm53hS5EqGCR2EYm-QkIioJnH4AFPyi-Hm3YGHefVGkTDc3GcpLjta_XO6Gk
Message-ID: <CAOKSTBv0C7iWw4v849FBA5BONQqJzH-q2qj107HAEdnqKFtJfQ@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1, rc2 or rc3...
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: ED85B2509C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55155-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gilbertonunes32@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ubuntu.com:url]
X-Rspamd-Action: no action

Is this something?

amdgpu 0000:04:00.0: [drm] Failed to setup vendor infoframe on
connector HDMI-A-1: -22

---


Gilberto Nunes Ferreira




---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em seg., 9 de mar. de 2026 =C3=A0s 13:01, Gilberto Ferreira
<gilberto.nunes32@gmail.com> escreveu:
>
> Hi there!
> I have compiled both RC1, RC2 and Rc3, for kernel 7 and after booting
> with it, no HDMI sound at all.
>
> This my laptop:
>
> Operating System: Kubuntu 26.04
> KDE Plasma Version: 6.6.2
> KDE Frameworks Version: 6.23.0
> Qt Version: 6.10.2
> Kernel Version: 6.19.6-x64v3-xanmod1 (64-bit)
> Graphics Platform: X11
> Processors: 12 =C3=97 AMD Ryzen 5 5625U with Radeon Graphics
> Memory: 64 GiB of RAM (46.9 GiB usable)
> Graphics Processor: AMD Radeon Graphics
> Manufacturer: Positivo Bahia - VAIO
> Product Name: VJFE69F11X-B0411H
>
> With kernel 6.19, even the RC's works perfectly fine. This is how I
> compiled the kernel:
>
> git clone from Linus github cd linux make mrproper cp
> /boot/config-$(uname -r) .config fakeroot make -j$(nproc) deb-pkg
>
> I also downloaded the mainline kernel from here:
> https://kernel.ubuntu.com/mainline/v7.0-rc3/
>
> I already tried 3 different Linux distros:
>
>     Debian Forky
>     Kubuntu 26.04
>     ArchLinux
>
> Same result...
>
> So I wonder if anybody else has the same issue.
>
> Thanks
>
> ---
>
> Gilberto Nunes Ferreira

