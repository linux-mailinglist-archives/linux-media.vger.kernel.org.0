Return-Path: <linux-media+bounces-3857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB145831878
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 12:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 710D71F239E4
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 11:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52949249E2;
	Thu, 18 Jan 2024 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QemzJbtX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D00249E5
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705577434; cv=none; b=X2Z+5/u3fJVauz2KxdrYKjd8CnCP+hoDbnPLVrbNbY1bl6XVVUGOR7+m3iekH5JpD/i4EHTMBgiD1PbrRONv7E/kGYrHtL5TYeLKl8o9/NMuzdTvb7vLroeNBJW+QpqaiSBVkqAdLPU+dLfR7cE4Hmt/ovy/VgdoSJNjv0PDPTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705577434; c=relaxed/simple;
	bh=p5sai/SGkK8KH/ljYXKYJJkR0dRTIJG+5V2SGAt7rWI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding; b=f/8Otw3GpxOGwmISlzgtQI6bc/MJSVia0ZiwNcGBFx+lZC9/hraj7dTXfaoLmJXgVlPqA3Or3Oso0ZdyVf06Gd08l9GVqVBCrBK/c14e+HU4WoCy0w7yq+Zy+5IOfz2en08wAcVYRoxieO896RnHhtIvKUTzCK0q0T76+Theoqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QemzJbtX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-559cef15db5so1197002a12.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 03:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705577430; x=1706182230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAOaqF/l2yaPnLmKJtR5Hs3xWg2AATihoNQmCdSeEiU=;
        b=QemzJbtXS0MhyMRHOibZ3Ds8R+sWm7gjWmFxsrRMTCe2vgapB1kIwHvoVxhTBg4nNj
         wBEmImYZBPoOKvCGXsBojxQI1ZvLoQkFJcHBr6b3x79YapZ9IoOadzv4Rk/iT/UCCDUQ
         YY59wbFDhQpP58OrHG7r328qWng9XvTIn3cUKHNJoTa6Zqt8LrBHzT2yBTtbtgktXKyN
         f2QQ5GEAg0AhcPDbZoacVE8PzY39wiRqWqgUQ/Mfu2T/AJf01orvr7XOOv7St0GcWaYN
         D7zVsv3kxBPL4AwKBm+SGtY0MpIYCoRm4Ij3k5jaG/X2NRbsWPnpl5WVLOK4+qWkmuH6
         b1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705577430; x=1706182230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAOaqF/l2yaPnLmKJtR5Hs3xWg2AATihoNQmCdSeEiU=;
        b=ZtffXPElEIesnMawo+oMJGt8XjLeuRMKnQjrOqEpTKKddN0wdLv0+R5SKLz1+szIdm
         pbg9h8hyWxLkfHyiAQxHo+SOQGnCizpsJMPJyejX9NeNWRzy76oOBbcrS6VvBLvO+wct
         xLOwQ7Bn8ztsy+tRNDCz3ccLeOx61mGeN7/QLs+hqXgetWrARREUspjmfbwN2xBgc+Ff
         PFbT/7WfLUu63la1+2Ec378t5hWhLiQkrNdSh+Bs1b+Im909TepOwjEVTFpaVYJYGHiQ
         6TfFYRFs4OJhBV/Gi4NY223FXqq5cYUJ8I+aNgdb4N4yhZTmcOqmPAC5vGO1G8AiS7uQ
         u/Rg==
X-Gm-Message-State: AOJu0YwPOlk38atuRA+ptPoR36x0r843RZLqMqXxV4sSDfwfXw8o2Oen
	bg1cLplbWhAvEBYFbALl6HzxHJL+5RizQXUU+pBdjZeNXlMItNY+Oxpavx7vSvI=
X-Google-Smtp-Source: AGHT+IHzDhjEEl7c8RX83/GqKdARrd+bmwZidM1M8CVwZGKOFzS10DTY+4iCOEZe1L6ZOLy+pZrqdA==
X-Received: by 2002:a17:906:fc03:b0:a2c:2cef:2542 with SMTP id ov3-20020a170906fc0300b00a2c2cef2542mr844458ejb.16.1705577430351;
        Thu, 18 Jan 2024 03:30:30 -0800 (PST)
Received: from foxbook (bfg166.neoplus.adsl.tpnet.pl. [83.28.44.166])
        by smtp.gmail.com with ESMTPSA id s2-20020a170906354200b00a293c6cc184sm8979654eja.24.2024.01.18.03.30.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2024 03:30:30 -0800 (PST)
Date: Thu, 18 Jan 2024 12:30:26 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: extend the bandwdith quirk to USB 3.x
Message-ID: <20240118123026.55ef894e@foxbook>
In-Reply-To: <20240115005756.536dff4c@foxbook>
References: <20240114213518.03e22698@foxbook>
	<CANiDSCsS-Wg-2h-rcHvPjoem4h-pR1xOJST_EmNTdKum8grSSQ@mail.gmail.com>
	<20240115005756.536dff4c@foxbook>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi again,

> > Out of curiosity, what camera are you using? Could you also share
> > the patch with the quirk?  
> 
> I have no idea what camera I am using ;)
> 
> It's some dodgy no-name thing which doesn't even have "made in China"
> written on it and reports IDs belonging to a completely different kind
> of camera.

In a plot twist, I discovered that the original camera has already had
this quirk applied 15 years ago. So my ID squatter gets the quirk too.
(I think it's a squatter, the old chip was USB 2.0 and this is USB 3.0).

Not sure why I believed otherwise and used to set it with modprobe.
Maybe I noticed the excessive bandwdith requests made by buggy quirk,
then force-enabled the quirk hoping it will solve them, then fixed the
quirk to actually get it right.


Michal

