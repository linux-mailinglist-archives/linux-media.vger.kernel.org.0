Return-Path: <linux-media+bounces-47896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFDFC93BD0
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 11:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E72174E2713
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 10:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5CF26F2A7;
	Sat, 29 Nov 2025 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZb017sb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB49036D4EF
	for <linux-media@vger.kernel.org>; Sat, 29 Nov 2025 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764410494; cv=none; b=Hh+YaZwFWD/udYbPXPBqgg5rBZu2W6pkOhev6NNUMNmUQInDzf6QBhy1MwregMwLc1sc/KeuXnKwL9RQxehguk0n6404jDa80HozgytzR7y7BiZkHZDoWg0pb+m1qG4ulnItOiVmrdj8piSzwE4UgpKUKhs9nBom0VPtYmX+wZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764410494; c=relaxed/simple;
	bh=2Td8eObaQI2RBfmKV4a8hKHRj1z69/JDdEUjGeJSgMQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ChkWOif4P5N8IBD+LgIkAJOHY/KwzMYbszdrqSmC6cB7HRGAMrYszpzHSe6FHHlWjhUqR4dcNDImXjz1UXK1Z4AXzNRmNbBThDnDvQAsxMH0bR/PJJG8whjDRFb6NFPPwwf5OycWQjjSLlP8HhhAbEVmUKY9KJCl9kjPCddJSfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZb017sb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2953e415b27so29752905ad.2
        for <linux-media@vger.kernel.org>; Sat, 29 Nov 2025 02:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764410492; x=1765015292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Td8eObaQI2RBfmKV4a8hKHRj1z69/JDdEUjGeJSgMQ=;
        b=jZb017sbPM4EIwlbHIHdHKQQH9BFhi80OY+z0kR5jqnNTNFjU01fS1eoqcUQw65E06
         33O5FW0xElw0owTuB5bdpyY/9zoeDrc7Fqzq2P4h2FGuieVvR7xDVPGCzD5Hmt5TB0Wu
         jTpf87UcEHVB6utfqfHyfpBSjJr90iaZrDwgo946hIx6NWOP5bXYwZx3zyVmPhXTqte1
         zj0SJBhC03MPX3aFDXdlE7/FKWffcHLNNYVci36Sow/u39XC7gvOXPsLXKa38aCWbHiH
         TQc/Rp3owqFcJDEGAk2kuyPlgJfA0o4WSP3hRk7xlG4Mmf7ioCf/lQs1AaOP140/uRGI
         xPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764410492; x=1765015292;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Td8eObaQI2RBfmKV4a8hKHRj1z69/JDdEUjGeJSgMQ=;
        b=cpP3+VQ3TPzwTlSvMxC6i2tIRjpVrSR9LL/4qCfgj1XBDBKwbqB7O9Z640w9yGgDoN
         Phj1mN7j4vDSU6dmDrIPA4cryEk1XgZ5SzJb9USpjflk7weEVbnYyOYpC2d6sNZX7Fp1
         p/FyHTWsB9RvuGwMsU/xW/ryow/RBRhxEPwPL/mXBhMQeLyvlPKo1U4e6m9zgWGtiF/K
         lDzOGGeRf3+yOoTJp54OLm6HRv91VT2NtvvhYhA22djj32mjIBYZnGZjH+jIvHT3bBXO
         erPyEqlTAnBGq1f8AmIiFgB+OMmjWZsBUqJk8eU/3fGWpSUZUqj7MeIuu1wfZBEpt0sc
         mhLg==
X-Forwarded-Encrypted: i=1; AJvYcCXVoaLvzt/WnVoIHf/CohaJMTCbYV3b6FS/55c68Avmi+cZO/HmZ04S2e99iho5/yVik0ykSeupQIsBNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpmxqLKmSJNsgBff2ceY1AqXvKN2qHYzyu+Nk6vCmT5PzYxk2R
	twdnBqS0gV27WPn/6+OL1Xy8U/Rz9Hw4xOCNPmnFr1qEEA+BKz6gAREGvn3/2g==
X-Gm-Gg: ASbGncshg/TUig0UVazYSnves/dFsiNoC/98tjK59OWcPlLoQ/gFOZ/8OMTqZBgTV6p
	S3QMhsbVUUpdHWgJo6qJrqv0CYd3WQymjSFaZYrtFZX37dFAb1333XGTdAEUdcwN24eLiym5xJW
	0VoMzq1QA+gqj4cI2afSbPWQH6CKuOZZlG2i+R0TgJCElhgRqF9e0G+rXqDoquLOwx4hxEZB/A9
	b6892Lxxn12ZbxUrijWulBwm5KVljcyEQ6Zj5XHirjkExOtQOdVX+Ctrjpp5yYkyXKjOGb6vb7u
	Exs2rseJheKXs0OqNWQ9kWA3M0PktRTZG3ej6/1Krc9SfI22HOIrCO8pJ59P13al+FUBJML1HNA
	q2UmptjRkwgHywWUtLxSDyqCzbDjUBB8BnvVABlq9S3I2qNpP2YCgszV7n5qaWU/m4oFQH9nSbW
	++Z7ukinTBdnjHaoCsUXtSmlrXLTwoF2nYy+Hipdk1Y5Q2FTbYjg==
X-Google-Smtp-Source: AGHT+IFsTaqvf2tFWEm5TV3SS8yHPku4EY4QCqFHQSb+PU+QonuQTfrbuAPAcLA69bY8qUNsCpMyAg==
X-Received: by 2002:a17:903:15cf:b0:297:d777:a2d4 with SMTP id d9443c01a7336-29bab1a0a02mr197176955ad.46.1764410491848;
        Sat, 29 Nov 2025 02:01:31 -0800 (PST)
Received: from ?IPV6:2405:201:31:d869:ca83:6d4:140:3932? ([2405:201:31:d869:ca83:6d4:140:3932])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb24872fsm6846509a12.1.2025.11.29.02.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Nov 2025 02:01:31 -0800 (PST)
Message-ID: <ece65a84-58ea-46e8-9f59-8e976dcb9854@gmail.com>
Date: Sat, 29 Nov 2025 15:31:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ssrane_b23@ee.vjti.ac.in
Cc: hverkuil@kernel.org, khalid@kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
References: <20251126190410.94933-1-ssrane_b23@ee.vjti.ac.in>
Subject: Re: [PATCH v3] media: radio-keene: fix memory leak in error path
Content-Language: en-US
From: shaurya <ssranevjti@gmail.com>
In-Reply-To: <20251126190410.94933-1-ssrane_b23@ee.vjti.ac.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Pinging if missed


