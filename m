Return-Path: <linux-media+bounces-43131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E05B9DD6A
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 09:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2B319C2EFC
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 07:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D162E7637;
	Thu, 25 Sep 2025 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="R7R3lI8P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A78742A82
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 07:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758784820; cv=none; b=FaNzkWxrzIezVhIH8Cn3F9lFUp0G7mZ5sZLTZArtoxb0qLDZRRfDFBt3E2TC8cLV5VR/1c1YfuE9RjMte76AA2m2q5yIvw4hAqKV780nojHmYt7ale7gyvL1OUZM2pF7907XDW8X6w7Jx7YKaSqkCcGCUOBd7FWf2e+rfCo4Vyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758784820; c=relaxed/simple;
	bh=UtG2AYwE7Ts1qKbeElgIYgx4GfyB0QGg7UEYXLghLgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SR9gKcDkNbc1Yf67fogbm/Dv1r/PDpiEDqb7zzHbHUwjFQBKkKk/4ySZCqruSmoY7bGVehbYMpulDxGu0SgpwfBS6IZbaWZbWLolxraZzXHH7yuY/DzbdiDIIoZfQiqmirOeCqiJ1BTfkg0SPtb4SAgvch0pXQcufwis1GStisY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=R7R3lI8P; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-26d0fbe238bso5444575ad.3
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1758784816; x=1759389616; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xAqrmYR9/bMDXFfFDrd4j9J0pEMkOP8vYNJlcMIJQPs=;
        b=R7R3lI8PkrHVUhxQ5aoORbO5P0lfrBhQiKab2tiNh2BKnBjxMXLcFG0kAPZFltI5Po
         rYLrEoiHYjDP0ly9AmwsswTEn71gzfVj8HK8jovz1vL43q7O1o8sdGh6s6nphPBvG1Xw
         bUYdFgAgD58/oxN2spzecEwzu64NrgRM7ixD/N3GRHOEaiW/6wbxmSzqos556fqX0+sX
         bZRBB37cmmMUDmHV3MZJp0RhAnusPOxzaD35nYPZYBXzFTJclmJPR/i+q72d3UpfZm8h
         QFckkpI/hnArD/ScvI+326rguJRo2XTAIY/Ekx1bo3Q5AUFxoIA4xV879fBAcHRmbkLg
         LYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758784816; x=1759389616;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xAqrmYR9/bMDXFfFDrd4j9J0pEMkOP8vYNJlcMIJQPs=;
        b=cWBNgM0Q6IEejrzxJOExwB6cfe+d8prrqr8c8JAFuonnocvie/M6yZ0wWd6RSZDIpj
         79eGiCbEx0fR9fonHExvKtQlYcxllpJp6DgFZVsuwVooi35T1tZlFFf3mTP8F4aZWi3p
         h5SzdUVqFsLk4lONBjheCSusbefTQpYI25wZsdK/locvAoDrJfJeF4l1bhZYMO4orrIR
         l9avAtyhTXOA9AZSLU6Co4MHuicxWjF6scIT5zgzZCwdzX95f2ZlBhNnnrm+0g7hEcTA
         if2qIxDgcLMlXmqLgr+zP41HQJTMqipd42bywV6MeNXcAmeBWGY8L6xJ7jjsXB/00Z8h
         8Q1A==
X-Forwarded-Encrypted: i=1; AJvYcCUoZvWO6GUMW5Hwu1x1EJpaP3QvqpkKzOC3RMISl/0DsDohWN/BcUWRRXCqzmmmmJ/Mzw6fKYCHkvdu/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+cih+K1t3M5adDWJCul14dm+NRUrtZXr5z9WC87WsEaKrizW
	zPqcSZe/lLZQt15krTFi0yNunbJEoqzUVNCS2gLe1KJtFEwJDlJAJUyCJ8s0IIT9UInw
X-Gm-Gg: ASbGncvzsDAvcmlJL4m8ka5Y4k6AnF9BPUo7M/yOAYcDYdHrmoeSa+a5Ez4qeURiHUz
	MDQKZnxxm1Bv+c/9MHBJITGVVfellZd8IpLCBpCRR8hhL2prTkLm6seyjrgEpwAU6jlQV/HeTUi
	vwav/H8rVythDOOXs+luENmT8PpoNhFkTbR/mQ0ufgZsP4T/cPWG0jx6piwdQ9d2YFOYM0q9E+0
	ESpNfG2M01s974e24LijPvtIVaN9kDq3YK4ui3gNrdhfSdu9zCZ8yYvYFzA4sECkN0rEFtOY2ef
	6CzYq5qvBbxbzjTphNm3W7DHHXgFnivpu+yql5iqjowGhe6r7jFewpbhSmyvDMS6hkQi0MnlsFa
	wYsn5ViOLTWsIhlX2Un7gMpFe
