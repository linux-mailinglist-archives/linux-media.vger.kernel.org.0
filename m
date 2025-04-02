Return-Path: <linux-media+bounces-29197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F4A78953
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 09:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4A023AE08F
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 07:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B04623372E;
	Wed,  2 Apr 2025 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZcRLQR3/"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C42F5A
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 07:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580691; cv=none; b=KiRv0Zae/rPnGgq76tJIG0uKd96A+kRBbBr8/gIp1YniW3q3KMUUdWOWpYmORwHn+VicKkJ5UtcvlKNbbk2+T+a2F24Wqznqs9sO2Un8CZS5yge5iJWf9IZL+GT3MCYLiHPGWRE5L0AWTkq0Ui8/hps9JgqIxEe33mn/VuAeNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580691; c=relaxed/simple;
	bh=YOyS/VRuzvF8wKR4NIEMF3nzFBcwRnHWrkEDr6R/J+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Mqe2CaZVZ/7g5wXe5+UcN5tcBhbIJsyZ0BbHfFaxsOTtDsBUbbGLffJYmSh/tUMNWJHkNjgyyGW2SaoL3KGmAhQNFeWgmtjKcA8colin+stJA35YfjIbZlQZE8GiRq1vnKZX7+FyWkRg1oqY6VfT5cBs6nBZHCO+eFmzSZsQ7h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZcRLQR3/; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250402075806euoutp02fe795bfb1e0763de9d431310e3e0854e~ycWWYp3Jx1844318443euoutp02n
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 07:58:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250402075806euoutp02fe795bfb1e0763de9d431310e3e0854e~ycWWYp3Jx1844318443euoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743580686;
	bh=z4vQilOEpdI5stLozjq/NkL9wmzjCpAfpg9UZTbA8Mc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ZcRLQR3/3d2m161DbX/gRKXvCcPnWPSMLsliYIkdjeAqy+7+lzwtgHWNhCYTzPmRZ
	 2+aq/LvKnNqY6RPa3Cikt3yukHVo8kEUHoaxi1un9nWBnyReymIFQ57ZDueG6Bd/XU
	 ufFXMXj5Aw32yhxAwCEsPiqoURk8mX0nQrTz6HqI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250402075806eucas1p17e6d76222dcd6ccfad30a8733a82ecb7~ycWWPgtR11675716757eucas1p1P;
	Wed,  2 Apr 2025 07:58:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 42.97.20397.E0EECE76; Wed,  2
	Apr 2025 08:58:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250402075806eucas1p2c5db45b8f1c1067d4c290ff1dfce9e16~ycWV8QxQ11764217642eucas1p2L;
	Wed,  2 Apr 2025 07:58:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250402075806eusmtrp19bc9846d231b16cefdb872afb4ec5d7b~ycWV7tpMq2986429864eusmtrp1W;
	Wed,  2 Apr 2025 07:58:06 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-4c-67ecee0e90ac
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id C5.D5.19920.E0EECE76; Wed,  2
	Apr 2025 08:58:06 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250402075804eusmtip1ae0f37572ccc42d728f330f2d9c29d9a~ycWUmiPXM0712107121eusmtip1V;
	Wed,  2 Apr 2025 07:58:04 +0000 (GMT)
