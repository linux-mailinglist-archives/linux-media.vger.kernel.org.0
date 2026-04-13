Return-Path: <linux-media+bounces-58620-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG3pCop93GmyRwkAu9opvQ
	(envelope-from <linux-media+bounces-58620-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:22:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF53F3E7721
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DA963011850
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 05:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED677384234;
	Mon, 13 Apr 2026 05:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vzf3yRKl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B1A36308A
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 05:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776057712; cv=none; b=ZpbvMhWzuOCo7fuxKtUb+cuhU4Z0k03kvexj7yMqI0wP24MIwHgb6tHaP/zb0iP/eB1DdGs/dOF3OLDwlHAfsPgb+tXXU3ajGIINcFOujUzhwyy7eWvncS71wUclOYXKqGhYUEYPp7o2yxeOpYAeI43i5jj3QRar/tlWF1+UyGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776057712; c=relaxed/simple;
	bh=FbcdWUz+LzlC5UIGJNd7kkF95ZZIl4IOCm0ByFtZut8=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=F7BR3iAzouxsKRKvNy2s+sFa+melYtwxmQfvxkneDE/u/RtF0OYAQE7txZDbQC0OYGANRm7VzYqDoonBZwSu2YxhdCaz3y8x9+VlYSukESy7d+hJzUq8v5+zq4idAk0FkNlYMXppGNag0QRhMJcFByY0oVTu8xvRgKAcOkep/oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vzf3yRKl; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so5083144a12.3
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 22:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776057709; x=1776662509; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbcdWUz+LzlC5UIGJNd7kkF95ZZIl4IOCm0ByFtZut8=;
        b=Vzf3yRKl1dNH2SWpkE4OxEpXLzCNo3Gs+xohtuS0xBNFb2344mFHKG4rSdrHOVFFfu
         CoQnsw6CGroWOh12xaOfmf3y5NXEIAZuIsiGQ5N7ckJf3E2MRxygQF/VOjcdcpjlJGcs
         MxQT3NsFkL9ZBKEvRrKky563KOJ2K7FGydWX69RVKmaIjt+5y82kfyLHy+pQs5aFZLmp
         zDaxGbXW2iIq3G3fIBE36/FBJ86enmNPcLunFJ80I04lerh97E+rdGH3otuUxoyJXrEi
         /i5zO+aoaVJlgBZ5fJsPeWTt73A1BIaalrZXsMbvFgFZUjL/sOY2N1sAcpW87kIbbcF5
         wNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776057709; x=1776662509;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbcdWUz+LzlC5UIGJNd7kkF95ZZIl4IOCm0ByFtZut8=;
        b=b/NTcX1N0FIARSU0h/w8eZSXyIW4n1ZJ0IZFILIlAZgvq0JqmMtifzhBVgscr9W0JD
         IizwhJQuKgctGu5eV8HJsul60jg875T3qgdmCZery3XbEerOc7nPqqvHPqWj9vjolcmN
         yFq1FeyNbO/tE5Z5uN+l4RYZG48FMe3V5beHZTKgygYX3A3ucdqiYFAvVFWs6rfIivNw
         JXv0BeMCdOpN/Y3Ww5fAaPDmgXEj5Ye4jeXyn245AzTOyepP3EKgz3fGU27dzdCRAxkH
         NzyuVajOULFMg7aZV86BnSk/WtBjSsd3c+6w37aeyOv1yATqwV9i28yvEGftDq06Jymj
         +qCA==
X-Gm-Message-State: AOJu0YxULeTWbY7+ejx/NckdVpbRbjdR5DgOHBFOouBE82eJgRhclTy4
	p6d7ml0Po6m1IBu6Xps+VCNwptrSpzaqtlXRQKwcqEmgcvr3+YHH8QOg
X-Gm-Gg: AeBDieuZoBe2BDRRqYoqWPEObkBvHKiXg+jIcP7Kf31a7DoMEkFSPhlWx4f4eqM9xcv
	u4TEir428dUzMQSTSPOwc51i/fDkSNfhyLOq4Jxr9h6Zy0z2d/WJzv6gAeysdsSBkheicilDtIr
	J0dUhV6TdWRxZKWTkNu5g76MAWqLGRlTKZp8Sz5/hTk547qIDjG5kd60S+mHwW5T+TJpSwqg4Tc
	NeHkqzqIN9wVOhsemaVkIoGI369krBkignlBqxEa+LQ146lc9DvZiBuFUWcPMIfrGd8vEYmAPvq
	hzy3PUq/4ZsyR+KixiyJaWPu+rSYpjRNsN5Ce6tN0b7bRgWKj/4zGuR6LxN8bGFWoclx/IEX3pl
	C68EdE/eZo03vO1vnukaP8Ma5LWxIRp4ZBjjk6KMnhuZ5+bMXSFqRQY4qRvAAivZZ+9ycMcrm/0
	nMi2FZPQna1an5VLtVdF+MuIMDVVQnDBb4Gp1AS64Z4x94dENt6Rg1EENoN9fFvki/1K9N8FysJ
	673/gdD7N/R7vAk+xaF9dE1zPOgRVE3a/ojx0MU/4dtU63VPVcDNyDYh59rHg==
X-Received: by 2002:a17:907:7251:b0:b9d:eeb9:b992 with SMTP id a640c23a62f3a-b9deeb9b9eemr68012066b.23.1776057709077;
        Sun, 12 Apr 2026 22:21:49 -0700 (PDT)
Received: from ahossu.localdomain ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671505caa61sm629377a12.14.2026.04.12.22.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 22:21:47 -0700 (PDT)
Message-ID: <69dc7d6b.a70a0220.2403d.c1ad@mx.google.com>
Date: Sun, 12 Apr 2026 22:21:47 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, luca.ceresoli@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: media: tegra-video: add NULL checks for of_device_get_match_data()
In-Reply-To: <20260412205057.386856-1-hossu.alexandru@gmail.com>
References: <20260412205057.386856-1-hossu.alexandru@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,nvidia.com,bootlin.com,kernel.org,linuxfoundation.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-58620-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hossualexandru@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mx.google.com:mid]
X-Rspamd-Queue-Id: BF53F3E7721
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 05:07 AM, Mikko Perttunen wrote:
> These devices are only probed through device tree, so we know the
> returned pointer is always non-NULL. Typically we don't check in such
> cases.

Thanks for the explanation, will drop this patch.

Alexandru

