Return-Path: <linux-media+bounces-23847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C59F8C54
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 07:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 642351896C28
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 06:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE0F172767;
	Fri, 20 Dec 2024 06:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jZZ0wlMq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC1574059
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734674643; cv=none; b=r2K6sZzjDZzAcfrGU/y08ZA9PUGbZL9e9siBTezHrTLYOOBJm7KmeZ8dG5eoEbEenTnn/V3COkUQlMhj3Il8Ep7JtB628uL3djYscVAwlPJkx3DEyQuUtsDXN/Mx2vUW+Jb+nSuctQJA6+EdUTdhpL8rQWfarmLHm9bF2oKeM9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734674643; c=relaxed/simple;
	bh=K+63evmhKPcaJDy3TNR5bLmXF6anEPRB9JG+PC+Z9n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdYDiplcbqfcQ85LH9BapU5AJe4O9HHE0vT2lBsyez9FY+QnG1l7YrV3dQNSC/KPcLKtNnm51D2X+NCz15+oMffDHI3Cwol2CGcksj/uafghi45UyILW8XYJqYMjSrqDLXR1Qxz51fBhOYsHIwR7DwYcBGklW8DXc2UZBWdtZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jZZ0wlMq; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so18578671fa.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 22:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734674640; x=1735279440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s9bqHJQ5tzHFq8ZTn6AtQRtfBjdvfIRt6uscTcnldow=;
        b=jZZ0wlMqjsFgTlujUQnTuUq+PEroT3uRIWkfszJfMK9tp+NvVAri6ziUz5+XgSfsH8
         BSplNh0fjTqv/8/+27ptPGs0fb7yMYbUVmFPMYnW7uiuTbhcipFbR+RfhljWH6iLin5M
         yxhVAi9JtCcBjE33IUHaOHQ8SuFfX2RnQowbVXTXEaxg9ZELlVWOqHlGTLZMfEYaH6ND
         OK12gGBwIrqirEGyJYsfc7haJXwz9kECV7/2zF9AQYSwjHyLOCtFn8URPUk03R/PKUge
         V53ocilJCXUVdPWtSjubuwTbbA/E0xox17TzdxMTnDGLS+4rLz97sYYqsoKHTefOhLLh
         zkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734674640; x=1735279440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9bqHJQ5tzHFq8ZTn6AtQRtfBjdvfIRt6uscTcnldow=;
        b=anK2HWhNUJNrpo/+XwxdXz7TyHRERXO7ql7SEBFoPvqR9bqkCh7BBMj3J+/WXIQN09
         UAAkrAh/rOiigdYRIX/lu3GTpVNO/7CWxg3GfvY5dPGzTKROedqca4IFWfG3sEtp8M47
         WguHezfr/g2wix17kxxtFRWtiUXddye0GLttl23FwhmglxWPjemcbwYnjHldBeZobC9+
         ZyNq28W9KIwRbOZaYu6s3lhD+DIQczU9TCEDF4maJ6MjlGnlXd9PEdIOIdV9ao4YT5QH
         FDDWjfpolKPzHBiu0tDRRRgyB3oE+4HaIIUYOn2l3HXf3sA5Jd33r8MS3obHwPxTHFB8
         DasQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNHG4nXylfndJZ5nrFtr5PIZOKmr1Zq+u8TjLotNaxyHWcYzR/AqZQBjXp6GxNDexygNXaKxAwnFx1PA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl1A5QS2VNFpyNuvGSp3UPmJsHa3ka8BS+FIqgmZaUvZnJjtd/
	EUaWYKbbCWNvJFj3oXeIdJlfWXVRGH5lWnPzKvMtJG3I07nwEwotFPxAvCyZPaQ=
X-Gm-Gg: ASbGncu+XD5lG0mUOAXUSabCMAi/OwyvqPYxXazFLytUPLz3oApFckJmIdpN6Dt9be8
	zcYL2bC8Dd1vrfHN/d4Pg+67EVIg9W+HgkSdfYeJyDqEknMfITqDHuvoc9am7AI47uoPacAtHb2
	lvbWYds18+gK5xqzrgXKhJ/mE4amC3rkVV8gBT3wd5Fgt0p/QWZUm3Bi5h9L+eAOguAQEILGtLp
	ZtsO+lQR5mCdSPrK3afhMPqQLzdiYDOciP6qUSC1+jZngwW7flYtbkzf/azgq+oQhrumOuws0Ir
	xQWDrA57ft1PbJ2A7vLi3cg1L2oiXzvjlRty
X-Google-Smtp-Source: AGHT+IHKZeImslFcbVUJpHmK8DIG6VFZrKf6PiTgPTPO2VSOU9Xx30flk+6qLwRpIrb79Uec0dN5qA==
X-Received: by 2002:a05:651c:4cb:b0:302:264e:29e4 with SMTP id 38308e7fff4ca-30468630c1amr4194721fa.39.1734674640209;
        Thu, 19 Dec 2024 22:04:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cb7fsm4286001fa.19.2024.12.19.22.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:03:58 -0800 (PST)
Date: Fri, 20 Dec 2024 08:03:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCHv2] media: venc: destroy hfi session after m2m_ctx release
Message-ID: <ga4g3k7j6hx3qs243lcsfyzpuonh3wvxjareaurlg6e246xf7i@xdlg4l42fnuc>
References: <20241219033345.559196-1-senozhatsky@chromium.org>
 <20241219053734.588145-1-senozhatsky@chromium.org>
 <yp3nafi4blvtqmr6vqsso2cwrjwb5gdzakzal7ftr2ty66uh46@n42c4q7m6elm>
 <xkmtptaqzvwe2px7q7ypnkltpx6jnnjeh5mgbirajzbomtsjyz@gefwjgfsjnv7>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xkmtptaqzvwe2px7q7ypnkltpx6jnnjeh5mgbirajzbomtsjyz@gefwjgfsjnv7>

On Fri, Dec 20, 2024 at 01:32:48PM +0900, Sergey Senozhatsky wrote:
> On (24/12/19 15:12), Dmitry Baryshkov wrote:
> > On Thu, Dec 19, 2024 at 02:37:08PM +0900, Sergey Senozhatsky wrote:
> > > This partially reverts commit that made hfi_session_destroy()
> > > the first step of vdec/venc close().  The reason being is a
> > > regression report when, supposedly, encode/decoder is closed
> > > with still active streaming (no ->stop_streaming() call before
> > > close()) and pending pkts, so isr_thread cannot find instance
> > > and fails to process those pending pkts.  This was the idea
> > > behind the original patch - make it impossible to use instance
> > > under destruction, because this is racy, but apparently there
> > > are uses cases that depend on that unsafe pattern.  Return to
> > > the old (unsafe) behaviour for the time being (until a better
> > > fix is found).
> > 
> > You are describing a regression. Could you please add corresponding
> > Reported-by and Closes tags (for now you can post them in a reply to
> > your patch, in future please include them in your commit message).
> 
> The regression report is internal, I don't have anything public.
> One of the teams found out that some of their tests started to
> fail.

Still you probably can have a Repored-by, unless it's anonymous report.

> 
> > > Fixes: 45b1a1b348ec ("media: venus: sync with threaded IRQ during inst destruction")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > 
> > This is v2, but there is no changelog. Please provide one.
> 
> The code is obviously the same, I only added Cc: stable and removed
> one extra character in commit id "45b1a1b348ec".

This is the changelog. It helps reviewers to understand that there were
no code changes between versions.

-- 
With best wishes
Dmitry

