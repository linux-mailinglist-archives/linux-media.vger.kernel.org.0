Return-Path: <linux-media+bounces-65604-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MMPzINemPGp4qAgAu9opvQ
	(envelope-from <linux-media+bounces-65604-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 05:56:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6A46C2A0A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 05:56:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=SiS+9iXt;
	dkim=pass header.d=redhat.com header.s=google header.b=oH14ThxK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65604-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65604-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75B35303810E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 03:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2801C2F8EB5;
	Thu, 25 Jun 2026 03:55:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577A91CAA78
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 03:55:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782359735; cv=pass; b=Ha9Mp3Rk0/WbEojB6FsqNzT+IX5s9WEH4EcD1vLNJ72n0+awW+qaPTjTvUwLNrHbh+548Jc9dqY7IddAnAM378y2b4FsdT2jOdfaE7aHN6v+a8B0OGQfjOi5loaDCUJRrIj/D6PejH1KYGPJ1gp2AwUrWn5YSA3Yu2syxgIxJF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782359735; c=relaxed/simple;
	bh=aEfAqFZjHIJX/IMc6l7WTYOvQ8gYW05AXuhQt2f0vio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fL4d7KON4ZQ1dmCfZ3nDBJWN7geC44C8zAaCahAaw4fZfpGZi0IRTt2XXeRhoTF1hzTsn1uJJzPh5b/ij653KsnChBGMtln+B1ByzDe4u0DU8tv33tbYbtvDpKoJVpXcw0lSZRsNkB5/NRzr9SOnsPbpYzN0SF0Pj5r5LBueZbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SiS+9iXt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oH14ThxK; arc=pass smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782359733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aEfAqFZjHIJX/IMc6l7WTYOvQ8gYW05AXuhQt2f0vio=;
	b=SiS+9iXtHKpbIJn9PxQzQ4BMSVJZPloRAbu7V5lKvA3Xv1kNcY1Gk34BzmdwhDQdcZQD54
	cLpLe2/yUkg4niLtWrClFybko5f5ToCYtQaICToBTHglJ01usZgXZkSGkFct0CM86N6uBI
	Ypa1OeBJcnzDvIiDwnG2d00nWW39Hhg=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-hQTV2wbIOtOUl3Ue6Xon-Q-1; Wed, 24 Jun 2026 23:55:32 -0400
X-MC-Unique: hQTV2wbIOtOUl3Ue6Xon-Q-1
X-Mimecast-MFC-AGG-ID: hQTV2wbIOtOUl3Ue6Xon-Q_1782359731
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a1322f3c69so610822eaf.2
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 20:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782359731; cv=none;
        d=google.com; s=arc-20260327;
        b=UBZaUT7UX94kKGHxk1wbZYfrQYJ+zFTpLEZ+9v13/LwMYi427yNvSKHqMMTpaoJD5R
         iG6f9SXZLXBg4XDOcJh/DFAo9oSbiOKErxqWTKaCMNHPP1DQgwtyXkoapij964JtNEVH
         zsDzcU34AdrwMFfzh6Zb7GWr6q97XvDeUvCFuFq4dEP+sZAOiQ+2PfJlopaloX9msqww
         SsFZPHd5/6N8NGyCqnpV66De/eXUoEhQvUKgFXmX/HJbljFqaW/FR8wex/K/80AJEiaF
         jLrHSCUQeIeLo5j2Ss/zKDEWx9EbTRlL7DDZfqLP+N6dlHXuqHlkidSoPyyANDWFlGSO
         p5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aEfAqFZjHIJX/IMc6l7WTYOvQ8gYW05AXuhQt2f0vio=;
        fh=I+bnOr1ZHUSsfYLoHxXFUw8hGUpIljqJQTXPndoktXE=;
        b=SQy3/RForCCJ4ZiA1P83whFNfu46WL/j5k3Ptr2wW1UZiPFW2oGEj8G0k7stxGZME/
         jNcx3PQXITlzPncpltffXWxGZ0Rjn1XCWCHktAuDBHJ6psWaSU6kXFnTbp7Gb+cFJv8x
         7cEYSoZSxpySDSmSDsg8YfJj/IE8hM4puPh13VUwJ1fuc7Z96Ti3UgmTRwJZntqQWR9R
         ZDkXCHwa3+P38FJ+gTIFO9FQXfqa4FjJnsPyz2DdfxsL3qZa4kw1Gk9ygnnZiGcx12Za
         elf5r9yiGLVJ6WcIAQ0pprxF3fyhr31BHOASbb9xlq1LhQC09i9Ddxup291gYTRWtr1O
         wmtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782359731; x=1782964531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEfAqFZjHIJX/IMc6l7WTYOvQ8gYW05AXuhQt2f0vio=;
        b=oH14ThxKQfoEKgHqamYrLV7cGZw5wjc0g5KB4HlS/5SwiL9IFu4lEbW/JguqUR9aWW
         7TswJTJ6NHPrnbIQIMOPMEIX9Nm85RVM+DPgmAPxmM8R8ICRKY0+GfkKPf2demCRHL5Q
         E25hwAa5/RASXQN9D076Q8DtYXilqNsmnevOp3otJhV5r5hNHhLjw2nDNfkfDnQky8zp
         Og88N3XOBpaVaWwkrly1okrhpJgGDwPa3SEvLFNRHEtqFRwCP46cH0jhkPU+EjS46meS
         6O6PGv/tCIoEu1cwGa0/Lzc6juLJm5qwqW6BvzlB6q3/Z9DmB3cnS+M3pE0V3zccnsb6
         +mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782359731; x=1782964531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aEfAqFZjHIJX/IMc6l7WTYOvQ8gYW05AXuhQt2f0vio=;
        b=Wnctx6ErYUPP8DVe0wKWXG6Duxs6GR/aFYxeNezeG1EfaT1QEU4s45tNxEOnp5qPyX
         xkzHjvhdphYNcQwwEPY/pg7GpKMcZtaep52lXu9VYFS9xiq/d3T7n/vkzNPntk/BfoUc
         MAT+qD44LigCzd+GTMJMa3zjQx2l8mSTNan1D7QmZciSTP90TuAwykEUcDG5y/PkeC1e
         iQc+aL3SW6WqUmBCuuygRtlEZE2UqlwXljaR0FNIODln+x2qqMGetWSeDpjncJbbRWUt
         lSV5ZTPbxNTg62Ap3dKUKvI+p54mMxsJAr/rX0f+Jt+QG/udyVO6scuaXf519PoHSwHp
         mLHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Qlb8PEOUG/frUur7scQnvJTMcN/q2/papKzQnkTDbza10ZGSqc6iLKd9k+A/gfstTlGTw6LE++m967w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGXZWu9tMkzWYx3Cca8/B56EpUXtY1MTiBoujN1fft+32VOuGx
	3hW6CoCA4iv+WcVNXrihIyMnSI6GJS5XDRqazqGM5pGJ8PQEa1441tmu/1jbRytT8g3kCpFPOW/
	woRVZ8rxOa/4rATT/1MnddVI42DLqcCUb+JcNz7HTSf6jk5LcxPJM0ELpjthzRH42SqFvQBExYD
	sRyXQn7Dkw6cFN6/tSyiZ2gM/QUplBcUmicJVS6i0=
X-Gm-Gg: AfdE7cnBBX1cGNimjGjEiC9aq3okchgva9niiI2XZwSFADL3+wd8jnyL9U4KMrp3HPb
	Zm6HNaU4YBLO6G+QlUCgPgufjLt1Tq5swJJwEgwWlFFC1BJ7kQ9aZvUQIgWL4n5WfgJfuZygWo5
	uJS2htNzXrO6zS0aJvrZ4MNCmz5626QdezEpNsi+zOgKo64Vn8+ErtyHwuCoQSLobkSH4=
X-Received: by 2002:a05:6820:1895:b0:6a1:1e76:e1ba with SMTP id 006d021491bc7-6a13525d344mr604892eaf.44.1782359731357;
        Wed, 24 Jun 2026 20:55:31 -0700 (PDT)
X-Received: by 2002:a05:6820:1895:b0:6a1:1e76:e1ba with SMTP id
 006d021491bc7-6a13525d344mr604873eaf.44.1782359730955; Wed, 24 Jun 2026
 20:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624033508.27391-1-hpa@redhat.com> <20260624033508.27391-4-hpa@redhat.com>
 <PN3P287MB1829650C00C45055F7E923468BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <CAEth8oFeS_aQ=6rdiJwCN4fuj1H530qFEG5iXMRJWJCL23rtiw@mail.gmail.com>
 <PN3P287MB1829B3B10DBA560A46BC96038BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <ajuq_pDnirv1NvKg@kekkonen.localdomain>
In-Reply-To: <ajuq_pDnirv1NvKg@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 24 Jun 2026 23:55:18 -0400
X-Gm-Features: AVVi8CdwijRslw8wmt5PV4vkutsJ1yyDwOqCF7FR5aWGuqudsVqBTWxWNn2flyo
Message-ID: <CAEth8oErPSWAq71rW_nqe4fY+QbGzwX-h-0zj2j7fgyS=UmSdQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Serin Yeh <serin.yeh@intel.com>, 
	Damjan Georgievski <gdamjan@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65604-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:tarang.raval@siliconsignals.io,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,intel.com,gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC6A46C2A0A

Hi Sakari and Tarang,


On Wed, Jun 24, 2026 at 6:01=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Wed, Jun 24, 2026 at 09:58:11AM +0000, Tarang Raval wrote:
> > > So, avdd is necessary.
> >
> > Could you please try adding a mapping for SONY471A in
> > int3472_gpio_map[] in drivers/platform/x86/intel/int3472/discrete.c?
> >
> > Not fully sure, I have to check, but hopefully it will work.
>
> That's the intent, yes.
>
> --
> Sakari Ailus
>

I'll propose a change for it.

--=20
BR,
Kate


