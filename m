Return-Path: <linux-media+bounces-38127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2713B0BC00
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 07:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92B191895CFA
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 05:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65070219E93;
	Mon, 21 Jul 2025 05:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwGVDoAb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8374A0A;
	Mon, 21 Jul 2025 05:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753075229; cv=none; b=bqS0kWKgPeyQHaDQdTGlrcfb1dxGLYkdz9l7UPz4ynxm2enN5zi4Ne3D0G7jNSmtHONDzw+g+1DlY+dv7PPqZNUugLUY/0TwolNVlfMeQheDbfpp+M/ocmLfjB3qvkV7n0DNjtGRF5Rh3Q4LjtzmnzLxAf6hhVT08lNAO0tmtXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753075229; c=relaxed/simple;
	bh=c+TpxikRGVZUGQJzzbs5bR4dhcxusvGe+ApCVUiCEZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsw18N9nDTqNECCHNVJUWnAzVX1FGvD/OmjYwsncXjz93XYc3P0eC4F8uHlGq3Dn79OtcMyoSeWNWCks/k1/iVAT7Okozap2yWwaifz87auZUmy784JErAkO4ThHNy7nOd5c+NPaHtaqjY0J/QLwLRhX7haQ+kvrtgWEsiHAILE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwGVDoAb; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b39011e5f8eso3218721a12.0;
        Sun, 20 Jul 2025 22:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753075228; x=1753680028; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c+TpxikRGVZUGQJzzbs5bR4dhcxusvGe+ApCVUiCEZI=;
        b=BwGVDoAbHdDmCKVX1YNZuz9EL7wspnzseazkY4OpjMRotFEGOqXo3GZoAHZH+fPpb5
         D3gQQ2TyM/Zfu+n6/jjuJyXVVlXZZyhzPV35iueOgzlDpFBSXw77XnCU7kPw5S7K3dOL
         BkXjv+FjPHbLF4fv1tmi9igUB06bqgrAax4FvMHs+QX+Pl9fY9juTVcpJbysZJIhKp3U
         38E2AonfpXd1PZXghESl1TbrSwu2T29C9dr77BGTnSjtrO390FBe/CNVirt6t8LH6clG
         fg+ZTO+0IWnWmdeF82v3nLYzKpDjmVe8wBQw5sV1SzRhOkdTnCGxUOKSCemNe2uqxiRG
         ExLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753075228; x=1753680028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+TpxikRGVZUGQJzzbs5bR4dhcxusvGe+ApCVUiCEZI=;
        b=pOjSRwUCQLEIlDbshlhhLvlqO4PPCce1o1W2t0q56s0q2Wy0W582KM+YEDiNppqpAq
         dqw2wbp8bl8Z/gKVh8vpCp04iif8aX2/neZPD8r8tcJsxpQsFqVkRPXev4liByODsOyP
         JMiwoZrpQ1RKjCOJgPtcCzdExM1htTCEI4s6A+HzSV3Vtb9RA4UF5oE4Eo5iTAf6fdYQ
         Uy3USqtEq1aXKhprquhjmoEOPbm0/0XveRrGm6zyvvDKslxaZQIRD5cXH6Mj5IO6Gj2w
         GfqsQDGqUff4ipApHYPjqoU59gs4RTaX/A1MdLRL4/uo2y9ZUC2NtqOaQorqcxaUHG6+
         zfvA==
X-Forwarded-Encrypted: i=1; AJvYcCUdxErOKyZIPeFU9ESEj4fTknYETJTpJ3V25nqYaAvguWJjU7aBZChHJNsxl1z0WD1bOVbqKCU06k6D4D8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLLjDszrRNyEjjPVHtpLTmtmA9eceHugcxVy6Ff1VqjXiAcmQK
	KL/xqag63HEGAR0WQZtom/5d2dxfGZkFK7KeMzCBGmbANzLqVzk0E2qxOzrHj07KHh8z0ao1eik
	or6JwaUywvWbCaRrwNIdpYmLTNhHLF9I=
X-Gm-Gg: ASbGncuRj5aUKCs6b3ePX7o6mL1BxIv5jdL1n9Ljxj5DVV2svrgz0EaOaCQBfXY5JQI
	t6me3mBLlSdpXqrvhamVhLXqr4V7b68EutOoaWnM3Sh38xWt5GNRGJ07BXH9H1ke8FYZaGEHuEK
	kkEVpbGsIi1HiDrJf6+otbWsF1fNc0m3NbPl51wwal5+G3xRvHfLnOqcsUNgjCjtXp+RZhtmUVN
	Fff1IfrcuYznobCEcz3hf1RrC8U41nBIjKYkE/lgM9mA9h5Wsxt
X-Google-Smtp-Source: AGHT+IHxfzyo1XgQnSudJw50XEQsNlwUsL3kqkFTPHV3rMwTS/8poVlebJxMCv3BJUQ7psgRl8CIqtpJUcNgDrl9/Z0=
X-Received: by 2002:a17:90b:2685:b0:311:df4b:4b7a with SMTP id
 98e67ed59e1d1-31c9f4b50d3mr29393503a91.29.1753075227663; Sun, 20 Jul 2025
 22:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718145149.3180-1-darshanrathod475@gmail.com> <54d3ec28-0e6c-4e9b-bd93-966efe649054@web.de>
In-Reply-To: <54d3ec28-0e6c-4e9b-bd93-966efe649054@web.de>
From: Darshan Rathod <darshanrathod475@gmail.com>
Date: Mon, 21 Jul 2025 10:50:41 +0530
X-Gm-Features: Ac12FXzgWCDlJoOMUr6GETLIsZnUW5GgmBnqrphKQDHe5SAeBLRUN8tRo_7ICAI
Message-ID: <CA+db+r5pf7nYxPx3Z5FV-69ucJqMwoqXJAypaG0JnpiNXC_JFQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: b2c2: flexcop-eeprom: Fix assignment and
 missing return in MAC check
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

Please disregard this patch. I would like to formally withdraw this patch

Sorry for the noise.

Thanks,
Darshan Rathod

