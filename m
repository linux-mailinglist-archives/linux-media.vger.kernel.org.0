Return-Path: <linux-media+bounces-14149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F217C917923
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 08:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BD151F22C7E
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 06:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11C015530F;
	Wed, 26 Jun 2024 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/mMMK/b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D208F1FBB;
	Wed, 26 Jun 2024 06:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719384409; cv=none; b=EAihJT130SfLxqJ1gha/GgxBdd3TXgiQ/vo29QP8Kc3yE+/KxdkcwZmeTLcyUITUYW7oj0MhaGqsEojdSWieB7nPibhqb6xTtGeu+1xs6DpVr+nhV3fhNSKxk3wITA1tzRWY28badj1bsGv0znE+EulPYe8bYuL9+qCkU7n5hFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719384409; c=relaxed/simple;
	bh=FZTOzozogmr7TZZJCLtIJkQYkzVg1Wm9YnnKljC/zrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNtmbnnpxiFg3QuApvSNS56HM/oAewO1vp/vxdjwcePwPRxyQN7T1bwQWht0IVjxSJYoPFQkVeExGvsr2e0RL8tlYpJaaw1HkTYA5pJlKeC50zRUgTJZv+e4B00p1dYU0xKhyjNDo4FFX3O/LaDalfoc/sszOJYcU7sCZ4+lpsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/mMMK/b; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so70940291fa.2;
        Tue, 25 Jun 2024 23:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719384406; x=1719989206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q26pjNvtJ7W0Ces++s0wabZem58LqWFTT4ckqRgALHQ=;
        b=H/mMMK/bdKOBjUu2mOI8m10tZt8AlSCCOO1awI/FpG5+7A7nyqJfC4Zgbx1D4ZaR/t
         0pV6WMGEK1LQkRAL9yqdPPJEMaoFhpB6LHCPzNhUcQquS7zmNRu7bhq+S0KHAX847m2l
         9OlMic9PLAcr6KSZci/W2E5nswMFyn2tRPZpKQdzPHAcIClkuF8/fI2sYU35IczxozuF
         8v4ehw/dPp55uLLsFUcubAoTtA4DEpJiG5yOWTs5IrnCOid9mfO7PW6iVD0cJPw63kt+
         hRxjpBl2BBTF8mPQGQcvb7Qh0l3VDnaiUTYG3c8EMuE5XOACgG/zWrLSSXeET7FthCQ8
         WtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719384406; x=1719989206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q26pjNvtJ7W0Ces++s0wabZem58LqWFTT4ckqRgALHQ=;
        b=CYjqmgyn6hXrdlNl6TQUV71u+UhR3l3ofMW2Ya+xhtXU2p2CA+cpt3OIkDRscTAKeM
         oSfJ+0/6bcmCcr/lfAotQEWLy7mM6LvHOpzKcpctbvKalxwPrzqhTgv5Ekj8LP9cblQ5
         dW3P83qCix/UJykMF9aRjOsZIeumoyA874tGnBzaEP9Y+rxmrjLkYLz/Jh798tW13C3c
         Qr8QTZMx6N3QyLfhrufeHsZB6gFS/E3aJWUkKVHtS0KdXxdn05nXgIEOCiN9ij46CCbU
         mwSCPrhqFh97cBc2p0NCN1J7WRCL6Aswlvcj36V+EQ9wp6d0+gkpJHTFc7IjaxX65RJv
         rabA==
X-Forwarded-Encrypted: i=1; AJvYcCV9FC81WKp7g1dm0IedLESjnNOZj+a/TKNfdknfw6DurR/2Jcu9yUDoCdBOxNnqxtFPpjl7T7uyM5NNul1Ss36GvMn6fLlzDmSEpjrhZIr1j4vHcSa8cYP7AcAhbgQGpiLlohhDJ//A7vSjrA/HZkxXW2Oudv7H6hdHlel/7TJBOMyENZ7cD3LxFlVUWJOjtsSgnqEd3N8kIoxlu6LoRuig+kNWrQ==
X-Gm-Message-State: AOJu0YxlGOnAW4jVapzYifZGBLQg2S5vAI2J5DFROdP/ph79mH1pPVHg
	0BnbrHltfcEi44hj9vEfy3pKXWO7S25jy2GE5i1FPLuhNsqPX4/kypQpMSSSkt4qRYTxb/eB/9z
	19/V2Ne8O074lwcei5YnTU+ZP8LI=
X-Google-Smtp-Source: AGHT+IFX5qBtmcXnkr5ljh/wUoeyOwS9xDWP0nBbkYxzNnn3HPX5omlAFS6wmNDeBHunBH1ypcxqoZ9oG8xm1tPDuFM=
X-Received: by 2002:a2e:8797:0:b0:2ec:4db2:abf2 with SMTP id
 38308e7fff4ca-2ec5936fb5cmr72143671fa.34.1719384405760; Tue, 25 Jun 2024
 23:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-1-89ece6471431@gmail.com> <c33dde93-2c3a-4a00-93ee-e4de303c9057@kernel.org>
In-Reply-To: <c33dde93-2c3a-4a00-93ee-e4de303c9057@kernel.org>
From: george chan <gchan9527@gmail.com>
Date: Wed, 26 Jun 2024 14:46:32 +0800
Message-ID: <CADgMGSvN=uAW7z1dpETGVRewzDG=K2MAtzOkhK7xAcskU_oeZg@mail.gmail.com>
Subject: Re: [PATCH RFT v3 1/5] dt-bindings: media: camss: Add qcom,sc7180-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 2:12=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/06/2024 14:13, George Chan via B4 Relay wrote:
> > From: George Chan <gchan9527@gmail.com>
> >
> > Add bindings for qcom,sc7180-camss in order to support the camera
> > subsystem for sm7125 as found in the Xiaomi Redmi 9 Pro cellphone.
>
>
> ...
>
> > +
> > +required:
> > +  - clock-names
> > +  - clocks
> > +  - compatible
>
> Nothing improved here.
>
> I asked you at v2 to go through all comments and respond to each of them
> or implement each of them.
>
>>> Keep the list ordered, the same as list properties.
I am a bit confused. Is it by ascending order or by particular order
like below the same ordering to the example node?
required:
  - compatible
  - reg
  - reg-names
  - clock-names
  - clocks

> BTW, I asked for subject to keep only one, first "media" prefix:
>         "Subject: just one media (first). "
> but you kept the second "media".

Sorry I can't get it. Could you choose one?

_ORIGINAL_
dt-bindings: media: camss: Add qcom,sc7180-camss

_PREFERED_
media: camss: dt-bindings: Add qcom,sc7180-camss

_OR_
dt-bindings: media: Add qcom,sc7180-camss

>
>
> Best regards,
> Krzysztof
>