Message-ID: <27678ba6-20aa-4ba2-93e2-001a4434a7ea@samsung.com>
Date: Wed, 2 Apr 2025 09:58:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2: check constants during build time
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Tomasz
	Figa <tfiga@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <f78d0c5d569d646717f31fbb2bc4e1a5812e40b5.1743199454.git.mirq-linux@rere.qmqm.pl>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduznOV2+d2/SDa6cULe4vGsOm0XPhq2s
	Fss2/WGy+Pb8FKPF59Z/bA6sHrMbLrJ4bFrVyeYxq20fm8fnTXIBLFFcNimpOZllqUX6dglc
	GZve7GMt2MFXsW37KrYGxnaeLkYODgkBE4mDi5O7GLk4hARWMEqc3XuAvYuRE8j5wijR/0Af
	IvGZUWLNpo8sIAmQhutTlrFAJJYzSuz5dYwVwvnIKPFs+hw2kCpeATuJxTPXMYPYLAIqEjd2
	LGCHiAtKnJz5BGySqIC8xP1bM8DiwgIeEvN2PmEEsUUE0iSe7/4NFmcWyJZY9nsjC4QtLnHr
	yXwmEJtNwFCi620X2C5OgTiJ+9cOQNXLSzRvnc0McpCEwBEOiZcL57NA/Oki0fE7CuIDYYlX
	x7ewQ9gyEqcn97BA1LczSiz4fZ8JwpnAKNHw/BYjRJW1xJ1zv9hABjELaEqs36UPMdNR4s7y
	SAiTT+LGW0GIE/gkJm2bzgwR5pXoaBOCmKEmMev4OritBy9cYp7AqDQLKVBmIXlyFpJnZiGs
	XcDIsopRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwwZz+d/zrDsYVrz7qHWJk4mA8xCjB
	wawkwlt09k26EG9KYmVValF+fFFpTmrxIUZpDhYlcd5F+1vThQTSE0tSs1NTC1KLYLJMHJxS
	DUwb2nuOLThUfi+zpujtFa+75s/yolRMT3y+rzKROzZn1+Psiu3MXq9zruodYDtx0ffGpPkf
	IzQOVq/xqj5V+i/p2O41S4TP1z1x/51+8mPtbp+CKYWcIv1qkp6HDoUXrt6+JS7vL+/rww0L
	p1h9uMe2br3x2Z/zN/l75zU8/yhjlfjLffHv3wxRi7idn/v+mL28aENYQVy8NLP8wvNKfFUF
	h3i+FWYFTfy9w+zy5V+1Xz6uX2Ap9n59Qb3oSrkVopuFfhy4v8/nOJ/lL29Jj6ONuunSjAWP
	2HbZ32aL28T6YbVaS0vjE7M+XRmVrUpyeuEvivsqJtVVzunerDDr3ymjRduLphfvkPr95OaD
	b00CSizFGYmGWsxFxYkA8zm3G58DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xu7p8796kG0xvEbe4vGsOm0XPhq2s
	Fss2/WGy+Pb8FKPF59Z/bA6sHrMbLrJ4bFrVyeYxq20fm8fnTXIBLFF6NkX5pSWpChn5xSW2
	StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GZve7GMt2MFXsW37KrYGxnae
	LkZODgkBE4nrU5axdDFycQgJLGWUOPK4hwUiISNxcloDK4QtLPHnWhcbRNF7RokNMxcxgSR4
	BewkFs9cxwxiswioSNzYsYAdIi4ocXLmE7BBogLyEvdvzQCLCwt4SMzb+YQRxBYRSJNYu+w1
	WJxZIFti5p0HjBALNjJKLJ39FyohLnHryXywZWwChhJdb0Gu4OTgFIiTuH/tAFSNmUTX1i5G
	CFteonnrbOYJjEKzkNwxC8moWUhaZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMw
	srYd+7l5B+O8Vx/1DjEycTAeYpTgYFYS4S06+yZdiDclsbIqtSg/vqg0J7X4EKMpMDAmMkuJ
	JucDYzuvJN7QzMDU0MTM0sDU0sxYSZzX7fL5NCGB9MSS1OzU1ILUIpg+Jg5OqQamNVrnln0+
	3s47gf3/etbzHxod2jyfxwgsTbljsstGql/G56jMfMH3Ags+RvRu4PhhwxzGl9nF/nsNs+uf
	qIxHj4zOc2a83p7dGFH011h4v63094Qrf7du50rwrjaXDn+wp0djQ/XurWcmei8OdtU9JHRB
	iYPXXm+hmebFb9LZT+/4Lw1cvyqu5cyWs1oGPg51XM/uHf3CsKDzpYWVtv/So5ms2R99ZLtN
	F1///58jX/fDLd7acCXNU7s+11gFr1VoVKuLCDj/zvCzgqtpVHvt/R+q5lstTQRzHUQcpgXW
	Rl+eYvKt7XBUubWmSE7k6xShnNUbGZ0nT5/z58D+iR8vbur9v+/PwpeXDxYG675SYinOSDTU
	Yi4qTgQAMwB9aDUDAAA=
X-CMS-MailID: 20250402075806eucas1p2c5db45b8f1c1067d4c290ff1dfce9e16
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250328220534eucas1p1cc5c334505d06f34a4eb01b8c1df27da
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250328220534eucas1p1cc5c334505d06f34a4eb01b8c1df27da
References: <CGME20250328220534eucas1p1cc5c334505d06f34a4eb01b8c1df27da@eucas1p1.samsung.com>
	<f78d0c5d569d646717f31fbb2bc4e1a5812e40b5.1743199454.git.mirq-linux@rere.qmqm.pl>

On 28.03.2025 23:05, Michał Mirosław wrote:
> There is nothing a driver author can do fix in the driver to make the
> global constants match. Since the assertion can be verified at build
> time, don't return EINVAL at runtime for it.
>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/media/common/videobuf2/videobuf2-v4l2.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 9201d854dbcc..1cd26faee503 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -903,6 +903,11 @@ EXPORT_SYMBOL_GPL(vb2_expbuf);
>   
>   int vb2_queue_init_name(struct vb2_queue *q, const char *name)
>   {
> +	/* vb2_memory should match with v4l2_memory */
> +	BUILD_BUG_ON(VB2_MEMORY_MMAP != (int)V4L2_MEMORY_MMAP);
> +	BUILD_BUG_ON(VB2_MEMORY_USERPTR != (int)V4L2_MEMORY_USERPTR);
> +	BUILD_BUG_ON(VB2_MEMORY_DMABUF != (int)V4L2_MEMORY_DMABUF);
> +
>   	/*
>   	 * Sanity check
>   	 */
> @@ -916,12 +921,6 @@ int vb2_queue_init_name(struct vb2_queue *q, const char *name)
>   	WARN_ON((q->timestamp_flags & V4L2_BUF_FLAG_TIMESTAMP_MASK) ==
>   		V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN);
>   
> -	/* Warn that vb2_memory should match with v4l2_memory */
> -	if (WARN_ON(VB2_MEMORY_MMAP != (int)V4L2_MEMORY_MMAP)
> -		|| WARN_ON(VB2_MEMORY_USERPTR != (int)V4L2_MEMORY_USERPTR)
> -		|| WARN_ON(VB2_MEMORY_DMABUF != (int)V4L2_MEMORY_DMABUF))
> -		return -EINVAL;
> -
>   	if (q->buf_struct_size == 0)
>   		q->buf_struct_size = sizeof(struct vb2_v4l2_buffer);
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


