Return-Path: <linux-media+bounces-30263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE4A8A0C7
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 16:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D808B189EC24
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E9A27FD61;
	Tue, 15 Apr 2025 14:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aj9Efddr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7841B043F;
	Tue, 15 Apr 2025 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726604; cv=none; b=Z7pVh+3iq+QYwOaBntEPY/U9Y/AjqYJN8MTDYimKI1rlCvCrLs93jijYimFsJGxqCHp1AA+TM4lguuy3HDrSf/Mk6B/xKzhVfjhBjvajjlkdAVqyDWEmCf+NEvfFR+Kh4oVnsNNrJlQuDX50T6/pjS3hURDf3gh3BPTd5nSkj+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726604; c=relaxed/simple;
	bh=ACz+Fpwdn0XfAIUDzdmu4eBWBcB/XwM/0L9gsKQ7e0M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DpjftADqGVEEVc5A/0UGh4hRRdsfsVLMoKvIii5EDVWZcpWpAxcrztAn3VpmGEq5NN5H6+ECqM3tM12qtSEdCCQp2fKUWbUxJvddLoG6S3TJEC32tqQeNpqjNYwpSPqKOvt77I3lUiq655cw6bGwD7R4hNcysiaJSCDSR7RtGpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aj9Efddr; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so5174965a12.0;
        Tue, 15 Apr 2025 07:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744726602; x=1745331402; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OdLbtZc8a/Uj6IFf0P/XVuQVhmyo9d/CGl2l2gCW9Cc=;
        b=Aj9EfddrMFXWJFAfGYYmeUSflH3VEpxRkVQVW3LEAycNZvE+IqPr6cDN04YaSSP27Z
         n7aNJM0doWiYINuc/Pw5jaaisIan3I1eCEvFPiYUC3ukVhV6HT5LZ8qxMxOb2eo+eoak
         J0gBSvbGx8+aM2yLYpjF60RO3xbyBF9+aIQmj9cV/8OrOoBGv+RZcCw4064UgolLOMm5
         RqmETQYYBkZlywaTUQgmbX/x6XsQ4xxXy6udDbKdpcUoMu7oNViFA7p05Wkc79E//5sX
         blE3zvl6a5SMhEZiAdrhhzYjAzzQEHi/dyCEvNRJV/BlWPPyPbAdHtuVgF5yo7INxcLF
         pEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726602; x=1745331402;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OdLbtZc8a/Uj6IFf0P/XVuQVhmyo9d/CGl2l2gCW9Cc=;
        b=THTkXtMrnxDRUZgrf/kihsCxuegrl4pRYM9IdicGCQtI0aE04jFoLXqxLskN5hMX5V
         sjNYzW5qN8te33oiNEzne32j0l2pvJlVNn2Ii8N2HFS1FFwjVTEEw6IaPoL1wZbuQJJS
         dv1QkZPA2qJKsb8ab04kNmXEbCc+mh7Z9o0KAqt29ol5RA/yYK31hbD1B1ubjwztfHbp
         IKa6GrxOJ9a8nUkSibA3kAvr0oguGPcZ4GSAkBg69kD3tIVTGK+Zz2KPtyKAZUYyrY1P
         ijfzxWsopC3QV+z32kSTHJhxtP+gBOnp7E+hifq9TzfVttgLEItGkHgRLA2hXQJ+CaPk
         BUqA==
X-Forwarded-Encrypted: i=1; AJvYcCWMSmEH/luyQQCicirjtY3XJZgTKPi/BFxy7nw0ijn614J04KZfH+DHSMxu2yTUGhWLsGhxG2Y/K7KjLlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFA3YAn0yrlr6VXOTQVBGy7N/tjHElijISZyPm2bx/uHFZzRoS
	JY72+S4XQzVSzc4oCKsfPIb7hZPL6njrSvEJ3G+e1lDZtHJrIZrg
X-Gm-Gg: ASbGncvYW7o9CCdjJxFrAS3PcJ7AglNF/XYUyojqO0uviR+hUevRfFLqvbTr6AJjS6V
	14Io2qLm4T9HoZ754Hpns84TzBStW76IQXclxlF2qV3Db6BSXHATZV2H9Y6SJyrbp0i1YeM+Yva
	/mhlvDNeWVQdgi4rqD+DOr29uzQ6LEQvdPrfLaSq0bPUb8rP1tQmlTTPRJpKwL5kpidK25VnySQ
	sEovU4UHE72Qy3NvQnmD903aghs6DXkD06UuB6ra+jTz6tKghQjqjhQTN8q5dVW852wo8mB6JTE
	TMkhB+EdyVkdlA5tC7RhLPyvPAQ/SWd470KLXHpL+wlU2RdN9MSdA4CSSxpv7+jswduTNrj/8EJ
	4pNvvsrkF
X-Google-Smtp-Source: AGHT+IHzMLOCZnlZMU9Yo+RS8q8ufiWIGJu+wrrxCXp86M6s/Pc/47ozLcWZhQt4+Icn+MBZtjO23g==
X-Received: by 2002:a17:90b:2743:b0:2fe:b174:31fe with SMTP id 98e67ed59e1d1-30823624700mr24290763a91.2.1744726601935;
        Tue, 15 Apr 2025 07:16:41 -0700 (PDT)
Received: from ?IPv6:240b:c020:4d2:5072:30eb:10bc:fd1d:f567? ([240b:c020:4d2:5072:30eb:10bc:fd1d:f567])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308545a257esm787072a91.2.2025.04.15.07.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 07:16:41 -0700 (PDT)
Message-ID: <deac8460864cbcc6e375411adc60848138a7d259.camel@gmail.com>
Subject: Re: [PATCH 2/5] media: pt3: Replace deprecated PCI functions
From: Akihiro TSUKADA <tskd08@gmail.com>
To: Philipp Stanner <phasta@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 15 Apr 2025 23:16:36 +0900
In-Reply-To: <20250404135344.93241-4-phasta@kernel.org>
References: <20250404135344.93241-2-phasta@kernel.org>
	 <20250404135344.93241-4-phasta@kernel.org>
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-04 at 15:53 +0200, Philipp Stanner wrote:
> pcim_iomap_table() and pcim_iomap_regions() have been deprecated.
> Replace them with pcim_iomap_region().
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/media/pci/pt3/pt3.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)

Tested-by: Akihiro Tsukada <tskd08@gmail.com>

