Return-Path: <linux-media+bounces-23052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D779EAFA8
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 12:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D35C188CE48
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 11:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DA9223E64;
	Tue, 10 Dec 2024 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isu9D0AC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21322080FF
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733829253; cv=none; b=OMTn2AF0jKlAl3/sfzCgmOrpmvRR2cFC8HIIIEYEl1sbThFAEOIAD2/QvqSSpBi8nH2cuXwnL6DW+W3DXnsLPKOI8/vJjoMbMZrcl1YAqXmj7Y3duZAzjzbZrUhg524CfxqvNhaJEXc7MUz56K7moGAMs21IMPRG6Ndo1K/vGwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733829253; c=relaxed/simple;
	bh=ehUFPkHVtmr6XIPoI2zGBp46d9MatiV5mBNDRryzEv0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jp4XakAiznutN1EQnvf/epdxa01XnX51ZyFkrmYAtY0YBshARDl2QJqGLGn/nDHtTzxpatY9sdAFx8gr/hciWfffeGmHp62OTEiTCTfY39QzWmmJ1VSwiRucY2ElDddXexGD9sPcUvaUa2ofQTzev7XxlZGslWG5Dfq4jThDsHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isu9D0AC; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so4778865a91.3
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 03:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733829251; x=1734434051; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ehUFPkHVtmr6XIPoI2zGBp46d9MatiV5mBNDRryzEv0=;
        b=isu9D0ACbXm1STppOCvfuwzSVlStu8ZrA/kkTW6ME4zvmb8gUlxpI/3V/jrsAKTzK3
         CQRvgKrGFO/rC3+mc4A7HBU/yUuVJ5C2cVrrIIGljolJQITVRjBaPXgQoBuNHIi/EBbs
         6t3R9ncEy24b+HckxSNe1dviJw6wbQEMx5zvcAHMklQyQyOez5/R/nYebglwnqEx4CRq
         kefxwttWFI3uKqMgB3BNlJiQnTaVcN+itLi0y4gCeFQwcfQFbT68tAsR4dNP9GGGysIY
         VB0060qF3NPzDvfgLHmgVVgDza8Ps9Bz4sy/UofckvdNt0yugBdx50Mxsnppgq2TGa6+
         pxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733829251; x=1734434051;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehUFPkHVtmr6XIPoI2zGBp46d9MatiV5mBNDRryzEv0=;
        b=SPdWRlyiHszl3vOi9+tEELjstJwsggfr0u3jl58RzuVzWYP4fo0ynNtbjGfE5ZQ/R+
         zs6DT5A37cTIXRgTWwla+Jw0Gqovzdvp8XDXL3FtBk31viQtuiCe9VxjkikMrZj/Bxc4
         SpAy1F+cTC4V44l7kINN0Wwxsj2OrvJj5qjspeVGOg3PYShxjIg7CbOtCVVTPtEUAZZ4
         QyvUltTulSOEDKccQNbwwZEL4Di2wgOx2SdTktqxyY4DsXu4Ur4v0kS3xNQ7K5Ma5eCH
         oKsFKGRvNCKrVokExMMmz0bWzy2/fAQnuas75tMgPIGVQkk2NkrQ7/T1uWWtOYriZSR+
         h8OA==
X-Gm-Message-State: AOJu0YyV/sPuwGyU+JwneaoK50DnoSVB+yKKlLZgR3K9pH1OsA8e0Wem
	aqaJ/k4r3d7kbhocmDJUlQ3+YTXZ1RHoDSPBFHZx3p2K/bWiv5WtLVjGJTgEyE8LRhZK3yHulYW
	isX12W8P+pAc5Eb/TJj0Dtz9rh0+PBdRbY3s=
X-Gm-Gg: ASbGnct8X/X+RCDKhx5r4uct7iuVnqNRcC4CA8VaD9r54BoGcks1QvUyXCGYwncsXag
	q+JAW0+gHBzEliqPqOilO3oMUUy2ew1iFr0s=
X-Google-Smtp-Source: AGHT+IEuKjnry4AuscVLnPXcoFkx76LS0kwzCF+YCM1Kvz8M4hnd4zRORTtAYH4DUH7jWq0IqZ0j3yrlRjYLVwMUssg=
X-Received: by 2002:a17:90b:4d04:b0:2ee:3cc1:793e with SMTP id
 98e67ed59e1d1-2efcf2c4bb2mr5869819a91.32.1733829250995; Tue, 10 Dec 2024
 03:14:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: PN888 <pierluigimichetti1@gmail.com>
Date: Tue, 10 Dec 2024 12:14:03 +0100
Message-ID: <CAGmoHRj5gz8Wajsjy73XriLysToBR1sNZX+a+-ygrVEWw9ZgjQ@mail.gmail.com>
Subject: Allegro Video IP VCU Info
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello.
it is possible to find also any example of utilization of the the
driver and how to initialize hardware and encode something for the
hardware in the object?

It is possible to find documentation or notes where you have
documented registers and operation of this hardware? A lot of things
are poorly or not at all documented on official documentation.

Pierluigi

