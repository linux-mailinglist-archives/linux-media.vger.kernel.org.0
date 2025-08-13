Return-Path: <linux-media+bounces-39845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A66DB255FA
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 23:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C488D1C80ACE
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699B82EF67D;
	Wed, 13 Aug 2025 21:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="fIkFVMJ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72027FD46;
	Wed, 13 Aug 2025 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121929; cv=none; b=RWehvVslo21yvecbKbXKrG+2vZXYrhKq43cVV6N/XNvRB/P9jbC0fNHG+H7DcwQvZH/sI4CHaqcBbfYuKpwcuzATHJeA7eRHVtQmrDKuC4UbjAA0Aiwb4KyJpBvFf+VLC5if+liV7Pz94f6YIEVR1yV6/YisVvxvepMhXtKxHI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121929; c=relaxed/simple;
	bh=lIXowxk5a4rIlaGg+DnQioP9zBqh1RxBJ57rQxy097w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NPFi5zzxzJx9MqMPLny5wFXXl6VSuV49gFU9JpdbvflFvjdPOWJbw+d+f0VRucAbZBV/ThyoWYIA44XZZi0uwExeHErB9EhYpLURDPxo/8Qy9M6ZcChD9I60/fWsqgHrus+l1q9kdhuOS1NXGGBnyoGj2gMg4n9Gl+FHJTDxnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=fIkFVMJ2; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1755121917; x=1755381117;
	bh=lIXowxk5a4rIlaGg+DnQioP9zBqh1RxBJ57rQxy097w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fIkFVMJ2UcnMoRyUjMgeltmms3WgHaTwbysE16lB9pYAIOBEf6HAPVmpineGBdeoR
	 UPCb56XXc3wapuyUwQSePFKdala1Dyw/6bE3OGQXfdKC3z6HgZ13cIHWPZPoQ36Cd/
	 B/bm/gsK3HgdapcTt8wzvM0UEvi/n2W0Wb+82hvY1h/IzVYue1NBJlRKKT7yHQ1weW
	 RK8aWLiZNWH35vGsz2ZB+/PiRfbg0+o66gfJdoDFYfKNlYp+dTgqcpDmIYfOiRjqOU
	 8XblRALuJthMb1Ljyz+5/ISpYe2sYV37b504ELPEshUY2tnatCG3qIgqlmlR75wyZ7
	 2dDZ7cUcmybvg==
Date: Wed, 13 Aug 2025 21:51:51 +0000
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>, Vedang Nagar <quic_vnagar@quicinc.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>, Wangao Wang <quic_wangaow@quicinc.com>
Subject: Re: [PATCH v2 05/24] media: iris: Allow substate transition to load resources during output streaming
Message-ID: <24714b00-cc15-4c9b-b0d4-8c76d702fcc2@nxsw.ie>
In-Reply-To: <20250813-iris-video-encoder-v2-5-c725ff673078@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com> <20250813-iris-video-encoder-v2-5-c725ff673078@quicinc.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 675e31fb8d21994fa34a6f3cd1de48b3e17addfc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13/08/2025 10:37, Dikshita Agarwal wrote:
> However, now after removing that restriction, the instance state can be
> OUTPUT_STREAMING when firmware start is triggered and substate needs to
> be moved to LOAD_RESOURCES.
>=20
> Fixes: 547f7b8c5090 ("media: iris: add check to allow sub states transiti=
ons")

If a restriction has been removed, has that restriction been marked as a=20
Fixes: ?

If not then we can't actually backport this fix as the dependency - the=20
restriction removal has not been marked for backport.

Please evaluate if the necessary change you have stipulated here has=20
been marked for backport with Fixes: and if so mention the appropriate=20
commit SHA in your commit log.

If you are referring to the commit immediately preceding this patch "Fix=20
buffer count reporting in internal buffer check" then again you should=20
mention that in the log so _which_ dependency you mean is clear.

If I were trying to follow this series on some kind of -stable kernel, I=20
don't think this commit log would reasonably tell me which depends I=20
need as an antecedent.

---
bod


