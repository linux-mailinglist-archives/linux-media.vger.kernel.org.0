Return-Path: <linux-media+bounces-62198-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLO+Lx0dDWrZtQUAu9opvQ
	(envelope-from <linux-media+bounces-62198-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 04:31:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A2D586DA2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 04:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 422B13045991
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 02:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA483093A6;
	Wed, 20 May 2026 02:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JB9KLif2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD7A3019A9
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 02:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779244311; cv=pass; b=boRnNvzjmhuGhnDokidXzMwSkLrpXq5GmtJMWyZdDHV+1ygoXJ56pDtHBHYyWXvh+/XFUAwONrZN2Y1TF0B3QO9liPqXqwULAw2bCgu5xJV9295I7aG3DrGVMddIhEaNjs+UnEYkG3k6IbZWjvQoAqFzSDnMGRmR0fCWnFM4wwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779244311; c=relaxed/simple;
	bh=1WPnCXVijfHC5H5f/Ma0Ogk8m5Y8rDwOElq+000H1SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ux7DAXqnPZ5/PLCpJQuoceD5+U3wp04TxAJ3gFaYsgo3fLkANwlFU3ywexkt0mUjtN25YlszVbuFWILYyUDAkmkeDvQe9xcyRqYbQSP0HtH/9TJkm1AEUkChqaGAnDSTcjmhk3hHY3WpgSSpJExtiUGoNov4889WZvC0rnUUjtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JB9KLif2; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65dd9b25829so3425574d50.3
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 19:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779244309; cv=none;
        d=google.com; s=arc-20240605;
        b=Zx2RhxxbNu3dGWAWJAJzABsHsgnw6xgA57jB7vCpLkqXgmDXFAEiWA4kVGIbjiLlPV
         Zuu7cLFbubBxDeNS6gkhAE+NKoHOiVXES1HecuXXkUUbtQBXIUOz55jELh7SzcZrLBqb
         ZFRMRJEaiAw6jObIGNlF+41A5xaiF1sPIQgBgHKwMKijEkjXBZZUrHzr/bXohcohFWs6
         ttHMu3MUK0RD1mOD2Itqkwvm5TcxB4D8baJOjLp+hesXJfM2ZTlsLTS7X/PedqO6nyj5
         1XEJh1XM68XsolN36GSUPSGI7818PijG7FISmlXGLZTxSyK2cV/zcHvT+t7CAO6n3aMH
         Bvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qx5mfJbpIgRnw4qAKMbmotbNhbk+521TWh0CiXkM9ZY=;
        fh=27ogi0xLXUrIruWB/IPuv3JNnTUEBFirkhCoLdp2ngk=;
        b=hpgq3HhAxsRvctafdfWUBSQI7eKsIblS6PrM+IOHvThHIATEgDiNg+iPNiUR73lrYJ
         nrqw8ITWx4kytI2XtDB8h1zAbl2QIQz2DNJgmCFpVrnZ9DQvgwkOdBsM5BSIOoBwgr41
         BdLi7NDgrvN37l92eXjDLxjumlsdVBB8eeypPf6bgmwzLz306QitiQClqio3LAIesyF2
         OJ6W6WAClxcs4Kmik6Z0wOsZTTY2B+ykY80XP2fF22td7bjPeZDHL4lHRg4ocfHoDeB8
         TPqOXLRJ+BKxNwQaN+KDz9DCgiKVpED686gYEVfFMhgoZi100J10Qp7qO0TvKvrKLOU5
         x/qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779244309; x=1779849109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qx5mfJbpIgRnw4qAKMbmotbNhbk+521TWh0CiXkM9ZY=;
        b=JB9KLif2kGm4EW2W/R6nWGFi1VbeEqTL37GWhbD+/+338PXGpJSxuWOeExzDlQU7Zw
         tXiR3RD/qFuVJw50cm+G1jM1j3Wa/bLGd7Brh4m04KSAtWbCX9//5VZZAXAAm9tlAGKV
         qQrFXUExE8omDTEx8DBa8Sqyf085+xfH6DIRjCQTQ9Lc83FmJtDL8dOcL5IvdBIGZz1s
         e4da4emvyqivK4rDwBd6rKsTPa//DRnnaGFAiogmGDTwADpBF8rFGfxZJ6BpPD46QJTt
         a78x+DZgpl+WOqPPF9yY6IBoPbtEAxAWGKqLr+Bh/4BaZGe6Ev0SKo7i1McE5yhgY00/
         Qmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779244309; x=1779849109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qx5mfJbpIgRnw4qAKMbmotbNhbk+521TWh0CiXkM9ZY=;
        b=A/R6Fxr9a5VTWBavvNXXQcRwdSHl/vGSQ9S+nmm6fNLBk2GFe3/XcfsCgHockI+Zl9
         0H0L57+8E6sBmpvjbNOvdbcBTalktqFa84ea/sSiV0uGvB0jiH6317QVObXMqIR0k/d2
         8FilBgZnRzdC1QITzFh7zgyvHx+h9O+6SvjNwgr9Gwm4v8HslwEY4S3Ov6YSg0zsdGz7
         NZLaWyN5HtnbXSWR/gRkyJUG5ECrtfgdopy60hKMBjc5Cmz9cJq0po6rYK3SiwOhSorB
         fNx/I9Isx6vhmU/Qhtmeo6tEdY8xDUH5Ywy/EF4ruFrlVEqZ4d65hEzURn4nLGbxQPr9
         MEvg==
X-Forwarded-Encrypted: i=1; AFNElJ87CuDJg5TkSfdi3KvWfWW/64Iwjh9h2Hi+p04GLri9q4pQrtz7XM5R0SRcjShfQRNd7sc9wlNv8e2BPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/oXGhyFNNi1FEBEI9xPtHiDlMdGRXQpIKJVpi5tqdZVNimOfy
	2KfSxT2nLvNc9lmbx+BUVzspnbL34WUmtHar/+JDxe0f2juRaG8w0Frm87/h/+dd4R6SeHDHqU+
	9g/1dLKHSoNce0EF1DMLqwVX4hIILVJU=
X-Gm-Gg: Acq92OHPTmmCq0FNyFkMImjLBXxVWWN5jO1v10xPu2f4f81wrhEBR5OJDM/kcdK9YU5
	qDhcuXmOR8v0FJh4IOPr8468puuyV5kaX/g/gy8Wikvk+eNf2sm4ptF39Xif+ht3PjiMngIF20U
	9B1H+xCfCSRm21zp5K3sK05cIEdPtMFsDN48RA6aJWN9oVXTxNvtQxgWExx6uAWzJM+Tt54ssTM
	ucVxkSABeELCfz1tjlIlRDZfSl/bloDGkLutT2eVNBFVCq1PSy/gRgSqjdvjWLccI8DN7xC4BFB
	31wejyvI
X-Received: by 2002:a05:690e:169e:b0:650:36e6:2ace with SMTP id
 956f58d0204a3-65e227cffebmr22544599d50.31.1779244308690; Tue, 19 May 2026
 19:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xMdPPQAJ2BbtNwnxmf1CN7FGbdhSJM7NIXkRCxzFvXv0g01tuvNPvAacsFJaDyBc3cIkIAEfi44ewZ3OGGAcDg==@protonmail.internalid>
 <20260519090819.1041314-1-lgs201920130244@gmail.com> <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
 <ihn1XgQJPFsYvuTtWPxpZWwaQBVXHDmJ6Kp6i4DmDowTcRQITZXJlaVsbtkW-bpWydiYGAyyh6c9QLs4Nsn6lA==@protonmail.internalid>
 <CANUHTR9g6vRkKfPeHBQ4_9YR-sZQ_UZBX3+8CiKPYp-XPcp1CQ@mail.gmail.com>
 <d7082ea8-3b3d-468d-ba27-4d3ba5103a3a@kernel.org> <ZdheLnLujnIRGAGLFiz1lwSwxaUCArec6sbk_VkixDGjsuPYnMT4_YCSMTbwBWI5-b62G90Qia9lQ90pyFvjBA==@protonmail.internalid>
 <CANUHTR99NHPRP3ooEXEBHf4Fksy0B96vdoV3=mzoMBawVgek+w@mail.gmail.com> <cfb76181-4d59-43b3-a45b-a344a71fdfbf@kernel.org>
In-Reply-To: <cfb76181-4d59-43b3-a45b-a344a71fdfbf@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 20 May 2026 10:31:33 +0800
X-Gm-Features: AVHnY4IKjQnljjpGsUQoQWZv1Y2n6uDHs4zZhfcFPqUV4dLPUHv3Pm8y929Ral4
Message-ID: <CANUHTR9OX4KC6djn=wdkwAhiB0zqFEHFu3jtJ-+LdixgbB-OUw@mail.gmail.com>
Subject: Re: [PATCH] media: venus: venc: avoid double free on video register failure
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62198-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 59A2D586DA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 at 00:34, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 19/05/2026 15:58, Guangshuo Li wrote:
> > Hi Bryan,
> >
> > On Tue, 19 May 2026 at 21:20, Bryan O'Donoghue <bod@kernel.org> wrote:
> >>
> >> Yes I take your point.
> >>
> >> So what you are describing is an error in the software contract from
> >> video_register_device() - if we look throughout the usage of that
> >> function we see either the pattern we already have - not checking for
> >> NULL or checking for NULL - not the double free case you are addressin=
g.
> >>
> >> So really the fix - the place to litigate this is not in Venus or Iris
> >> but in video_register_device's cleanup path.
> >>
> >> ---
> >> bod
> >
> > Thanks, I agree.
> >
> > This should probably be handled in the video_register_device() failure
> > path rather than in each individual driver.
> >
> > I do not have a good idea yet for how to fix that cleanly in the v4l2
> > core. Do you have any suggestion?
>
> So if we look at how video_register_device() is used by drivers we have
> two different behaviours.
>
> 1. Trap the error and release the device
> 2. Trip the error - check for NULL and release the device
>
> Either way the _users_ of video_register_device() right now expect to
> have to call video_device_release().
>
> So... it seems to me video_register_device() also calling
> video_release() on some but not all of its error path is not the
> expected software contract.
>
> So I suggest two things.
>
> 1. Audit all users of video_register_device() and confirm the hypothesis
>     That is callers expect to own vdev and currently everybody tries
>     to clean it up.
>
> 2. If 1 is true then fix video_register_device() to not call
>     video_device_release()
>
> It either needs to be that or fully delegate ownership of vdev to
> video_device_register() _and_ update all of the callers.
>
> It may be that < 100% of callers if that is low single digits then
> worthwhile updating those drivers to match the new semantic.
>
> =E2=82=AC0.02
>
> ---
> bod

Thanks, I agree with your suggestion.

I initially considered that some callers might not follow this ownership
semantic, so I tried to fix the issues reported by my static analysis tool
driver by driver first.

I will audit the users of video_register_device() to check the common
caller expectation, and then look into fixing the core error path if that
is the right direction.

Thanks,
Guangshuo

