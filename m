Return-Path: <linux-media+bounces-47310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8470BC6A801
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 17:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 71AEB4F5FD5
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 16:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042B436C58C;
	Tue, 18 Nov 2025 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKCA50iD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9BF369981
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481674; cv=none; b=UlMhsag2RsPWa4M5K5Iety78/WxJ8fWJMnYuS5Lc3rce/47Z4WdxOZoiiG0eYHLas+ZhZghL1nmXCHEOCq+rCQ8k6kPR4RTJUxSylHDcA1hR45kbc/biYNE+UKKIcr+x43rIc5HK2E4G3sCqBg1OptGn+J/KcgZDp/tM8Ob/iy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481674; c=relaxed/simple;
	bh=f+f4NmvH/hRU6pwG216QqgKdKI9se928TAAuNSFnC+c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B5LyEXtGEJX5UpNd/cTi0JqRCvRRKT+LgQGPub9WNfbjwHnvDaBLXep+AuUMaNqnbzErZ8cKNP2EinZQYwzKaSdPvbBRmkBmErq59iO8y+jLaoqkHlnf/VlPV97EISCGTnXz1gDBRfjXeI9HADxygHUUiye7vwBEITkIAwZmDcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKCA50iD; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b737c6c13e1so581781466b.3
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 08:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763481670; x=1764086470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+f4NmvH/hRU6pwG216QqgKdKI9se928TAAuNSFnC+c=;
        b=nKCA50iD7wtgBBdu5Y0tWcwu8rhrDvnr8jmB11uIwHOVz2+QkQKiUI9tZWFV/nuNII
         q/HqEzDqymh4XHKzPZFUTEIRTf5/nr83q2vFsQqFvhEEo6Ph8hnhOdGJeeza3JMRsOQo
         0umzYi37yRUIOhxD1CyCMMFnG4Lhk2bCu5Ekt2dIrslyojxKZsYR072NqrzOEPalEMdo
         YdDIZ00Cn+Zmnb55HU0q0QdqoarsppTh9LFTMmYb1I0pX75qhVptFfYRNAluhi51Wjym
         N4zFL92/hfQ9eMflxbQc5bNUjSbUgOK/5qpStLpPJHfaTfSUfcldgISQM1H7rgfOKN+2
         3rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481670; x=1764086470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f+f4NmvH/hRU6pwG216QqgKdKI9se928TAAuNSFnC+c=;
        b=WMYNANA2bTBPXn0MJBYB0Hf26UJKP8vUU8OV/eQXAlLdo/XCqKY1XyUexrhep7/YcV
         uPmr8Pxt8T/nPNryynh8GO47HbkefQSItkeTBvgxCKk2ubKqDhj2RVrkAjYuSkHiYYSr
         77/TWJCr7H1eZkmEV4ievgy/IlErgMQ+5TdagG9mQBWGn2QZjD3/7/8b4c3CAD/Lv30B
         EWYQBl3xbmgMMa2FwJ3fnqNLW1xxTdBbcG2X0sgg6oVJGcuSYRzEMwoDKWb+tMkq/Kks
         aedatn607wkbuG8Ndxojg9OBB5Spuvk4MLPl+pmMCZp0nSgi2j2v18jclGPcw8YghCmd
         qYKw==
X-Forwarded-Encrypted: i=1; AJvYcCU3hg13KYsw4b1myKYaeU9dEYLlRRT4ns2AzgAL/RHlWmW40JFFTZgbgWww5rPb5+pUvIsu9m11B2hEgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxciLz7FJF6kVb430igkMXV3jHXl4l2jup1VzpjOK/Ay7QXtnbU
	ypPWlQJzYHJvFmo+3NluMRLcDnZ43ODVxMMN9TL9Qa+nhh5q1j84PJeq
X-Gm-Gg: ASbGncuKfK3SmwJGoxJwqmnSPGtdezeWdMWRsH0faiqEf8FHoS80/FmuktANKxoEd6v
	m4ELCkemTDhLsEfnUqyd1+VOqqv+vTlwZHPaylEtWykZRlqBOxOb8upLGSjyRdH3ybMecw3Fnoc
	YZCHu0ezkXR2/Z3umI+EwgvW7nzdJnQuKsGms3Cpx1Ai6rKThhvb5/hXgfiblTzJdjRlrhDJbh2
	qVeSDbYZvDKhIzS0QwI8yaN61E+ieQf2fnrsi50OfHmHJs+boyWtNeZ44lyGnMUHwxcXK2MsSgb
	qic0Zc71LAswadHEONtyF0v7GsgCvunRm5BPOjGUeNkSFw7J60XRNBBtOaoG3/1HRechWMvckEr
	BBNzy/kfMY+m9QAv0fKiuuwK9y3xB0wsWQadVa0fBYDR24dTxGxznzQ3czx/MCqGqKJMnJ9QpZj
	sv3kMDy4tWVMBy7qEqU61UMk0=
X-Google-Smtp-Source: AGHT+IEI9gRZBd5rw55mfRNgp0K59II8BMuYUwmil2KCu3C+5VPmVjBNjw5eAJ15yG/f8AfTotGMPw==
X-Received: by 2002:a17:907:94d5:b0:b3f:f207:b748 with SMTP id a640c23a62f3a-b7367828a3amr1839833266b.10.1763481670026;
        Tue, 18 Nov 2025 08:01:10 -0800 (PST)
Received: from foxbook (bhd138.neoplus.adsl.tpnet.pl. [83.28.93.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2eesm1375643166b.68.2025.11.18.08.01.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 18 Nov 2025 08:01:09 -0800 (PST)
Date: Tue, 18 Nov 2025 17:01:04 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
Message-ID: <20251118170104.01dba6bf.michal.pecio@gmail.com>
In-Reply-To: <x2xheosw24fecqjjv4fmj2t3i53k2ypyvmkkkvmv6xtdwsherd@e5klkm3ou4g7>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
	<20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
	<2025111817-wages-anyone-e39a@gregkh>
	<x2xheosw24fecqjjv4fmj2t3i53k2ypyvmkkkvmv6xtdwsherd@e5klkm3ou4g7>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Nov 2025 15:09:16 +0100, Mauro Carvalho Chehab wrote:
> On other words, if someone has secure boot enabled, he can be more
> confident that a distro-vendor signed Kernel will honour the privacy
> LED, and not even the root can tamper with - as BIOS access to
> disable secure boot would be needed to change it - plus, booting a
> non-signed kernel.

IMHO users are better off trusting duct tape than any chain of trust,
and those with tinfoil hats already do.

Rational people with any clue will simply assume their computer broke
and put duct tape over the LED, carefully not to cover the lens ;)

Regards,
Michal

