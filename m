Return-Path: <linux-media+bounces-15489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FFD93FE79
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 21:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E92191C224A1
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 19:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B78218784F;
	Mon, 29 Jul 2024 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PEWRayr3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293BE15F3EA
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722282406; cv=none; b=SJD6J9768lyGXh1wprwhHjriCvCi7W52lpboaTZbVDvC5VgEMpOBg41QOKr8T5mP2fsa/2sMGwzv6HgXKWm8/gAHrtYHBm4Yu4tSLjP2dc8pngCrqRSGaPYGHPRx7Of0AGce5AfjUZDMpeRNNclc5jsF4q+Hf+lu21uKeQjRat8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722282406; c=relaxed/simple;
	bh=bAMUwMONxK7vDL8NYgIi1xJvEse/Ts3wU8nEzAo/9ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJKBfTK5NQ+oe+PWOPJv6eAKDRBOQzll2siXaxf2Sp284hyndk+TOsOe/ltRKcl8LWHd9RS+5yYjaStgNP09O9MDuWtRYDfETmXfCoeFSetifZt+/+U7DLH9Cmx4OIQbkPBd5spPqxT+sf1xIVo0OTUaGvoTrp+vVX6pU7ffJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PEWRayr3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso50281031fa.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722282403; x=1722887203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAMUwMONxK7vDL8NYgIi1xJvEse/Ts3wU8nEzAo/9ZE=;
        b=PEWRayr3UZqliKnLvDZSsjX7GMtW7ABOMr7bAEqQVyKR4zSxsvgQDoIcEJilng0DI/
         BHCBWXD4CIPl+AEu/CfMZpmsD/nuw1/J+A0Ca3AhjsqB3uBfiV2R2llsPvtaKJf+A7Qe
         mf8UOP5qTTmOctc3tMnTwGMbfxu1Ik6mOqRyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722282403; x=1722887203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAMUwMONxK7vDL8NYgIi1xJvEse/Ts3wU8nEzAo/9ZE=;
        b=GgkpsOcTxVkY8417ugRpwLBtX9yvAaAK3cJvB6r39tkOaYv3rEwH2t7+y/yqRtxlnP
         hSVzuZKvJiOZyAJHkTwkP3QM1vORyRuq4lYjYRGhzkKPRW5k2VLrFfvDaKEuFYck9Tqg
         Cvb3HOZwoN5QfP0MwCzPY3szUyRLrNJuXEB93inKhkvBzoHQVEcMTmpClr4uizN0EWJI
         xMC0g+p8qK9jZ0/ZTqrky+USZj2LrOutxmDftyv04lBJcBuaMroVvUjltFY5stuzA0Qh
         DhKMvcTPGKVCjtidBphH7jE+W4pDu20oQfPl1JX3s9YdwrqHe6qPvZ3Cau27GmUDTTqk
         vE5Q==
X-Gm-Message-State: AOJu0YyTUztrjmD74XkS/RBHd9GIrvlbW2n0vZg0o3z8Q28QpfnL2pc9
	gEoALtcxywAwG4av5dDElDz+uAHcPufdUS+g1vhZe+v1LkJU5lNEA4lf8QCK7Q2IuPep4U1qcQk
	=
X-Google-Smtp-Source: AGHT+IHlH8oykC4juOxGFPwLDrL9shYdfoAjcq6PtF2prJtjAqKsAZN6X1KQ/C51j4RQaQY7KVLsvQ==
X-Received: by 2002:a2e:8908:0:b0:2ef:246a:e253 with SMTP id 38308e7fff4ca-2f12ee24a04mr62772001fa.37.1722282402854;
        Mon, 29 Jul 2024 12:46:42 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac65783561sm6240894a12.92.2024.07.29.12.46.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 12:46:42 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-368584f9e36so1596580f8f.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:46:42 -0700 (PDT)
X-Received: by 2002:adf:f7c1:0:b0:368:48b2:95ec with SMTP id
 ffacd0b85a97d-36b5cecf381mr5932213f8f.1.1722282401744; Mon, 29 Jul 2024
 12:46:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729193219.1260463-1-frkoenig@chromium.org>
In-Reply-To: <20240729193219.1260463-1-frkoenig@chromium.org>
From: Fritz Koenig <frkoenig@chromium.org>
Date: Mon, 29 Jul 2024 12:46:30 -0700
X-Gmail-Original-Message-ID: <CAMfZQbzvaLLTdAo_UW2CPNA1hv+cGtO6DnRb+MFKEpUfV7e7wA@mail.gmail.com>
Message-ID: <CAMfZQbzvaLLTdAo_UW2CPNA1hv+cGtO6DnRb+MFKEpUfV7e7wA@mail.gmail.com>
Subject: Re:
To: Fritz Koenig <frkoenig@chromium.org>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, 
	stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, 
	bryan.odonoghue@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 12:32=E2=80=AFPM Fritz Koenig <frkoenig@chromium.or=
g> wrote:
>
>
> v2:
> - cover letter
> - testing methodology
> - Signed-off-by
>
> V4L2 has support for hierarchical P frames using the
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls. This allows for
> specifing P frame references needed for temporal scalability. Encoding a
> single stream with a single layer allows for the layer to be dropped and
> the stream to be decoded without artifacts.
>
> ChromeOS is planning to use this feature for the L1T2 web standard[1].
> This allows video conferencing apps to encode once for a clients with
> different performance/bandwidth capabilities.
>
> The ChromeOS test framework ("tast") was used to verify that no
> regressions are present. This was done on SC7180 ("trogdor").
>
> Verification of the added controls was done with a bitstream analyser to
> make sure that reference frame management is correct.
>
> [1]: https://www.w3.org/TR/webrtc-svc/#L1T2*
>

I still have plans to use git send-email correctly. Hopefully by the
next patch series.

Sorry for the missing subject, another email has been sent with the
correct subject.
I didn't realize that this had gone through.

