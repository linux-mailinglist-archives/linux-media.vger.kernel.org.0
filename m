Return-Path: <linux-media+bounces-58873-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKHSKlC54GmIlAAAu9opvQ
	(envelope-from <linux-media+bounces-58873-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:26:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B011540CE62
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78663300BC98
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AC43932C0;
	Thu, 16 Apr 2026 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf+811/E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C20313558
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335179; cv=pass; b=n9By9fiINQ/lLp4bUOhg3GSo1EbhCuZaFUnuNkZj6WWeuY5urBCCDZOjUEXDDkVn3GbngTqkUVvU+MqLrJVyfCetbop02sKCS209B6gvWndu8/b9YIbmJPOsXmYTznK2u567O1YNdije9qCPETl29CwFpYFL2zaIktqL8O8J+rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335179; c=relaxed/simple;
	bh=7BkwtlCxZH3OkHAUtqEEeyLKQYmErh+xJnKVTkf/dso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=bl4QSwO1839ulMw0M8P7c5FPNHCwlh7QF6n1wVoyvhMFEioRJ1ayEXkPXa1YNqRPAuf9YzK58w2IiK4JjAh15eUuVmc+QBMXGwi2J2p2bpOUZcAheQUDizhURA4v2+dW4o7qexLpDE5AZtTz8h9YubkdaEtwLIMrLHLDvEusZDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kf+811/E; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-793fdbb8d3aso89082127b3.3
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 03:26:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776335176; cv=none;
        d=google.com; s=arc-20240605;
        b=hR4tibBrACOY91DUkNxEEUmYNfIOB0VprfYHGaxzY7T+lXjBVF3NvKVpniDcl1DanO
         u714gVHLnGUbHdVq9g5mbwYoShriTwuTXCMmtDeY99gqHvGSuVtxpPhKQiRUzI3d3ONN
         4DShfFhkQxDueyvHNGXbMAkrVi016q44lRyp03xs/TBUg0k4BcNXFw0VW110HShvVfgC
         NWDWN0m52MBx2nV1oOnzLsjDb/BlRlO/CA7wXSORbiN+OaaXbOyNNDvZuLPUnGGfyxz3
         zIvwSEWCHRGOOn/srRX2GuhPLv4YwN1/bmaeupQkqLMk42Kwcc0GaC1plxmGq+8WAb2E
         wtcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7BkwtlCxZH3OkHAUtqEEeyLKQYmErh+xJnKVTkf/dso=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=RP6gmtQCtlklj2u12FT64fQFcYFeXWH9SIH56lSwmenVM1MTqLlelKUgIZcwA68KZK
         KFGRiJohizd3ctM4IgcYteqIngPo33GH5QZx+Oj2LpB5DjvpRGzynaHuDQcC2p3UOHQW
         k9W5wgfXa3zYoWR3DyGYL/vNkHZnND4vrnc0WKRir6GfZC496NEc09NJParwo/7QcNpT
         DB8C5O//Z7RvIySoDkeP/C46Nr6TmnjYJB7qarOMFAZBt+P8hfO0F8/kMM8tpPnoxyMo
         oDPrLasi6HrIU4bc++cpO7fUdWVxNgSmaoret4a2kRxiyE6UbYr7ymgTvQlbwLmM4q0y
         hMYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776335176; x=1776939976; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7BkwtlCxZH3OkHAUtqEEeyLKQYmErh+xJnKVTkf/dso=;
        b=kf+811/EimqNDxVqp2pmleK/g2WXzgMa9ZjGN1NWYibnmuqiJ0cspd093oPtiOGbGT
         5pVrYFeOx/fi5mZbMUjC3Dp+Me9xidHAVlfGRFwa86mMSt+K/te9ucdmA70o3UjMH/on
         iK1iqoB/GPmuRAEM2SkP7ZfblMy3ErAQ6HnTqF34bi4KILSbaI/4HXxagyPrl/jzH3fE
         3rTkvww/z+l3ym1yyKC/P9dZQwq9Obj0CxVUucxhWTpcIuXeLIej6lObnyYv75Q3HP0t
         bDFuYK2neCDs9ZovWH8k1NWmEzNXED5Vpbubmn05FN8hq8TsYRnxxbU+yTItyw3Nj6bs
         f/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335176; x=1776939976;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BkwtlCxZH3OkHAUtqEEeyLKQYmErh+xJnKVTkf/dso=;
        b=LklhImukq5ju71ZIIwo4080Bcy+KWiP7/fyStDnfHXnGSCoY9HN5csJkPoh7vkLETL
         A2jKpXfsORVhlDH1q9UZCPXo/0GcDjhblzumIJPgandz9f8ZrZP0k8Bu1fBHfVXQ3q4x
         oVMOIrrXg+lRmVj9iteX0yS62beHr7TKFEReJxy+opMZ/ioqTduSjdLnqaKLIjIX2bTv
         5S/7vH60zCMW4SFQ+ZeRLYbnDbF/KGc5c3CKMiazonUgGyOaWRWLd4UymQJ0pmwgW1I1
         wh8d8LIW0HLCgRmlW7Oq46OdKHDq9releNJFzIW+dCSTqcn95IcKCKmpofUqNay5Fj9T
         6DFA==
X-Gm-Message-State: AOJu0YwdXuFKbiN0xpaDsPmVONI13ALLRzzkE9QUUO/L2cZLwuVZKu91
	u3rpXjZQX2lPNb4khuew/i3LpY0JzaRNOABbMFie6/QDRpwrYJ/A1YWW5aQPl7/iXBaSw0NgRNZ
	KZoAgDYTFtJdfLTN6IqYVCFMzMWV720sKdt1OjQv64H1n
X-Gm-Gg: AeBDietklPQiptw/QTsp5zMD/+CjUVm0e2DBCQgsSucYijljxRMyr/OvIBuKUqfh1FV
	3Nwdv14NFVjGyOl3bTe7jwjklREYUmvxywIINJnoeLgFxCLtsTM2w5z90vN3okAGRO63jWPn7bk
	UqRjuXSESDomaze5caF0BggrHSExofHa+tWZ6pqcC4Xjd2ENjmwqmBcnJ1UJCV7cgChZX9Z81AF
	T2xPRHN3vYpdWEFnxp84g7hG1u2zFtBJDPs79/kcsn6GN1AC9Wn3k7C44+qQH4hv46s++/MlBaV
	Iglvy/o+MmNXVA6hFEur
X-Received: by 2002:a05:690c:6e0f:b0:79d:67bd:53ed with SMTP id
 00721157ae682-7af722431d0mr261994347b3.49.1776335176471; Thu, 16 Apr 2026
 03:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415151449.3387235-1-lgs201920130244@gmail.com> <69dfb857.9d0a0220.da7cf.cf8c@mx.google.com>
In-Reply-To: <69dfb857.9d0a0220.da7cf.cf8c@mx.google.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 18:25:59 +0800
X-Gm-Features: AQROBzAmWioZRW8abPnaf7Wkmzo3wC4rib_9zwuyMpDXjGhv7XrT3gQ88nVGT4M
Message-ID: <CANUHTR-vdWaDftYgi45CsORvA9bie+MJnx6y=VgTmVEUTaNbOA@mail.gmail.com>
Subject: Re: media: vim2m: fix reference leak on failed device registration
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58873-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,pages.freedesktop.org:url,registry.freedesktop.org:url]
X-Rspamd-Queue-Id: B011540CE62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, 16 Apr 2026 at 00:10, Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Guangshuo Li:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/97571257/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>

I checked the logs for the failed build-basic and static jobs.

Both jobs failed during the process of pulling Docker images due to CI
runner infrastructure issues:

build-basic: Failed with unexpected EOF while pulling the image
registry.freedesktop.org/linux-media/media-ci/build:latest.

static: Failed with ssh tunnel: read tcp ... connection reset by peer
while pulling the image
registry.freedesktop.org/linux-media/media-ci/static:latest.

These errors seem related to infrastructure/network problems rather
than an issue with the patch itself.

Could you please confirm whether this failure can be ignored or if the
jobs can be retried?

Thanks,
Guangshuo Li

