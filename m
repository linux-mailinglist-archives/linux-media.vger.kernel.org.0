Return-Path: <linux-media+bounces-59394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PKqH34H6mlCsQIAu9opvQ
	(envelope-from <linux-media+bounces-59394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 13:50:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E254517CD
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 13:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48B5F303102E
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 11:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D973E9F72;
	Thu, 23 Apr 2026 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFa3K2qh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B2737C93A
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945002; cv=pass; b=NZisF9iVfpHkO1pcIjYiScod5Sda6DMIJrMCRfHu0ZUiZP+GncyQcXhvIM8ciUPtsjvG0Dtlw2wmsJpxGq8fnx43Owv4A78gF7BJKa9/E5RPsd8zEL2dNitOxcTi6F980aNyOIgLPipbW3rbJmdKmdpn3nm+otusYJYH+7v8lsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945002; c=relaxed/simple;
	bh=NMysmFkGdL7lDHKDD0+dBK5B2PGw1As91n2z5R0Wi3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gq7TGEeOC+sxiSp1D+wSkA7JT4VxIEGvSB6jvk/M6lVrvqPv001+m3+fNy2k/kMtkeZh2LuKJ88rJpP6uEbSIlgWFOa7UDS/yLjmHy/jHGIIna+AT53h5vVu4tU+KQ+StJyP54VRYa4Ave80VeWtVehCgFjxRA2VB2280CBj0M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFa3K2qh; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-479d4df9035so2449515b6e.0
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 04:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776944998; cv=none;
        d=google.com; s=arc-20240605;
        b=WSuzwJQtSpQojIUTxWe2/zw3BpC4PgKaHL+Gdro4qay4I15U01O3Y7mXf0ZCJHvTcN
         PxOcvZkKb2HKERwL9ZrQgMXgvqwwKHX5urC6V4Bhu09IJH2qrTm5nNir//A3PxAjleNT
         dKssBxQoX6M1rObzefTu6tvDJfwGoPyaJj+ZYhskjDVY7/iTjlJImbssZxSHqK2x0QUF
         R3gSbjuvPXCfr/S/tqnxWHpfKfWDBZHawDhXgS6kyh62rOkVSppgq63fomcClVR4SMll
         RVDmpT1/I07Kway5Dtcs/9qixtVhDetZHOP6ynKcbdw5bVOEm4Uzqysb9tGcja4GEEu4
         92tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMysmFkGdL7lDHKDD0+dBK5B2PGw1As91n2z5R0Wi3U=;
        fh=LOWMiHot6EHHGGNvUIprnMxh/D6Op520thVGsOb8+Zg=;
        b=V0wUeySg9HaI5ZPzzo5WluhnOTJibB6pWZp58tTJb84X3cVoobFt8tXUdVliy63gfZ
         97zh7cMuGmJJTJfsDVKS0SJpzT2gSVSuJp2Htl1TqBdI/qTuSZwEkgkAbT1MpB5z95Yg
         WpZ1XT7YYECjb4SzXLo8WdNA303PryEHSiXcdrBC9Q/CHQOy8XufNzBY8oTzj3qMuL26
         m3Qud24UU3cbZTseL+FsTqz67QjokN/8psRf++iRFfPz+4IcxLm/K6ww+VWzOdcT1nkW
         frdbm2knQ25OFbTHCaSodxAE7S5ILOPAh/oxDKRz29mOlKM7SOgqLKh9uIGnEYqaglV+
         MGXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776944998; x=1777549798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMysmFkGdL7lDHKDD0+dBK5B2PGw1As91n2z5R0Wi3U=;
        b=gFa3K2qh/HYr9L/MnZ/fmd+PRW+xo8o9ONa3ErnzQtWbZ6ORwlVpo+845CGNN2DVhO
         AZgfbtTFhf3PX62s/QHqxcEaA7KHfZhuOp4EJZVC9Iy5fI5gc4ZmYU+dHCzDhyrhjK8g
         h6ZkS9nWJvNrAT5vC0BvRTASXhJoIPt/ctLYGVhQ/99wX+dnwkCzDvBpkebk2yYL2H6U
         eoJozTcEMG2+yZUPqHpaxWuwoS9zl+x36iIfeDla+ffUCCQxidPYhUCIUyhD75Swpf9Q
         rCUBfzmDDjQ0/AJiqk7MWO1VRonS/gIslmh4ZZQLxtZBQKJdKcXhgdsVxFXrDk5Un5U5
         SL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776944998; x=1777549798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NMysmFkGdL7lDHKDD0+dBK5B2PGw1As91n2z5R0Wi3U=;
        b=motHKppfOjHszR6eezpYLpDbIE4RnTI8Ll3CV81npFWvzGryK2hmEsRflfCbd8msBS
         Z3MMwt2WWqyFb4tIHlFIj+ZuIbPQ0b0PCa0BQ6RvFAOMidKEgb6LgrSEMMZS0cN68DNx
         1IKuv6GO+VZq1U59hD78pVj58lWzFPleudlFdF8jBGojq8M5pNNwP5I33KuDEyycu2nt
         yj1A7yn9ZwYwyIZwA1JbsNtINbpIgrex4DgV04BohjW8QfKkxAI7hlZQ/+5cOQ2Q5ByD
         M2PrE3S5m5hzwWge29dymr4s+lo9tmFnutoWNgLBKjz5SdCtKS870c754F3vLh+Ee4yT
         5Tzg==
X-Forwarded-Encrypted: i=1; AFNElJ9s+cqWRLKuJ6E41dFvKqu1s0jmwUN703WAPcP5rQrNzYjkiGlfyJ3y7740SJ9/BqSz/zCSbDiimc3QSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8fo2d6hBWbrZ8KDWtaV/XHf7oDyCNrC+TOPxi2sn8IUCtvdcS
	7TB5LrlQXuPWmyB1CMc6NZKWS0HYUW9HzeLTdLhLDuOr7PA5h0bpe6/oGOFU41NdYz5zIgZ3D5R
	pTuhKnTYnyel5kic1M6ekUKAGeROctyA=
X-Gm-Gg: AeBDiet+bhsErs3sTNyJHpdKpGi2IOaIWpANrkuPEi+DnqLZQIG6Aom98M+vpIhMXf4
	QpqcZDxJpk3WV0iE8AClb3kLvw2sTDBDyWeSKa1hmzJoo7v9GzF19zsDexo9Nj99IPwoQ1+X1pc
	cuOKaeBMW5f5OE9BYh9DhIs2WdeYO33RZDrD1ZPFTYg1HMNn9+Ltmb+ubdubcbRF9Wit3zOkZd+
	Sgy7tSI2kxivpzy0PFuxP4rsQ6kRXckHIY7enGInUSVO1qX4zuUeRhRSygJ8ZzpK4cVabG8s2rm
	+gOIooDYWiN8kbmfUQF9
X-Received: by 2002:a05:6808:ecb:b0:47a:4fd:95f0 with SMTP id
 5614622812f47-47a04fd9f84mr2979376b6e.12.1776944998182; Thu, 23 Apr 2026
 04:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331061657.79983-1-mikhail.v.gavrilov@gmail.com> <IA0PR11MB718531C51736C57114D6DC2CF850A@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB718531C51736C57114D6DC2CF850A@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 23 Apr 2026 16:49:46 +0500
X-Gm-Features: AQROBzCsr1tF7ROC5cSogOzcFX4U95VM00zHhQ_fb0LBMmia49ui3DZvV8SxZFk
Message-ID: <CABXGCsM8T4e8kaaO_bauHnN0yE5cxwkkcN+eAJWE8hnJ8RdSRw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf/udmabuf: skip redundant cpu sync to fix
 cacheline EEXIST warning
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: "kraxel@redhat.com" <kraxel@redhat.com>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59394-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: F3E254517CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 6:15=E2=80=AFAM Kasireddy, Vivek
<vivek.kasireddy@intel.com> wrote:
>
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Will push this one to drm-misc-next soon.
>
> Thanks,
> Vivek

Hi Vivek,

I see the patch landed in drm-misc-next (504e2b4ab97a, tagged
drm-misc-next-2026-04-20), which targets 7.2.

Since the patch has a Fixes: tag and Cc: stable, would it be
possible to also cherry-pick it into drm-misc-next-fixes so it
makes the 7.1 merge window that's closing soon?

The bug is reproducible on current mainline and affects users
with CONFIG_DMA_API_DEBUG_SG enabled.

--=20
Thanks,
Mikhail

