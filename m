Return-Path: <linux-media+bounces-24279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00D9A0267F
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3017B3A1C79
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 13:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A2B1DE3A5;
	Mon,  6 Jan 2025 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c++d8cPu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CA41DE3A7
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736169893; cv=none; b=HOALaVBB11FwTKICtXYIG2zbh9JHsjkM2Ja0epkcjI31FlMdsV3ARYhMDElcEXwJPS6ee7JC5RxxkUjUz5hQ6Mqw0BaSMGmQ6SuQF0Y9AGW0LP8n+DBb4xXVF+TV09KFGXpV+7xtHV/K+a8PRCUZMaMcP5gOzXfWXehuA2pdiL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736169893; c=relaxed/simple;
	bh=A6SCwTH0ZBMAjyXZe4Ko+ILCUaVYRr9Sxpbg6XtVUkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huxtAYzUb80Yf+2FEzAiX4v/ZGPdqrDtCyCINt3piNPQTqu4f5z8waEqwfPdYAzm+9UCmOwuLh9F0LHexg9MkcNMc1lTQYg1BFItDHdS6jsQMAJSbXEu+6EGfXgrBsiSl9B/Z+mf2QCI1z6WdjhpX3etGJ8oxnyaUpLOcgCTnrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c++d8cPu; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f42992f608so16550860a91.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 05:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736169890; x=1736774690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vUfLE4D3L43/Hjy6xgTH9enXIQ9LZQ3WuF35y/r7t68=;
        b=c++d8cPuESR6NexYKzQ16ESFV55wFfEmBpIooGun7tyUrQCMiAGkVMbeU8Lzj0IlG8
         leeoed2jdePW71hV0nOKn3we8OhbEdhUiLk/X9tlm50HFkJPyvupjQvz1iKMrowU2jcE
         epu4N2rpS/zzpQVs85ura1qLSiNIsRs+9tBUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736169890; x=1736774690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUfLE4D3L43/Hjy6xgTH9enXIQ9LZQ3WuF35y/r7t68=;
        b=TdVnlzcfyseUOtwOWmB7nQGuUvrljKZCQeQm+11l8iV5UloDYH6LsUybrSn2yyM/U2
         qcZ4EEYZStEi5+o3I4T6c7UW57DuAwV//BMl1zw7yANdSspVS5NCk22V6oRgHPCYLVHk
         V6uYnUCc2mx1OCfCOIqeFjR2AhWS1YHJYmhF7dRykPH7qm5iSBKmRni2U+gcw/YH1Kb7
         f8GJZ3uMpzkD1K0GtOIgGvadZnc3YCeQF6tpgs2W6EgEePpuVX+l/J4S8D0p/phEcAba
         fkux/+XcUxinPiTHJ/6kGbGj5/nYLL8x3fyO2bfkXMHf4YYYjSMOatX4UL45iuR5s4Qj
         IbCg==
X-Forwarded-Encrypted: i=1; AJvYcCXdtU5IUx5QTZA59giQmTfbvDNH/fOxzgB2Bir1mr0+0c4Uc91Mq3zrSw1gDj3G+tGwhhxFtw9DgxPMlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJoLxbG7rGj2/eO0gq9abYp++h8L4iV9NCkrL1Cz+VOBKevRSE
	kvwOeqpww4/nkR2XiYxogPo0jrJuT8kkxXsBReYhtcxqvc4jjXxRRtqrjfyqig==
X-Gm-Gg: ASbGnctl2LT/B83ncGTfqpSAXpJmAOPibiNDA8C52Anf9nOY+vYHpxDvtjhjn4rPa2A
	n83Xp/fhN245pBobh5JJrDvajC2/YIzCamTlD+fq/+u6MYHLQ+ZB8H4gExdf3VHvIpmRKgcoAf5
	Xeonriwgy/2fBb10mhPvTX68lTU6+nOH8WH7szsK8HLZOuz5DFYZwhion32o9N4KLqEeTTkpFbR
	bYbn06dVyaAashPkWeS9Sm8Qv7srBBnjYZ2q17i2cWL+TkS/7dNfSsxEK38
X-Google-Smtp-Source: AGHT+IHZBSveO4NqFWbE0Vn/nrTYHh/OfJIa6sa9I67SklwWdJzelh6PPGsVsnRTOyb5vgsDPuYezw==
X-Received: by 2002:a17:90b:5183:b0:2ee:5111:a54b with SMTP id 98e67ed59e1d1-2f452eec7dcmr73020037a91.31.1736169890617;
        Mon, 06 Jan 2025 05:24:50 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:c142:c1e8:32c2:942a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4633df7c0sm29908133a91.18.2025.01.06.05.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:24:50 -0800 (PST)
Date: Mon, 6 Jan 2025 22:24:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Nathan Hebert <nhebert@google.com>
Subject: Re: [PATCHv3 1/2] media: venus: destroy hfi session after m2m_ctx
 release
Message-ID: <3teih4ch3qze5xdt4at2snv4ln5ebffhdc4f7bclbqxr3dhoiu@kwjnitey74uk>
References: <20241224072444.2044956-1-senozhatsky@chromium.org>
 <20241224072444.2044956-2-senozhatsky@chromium.org>
 <bd751d52-c378-4706-b93d-a063d1b8352d@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd751d52-c378-4706-b93d-a063d1b8352d@xs4all.nl>

Hi Hans,

On (25/01/06 14:15), Hans Verkuil wrote:
> Hi Sergey,
> 
> On 24/12/2024 08:24, Sergey Senozhatsky wrote:
> > This partially reverts commit that made hfi_session_destroy()
> > the first step of vdec/venc close().  The reason being is a
> > regression report when, supposedly, encode/decoder is closed
> > with still active streaming (no ->stop_streaming() call before
> > close()) and pending pkts, so isr_thread cannot find instance
> > and fails to process those pending pkts.  This was the idea
> > behind the original patch - make it impossible to use instance
> > under destruction, because this is racy, but apparently there
> > are uses cases that depend on that unsafe pattern.  Return to
> > the old (unsafe) behaviour for the time being (until a better
> > fix is found).
> > 
> > Fixes: 45b1a1b348ec1 ("media: venus: sync with threaded IRQ during inst destruction")
> > Cc: stable@vger.kernel.org
> > Reported-by: Nathan Hebert <nhebert@google.com>
> 
> Do you have a link to Nathan's report so I can add a 'Closes' tag
> afterwards?

No public link is available as the report was internal.

