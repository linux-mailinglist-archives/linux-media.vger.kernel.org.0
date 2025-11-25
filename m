Return-Path: <linux-media+bounces-47712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C02C861F3
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 18:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 91C9D351DA1
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 17:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED6132E12E;
	Tue, 25 Nov 2025 17:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG3BksSS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CEF32C931
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764090072; cv=none; b=J2KYRFHJ8CXAwpqzhdiKBVKqMY61BE4R4h49baqlJjeQxJ98OO48zkURM0e0louVypoNcaRwuFtUQuqm5RwMl0ATqFXeGui7XDrSvCgnjK7MVJwmAZwVzs056RIWZmtnutgJbBjGBVGQdLinNVHVz1vTGMcYQkTYTfn+6N17Cok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764090072; c=relaxed/simple;
	bh=ZWAMKKmgrsxx4JGoTZ2zC6oWhLCNBA5peXg9n/HVN+8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=T2dfaIdvOTjCAjUoMGf28gRtSHx0wfjxiyHcDRlWB8xhTSlX1oN84V5c3fum8jb0OMwkU8Qxlhb+ApdRxkEtMAOHv+yzpSiYz/e3+68a5lWDGacHwQkwyTVw/6JW+eJwi0avyWNnmAXPeHqCm3XmALQTzqectq1xhPP9C3AjIwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG3BksSS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2984dfae043so52723525ad.0
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 09:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764090070; x=1764694870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWAMKKmgrsxx4JGoTZ2zC6oWhLCNBA5peXg9n/HVN+8=;
        b=TG3BksSSEzGga1EO35clHkbCT3KnZaoijugl4g1FbEJLGJL1unSVHDmGUsfQyMjq8m
         2XbZqf9fMp0X6kuaVVECryhbfyN3updSrAqkUnKXYKw1Itf2faMwM6u5U/iDzkGg7qIc
         cZ79i167Uq1+X98Rj/y3kaUvALnmhWpiH4oJ4cfDgmTeUAgSEeNiNHOQapp971+Zcz6K
         ME8TaLTaw9CvL9WXA1A+7cixa9V3N+jfMSUCiMsHPbrOYmZPfnIAaT1T+pS2BSiVSaEM
         N31GD/YGezj2977VwWZmvqaShalIXZZxjgeNqEHXdMGCBntTbnCi5aBbzVMNccq5mysB
         cLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764090070; x=1764694870;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWAMKKmgrsxx4JGoTZ2zC6oWhLCNBA5peXg9n/HVN+8=;
        b=jlHWHAqHJJGJ7Gl+GWKFmLvcH/dVUrF33DKHh23k7//hJ4RmdcRM3mceg14XCHI6pj
         9y0Z0AX1f8+CN8EZA6+G21TMuZOyhApsM4Y2oO7yNfJ8Ybmyd1W85rVo58wgMCA2bh5k
         Tbsj4Xbs6F63JZ0jYBwGKENRz7+jt7Mj5oFIsMELws8EMhaO6RG08ytmhcM9wXCZMC8r
         dM86zugLZSDaBPZviuk4SNE/9ZbTEtLOuTrqSOkB/rRpu62FP5GcFC5/wAG1actCIu/X
         329gMJo7flWkSp63WXjvLB9mj/LbfKcIc6MoRJwG+i2zJrCkbUeydKGSew772WG8Dw0V
         A8wg==
X-Forwarded-Encrypted: i=1; AJvYcCXYmPM/O5CPMu/mAODQ5PL4oo/9uW1mzxKjLSeqbppI+zD+U620/kYujQ5remZBw8qnLUwD0Ut0svw+aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWudF+by9OBkN0UTqF23UPFFF8e7kHg+1noVUhooCIbbpmg64+
	97aiLHJfXSTpsuOToE42rK+N+XIRDibBKxaKnvPPClumjli8RYtd7luQ2Ull3A==
X-Gm-Gg: ASbGnctONiTtdyeT2CPzlZneC+1UyzXwvufzoyIAz9sROv40oyL6fYWU5dnx0KhQGrD
	bfH/m0CIN+c9tWZR8HQc0owuX1iQWM2kB0FLhqDEzz/3X7xzJz2CP+4CeI2LJmXK9GhIwKnM0E1
	GqLxpMyWEoNjyCod6mjBW0VQOyqVVpZ6rCULD0WTaKCV3mMKcwi6mxW42didJQ4ZvDdEnynRlC+
	XD7N2B1ZdKWvQwaxvUSaxj311jk+r2qgHhVm/75aaJDZ9NbORf+TKA1iEEKY1Tx/mM7cTfSR9t/
	w60i0giUw9CMTTaVYz6p++k01W1oqZLMoTquzmOqp+SFG1o+6gjrRrdG8CA6jJdPUSrl3MBdhuP
	P2y9os9I5EWpT9iYUXL31C2SuzpEuqXdWJptqMGJTp9zx6icda1OJXHNs85cvCzMzE487+wL+aD
	Yt85LOM976MFdCCp3JaWBdNcC4DRA2LG74BZHTBaPNoezPg71dwIjIlRw=
X-Google-Smtp-Source: AGHT+IEhFYICnUs+QCI6cv+QJhHWyIoiKr3TM17aLru8XDaUs+llQV7KkXJ+bKFQqjMPMHOux2Ry/w==
X-Received: by 2002:a17:903:3d0b:b0:290:91d2:9304 with SMTP id d9443c01a7336-29b6c3c2864mr177104845ad.4.1764090068323;
        Tue, 25 Nov 2025 09:01:08 -0800 (PST)
Received: from ?IPV6:2405:201:31:d869:c163:7f74:bed9:a2d1? ([2405:201:31:d869:c163:7f74:bed9:a2d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b26fff4sm174669705ad.68.2025.11.25.09.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 09:01:07 -0800 (PST)
Message-ID: <c0152541-a1ff-4eb4-afdd-5335150f29ba@gmail.com>
Date: Tue, 25 Nov 2025 22:31:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <692560ec.a70a0220.2ea503.0087.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] memory leak in
 v4l2_ctrl_handler_init_class (2)
Content-Language: en-US
From: shaurya <ssranevjti@gmail.com>
In-Reply-To: <692560ec.a70a0220.2ea503.0087.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

#syz test:
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


