Return-Path: <linux-media+bounces-54417-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADE1Ja18p2nYhwAAu9opvQ
	(envelope-from <linux-media+bounces-54417-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 01:28:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F07221F8E76
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 01:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15CA93019C81
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 00:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF192F3C22;
	Wed,  4 Mar 2026 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBzDNy4t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0EC2EDD70
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772584104; cv=none; b=LMadu9bNluZg36UuDGG444fSn0HOsRkypkZxru6RcQMN/fsZUmPlsnM+bfMiC4CuJNGBQyCiJiiYg+s3pu1Je900RrjA7FATJHPfkaXvdgzEbbL2rSHaGJN8nNjb2Mozc5oMiMlajOWQXSorG0epCFEw2LwEN9vCWxZRxvbtFpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772584104; c=relaxed/simple;
	bh=GXq7txbyhon90rY2Pd/0eLOL4txh9vwCy5I1bhGOThQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ilPhSAgE9mn8XbJPc3cvkhC3FnYZXzQVIHACQISpF0jQ4K22hVuSVsfmZN3Fqqpb61d/QRGebY+XlDyRRv4YNblPdLfkvEJbWrtriiOXh0DwYwofwRiR1oUVQXR93Cq6STW9vwOsNz20UlzvYULMKb0JIS4kGVhzGpAjF2jSAk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBzDNy4t; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cbb6d5f780so635702885a.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 16:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772584102; x=1773188902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXq7txbyhon90rY2Pd/0eLOL4txh9vwCy5I1bhGOThQ=;
        b=RBzDNy4tZVMtHGAr9rxv9wVVWhDdGMBfEQtb1/SYVcohfRgCnaKPDPEiVaxSjGr+FZ
         5Cgo8vvHcRMKJW+96Xo1Syvq+rYcbYApmPOqytdzJTCBKj4tEMTBxd7FKKiCRwAjaSyF
         2wIDeytGaz5F5074Y5rmqqWRGgKtqt3mMOq68JHhZdKFKjMgwaK2O4EJEyxrxl8xD6Ly
         NytrcEYwBndywc3eu7tmrj4ea2s/vI2ZNBO/dMtBUX4tbeED/2sV75qt1xtYDxBSP8tu
         kp/wdj5YgI3058E3YIcwSQ8OSdsT6cuCzTiFZtKT7yGBt0+CAVBtUovptYr2jW9F2qq4
         q0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772584102; x=1773188902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GXq7txbyhon90rY2Pd/0eLOL4txh9vwCy5I1bhGOThQ=;
        b=q1W70amKDeFYreEwK44IvHwetdmr7/pBGAZtjyXeTaLXh0w9+yp2hlo7pVpIg84hL0
         HdXOW7N+Sm9mzSLBpLju60EHgBJANf/xZ9dJ5QihqGVeKU237QbfXHhsX0VitpJ8Q4UP
         FQm93LT7yHk7S2szLoFYyxhdiUhu0vjTG8IoEwifvXP7wjS+ywz7DTtpZbZon9UDsLp+
         zPfyPp2ms+8UcT2N6n97KXPqMMOT9iTrZ3xu3vQi2jTwyHgtpZBgBcO2MHGR9ijoniZQ
         d+tFRmxnZ0J1hS8+vNXIRaBfsTH8xDZtqKf0I9XCWZX9Ys2LTHJCo7JyuOE5KJ8BvzU7
         jfLQ==
X-Gm-Message-State: AOJu0YwvlnYTh++JbwiL+7vJ3VLZA12NwRyGiSAzPaJUJioKNE+LUJl8
	U3kMJ8B5+lSc6aob7Ndnwws2KBzGQAOrU3D/rbergtJTi0UZcW7jcUlB
X-Gm-Gg: ATEYQzyoxonxK4IZA6TTf8exyYbjjbvzc6vrgnygvRaqCefHXGJhlisxF4u24NamkiN
	+0pPvWHGeltqf3Skp0O2s/hVu5OzbwCzk/MGXSMozYxJ2xsFbMfc4g8vV9CUxSCyGTcX4hcL6Ce
	P/sYTFCGzk9XueX5EskQED9VAZEmIp4NKAjNXhuakD6d2CiDXaY6OK672hUTom70qPy9SuwL24E
	EGuONbLKFRyNV2BEoCvXj18in37P9YKhvPIKwCVYEZo4l8rAAoHtrGLBedNT7FTNSddYpTRyL5h
	QdxbhOPVOZsDGObbrg9rs1uhzM2OyLJCkLTvDkr+3T2qE1NOUaQwdwsTMXvZftGLYKqhhoSwMTH
	AKPOS/ymVVLv+QNPWCVxTISfWU952vVlAb6uA+fqIR90BppzdwmsbxDFaHiB2/I+6Bkli0Y7OC8
	KEbGkPhaHoyy9nYGCLIJxC2R1mxn8cEVCNUj6rTRSgLzLkQ1Cw39Wq/zBj8b8FjrJI9wwLK83S+
	EpqqiBjFTA=
X-Received: by 2002:a05:620a:2681:b0:8c5:2ce6:dc2 with SMTP id af79cd13be357-8cd5aec6a25mr47762985a.17.1772584102575;
        Tue, 03 Mar 2026 16:28:22 -0800 (PST)
Received: from hp-strix-cachyos.localdomain ([174.95.22.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6fb519sm1513450085a.29.2026.03.03.16.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 16:28:22 -0800 (PST)
From: Kinn Coelho Juliao <kinncj@gmail.com>
To: pratap.nirujogi@amd.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bin.Du@amd.com,
	mario.limonciello@amd.com,
	sultan@kerneltoast.com,
	Kinn Coelho Juliao <kinncj@gmail.com>
Subject: Re: [PATCH] media: amd: isp4: add system suspend/resume support
Date: Tue,  3 Mar 2026 19:28:11 -0500
Message-ID: <20260304002811.95497-1-kinncj@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <bb892e59-8fc9-4d1b-94aa-996a66392405@amd.com>
References: <bb892e59-8fc9-4d1b-94aa-996a66392405@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F07221F8E76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,kerneltoast.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-54417-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kinncj@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

Thanks Pratap, Mario.

I reviewed commit 0288a345f19b ("drm/amdgpu/isp: fix SMU warning
during ISP suspend-resume"). I understand it marks ISP MFD children as
syscore devices and manages their suspend/resume from the amdgpu parent
via pm_runtime_force_suspend/resume.

I'm curious about one thing though; on my current system (7.0-rc1),
s2idle resume still hangs with the in-tree V4L2 module loaded. My
out-of-tree module, which adds dev_pm_ops that call
isp4sd_pwroff_and_deinit() before suspend, resolves the hang.

pm_runtime_force_suspend() manages the power domain but doesn't tear
down firmware ring buffers or V4L2 streaming state. If the camera was
active at any point during the session when suspend occurs, the driver
would have stale state on resume. That seems to be what's causing the
hang on my hardware (HP ZBook Ultra G1a, Strix Halo).

Is the firmware/streaming state teardown handled elsewhere that I'm
missing, or does the V4L2 driver still need its own suspend path?

Thanks,
Kinn

