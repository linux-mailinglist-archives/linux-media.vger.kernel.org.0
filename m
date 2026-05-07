Return-Path: <linux-media+bounces-60861-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMtXHWv+/GmxVwAAu9opvQ
	(envelope-from <linux-media+bounces-60861-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 23:04:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C75994EF193
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 23:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88FCC3009FA2
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 21:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B7F334695;
	Thu,  7 May 2026 21:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSr4fgBV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971331714F
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 21:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187841; cv=pass; b=EhXlaeR2k+CU5szZBXbG0R9J581mZQYp/t+4WEap7uC9uDagR0Lo9tc1kw50v7BaosD1UtgqazeWfbzkQYTABRgCUFZZifSL8ulXYOYCEyJVHAD4MgPku1RQUsn0SumX0hvsn87R76WNSTQarHzoWI1hquqZLOGCmT5SA4LfkNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187841; c=relaxed/simple;
	bh=0Lk6rgiZoWJcLKbIU2HPc73ZlKtBXCjCdhmIW/BNbgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oiIKpGEFgC/TarPjE5MxPv4L4P4Ka3/QEpEHrTb6fMD6IPAKRsoc9SfBOzVpEYVj1qWUB8fzRedQhyUp5l1tQ9QyOkbI2fYnw90qfKjKrnhqmJ5D5DzjXI/mol8zUS4iCcFaeP/WacF7VyLmgkMamkOo4r1if9HHZXLWaMuUiQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSr4fgBV; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-68470763896so715236eaf.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 14:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778187839; cv=none;
        d=google.com; s=arc-20240605;
        b=IkWv3jZo/R0bvxTrJFDVw2ymERsS76R/MzT8vtA4UFlyGEFEJhlMCRHYaTSwqRxMp3
         YVYkVQoz0N+/4ZqgpiEHd0TCE18WjwxkAeIGFIGAdi+jpmCtshsZy58laIreE5Iv3mfx
         7+4S5vmUjFkI/kGLZoRyyYBam5OtdHPRpY2AglzbkRMBlXc/3Ea5yQYL7JbcFENOlrBM
         JlLbLQTg3rvHxgR4UPW89GIHLQ9OK5QBlEQ7lWN6i95ZTLVt7UwiUAdyOqPWZLfc2hJp
         ezGvaBZKRErNL5r0GDgH00XDG33PxlYTYeMleBfiefbdhBDA6uNT+D9MnZ8/kkb2Ceo9
         Kmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Lk6rgiZoWJcLKbIU2HPc73ZlKtBXCjCdhmIW/BNbgs=;
        fh=OVp4jLWPvjOWXnMrg3/Fgx6s+zbsFS9QQROD8KwN53A=;
        b=GjsdYEG+UEFY74R8Je2uVQ4LBgdxzOer624d+QB7/fWz4WZPXnU986+3dB7YLLL0yY
         bFAXMxgvXdUy4fzYWpUtd9ru5BJTk5mH8/+CI5F952n1zuNk9CfHz4Hv51yNxzSWoVEk
         YwWOyZItcXS0bn2kJWarMWDi+gypNquIyc4CKd2/9dSTJkVQEG923JwkeluHuUzPHUwU
         6Sig21CAV7Kc5m3uoIRDn3yOx5A63DMi2T6EsY8p3oDfUgWUIoz59Hw0Ma91+ICETkvL
         UnGBqsRzVphANQ+QzeCam/e8P1O2gkCEWqCGT0xCNGYZRbwUYRGE3hDru13AD4JoIW7g
         jIVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778187839; x=1778792639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Lk6rgiZoWJcLKbIU2HPc73ZlKtBXCjCdhmIW/BNbgs=;
        b=TSr4fgBVHG/GHrYoItI1ffKUn+3z2xnFZxbfAKgu0LjFY6WuX6sKQKxni2+5Z6U1U/
         G/2o9qn3m2N3+cUBIPL6krN1P5Rysm13H9K93cW1aa7PVMTJfeO8NAVg1XF/0KhZTsGW
         bH5gMTnKAS8TKuXJLjO5t6QFxnmMvZbJlAgmIYeYccCJIYzcSU6UlnziRjCBHdFs/Szs
         pzZSYrEgjEuEeP092xx2YGSQGsU3ipIScljQIDYO8WOWKMHdS3ySbJjF0tPN7xJfRG5K
         +U1Vaf1qY5wXsaKuqVo2BurXBX8T67q+pUQF2U38KTpf6YCB4XzvLGC8dMfWSo/BpWBe
         JBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187839; x=1778792639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Lk6rgiZoWJcLKbIU2HPc73ZlKtBXCjCdhmIW/BNbgs=;
        b=KI5K+QNurOAQ+M4Hjrk6UInjUAw+AVr0/IaSoTmf6Ze7Dj57WkUa1kj7EHCuDS/qAB
         5xb3n4LnmJSWbmPnD4/o8NrdHwOxl2lIhzrZVGeXKMi/x081zu73iAjACcVBjNTZgxkP
         1tWIOwZycLk4L0rdneWvmFXJvkMip12QYHzz2oxDq/mRCq3QXyV7n+y9fidCREduCQVA
         StC82DOzaM0aIqgs7E7ixDu3Ao2cUXArFCiVOpf8fK0Unp7CX/ZIkUKhdR16S/2NzKNj
         WOqwfhHMO8q0IfeXNIPDGAdSgrc9Zco/ArouxuSh4ZNejaDE0vjtvwd7MSGebCOf55PD
         j7eQ==
X-Gm-Message-State: AOJu0Yxz2nzM/U5TXfKfE4QXLie7F6GbvBggHIrL6tdyhJE7IJp36fPK
	GvXVB+JTIyG730S56mJJxl8MJ9bWNMVi42l1CPL6NWyGE7G9qtxohULUS83g9/CnDTfX7fqYnp6
	f6wx8orDAWL7J4xL7fGplm+zxeGPavUenWQ==
X-Gm-Gg: AeBDieuLFddp0GozXvfgn3NSHgd3/bA1uf0PTCRzZ2rxFkGAJGxQKXana6gVlLJfBJn
	WchIRrnfDBHbX/bzHCx8GLJYDnU8VxJbxTgYpSeMo6qRFmPWBa3hYUn1SEBjy11BBmJqGYx6K0z
	cxVnfBkXalUWOMzasdovjQyA/e02Tr/FLtZ5LWEnimQcaSbxE9FWw3+eKqGQoXas4edBjVFKARu
	P6B94cpMIAIguQesFClkqzJdTvqEtrYHLJtFyVGbDrVv3Iyn3x/Ggufvn9/s2b3rHBWu/5pUSFV
	PFMlFv1msZXxQgz37TskORBF4PEW7/S51iRIKA==
X-Received: by 2002:a05:6820:4b85:b0:694:9c71:2772 with SMTP id
 006d021491bc7-69998cd99a6mr5835065eaf.16.1778187838898; Thu, 07 May 2026
 14:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504103656.32945-1-shyamsunderreddypadira@gmail.com>
 <69fbbd91.050a0220.15ac9b.9d7b@mx.google.com> <CALx+fbb9=s4w8f-_uaD4RHFpu_WsaQEYnrxdoU0ydcWoF-m_Xg@mail.gmail.com>
In-Reply-To: <CALx+fbb9=s4w8f-_uaD4RHFpu_WsaQEYnrxdoU0ydcWoF-m_Xg@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 7 May 2026 23:03:39 +0200
X-Gm-Features: AVHnY4JvR7SLTX0-z4lHo27jYqAKb4KEYL7YVw04c4nKWG_-yww01qt1CJCCiJc
Message-ID: <CAPybu_2UiobK1GzYkg0L5oBT7TEh5sUjfhT-9F6wzUcGbCdLgA@mail.gmail.com>
Subject: Re: [v2] staging: media: atomisp: drop unnecessary else block after return/break
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C75994EF193
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60861-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ricardoribalda@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

Hi Shyam

On Thu, May 7, 2026 at 7:20=E2=80=AFAM Shyam Sunder Reddy Padira
<shyamsunderreddypadira@gmail.com> wrote:
>
> Hi,
>
> I noticed the CI reported a missing Signed-off-by from Ricardo
> Ribalda. So, I wanted to confirm whether I should add any additional
> tag or if this is a false positive.
>
> Please let me know how to proceed.

False positive. Please ignore it

Thanks!

>
> Thanks,
> Shyam
>
> On Thu, 7 May 2026 at 03:45, Patchwork Integration
> <patchwork@media-ci.org> wrote:
> >
> > Dear Shyam Sunder Reddy Padira:
> >
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> >
> > # Test media-patchstyle:./0001-staging-media-atomisp-drop-unnecessary-e=
lse-block-af.patch media style
> > ERROR: ./0001-staging-media-atomisp-drop-unnecessary-else-block-af.patc=
h: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
> >
> >
> >
> > Please fix your series, and upload a new version. If you have a patchwo=
rk
> > account, do not forget to mark the current series as Superseded.
> >
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/9916=
6082/artifacts/report.htm .
> >
> >
> >
> > Best regards, and Happy Hacking!
> > Media CI robot on behalf of the linux-media community.
> >
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-a=
ll
> > to this message.
> >
>


--=20
Ricardo Ribalda

