Return-Path: <linux-media+bounces-21465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0E19CFB79
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 01:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 892C71F2395A
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 00:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F514A06;
	Sat, 16 Nov 2024 00:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hsu5pLbv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E7D1FA4;
	Sat, 16 Nov 2024 00:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731715946; cv=none; b=kEp7vtzTTZy0MmnwtIOKVFU53vCzPzPfY691EsHWIXBYhmx5GpbuVS7W7vKLS8F+8RQ5KPHTud2EdEGNAJ80UxAJcz+lbaL1V/HQDaSlqhHye7O0gLsisGAFZv9c1puTECh/vywOdVRpgHq4v8BHc/OFIZxdR5w153ey1a/SSeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731715946; c=relaxed/simple;
	bh=Y7jnhP9X+PdVQ2CQ/jb0gNsPu8a3ngD//sxhuU5izw8=;
	h=Message-ID:Date:MIME-Version:From:Cc:Subject:To:Content-Type; b=KyyKXYN9zOWFKCizHesUvCZZkkJSz4Z/reJZ3GmRJEoMNsnbZfDFpY7XE8cnwmmeuJ7lA6a6B9c7nN0dSXHwVpMaG/JtqPo95CbdJ+ax9cnpXbocH/sHb+YfpYYb1trFwKtXBU/lQc9m6Fa8HZjL+vIy/r++0MXGxhd1TsjzczQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hsu5pLbv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38235786c73so75114f8f.3;
        Fri, 15 Nov 2024 16:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731715943; x=1732320743; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:cc:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2FWa7ovIg9ko9NDhHNxPz+8DhJtZ8/t4QPaWjU0Tt4=;
        b=Hsu5pLbvz3tdWvwQOB+CDJe+vyI5pRrgCX/XyvXQR2CMO37gW6K87us3tu1fTKrdJ4
         8KYYUwPQ8Ohpezf0qkIICTtcwOGcxbq0UOC9J5tfTUj04ZXfkeRQGssOml4R0eMuemsd
         RKTL8cpFNnuLo/7zbw/vLQMZIp4fHZm2Kq8hzMKzx0t3UpgAPfJybqWSR0XGnoPKPOzk
         la0FBjJGbG6XHEl6Xcl+I6x+3ijIpkoQtCK7+VsBxs9iwIO46WPD/apkoO1iuQ/5Hsq9
         8yhJ2TU3QxBsW9ParhRJ1QWQzr1H64V73ipYwWXFeqTMTyOjc9x29RrgrT2IL+MTaa7z
         FjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731715943; x=1732320743;
        h=content-transfer-encoding:to:subject:cc:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2FWa7ovIg9ko9NDhHNxPz+8DhJtZ8/t4QPaWjU0Tt4=;
        b=AxeiNfTXy7prZ1DrHGNqhdlY0o7oj6oPYRxC1QnzKH3TNqRbnDpHg2ZWqREvXNpAeY
         elYv+1YejBmJcyLAM7Dypnk36aBrXPDdeyubCRzPF7kE+jIltLKRXxPyIy5V5pkOs8PP
         UwN/jLO/izSwnZsfW4XjdpHNhpkKNeQyaX3UEFjeZSepmIAM3ur2185AWBPBM9mpJVkk
         xGL0UWcztE3b7Dzcf+xftODEaBEl9FhXg+Gi2PIZ1sIkiHvQMvFXip71RqASuGPp9KVv
         h1D1ZjtOKD7a6wSjyfwMBJlU5WlGF2NkoUt7yPterQCdVViWaGCuBItbiRPRpWeFMXKR
         3FKw==
X-Forwarded-Encrypted: i=1; AJvYcCVfLbOX0UEqIOaqXrGmIpLj4fspQxVOkNs8SwGscnsfBkkPH68EnWCtMoBQBt0l+c0OAl46g/kTZtNLHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE4Q/HsDyNC5RSpuJ45JE8mcy+ijeqFPVXsd2hKuvN2zadHBVG
	q5w3T7vjfjA60yUqQ+fnvn1nWI7A0vX4gSexbrf+B8XkmqVXQEzzdxKbFQ==
