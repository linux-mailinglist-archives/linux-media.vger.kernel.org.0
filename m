Return-Path: <linux-media+bounces-22712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F749E56A0
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 14:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6D9C285B27
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 13:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5A021C9E2;
	Thu,  5 Dec 2024 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ICrwAPuZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A81218ACC
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733404905; cv=none; b=U7O0Zo5IS9+JfrRNSZ3LKnvE6QeH63E4sacpxWRXPFrj2ZEt78ulMTT58Kd0hGQ0l9P2YVUyAn/AFddJnOerhW6z04QZ+DG1l1Z8yorL9/n/fpaOV0XxSGIqugeefCSSmm2gKjkr0H8BtcxaNetgsZjP/KW4+rvySEJM1S67xeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733404905; c=relaxed/simple;
	bh=v2mz0y6wBbrJpge0WuxLD/Robz22RfFPETb5zCMYqGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQDr6Bs/rvQ/BY9Y1vp8jhqmhiyF53c0x6kc41RQw4RK29tQ82NFhjG90X5K3Rz1SQ+Ge9JdDadvcqm8ZhNy+KolE1bhvn4nHSUGL8zdXNfQVZDZCpxbGuH0T5F5utP06cLki5iKs+xMKF/vkDvojQJvCPEFMobw+Y8BF9+/q54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ICrwAPuZ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-724fc1aaa91so935044b3a.3
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 05:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733404902; x=1734009702; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v2mz0y6wBbrJpge0WuxLD/Robz22RfFPETb5zCMYqGA=;
        b=ICrwAPuZqFAIzbG0Da6qTpgYM1TYsPn9YgC7Te8Iaw+b+zFGVyUkUFToCoKRGnytih
         fiHR6Tt6qlCc+1Ob7y/IPf6ldlXRGQR16IJgi3oEjteEQClONtxpzgVhAKeHMlxNg0e6
         BtC47iAlLhEjSWnwW6USJckVZ8RpQG7MRP6ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733404902; x=1734009702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2mz0y6wBbrJpge0WuxLD/Robz22RfFPETb5zCMYqGA=;
        b=iKxET/2bDMRAnUmnLNR0jJmoWwAfFjN1CDf9HaENDqAZH37mI7gY6Y3BavFMgV0giI
         CPTrRZgyCPo+T6Xax0f+GpWJ610DB4OP+PYGmgPI5Ay5DEu+qnAAn4BkGT21CgVb59NZ
         8hT2/4U7SlZ0rbMUXTreIrAHridXGFWFPrazo2OiP9Md7T0o4TiJgt8NsGi/t4HnLWz7
         NyA/daTq3f43vOlyDbuR/6+ighO8raZ1TXgUN0wpDrHxyR7IOVZyEWhC+KXEkFO1R46P
         NvOOCRGehOsAnuKoEJMAxfk4gE+RbVysICvKnUDkhrkh5ELjxH5zhf+4MTdK64txMEjZ
         vuew==
X-Forwarded-Encrypted: i=1; AJvYcCUi/V5QOP/I33fY7X9sa5hhCRqzxFbp56KuQux9NE0bArUJ1eGfuFairW4+Q0jGPz+BddzZhpgYyBDbug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO7Psdvf8nOTOFh5BM3y/RYI5mxV9vEgTtxTwqP2WpeZvNqZYm
	I414k9v8PHu7J8UyPDaXgRXmKjQHSjROM5E3vBmp47QhGMQq8j7VtZi3aqL/BGkE6/wTayKiybo
	=
X-Gm-Gg: ASbGncsunXQUXOBnDu3DbghnHmUdT3MCHwjATeK898BaxXci7Uvf68Myf9Y+u5C+Wqb
	5Ab9URdMETiMeJ2JHy1Qx9r6XvGBs+FNAuNWU+t84DaQJBwQDG7LZOSGf7sB/FOc4BbnvMHCaRy
	3Vix3HQLx5bsEcqPBswSUbEged/kTrUt2cA8qDwVNmxJjgATAV9SeFz2ak9tq4fxUxYDjdLUyp8
	UZzBRz4NQYkZedNFKxXOL82mbhGwPHf0zkGaHmgCB8MS0MCVhSpcPMGHRXxVhUAQC2bFKIQWQEU
	xc+ezdZmUMU0IlEf
X-Google-Smtp-Source: AGHT+IFSNm3r9jiRFjGO7GpyFgLPHxsIzii8I40jwPzZs0WLNorH8ZeC85Rk/PMXv/FB/XXRAJi7Dg==
X-Received: by 2002:a05:6a00:2d1c:b0:725:9d1d:3462 with SMTP id d2e1a72fcca58-7259d1d4e90mr5272893b3a.25.1733404902481;
        Thu, 05 Dec 2024 05:21:42 -0800 (PST)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com. [209.85.210.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2a90542sm1241289b3a.106.2024.12.05.05.21.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 05:21:41 -0800 (PST)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-724fc1aaa91so934991b3a.3
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 05:21:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtpUVJtT0scoCB+19MPVBoNA/yXgvOJ8+D/ny6BI+E4UckBKCAyfSpqClozgFA9o47ldobyrsmvnNKNw==@vger.kernel.org
X-Received: by 2002:a17:90b:3e82:b0:2ef:31a9:95af with SMTP id
 98e67ed59e1d1-2ef31a99a8emr7520588a91.27.1733404900918; Thu, 05 Dec 2024
 05:21:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204193935.GE10736@pendragon.ideasonboard.com>
In-Reply-To: <20241204193935.GE10736@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 5 Dec 2024 14:21:28 +0100
X-Gmail-Original-Message-ID: <CANiDSCsj7e5G4e4cH=S=yk4kh=SS=Bvojfs76TWtRzkbMDdizw@mail.gmail.com>
Message-ID: <CANiDSCsj7e5G4e4cH=S=yk4kh=SS=Bvojfs76TWtRzkbMDdizw@mail.gmail.com>
Subject: Re: [GIT PULL FOR v6.14] rkisp1 miscellaneous changes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Dec 2024 at 20:39, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hans, Mauro,
>
> Ricardo asked for a pull request that can stay on the list for a week
> before being processed (I assume for CI testing purpose), so here's one.
> It's a real pull request, but it doesn't need to be merged urgently (as
> long as it makes it to v6.14).

Thank you so much Laurent. I am done with the development.

Mauro, Hans feel free to apply it when it works for you!

Regards

