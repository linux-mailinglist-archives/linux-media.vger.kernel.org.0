Return-Path: <linux-media+bounces-19105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B9B9907E3
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 17:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78A151F250A6
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 15:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB8D2194BF;
	Fri,  4 Oct 2024 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b="BcPZEugj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rosalinux.ru (mail.rosalinux.ru [195.19.76.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE4E1C879F
	for <linux-media@vger.kernel.org>; Fri,  4 Oct 2024 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.19.76.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728056180; cv=none; b=Jk4I1f+Pdg1P7EzB49PBFlSCfu1OOf1qWtfO/KQAAJKZZc+xdnPtkZNT79V1HaqyAPPaubpVQv0mv0NVhnP4RQ2e9/602l5dzwgCx3FXvPc0iqRekgOXCe7twbLG+RSGA9s2+eoYEIMZc0txOUfIbp7ggznSrxttqx4f0T8vWTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728056180; c=relaxed/simple;
	bh=u1dbrUgKoEijCv/79xT8pOYtw4HKUB0BoPj08XruVws=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=RdiJ3sEbUn1IohKC7+xbu1xT4qCroJQCjMAjyDWCoqJaUrSkYesQU4pRRx0p1Sk/Ue5vPY0Op6GYmwPgaqLP9+XlnslfcmY3Ov2v6atJCczqhRnluIesAYhTp5X9vvGN5fdCIIuZT1BFzJRCD1SDmYycKKn05dhhygue2KFjUY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru; spf=pass smtp.mailfrom=rosalinux.ru; dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b=BcPZEugj; arc=none smtp.client-ip=195.19.76.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosalinux.ru
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 08FAFE2D87383;
	Fri,  4 Oct 2024 18:36:11 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id KOOW-H7t_rat; Fri,  4 Oct 2024 18:36:10 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id D0761E2D87380;
	Fri,  4 Oct 2024 18:36:10 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru D0761E2D87380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1728056170;
	bh=u1dbrUgKoEijCv/79xT8pOYtw4HKUB0BoPj08XruVws=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=BcPZEugjES7EVdBfHroeSXkmmRQT81RAGf+uINS9ziT6K54tdfRnaj0EyrE/DJn4W
	 8eUFMdmHxW4p5pO2vFh4n3jnTNaGHrbt5RAW1QpToL6nURT7dC+madbEbqgzahF54T
	 G/ysgUO6xRFZFhdMk45pqPTOuaeMaZS4wWHud6QGP9NG2tLlVJZE4xoOrIuX1uYoDX
	 wuZtNbBk/7vHWtSdBtqkpCKLjByMmQTD7x+bpI53Wqa4/Gm3cnCdOjYNLM30tsiIw9
	 fA5c8FscKVxcEzZJnXzSwtj900ZwrkWBvE90V6KBCu5JxJ3o1WCylmWbRAQHedUzIF
	 SjuTbmieIumFw==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id U6iXp6OXmyAY; Fri,  4 Oct 2024 18:36:10 +0300 (MSK)
Received: from mail.rosalinux.ru (mail.rosalinux.ru [195.19.76.54])
	by mail.rosalinux.ru (Postfix) with ESMTP id B0EBFE2D87383;
	Fri,  4 Oct 2024 18:36:10 +0300 (MSK)
Date: Fri, 4 Oct 2024 18:36:10 +0300 (MSK)
From: =?utf-8?B?0JzQuNGF0LDQuNC7INCb0L7QsdCw0L3QvtCy?= <m.lobanov@rosalinux.ru>
To: Linux-Media ML <linux-media@vger.kernel.org>, 
	Patchwork Integration <patchwork@media-ci.org>
Message-ID: <189134863.638526.1728056170648.JavaMail.zimbra@rosalinux.ru>
In-Reply-To: <66ffe500.5e0a0220.241d65.10a3@mx.google.com>
References: <20241004121924.27174-1-m.lobanov@rosalinux.ru> <66ffe500.5e0a0220.241d65.10a3@mx.google.com>
Subject: Re: [v2] V4L/DVB (13661): rj54n1cb0c: possible integer overflow fix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3803 (ZimbraWebClient - GC126 (Win)/8.8.12_GA_3794)
Thread-Topic: V4L/DVB (13661): rj54n1cb0c: possible integer overflow fix
Thread-Index: QOM5XcUS1OsS5nbnIMdO6ueT/CI9Wg==

I believe the bot flagged my patch incorrectly. Since the patch hasn=E2=80=
=99t been accepted upstream, it doesn=E2=80=99t make sense to include stabl=
e@vger.kernel.org. Additionally, I omitted "media" from the subject because=
 the patch I am fixing does not have it in its title.

Please let me know if further clarification is needed.

Best regards,
Mikhail Lobanov

----- =D0=98=D1=81=D1=85=D0=BE=D0=B4=D0=BD=D0=BE=D0=B5 =D1=81=D0=BE=D0=BE=
=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B5 -----
=D0=9E=D1=82: "Patchwork Integration" <patchwork@media-ci.org>
=D0=9A=D0=BE=D0=BC=D1=83: "=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB =D0=9B=D0=
=BE=D0=B1=D0=B0=D0=BD=D0=BE=D0=B2" <m.lobanov@rosalinux.ru>
=D0=9E=D1=82=D0=BF=D1=80=D0=B0=D0=B2=D0=BB=D0=B5=D0=BD=D0=BD=D1=8B=D0=B5: =
=D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0, 4 =D0=9E=D0=BA=D1=82=D1=8F=D0=
=B1=D1=80=D1=8C 2024 =D0=B3 15:52:16
=D0=A2=D0=B5=D0=BC=D0=B0: re: [v2] V4L/DVB (13661): rj54n1cb0c: possible in=
teger overflow fix

Dear Mikhail Lobanov:

The unreliable Media-CI system has found some issues with your series.
Check the report at: https://linux-media.pages.freedesktop.org/-/users/patc=
hwork/-/jobs/64664035/artifacts/report.htm

Please fix your series, and upload a new version. If you have a patchwork
account, do not forget to mark the current series as Superseded.

If you believe that the CI is wrong, kindly reply-all to this email.

Best regards!

