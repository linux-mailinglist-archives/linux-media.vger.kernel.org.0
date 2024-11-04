Return-Path: <linux-media+bounces-20782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB6B9BB0A3
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 11:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D089281D62
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 10:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DAE1B0F05;
	Mon,  4 Nov 2024 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ic+9WT1M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F313B18562F
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714983; cv=none; b=j7zQsWzHnsdnY+cIUrO7Mehog4/36GBsSxQYvm4awhCIvuwcknBmyIXPJrQctdndPy28F1cqIiZxJCRFRqI+BtV4YTvyzRlSlE0F5h+c8jKPRzjE0EgHAD4gUCeeJyeHqx3eadJrLTZSjcPe99BWqvq8cYfQLhpLnvShohBSCj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714983; c=relaxed/simple;
	bh=/mA7xwO17nfudrwhrGynT4Jz/VBstxG5McmGQTgujIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1AWCNDikLkqv2KYybfiy4efIMMNrFd/W2DnadjIT/cFWA1FDWzcMaRCym+rE11X7eeqZ7AxQ5vEjuXQMhH55TW8Mpp4Ev0XFBhY7g+n4R2ukfIGjOC7Gv+PrKspdFjE1GvxnI9BW/apUd/z3vL/Q64T7EGYjuYjov16nJkHG6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ic+9WT1M; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c693b68f5so41893665ad.1
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 02:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730714981; x=1731319781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2NTPtVJiGE7BPjeCGKQ0KHoPZRyzN7fNEfwB/yEgVkc=;
        b=Ic+9WT1MdDZRXSb9qbdg8+dFPGxifYAIIgYH/FGAWZ21kRmTRI/M87PRIzAPP9rI5o
         KHLpYiI0fl5lsp4s8ZOfd+y74H58dhQqlsCOlpSXo7SfWTohWfY8qvjwjTxq+J9AYqfC
         oPwEtXelD8UKNJzv+MLctaZKBfIMF0TNrxsIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714981; x=1731319781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NTPtVJiGE7BPjeCGKQ0KHoPZRyzN7fNEfwB/yEgVkc=;
        b=jWzFq5guKGP67C4+/j17vz89M47AOcZRzsqlpuV+Pzwt09KL87MKYXaE7HpmsKIFHU
         imtv5qdbi3XsHsyrhVTPHXLjt2qgxNDeD8vc3MhvtzEbENoG4xuYS7bTgmvf5t2zWQfo
         LbXb0+oVBxyaoTxa7Q69n1NMLDDLbFp/ZRqQZLG3dr9BmjCCJRVT7/vROheqdhRnSleY
         O87/8aB9F6FCECayGYkYhCyiZW/UHMHEMioSKz9Mfyey/L1ukZTxymCcXdJ9fIhgrKL3
         whZX1YEVwBEh21RoqbTBRfSjcBlwJikcsiVrc8VXl3i8tG/J83vdC2VqpMxh7JP1eXQs
         lFQA==
X-Forwarded-Encrypted: i=1; AJvYcCXTY712H5Ohbipju0Pinx0M9rnsKZz45PKLjPi8z2Ok90Z2PTCzto6/LU9ZD9Uu1Q+JLLnrDrMtq2MJcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfgozyRzM6286EAw8bNQZOrkrRDnUIcDV7lnpcjxY5Ap2XQEnN
	03YNsr1kMbcre50cCP7Us9B2Y7moZbJPwnJae5y8LsmrIq9XOzMeoEcHx5mG+g==
X-Google-Smtp-Source: AGHT+IHYH3t7ESW1pbuyQj7zVT94C1I2YPmvGXz2YuPhNZlY1eftMl0pWbwj7PJh4W7mfbZkG/rDiA==
X-Received: by 2002:a17:902:c40c:b0:20c:7d4c:64db with SMTP id d9443c01a7336-21103c7bfafmr208351825ad.49.1730714981357;
        Mon, 04 Nov 2024 02:09:41 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:313d:96c4:721d:a03b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ed969sm57814635ad.1.2024.11.04.02.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 02:09:40 -0800 (PST)
Date: Mon, 4 Nov 2024 19:09:36 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix crash during unbind if gpio unit is
 in use
Message-ID: <20241104100936.GZ1279924@google.com>
References: <20241031-uvc-crashrmmod-v1-1-059fe593b1e6@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-uvc-crashrmmod-v1-1-059fe593b1e6@chromium.org>

On (24/10/31 13:59), Ricardo Ribalda wrote:
> We used the wrong device for the device managed functions. We used the
> usb device, when we should be using the interface device.
> 
> If we unbind the driver from the usb interface, the cleanup functions
> are never called. In our case, the IRQ is never disabled.
> 
> If an IRQ is triggered, it will try to access memory sections that are
> already free, causing an OOPS.
> 
> Luckily this bug has small impact, as it is only affected by devices
> with gpio units and the user has to unbind the device, a disconnect will
> not trigger this error.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

FWIW,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

