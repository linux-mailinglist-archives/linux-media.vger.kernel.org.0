Return-Path: <linux-media+bounces-37277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 616C2AFFFA7
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 12:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F1651C42F28
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 10:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBFD2DECB4;
	Thu, 10 Jul 2025 10:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bikh/J71"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0152D8385
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752144616; cv=none; b=Od72qJGowAQ22LVksKn2P1dAi7ORMQEIpNqmtT1GRnUhwVYrhiTgSPcxS1gIbxjwuHXdW3pobdKiC8CmRSkz1wQlwHnVNyG2pH7eP0lPvFbYr/dbU+LujeoIgLSTKhy+sfNMr3Wah8XcVE3bN8MNjsur5Pmpeaiodj7CN3nLBMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752144616; c=relaxed/simple;
	bh=0ERYadl4idWZ6bP47UPPD8JzYK00w75uLtXXgxW78Zw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=qy+HAnfnQwdD1EBWZy34/WJcXki87128CjqB4NO/AohN32bZMhcWIPNMo3Ezf9sZK7UyAIUTvxcgPVJtfPvukjmYsot4zsu4DuP3BWuA+aw8KgmfDoxBa74iTBNbzE/uTVoWL7FDsZDjfhGyIfWyuLfCim8T3RfhDd6YCac6wWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bikh/J71; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a4312b4849so10017051cf.1
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752144614; x=1752749414; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0ERYadl4idWZ6bP47UPPD8JzYK00w75uLtXXgxW78Zw=;
        b=bikh/J71j6eMsW2APwhDohhPpOuscG8qYUDYnmS7sDKv5wwPrWvYoGtpFbXrl8cE8c
         9pAos3Ec6TNTD5zZEl5U5qvV2ENIL+hIhOcCH4Ux3Zzz6oLuyP2qFZzunmZdKcFp5W+W
         SVzcRaz36ZgSSpE2GmIH8qWlXKhr20gdn8E26LM44egRxlGLZK2QrXLYC4BEDR2bQVAq
         fNAvHhVI14hJN9JLc+rj/N7K4psXOQi+tjU3ZIxguiR5WWnM6VFFuuF3TCOroxRpWg1u
         1lUE7tZNO9MsbLvFjAZ669ZRNc5Wm7RaNcC3lXlXKsr0xxUjKBlR05qLT4JugTQ2gqJV
         QPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752144614; x=1752749414;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ERYadl4idWZ6bP47UPPD8JzYK00w75uLtXXgxW78Zw=;
        b=eR6NhR11o3vTPTK0P9H/nMUEqmEjQ46KqnkrIIL9j4DuEaz2BziUA0vPor1I4KpKD+
         qhYV323CyV/M1tlB9K+lfW88zWm8dFMInH3arJYK80vyDt4cunA//ImmXq00gGhP3NSm
         d74p+b5HycUHsA8clOaCcwRibm0HRrd0jpA6XkjUW+YX1mTxm8rlguRwx9IQEQRNm5jg
         vl5DNWuIiWwRv/ZdtoBCx1TwZB8oGhf+iT1Bi23vCf+Nt4sbruaiuSdOF7DCzgCM9zqp
         hIxwQjYJ4N3ilxfXHACY1mzDWCkMxwo+xhPb+yjrgtYswMU2yF0zn/h6b47yoOsNw7pw
         SXZA==
X-Gm-Message-State: AOJu0YwODT9l+ix3ddTUbIl81Ny6FPXT3o6n2Zq0QPdk94+ebfogHZze
	sOhydpM9M1zCQ9n+8i8pCWDxFCP6aCL6DtrDfwM2nZGaSBCvKdkwnDCEW8oGhdR0z36mYML3Rsv
	No7tJk508R8j1EM/jS4Rc68LKyM5kBbCTW+Fil40=
X-Gm-Gg: ASbGncvhV0qmSRh7t+AdinK0tZ6qMSKEUVv48txMTMEzKxp+NlPfBucXu3qPvixAhCY
	DE6TQUa5ZxhEC10QkpCXCMcrIu4CBad3DkXG8YWw5yvMWCRlS4p5/62jN1U6+mWwt7Puk1ET/yC
	fltpM2R6CzYCKNj/BsvArBtIbfuwR/z20EgZg5ChLUR10zQycAXDuI7y8=
X-Google-Smtp-Source: AGHT+IGN8RWVfe+GXdUPLcI405BEk9fjpql4NDTHCo3rL4Z9Q5xeRXN/eXZNAoWPFOQVfYrW//TXQS7kaQ9ZKY1KTy4=
X-Received: by 2002:a05:622a:1303:b0:4a6:f492:674f with SMTP id
 d75a77b69052e-4a9ded10402mr88486571cf.41.1752144613463; Thu, 10 Jul 2025
 03:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Samiksha Palav <samiksha.palav27@gmail.com>
Date: Thu, 10 Jul 2025 16:19:59 +0530
X-Gm-Features: Ac12FXyShdPmJnI-bcvx10YNFbw0G0ue1caG-Ky-u_FUVfl5TtXr04IF6REsyek
Message-ID: <CALq_ZGFW2O4Ueo5bAkFsuw4U3t7uqeBqsizFqHDjLaTDEGXLFg@mail.gmail.com>
Subject: Introduction
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I=E2=80=99m Samiksha (a.k.a. Shdwcodr), an undergrad BCA student from India
with a relentless drive to get deep into the Linux kernel. I've
recently begun my journey contributing to the kernel, focusing on
staging drivers, learning the kernel development workflow, and
understanding the culture of patch submission and review.

Over the past few days, I=E2=80=99ve:
- Set up a local kernel build and testing workflow.
- Sent out my first real patch (not a dummy), with more lined up.
- Subscribed to key mailing lists and joined IRC channels to stay in the lo=
op.
- Started tracking patch feedback and diving into
`scripts/checkpatch.pl`, git send-email, and the entire mailing
list-based workflow.

My short-term goal is to get multiple patches accepted into staging by
early 2025, and long-term I=E2=80=99m aiming for the **LFX Kernel Mentorshi=
p
Program in 2026**.

I=E2=80=99ll be lurking, learning, and asking questions when stuck. Thanks =
in
advance to everyone who shares knowledge and guidance =E2=80=94 it means a =
lot
to newcomers like me.

Looking forward to learning from you all and giving back as I grow.

Cheers,
Samiksha (Shdwcodr)

