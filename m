Return-Path: <linux-media+bounces-13995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0498C913F0A
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D71A1C20F7F
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43931185E76;
	Sun, 23 Jun 2024 23:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ6ybpng"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD85175AD;
	Sun, 23 Jun 2024 23:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719184577; cv=none; b=m/Fvb9BkUc89ZBWd1UpqyUm7Cg5tDFgkt6Ttsw9Cx76CzrGLSs5fZlxD5tLr1nRogG90Bm8Px6YNhJECozv2dR/m9Q6ymbCpyR5JfLHi53vqrgYpZN5BjenlAKpDhMhX+vrslYnCBccePZjgQwVOF2tVICvyk9+a+aVPqjG/nIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719184577; c=relaxed/simple;
	bh=SJ35TR0aVMthObi4Tq8IVJJfUp0GdCYPLfsDJ44pKu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYNa1qXSfceqQUZkWU03Lz3grAky5BhAhDDG0A6T49vaZUNWQAIQFyaQ6dHGLu9485M11a47mD7pnFHsPNdXYziNQ1cZfSNLj0wcDDyDST/EfIzCmXkKC31cyqIs1kyqtr4YVpGEZBUQVOxG4E4BiTXVfreECdj7oXrwbPOR3MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ6ybpng; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cc671f170so4088887e87.1;
        Sun, 23 Jun 2024 16:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719184574; x=1719789374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJ35TR0aVMthObi4Tq8IVJJfUp0GdCYPLfsDJ44pKu4=;
        b=CZ6ybpngznQ/XFIS3ezsdKUp0+dfL5v7pMMwA/Ur9Ps3ztGjTs9N3xwIjN1Bw8Hq1/
         6QtWuyVCnv0aqViN1dHgLZ6GJJL4eH9aL4P1KICvOFKBNpV8N/tYDgqbOwi8t3pq43Ut
         fBEDjRTeUwVSuFIES1imSwlrIXBiAGBjOo6yf404wMN33oQ/QYSJHKAzql4COGUyjONe
         48rONmj6vMwNmeITJX0JOyXwdU3nwUsGbTZIbJMMQNxPlv+hmHCyQqTpgMPLUqEF9wdQ
         HPMZOZcYwWE6hnj14bATI5i7sYoz9K70W8zt3kkbLAnvWh9CIWUegYBTQPWdbjNVGGSs
         fd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719184574; x=1719789374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJ35TR0aVMthObi4Tq8IVJJfUp0GdCYPLfsDJ44pKu4=;
        b=BIdOuiQv1lT1QA6Zvb7Lj7nEQFPCoaEIa5BnGe4O9s8mIZSwWJq/NZjCv2t3iH1h04
         ifgDsyVgEoXWPbNZFHK9vkNlw9nw1xJCi/W8tVcbvHUia+QHLxFX/fNCFeOog8tPTOxo
         aPeiM+YHYwyLY30AKH8qBemiiI9qXK36858L2DxOVHNOfFVQ44oJY5q/Yl3gC2o+cBjy
         TXd0Pt30ZDyFKJpbq/AaNbbUdno0DNsHL5+04EQfnn+80qqOIm7F4bD3u0AiPnpzU7sM
         j3PMfsEvM9GnKUGf29/X/6+gA8feCTJweWs86tssSFgCy8CZ7MoZyCSi5QJXyfy7WBM5
         TTvA==
X-Forwarded-Encrypted: i=1; AJvYcCUcx+H6sXs0BLWZO9AJMySTS0Cu4uPvMoSsYn6hN3tWsiQMeQ5frIBuiYanuNqQQBNzyB0bxpWaQGjeUfKXdBN7Zz4KEczVmn4bUYC6bBE6Utl+VbuM5lC1YSUTJkE7LRCpDIaDwvzAghqGtIJ/ZHHDq3l7m01PXCR+boJHVdRCiC5WJV/lnVACg3HLsZXafhEyxMFxgTpf9U/DTrQN3eGuILVIUA==
X-Gm-Message-State: AOJu0YxIKZkfiDhN391jmayTxs0RLVCPHsG+iKO7dZsuZ9UHkbz/K9Q1
	6JFHn2uQAEoB+ExM501UvzJHX8IPRbofk1+yOXPb5sgu6o5yHIwD/8FJMf7X7SACL4Qc6fRbDPQ
	Mi5EqOM3EDJGKevax+ZZ8UbbnGfg=
