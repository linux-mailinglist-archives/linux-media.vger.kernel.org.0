Return-Path: <linux-media+bounces-27144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E4EA479B1
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 11:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E0E7168225
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 10:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36ECA229B0E;
	Thu, 27 Feb 2025 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CCvvIGtX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AAC228CB8
	for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650402; cv=none; b=k3RRiwD26aq2efGMk/EVSlQ2JneSMFTp3ZK1xNUIkSLBKTesjV6uvaqkiY/PySlYEwgflH7tturkpRvAzM1la2NNtW1B6vkP1V4Dm3bxPo8eOH+Q8HuKTQAuT/J1hy8AlqU82Ay6p4VaD+fr2ba6JC9s4Rbne2qnR4E2QsA6rTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650402; c=relaxed/simple;
	bh=Hxy4zLP7nPAij63gn8nYyXPjhnD7qhC4nNggf0uoN4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogrpAuqY2VgtntOCfG9VRTMtRxRsMv/fGSdvA/Z8Dlo14SIs7BCyp8G6NzCZAGsN9cMQDFZrwZkkR350o4yRlqUhky6BQRiVh6txbqoG8CwK41krAzo49iN8wULy8RK5iRIlunyPxngw5ANo1P3fx5xvWi7SSTRbLvcTTwPvijo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CCvvIGtX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb79af88afso136957266b.1
        for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 02:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740650399; x=1741255199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIHFyw4DJimMnpIl8i0OzzVtEtYlzfhRkm9JXG7+7wU=;
        b=CCvvIGtX5w7qsr8/mf52TKi5Y/qRxLm3tRtlJbxHQcMpPUZ3FQDYp2T5FngSmF9PUG
         gN0edsAS0GU40gb/7tt4Y8t7PZvo3iHwBUNybjI3KWgh2i2liOdEjbZo+cANl7GPRhKk
         8oLHlrHf4l4d/69xhJtnSAeDIJWw3h3sbiviUpJYNfb/YOPMewF0CdNXmaYTdRRhuhaJ
         0pMAQSdAke6hrQbSv50DFa4y4OuT/NHcM63P8EMBCUUcsa2P0D+Co9FQcgogDlQR2t6Y
         kAFIMunJ899aiQGbg5IwDTK2xHSLV7LY+r7wDNiYrHVRwnIVAgIhqRnEHlgYD7HzComc
         h3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650399; x=1741255199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIHFyw4DJimMnpIl8i0OzzVtEtYlzfhRkm9JXG7+7wU=;
        b=jiyjTHMvZI3PRG7kXNemX5d8CUdMZcO1aqGfvyhIGtRE99V/aq5OXfgr3u+lsOMMk2
         yNffFA95xT7HV1iCmPrmRomTLBQ/5uW1Ms8I1IFjSpqlmDMFIrBYBTEPGp5i2yxmPw9U
         ahhJduA6QS/mtxZTyA1XiRG532bcwZfceDHdcl1U3BtpID39Q5wYAL25MRjj0Fi+Hf2p
         nGR6AcKZ7PZen6UcG0rpG18FxIGRzEAB1z4pEWr5sM+gRU8Y4LCUDbALeJtF/JXj+KJt
         rZjpEr6zvPVu3cZHQtTygKfpLjSG39oogxiM1UuVWoCOckk/dutn2W7InrWVuopk+IXO
         Zi3g==
X-Forwarded-Encrypted: i=1; AJvYcCWaY3fnnHLQospYCVuYjZo7f/oFZFSv0JETeH24mdu8G6PgtvIxkOlEDKo7Dwa/JF2ZYq6bnBIomtepPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy1czhGEtc23t8A+t3mEO758AqMKGQ1FRSguICLFFvH7ffafr8
	QI/6ga3gHqMnx3wiYk1t0lvpLv2XEmZDEKSnq50qYeBjoxJs9FvHColEGHo0C+g=
X-Gm-Gg: ASbGncu0We0s0aKkuQMIui1+TrcMitLpb/7QXQl8Jd85MdQ3tp7gEQnX2q1gfxEt+Lo
	xxiHCIUY5X7FsWctBIjNuJOxOYmz8bgFRJ+grKY2cxoJf7l0E7QYL1gLz8iQZUTwc+zWBspuVQ1
	4HLu/D6bjZRZnXsTuvdxgr0vjE6nlKUuqYe8U5TsLc2vCtsgQs8PBhzJ7hUWJlF/OH2LUDwQjyS
	HtvfCZgTMQSGnc1Q6Qvt7UxOc817VuBQ8ZpYVf+k9YcYUiYXz5hrfL+0L1u3Z+5Nq1MwEyKpg6V
	jnWITh82dEP+JX55LzXhhc5y1rOPU2c=
X-Google-Smtp-Source: AGHT+IHunHmqDDk/8KV7z25yVlfx9n1ZmOsivVdt03USwowQNbi9YBZAEFtlG6SH7Vi2b3fPs6n3vQ==
X-Received: by 2002:a17:906:7cd8:b0:ab7:b5d9:525a with SMTP id a640c23a62f3a-abc09c1a653mr2285136866b.37.1740650399043;
        Thu, 27 Feb 2025 01:59:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c0dc21csm96948866b.42.2025.02.27.01.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:59:58 -0800 (PST)
Date: Thu, 27 Feb 2025 12:59:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	hverkuil@xs4all.nl, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] media: imx: fix a potential memory leak in
 imx_media_csc_scaler_device_init()
Message-ID: <d09ac514-be27-46eb-8b2a-1a397e3321d6@stanley.mountain>
References: <20250227074451.3698971-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227074451.3698971-1-haoxiang_li2024@163.com>

On Thu, Feb 27, 2025 at 03:44:51PM +0800, Haoxiang Li wrote:
> Add video_device_release() in label 'err_m2m' to release the memory
> allocated by video_device_alloc() and prevent potential memory leaks.
> Remove the reduntant code in label 'err_m2m'.
> 
> Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
> Changes in v2:
> - Remove the reduntant code. Thanks, Dan!

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


