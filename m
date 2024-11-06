Return-Path: <linux-media+bounces-20969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA81E9BDDDA
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 04:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 685EF28477D
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 03:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09BB191489;
	Wed,  6 Nov 2024 03:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvYFs3zo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD2224B26
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 03:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730865440; cv=none; b=MLKicnn5xIzB8c7Upxn82IUI47A2MzgnEtyS9ckb4noTv7dCMjiiA2iLJBqj/xiXn7ylYIgE46SD8Afgp3MRWh6mvE4x8It5aWD8tbzIrjlcKTTxbGfzkV6LaT66/QlGTFFO5SovdtuX2B82NyJl86kMhpNRed/IHE+KYodHhzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730865440; c=relaxed/simple;
	bh=oFdZ/nmOpePjS5C4rtm2ZPHBTdOjMqrcDffhszZNFwQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=HGoHQToiepiUpkaCzKf8n4+3PlzZOK+RuGQyMbXvdI2XLrlyJ+WZJJ9KOjpDUnoA+3cGLfmUVfADWDifk4ulV3zXPvbcPMWxufvk64VS6B9F2UWFhdnBP8krfnZKSmIuQd79RxMTLGl6Mrwt4PeajKJZ28X/yGp9yfxs7+UHxNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvYFs3zo; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a68480164so950675766b.3
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 19:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730865435; x=1731470235; darn=vger.kernel.org;
        h=content-transfer-encoding:disposition-notification-to
         :content-language:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3nc7baPNRZer6DOqg72zylx5TiWFH/QqUMrc6mbGOgw=;
        b=BvYFs3zo0I6P0XGFpjFSgWpjYWiO2dRJmWrFgL7fS2I42xciDkDTDuiYVSB6tTk/pY
         ftGOQrNU/3i0eT3Kgib0XwuoinS26lCeQEA0Z/APxP1swC1xfRtIszcKSyc8RpK2QeG7
         AhJeGGQDwomYmDFbSdVsGa1b2Y46IQAclZttxIezDihDcq0vHW1fWONn91Hm6jV4vqLU
         rDs4D/g6HvY+qzbatlIgr23CJtorOZlASa+RFi+4vzipJuOm9TwDYUWTFltJQDjaBndT
         vBu80dix2pcL7PYLhXBtFvsy/hiek39Qk5/iVH6F62hx7gLDkSTTr7D8CdhiaJXDq0n0
         nHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730865435; x=1731470235;
        h=content-transfer-encoding:disposition-notification-to
         :content-language:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nc7baPNRZer6DOqg72zylx5TiWFH/QqUMrc6mbGOgw=;
        b=b2tArXJ45a0IMO1mKb6KoabwtvxS2UqKPEyMxXyC5JTj7WIVpqi3AAYhAt/bjkjt5W
         dH5nYOCcmnEVczGCb9RHhPfGWWrh+N0B4HNyxukG9NwIDarn7QgS6naTzMuSLVeH04x1
         qUsvRAVnRmkNgxzKf3aukFV1NPQyeZYhc8H3invaQ8QWgxzjvhgnw/Rmvtfi/n0Cswdh
         KQZq92Sh6QDF6MkaOtwICGMbjY3205pq1RuLqhGBfcpJGcApaw/5KZ9WLXi1fVuf49aU
         FEo0If8E+mLvCVKQF2qUJxViwVnnyjH5iTxdzCSibGz+tTdecnc9TvMdoNSAt1v1lY1O
         xDsQ==
X-Gm-Message-State: AOJu0YzNsd8R1F1Rq7kJNbE8EMLC6Mycuh1ab7DxE80adYVTgwCys5ZO
	2h5LVV7Ut4IaSn4qV1fSe8ppKCYa2d0MjEU3bEs3XjrLthfiZ4qQ6s4xEN9u
X-Google-Smtp-Source: AGHT+IEVf6g9rOModtOo3QXDnKbQii3x9opNdo0MBHIc6hCt36di/VL2BmMMhshga0bj1B/NMjbrNw==
X-Received: by 2002:a17:907:1c22:b0:a99:f1aa:a71f with SMTP id a640c23a62f3a-a9de5c90d49mr3895900866b.11.1730865435341;
        Tue, 05 Nov 2024 19:57:15 -0800 (PST)
Received: from ?IPV6:2a02:8071:3484:bc0:caf7:50ff:fe30:727e? ([2a02:8071:3484:bc0:caf7:50ff:fe30:727e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb171550esm216065866b.88.2024.11.05.19.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 19:57:14 -0800 (PST)
Message-ID: <9384e740-8d72-4da6-aae4-3f0385dbd845@gmail.com>
Date: Wed, 6 Nov 2024 04:57:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: schorpp <thomas.schorpp@gmail.com>
Subject: Buffer overflows recording HDTV with saa7146 and mantis DVB-C tuners
To: linux-media@vger.kernel.org
Cc: vdr@linuxtv.org
Content-Language: en-US, de-DE
Disposition-Notification-To: schorpp <thomas.schorpp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Hello,
> 
> I've build a new VDR with h.264 xineliboutput plugin software decoding
> 
> and got a problem now with
> 
> buffer overruns and distorted recordings on all HD channels:
> 
> ...
> Nov  5 05:32:03 vdr2 vdr: [32753] ERROR: 47231 ring buffer overflows (8879240 bytes dropped)
> Nov  5 05:32:09 vdr2 vdr: [32753] ERROR: 31042 ring buffer overflows (5835896 bytes dropped)
> Nov  5 05:32:15 vdr2 vdr: [32753] ERROR: 47325 ring buffer overflows (8897100 bytes dropped)
> Nov  5 05:32:21 vdr2 vdr: [32753] ERROR: 28306 ring buffer overflows (5321528 bytes dropped)
> Nov  5 05:32:27 vdr2 vdr: [32753] ERROR: 14033 ring buffer overflows (2638204 bytes dropped)
> ...
> 
> This occurs with both saa7146 and mantis pci tuner cards.
> 
> This has not occured with the old VDR system using Broadcomm's crystalhd decoder in libxine.
> 
> LIVE TV works fine.
> 
> I've tried stable and testing minidvblinux.de VDR live systems to crosscheck, but same issue occurs.
> 
> If I increase the buffer for the saa7164 cards with module parameter it's getting worse and distorted picture and sound.
> 
> Any Ideas?
> 
> Increase VDR's buffer in source code?
> 
> What is the correct driver module debug parameter to provide a useful debog log?
> 
> Y
> tom
> 
> 

Not a DVB drivers or hardware issue.

Good old Kaffeine DVB app recordings are OK, no distorted stream.

VDR BUG!

y
tom

