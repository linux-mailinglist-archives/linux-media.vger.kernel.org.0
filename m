Return-Path: <linux-media+bounces-27845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7A7A570CB
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 19:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFDB73B824D
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 18:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666F324889A;
	Fri,  7 Mar 2025 18:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="DkWjcQAC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8482459DD
	for <linux-media@vger.kernel.org>; Fri,  7 Mar 2025 18:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741373402; cv=none; b=VLXNnoYjtv6I5EqtImgzI2PjWlyyjSsPLpLZtOgAzYaGwOtn92UgukyPnjy3f63g4UsfU0asMf0IGr9/hjxYk/h307weIQ57EJLemsE0eCo0Vmf1oOkZzZNFMvS60oN1+L7RXjV0QPxIJBEWjaAWuCXtu13McRNC0lxHgyk2WDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741373402; c=relaxed/simple;
	bh=iY8btfX+g/V/cLT+RlidyZhd+i1kGYYOkkkl+VytfXM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=uoo6oc3rBDSSmdqysNVdc5rm5dDKsDAsOUPJmgNaZnwMGeAYeYxAYciS7jjbQlfBW79S14PdzpQYqtPY7M9gd8cTNo1uf4tBfdtW8ndRGOuIJ/uKEGP7rocr0yYyFoWclgJZv9I/erbjCpZH4mLmIGeLMr2GJrgPY58BNa0NSsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=DkWjcQAC; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390e88caa4dso1250205f8f.1
        for <linux-media@vger.kernel.org>; Fri, 07 Mar 2025 10:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741373399; x=1741978199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iY8btfX+g/V/cLT+RlidyZhd+i1kGYYOkkkl+VytfXM=;
        b=DkWjcQAC5C0/tvdNiOQOFtyEoSV+GivWOME44KbetdV2C8s9mjk9kJMlq69hUV1xpJ
         C/d4ewKlGNRFEvIBNZRQrY+TcB4ulGj99/8idRRQmKUjj6OiQjEIsbZqa/DUCpV+vc/s
         q8tbCBHmrACDAIxxYlm+hj8K1fPoEitZbhPwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741373399; x=1741978199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iY8btfX+g/V/cLT+RlidyZhd+i1kGYYOkkkl+VytfXM=;
        b=iK6TG6wn5DgC2cQkxFl8eudQvV74tywixjsJ2dHV262w+BbjX+BYqiPC+o1nG0cvmb
         JLudOYJWNRF/sDw2byazqwfwfiwxo4XqBDxQCfpqWIieafix+K4t7uz9Ra9MaszWMi2G
         vQlzuiCJzUmbMRIObqKECY3shrUdks7gWTHWK36aGhV8qC7NhxUpY+mB1mtbog6kkqya
         sFfJVfW7jVSN3MS8vXJpa5O0jtV8vUnOuGM6JGN/NQ6ecz2uVDUUbMMqYRgErkbdWT1c
         tCp0nIaqCQF0mYylVz/snDfKsj2v6nUrZrRDw7WhE1ebBwPcttRssQezT6Xsn7kHPddU
         EbGA==
X-Forwarded-Encrypted: i=1; AJvYcCVGsVg7oozvZoNXvs+OPz5W5V4XLOeJIGZcs9D8c50OjYCzMwJk3/oUmVkm/Q8HljuK1miFtmow+/JD/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5bNUkTb9dzMxZr6gbQinCABYxr73gCUkD8Ma/Kym+Jomdds2
	trFLeQ69hJB4apcQt591LYoqKg97n6Mm/J7tcGxVf73AcgcxewLXXYIngtniydg=
X-Gm-Gg: ASbGncvki3a4tdRrpC2KzymTBRXXIGnldwtO+U4pvzaHoFDfgnJavrOyZCnp18pV4ZC
	LrF00UQFGT1uppuVsefFYMdF9DAJeyoSGxSMVce9Ie8lnSTlRU6eipWUyT9Bn+eeItSvUQQupmk
	W8QoN2YVBckcfquIPGww8QfliL7qpIp+lSmIC8qq0pyOTPFd5RzQkS6IeBrMvElHQkw7Qt3qeAm
	KhlwcL+9naHpAl97a1UnEDfU0Myy12jL/t3VMqIPYqoo3Uaaxq/xq4iGaTNLiDMzz7JGKc4Dnv7
	pcNQ2lR6sME3YN8Y9tC3qHfGrdhbfWSBtcwPb8Swc7xTqFlzDp1Cg90k11Sd8fGu9XXQAd0v0nS
	gQVvPvUn3
X-Google-Smtp-Source: AGHT+IGmeOPTWjHa0Be27hfI/1kYnZp0UHx0P0R/hj81LDLYhuR4kj7WMmpAAdsX/afUuDK/xqqF5Q==
X-Received: by 2002:a5d:59a7:0:b0:391:1139:2653 with SMTP id ffacd0b85a97d-39132de145bmr3407200f8f.52.1741373399039;
        Fri, 07 Mar 2025 10:49:59 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfba848sm6051474f8f.4.2025.03.07.10.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 10:49:57 -0800 (PST)
Message-ID: <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
Date: Fri, 7 Mar 2025 18:49:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hpa@zytor.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au, andrew+netdev@lunn.ch,
 andrzej.hajda@intel.com, arend.vanspriel@broadcom.com,
 awalls@md.metrocast.net, bp@alien8.de, bpf@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 dave.hansen@linux.intel.com, davem@davemloft.net, dmitry.torokhov@gmail.com,
 dri-devel@lists.freedesktop.org, eajames@linux.ibm.com, edumazet@google.com,
 eleanor15x@gmail.com, gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
 jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
 jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux@rasmusvillemoes.dk, louis.peens@corigine.com,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mingo@redhat.com,
 miquel.raynal@bootlin.com, mripard@kernel.org, neil.armstrong@linaro.org,
 netdev@vger.kernel.org, oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
 simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de, vigneshr@ti.com,
 visitorckw@gmail.com, x86@kernel.org, yury.norov@gmail.com
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> (int)true most definitely is guaranteed to be 1.

That's not technically correct any more.

GCC has introduced hardened bools that intentionally have bit patterns
other than 0 and 1.

https://gcc.gnu.org/gcc-14/changes.html

~Andrew

