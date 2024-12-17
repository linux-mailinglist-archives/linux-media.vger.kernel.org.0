Return-Path: <linux-media+bounces-23579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A76149F4AA2
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 13:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC36A165109
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 12:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379431F0E58;
	Tue, 17 Dec 2024 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SMJ/UlBd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3993B1D47A2
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734437328; cv=none; b=hFVwNYj2BfLs6ZYni/SjRHgotfVnqLnc/csO4Zv1sgchDiZQjBIO2Lr57K4ZSl64J4jwZnyKF0v0LHaIEiFjspSYnZlckva+y7N1SmN8vnc0Tc4duViBCFd527oQBhFifgvlzQF3/F3mDfwhdjt+mww7WqzGuAh+h1Ei0BL0Sfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734437328; c=relaxed/simple;
	bh=NrCOX2iRRUu9lZorNB4pJ9aJWJF5+AA2KWuMz3MnXRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZj9El3bSfQEoJu2P1Fqq6EBhKPNH7XHgCFh1fUqqZ9C60Jq6ztNrkTigk0mrZGXBP9Eb2GPqBnn4PakxZSDwmYDe/MgDQexlpcM7kwhbQD8gwaAQ/k7NR48X6P6vfw7h1RMADeotgWkdrzNf96IypkNFs4FSFvYYPTOQnJJgTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SMJ/UlBd; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-728e78c4d7bso3771846b3a.0
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 04:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734437326; x=1735042126; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NrCOX2iRRUu9lZorNB4pJ9aJWJF5+AA2KWuMz3MnXRg=;
        b=SMJ/UlBdo6eGS/uIDur2TxE1Pyyr5wAUZ3aYJhZLAPtdSLFsqZzJBZOdGGxen3I86T
         Vh7DSg0oYftD/CEvPQwIPc5n7Kp0eowishpW0/q/CaFJUvA3q5rTdB9zpshghbtfoK4I
         oxyoJBFePsFuXy/iTehJ4z3KvT6fdiQhA77J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734437326; x=1735042126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrCOX2iRRUu9lZorNB4pJ9aJWJF5+AA2KWuMz3MnXRg=;
        b=xQcc7Kt0kufPwVdlBiXSUVBq44dPi5iyK71mdRzpLT0lQByzfOPZU32/FsDq0lk3er
         KJx2MXAqJt7JOopezkFwNtVERxdKF60hp+uD3YAOFkR9J5zSw/pLtMCicjKj7In7bBat
         DmIjECEJCTyZaUhAnrdrjHjNvm8iOP1B6FYyQcGSUh52cf7WcJYnYjSW8eiJB/zkQcqD
         VzjDsyE6RcZ+0YDRDxpoXGHVl4TpTkb+1k+yfMftVCXX3i4fBBNCGGNT21Ysi7JqjwT3
         JZa/qbWqs1Va11FrgtsAtqptkjhmoOY1bcnNUQ1T61W5xojkijKkFpiwERkIX8XB20+U
         VcAg==
X-Forwarded-Encrypted: i=1; AJvYcCWlxh5qQOfDT7YMPkued9qGIb7eU/P+ZoKuu2xUFBB4BPpSyII0CDqPFwSP91UDWtegWVDjgeojb2oXUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRRYwWcbHEk5q9vqTbyYvYywRTE2jmerKidDx7NajdvDuv1d37
	F+zS981ICsypmhNDyycC06E3Dt7LMArpQCFvBMPjWoaqsIwW983vYxNmfoPQ/Ng8GnOqZiN8ofE
	=
X-Gm-Gg: ASbGncvoQuVT04d3KjJBDzlBv2yReP0vXPH/j5IZeCHVbd9MTnN3MNdgZZbhwfORKVV
	PhcJ2HV2fv3TKmKwBqXoDlhfQ4MkjArz+QXcZMJrCgE3WCIPwDAgnx4RsSTyd2md0a57/340oKF
	NTqdo1q6DpF3HpYGsonbRXHC0WhOAS+Pesc3vKy2bg3xc1c96UcfBfs0HRffLjBDtDFDs9U3L1P
	pb2A8ag0O5bI1dMwd1b2p4pZ7wcAafrbydu3k7ZIfS809MsJZH7XrMq2tjDj3zACUX2URY9GAxX
	Bklehkke3pcames7r+c=
X-Google-Smtp-Source: AGHT+IFg8latVIC4ETzrVFwI6bRNfuqnTr696EuFRZXKW5juXYBeC51uHAuIYH410/t/mWMXVde96w==
X-Received: by 2002:a05:6a20:ce4f:b0:1d9:a94:feec with SMTP id adf61e73a8af0-1e4da523518mr4750604637.2.1734437326272;
        Tue, 17 Dec 2024 04:08:46 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ac5396sm6511886b3a.17.2024.12.17.04.08.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 04:08:45 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee76929a98so3806228a91.1
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 04:08:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6O135G++8emWOpWsbQHKV6P8YMrNMQnJBphula9qtWcVtp0AH36wJ0f5nG8P81/rJdMvM7tjK/rbwYg==@vger.kernel.org
X-Received: by 2002:a17:90a:c105:b0:2ee:5c9b:35c0 with SMTP id
 98e67ed59e1d1-2f2d880e0bemr4532233a91.9.1734437324829; Tue, 17 Dec 2024
 04:08:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217112138.1891708-1-isaac.scott@ideasonboard.com>
 <20241217112138.1891708-2-isaac.scott@ideasonboard.com> <CANiDSCtkgRJdPQmwPV6GStLMv_xEYC51LDED1St6i9bnmNEPfg@mail.gmail.com>
In-Reply-To: <CANiDSCtkgRJdPQmwPV6GStLMv_xEYC51LDED1St6i9bnmNEPfg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Dec 2024 13:08:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCuJVn9sSP+OWNp+AVM9NCsYaLC_x2AdtPhwwGsVMVK3Lg@mail.gmail.com>
X-Gm-Features: AbW1kvbvF9FBCq_llytKNKbKHb1oH8AwMJk8Sg7UsazrIPdnGyA9WcNliMKH5hc
Message-ID: <CANiDSCuJVn9sSP+OWNp+AVM9NCsYaLC_x2AdtPhwwGsVMVK3Lg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] media: uvcvideo: Add no drop parameter for
 MJPEG_NO_EOF quirk
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Dec 2024 at 12:58, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Issac
>
>
> On Tue, 17 Dec 2024 at 12:22, Isaac Scott <isaac.scott@ideasonboard.com> wrote:
> >
> > In use cases where a camera needs to use the UVC_QUIRK_MJPEG_NO_EOF,
> > erroneous frames that do not conform to MJPEG standards are correctly
> > being marked as erroneous. However, when using the camera in a product,
> > manufacturers usually want to enable the quirk in order to pass the
> > buffers into user space. To do this, they have to enable the uvc_no_drop
> > parameter. To avoid the extra steps to configure the kernel in such a
> > way, enable the no_drop parameter by default to comply with this use
> > case.
>
> I am not sure what you want to do with this patch.
>
> Why can't people simply set the quirk with
>
> modprobe uvcvideo quirks=0x20000

Sorry, I meant

modprobe uvcvideo nodrop=1

or

echo 1 > /sys/module/uvcvideo/parameters/nodrop

Regards!




--
Ricardo Ribalda

