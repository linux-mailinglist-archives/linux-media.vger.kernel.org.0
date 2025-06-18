Return-Path: <linux-media+bounces-35130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6EADE45E
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 09:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2A373B8AFE
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 07:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831F227E7CF;
	Wed, 18 Jun 2025 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JQrC/PgZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DD7207A27
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 07:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230902; cv=none; b=ADzX6BU8Tc1vHGugtoU4TEiufOcckxO6QjQFmtdAdMk/9kp/AvYUuVYGBp4q7qo/XmIK+UQlhCi8KaYdK3x+r5FIkezf2EySraJOaP9gqWKSArp2Wo/o6UFtnXQ4g19U/nOiE7ERH1TFnyAKx3DsC8M4P1jNIlbfY/yQwYj8NO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230902; c=relaxed/simple;
	bh=jjgjjvxUhNKOkYxrq2CUMlZkOE6sFBKcjJDHj5mJDmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0w/hsVI0n18XNezuF2xYJwTrl6gGKUWQ/ByN2uec2pjUs7o+YFPi6f6zfmXx/rZWs3psTnHpmNnudoWy9HLB7C7cSwdgvVChXeKdO5tfa2VAg9YWoFiiXboYUmuhJ2YZD4Yfy0FgTwzE8TBGt31DNJvfTLb2Ut/ZFJFOggPVRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JQrC/PgZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2366e5e4dbaso3908145ad.1
        for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 00:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750230901; x=1750835701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjJnSSToadR7Ba5tsz+7GR68Uid3k/46i9xtxrs2Xm8=;
        b=JQrC/PgZbtlN9DjR6iauOxg9lhIiAIV2KLHrwC5sqSANfscpoIgdozsSohShwopyRV
         XZhtjSs7iG/ohdAgCefivd2MBHqLMzamxYpMjlp/xriboV/9oSKgzjTiSkT7L9gB7rwV
         Oh/J37dCJJa3RTHU0cWDraTu/uR17SSHZ+sv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230901; x=1750835701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TjJnSSToadR7Ba5tsz+7GR68Uid3k/46i9xtxrs2Xm8=;
        b=dW0HutLg7zu0ij/7WBB4BgAcquKm9hMuqD3IbqvejbBTGYaU0J9LLdgmQfPd8fMgiD
         X039Pd621Q+d1frO0QBsOz7YQYrV8L/YbeJ2yxhsV20+iIA2UMwGP+oApuDQxa9ZFNIp
         BA4850aHeyl7JyUBxqcMwGVgKFPLiBn6Mirz1lwE1z0JdKDBmZD7v8hmpM1MhtZWDZmf
         9TRD2eX58FD4MwYaYz01HUtsp/QeRde9u1S7Z+ixD3O06wzdWz2Mv4BV/+7cHbA8Zfo/
         MFV/9TVcHVQ7r9MhtgeRLSRFJXRHNEP7o5tjcpM/xF9b7NE10DGtVfGB1tgxYTeFOxxE
         X/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVLRVdvEyXML0gkRteXdQ62EVU+sghJVymw6DSwkF/JCVEVf0tPGxUtU1kguGdrH8+PN0tAkiRtyqb0MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO2q9MWyDBsM2E3pXkH+JYjkj4lYjOeQyWjZEvrFJVq29icMq4
	fZbXcbU0IjXX3H+cbBD/5W53TLUFpvwVvxzvsHyr0BpgpaALeFZ9285jjxtB7t+TAQ==
X-Gm-Gg: ASbGnctDUaygPprokRRCCy4EydjnMDSCpEtGR/RjnYzEfuk6aHI1/FIzc04d0pwfebi
	L83VRDVHRs39aX9FqoJkDSdBO1K9JNk5PLuulamNxSYgVINuJEQuNazk+q3SOihR4aKHM0is+XX
	Pz7kk5CMXs0QVolNK05PMLZj2SZFzZfz2oh369lghVaFL1AVd0VwB08n+/6kaKqEkojMwwcpiic
	bnmi40fj24P7IGmRnNXPOctqhtqFlFdQD6mEokIZGKkbZZwJ8aGieduRvmW9ETiCT40LEArRjOw
	zJt6wZ2wjp1LXgfN3kTdQhCOK+y5jJ2qQrEjEwjr2v3GMZonYA9CHtk4kPBTZUC7AGD7xpX7G1M
	Aa2fGjQhZWYpRsO2xvLol0Veskg==
X-Google-Smtp-Source: AGHT+IG438IjUYDsjbKl41hI/Un/Y8uEcVLgq5YHZ1DPs6JxJJdlBvseErAZZycJV8KQtTJVicvUMA==
X-Received: by 2002:a17:902:f642:b0:236:8b70:191b with SMTP id d9443c01a7336-237c1d2aa4amr28360025ad.0.1750230900859;
        Wed, 18 Jun 2025 00:15:00 -0700 (PDT)
Received: from ?IPV6:2401:fa00:8f:203:ec9c:350:e14d:88de? ([2401:fa00:8f:203:ec9c:350:e14d:88de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb0484sm92455455ad.142.2025.06.18.00.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 00:15:00 -0700 (PDT)
Message-ID: <2dc61f3b-f04c-43b3-bc56-f4a01adf0454@chromium.org>
Date: Wed, 18 Jun 2025 16:14:56 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fixing IPU3 IMGU warnings due to extraneous calls to s_stream()
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20240620145820.3910239-1-mstaudt@chromium.org>
 <Zs14rHA2lGQibhRX@kekkonen.localdomain>
From: Max Staudt <mstaudt@chromium.org>
In-Reply-To: <Zs14rHA2lGQibhRX@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/24 3:56 PM, Sakari Ailus wrote:
> Thanks for the patches. They seem good to me, I've taken them to my tree
> (devel branch).

Thanks Sakari for taking the patches, and thanks Ricardo for stepping in 
during my absence - apologies for the silence and not delivering a 
PATCHv2 last year. I'm glad that this was sorted out in the end :)

Max


