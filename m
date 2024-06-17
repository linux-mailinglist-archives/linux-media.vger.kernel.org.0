Return-Path: <linux-media+bounces-13440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF4990B2DC
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D59BB1F29643
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 14:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE681D9526;
	Mon, 17 Jun 2024 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="lEvV3meb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAC81D9519
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632338; cv=none; b=AlU56twC5aGHAboBwl4sdb6iDVA9roIcxTA3WNYElrzJcH4x4WiNqnrC5jkJrwofMUp1SaeavT2rrzM3g/UTEVj8zFQuEGuHo95PkG6O6Ch1nVqIAktWXfy+czG7usMEtxBwtnp151KPYDQDwCWeq3g4E34Rh8rfcIUOX6f0vXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632338; c=relaxed/simple;
	bh=S8oKg7qQ4NYsaNZMwjpwaY5Zq6XvOvJgc9CYYY9wH1A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cYM2Y0YDUavDL8fDCmYK1d/NxqOrQgJltCvCnvVbbhEhEczB4P7DjMP7uGuvkfwpnfenZ9V7cKCwR1q+X+7L7od/F0CMXvMTBvKfSPWjPd0a7gnA5hKN3wDj0GmoAS3Jk6v1XRZgjjq4+ZyQfSIm6At3RIdLzgWL/KKvXRCwtfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=lEvV3meb; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7955f3d4516so482041485a.1
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718632335; x=1719237135; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S8oKg7qQ4NYsaNZMwjpwaY5Zq6XvOvJgc9CYYY9wH1A=;
        b=lEvV3mebfEO3FD7axeFcfwhTCtIJJZ93CqloY96XiuKPGqh5vcVw2xjnmzhbR5jtIF
         vl+9ICZfgIi/FHoWFSI9cxAWCLlJYar0Ufy1Yys2Ui9nbaVYjNKpjIZelhziFhlyv/on
         O3vacTzDAsUFmksTvh4M1zgyAyV9bzjnzdEMJpOVAWEWihYN7Oa0ggvmU7rqsSYct8us
         P3Jd0LoWKGycHLrR7EulrfS3GDW967APq9Ol16QrVnesDXkRhYHlu9chBZy0wxuuS/4k
         J1W8NZMFy//qFuUu7Sk9X8ptF+O/xW9Tpu04gSefAKSLFnM+qr0Rq0Pbrcixb8J6VLEk
         28zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632335; x=1719237135;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8oKg7qQ4NYsaNZMwjpwaY5Zq6XvOvJgc9CYYY9wH1A=;
        b=WofoKd07yc2pPr8oAo1yTzkD07mCcYziN2VkmmDatZqHaFSWuPCZ8R6O/Qo8px25Np
         PFAY/0BNMToXn+Cy+M1E3MF/zRMHJQF8G0oAbc1tQ9hMVtaK8HOe1kb2oZQ6+jm6GxV0
         U5TKPENbaEsX97RoFhjVY+NXgE6cPZtKjz6lAC8HCIeRy7vHYwecOoqE9+hIoSgdDUUQ
         FqoBOctTFVwzGjbnbZStdvMQO55JhBG/zYrVM1jjpZWW0AwizTuVw3F8F8sHYHeRwTgs
         8BJlRnxrmRoKebVnK0d/3QkTsSXzFReCf44XtEw+cup5f1usBesuiT3RRnJlznDfooyH
         joyg==
X-Forwarded-Encrypted: i=1; AJvYcCVko8XOao1bu9P2jzZYl5HWpLWW/noyQDzrYOIqcl6maXHfm7C5thv24NJUQgPq6YaCF/6Fp3gn7tUtKRfCFjK+V0h3kMZsT+KlFlQ=
X-Gm-Message-State: AOJu0Yyjz75vX6QWO7ru3ZYKUHqmt4gKHrc2mSgHLLnUgW/Wna0iwT8Z
	0hBhHcNg/+K/wVbLgQ9LT522+a3eNFvOIcG9nunug5SKxC6Bt8+exF+rWuHLzzc=
X-Google-Smtp-Source: AGHT+IGyIko1VGBafHP2QtDzGF8rEqYm+Kn5JkvhSCEhEsxF7IzDWjF9X3Q8Mr2an8LHTllmb6fjkQ==
X-Received: by 2002:a05:620a:19a6:b0:795:e9cd:f5b8 with SMTP id af79cd13be357-79810103ab8mr2338158885a.23.1718632335615;
        Mon, 17 Jun 2024 06:52:15 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:57da::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc02f68sm431571485a.86.2024.06.17.06.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:52:15 -0700 (PDT)
Message-ID: <eb36cf0fef6208e2842c41517579066109530b28.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <didi.debian@cknow.org>, linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Sebastian Reichel
 <sebastian.reichel@collabora.com>, Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov <alchark@gmail.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,  Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev
Date: Mon, 17 Jun 2024 09:52:14 -0400
In-Reply-To: <5087685.q4sLEYJVHI@bagend>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
	 <3333233.eAoTOS8U2s@bagend> <5969581.LvFx2qVVIh@arisu>
	 <5087685.q4sLEYJVHI@bagend>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le dimanche 16 juin 2024 =C3=A0 10:40 +0200, Diederik de Haas a =C3=A9crit=
=C2=A0:
> On Saturday, 15 June 2024 21:44:32 CEST Detlev Casanova wrote:
> > > So is this just an (unfortunate) use of the same words or is that wik=
i
> > > page just wrong ... or better yet: does rkvdec2 support RK356x too?
> >=20
> > Yes, the vdpu34x decoder on rk356x socs should be supported by this dri=
ver
> > but I don't have boards to test that unfortunately.
> >=20
> > This might also be used on future rockchip releases like the rk3576. Bu=
t
> > they all have their own adaptations. If you can test it on rk3568 based
> > hardware, I'll happily add a compatible for it.
>=20
> It would be great if you'd add a compatible for it.
> I don't have rk3568 based HW, but I do have rk3566 based HW and AFAIK tho=
se=20
> are the same when it comes to the 'video' stuff.

Our usual approach is to require at least a "Test-by:" to include patches
written without HW. I think it will come soon enough, and we can focus on
getting the driver in at this moment.

Nicolas


