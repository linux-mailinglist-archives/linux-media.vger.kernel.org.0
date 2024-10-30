Return-Path: <linux-media+bounces-20582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 788B99B6131
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 12:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 012BCB215FF
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720481E47CA;
	Wed, 30 Oct 2024 11:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=metux@gmx.de header.b="oV989kEi"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2491CF7DE;
	Wed, 30 Oct 2024 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286960; cv=none; b=f+Rh1Ngfg+n7p9V7ZKmEgw3po2GBwF0dQvz5B3NfA6JptwO9z+/P5jJB3BPmEqtFq+HtLxEQH7vzM6xJR+WRx/3L+3/Hix5CeSzrxukCi4Ce6H9Bf5zukQNBKIU6Cu8/aa8rk4EftwHpuWR3jOMBQHcy/nZXaMLHTYKxAPKCW3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286960; c=relaxed/simple;
	bh=mlDftfx0K4BOCP97UClfQEOO1aAHQKqEtrb3HZcbogc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LmkCoXey4bigXR36MG3VQwGt8pswRY7MRIQJgu5ApOsgloP0sL3+/zgZveCYQR6k6oMBsEdtObOnaif5a0u2ZATM78G8pWzuGIhm+aSdf45S7uK1rwPW4c6MPOP4kyA74oQ2iIuGDJUa8NI6MoV4LOEIQoDPdoEDghHhUfA5U+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=metux@gmx.de header.b=oV989kEi; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1730286945; x=1730891745; i=metux@gmx.de;
	bh=mlDftfx0K4BOCP97UClfQEOO1aAHQKqEtrb3HZcbogc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oV989kEiNWeJh8gP21cTVDoFmxCiTpBKcteuNrFpD3JzsOYLqTWquNReAO7JXDVQ
	 bkZ3MPce8pPgAhfADVFEJL9FKgxbrDc5yJ43s86N64sXLcwlq+YnaaOCjqnaTViY3
	 kBITyvP0TEl0z4Q9D08feJUaFpsv8Yf12Fw9IXMWYeXH4u3LSwHcInzvocIuJR79v
	 +enfEhcMlD5BKwtCntlEMyFYoFC0engUUEV8B/K78sCTexSVDh9QOEkYwOO0BA9fi
	 EUZCCBznDJflQsg44b6oKhjb67KRqb+9kmgKo3oVp1RhZVVdtiZBz/0WsmL2dxv71
	 vTjQhfnY+nrr5HZmHg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.178] ([95.114.207.188]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8ob6-1ttH783dA6-010bqc; Wed, 30
 Oct 2024 12:15:45 +0100
Message-ID: <35deac48-4220-4889-833d-1b57b417e968@gmx.de>
Date: Wed, 30 Oct 2024 12:16:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Requirements to merge new heaps in the kernel
To: Maxime Ripard <mripard@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
Content-Language: tl
From: metux <metux@gmx.de>
In-Reply-To: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OXs7H1W+UFRu0PC7wfyzXJLH0EbhAYeRDPBvuzLGrQSDhISLPnc
 6WC52Fn3eaU5BOifJojQ5t94gaHu+qcA18UYcIpyEL8UepofSNlbxFDRp11lMQbDFgiV39Q
 Io0EklDI6cb1kgk464W+PyGSnP2NLEyYWE1Do/VIteND7LFfreTb+5i7upH9CA4v7jqqsoF
 bnawMxSDiyUs5pnwlo0RQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H52CPmlmabM=;0t4AdGqQVW+nDR/Ok80kPjqEzjN
 QuuzM3Vi+5o+idAGY13wmHfnHzZSup/mnzbiCmHCVbO8P8Wde1B1Pz/Ua4nE2mVFt5egDIkNS
 LONeHuphdvVv3VbLQmU6Cr7NBAsRO6E7s3l41kJyE8h46n0vPAqzgIYOX5gYkfS/d0ksXfg9m
 lLNU5x3/VuYSgEc4jJNHM0nmUlLR9hukOKJvLs5exWCyYKwUZyvsl5VNAvxdFdzNp8JNhkK7H
 hw0IX+TXumArBdWNV7q3FkR9SkLTZJYVQw40MQDECd+jvVEgsUvxdU9sCYm4oOSWs7e+uBAb2
 9kENftMqlViJiW9iWD2tr3xgb62e7CiWM3LM/VaAQXaxTvy8obzv0rycQ1mtEQDderVW8Hf92
 Svhcrdwm10FEwpHV3OmuAkcFsxIgg2gXiY7IbZH8ap/Y+7CL/Fyi92Eav3MuziyBLshiqo8gY
 lKXOJaXT5cVRzg1K6sb/OquoLR4G8tTUNB1cYOr9sreWhdH2BrRkAGuIjGW/ElF9uV5aki7T7
 RVDSf4Ab0XQ/0YmEGz9eA+W7hscr3tVrIIGiQnsITW0ayMvlYbV2sqoiMCEb7v8qj5Jgd+n5H
 DcnKjcDbRD3D8E2klbPeRzRd1j/6qYzRKDS3EVLiXB5T1JxRYQzK4y00PLfrt+LyLcVAvkQZh
 QI3ig7AFdZ+9eFqDP7YIrT9b0wTViSoxFzcU0yaC9NkPuHaqYazGZiXyK82v8+j+b/qfeR3Yi
 zSmnj0ZtTrgumeNsiCqt3SVcZq70czr5rLPpPmft3gOTrXu1mdpahcWwDT8nF2k8uNTnwA3mS
 eYjxZzA5Aq9U+UR9jGjNSd86lyeQpt0GkF53wIPhNBotw=

On 22.10.24 10:38, Maxime Ripard wrote:

Hi,

> I'm still interested in merging a carve-out driver[1], since it seems to=
 be
> in every vendor BSP and got asked again last week.
>
> I remember from our discussion that for new heap types to be merged, we
> needed a kernel use-case. Looking back, I'm not entirely sure how one
> can provide that given that heaps are essentially facilities for
> user-space.

For those who didn't follow your work, could you please give a short
intro what's that all about ?

If I understand you correctly, you'd like the infrastructure of
kmalloc() et al for things / memory regions that aren't the usual heap,
right ?

What's the practical use case ? GPU memory ? Shared memory between
nodes in a multi-CPU / cluster machine ?

Is it related to NUMA ?


thx
=2D-mtx

