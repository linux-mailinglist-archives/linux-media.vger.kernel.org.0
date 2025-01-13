Return-Path: <linux-media+bounces-24708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84933A0C352
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 22:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FD051698F8
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 21:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA93B1D54EE;
	Mon, 13 Jan 2025 21:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVS1npQS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F98347B4
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 21:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736802548; cv=none; b=HLOGAnRjg8zRYngBXSjnZpYCAZTQCeTWOgZfmGyTgR/TmuaKCuJ+FpK0JB481uJRbKwTxM+yuJxpbrVwL4uMKrxPqQI8uCfH0d+yWv7XDjpG9f+VIZJ3YRre6rg7/sSC0/wBaf+E0Ow2Zw0QTZkMYDdl8id7OmWd1jd5qsvomA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736802548; c=relaxed/simple;
	bh=7+1g+7kGdo9v+eRUvrq4urgUlJctoXHMqLRfz6BmcHg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Sre9gDVliP2vlz4+CJdfFJwPYnpFeOapmK4DlMNy0ER/B5YlseMCQfRKxcYg+BT5WOCl/yKjZw+lavK2jut/OFZxqS0j4v2UfugKp4z3V6XIMk8v10PHfRtrqM9G+WmqaTdiAyEx+UfkkJHSIMbZY+s2/RXzDjXHOf1zQNH+YwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVS1npQS; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-71e1e051e50so1276858a34.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 13:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736802546; x=1737407346; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+1g+7kGdo9v+eRUvrq4urgUlJctoXHMqLRfz6BmcHg=;
        b=YVS1npQSTaBSiKGkZ0nscdQR8B7rJKbEUKKwnINhhoqnXbN8SmvacoiRO4u8MFk7Ww
         uv3aZGv09gyHIIgK97tUYzBcOzXt18om2pcvxl4+kcx3f3j32XlRPSYbDk0v9BJDeRjv
         YumxoepS/1Ej34CWzFh9yjR0wpT1LNTyWYl5fUU17cg/P9OF1FXqHEWQNH8jwHdbM3Mf
         kRTNfffDArWgM1k9zNOr0zhARMwsWsTs2uyACAbjbLc99LUl7FyeWPpSbLJPcWVYcpZ8
         JJzs+PJbZJUfFGWgDFxPq+aukXiT03qXVM81JyGsd0xp1+h6YG/wfLoRzrY5HhDJ7Cfa
         NWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736802546; x=1737407346;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+1g+7kGdo9v+eRUvrq4urgUlJctoXHMqLRfz6BmcHg=;
        b=R3wNtRxmJeaSIUhnW9CIJUZg7f831WtGrhBwtEscPWdqodzJ17o5852c7Fc/4BI7xi
         W5SdC5gmCqYBZii8nGEcnbFEMCS767dfDkViZLOPts+LqvkLjUMwidu1BauRcN3gOpBv
         6isvuwdQ5HdQKlZVKlRQj4FRbusIBd8WWLtpj71JyKA/YUyk8zy70o0KgvseRMKFXhAi
         knlcbCDpv9VOAXFlc4ovcLLxbMqgRL75mCSLQoucqe6hW3c4gppEFqtyw5AaxkNgZesb
         bUwj1iMNqU0Q3CoM8ateUxuSPVtJnfvczT4OmmFfTvXl3HXsl2CVp9YNXJ2YwocyDMMQ
         joTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN1igBAsu2ZuNSooFkrrwzRHUbIdQEB9qXG5b4fqSbeQyg5j/mOxAqMyuyYTCjK+pZrjl4E7xgt+mcVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0nWKpv9KH0IEOSs7/VCN3xCQRGoliX6bV5G/LdYaP/D8vkTs
	Ni1zjlo28PTvlb1aGbwgLJG8mCwtl0xDm9JrS+h2iWeAwcbWC+Yl
X-Gm-Gg: ASbGncvLHqJW1U1sHEgKUzjP1kEtjQmpT/oNUfXJaPfEEwlp5uiYhwu2NBNC/YJPk4j
	HhK9KPxkHoM3Rm5FJ+K3M+hqNjj7RBhxQMtw+r1+FyEaQCkxPyu5UB4poRaNZEFTIrRanNxeANx
	d/kksJU/b4FDJ3/rIvbjMkr7Jz36Jc6/sKgK3NdqPbErPKsKlz2ulLWH8YOTR4sYiFjRvBPe9v5
	vNKb/pgbw1qXQBj18swvLjifZMkMUAnqvnOSaaTxDdFk8+Fb7tp+kNCA1EICGa49kBHDtksjhrE
	xrxeGCc=
X-Google-Smtp-Source: AGHT+IG3fsiVkh/9Y1zzlXLDYK7dWQ2bEFdWvTPg/pju8ZYB0uW4oZww65qhq3Tc3Ax/+hGnIJ6Jrw==
X-Received: by 2002:a05:6830:4707:b0:71d:f343:5f5b with SMTP id 46e09a7af769-721e2e3e193mr14349465a34.12.1736802545892;
        Mon, 13 Jan 2025 13:09:05 -0800 (PST)
Received: from smtpclient.apple ([2804:18:114f:41b7:4a6:650:fe96:8776])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7231862a20asm3919190a34.65.2025.01.13.13.09.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2025 13:09:05 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: Hantro H1 Encoding Upstreaming
From: Daniel Almeida <dwlsalmeida@gmail.com>
In-Reply-To: <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
Date: Mon, 13 Jan 2025 18:08:51 -0300
Cc: Fabio Estevam <festevam@gmail.com>,
 andrzejtp2010@gmail.com,
 Frank Li <frank.li@nxp.com>,
 ming.qian@oss.nxp.com,
 linux-media <linux-media@vger.kernel.org>,
 linux-imx@nxmp.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com>
References: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
 <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
To: Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

+cc Nicolas


Hey Adam,


>=20
> Daniel,
>=20
> Do you know if anyone will be picking up the H1 encoder?
>=20
> adam
>>=20
>> =E2=80=94 Daniel
>>=20
>=20

I think my colleague Nicolas is the best person to answer this.

=E2=80=94 Daniel=

