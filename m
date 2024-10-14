Return-Path: <linux-media+bounces-19632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 912EA99DA0F
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 01:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C29911C210E3
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 23:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F84C1D90AE;
	Mon, 14 Oct 2024 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqsR0seM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC59B17BD3;
	Mon, 14 Oct 2024 23:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728948091; cv=none; b=Bcp2vpBIPnpjnAbHDFf/XWCIbLLBX7AvNhYXqbBQLrUdi0F2cYT7X0XFmexdAeFw+pDb6tdN8SescPjCpXN1h96tRZk3t+/QKp2NDB5x6+8/YlI20qrJDMPLdRe5hBZzTLLaUz0x/R5XPTdw6br6jflHxoZT5QSZunA8NYwCovI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728948091; c=relaxed/simple;
	bh=e3vtLygN+A7fWhOV1HYkrGuJR8zj2S9HSnc2RW2JCeE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Q2yieUxBiOqn4dEdpzVQQmrhAzCXpgVkdgHU0FwP894whJqaZ58G0sqflVfCaWECVp4lkzkt+bcRmjND9GHXLtshrvUBeKmmHCqczv6SWUjkxYIuUiCQXdlmK5l+ZlEx4g/fWJ18SqrfXZ0TIhQpEpVR/PX+gcHsUElTSdcQK0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqsR0seM; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb443746b8so13255761fa.0;
        Mon, 14 Oct 2024 16:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728948088; x=1729552888; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR5NLMkMxMxIfFeu/xX+td4K3oA4NaFGATD7ANclrqA=;
        b=lqsR0seM+3KO4o6sfz1UveS1hIyD6BGBQTZD6HkFjU/RKK5LqN5cvWejrmAY1JpbWj
         cEvBw7ZsrU1nFCW6OvjvgLiCxW8Q4BsyDenvKKX9B6SvgaoWK32d6KABxPGx0vFj9owP
         SWU/MgMt8mcI1PFSf/hbiTKu23xqSOF8AVZzymYMxv9NXl52oqv7aab34wfp4s3BzfqL
         4+PyMKpKFrI2OTwxoYDsdXCsgTqsx8PIIfLGUyTwvha0sNiSEuK9eY+p+njk3UQZwuNj
         pTbUW6mrDIQbS6DLRNBV1p8PHCycUtEx0qNLbLhFHMbzRK+syJEbV5gHi+ErvSQdK6M3
         nPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728948088; x=1729552888;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IR5NLMkMxMxIfFeu/xX+td4K3oA4NaFGATD7ANclrqA=;
        b=JFV/7PpOssOmYFwwP2gcgMMbg1EK5XGOoLeMPFAx5BS8cxJ/TmhTsjfIp5Wge9L1o5
         B7vdThKRy4xuwh04dKKBV/SNXOXmUfyntOjf24gtyNC1lH/OC1y8asrnGk+I6NHb1qR7
         mKdsAS9BUEyaeUY9fG82GL1j4XjW+417c3SKooSScRsOSH9rkW6O1iNVcWTX4EEMWCDr
         zU23T4wvOj/fum4Xwg6z/UQrdTv5iGqt/CIlk9ARV4gIDiZF2PHm+YJjIQbv4qtFZmAo
         fHkTrVfKZIWXaoC6tZ9Lj7LQMtFHaRjOchD8nGomnljnWPOUPqjz816/h4jueDcB3z2t
         pHCw==
X-Forwarded-Encrypted: i=1; AJvYcCV6OXpUSLx+fOk5y+I1OyROr5JFcFopdOYFcAjyEyIl4JaE5by9M9CSs7iAjE2EVXvoD5xN5MXCL5G/Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrknzVQG3Kj7gjihCTxefNwqs3bQdtX1Yu7BdupL8FucVQVRF3
	5H+Q99X6Js09Nz96NU16AbgT6sVgyGR/b3zkvhP0wAEA5oip9TFq
X-Google-Smtp-Source: AGHT+IF32rTh1P/xwRaa+CjhSTWMPT0O4AGlkShdMJru3Zw7gGdbgbQNIpWyQZHhtjI6Sq1w38oEsA==
X-Received: by 2002:a05:651c:b1e:b0:2fb:527a:815b with SMTP id 38308e7fff4ca-2fb527abcbfmr24906201fa.28.1728948087596;
        Mon, 14 Oct 2024 16:21:27 -0700 (PDT)
Received: from [192.168.1.240] ([194.120.133.80])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4313f6c564csm1339875e9.47.2024.10.14.16.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 16:21:26 -0700 (PDT)
Message-ID: <63c91051-3cad-409f-a1d5-ee8ed89e4de1@gmail.com>
Date: Tue, 15 Oct 2024 00:21:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Michael Krufky <mkrufky@linuxtv.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mailing list: linux-media" <linux-media@vger.kernel.org>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: shift/mask issue in drivers/media/dvb/dvb-usb/mxl111sf-demod.c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Static analysis has found a shift/mask issue in 
drivers/media/dvb/dvb-usb/mxl111sf-demod.c in function 
mxl1x1sf_demod_get_tps_hierarchy(), as described as follows:

         /* bit<6:4> - 000:Non hierarchy, 001:1, 010:2, 011:4 */
         if (mxl_fail(ret))
                 goto fail;

         switch ((val & V6_TPS_HIERARCHY_INFO_MASK) >> 6) {
         case 0:
                 *hierarchy = HIERARCHY_NONE;
                 break;
         case 1:
                 *hierarchy = HIERARCHY_1;
                 break;
         case 2:
                 *hierarchy = HIERARCHY_2;
                 break;
         case 3:
                 *hierarchy = HIERARCHY_4;
                 break;
         }

There are two issues. First, the comment states the bits of interest are 
bits <6:4> and yet the shift is by 6 bits, I suspect that should be a 4 
bit shift. Secondly, V6_TPS_HIERARCHY_INFO_MASK is defined in 
drivers/media/usb/dvb-usb-v2/mxl111sf-reg.h as:

#define V6_TPS_HIERARCHY_INFO_MASK  0x40

..so only one bit is being masked, I suspect it should be (0x7 << 4) or 
0x70 for the 3 bits <6:3> or maybe just (0x3 << 4) or 0x30 if we're just 
interested in the bottom two bits for the case 0..3.

Anyhow, I don't have the hardware manual or hardware to test specific 
fixes and I'm 100% about making a fix based on the comment w/o the 
hardware to test this on.

Colin

