Return-Path: <linux-media+bounces-26130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6CBA34EA9
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 20:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 724313AD574
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 19:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E8724BC00;
	Thu, 13 Feb 2025 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQagRKgC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EF824A076;
	Thu, 13 Feb 2025 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476100; cv=none; b=oOkp/ArFX1FjjUG0xaeKdaJFplSaAGmjrrLsXmR/g9bsSRPiOUxbSqp8FdWB3FZ/anWfImGmruxILzXWwCRah0zb5d8bvZKmVb7ckcu132S9VOPeC7Pblj8XSykBjxFdjzCLXe2BqSan3/Ztnktn7xIL7zRxstEc7OmhTV/mAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476100; c=relaxed/simple;
	bh=3DE0Oow5LSSgKdQH0UZt78l1F3EVsTesxe1o9g/oZzM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OMybHj/yVMH/NinKJ0Hb7j4Q+VPB+AswIJ+zVBlpF3Bkoznjhn2BaPylJ3nzHYx3XxXW8i/47CuFQf6ciiWEku+QfwNZ3H1ZkvTd11VIiX5MVDlhqqFFQAC+K9lfBMwXD4Fpo9cs7g1o0BXXlD4HZixH+GTZFTpJppfs2oyY6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQagRKgC; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e44cb7adeeso2038036d6.0;
        Thu, 13 Feb 2025 11:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739476098; x=1740080898; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3DE0Oow5LSSgKdQH0UZt78l1F3EVsTesxe1o9g/oZzM=;
        b=SQagRKgC37Erf68uZH4z+eNqbd/F6iXk685ps7q+iyMAbYDyYoY5YNZ2ryNlhKvOZZ
         MHiba2tQjAwFMVEtO0pZ2UgNStSAZQkz9jvgDodaknXEggGNR5lUy/G/BuKCKjH2iFjx
         Oo8JLXPhiHE6L9sisTmKnxPTkhZkwp8jKU5aMQjuxp3oDORgA4lsVt96DbgAuEq6+/ZV
         2ZoCxVlSZ4WIglOW+Pe/Vf/tGRmBZ2ix1iI3JhmFsbTANnKRBPnOtkFE9Ja29C9lA8e1
         fgU8wavH1lEVYF0UlNVopLEpJllADPmbuTdBnf/0UmUCqU8C3xaCjm3Fz8fgK2pJSDFg
         4a9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739476098; x=1740080898;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3DE0Oow5LSSgKdQH0UZt78l1F3EVsTesxe1o9g/oZzM=;
        b=ElTkTVaPWfOc8Hsotj1H5a9yIc+FB1udDtZc5Sjwv7ccGfLM9DyIS10xg9CgQrtAFx
         ghvlJCnA0Os/8cPmx0MGh0UOap2OrB+ryGrrsu4mnTdY70QAp9T5j31an5uVVpDNZkPJ
         9m+V/Zcwyz0Jk5XKwFP6OJYHHTnGyOWMjDz8l0eVljmZFFGod/1Ei15Dwwp7l6rqjcJl
         MfLf/5p/KivIFTiS9zsMB1GUXSQ9dyUZuLkfLGJ+flw+ZRnWZef7Yqu1nPyxkJbtZ42M
         ziukP1cUlXdZ1I54XCWPKo/PNnCA8V9Ri0wXITxRSddOKe+97/qudLkSApjE0iWw/qMl
         ITpA==
X-Forwarded-Encrypted: i=1; AJvYcCUD1VZJOshdp1ErZkKHd+oZtukY+ggPCrnbl5xSjt+c5YBlICM5B299h+v3Z37e/gNaEr00xmWp2VrFXwU=@vger.kernel.org, AJvYcCW52+KNrAmkr197+8/OOhroK7YOxLAz5hh4Pt6YBecu2KC3839YDBTi1fPlzWUNcoZ7/MTr3Mv+zx13N3c2@vger.kernel.org, AJvYcCX0n3ndjSZZXI0SQLi4doUGDdzAOFNwRZGmYBzOjO3hLofBftntz1Sv2F6EmeaVavMi1FmJvV0iCnhb@vger.kernel.org
X-Gm-Message-State: AOJu0YyKUPc2nUj0HAspSCIHX42nbbcmwQfPQj8nuNTZSPaqeVL7XaGR
	Gc4HBxCqMx/iRSmKDdHXK8+o7RtGVXnXq0i1GlILwGO1bQkA96Out1wArIoy
X-Gm-Gg: ASbGncti8PESh0IaA5JJBCd6DTpzEfseVBsEhWjPJcAtC0kTbrLjAW1todTiLbHQuu+
	FblwSftmOvs0MdIra1gjfgT+UNQR+dgZLTJtPVaEzS4Rcs05/gU5D2wBxYglyYfYsQzrEJk5xm2
	zwIlZhCmoV4WTKkbN/vdtCu6X+yOHigZVzoOxRzSiexBQAIiK85R+SZCXzq5iTzRW1mNt6G9g4Y
	Hd8GIzlKULryP3UvU/6ljVEdajW8bcqbtG67FEqesLdRkMWYmZdBQIzcCT54I2sdgpGLjXBhFoT
	zSKv3ntqylR7h4TsFT9pZGe/CmXIqAoInR2p96bDS8SSvgK7MjAoi5niwf/f830XjzW4yJ4=
X-Google-Smtp-Source: AGHT+IHp9GzUUXSp5ry9ZFQa8Y0j46zUpIFKRjQoHWRsRwYI3qfYVnjr8wQ8EdKvyDwXAaRm8t1PcA==
X-Received: by 2002:ad4:5d49:0:b0:6d8:f750:b2f1 with SMTP id 6a1803df08f44-6e66521c4cfmr851286d6.11.1739476097859;
        Thu, 13 Feb 2025 11:48:17 -0800 (PST)
Received: from ?IPv6:2600:1002:a012:94a2:8c01:f07b:dda3:f9c3? ([2600:1002:a012:94a2:8c01:f07b:dda3:f9c3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d9f5c9fsm12902356d6.83.2025.02.13.11.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 11:48:17 -0800 (PST)
Message-ID: <4f947fcb44be348830772a5d774bda81fdcabc6f.camel@gmail.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add dt bindings for
 m2m-deinterlace device
From: Matthew Majewski <mattwmajewski@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Uwe Kleine-Konig	
 <u.kleine-koenig@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
  "Dr. David Alan Gilbert"	 <linux@treblig.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, 	linux-media@vger.kernel.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, 	linux-kernel@vger.kernel.org, Andrzej Pietrasiewicz
 <andrzejtp2010@gmail.com>, 	devicetree@vger.kernel.org, Hans Verkuil
 <hverkuil@xs4all.nl>
Date: Thu, 13 Feb 2025 14:48:15 -0500
In-Reply-To: <173938841678.103791.15257194096562741977.robh@kernel.org>
References: <20250212170901.3881838-1-mattwmajewski@gmail.com>
	 <20250212170901.3881838-2-mattwmajewski@gmail.com>
	 <173938841678.103791.15257194096562741977.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rob, thanks for the feedback.=20

On Wed, 2025-02-12 at 13:26 -0600, Rob Herring (Arm) wrote:
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
>=20

Yup, I missed a yaml syntax error and didn't notice because I was
missing yamllint and dt_binding_check came back ok. Will fix for V2...
thanks again.=20

Best,
Matthew

