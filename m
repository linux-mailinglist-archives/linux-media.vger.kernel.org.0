Return-Path: <linux-media+bounces-38033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AEDB09337
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 19:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 296091C21659
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 17:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83A02FD5B8;
	Thu, 17 Jul 2025 17:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l3qHafd1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7B11E1DE9
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752773427; cv=none; b=h3iHeyFsSCEXFHEAXxocplfz53xnjywd/SsSgI3pFo9p0oNMymwG89213ZPPJgU5Uvk/HJC+lR0G+sLp64V6Jx5gyu+Wwke2CDJrNFqUiMfs60WGvG/gg5k1iSyuCCoATni3RwEuPOlvRjDAMPi2zwQZap0R4f1l0X7EFQVUsJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752773427; c=relaxed/simple;
	bh=JKjRwXSk+n3fULz3HfC/S/FuujYoH9be5UegpJrceJg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ooHqltAzRePekiDY63MR7fCTNbyN7Tem/FulXxnK/t2AtEJasJFiOCIYspTFpw8t0DQQlWAiQrw9Uv+pWl0Sg00b3KQ9AtQXfwflGIZOs871KgSq38ECIW7vfp9hpW7mL85NAW0IoYetjALNUt3RCX0OJWAcWPG1eMKEpLra0lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l3qHafd1; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso42641cf.0
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 10:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752773424; x=1753378224; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JKjRwXSk+n3fULz3HfC/S/FuujYoH9be5UegpJrceJg=;
        b=l3qHafd1P5cwUSLolOCzzU7J+wIt6xwjwLwMzzqZM26nDXxJ5Ahgy8z8GjauebPeYR
         V+h9HBSl05AWeT6EcWFBWacJHiGVndiJqtMqe+U2F0o0c4rmsSsrg439TdhrgCn2ngtc
         X83I8jt4VigHpGY2y9mEodUkDteCJUYPbHZXacSesDYcW5mVeNjQEVkeN5dQmkAXT2re
         SC3On2aiqnRY6EXRtBG82HIeU2lOERiRcibcTTZ7G+Qcr7iNmq3TmL/FcTtTQlCQZ4FD
         0vEqqS5ZAiDS1JOHfAE6FxozDovzxwTZUFf4J0j466l4eGxIER5GOfx83a5+/8Ww43Kn
         47dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752773424; x=1753378224;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKjRwXSk+n3fULz3HfC/S/FuujYoH9be5UegpJrceJg=;
        b=lFg1/dUSrLYGQQKNy7bA3iGZKq+ybhvACjYAjaUem+1fhT5RPEa71T5CVXul2SaP1L
         F411sSqktUHNJ3NlKywkwACF9D4ZCx/MJux1ircV/d7iAVcTtoB/jhlrArQAxrqOgnzk
         IfxahSsf3gJ2osvkbD9LEqNYkHrXpQSpYJNdCdIEAYgbrTvxOf/4etozZZTM7WcJ4L6C
         JauP5qylxV2bKbn4Pd9vHWaFSXhExJ5betFLFQKIeg0d9smZy6FX+n5k+7r5FUIsAzqi
         Rq7icO1e2/jEEo6Klq1xdcXh6Xk5JJCOSilEGoTzqBfHqDilVMJywdMXknJ3wkRsKW1D
         ta3A==
X-Gm-Message-State: AOJu0Yx4dJT7EQ3/Ds5M2i1CKFliMrV1CYNTIu+oVyCiUDjQib3ZE4xn
	kUxc2JDt95UH7ycg04jURGHkG/4JoTYAf0WCuuGrM8n4lZ2ywcEj/StKHhcszQPMfF4MlkMRSkw
	E9U3PGcaGEJBMFvY1q/ro9OkqA7j/YBiodgD9Q7voU+OOd9cry69F0WI+HZ8=
X-Gm-Gg: ASbGncuO6sELKxBspXr/OJGGeRlKwkhMV0pTtRsd12o3zoAXGi8/DUom3ngRZ8e+zh0
	SLLhJCLg9tsNeJE1QFiPmQiXZQrXeNtw6YtW8zYHHx8zuhgtlu2O7ANEO7yooKK8IFvf/UvPWyx
	rnY9AxFzrQiE5fUR0N4ws2JT1o+cv7XqDa14vFUp2q8feVa3Fqf0zmcJXeDzdCUlD4lQmlb2ovs
	28uQzi4qjdIT7au5/Ok1mnhkv3C6B2EKDPgTQ==
X-Google-Smtp-Source: AGHT+IEWCT+AjEJ2vAxPOVhGD6B7Hyur6a9lWc9T+2fh7m/dDTuCCj9LYscmZCOph67yBe5rqD66g8o065TrnwBhpbI=
X-Received: by 2002:a05:622a:292:b0:494:b833:aa42 with SMTP id
 d75a77b69052e-4abb13014e0mr590341cf.5.1752773423728; Thu, 17 Jul 2025
 10:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sharjeel Khan <sharjeelkhan@google.com>
Date: Thu, 17 Jul 2025 10:30:13 -0700
X-Gm-Features: Ac12FXxHjLpQ2Kz6GcGqDLfPTRcnhTK-d69SXXTk7LzzEKqit1Bbif-1s2EBOkc
Message-ID: <CALPBKXJXg4R4jm_RZ2QDnQuOf_hGwJRQ8L=1H-nthuDHaJMq+Q@mail.gmail.com>
Subject: [Bug] v4l: _LIBCPP_FALLTHROUGH() does not exist in Clang anymore
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Clang has inlined all its uses of _LIBCPP_FALLTHROUGH() and removed
this macro. This causes compilation failures because
https://git.linuxtv.org/v4l-utils.git/tree/include/compiler.h needs
_LIBCPP_FALLTHROUGH(). I am trying to figure out who to contact so
they can fix this issue in v4l-utils. If someone knows, can they add
them to this thread or direct me to them so I can get this fixed? We
use v4l-utils in Android so we want to fix it upstream and just pull
down the change.

Regards,
Sharjeel Khan

