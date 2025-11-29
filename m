Return-Path: <linux-media+bounces-47894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E91AAC9371A
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 04:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B94E4E1BC1
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 03:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A53226863;
	Sat, 29 Nov 2025 03:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrv3pmRf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB851223DEC
	for <linux-media@vger.kernel.org>; Sat, 29 Nov 2025 03:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764385978; cv=none; b=FfVertusCnZhB1Kwl4qUsWg9R6ZlfFa+ubBKVyqjHDmka+UhOkHwQJGMsAFH/pnOOQrRCwwBcPsftfV3ua8OwNy3eAR/biXNTEMlOkCkifWQEFpAKpvC33C+kxtJA5iDG2Q350skNz1xUw6YBbpXONwmlTE9/qfw3x8PQTf3fcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764385978; c=relaxed/simple;
	bh=gBqvj1synVy8RMn1mCeUyNXxSszTPGrL2RT3kUA25q8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FYKhxI2UpEivpsehGK02NeDUkVKCRlYyOJDC//eVdAxn4v0XCwGrrjMbuxgCfVAum7lBRXEFYLnJyV4r0ovPrvAwg/Whh1lOgRiVw8bfG3z6rB+BQC+8zRDtoXZQbvuiI3hTPkVvuJiWXA5BHUJb3w6N/yNBWoJsy04ZmkIzapE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrv3pmRf; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso4390593a12.1
        for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 19:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764385975; x=1764990775; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7uQOgD/5jZCPoHKqIzx3j94PJzXU8RNCbb29emXOAD4=;
        b=jrv3pmRfz5UmaxehhzFxsfdxn2zx2kr3AIwNUBXLit9qpploVSD9WfaBgFxoyYEx9a
         mZ7QHniIVL+v4RY/hLxh1MpHn9cm5O3AJmdewRU5h8DrevINTJEgh3/jMtLxdFLE0nSs
         200W6TLXZ/a+ELjaVEABGWd6JW9hj+C3oyrMMryTGifSz8+xistZYfduMzNmt0cIxpQx
         Z6u3ZvmWKCCChcK02cE9ebleUy7S/tmT2WBy4/JCgrgcIqYSWkGF8UNyXH0bZArb+EiP
         aT8JUCdhEoSvrod1otb/oDmu/ZHJsPG+vZqV0w6p+s2mVXWUZjhx8LYINK4yBd21mHk9
         FRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764385975; x=1764990775;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uQOgD/5jZCPoHKqIzx3j94PJzXU8RNCbb29emXOAD4=;
        b=GoaTKceNz6qj9drEM11i8pcXxagc5u+7gG/epg56+eKTElaTQiTIv9JJulMuhbZd96
         H3OEwiI5ZQz/hOg8JwoIihlqw8T2zAOPmBroljf0L8gA+oZ6jKaNyTzZ5MlwvaSkh7mF
         ZyeKRnk7UkD08HEBFhfAzd49N5zZ3Ppzagu8/X68FQoRt05pH+SxyVGGStAXPRgjBVYV
         EUQlYEOMkxBlZA4STZXilGWkaDAy9eoMJsiP9pzjzZA2DeQ6gwtypDiYB010AcS4yJNk
         4XNym1aKaKolfJewXBN1q3hOk91P43oNTBCC9PgD+OJPMz9vpl2PeU7kw5TaIFJAU93y
         ICtw==
X-Forwarded-Encrypted: i=1; AJvYcCWCXBLCsLplvoI8c9XsEGHcAvri1WDGS4hvL/MZTNCWU7A3N2xcyCBI8M/pySOspLsnx7REMCdF37f8Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAr1Qc0hsnjSA9NIC/3bBW8xg0ISWp/0kd6YYQ4oZqYyA9fHRO
	1BTEAqSK8AUqSdShgB7FA6moounnyMuce9ZE863xVHhtzY6/DINROMyhfaNK8o9tg9tEc/ZbE4E
	3DR863imyrie/4h1bt+sBtt173Wi02IM=
X-Gm-Gg: ASbGncu4+NSRoDbnK9s3N3TOz679Pu99ciRLPxmmrpRyLNRYCIwjJLc2pIC40L/bh/x
	4x+HFPRQpgAgJZAfaIZOYEk0Mob6//QQy79ewfOMdmXIV5h9D4Nj290uFjV9N/hXMq3aUHtqPhj
	0uSbY1Zps7OQaZN7ZSGFjQqO8HILbvEoZ8cK35w4n9Mndtoj9SLbH0IXkj9UpD7Jk8YPdam2fnM
	xPkGMJNUn9J38avfcyYpoZgobifILKXhDz4bvfshkUGa85LhWsEOpC4xN6FzCKTvLaL/fMJgXgN
	Tl0f/j4=
X-Google-Smtp-Source: AGHT+IHvpzSGkBukOTWMR73+sOile9X8cv5+wm7bdrLvaMI0DYfUV6Jzjv0ZzRtXRW2Wt2uW5t78Dn1xyMQ59IizN/o=
X-Received: by 2002:a05:6402:42ca:b0:640:b373:205e with SMTP id
 4fb4d7f45d1cf-64554469ef2mr30194946a12.15.1764385975144; Fri, 28 Nov 2025
 19:12:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sashank Karri <sashank.karri@gmail.com>
Date: Fri, 28 Nov 2025 21:12:44 -0600
X-Gm-Features: AWmQ_bnaoCTkQp7Azh-ZPyPEKL2qZDcbgGWSO3CVDvhkeW9g26p4S5q-sMHQ8zs
Message-ID: <CAL3XFnZ3XatQkR2HXpyfT6BK7bCjjGcaS5LjtK0DxPfHX0Q-dg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Add AMD ISP4 driver
To: bin.du@amd.com
Cc: Dominic.Antony@amd.com, Phil.Jawich@amd.com, anson.tsao@amd.com, 
	benjamin.chan@amd.com, bryan.odonoghue@linaro.org, 
	gjorgji.rosikopulos@amd.com, hverkuil@xs4all.nl, king.li@amd.com, 
	laurent.pinchart+renesas@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mario.limonciello@amd.com, mchehab@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, pratap.nirujogi@amd.com, 
	richard.gong@amd.com, sakari.ailus@linux.intel.com, sultan@kerneltoast.com
Content-Type: text/plain; charset="UTF-8"

Dear Bin,

I apologize if this is the wrong place to ask this question and
suggest this very slight edit if I understand how ISP4 on the Ryzen AI
Max+ 300 series SoCs works.  So the ASUS Rog Flow Z13 2025 also uses
the same Strix Halo chips, albeit using the non-PRO series.  On the
Windows side, the 13MP sensor, also from Omnivision, requires an AMD
Camera Driver, something speciifcally also required by the  5.2 MP
camera on the HP ZBook Ultra G1a.  So if both MIPI-capable cameras use
the ISP4 technology on the Strix Halo SoC (do they?), this Linux ISP4
driver should apply to both cameras, right? If so, shouldn't the ACPI
ID for the 13MP sensor also be hardcoded into this code

> drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)

Adam J. Sypniewski suggested hardcoding the ACPI ID into the I2C
driver here to have the 13MP camera to work (the ASUS specific ACPI ID
for the sensor can be found here):
https://lore.kernel.org/lkml/aPeqy11m-TxwbzJV@garrus/

I'm entirely new to the Linux kernel mailing list and very unfamiliar
with webcam interfaces and how ASUS has chosen to interface the 13 MP
sensor with the system, but I can confirm that it does not work yet in
the Linux desktop, so I was wondering if the work on this new driver
is necessary to get it to work.

Sashank

