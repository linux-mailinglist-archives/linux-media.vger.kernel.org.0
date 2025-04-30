Return-Path: <linux-media+bounces-31477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D779AA5138
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 18:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3EAA1BC573B
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 16:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75ACA2620C1;
	Wed, 30 Apr 2025 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iCUsSx6z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BFD25D8E1
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029413; cv=none; b=HnY8gQ+dsZyGHPDeaQCQzXUjN4PlhGSsnTL4J5GTXFvqlXUvEnhoolIM7UIQW8uyZFw8SYGehublJloZpOwY5ulfeJjdE73g4QHQQqgkqN4n9HcrwktI7tXOzIu16tr8t2jSO1suESzOom9qmG2i8G7IrbeRy1Z302Z72mQtBaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029413; c=relaxed/simple;
	bh=dB8Ku47osDsI5dgdMUTC8XPV8JrjvZZpVwDtiS9F90A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C17OZhZKodS7JZIE6G5zicQXtJ8JpzVhslyUZL0VdQEQKfHtNaoic52utTH1YpHZxkjvTR2ZZjZ7x6hGNoS8zyfzdmAuR3h9qwHtk5yJvrO9ItJcDPfkwFOjJqP+2Vm1gL1gQZh5zT8vuKtv6hAYwuym/kgmeSr9j5Yz7tCcLYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=iCUsSx6z; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso99168a12.1
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746029410; x=1746634210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjW0kKIfLoWiEW3IGN+CzuIN1NDrsW1SQc+vsvYzpt4=;
        b=iCUsSx6zDziRkYiBDBKBOR02jwo1VIfAEKCDgMdgrWBzZjrHXMFYHzF/spHcvWo995
         abch7SjKZDkNd0hE+MSf11EYXvtaNEuYwF4GdoIthq00jOVpB1DjE2APZB+C+ee8uObD
         0lR6iChBHM5me+UHNGupPVqACP3i6/aZX2JgWGagtANvoP5MjFpXY2KlbhYtys9NRhc2
         JmEwRHwSznxF+uiZhb8ZMNNkjx6Q7PFkGvdjRebJFLCdoBd1PcF01IqTJT6q5RpNNfkS
         xl1LuGsT7w3+QJ8vVwvA6Lq7kYCPnveDARUkirSFk0B2BDga+cf0Lp/l+vPABn2IdBI6
         EnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746029410; x=1746634210;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pjW0kKIfLoWiEW3IGN+CzuIN1NDrsW1SQc+vsvYzpt4=;
        b=lKAsXJrmlmynSAX4gSvSj2+J68y+eHYvjXHKa5hmJk8f9a5xFFdvRomQq3cUBLphoz
         3EhrEjpGNW1igQysQVZeJ7I19Wg8QXyMg6jwFgH6Y+EpW7DKTkt0IK8zZ4k6giYdvKaR
         esWYx8PHKv9j4UHTp1So0bjAti/xnwC7+p4Xl1hmKRAVe2W8b760LRySy+MEFj2IsqBz
         QxWSAbOi065ouvyrhpcYTfkINFCTbgxpu1gFvBhTSW6xQSIl1C/5qIKgvoQtJHzlMeDu
         dYU3Ak35rUaDisYhgRCS+jelLAMp9+5SqroSjMNDNS05P8maLFfMnjw8HnccSftK37vR
         mxMg==
X-Gm-Message-State: AOJu0YzGj2eTrppW3AuwWcSSeVzhLPxW7zSB+14D8zLNOHq24Z+TaeDv
	+IKY0dS5Mh5NfqLmo0uBmO6zN0YD27bAMQXIMlMYpzRyaGU7g/FBLsNzHw==
X-Gm-Gg: ASbGnctXKDv4DFSr+fu/8gQRGqmJnkAW3Bk5gFN8NF7rKPDiLMg8Ttr127YCvw1ygGy
	aLPX5loNIUdPqQBYqH1jiHglE/NfqOyMdDJkLrTdmc4t46uoYUzy1dFyUWexLuFt5n2jyt2ZHnp
	PKoDUsKvF3IaQd1Pdckff+HR6jqgDrR4/IL3D7AW/47zNO8G1zdpBd9WZTK2q6whNl5YrLJqEh9
	WHw9q2ZjpJa7u1Gfb6k4jdy7IuweChgy+gXeChrk+osXLJVWlgi6CORYvqVnDbgIKkXvBMhotc1
	5wY3Qe9CMwQ3JSDP12K1Ng2bjjWKbyoSAeBdx9J79JRd5PjtUaX9EfCk+L+3xY1kJUQNn+WFIgq
	BeWTNnTf3ymZN+MfUOD4vN5dWDKNQZ2eesJY=
X-Google-Smtp-Source: AGHT+IHeuoAJGdrIQew1TDI7ESoLzEZ5pTWKMsOzUuSqEG19RdmIxKLMZFgTjxfxOv+mbbZRzvTw5Q==
X-Received: by 2002:a05:6402:1e89:b0:5e4:95fc:d748 with SMTP id 4fb4d7f45d1cf-5f90a590dcdmr55262a12.5.1746029410177;
        Wed, 30 Apr 2025 09:10:10 -0700 (PDT)
Received: from ?IPV6:2a02:810a:8316:a800:5933:a53b:9c22:9343? ([2a02:810a:8316:a800:5933:a53b:9c22:9343])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f66b7sm9107776a12.46.2025.04.30.09.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 09:10:09 -0700 (PDT)
Message-ID: <cdb32731-b848-4c61-aab1-97905c00005f@googlemail.com>
Date: Wed, 30 Apr 2025 18:10:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Time for a new v4l-utils release?
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
References: <c5387e00-3b27-4670-a967-f408b25b44fb@jjverkuil.nl>
From: Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <c5387e00-3b27-4670-a967-f408b25b44fb@jjverkuil.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 29.04.25 08:13, Hans Verkuil wrote:
> Hi Gregor,
> 
> It's been quite some time since the last v4l-utils release, so can you
> prepare a new version?

Good idea, I'll use labor day to prepare a new release.

> The largest change is that edid-decode was merged into v4l-utils, so that
> is no longer a separate git repo.
> 
> You probably need to coordinate this with the maintainer of the debian edid-decode
> package: https://tracker.debian.org/pkg/edid-decode

Right. I already gave the maintainer a heads-up:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1093806

Thanks,
Gregor

