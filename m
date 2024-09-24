Return-Path: <linux-media+bounces-18505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CF19846D2
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 15:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69FF31C22982
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48611A76D2;
	Tue, 24 Sep 2024 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A6QcmF33"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DC41A3A9C
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727184903; cv=none; b=Eg9mWR/2+THdzUK1IYlCj2ZToP3zA+fosDKyv1F/YSQFW3Y+TplFU0IdOsJot6KA5+fhTaxgEhcgol/i3oJ7eEk8txDdkJFh6QCVnm0EBiYl7b+oILlbsw0IWYxpQNlZHlmRfVfjpD+phxKoBqn6589KrYrnj7KUnbyE+yyz4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727184903; c=relaxed/simple;
	bh=em0RLm+PoFfyZAG3kzhDjbG01m3h5xpMc4EUhlCzPKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZacbnlihjVoNd2W0ZnNBmfYp2y3icw0hX9KUeAxP6vce4JF/zHu+RnMiHXEvNJvZJwYiQMy03zlk+gIpVqij7H2kArH7HlcIAD7/ft6Q/lM5XztrrdiapNxjkIzKZ6X0oY5BALPExeRD8joRP6FEjfr1m5ZlRkaxi53gIyzx4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A6QcmF33; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2068acc8b98so51816445ad.3
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727184900; x=1727789700; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eM6iciCEZGXl4Vz/qatCcfZ9KG8DAXI77/RLKcvCWUU=;
        b=A6QcmF33e+lTgiMPxgvWZNP/kl2OPeFAUh73TpBRpow0M5LrUBtHF8i/49e8S4gBkr
         tFnxhpnxn9IjbXUI5IGeV9Ms+8RY10xKJelScpHLjX/O13eAjmR0VpwjTxPiV4aBHxsN
         jlGy09gQhl82RDBsQ+0YVKT0xfTKFd5MdXxTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727184900; x=1727789700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eM6iciCEZGXl4Vz/qatCcfZ9KG8DAXI77/RLKcvCWUU=;
        b=P1n/k/5MBqf+P7OREC8+gbNbHHhi+qkb75wJBKL8vBCa+a87f9/t/NOJOBXzGFCctH
         Q/JLMQGwG8gUn5dmlC5/GH957GNgjM9lU49KIALWZ5RQ3lSC3yqykKopRcQSZS7MgXx/
         mCoLQqSIHzqMcoWQo8jd0cU7roAPeSmQeAGwF0cQkIV3N0aNBQYYEcGXJAHAl3jKaEuS
         7+zDOLgnSsvlRezKMcIYo4g32AIZEQ50u4Fe66WEab+sk3tOJ5B2tiNBP+Ao4lNqdbsK
         j1fpwKJzbuBp0qbH2M9P/fol5A3RbF+vI6X7kzCMgEv71OF0Q4zv1V2fmiHDq5yk8VNc
         x/3A==
X-Gm-Message-State: AOJu0YxuLhDyXajpRZpqPKVlZ5uwgpAXH3STmhPtgHRJbFRbN5dsJRlg
	lice3BlEuiSF8LO9kxY25BP8qlbMKTt9KngjxSAkbiV1Lvl53DVIUhqAQHwqPgwcT81URM/FIGU
	=
X-Google-Smtp-Source: AGHT+IGZBrcrSknj6y5+q6+8MyM306ONS+asLBxzmTjH6yvSnZqmdo5BdfAEiZ7u/PB9PKhfCOGT3g==
X-Received: by 2002:a17:902:f550:b0:205:8757:fc82 with SMTP id d9443c01a7336-208d8397ca1mr247430395ad.18.1727184900637;
        Tue, 24 Sep 2024 06:35:00 -0700 (PDT)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com. [209.85.210.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af185280dsm10319665ad.252.2024.09.24.06.34.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 06:35:00 -0700 (PDT)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71b0722f221so149591b3a.3
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 06:34:59 -0700 (PDT)
X-Received: by 2002:a17:90a:e58a:b0:2da:da85:b705 with SMTP id
 98e67ed59e1d1-2dd7f3e4cf1mr17202231a91.14.1727184898970; Tue, 24 Sep 2024
 06:34:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fce4f906-d69b-417d-9f13-bf69fe5c81e3@koyu.space>
 <CANiDSCsrVJ-rSCNHw-=FVRa4p_1PhfPzYb0cR0xh8cPrhN1yZg@mail.gmail.com>
 <5878053a-27c5-4b06-8675-e1a0236c9430@koyu.space> <6572c5cd-f898-4551-bec3-268a5283341d@koyu.space>
In-Reply-To: <6572c5cd-f898-4551-bec3-268a5283341d@koyu.space>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Sep 2024 15:34:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCt+ah-x40=nwcs8MKPmL=PzvL8VmxnVEotJ85GGpk-ygw@mail.gmail.com>
Message-ID: <CANiDSCt+ah-x40=nwcs8MKPmL=PzvL8VmxnVEotJ85GGpk-ygw@mail.gmail.com>
Subject: Re: Add support for "Quanta Computer, Inc. ACER HD User Facing"
To: Leonie Ain <me@koyu.space>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Leonie

I just sent a patch to the ML :
https://patchwork.linuxtv.org/project/linux-media/patch/20240924-uvc-quanta-v1-1-2de023863767@chromium.org/

Please test it and reply with a Tested-by:

Thanks!

On Tue, 24 Sept 2024 at 14:33, Leonie Ain <me@koyu.space> wrote:
>
> Hi Ricardo,
>
> I wanted to check in and see how the progress on that change is. Since I
> haven't heard back from you I assume you're already working on it.
>
> Thanks for your help!
> ~Leonie
>


-- 
Ricardo Ribalda

