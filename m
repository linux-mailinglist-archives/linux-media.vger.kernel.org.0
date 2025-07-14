Return-Path: <linux-media+bounces-37703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 986D0B046E1
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB08B1A66CD2
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A0C266577;
	Mon, 14 Jul 2025 17:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdsYitlC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE00F246BBE;
	Mon, 14 Jul 2025 17:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752515453; cv=none; b=F6NBxAT2BYuhujcktdaEmcpO0vBsTm7xOLuIYVXVLM0/tYOY+XLQZGUMS/oZn+UYLGw4O/wu6ppnxEiIQYXnsebw5vRkc11SiFrepiEGvrHWWSoxs07E74gOIiNjwvLcQmo7B/3H7dgBITD4doAYzMwlf1Cf8d30pBCq3msMAn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752515453; c=relaxed/simple;
	bh=uUTXXLQ8c+rQk2auC5k3o67dtJ7OisKI3KhzZJAZiog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTdxPfFV6+BY+wLaobe/5K/TIBV3OF3cFexHhaUI+59p77LESmKUFrscxyuPddXrc20Guw2y+7WtC7zXtLO1Qm1sMi4AV3MFWKBN0pHP+pDOtWuddsjEdMDxQwChDcbd3Jlyb0N5ZuckVOcS5bCVxUz/hjXlZ6+oZHVfGSGJeV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdsYitlC; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso8522172a12.0;
        Mon, 14 Jul 2025 10:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752515450; x=1753120250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUTXXLQ8c+rQk2auC5k3o67dtJ7OisKI3KhzZJAZiog=;
        b=AdsYitlCrCJ633cC6Aw+zrJPXuu2+dYBj/WPYktfnyjSlvWHZhB5jAjAP+qTCN7GlU
         rE+wJnRInFVTSpETFtww7jOAtrGSGrNk6JfCsp25ja+gbC25Nii8We3wnqh3YKbk3DQp
         2FXQg87dktAH2mMgUDj81sgbXK4jKbz4O3L0oOj+Ng+/AAmSYbLs3FOpITBZLvIU745D
         GvT7t5K5KIJczggbrDpAyxJBiBWUbRDPGyRAY6aA0/YYb6LCRL56HDG7SP3NZaQLSCWf
         Z7Ouw7pstkGBV1tywMe9xRJDLsuprpV3zY+L1HMoJNVM90zv1YgHg4aljisS/+hsCfYZ
         LM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515450; x=1753120250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUTXXLQ8c+rQk2auC5k3o67dtJ7OisKI3KhzZJAZiog=;
        b=Knd0Ct4Y18ff3gdT1qdee2eFOGwTlrPyDNh8ZSVVTxV6ZF1Lxy19rsuUSy88kPY5vI
         5+QwqGLpjlmTsHucscJs7xIAsUhc6zF9cz3bj8wZXHnPgC6rP1Vxd7yke2K/srhOYpf2
         HcrX3FMkfb5A4EeXI56vCDyEngdzOrgrsFl4jS/JKseN/0tWDLxwe+N29JI8WxZIz0dW
         OOeqf7UZBI0ljhg4PYeQCwpxTJIjtgsKFG8r9Pvb4DAyPssohGPUAc80zO5si7NC2wLf
         p7OLfDkHqqBDyvucD982w+F1gmRDWA5yB4Vc2G/+UxcJoWpBzq2ial8FBva+t0aH9PS/
         LR5Q==
X-Forwarded-Encrypted: i=1; AJvYcCViKgHdGgFfoaMFhKpyeA5QReI6jB0GkXehb/oRe8UD5jD4Mk0BHVGqEqfEH6ZhOAmBcx7tRH47DH02kyY=@vger.kernel.org, AJvYcCXYORwDZYJGpgUmm5Hzamifd2bBG8Qmj4rq2K2sYg/HiOtzTxJ4QOqd0zDATE4+h+XsVfm5YiO2W9XJ8Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhQ3+Fu+51MDe0WTCWVcDKe4DZcXuP1BT04H+CR3VAvly/UYA6
	COO3+kDxX6aaO5ZcKbXe1PM6T03r/0uI7cFRwlgVwRBN0KxfQ5E2Qi+9W2F2dpblS7M+EdDylhb
	E6el3Bxqc0e9PEaObNsskzwL0T45PDlc=
X-Gm-Gg: ASbGncui/QY5erLPMwdpq2jfAbwxEvmgVpuAo/oU4FOKJBJ+7WKSu/gHHdUS7yyI8bi
	IIPwhKBapcepneTKtzuVHc5iikS9JTwferDPFVjTKJADGKpuM6DbVK+2+Tc/AsALrSED7Zhrrlh
	pIIqVQ6R4yNZPzX7266mbCDdUEr8rLeDFMiQZNqo2OCjSirpOLHbFMH8korZ56tQoIXUZj8HVFN
	nr2yc4=
X-Google-Smtp-Source: AGHT+IFpS8/N5yB0rcYX3H/cqfEl5MyB5jRqqTvyCvvL3Qym0VVsBnG28wuw+hwRccAwfKyDouIrRtXkS7XZpxh6TLw=
X-Received: by 2002:a17:907:3ea8:b0:ae0:df46:abd1 with SMTP id
 a640c23a62f3a-ae701297e9fmr1262359666b.45.1752515450009; Mon, 14 Jul 2025
 10:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714132221.4611-1-devrtz@fortysixandtwo.eu>
In-Reply-To: <20250714132221.4611-1-devrtz@fortysixandtwo.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:50:13 +0300
X-Gm-Features: Ac12FXwZInPOxKdn9zkcyU6Jp4YGebXnDMQeYpJOE_SM2A978q9jfuslZqNRnyM
Message-ID: <CAHp75Ve6ejJSH3X4fMJ6MimH9On_V7Ors8xVWtcjWyp4jx+VHw@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: put trailing statement on it's own line
To: Evangelos Ribeiro Tzaras <devrtz@fortysixandtwo.eu>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 4:22=E2=80=AFPM Evangelos Ribeiro Tzaras
<devrtz@fortysixandtwo.eu> wrote:
>
> Fix checkpatch error "ERROR: trailing statements should be on next line"
> in ia_css_formats.host.c:47.

Is this the only single occurrence of such a problem in the whole driver?

--=20
With Best Regards,
Andy Shevchenko

