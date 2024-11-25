Return-Path: <linux-media+bounces-22005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C679D87E7
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58A5116497C
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681261B0F1F;
	Mon, 25 Nov 2024 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VRPloq9M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80841AF0C0
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544856; cv=none; b=XEZ9qnn4OA177jGnl+PFD5QN+APd+4E8ThrT1RlKXAz2G7tUPaH91sFzhRmSvR96gcARu+0rEUx7f+ANFtrnfxRmWBKAbDSAPFRvP0f8YE6TxhjP43LN+UTrutj7wF6E6Ep/Lu0b1AQYi4HkXBlOw/ISIGdJwPvkn26Z0PVsJqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544856; c=relaxed/simple;
	bh=U7o1D57jtLh59OsO10ECFtaACJakljAhHoDMoWgTwTk=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=N/TFY8gfBgj6MMkw/6BElR9IIwfqpXZmVYu581zgvcnlu4QZXqoYJnMV1P6glzGwBRV13NaDdpPm8mpKfcgm5jj46yw3CjDIJZPZbO3r15TjxhTmiOCvFM7TNXP4ibktmsrahYKon2uD+f/IErCUftjhIpMjnTFJMPgQJnz1jsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VRPloq9M; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9ec267b879so677304466b.2
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 06:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732544852; x=1733149652; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/ahLoTkOQbUNPLddwR8ZxbuZmpOwlJuFObCG9r4Ks0=;
        b=VRPloq9MfDUX9YWH/ZTbcLKHfTH+RH1IyFwzvIQQ7XJFhbgW2xKN22HB1RGsHqYtM1
         b/BppOySOW3r5nRi9/052TMv2XE1pcks8qjJCdHf8DLy2BFI62kN+wGiRHmG6yOz1Yyv
         b+VmMZEcOnnVZP8LFOXe1jwLDan/UNgLlN3/J4aFq3QTLOdqeHO/IPgTlR7yHERerKaL
         IfVw4rZs27sKRi8OCGgBop8p4FiyqE6844hVAEWuCtlj1a0Bd2r9ULEs3Gt1fhmb+MMr
         6WMKl7+akeSlt1DaxPkQsMxfC59ALozdNnLIqLVuxv5GOfTme5Hl0jfVG6wmDgAZdY7w
         FDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544852; x=1733149652;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y/ahLoTkOQbUNPLddwR8ZxbuZmpOwlJuFObCG9r4Ks0=;
        b=Tc8sApy0QUj5hZo+//rMmvSxCv6KljwkjKSW1v3kL+bb9Lzy3nFH60Qh1X9cguhER7
         bE2cP+J1Oddv0mAuGuVWXjIcpbXVf+Sm5o7TRIYMVIIL51r/6uqGiaS/WeE9M3kZVQam
         kyisF4rdPp4GlFVeha/vuRQ5B8eIxRVnuYNPfHKRZPpa+WP/Pv6wIRKUFop+RGCtNi8/
         sMQGfYTGm/JhDSuz3vlTMHoK1MrIgcXJEUGAR6klCtIlv7LYoJe/8fgnpchihpmWq0I0
         bx/LZICdQkWt7fpaf/a87jAehfjN3JP5nU/f2rif2ZzITo3IhFO38MHmkHghjUS5zPS5
         Vfjg==
X-Forwarded-Encrypted: i=1; AJvYcCUgH4/z6YJgMDu6EWYqGsGFa/Mf6ffl5+y2WkIXQT8yAf7uL88PvnfXq/gWxaey3ATgnk75NTmRHo31mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8TKXkEZ7XKLxrE1mY/E15vHCQhlIAChej2mK69B6AT0UpjknU
	13IbRFfUHxpx+gK87QmO+qfvcxxkCz/9WYbXSBF29zXP29t8paJopaeG+oZqf+0=
X-Gm-Gg: ASbGncv7QRXvET9R4c3A9lP8dTvQW5IJ6wfPOoM1UhyA5ahEjTgs7e2WPurGItc2OCo
	TXxNzPnPhSmF3s1N3aNo/TDyPNHHi1BEDV01nq2w8XKEI4xNzORaodx/zdp6M2Ze6ziSv9ho27W
	duoHDC+5/FICeqSPGeA8lqg95x+/pzWQgbTixq1QPMIkccTzdeUNkb8KuQdImkWXkqAGE/s/Dd1
	vaNhVYsyCLFa9c3F8xgNVfIM//pSDfZA8LUNenp+XrNDsnyRyCHbhMdjHIL/jDONNCUodJaPaZn
	0r/v5oMsj6Tc4vM=
X-Google-Smtp-Source: AGHT+IFgbHxmjImxNV3kZB80V8ydJqDA7TNH+whiROTVRZ0/HcdPVatBu2UqWg0PqhvwrOKRhKe/uQ==
X-Received: by 2002:a17:906:4c2:b0:aa5:da4:3c0a with SMTP id a640c23a62f3a-aa50da43c96mr847236066b.59.1732544852161;
        Mon, 25 Nov 2024 06:27:32 -0800 (PST)
Received: from ?IPV6:2001:a61:13d6:901:7eb2:25b5:1313:4c48? ([2001:a61:13d6:901:7eb2:25b5:1313:4c48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b5bdffesm466680866b.204.2024.11.25.06.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:27:31 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------28AC3v0ghe0AXOY8l22zAvJY"
Message-ID: <21c2fc3f-e55a-47bb-a51b-b53e5cab1e67@suse.com>
Date: Mon, 25 Nov 2024 15:27:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [media?] WARNING in iguanair_probe/usb_submit_urb (2)
To: syzbot <syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, mchehab@kernel.org, sean@mess.org,
 syzkaller-bugs@googlegroups.com
References: <673f740d.050a0220.3c9d61.0176.GAE@google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <673f740d.050a0220.3c9d61.0176.GAE@google.com>

This is a multi-part message in MIME format.
--------------28AC3v0ghe0AXOY8l22zAvJY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21.11.24 18:55, syzbot wrote:

> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
#syz test:  https://github.com/google/kasan.git 43fb83c17ba2

--------------28AC3v0ghe0AXOY8l22zAvJY
Content-Type: text/x-patch; charset=UTF-8; name="iguana.patch"
Content-Disposition: attachment; filename="iguana.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcmMvaWd1YW5haXIuYyBiL2RyaXZlcnMvbWVk
aWEvcmMvaWd1YW5haXIuYwppbmRleCAyNzZiZjNjOGE4Y2IuLjhhZjk0MjQ2ZTU5MSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9yYy9pZ3VhbmFpci5jCisrKyBiL2RyaXZlcnMvbWVk
aWEvcmMvaWd1YW5haXIuYwpAQCAtMTk0LDggKzE5NCwxMCBAQCBzdGF0aWMgaW50IGlndWFu
YWlyX3NlbmQoc3RydWN0IGlndWFuYWlyICppciwgdW5zaWduZWQgc2l6ZSkKIAlpZiAocmMp
CiAJCXJldHVybiByYzsKIAotCWlmICh3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmly
LT5jb21wbGV0aW9uLCBUSU1FT1VUKSA9PSAwKQorCWlmICh3YWl0X2Zvcl9jb21wbGV0aW9u
X3RpbWVvdXQoJmlyLT5jb21wbGV0aW9uLCBUSU1FT1VUKSA9PSAwKSB7CisJCXVzYl9raWxs
X3VyYihpci0+dXJiX291dCk7CiAJCXJldHVybiAtRVRJTUVET1VUOworCX0KIAogCXJldHVy
biByYzsKIH0K

--------------28AC3v0ghe0AXOY8l22zAvJY--

