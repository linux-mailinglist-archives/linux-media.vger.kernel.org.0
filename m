Return-Path: <linux-media+bounces-21862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 623CC9D6BA0
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 22:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 279CB2818D7
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 21:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7488C1A724C;
	Sat, 23 Nov 2024 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9Uwijgt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7912C433AB;
	Sat, 23 Nov 2024 21:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732397384; cv=none; b=OFz8cmuEwkJVUfLzHKydKck20uG23PPxqPfS3G5XHpi/6SS6vJFB4/JW6+ge1oLcvlHMqbirVdp+RCSChlMSRHHvjqWhWIupzrDDLmQuVb4MxxukUJcQoJRlh38XSTrv3wn9l0i7YZh8YoavoHrF73i4Jd70vpIBg0LkXILVfy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732397384; c=relaxed/simple;
	bh=DB7nnWCKsMFWTerzpr6QJaMOAc7yCGcxm3dV8KoxbKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J95SLL35lnAZrV1NxyWFrug7ENjibgmm1WCsVK9Wez/zp5ZtGLjcptHRpL9ieAl9ks0bbDQ48b30qFGmkT88wSPYNaAtc7OiNaTYrlLEP+ayBShIQorZBNAeisdy5dwc6uwDxXqw8Wuha+iO/pWngS5/zaky60oWa1cf3sO3q+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9Uwijgt; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4613162181dso22385691cf.3;
        Sat, 23 Nov 2024 13:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732397382; x=1733002182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DB7nnWCKsMFWTerzpr6QJaMOAc7yCGcxm3dV8KoxbKY=;
        b=Z9UwijgtGNMQuctNU9fStULexLGG4miSGbcifNETKzBbxm+jiGIiFFph7TwtrcSaMq
         CLVrYQCDTrH7WnrxXvvsuIXkPimD2Qx9XXpGohftrsshu/5QFSZzgMoMAnBYP9pMWzXW
         0w7ZHbnvQzgDiQ6pFdyziaQNCE8dcZHrioMizU7Nv6GPneF7BUVIILwmuRnH822sxZbE
         VYs0jsvY5l3pdQyMd6JQI4K/mbHNuq00ZrWuTiCJuNRp45g6BhaZ0II0i5zlZ9KBBHMu
         DAdC40OG7/t6K2QD1oMxLNqnEN38nEvHA+6eeMGJEVvvtTtjtjaBy42kR1Rc3EboeknF
         nfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732397382; x=1733002182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DB7nnWCKsMFWTerzpr6QJaMOAc7yCGcxm3dV8KoxbKY=;
        b=oVc0s1SA6HXXTBVpXw6pCosOi51haJ1PfgWcyksaheb3tP+KEd8F+QeSY1llpdefTF
         REaGRo7mXaqJavSkmWRCisoMo0CYXcdhNB4wCYPXf5QX3A4rT28HrkgvCEU/LfqNMckM
         YaZiOIQrk7j55lCJgiuPmm8nOoHs6nnPJFpMY1n7hA3iqD/3RriIr7pPKeoOZXO2Vtj+
         4C6zfIw8Ab3PSFVxn++4DcUpYu0HogAS3k6h711SQ8zp62mvdQHNO+JkJsrQ7xYhCcjm
         Hz8BW/LeMc531SSK5sH6dSu0hGFEg+R1pvdHxvWRMF4sbNmRWRNatYjFiNcs0+EUQJhQ
         xupA==
X-Forwarded-Encrypted: i=1; AJvYcCUpbnLR/Ufu4n3Hdc9G7P5iL/RdCnah688URBDoiq5FvodRcIxvHPGjjXkLP8k5E6ZB+bSG5f3dOQ65SLY=@vger.kernel.org, AJvYcCVK83Rq2kXdU84wItcgoXv+yygVk10GAj7SU0tklh32Vlew8b1Gn+6qOEm6Qt3/mNzYDyf60roeJAabef0=@vger.kernel.org, AJvYcCXZVZ0fhClvcTKp3CwW2hITuQp5g94YVyrHjOZrvuP7PyeS0Babss/5vt3CMrZY6+ts8gbREwPMagS2TsVAWkFhkLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGA7bq7vHaeYLEg2hZoIOnuWuD0NWEWFFfUOzRA7tFmh7aEvwC
	jfcjp2EpGfa3hrXVPYIebGg4NcrRhwdcqyyQeGYN0wJnCQntHBGDg1RgRHQf+uQyrD0m2OR6iZJ
	CiFANyvSx/4Qq+G7nnC/Rg8H/iV8=
X-Gm-Gg: ASbGncsDVL/BKWoKclG9SKUoCFeHaUpLc1EwEEeOg+1rk31+0/pHFRaW4I2mPdgcDcE
	+Q+IJ/KnJB8Cw89qOEj7TvaayoYNh3Saz
X-Google-Smtp-Source: AGHT+IEA76ZpKgi2eLgk5L/F49d3SvHcOZynSb8ygkt+A49styussht5Zo10bCs6LSkaAqL9D7Rs3qwYk9xShqT3i/A=
X-Received: by 2002:a05:622a:1817:b0:460:90aa:ba8e with SMTP id
 d75a77b69052e-4653d63ec53mr115824521cf.52.1732397382353; Sat, 23 Nov 2024
 13:29:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122221348.3998-1-jiashengjiangcool@gmail.com> <a664ae24-26a7-42bd-98e2-f46d7e475b9a@kernel.org>
In-Reply-To: <a664ae24-26a7-42bd-98e2-f46d7e475b9a@kernel.org>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Sat, 23 Nov 2024 16:29:31 -0500
Message-ID: <CANeGvZX0rAv-iMU1fUTzBazXfMLN4AKF+YJTbXTRd6vxsKMnjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: camif-core: Add check for clk_enable()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sylvester.nawrocki@gmail.com, mchehab@kernel.org, dron0gus@gmail.com, 
	tomasz.figa@gmail.com, alim.akhtar@samsung.com, kyungmin.park@samsung.com, 
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sat, Nov 23, 2024 at 11:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 22/11/2024 23:13, Jiasheng Jiang wrote:
> > Add check for the return value of clk_enable() to gurantee the success.
> >
> > Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC s=
eries camera interface")
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> Please version your patches correctly, e.g. use b4 or git format-patch
> -vX, and add changelog in cover letter or under '---' of individual
> patches describing changes from previous version.

Thanks for your correction.
I have corrected the errors in the Changelog and resent the patch.

-Jiasheng

