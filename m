Return-Path: <linux-media+bounces-37242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E02AFF7F0
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 06:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E1EF3B7E2C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 04:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5602820A3;
	Thu, 10 Jul 2025 04:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDxnYQNJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5203319E7D1;
	Thu, 10 Jul 2025 04:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752121329; cv=none; b=Hp8iZ9gqlTHAFj4jvFYHVcP9oBE+JVKtCfBmQHVzvp6K+A/hz0QBOx3oGwa25HAAGIWCveAT0OPifqL08MFt8A6ykN4fjIpXGUM+jVFBTmBWEQNhM4949OZ45+Ilgb4DpfRV69mam1M7iAdHMW78qgEs2sNvhKU2jY0JakZFZLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752121329; c=relaxed/simple;
	bh=zpk9bRN0L2uWmTh6P1V8dthV4qxXL3T4kvyeb5/URIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXWgMLiu1kgUQFo/1Kg9YUxroyYLldZ8DmgInusIA4P4LgMohKufvsEB1FaNu+cJQvS+Dg1dysQzfWQfxcNfVbRqYiJeq6EgbIWHOKCkuuDAfpp2X3XY+pftr6bGID2arKWBbLLzUaTYjDs5vkcq0TGPvJ5BbkBXoQ15LSG8p9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDxnYQNJ; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7db5c13088so525702276.1;
        Wed, 09 Jul 2025 21:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752121327; x=1752726127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fX1F7Z4PAEFtJGiOe09XclubaX8vKVCrpTd1hRg1Eik=;
        b=LDxnYQNJGtAWfpt13Asr22gtDapAdxnKsXZ4PaEgb3I2i9sQrxpQGmF0m/PyeiFOzn
         E7Zmd9zN9cAMPSrgJkMKcdHOQ2gstgNvtDR+7y6fI9KfiPJsby3cg6WbDiBfSoM9fE2n
         nhcx3vBSIsofV77/mlBEatYquyHsC7wwQkDgpsbQmtErcxkAMdeclUyfh3Kc13W7FE9y
         DP+yx1BteX3pB+17qQnAud1Kx9DHyGIOgETMqDm3K/UTYRbZkhaZrDgd5QGjtDenjDKi
         pUd9TcLcENCgflFmcZxX9n++haFb3GJCv8JSGd0obirBl7MtX26I1ZD9f79rgi6vQRw0
         8AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752121327; x=1752726127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fX1F7Z4PAEFtJGiOe09XclubaX8vKVCrpTd1hRg1Eik=;
        b=ZqJ8VMFhZfLG9Cby/AmJKCqD2FH/3EZFAuYyfjaNZnlwtmsBXvLjNvOwjWr05ljAAC
         FZqff3T5nYox6HjBsJJkATf1dSknRUBRA0GBaBBs6ZG/j7Vs3++M46a5qRGsyhjygYWc
         I5UUokCAL+9qy37wjyV5CgYAYccNp1MPInhTuWiume5OdrMKbd5IvXx3aVAxlm0HCDNt
         sPAeWkRnUfgkQ97BROHSPzis+6P9DPxIPnnDE3nZbpwS8J6UNcLzNIibJZlSBqiZiCl0
         dkNw173aTCr/M0utcWechcKv7KM2qiZjNfsXgaoNv5uNqtFlBP6Ga8Vgx26UkLbmiXu/
         FRLA==
X-Forwarded-Encrypted: i=1; AJvYcCVGLtPlYmihwHpTX0vLOLEz7BbFb5eIQ4bmNsmWNilgBLjHBsDbi8bbrJqxicRlAZAbuhoEP8lNLsNMrg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7zaK4DjrBA2Apv+PCNFVh2vkHa9GG1zjAv/DsW1eZvKDfxmxp
	vrz8+ElTzkAcPxAaO71U/eY300YSdSlwFuU0XzQPTEcwWV06HB3xrdSc7kx86Q==
X-Gm-Gg: ASbGncvCdVn4jagQhyM2r39O1aJqCIBpPa+/BrEJMJ7T2YSz+xrNIBbwrHwhI/9YRn2
	en+EKjTccEskbhLB/Wiva+KrG9epv/syBmGTlBMFPoSN/urHotM5dT3dWM2pmW231MqKB42hbYv
	Awi1aE7crrQmmrkT+0QSYCIlo848uxWufq7WDAjBOEUTatBTE+13Auyqn3icdfwWP9mF0WCcqzV
	KSK26uqKbWOJUK7pdOb0+WmtNnyosSEkWk05XiIuGnQjUAD4b1YAVffsv8oWEOMudV05mg4zZnw
	nV0QvdnXlWvMYGJGjC655lcfzD8C6lq06CtP8LnpN8ysDePQG7/8fx5bBAW0BMz2kgIALCvuNfe
	VPtKK
X-Google-Smtp-Source: AGHT+IHVGlZCAdSiwwxIIDU0/vbdwHIDdUcAS82VRxXOOKEokRZbUd46s+cUagR8D6kkBJpJNSMyEA==
X-Received: by 2002:a05:690c:c1d:b0:70e:4d8:5cab with SMTP id 00721157ae682-717c149b229mr33047897b3.2.1752121326994;
        Wed, 09 Jul 2025 21:22:06 -0700 (PDT)
Received: from [192.168.201.155] ([76.200.76.117])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61b4cc4sm1270447b3.67.2025.07.09.21.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 21:22:06 -0700 (PDT)
Message-ID: <680b91c0-0fae-4230-9fa1-da988cb82e65@gmail.com>
Date: Thu, 10 Jul 2025 00:22:02 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: Documentation: Improve grammar in DVB API
To: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20250708155206.91281-1-hannelotta@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20250708155206.91281-1-hannelotta@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/8/25 11:52, Hanne-Lotta Mäenpää wrote:
> Fix typos and punctuation and improve grammar in documentation.
> 
> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>

Overall, good work. Here is a suggestion for future patch series:

Subsequent versions of patch series should be posted as replies in the same thread. Currently, each version is its own independent thread, which makes it hard to track changes. This link has the documentation for the proper way to handle subsequent patches:

https://www.kernel.org/pub/software/scm/git/docs/SubmittingPatches.html

The relevant part starts at "To that end, send them as replies to either..."

Another good practice is to have the previous versions' links from "lore.kernel.org" directly in the change log. 

Thanks, 
David Hunter