X-Google-Smtp-Source: AGHT+IEkFCsbNLUYqCPBDMMGovH2SszWnW6MECsXIbIlwNX/5XBMF+1TVFDhjaeIlLIA8sbbFeFBvXetlHRDhAvcCZs=
X-Received: by 2002:a19:7702:0:b0:52c:ad70:6feb with SMTP id
 2adb3069b0e04-52cdf355114mr1085376e87.20.1719184573846; Sun, 23 Jun 2024
 16:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-3-14937929f30e@gmail.com> <cd9b5612-1160-4284-be7f-4efbcbbbe346@linaro.org>
 <b9deca88-8e1a-4017-a0fc-6a77672d684d@linaro.org> <CADgMGSs7owyvvvRTr4YvCdmMiJV86CjD5YLsJiBZZONDhfFisQ@mail.gmail.com>
 <ef218f06-283a-4e7b-bafd-382c47248106@linaro.org> <CADgMGSuaKKNgkVjcWA__fJkmeHYXgE47YfObHddp4e-gTH3NEw@mail.gmail.com>
 <f0c3e0f5-e5a3-49e1-8b9c-57fc7af5d71a@linaro.org>
In-Reply-To: <f0c3e0f5-e5a3-49e1-8b9c-57fc7af5d71a@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Mon, 24 Jun 2024 07:16:01 +0800
Message-ID: <CADgMGSsu4FEPHydWu1mj2BaJjt1=7Ws514ig0YH0TbToFhk-0Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.2
 two-phase MIPI CSI-2 DPHY init
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 6:13=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 23/06/2024 22:37, george chan wrote:
> > User-space tool can't tell so I made some guesses.

Sorry for misleading, actually i mean user-space too can't tell the
difference. As all 3 kinds of init sequences are working, I can't get
a strong conclusion of "correct" init sequence between atoll's and
trodger's.

> So how are you testing ?
>
> Libcamera on your target rootfs ?

Yes, a similar test was carried out early days with the "wrong" v1.2.1
init sequence, on pmOS qcam installed into xiaomi redmi note 9 pro
(sm7125). It showed nice output. And I was excited so I took a video
recording too:
https://www.youtube.com/watch?v=3DU_do11pSf1s

After your indication, I replaced the v1.2.1 init sequence with
atoll's and trodger's and carried some simple test with below cmd and
both are outputting files.

media-ctl --reset
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/2592x1944 field:none]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/2592x1944 field:none]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
v4l2-ctl -d /dev/v4l-subdev4 -c test_pattern=3D0
v4l2-ctl -d /dev/v4l-subdev5 -c test_pattern=3D0
v4l2-ctl -d /dev/v4l-subdev6 -c test_pattern=3D0
v4l2-ctl -d /dev/v4l-subdev19 -c test_pattern=3D$1

media-ctl -V '"s5k5e9 13-002d":0[fmt:SRGGB10/2592x1944 field:none]'
media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/2592x1944 field:none]'
media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
yavta -B capture-mplane --capture=3D3 -n 3 -f SRGGB10P -s 2592x1944 /dev/vi=
deo0 -F

As you can see the cmos named s5k5e9. and this time simply do yavta
dump, no pmOS qcam test.

Since this test is carried out in sm7125 SOC, in theory, it is better
to test with sc7180 (less likely form-factor available in the market)
so I will send out v2 with trogdor init sequence for other dev have
sc7180 board to have a test.

Stay tuned.

