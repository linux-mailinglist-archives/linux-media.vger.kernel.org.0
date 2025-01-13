Return-Path: <linux-media+bounces-24705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF694A0C298
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 21:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AACF3A2837
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 20:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFECA1CEEB4;
	Mon, 13 Jan 2025 20:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuquwfS6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60581B422D
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 20:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736800152; cv=none; b=hkdRSrRlQ9D/FyfdXmTXvotECO+CawBwNJPci4tHPyfGkyhZP248+oqQXTxmjIluQZg0aQuB3QQ1+jj7g1VTTQQWxAcsI3av2e0m7e9dJrUDdb/DegS0ZxeOq0N1Uym+B8A/5jPCbsWObFWdjbj4rpksi1U5/BDBZ447cbGUbE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736800152; c=relaxed/simple;
	bh=f4hNf2173wfLEMxtIg97FEzD0ppVHlHvRseXpyFwI28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1B3HACrdH4MsfjamEAUAK0SaxA5uDml3CGiGgpBIuP+9E8ixrhm6j0sjhuHZGV458nFW2b9VwqiuuyrFbo0Xv2EGgTwtb8Zi9L8s3aOf7G3+GzZMKrl2JlUT8jd9oZzqPYGW5qAsL7KHzSuyKFYWhBMWyD0MUOog7loJU2d0n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuquwfS6; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30613802a6bso23081591fa.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 12:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736800149; x=1737404949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4hNf2173wfLEMxtIg97FEzD0ppVHlHvRseXpyFwI28=;
        b=PuquwfS6sZRPXuBRXJLFgriunKRGIZQQWGaRCT5+6XO1g7Sw74zw0o8DFMft1BXGnY
         oZb5YDjT0TK/er6AfIzIwu1Vsurme19qPisSDSz+RHPF/HWWcJX4dTRAJVf66Y+ZTU/c
         eDcwONhMS4OIrYXfXAE93iYLOWqSiR+mjGLBHSHx5hkI4B1KkwRKRQm/q/klxsKRg6tu
         yvOmvW3xu9rDwLcriEQS1S68HZEYiVRvmwZ8Vl77by7D+mKS4z6LuhFo6UpE94DO1Q8z
         1lXkDIIHu0lim0uTTBWF3W9y4FqdTaYkiMk5VqNYGSfUK9ojJua4Cnw1qCgydE+8dhRB
         G4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736800149; x=1737404949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4hNf2173wfLEMxtIg97FEzD0ppVHlHvRseXpyFwI28=;
        b=HGhySs2XSja+YmDkzB4QtpWh8bsGnogfRBQebBqNNrmo27iQ73kZogOEZ8A3zIwBhi
         MGoRQr7e3Dbx8DBYJ2B/9Y2og/Aym/LT0KSI5aD9eamqUozPwIKcM1nDvFhcQfnm3vQh
         ELzLl0eCXaJjonaLv+U75Nj/vxxwTV+Vp7S7GHNxl0XVDrA1qoMPCP+M5Uud78UTbV9l
         qzXIiUxgXl4CsH5jpYBJWBdO3ONwUJ0Jz03/YBJvopokHLqE4OM6Z4lX4cdu2V/7u4xH
         X8eTKP3uYuJuZLAM6L5lcjb7DVnflIA671eQ+XR6Y7ASVe/LBkw5avcKQYIGNeVIl3UN
         v+5g==
X-Forwarded-Encrypted: i=1; AJvYcCU20T4YNa8piiyQr8cjwFtV8V16ojELVNQzxAwLh6YTIHIo9kkP+fjYVLqv7ulcMniMfrhloy8ifIJcyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx2I91siZ00SQzAPSlmBDznTqxrW46gZidsEuuS9jHZ1470qUX
	r6FPYdgMlB1cFlp9A9f6KKNcbyEimjUpdFECyJXzFs93e7M27MORuCVdavyn9feTfwMjWAfzZSs
	YwjXtTNK7gi1/5W3FYeeIuWp70Fc=
X-Gm-Gg: ASbGncucsl7bxYqHBQ0mtRjkqqEp0SFoTub7O3EtSIRWgOUOSA0uOsaMPOYhg3aNz0H
	f+CVf00UfSpeKOuJGpiRWt0N74s2XpZ4aF33iIH/Gp50xZNmhvOipe8PGg3zNwsYl1q7kYw==
X-Google-Smtp-Source: AGHT+IEP4rsv553foMrX3pJrJAexHs4PzdxDhyi4L18Qjb1ePsFBNHmvWiQwiCAaS0j916096t8NZ0vlflbIZ+vN1iY=
X-Received: by 2002:a05:651c:1508:b0:2fa:d2c3:a7e8 with SMTP id
 38308e7fff4ca-305f457ff2dmr73897001fa.13.1736800148847; Mon, 13 Jan 2025
 12:29:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
In-Reply-To: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Jan 2025 17:28:57 -0300
X-Gm-Features: AbW1kvaE66P5D9a-RcCcmHY_SOJ_VmGtQXFh0hghXcLdnydvxxCDiBTwatHnih0
Message-ID: <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
Subject: Re: Hantro H1 Encoding Upstreaming
To: andrzejtp2010@gmail.com
Cc: Frank Li <frank.li@nxp.com>, ming.qian@oss.nxp.com, 
	linux-media <linux-media@vger.kernel.org>, Adam Ford <aford173@gmail.com>, linux-imx@nxmp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Resending because Andrzej's Collabora e-mail bounces]

On Mon, Jan 13, 2025 at 5:25=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Andrzej,
>
> Do you plan to submit a non-RFC of the Hantro Encoding patch series
> that you submitted earlier?
>
> https://patchwork.kernel.org/project/linux-media/cover/20231116154816.709=
59-1-andrzej.p@collabora.com/
>
> I don't have access to the ST chip, but I am interested in using it on
> the i.MX8MM and i.MX8MP.
>
> Please let me know.
>
> Thanks,
>
> Fabio Estevam

