Return-Path: <linux-media+bounces-25714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F16A2A5A8
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 11:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E29DE168AA8
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 10:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D7F226869;
	Thu,  6 Feb 2025 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awbEb1yy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EB3214210;
	Thu,  6 Feb 2025 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836970; cv=none; b=JiFYJq7Pns7QAzaEwWOfhXQUMWJ6ZLWaOlz76v02BZR1PoM2+hLKwrdwjNgybUdKSQlrpTdEtIVWaHKLxOqhDqBN0G985XaSfAeH+rPwvOng2j4fycI23xfHaRVqeLOEapR+6FZ9xcgk8wLBwZ0Bje1Xm8rW4mZkE2c5Nj+SWh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836970; c=relaxed/simple;
	bh=FVZyQwa14ls+xRdu/fHznHQLoRmVTDVugAyB1bl17gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMPiXdn/UJR9wZH1wWYiCuY0MHk8qK9UGnV6gw2l0/xjqZpNomwqd/0nFATW7YH3uPvUignP695XDsE5XZCX/lrORfrIXCsHCKMGg08Z+v4IUHH6l4u6ygPxAuqgerfpEZ0Fy074pqJXyhkj9n0nyo8x81sLBTs5mvNXy+vcTFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awbEb1yy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f169e9595so10990815ad.2;
        Thu, 06 Feb 2025 02:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738836968; x=1739441768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/QhfNDueZ1W3WBYytV0woNpaMHcRrOVpAqqKQeMjsq8=;
        b=awbEb1yy2H3oI8upFMhIkxwWvZfAngpcUCZup/13695TvJgnr2gvnZSS1j7/HyRSQb
         Q9VWqvkbOJf3tkDFgkIwlZ9U9mQL4Cn1Yn7YLYp4hA+ewliamSNBpGfVpE/MnSPEY4YC
         rx3Sz0h6BUdVPYhH3cdG8z6o05h4aBcTuHoeJmt9INTUnXGaCHzGUejEdog+iDETZp9D
         ODSAy81qY2Tx604ON/u5zASE+2L2MagcnFfD2FgkQH3A4JjYWWcorhU3a7cwKG01lHYp
         8kmKTH5tzY3156ist7AYtrJYUmereKUaaSeIT1r/Gp6AOg4/QDMoigEolwuEdRtihDLb
         LqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836968; x=1739441768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QhfNDueZ1W3WBYytV0woNpaMHcRrOVpAqqKQeMjsq8=;
        b=g51Pd9uN1Ynu/wYZ6K8/bkJ3Ft5zYqaBUb0IjXqFifXaaWdeVC6i/5sZ9VYH8phvJc
         kwfgdKU+m5NxlbzAJaGvM3jiBTxm5oqMoCyfjxYs//ZKTexDKNAV87Zd4q4SMCP8rG2a
         xJIIQR562zwG+CELv1I1DeSy90XRiKE4XUfOh3fcXAec3qA1mphE6S0q+fst7XGY7Bif
         cOs3eBSQhO012f/b7K6thRI5XHNtGEBhttsCXIgA3DEN6oLCpe2Hk9O5wJHHlg15Jft4
         GuA5wYSJZbLQ7dQMzwZU8DQhoYSMEiDjMIKw2vzVCpMTLTWDX8b/X233j0btRSpsdydE
         eWoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtjCxYWwLcjcjsUr7j2ijtkjqT2/EWnyiT7qe1+EBZ/GPUh5bhvBOIMa54pcKwE5Q9u+aYvx8ZiEPjVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKtnL146XFV+Xz0eVn2/7u//If17jP5cr7uF18MetnwXchVbuv
	Tcp7BXKl6Dp1RV1c+TBsVoVFPsdtS8nHGOfIL55w05tVwV9jdr0B
X-Gm-Gg: ASbGnctdIZtAr/0v0Pips6BA4edqcu6jQZoT3rnOEKOBTJBQOriAf36BNIfeQKW4BpL
	T0QUimE4zy7k1SANYgGUx5QdW2PP/eUqk7LkGbIgnJDEjJBszKaLYFJGVGmW7m+Z/hh0CjPeTD9
	S3cxCBPi0gCRzsyvGZOvcXY9mcFzUSjEYYQQvrquMXh02W9zKwJS+G8s2CTJgkWGpMaeNiYkIV2
	qh+4aiVu2wBvlsRNc/H7VdARYydqXVrRcz8PjHopuVxPGk7xpHxUqswwIbKu5qr4Y7yxdTmUrk9
	LxJHHRPHkThTLhQ=
X-Google-Smtp-Source: AGHT+IF3tN0jfdrp8IoXFckyeARH3ThMjxyiWGv+G8hEz9QeSl1lWcHYR4tT/Y77wZYKGrCEQ6Chhg==
X-Received: by 2002:a17:902:f28a:b0:21f:133b:ae4b with SMTP id d9443c01a7336-21f17e71504mr74609885ad.31.1738836968487;
        Thu, 06 Feb 2025 02:16:08 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9bbc:3696:e8b5:565])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368ce622sm8877325ad.241.2025.02.06.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:16:08 -0800 (PST)
Date: Thu, 6 Feb 2025 02:16:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-input <linux-input@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Nick Dyer <nick@shmanahar.org>
Subject: Re: [PATCH] input: drop vb2_ops_wait_prepare/finish
Message-ID: <Z6SL5byA10k5A-OE@google.com>
References: <ec811552-6014-43d4-9fcc-2ac729a8b08e@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec811552-6014-43d4-9fcc-2ac729a8b08e@xs4all.nl>

On Tue, Jan 28, 2025 at 04:05:02PM +0100, Hans Verkuil wrote:
> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> are NULL") it is no longer needed to set the wait_prepare/finish
> vb2_ops callbacks as long as the lock field in vb2_queue is set.
> 
> Since the vb2_ops_wait_prepare/finish callbacks already rely on that field,
> we can safely drop these callbacks.
> 
> This simplifies the code and this is a step towards the goal of deleting
> these callbacks.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

Applied, thank you.

-- 
Dmitry

