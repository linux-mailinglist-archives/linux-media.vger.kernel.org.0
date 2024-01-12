Return-Path: <linux-media+bounces-3650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0818782C141
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 15:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16AA41C23895
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 14:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EB06D1C3;
	Fri, 12 Jan 2024 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCp6TBMJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B856D1BB
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3366e78d872so6727313f8f.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 06:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705068000; x=1705672800; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEKXI1gBRWUXr2GLVbf0JDQ1eNTIpqdjRr3cQAOU9/s=;
        b=mCp6TBMJ7B4Faif+YOtI6a6ZTePIVjd0InUWtlERQeLyRpqkN5/l1ISvLlCIbj1T0J
         j7xGoam5AnCcPldSgTOYEf3FE1iDF/KgUUQOK8Lsfe16AtJEKp5KNfBGmcpXsZfpkG2X
         YK8wfxlgm08wxR454IHejctGBOlDChTV69w4PINftW+F83COeqkWShy/P0M8b4LERjcd
         OP2H4TK1y2swaJ080xRRv0fiOaN8z7hYByOdFMjqnEAZkAL4fAd2TlXnb0Aor+TWOIT+
         GGcvcRrTAGFCjEQq44EtX23CCM2tYvOS/iQIZmf67Nm/xAE/TAv+lMy4X2fRB9QObNua
         qI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705068000; x=1705672800;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEKXI1gBRWUXr2GLVbf0JDQ1eNTIpqdjRr3cQAOU9/s=;
        b=xN/8ET4PTJWRfGlCI0DBdPoy0y4XqbDY/YjW4OuJlI8FCp2AHXM5f9ZYDu7Fjr/LCx
         mrXOfHuL6dFGAIdaeWpWOmsDsWtBnlQwNysWDn9/xTTNKn0zotkZwwsdST8F06YyPLmZ
         AdnxRwbcRDRldU0wKKdXlvMQIy3qYE+j7lovYvnudSMkp+l1VoOFjZAgxBs+xFqzUtSD
         powxYKx/dBh7nr0V0mLHxevEe1WhOV3i5iI+rs5jgkk8/OPuP6DrHA6T1gNgmBUZUzCO
         7+PV3XOhIwhOQsfxsLRBjWF6jtB5FLg0P2B/p9PIZDK8mObk8Yz/ApIX1jr7UvzYRMXS
         Mlww==
X-Gm-Message-State: AOJu0Ywu8GHj1Pyydv3Miwni0kvsDFdz8qI2RTYSeMwpySGLNM+mpOf+
	kJqhAV/T7GLRU/rlX+YnmRIjABt4USIMtA==
X-Google-Smtp-Source: AGHT+IGybUF6+JPMz5GcCG8A9lnCxidQXx9bnNCSXYEWqluXkfNg2MDTHaFOeEunisWA/mH3KQNfUg==
X-Received: by 2002:adf:f74a:0:b0:333:2eef:d76f with SMTP id z10-20020adff74a000000b003332eefd76fmr350632wrp.45.1705067999344;
        Fri, 12 Jan 2024 05:59:59 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id l26-20020adfa39a000000b00336f8b2f60fsm3984859wrb.8.2024.01.12.05.59.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jan 2024 05:59:58 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: RFC: dtv-scan-tables: plans to upstream changes from Tvheadend.org
Message-Id: <B9E41908-10FB-4993-8DB7-353AA02C32CD@gmail.com>
Date: Fri, 12 Jan 2024 17:59:46 +0400
Cc: linux-media@vger.kernel.org
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)

Hello Mauro,

The Tvheadend project bundles dtv-scan-tables in our deb/rpm packages. =
We have
our own repo for them; an unmaintained fork of someone else=E2=80=99s =
unmaintained fork
of the upstream linuxtv repo =
https://git.linuxtv.org/dtv-scan-tables.git.

To improve things for everyone we are planning to retool around the =
linuxtv.org
repo and would like to sync/upstream the differences to you. The current =
diff
can be seen here:=20

https://github.com/chewitt/dtv-scan-tables/compare/master...tvheadend

The main challenges are, a) scrappy descriptions, b) contributor =
real-names and
email are missing from most of them, c) multiple contributors to the =
same files
over time.

I was thinking to send a series with one patch for each country-code to =
reduce
the number of patches to review, with links to original pull-requests in =
patch
descriptions to provide attribution to original changes, and any other =
info
like URLs added to files as comments if the links still work.

Moving forwards we plan to add a PR template to our GitHub repo that =
encourages
patches to be sent directly to the linux-media list; or for contributors =
to
provide us with real-name/email for attribution so we can upstream =
patches on
their behalf, or remain anonymous but give permission for patches to be =
sent
under Tvheadend attribution (likely as myself).

Would my per-country-code patch suggestion work for you? or how would =
you like
us to handle the changes?

Regards, Christian
chewitt@tvheadend.org

NB: The pending patch from Simon Liddicott [0] reduces the diff. Could =
that be
merged soon?

[0] =
https://patchwork.linuxtv.org/project/linux-media/patch/20230216010528.592=
1-1-simon@liddicott.com/



