Return-Path: <linux-media+bounces-20661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA02E9B89F7
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 04:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89C9D2828E9
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 03:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16993146592;
	Fri,  1 Nov 2024 03:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N1EaTN1t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680813F42A
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 03:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730431652; cv=none; b=pdSv98bOVMicTyl0GvmF5ypOfgthrZlHHjE3mTOlxmCi1oEE2CZzcLXzgj7RijF7YAq8TP1ZQ2mG3194ryuG6Rfbq02dLKrR9nkpvrC5Y7U5CzGFuq0Akyrr7Tg+aqYaARF06HnPaE7438bODjfShIxSXO4x6CPEPJVnzcjcMaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730431652; c=relaxed/simple;
	bh=plqiRlvx73CLvMQkwpTvEhGhSpEHTS/efF6elyesKv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlInukU34SkpTPWp9OMDMlujEeG4cxJ2FzbOLfb74+pWnGJwbsMzrLI/wWX3QuyiEXfc4Y/raMEUQYlz+xpD5VyhriRp+le14bFf//IkjVssdNR+K51bNDx+ijO3RiVwgNszjL3fY2L4q2KgR2E/JLFW67iWqk4OaytDvZG0u4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N1EaTN1t; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7205b6f51f3so1372165b3a.1
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 20:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730431650; x=1731036450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nxx0Fx/9J0WPI0aj1beNLHUEJaZ/IpVHuJN6Hmx+s+c=;
        b=N1EaTN1tVST2vDTtn8xdXxAM6l+z6J3ySreaC3/6fUrYNV4DR1odwtnDEv0DZqGDho
         Ta8jNZkFL9Hp7aK7Ccu1Y413ySKrkCQ1oQUNf0pa2ntt76OxzGeLOSR7dCLSs2RQPRNW
         ijDHpoW2hBaw8ETSz4yoKpPBdOiudfJ3J66LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730431650; x=1731036450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nxx0Fx/9J0WPI0aj1beNLHUEJaZ/IpVHuJN6Hmx+s+c=;
        b=Lnm8mGIj7D34UL1L0vNoaCloy7SVglWFkMyaEx+sOc3fAMI9eObs5HoMHUgTNaYbcR
         l+Z6zw41HiF6AQqcirHjJ4iCw5b9zfzNHGWjKfeAC93Cxn370ZAwUH9HoTIbDS/GZAPd
         ybwSp78XOzqHvmTXWrlJZhUUVQo1IyAS837ZiItHs8OwZZbhkDsc0BKkmgvWWmNeyFKT
         Mu/vU4g6s2gaNTvjeKb+Tpw+REnn17ddOOHtardzD9Y/EYzF8v0fshLa1KqxlbNg/Ern
         2j/11lBVAW99C2GTsc+eYsQe/GD2qw1QaSnb4i3zd1Yh+75T7gfH8dVjdlVySFsj2d0D
         H7CA==
X-Gm-Message-State: AOJu0YwsQcv/bQw/F5mxIgdUh8g8C1CDRekck7d41miqacaqb/rszN/K
	YCSYdiRW5wHdZIF2Q/6LCVO+cilFfFWM6Crx9R/x3/U3KQ+govtw4Rq3DaKRqqoXohCQpAmpX38
	=
X-Google-Smtp-Source: AGHT+IHBHNMjqCPLi40ofFWzuOlSVxMwmz6cHcNqDpUlqrATnAlyUrBIVM+iVjxqynw+e5BWTJ2ckw==
X-Received: by 2002:a05:6a21:a34b:b0:1d6:fd8c:fa16 with SMTP id adf61e73a8af0-1dba55373fcmr2128905637.46.1730431649927;
        Thu, 31 Oct 2024 20:27:29 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:4470:8fa8:957a:6c05])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c498esm1931051b3a.97.2024.10.31.20.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 20:27:29 -0700 (PDT)
Date: Fri, 1 Nov 2024 12:27:25 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: linux-media@vger.kernel.org
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv6 0/3] media: venus: close() fixes
Message-ID: <20241101032725.GX1279924@google.com>
References: <20241025165656.778282-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025165656.778282-1-senozhatsky@chromium.org>

On (24/10/26 01:56), Sergey Senozhatsky wrote:
> A couple of fixes for venus driver close() handling
> (both enc and dec).
> 
> v5->v6:
> -- added kfree() backtrace to 0002

linux-media folks, are you fine with the series?

