Return-Path: <linux-media+bounces-30041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52444A8641B
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82EE58C0E70
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2DC221FD7;
	Fri, 11 Apr 2025 17:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XvJet4ta"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5C1221DB3
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 17:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391108; cv=none; b=K1ppMehVDg5rPTNCTq5rLyUoqBjIX/MLFUtOup0xTgTMv1dBGnjdad99ufZOye4POMBPTUhpvyJd+s9HzJmiaICxOkCkEsYzX6HJ7dECunCvJZNPUsCn4AiLBrmZkHhf8G1Ek6sVYMuCuCE+YWHr6u0HXNfh9ifkiRq3XhFxxfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391108; c=relaxed/simple;
	bh=Zs24uJAaPNdL7CMzi1gfleFstPNRatFfxR2lJdWyGy0=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=D0gyhFxJpb4CMWw5HPmPe6Qw5DcBgFs33IYFR2cYTutjpzfj8Dhlo+5T4AhqHcGXZ/TLMbkzfAyvl9gUh3YAzfap0i9kp7h0Mhu2DAFHY16u1sipDOxuL8EDRznPLDLRAtsU0M0NTFRiQOqg+LOKPEtO9hLO0w47CnrIICdAamQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XvJet4ta; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224019ad9edso30573455ad.1
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 10:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744391106; x=1744995906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zs24uJAaPNdL7CMzi1gfleFstPNRatFfxR2lJdWyGy0=;
        b=XvJet4ta3eOAGfjticpH7ME4nff2cHJhtanIpB14HhW8IVhET2Y1kRk0kqzRmPh/BM
         blSgj6Ffn8llUOpzv31KfC7s2UtlOobR4Udy1S05gKBDD7S+r1wt8PwfFvVr0HyyoWUQ
         H1ur6WZhKsvsVyDP9bbHVUq1VUcqBAcWW7lcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744391106; x=1744995906;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zs24uJAaPNdL7CMzi1gfleFstPNRatFfxR2lJdWyGy0=;
        b=csS+XV8pev4XtgEGntcRvetVfCk/CSXOId9rVksDfl6bULz/+QWVTc3UeJZOp6z/fO
         MsH4pu1RZDamhCXwnU37qvoOt2AGI0tMnsjSN7bqJCUeaJUqMw+Rz2jHwtLWUIu2h0nn
         X2een2qI5xkn6W44mpi8NGsC4p1mLxVZk1Po+r4A9iiVIkuFo5oBwpsUVNQcUo4LRDiy
         zzAQsziHg725xl0upkFVwuHifO+k4avmK/pfBmp9FME/E+V+Pm2lIY2Mfb4UFm1r03yL
         Sp5ciodgxsncDa9HmiRNA72wvi5SbDrvsEuEA+mt/2xh3zJ5876o8Y+mWGpb/qdSR6eW
         pYsA==
X-Forwarded-Encrypted: i=1; AJvYcCVLE0ApO1NjlwaE+Mxa1Iy9vrcxazHo5fT0lLHWVPsVcpwZF+Yv/MQGa5zPjdxo6yl1jL14ozXwbMyPWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykfOHBG1AaaPzIa2jCj9uzq3Or3NTK9arr+1FpxJAWyBwunhqr
	jXFm7bp2vzyY98E1p5M/EjqhWuF3qvJdCQ3cAhZu/LjjhQxDaoHQCu6/e2cuCg==
X-Gm-Gg: ASbGnctAucJHFJekeqqeK4iO+sQd8Ev5eclr2diSLH4xpP+KRU+8iS1Rk/fbQkNmzFd
	KscUmWhP2RX3FAM3A2r0k//NwxuvNP8PrxTdMBoXQ+uximVDny4LDcorrRuCAS0ySvzbp45/ax8
	BBYt80j6ThesgI7DJq2mXJePvHcspWFhkxE+fjXiH4WzHfNWZN2QaBkbvgLkX+qbzF3qfktGkYL
	cJ322tvweVIgx+azxYIXvj12njhTg3gnLWVIWNkiPdjVVZ/7MIlQ+imlyulQFODo0htixD8HbhR
	fXC4z3da4lpVkWofme914vx1pavN943IsvYVWxjVMuoVWgC0FHBGF4A4hIPPrMIAk4WCjOguCxR
	Q7DE=
X-Google-Smtp-Source: AGHT+IFsxw8IYiWvCcCfohL9OR/GeWdiXtYFPHAC7JyqV95Ksyc9aMccKi6WlaMRFkxD3Uw+BXU/BA==
X-Received: by 2002:a17:902:e5cf:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22bea4efe58mr64393975ad.40.1744391105389;
        Fri, 11 Apr 2025 10:05:05 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93aa3sm52081595ad.149.2025.04.11.10.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 10:05:04 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: "Kuan-Wei Chiu" <visitorckw@gmail.com>
CC: Johannes Berg <johannes@sipsolutions.net>, <tglx@linutronix.de>, <mingo@redhat.com>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	<jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>, 
	<andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>, 
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, 
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, 
	<dmitry.torokhov@gmail.com>, <mchehab@kernel.org>, <awalls@md.metrocast.net>, 
	<hverkuil@xs4all.nl>, <miquel.raynal@bootlin.com>, <richard@nod.at>, 
	<vigneshr@ti.com>, <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>, 
	<davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>, 
	<parthiban.veerasooran@microchip.com>, <gregkh@linuxfoundation.org>, 
	<jirislaby@kernel.org>, <yury.norov@gmail.com>, <akpm@linux-foundation.org>, 
	<jdelvare@suse.com>, <linux@roeck-us.net>, <alexandre.belloni@bootlin.com>, 
	<pgaj@cadence.com>, <hpa@zytor.com>, <alistair@popple.id.au>, 
	<linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>, 
	<jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>, 
	<dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>, 
	<linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>, 
	<oss-drivers@corigine.com>, <netdev@vger.kernel.org>, 
	<linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, 
	<brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>, 
	<bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, <Frank.Li@nxp.com>, 
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>, 
	<david.laight.linux@gmail.com>, <andrew.cooper3@citrix.com>, 
	Yu-Chun Lin <eleanor15x@gmail.com>
Date: Fri, 11 Apr 2025 19:04:43 +0200
Message-ID: <19625cf93f8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <Z/lFQ85vhSQiFDBm@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
 <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
 <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <Z/lFQ85vhSQiFDBm@visitorckw-System-Product-Name>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity_odd()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 11, 2025 6:37:35 PM Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> On Thu, Apr 10, 2025 at 07:08:58AM +0200, Arend Van Spriel wrote:
>> On April 10, 2025 12:06:52 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>>
>>> On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
>>>>
>>>> This is orthogonal to the change to parity_odd() though. More specific
>>>> to the new parity_odd() you can now do following as parity_odd()
>>>> argument is u64:
>>>>
>>>> err = !parity_odd(*(u16 *)p);
>>>
>>> Can it though? Need to be careful with alignment with that, I'd think.
>>
>> My bad. You are absolutely right.
> Then maybe we can still go with:
>
> err = !parity_odd(p[0] ^ p[1]);
>
> I believe this should still be a fairly safe approach?

Yes. Or whatever the name will be ;-)

Regards,
Arend



