Return-Path: <linux-media+bounces-3143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 106D4821603
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 01:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DCA22819DB
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 00:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9AE393;
	Tue,  2 Jan 2024 00:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHKgjTl2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A4036F
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 00:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-680b69b1cd9so5102256d6.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jan 2024 16:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704155077; x=1704759877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaiJZ+1PQv7/0mpttSPKEm/AJHOOv4npbJUTIzhsZ6M=;
        b=iHKgjTl2D5ky1kY3qGfUssCjAQj5XVGDlwxZNVGwQXIFWYU59VPXnHjohk4aXBActk
         kCscowRDf/s5rcSKgSRBXo5LD6s7X89KRqzWlqSo6kaniG3Hyolc+7kGlL+4HGxt8Mnf
         9GsDMRDbhxAtu/7K6dm3xpaiwlEpFwP9JdEX/OZj7kGCgobW4+yPwgPE6E0CoFWRFk9u
         zs5nePs3nwt6uw2Cb0cr9nu7c4zZf7BehU9rbAORTQb85gv7u1yg5x+ennbuss/lgQ5Y
         diLbz5RyCwCK/GqiZ86fM8PrrNFccouUR5SaCmOMAtbMt/QYOUD+K/4HWLOqq1tuY3SP
         1QvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704155077; x=1704759877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaiJZ+1PQv7/0mpttSPKEm/AJHOOv4npbJUTIzhsZ6M=;
        b=rCsn4woTCCiJ0bElLWXMoABR51CU9rsXhv47bld4UFPEAP/IVHroq0sUUIam2tUUFd
         hjTWOe3+xCvw8vbb6vQJTotmsE6F9OlPkXF/r1wT5YXOqF6KDmzGtENTVk+9hjcSyj7/
         dQcu+IrAuhMdtSUIFm1USBOgOKW0FSIS2bHL+ul8wt+kTSQ4vlsSH78ZwSQ6KAp4Rcnz
         38PFGQqulCkO/KYnAG4Q796UZY1g4LNYplXcggAff8+bX+2GuhGcHOn7c3IB40x+VZea
         /Q0IvBupP9NBlopz4jF13pfjcXEuiRTS4mAX2QBsotSzEkUKGFQWsdXeMzzN8lM7tKji
         CX0g==
X-Gm-Message-State: AOJu0Yxr1nCdXwV5hsHa+T/DPJpsGm+N0P4hpsSgAB0MwYHB8dqCmoZF
	DIt6k40fe8wWQaMWEYY4KFrP1Xn58cyx2T5D+38=
X-Google-Smtp-Source: AGHT+IFE+JgRxFRrVoBhgU+q+r4F6gOKuEZGzUpjJOp9I2bXEX/2SzpfsCKxNGlpYDZZhAmEqyfJDTmovbg0c3T1DAo=
X-Received: by 2002:a05:6214:d6a:b0:680:c0b2:8cde with SMTP id
 10-20020a0562140d6a00b00680c0b28cdemr634688qvs.50.1704155076874; Mon, 01 Jan
 2024 16:24:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-8-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-8-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:24:00 +0200
Message-ID: <CAHp75Vd2cNid4_oxQ88uRAGEnbrwEC_bUq6hqpcrB3vz=5kxPQ@mail.gmail.com>
Subject: Re: [PATCH 07/15] media: atomisp: Fix probe error-exit path
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:

...

> -Remove the unnecessary pcim_iounmap_regions() those are devm managed
>  so they will get cleaned up automatically on an error exit from probe()

Yeah, yeah, but to eliminate unneeded churn in your series, please, do
this early enough (before previous patch).

--=20
With Best Regards,
Andy Shevchenko

