Return-Path: <linux-media+bounces-4323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 016B983FF00
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 08:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B8B1C21198
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 07:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7338C4E1DA;
	Mon, 29 Jan 2024 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImQLcFtO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1951031
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706513443; cv=none; b=tG2OFFXPGDRNHDOGWv3lKlveta+ukL1qlMy4GspFZMBx2Oq9EvAPZm9zsT4DvMa84sW/Ohx0vkSsFX4UzILbWUGggsCKHK/4l9Vn0CE6tLjbLCTWT3LCj0XXBGCp9BfyQcpI1+++vNWPux/1ncGhQiuSZTTr0hC/r/4RYDnJ4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706513443; c=relaxed/simple;
	bh=myKGyF5dySNELtpYchjq4ejFrXrxUD6q1pjjG/Yfpcs=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=hDuyTwQ9Hsqugn7iLJptKx2Xaa8C3OS211c3hjS8kef9Q03GYHWX0oPfKs7312HXYMOUcIkBbXh9R+JG47j5Xu5lww9a2kZvc2AqQ4a9TgiBkV0Bn+qniYLv4Qzm/K86TgwYrWvC6BXhTOBfJpAncr9pPYchjdmCuh5zzT6OgTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImQLcFtO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5101f2dfdadso4196388e87.2
        for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 23:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706513440; x=1707118240; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myKGyF5dySNELtpYchjq4ejFrXrxUD6q1pjjG/Yfpcs=;
        b=ImQLcFtODAIt3GYPSaGoy5cz9IaG1/5nG8HGy/vXzkSQgpjrlSws1jHCNs64LpLMMa
         gA/yD9Jf8vepGsNxoG4ZA6T880pZYmZ/y2MXjK2EegOdNKZahh7TvFo/vdUdh3uB57L9
         T1JZXxKna+WKBOEexCnY6QQeZG3ZC2Uy7fyOH1poo5BACrm8jCWpS2ni4WBF4jd2MCsQ
         zeAyCsJDuP3WS5PtAO3LVcfrAHweOzwfXa2/i98tm5J+MeQhidqj4/D2igISaE5vcW0O
         Wa9y5RuhsDyDLy29mmMInsPXlDK8nUKjkTO07Fg8yeLIa9+gaqhSPAQzERMMrQrhHzGc
         ngpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706513440; x=1707118240;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=myKGyF5dySNELtpYchjq4ejFrXrxUD6q1pjjG/Yfpcs=;
        b=Y9NMF1v2CYpFRKeX+LoISMTWxnTHkOi6+NeKBzgjSarD2591iQ0H3FRVrzaafKMu2b
         Q8hwg0XcLiIPJxS5xaWxKQcaJm8Bby0hZsi2hiYKExWVK0Q//McmTsyhohsyMEyt1r9h
         SwdMr82tPRytWqAyv9c4qzHz01iBmbv7/DvxkMQtVn8J1SGmh7++9rvZZsQROc9VRvDP
         wHPzz3DUsRopZZFVDSKk4GtstP9jV2Q34BCrzTzNld8sXrrC4QX6z5RaVtkBbtCkguwU
         /z89owR/ScaoTxDhsSGzUu4/Hz8vKSizLA81YDjzo8uO45wLZSllyCkeyIICQHUq2ASl
         w9Qg==
X-Gm-Message-State: AOJu0YwkEDPRhihw18NyKyiw5ZlA53w6qMIYyf8e/xS07TMMBGtHQB0D
	Y1BIY6rgTDRx78uhTePLe4cM9tPbLTXYv52sWiplnRkIreW3olofTQvBp4CZzZg=
X-Google-Smtp-Source: AGHT+IGPFPUpkcfh9gS9OWiiHrvyWZjRug8zXx2PI3aj0Lsar9nnr7Gu860QSCAktHmEYZ4hL82+Sw==
X-Received: by 2002:a05:6512:3046:b0:50e:e668:767b with SMTP id b6-20020a056512304600b0050ee668767bmr3336363lfb.5.1706513440048;
        Sun, 28 Jan 2024 23:30:40 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id ay17-20020a05600c1e1100b0040ec7a6d39esm13074697wmb.16.2024.01.28.23.30.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Jan 2024 23:30:39 -0800 (PST)
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
Subject: RESEND: RFC: dtv-scan-tables: plans to upstream changes from
 Tvheadend.org
Message-Id: <3880598D-563D-4A40-A7E4-0AE9C655443F@gmail.com>
Date: Mon, 29 Jan 2024 11:30:26 +0400
Cc: linux-media@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
X-Mailer: Apple Mail (2.3774.200.91.1.1)

Resending due to no response since 12th Jan:

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



