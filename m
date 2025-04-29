Return-Path: <linux-media+bounces-31326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A73C3AA0EB8
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 16:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFB397B4884
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 14:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36C52D3235;
	Tue, 29 Apr 2025 14:26:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE9B27CCD7;
	Tue, 29 Apr 2025 14:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936795; cv=none; b=V/BgoLlbqDuWh8aEYRkzXdPflGRdDLV1Ug7GffCoNYkZkhiqSd3Nu/BJr+/updvKG0I8pgx2ZJFXsUUNtarVB6kMpMFFGbiL4w0x2BFtAcC3hr15q+XwAKRmuq/RgaretPFz7BDCvDNO7q40e4pYk/Y/WyYjd4EgmEphb0b9mxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936795; c=relaxed/simple;
	bh=W4I30SvNM9+KAOiZNBilpIRKZgT54av0AUAt9ZoB9fA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYZbvER5TDUf8Yt9nyrcVERxaApl14Oh6ilLdvzWrS+OnzFslXSUa+ECQdTyuqv+QdrXNM0ZyurAuGdfREMyKdW2g82HBVd56AtvMKgNMR5EjT8n8dUFclHUPZkK+3DZ4Ouf+uHaemhcHm5nXaHyyA/phq+L+RV2oevj1f34Pss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476b89782c3so78144071cf.1;
        Tue, 29 Apr 2025 07:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745936792; x=1746541592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USrJd919SgUjZesNRyH7GF2uBWWYxNg94OU2voVgEgU=;
        b=iO1u4Tetg7tJVwa9YKD93zZli2MQvjUk5nOvgBZJrAJDquJxlMe5whfDd+l7BQ2hG4
         sYgNob/uohH8GTvgZRaRwcqRCkcgse5lB/5c1s/hM/u8w18e0qfGyy8X+2cKXOfzpcOb
         b+zxCpNarx7Za/zYAi0To3meMw25EDXuOCHdrWlYIUQwRQ02SQ/N7Z0FctgSsNctpekJ
         UldsRPfy9y6W8O51y0PXGbv8CHjWmDfv+ee8Y8t8C+MmmYtYrtgJFUcZOY2ZdoKSm0l+
         qaOBVuF5IsvgPnghHdhOb1CW8+rDBTrrI55HoX6Umolij2Iev6gcl7+1RJyEkJWPfGg3
         YEYA==
X-Forwarded-Encrypted: i=1; AJvYcCUeC9jqtpRjAyn6K+VWeyQ3b82U8cNtLn17bGYRDFGV6WkeFI23OobQI6m3cNWopoc1qCelDu5ljDxC2LI=@vger.kernel.org, AJvYcCV4nTn0BVW5lT2VAxzYNcsa3oooESi+Cz/v8xM4uqGaAbkrKg5w+ikri30aGpA988/CpZBZuG2DTrkEzEHIf4I/5aU=@vger.kernel.org, AJvYcCWHmPRNXuxUT8tdWnS6cbnykYgJdfno14DgNjHK1IGHBIPZClVh8el5r3b6ayK6Na7yDk87m6FiMdEMxHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUkJ5YBsGFTbomZqhhLWCNY5/OWa3fBd1sYsfhiijKJw0zt89F
	KRtiQ0Ka7wPyHBhvd5HrHNOg9fmes4gH17M6xNKVz4TnhT1YpQzzPwhvMU8H
X-Gm-Gg: ASbGncu4dOMC1VfTp9zlyT6AFxnVaty6UAhDcBcVDlKb12iCvOBSVNOzxc6J+7yyjPJ
	jkeiIEyWe74JN8KdtORKygQ7lomFyeIxfFTjMjYHasdBIeVZWtacp9lWDqRIVJnVHJhi6lBj4s2
	+Kr43W+8Nr28mLKk1/4u82A48fNkz6iBHNEsb+ZoPgd95j5Hp2JSYWqYuJBPQ+7ewx9OOtBDRCr
	k0/k5ty2bzqrDqdk0EErpP6y9P7vRDNtXJMy1SoUI0CMkyLyRn7jXMb7nZ+6lFrxJ8JSNFp87iK
	DBKD0wx01G6loCe7/PC/dRIyfCSYC9mpdIpvcBPqpiJFVvEgHN5krq2ZGGmoVgtxgfxxfysaCsi
	ADhiQaIw=
X-Google-Smtp-Source: AGHT+IELGWBFKvrCq1t0ApQdg+gN/b0cybCC+2a2wGwoLqSRDwF++GNAsXPROBNzpn5Gb1ktLJaJfA==
X-Received: by 2002:a05:622a:124b:b0:47a:e775:da52 with SMTP id d75a77b69052e-488682fcbe8mr57442581cf.38.1745936791604;
        Tue, 29 Apr 2025 07:26:31 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f0d0efbsm81571911cf.26.2025.04.29.07.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:26:31 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5568355ffso554287985a.0;
        Tue, 29 Apr 2025 07:26:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+ZO7AWx1ZV5obmRke41WVSyxdLSUFea8f3FpywYFHyfp9MhTiiG+ZZbAF0002ulq76LkoVH2nBbO7MJQ=@vger.kernel.org, AJvYcCW3rzsjhq25JJFVJkFYhaE5nThfGYnc/iCkK4YiPtQZloRutR0FPK+gzZi0/WtbtrsTrjPj+Xic+V585WEpc0qhePA=@vger.kernel.org, AJvYcCWFsxTw0FcjQNwrEhPJLzkYkueBADZMzc0YyhZhINRx5mbAeeJSF09ERyQnYJxZHiokNat3XcuVPTbZ40A=@vger.kernel.org
X-Received: by 2002:a05:620a:8001:b0:7c5:46e4:47f5 with SMTP id
 af79cd13be357-7cabe5e9dddmr503329585a.20.1745936791249; Tue, 29 Apr 2025
 07:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250429091609.9947-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250429091609.9947-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Apr 2025 16:26:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-YVMRjxC6+P-Ljm0Vfnv3KfTt+04p=JVhAybcubcb2w@mail.gmail.com>
X-Gm-Features: ATxdqUFGLHF3vKPqFuzBi32X1uec1rPmYCz6irMPhCxV-R_sYXIi-YqJLb8cvVU
Message-ID: <CAMuHMdU-YVMRjxC6+P-Ljm0Vfnv3KfTt+04p=JVhAybcubcb2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: renesas: rzg2l-cru: Fix typo in
 rzg3e_fifo_empty name
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 11:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Correct the misnamed FIFO-empty helper for the RZ/G3E CRU. Rename
> `rz3e_fifo_empty` to `rzg3e_fifo_empty` to match the intended
> naming convention.
>
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Closes: https://lore.kernel.org/all/TY3PR01MB11346E57A3DF8D8A90A405E4686812@TY3PR01MB11346.jpnprd01.prod.outlook.com/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

