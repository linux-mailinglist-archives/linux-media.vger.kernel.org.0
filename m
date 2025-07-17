Return-Path: <linux-media+bounces-38025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 092E9B08F77
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 16:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 207A05A2B07
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30AC2F8C20;
	Thu, 17 Jul 2025 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRM11vQU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A540E2F7D08
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762613; cv=none; b=nusNlNl/Jq09MYjJZ9tjeWviemPNmnotMUvA+8sHWL1Pr4W8bL/QG6BBr5N32jpP/DTgNGrIPvjj/aNerLfPyn/xlgrRwpjK2nr4Xg7kRy1cFTVJRAyfzP1b7Rz7R5yfIPyHHoHGG20bLxlcWPr3zpfDd53UnPkZsoBK1tnRH/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762613; c=relaxed/simple;
	bh=i4AOCu/t+teVCBfAnuyDW57wdR/g54HBsrTynSNwcfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWeyPW/DtQeXfXRSToSgg2s9C0Oxohv5vsCuL4TKFowlpqTcjMot/j3qcV1YtUzmIoHvQp6Lz92rKKEASnn9ONfhcv5tn3he6Y1PGKqdy5Z8IRv+SmDqq3IN3qtQlub/VRVHP3e5zie6K0O2RpMYhOKicc5F0fEOQ21AhqLXFVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jRM11vQU; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72c27166ab3so786885a34.1
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752762610; x=1753367410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9WyUNURTxDjhSFlDNytarMEzB5jWv8rhBlf3egCP8I=;
        b=jRM11vQUEsrBZG7MyN6+ymUBB1Hp27NIRwSuxVPYAG4+YVRWR0o3qkbu2z/tIyrLRU
         P8GKEsB86pXgxrwbBL5qMtVZ5N7A/tfsZYUO70gX55kTdT0wZeK5xD0Destsrwiqtk1t
         ogh0CVKIgvovANGQtJFmDtSsA0GuLKfbfYp2+asS1mtJdY0o18PhYt7ES6ulReJ8Tpmc
         yyz3pbTa8OqX6K1Un3Tl7fP6YI2Oy5S9FGqW2ZF5fdNv8w15J336W53cz6IBxK9vISjJ
         oL10UURPPNJxFzBJG7uR50BSBxE+vD9XJaKpK3hhSolxIkh0va0fxQ1JT4YZnwKOZnZf
         R0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762610; x=1753367410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9WyUNURTxDjhSFlDNytarMEzB5jWv8rhBlf3egCP8I=;
        b=JVvehFFxa4N+vweQ0qxl6IcsWcBrx1VMI3BbkJD8eTcKFHlK1PZ/ioIOImogUxMutD
         cs0JLodbSKCyZn5kxi/DqvaiXTWVJVfJwMiMDzXg8mybS0M69EV2bB7fj7V+pOAVoF9k
         kbI3BQ07by/+a72n/FamZ/W2cIlc+U0eezT2Pb3mLX2+mcAQzOO5XDdOjTazofEjBXQL
         S2W14E1LQT7Q9sb4GonJ2SRjP6fzHVuviWAInfEaHo1S98wyphH3gw6WOEzM8bEpSEPK
         E/qCcOBZjvH/jWiuhcfwZf3o39724wmTQadc5nGWj+XRHhj4Uf+CODe+edIHz7GilY0U
         aHaA==
X-Forwarded-Encrypted: i=1; AJvYcCU14yF4nQ+w8xJGc1TlmRilATtqIffU4MAHYhJ1eScyvfbxUd0NN8dudMPYvdvdfEI1oqZlrHnaTKReHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc0M4dZ+6xQg+D87a4IAG446onmRPDUVlhYybAdzKEqFkoEXPA
	nctA6ChC2iCOeUfCSZH7cnUMSIxWn/p8VtavuPM2mYPIb9GKMoRL466VwBCHjqoVwDg=
X-Gm-Gg: ASbGncuV91E2W9pHQ95O1rK6fAFqaHIvnhsHjgDYSc4yOWGvMdHky/5oIU14d3hR5gP
	e8KmbhiQ8/ruOFyIrnKjc8qs9OjJq9oFIo3ln7kA4rig34VJNt18xxWBroY+0I5EmcJkWdcR43H
	/dD3kIBVJxfnk2B4W7kpOCuSg/jHdhqQ9GpY51cTsHVVlWhp7dcjIO7I1h1mQ1z6ueQZnXLAvUc
	n5MuZFtfKXEB0Uo6YPHUt6RizlfNiI3vIm9Aj0hHQ3+zlIDptcs0oSV+vOK2c630J/EawBrxLl/
	NyCUno28HTC0xWiTtVe9Wc5L3NE4lyafwRDQQb8DkeT7t5u/YQB3GkRmNxsJlJBklkljnz8P0Ti
	Aur0w6veFjoc1YtoNSnCPSLav0+SB
X-Google-Smtp-Source: AGHT+IHk7/gc9YLubk1Cjji23IU9exbggTb4A51g9DQ8a5fEshA2ox0UCblR1EaUtTw1t+IxEkNNCw==
X-Received: by 2002:a05:6830:2113:b0:73e:6bd0:ff93 with SMTP id 46e09a7af769-73e6bd14111mr4602096a34.12.1752762610529;
        Thu, 17 Jul 2025 07:30:10 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e5d9028c4sm2024909a34.59.2025.07.17.07.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:30:09 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:30:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v3] staging: media: atomisp: add missing mutex lock in
 atomisp_s_fmt_cap
Message-ID: <3b926b78-b95c-440d-846d-bc9d95aee714@suswa.mountain>
References: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>

On Thu, Jul 17, 2025 at 03:42:34PM +0300, Abdelrahman Fekry wrote:
> The function atomisp_set_fmt() modifies shared device state and expects
> callers to hold the isp->mutex for synchronization. While most internal
> callers correctly lock the mutex before invoking atomisp_set_fmt(), the
> V4L2 ioctl handler atomisp_s_fmt_cap() does not.
> 
> This results in an unsafe execution path for VIDIOC_S_FMT ioctls
> (e.g. via v4l2-ctl), where shared structures such as pipe->pix and
> pipe->frame_info may be modified concurrently without proper protection.
> 
> - Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().
> 
> Fixes: 4bdab80981ca ("media: atomisp: Make it possible to call atomisp_set_fmt() without a file handle")
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


