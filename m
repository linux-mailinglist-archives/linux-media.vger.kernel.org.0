Return-Path: <linux-media+bounces-47457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 421CDC72FC7
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C2F0345919
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 08:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1E030F948;
	Thu, 20 Nov 2025 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzuvCE3z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAB430F93D
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628824; cv=none; b=JIolLLaVWbdEK93UEkRByw2PwQ4gseDvLIyBmJ+Z4d+0GE9TZ+45Gyr8eIk6WED6GRwwXZQSUvZG7WTWzG+urgeQTZPBMDZXbRvqZcqGMNxhIeif1uDxxbDwdjcM5ixuL6iNtV1YRveuWz2KWTy3D0F/9zwzzk1nE4XPuyTNziA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628824; c=relaxed/simple;
	bh=3RtAvB/9Ie1DCuhI1qP/SJsMoGHKx9tVF1JnaInWIaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LV3g1JhjnE/hwgKKr5jXav4mO2X7sMUsuwgbkdXpUQ75M09ju9brHUv7dTMS0IMPf9i6/h5NumobioxSKTwPeS8aksG2hug/kZXBuADV4UYKvGt3t9/DZawjaNgWHrbxjdhmLisfWwWIXh7q9Wm1KG0D/GseEm8uYh3xQGEuQP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzuvCE3z; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b9f1d0126e6so271894a12.1
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 00:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763628822; x=1764233622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RtAvB/9Ie1DCuhI1qP/SJsMoGHKx9tVF1JnaInWIaU=;
        b=XzuvCE3zivvVT9sY3ApGfSA3q42V6rGMBgMbSqp0Fls11jO2QMKJLRT4mEoOw2x1jU
         2jlhDS0P6py50FdMf4dPIVeWORVZ0iojALW6mj9nVoZQtEh20DQuGShGjdsanaTSOTOe
         hRXK6ITmHHcb3BZyLy1OLXMqwJyCFNmaDKPD2UOSgxEF0iOlbBXqTS0AwBPhGFS+m7il
         Lhn1+CMIAJvV9ve1xQQVunkPkAc8iqZo4tbtQSIsbcX1LdAgMAFpO3xbTWP0dLaQ5lH0
         4BOCkvRl5I1FoOhNjf9FcSvC3hMHaKx+a06ZAH9rm4ngxSAKAQ3orSUu3FK0r7kpsZnM
         DmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763628822; x=1764233622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3RtAvB/9Ie1DCuhI1qP/SJsMoGHKx9tVF1JnaInWIaU=;
        b=p/XylpanPDHDBmKcZBPY0WbCPCd04Bpi3wW6lWFmaM1lmUAZVpWQ2UhN6F2Qe4H+uh
         TtSwHyReYzrUX6VNRpsNjUlGbwL/YKLYhg5JMGK6TwZpqZ2DYrLU7SBNcIHZPR3Pf6Od
         a04BX6j0Utg1FTOcNCphe8uZocb4Y6q1liPCmyFdoWbB7jFJMKDr/XgWVs0vbDZX53NW
         cjXswDB1LE+8EQT/TE2ULN2N46ffdkUf0HfhplSTnRBe3d2Iz6MUpVCJzsqy+GOXMnlk
         MtZVY6DOe/F7J4twwDfg9kHoQ59NV9jbHBLwej4huQgNGrEfe74LJuyGqOImIB68Gsg/
         JdBw==
X-Forwarded-Encrypted: i=1; AJvYcCXka6b5xIN8qELirkozlt/7As2Jvcwv3Hot7sF5QpzojCiWmwhSqfRrzibDU5wUVZnQQHsBPRH5T8FhdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpBlQYrwHy028+Ue+FXiLaipEuRfKtAzqwfP26pWYiVEVKnMRe
	rt79s7Ng/QJnLww9e1YwQ1sxnsWwe5AoFlsEhDCp3LUr+2DlYe+cthN/mYu06ClFrPrUh0he0yN
	VGW/AkfjN7gkRB5Vg1lI2Q9e3oF5RhnWcyFk8
X-Gm-Gg: ASbGncucSeA0C6v3dAQe/dcJ3IJ4X3yOiJKksPDXHExt30Sp5jfQOPpbzmMRlLGUWkR
	OsPPLiX2nh33eRXMPLHAVaNi6/BJNMTUL8ak0ZrL8AkrF7nZ9gBze3yimupM8TjOjptR6yPXMRX
	6HFqqjQ+q2z55xx48d9VWdCBj22CRle9pILAuvi9j8MS+lo498uSao8cUg3kmCRmOp+K1adI7Qh
	gZYg/ZwGqC8P6epTFi2za4Q9WbA7jVn6jG782sx+CNWMYmf0DFOO4dOrp1BsshKTIQHwmAqVOWQ
	rjygX9aELPkVrINs6BOdroDraWxbdA==
X-Google-Smtp-Source: AGHT+IEZLRxgqeX1zMPbcTM89f7psvMnTfkXa56MVUNNnlTRlCeRgGGzbUpl3Ua98lZhiMNB0LOg1siz3pl+thP67LQ=
X-Received: by 2002:a17:90a:e7c7:b0:340:6b6f:4bbf with SMTP id
 98e67ed59e1d1-347298dacdcmr2170613a91.18.1763628821957; Thu, 20 Nov 2025
 00:53:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101052651.6197-1-opensource206@gmail.com>
 <959ac74b-a8b7-4d4e-9d34-3b3d971f9f8a@linuxfoundation.org>
 <CAKPKb8-nFzqgh+k3aBxUvZ8g28usiAt5BEdFDQysVnCk3S+sEg@mail.gmail.com>
 <c64985f5-f1e5-4880-876d-0a3c9d83629c@linuxfoundation.org>
 <CAKPKb8830YHuY=h662wPVPvTz3LcyLio6pRDy9ZGStkqwu_Vdg@mail.gmail.com> <3150f8ed-5de4-48fa-a6ac-136b07955235@linuxfoundation.org>
In-Reply-To: <3150f8ed-5de4-48fa-a6ac-136b07955235@linuxfoundation.org>
From: opensource india <opensource206@gmail.com>
Date: Thu, 20 Nov 2025 14:23:23 +0530
X-Gm-Features: AWmQ_blHBmCnyfgAVnD4MxQVnZEstjQKBmzOc7_CIKdoEn69vk-X01a9JOL5FNc
Message-ID: <CAKPKb88jCvkktRqWcmmeH_j5vWXcdB7gvoQ-Pq-G-HeBc=jdXg@mail.gmail.com>
Subject: Re: [PATCH] media: vimc: add RGB/YUV input entity implementation
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Thu, Nov 20, 2025 at 1:35=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>

> Sorry for the delay - these four patches especially this one add
> new features/functionality to to vimc.
>
> These require updates - Documentation/admin-guide/media/vimc.rst
> Please include the documentation patch - please send these as
> series 4 patches + doc patch as a series.
>
> The changes look okay to me.
>
> thanks,
> -- Shuah

Thank you for the review.
i have sent all patches as a series along with documentation changes

https://lore.kernel.org/linux-media/20251120084926.18620-1-opensource206@gm=
ail.com/T/#t

please review

Regards,
Pavan