X-Google-Smtp-Source: AGHT+IEmrnuAbtaCBvgIy/U+TujjkSmq5FHheEOgKf94c4b4kqHJ+6AiPtVFQJ6hNObPXoVY2vx8uQ==
X-Received: by 2002:a17:902:db02:b0:25d:d848:1cca with SMTP id d9443c01a7336-27ed4a9210cmr25271665ad.35.1758784816242;
        Thu, 25 Sep 2025 00:20:16 -0700 (PDT)
Received: from sultan-box ([79.127.217.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac94ffsm14619405ad.136.2025.09.25.00.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:20:15 -0700 (PDT)
Date: Thu, 25 Sep 2025 00:20:12 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v4 3/7] media: platform: amd: Add isp4 fw and hw interface
Message-ID: <aNTtLHDHf_ozenC-@sultan-box>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-4-Bin.Du@amd.com>
 <aNB0P18ytI1KopWI@sultan-box>
 <df5f52eb-0480-4d59-b930-e8336a993831@amd.com>
 <aNOZM2fj1X9TfZSF@sultan-box>
 <2f6c190d-aed0-4a27-8b20-1a4833d7edf7@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f6c190d-aed0-4a27-8b20-1a4833d7edf7@amd.com>

On Thu, Sep 25, 2025 at 11:56:13AM +0800, Du, Bin wrote:
> On 9/24/2025 3:09 PM, Sultan Alsawaf wrote:
> > On Tue, Sep 23, 2025 at 05:24:11PM +0800, Du, Bin wrote:
> > > On 9/22/2025 5:55 AM, Sultan Alsawaf wrote:
> > > > On Thu, Sep 11, 2025 at 06:08:43PM +0800, Bin Du wrote:
> > > > > +	struct isp4if_cmd_element *cmd_ele = NULL;
> > > > > +	struct isp4if_rb_config *rb_config;
> > > > > +	struct device *dev = ispif->dev;
> > > > > +	struct isp4fw_cmd cmd = {};
> > > > 
> > > > Use memset() to guarantee padding bits of cmd are zeroed, since this may not
> > > > guarantee it on all compilers.
> > > > 
> > > 
> > > Sure, will do it in the next version. Just a question, padding bits seem
> > > never to be used, will it cause any problem if they are not zeroed?
> > 
> > Padding bits, if there are any, are used by isp4if_compute_check_sum() and are
> > also sent to the firmware.
> > 
> 
> Yes, this will impact the checksum value. However, based on my
> understanding, it will not affect the error detection outcome, since the
> firmware uses the same padding bits during both checksum calculation and
> comparison. I apologize for the minor disagreement—I just want to avoid
> introducing redundant code, especially given that similar scenarios appear a
> lot. Originally, we used memset in the initial version, but switched to { }
> initialization in subsequent versions based on review feedback. Please feel
> free to share your ideas, if you believe it is still necessary, we will add
> them.

Ah, I see Sakari suggested that during a prior review [1].

Whenever a struct is sent outside of the kernel, padding bits should be zeroed
for a few reasons:

1. Uninitialized padding bits can expose sensitive information from kernel
   memory, which can be a security concern.

2. There is no guarantee that the recipient will always behave the same way with
   different values for the padding bits. In this case for example, I cannot
   look at the ISP source code and say for sure that the padding bits don't
   affect its operation. And even if I could, that may always change with a new
   firmware version.

3. You can ensure more reliable testing results by guaranteeing that the padding
   bits are the same value (zero) for everyone. For example, if the padding bits
   accidentally affected the firmware, some users with different padding bits
   values could experience bugs that you cannot reproduce in your lab or dev
   environment.

The only way to ensure padding bits are zeroed on all compilers is to use
memset; using { } won't do this on every compiler or every compiler version or
even every compiler optimization level [2].

So I still believe it is necessary to use memset for those structs which are
sent outside of the kernel, in this case for the structs sent to firmware. For
structs which are used _only inside_ the kernel, it is preferred to use { }.

[1] https://lore.kernel.org/all/aIclcwRep3F_z7PF@kekkonen.localdomain/
[2] https://interrupt.memfault.com/blog/c-struct-padding-initialization#strategy-4---gcc-extension

Sultan

