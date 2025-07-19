Return-Path: <linux-media+bounces-38110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF8EB0B052
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 15:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61789567E96
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 13:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C592874F5;
	Sat, 19 Jul 2025 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="DxvlwYzl"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF05B3BB48;
	Sat, 19 Jul 2025 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752933032; cv=none; b=KOwSqZajHn86wTfWumPLm78Ml+sMlgWE6dMeOICRr9iwdS4ZD+QOqlbQXUUvYsJtrtryDfFX5MIJib6LmcPlgWorbK81S55SJvGmN8Kt5w8VWafum5O/x/mEHnT1rl48aPk4bhMwmh2sHwFwsLZUg8/hmaLnC6Le1HICxVN4EjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752933032; c=relaxed/simple;
	bh=SwUUrxaMnyIdGzp3KSED5lNMvexp89Hf4cOvyaRBiUs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=d7OA5CiJBoXRQiAriCrAuPvyqzFBd5oilWSvmDEYEjQSa720KZecSQCKLab0WEJm2olMmc80EN40ulr1rhY0AgMpUoJAfum0GjV0MbiW4unpkJaXLVOtNvvs4rB6iGKN92xsfu7LTyMC/ouMZmR7DgoqxdXbglZpmnV6M1HSDTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=DxvlwYzl; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752933022; x=1753537822; i=markus.elfring@web.de;
	bh=SwUUrxaMnyIdGzp3KSED5lNMvexp89Hf4cOvyaRBiUs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DxvlwYzlDbmOsN4aU2e1wkfx2Fya4yKu/A7H6anJBjCKgGyFlTKEPc5hScN1DF8q
	 hs7MlqLoibOSAoFtzBvSSSdQQf/gbYOe8k7fU15Oxj3hvG9gp/I55zVkESBna6z77
	 L4YuGKl8uO22Hq/rNaIKeqg3nKseF6e750Y6Ebl83TuwqR7Wkp/jT6LAh6+3SjrXI
	 uDx5DDosSpmNsBi1pKUgL4a6hE11Pb1L0iY4Tw5aee3TRUbuem6Kl0dEP2Kpbe5Sl
	 vjTAZAYZtKZZOWyKL5uZtQbOuPhruZgI10aZv8Ku+TcJ+gkoZ2sSGygBJOGmzstyU
	 FBUbTzae0j3W+mks1g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.241]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MEUWM-1uNASC18o6-002XW8; Sat, 19
 Jul 2025 15:50:22 +0200
Message-ID: <fbe09fd7-c73e-4bb5-ace0-ec5eefad0765@web.de>
Date: Sat, 19 Jul 2025 15:50:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Darshan Rathod <darshanrathod475@gmail.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250718125245.82910-1-darshanrathod475@gmail.com>
Subject: Re: [PATCH] media: b2c2: flexcop-eeprom: Fix assignment in if
 condition
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250718125245.82910-1-darshanrathod475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hYfr12ZKq+2Dbq7xQi2+zyahAGI/wRLqrj/GvgDawDFlLljkicH
 BSjn+4ZnWKTXoZ8keHQ4nJKLbANKWgYPVa/9VHMdBzcS+UAtVO73S/kYAuLz2DeXJH+aS8/
 pJIw4JfzSlCGyOOmNFRHdPzCn7Rx3921BZoOvpofsrxd5HNbucGtc0QzzKdS05S7aUlGDG+
 ceK6rvwJP5ti8AO9aMGUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8v7pKZtokYI=;qgAxQ4LyNn5YcnSYuneXxfgpFO7
 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
 sCZtksGxGjYhmPi+YAf97MYoi0

> Function flexcop_eeprom_check_mac_addr() contains an
> assignment in an 'if' condition. This coding style is not
> accepted in the Linux kernel as it can conceal bugs.
=E2=80=A6

You may occasionally put more than 60 characters into text lines
of such a change description.


> Also, correct a few off-by-one spaces in a function call and
> variable declaration.

Please split possible changes into separate update steps.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16-rc6#n81

Regards,
Markus

