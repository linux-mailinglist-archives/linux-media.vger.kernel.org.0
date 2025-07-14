Return-Path: <linux-media+bounces-37681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35068B04456
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDFB27BA38D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CBB273D98;
	Mon, 14 Jul 2025 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcAIaAPL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE23272816;
	Mon, 14 Jul 2025 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506908; cv=none; b=CjW0XGve5eePTzbJK2rZ8GHCcacao/9y2dyvdgVpXYWjMAzkPxNnOZPIHdNFbf143ndeIUc46L+NZPAMGHuMNrR7P0220Rs//kZ1OXPz/l3HOhM79dMW86SWksmjVS/jHMej6Ommi3u2dCsSF/ASToyMWSk1N1az5gWAiNjs0XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506908; c=relaxed/simple;
	bh=GpNVpLtiuXVvXcRnJj4M7X2+HMOzdAyNBGdu0XkOiMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDSRqpIpgx1jn9IiE2b+yXfn22X1RcX3mH/b5XgIQdMSQGcKUXg1ACYNsUL/ANkA6YtaB9HQwgePDwS/AbhI49mI9XyiRdcGoojWXqP19sDFeCYC1OcBdvqbzai4Y1fgUOAffzZuMq/8w978ALTctNzWKdbzzmdBr36S8Qjq4jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcAIaAPL; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so772121966b.0;
        Mon, 14 Jul 2025 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752506904; x=1753111704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abx0kJw5IyovETeaZowTfsHvd3TwzzvCoQExojDzwyQ=;
        b=PcAIaAPLTXmPaP915mcM7zAXYQnJGZQdEDB25B45KKaUm9lra8ldid9BHQwv55anLU
         4H5ZztKzeplSh5HhUteVrRUsGVTaPMhbOg7F9lUD4rtuDclJBuXDXguWpsMUyHFz1UcK
         gaAHWTdOaveN6H2miBtmMw6ZRRuu4DbrZK8WsbK5aS7LxxUYY8sIVtWAvaiUx6B6o+0F
         MA6+K1LJp9wLUenIt+36Ba4T17CR4XGkQP1XhllOEIlxrIeHGq9TuDqZvXPoPb/E80D9
         GS0ttdycQuphTFsz2dRyOjKwIwOQ+j+C3o2yc9kdXiOih+x8yZgbknylWajE5emeyAJl
         p4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506904; x=1753111704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abx0kJw5IyovETeaZowTfsHvd3TwzzvCoQExojDzwyQ=;
        b=LXgSqrAjFv1KFgwRTCKCq+Rw5m6oJwKVKsSwUr4ym3wHaXFBcju415ZNxj5XYoQHxV
         eRMg3T/8v6Pp9xJ6EiLEE14tAoV1J+ceEEQQcRUF4EcAbPdu5CRwDGyklK14Sclbl57/
         BsEOzOBykKqgYMawMtXIvChI1MGca0UDquj/bX1ipZMUDLvzFT3yL54x/VJPV87xC9HE
         KJ0rWP9mF1ij1u/HZPsjeZ13nPoVPT0NV4aToSwQouibx8Q/di6Zysr6zBJ1ZCaIa64w
         pwGKDkOsuEvQUSUEmXTEbALLzLE83KGNWC9xuKEihhBDD19kOMgpMcQOd0sKCcjAVUWV
         /HtA==
X-Forwarded-Encrypted: i=1; AJvYcCUdhf5OZIVgycioSvCRiatstlHXiDiktBgmUpZEyHYnlUMhxwLpRIYL/42LRdI4FpTiiqkHT238sQgF0Mw=@vger.kernel.org, AJvYcCV14F5SfOhlyHvPpEHNd1coDEubroZY3RNE6/8HH6hTQRoi72ddMyb0h1j7VupuWCNviCkxUCgHj2VFauE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR0IjvKpWnoVjCCTYd34CmpxQ9BbE/iLDej8ivSig4PsZIke38
	HnSvCW+litVfWAIBlfbvnmR+YQVzLGPiXGOcKa+s+aEyjzTTw45GHt1jPPHIfCvAcMUsgIfVxSm
	98Af36h1bXc1gx+GejUR4FUIa3FW3j3U=
X-Gm-Gg: ASbGncvi26K8ktOEw4RMXFKrlXTeTi7KY9diQ2hpsVyH3a6iFNth1WHVSAsUYmD5fdc
	g4lUiFsW5FeyeZPT2clHonnxxxwrr6xi2O6A6YbEP18jIlHA7ABLbJvwNoUanQqk6idzpyAU1bl
	7UZDss3cNScfAILHrQLiJAmEI6yLd96KXgs1ZrGTABPkmrdpnSyFgd0vJ6HNyu/nQgZ/36WQ+Gy
	Dff6/mNIw==
X-Google-Smtp-Source: AGHT+IECYIlD/hEK8u8iOntSYtGp4dfP/Z8nc8UEPsUAazBM2NO5fHNtHTM4nfllR7C44GwIpgQyDmPSBvkjEQL7hUQ=
X-Received: by 2002:a17:906:6a26:b0:ae0:67b4:991d with SMTP id
 a640c23a62f3a-ae6fca6e1ffmr1200009066b.35.1752506904102; Mon, 14 Jul 2025
 08:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714131953.45947-1-martin@weidenauer.cc> <2025071444-overeater-washday-405c@gregkh>
 <9F1430C9-1AC7-4955-8785-1E321BCD6E88@weidenauer.cc>
In-Reply-To: <9F1430C9-1AC7-4955-8785-1E321BCD6E88@weidenauer.cc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 18:27:47 +0300
X-Gm-Features: Ac12FXyabYhg6XG1ixZFFe3ti4iXaFFwwp6KPG4udmHxQ0DqNuJw9Blxzg_AXGo
Message-ID: <CAHp75Ves2jc7gPoH6zxNGuoo4ubRe0dBqSR5Y70NtJ8fMxfaRw@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
To: Martin Weidenauer <martin@weidenauer.cc>
Cc: Greg KH <gregkh@linuxfoundation.org>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 4:51=E2=80=AFPM Martin Weidenauer <martin@weidenaue=
r.cc> wrote:
>
> If you mean the indentation in the file, I think it's unfortunately just =
a messy driver in general.
> I mean I could fix it in another commit in general if you want.

Do not top-post!

The question was about the patch that may not be applied due to wrong
indentation.

> On 14 July 2025 15:24:57 CEST, Greg KH <gregkh@linuxfoundation.org> wrote=
:
> >On Mon, Jul 14, 2025 at 03:19:53PM +0200, Martin Weidenauer wrote:
> >>      Fix checkpatch error "ERROR: that open brace { should be on the p=
revious line"
> >>      in ia_css_dvs.host.c:277.
> >>
> >>      Signed-off-by: Martin Weidenauer <martin@weidenauer.cc>
> >>
> >>      ---
> >>
> >>      Hey, this is my first patch, I appreciate any feedback. Greetings=
 from DebConf25!
> >
> >Odd indentation, how did that happen?



--=20
With Best Regards,
Andy Shevchenko