X-Google-Smtp-Source: AGHT+IGrxkJsCiclZzjmscLBf7rpoWaB4lo7NnT0v+CXbG3OgtqhLGRkCnPAO04oSgsxT/M/XXZlfQ==
X-Received: by 2002:a5d:5d89:0:b0:37d:4527:ba1c with SMTP id ffacd0b85a97d-38225aa4a68mr3206654f8f.49.1731715942934;
        Fri, 15 Nov 2024 16:12:22 -0800 (PST)
Received: from ?IPV6:2a01:e34:ecab:8c20:136b:ac23:1f6:8240? ([2a01:e34:ecab:8c20:136b:ac23:1f6:8240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada3fc9sm5606224f8f.20.2024.11.15.16.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 16:12:22 -0800 (PST)
Message-ID: <cb2c20c3-e9f9-4758-92bc-43591946ed9d@gmail.com>
Date: Sat, 16 Nov 2024 01:12:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
From: Nicolas Lorin <androw95220@gmail.com>
Autocrypt: addr=androw95220@gmail.com; keydata=
 xjMEY1VgjBYJKwYBBAHaRw8BAQdAz2n7kjNHne7ZkxorNsqC6fW9enBx9zGLd5L8iYFVaprN
 JU5pY29sYXMgTG9yaW4gPGFuZHJvdzk1MjIwQGdtYWlsLmNvbT7CtQQTFgoAXQIbAwUJCWYB
 gAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAIZARYhBFiBbK6iLbQ0x0TKoL3p1BRts4Ek
 BQJjoy18GBhoa3BzOi8va2V5cy5vcGVucGdwLm9yZwAKCRC96dQUbbOBJGeWAP479DfET1mN
 k5stAx1NoauJjUgqxFsCQnN0FRRKkERzgAD+M9EWStug/IJWh/i0oMufsUJUU1Liqm7zbSRZ
 /uLVbgPOOARjVWCMEgorBgEEAZdVAQUBAQdA7+DEoQ7KinwNOZmseIdLPEkAYpayeJM0f5Be
 Y5mPsgwDAQgHwn4EGBYKACYWIQRYgWyuoi20NMdEyqC96dQUbbOBJAUCY1VgjAIbDAUJCWYB
 gAAKCRC96dQUbbOBJBfXAQDNSRfNEZhM7p3hq5AikRiJ0tEWQ52iChfQ+IhbfK8PKAEAzhBt
 bREc3AKOcWQ7+PPLOL7ztWFKc3xykDOLoxHrcQ4=
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [BUG?] media: ipu6 / ov01a10 webcam not detected
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I'm running the following kernel on a Dell XPS 9315.

   󱞪 uname -a
Linux androwbook 6.11.7-zen1-1-zen #1 ZEN SMP PREEMPT_DYNAMIC Fri, 08 
Nov 2024 17:57:58 +0000 x86_64 GNU/Linux

I'm trying to get the webcam to work but the sensor (ipu6 / ov01a10) 
doesn't seem to be detected and kernel is showing the following:

   󱞪 doas dmesg | grep ipu6
[   29.543059] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
[   29.543294] intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 
0x0 mask 0xff
[   29.549549] intel-ipu6 0000:00:05.0: FW version: 20230925
those last two lines repeating again and again and then stopping at some 
points.

Both modules ov01a10 and intel_ipu6 are loaded.

There are multiple reports of similar problems with the same kind of 
Dell laptop:
https://github.com/intel/ipu6-drivers/issues/291
https://github.com/intel/ipu6-drivers/issues/288
https://github.com/intel/ipu6-drivers/issues/298

I'm running Full Disk Encryption and Secureboot if it matters but had no 
luck disabling Secureboot.

I'm currently building mainline to test. Sorry if it lacks precision, 
I'll be happy to add any info needed.

Regards,

-- 
Nicolas Lorin


