Return-Path: <linux-media+bounces-14051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BE0914957
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4BF0283C69
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 12:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4A813B5AC;
	Mon, 24 Jun 2024 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQxlYDyZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E62E636;
	Mon, 24 Jun 2024 12:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719230853; cv=none; b=n3sN/QPGMh86n0xBroBCryFayJ1Gv+6VT5TBFD2lA40edUokCT9PR9J7bTYORWPNKOMyoQriSfqkYqad3d7N3FuBKj1HhLSnsA/D6TrieGJ3hXoV+zvjTacPgLE3d5gENDrLaO8keFDMhTfgw0od2DT1KwiwWAq3M2Eb3a7xutM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719230853; c=relaxed/simple;
	bh=8bqVYafZ3E6JON9g+uWkYuZXDsxgBqrDlWWtrUxxkbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrpL5fRzWqsTIHEZdPyxIGb3izBeijabxRL8zTCxz0yFX1lcHTY02WUVfaz40Rjh2JyB3q4TXSk48nZuT94nRqP3JasMLHctQrchzM2j2uxttQ0IUf3e1jPiHLcB20QS+MKjcXuHvlRf9SmWf7gEfc96sJnboDCItaaGtSe2meQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQxlYDyZ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso45521621fa.3;
        Mon, 24 Jun 2024 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719230849; x=1719835649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bqVYafZ3E6JON9g+uWkYuZXDsxgBqrDlWWtrUxxkbE=;
        b=EQxlYDyZjWrIkLBfwBDkVm7ROgspQyWD42q4/ABka6xdodZRar/am/pQFUxAAvAbP6
         prYAH+/9lIm0PFH4e8SN/6RNdJbHogKh04r6dfFMTYEzVnqXfYr7oSvovD4rHt4kKM1o
         tUVjziOZMXPTFdEeEAEma0uUQUIHUVbpnCo12EXhejpIgYSPP3XDrIwu1zVaZdHbvu4J
         8cSfDFQ+wIlXpH8swryddtqont5iAhqatbfyARq56TritxqNHdzV3Z8LJLSEcU6NNeO3
         Pkz392N7WKql0bkuEcmOLgQTktW+0LrqdTVbsN+yMMR/+SPTwpRWhAqySA2bGQiwyJ4X
         nVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719230849; x=1719835649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bqVYafZ3E6JON9g+uWkYuZXDsxgBqrDlWWtrUxxkbE=;
        b=iEJ2R2OUVFPwl2wXP1uqR69yi87O3ntWJLUpkSFB0DSlPGcYg2522fLx6c/fw/9X7U
         b+NuZXaRTnG4pILDiQhx+jIAHP+WZwIYi8Y6wp8LJE+ptXxY5R+D2Z+3XP5Mr5hh5FDU
         2/auH2qL751x7CPjgLcdG6TSY77xppT6PZExDzT7B22nQS5Mfp8sDhahpljE7f0UrNd0
         bo8sJoMW4a7bJ5VcHIvbTi2CGm6send+26xQy5QkSR5a5KFNRFZtU1/JSasL+XtOk23M
         yGFwhiYHEGlvZwJr5leaDPGMWUCdJIrRXMBIfpKXMSfr3jNkh8g3YyAnS0yTZpxCSRkH
         60yg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Cm7FkJy+BUxVWeaX9byv0gT+qJ4fvCZ8Otc5pZMD/jlhvwHubrU/tx3xFjtXZMFtCvIP8pll4xL4sfN6QqYvAuPTlZgR5GqFwnEJN1LBuJqVqbXlJWwNZuoKAvKsHari4rnS5VCvWKLf4M3pbIxFKBTXXJfpxF4zNLi9g0ZJl581duov0PRDLXkldXRADjz5QkfwIHn5KGhFUdkytzHShj+odg==
X-Gm-Message-State: AOJu0Ywrck4uNGplN9M0L+FsHNufnI5XtUyjrNecb5OIJjejyo9SlnC3
	rkZ3cPWkVHb/d2jESyec7RfZW+DoqcJcnRd4F6s5Wzo487FofWbmaIG1pjsqkTHECTw5hTqMAdK
	83UpGHwZnsafowFqQp2uvLVuZSG0=
X-Google-Smtp-Source: AGHT+IHBPVKKG3tX3VyK5m7mWw6zHHNK3Rx4H3KsrXigWNBk1DHRnfD91nMaOom5C0pxzN2U47I25LOdsHK2VHsiayI=
X-Received: by 2002:a2e:9f57:0:b0:2ea:91cf:a5f0 with SMTP id
 38308e7fff4ca-2ec593d97c9mr29368521fa.19.1719230849174; Mon, 24 Jun 2024
 05:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com> <c3240caf-a291-4f6b-a467-a424f1b3babb@linaro.org>
In-Reply-To: <c3240caf-a291-4f6b-a467-a424f1b3babb@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Mon, 24 Jun 2024 20:07:17 +0800
Message-ID: <CADgMGSsanPLRzRGBMyRkGh4gckEOOyiD2FaAzeoP8zWc5rLh8A@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add sc7180 camss subsys support
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 6:05=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
> Could you please rebase your series with
>
> https://lore.kernel.org/linux-arm-msm/20240522154659.510-1-quic_grosikop@=
quicinc.com/
>
> taken in ?
>
> I think your patchset ends up with less churn in it as a result.
>
Sure and I'll prepared v3 based on linux-next-20240619 +
20240522154659.510-1-quic_grosikop@quicinc.com

