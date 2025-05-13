Return-Path: <linux-media+bounces-32425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603D3AB5F9F
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 00:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 911B33AC4E4
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 22:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF461FF1D5;
	Tue, 13 May 2025 22:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bh6Dk5kg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DF841C7F
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 22:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747176429; cv=none; b=eMYH1aEAzWqim7fzek5Pm5nuR7ZVK/VayfJHCJpNFCeYd6nsaoaZNtaTWQRvDLgU6rxquInvlMKdQbyS65ZbXwo/N7kOpWJsFtB9TsqUD7EIt2CSMmWj1AnAHWaAdVM/KzOUrbHXs0OSwLOWUTJaWblgfeVwfFgoO0z/FgLKsMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747176429; c=relaxed/simple;
	bh=UaSeJYWegrMxKiZlyaTimvlMg0q7IST82Qv8NmVoZww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjKX4Dy3JUiynz0QStGaMuv6eZs5K/TXWS6Op/jADLcREEe2oaAS0kMCP1MEaZqmxmw8dh2FxW6VgHCEH0UAu+rnyUW+XsdZsxNP7NMTt1kG/Wh1XIzQdkLlzIKh1rAQ+9pO5HtKQvjf17RjZ59mPy5ZT02fPrivJIi7eI0/A64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bh6Dk5kg; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549b116321aso7318020e87.3
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 15:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747176425; x=1747781225; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B23f9FpOvg3w4b5sBrJbqJYNtkUHQgqp77Dtn+N0U9o=;
        b=Bh6Dk5kgveR6iBXsT4mvAMRCgZPdc7kvo0W47TcIBOBCTRyeI3WXnbe6j9xSS9t76z
         +wpTI2S7feceIyVQKN5h34kVkq5IZMuh/Ek2MQSy90ejibW88vE4udWW97fiIJ4w8gFt
         p2F/QW/BWVGKDBxamtrWlIuFQYVtefEfqIf44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747176425; x=1747781225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B23f9FpOvg3w4b5sBrJbqJYNtkUHQgqp77Dtn+N0U9o=;
        b=ZmAUP1GX1uGlpzH8RouMAOicE/DHW4RoX0S7HzFOKMtT6xbgCW++boSNfWSelAsldb
         AEpV/Mwdqv4x/q1z3gHqMmIzfKF6aZ+ifI8+wrOkxWsamCa3UdYvXWF8PUL01AYY554V
         ULKxuaj1PBYBDg0oZiuAyrAme7ZOnoCp5TmZaHX3o2iI+QgkosVZkF+NBXGWJ7Z2j5dq
         K1/2RMFS4XnZqtohGKbTR5tFqByMDrfiVF82LFMyN6HARMlpAZHzogpGU+nWkFiFRpEJ
         kvIv3bCzJNhDLhuMRaYdN7FUb/kEStVJ74quF1diqkj7dDV8YEAEv7V12x8/vX+ueMat
         CFog==
X-Gm-Message-State: AOJu0YzD70pJMWy4K7/01ixpRSN/w4sRwoeIgUaHf1amgBu/VLtyllL/
	9HUMZYeYi1gfFO7DRydK+SwKhv9FJsKM3mDqk3t23ggup7BV6YRMwCUGKeH6R+4xdiUFVxYcUas
	=
X-Gm-Gg: ASbGncs27cHRr3q8YXKtxqaCyIpIRTimOm3/QqtAL8zAMIZJWYFRTHfhtoW9AZO0yAS
	MSeDQ7qzmS5S7zkMb/5BHoNVDlZvFGDEriUM7jQGwYH2etLFU9CCCw69nnnjvOFxb/L0OwFTVis
	73bzFiF++WIH9e79tgTvhKjpAAXuT/r3WTO/7ggMuNk7PcSO6r0digrGQM2jZbkkXrzaSP/2uHG
	VGLMn5lvI1F9Pq5mZrtX/+tf1YEKMIeNh9uZGxOKw9K3n5IW9Ttifh4Ips+Jnf30oyRT730WXf2
	TgzXMn+L84G5LFx0VXfiI5K3WbbZ8IbJ1/gCYCsp5d8InQgaqniiIOUUTSgkPa4FpTHO7Eh5zhB
	8bJRj24j8PUM01g==
X-Google-Smtp-Source: AGHT+IFrq7I05Kptaa5HWyy+iHRN4C29pVdLlBSa623+kA8F2lySYA3AhJPzxZQk6Z1C8lheuL8Jfw==
X-Received: by 2002:a05:6512:6085:b0:549:39ca:13fc with SMTP id 2adb3069b0e04-550d5fe8889mr318422e87.49.1747176425376;
        Tue, 13 May 2025 15:47:05 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cce4fsm2027732e87.240.2025.05.13.15.47.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 15:47:04 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b0d638e86so7150683e87.1
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 15:47:04 -0700 (PDT)
X-Received: by 2002:a05:6512:6310:b0:54f:c57d:d52 with SMTP id
 2adb3069b0e04-550d5fe6ea3mr318780e87.53.1747176424134; Tue, 13 May 2025
 15:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB=g0fRy-JFPqCGa+06Asop7mev+1Kx35gdyA7X=gtujOndgUw@mail.gmail.com>
In-Reply-To: <CAB=g0fRy-JFPqCGa+06Asop7mev+1Kx35gdyA7X=gtujOndgUw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 May 2025 00:46:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCvbyx2=Vwso7pPNs_0-pvXaK+q2-hdTZnDqrzazMcQuHw@mail.gmail.com>
X-Gm-Features: AX0GCFuy2IxwVaY23gDPgS1mNB4hWSIerKPUP4qJlGkmG14ymoa877AREcGNAB0
Message-ID: <CANiDSCvbyx2=Vwso7pPNs_0-pvXaK+q2-hdTZnDqrzazMcQuHw@mail.gmail.com>
Subject: Re: 0bda:5558 on ubuntu 22.04
To: Raul Negreiros <raulnegreiros@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Raul

Thanks for the report


Could you try setting quirks to 16?

rmmod uvcvideo; modprobe uvcvideo quirks=16

Regards

On Tue, 13 May 2025 at 02:24, Raul Negreiros <raulnegreiros@gmail.com> wrote:
>
> Hello,
>
> The camera 0bda:5558 is not working on Ubuntu 22.04
>
> Linux 18343-nb 6.8.0-59-generic #61~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Tue Apr 15 17:03:15 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
>
> Please let me know if I can provide more information. During the tests, I tried to open Cheese and Google Meet.
>
> Best regards



-- 
Ricardo Ribalda

