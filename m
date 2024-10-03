Return-Path: <linux-media+bounces-19064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B0298F4D4
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 19:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5BA6B21A66
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 17:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4021A727F;
	Thu,  3 Oct 2024 17:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpMdRYKR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF5A2747B;
	Thu,  3 Oct 2024 17:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727975255; cv=none; b=rKtJN6X3o83auJhjoVLtYReE9o1hDlb186+7DVw5x8k+3GPp5Hclm0lFRR4u6wjlj94igEP3LEy7OdanbON1p2YqfkBP0uCQ1hyYCqGQBRAqxEqLQS9nsKaZR8APxjl5Is+0PDW2B/kVKzhruotgWCeFymAwWPIMkdF4e+2wLik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727975255; c=relaxed/simple;
	bh=dkfu7OpedYFMW4blTd8tKYx1+2gfV7GpFrrUeC40tik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bed1QWaQD9v3AXPpwjmzrQPkCQVcf2vRLbw0byT+UgX4PGT8e9KShCQKGLfCrZ2RHI+5Q5t6koZPOzFjsXUS4I7/OJHtrXpXqSXvVgbRCQntfQ6BCA3pd2EUuJsr3BCQ9xO2GkU/579zHL6tXFmvfnb5ZZ3kbCoVtKBp1zxAUSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpMdRYKR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b78ee6298so7549505ad.2;
        Thu, 03 Oct 2024 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727975254; x=1728580054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dkfu7OpedYFMW4blTd8tKYx1+2gfV7GpFrrUeC40tik=;
        b=PpMdRYKRklciDe6KMX91lXTILtYql0gqadH5w+A/qPCQvZhWVfcAjyfMwjMySJq2Ka
         fNqCFrySUQHRaxnVVw6q+fAIV6yRAPh1h4lCXXTmQxzUF44LBVKBCCMQrWm4r+sAu6ny
         3+fjeBzWfvHEB4pJJ+qpg9NogNTIpnNvlJQju3V1wLDJcIivleRME7Z+my2qEQjlzYQ+
         Hjni0Q6m1K+Q3Bzg9kCqG4J7jNZn1nV/RBfdmI4VFW4FKHjUKb47lO+bKOndsHsftQo4
         7tz98GFaEkhmPNz2Q2LbqdrwIIJrTf05pf3V9qM1crrO9HzLuOHQfmwgbJWbYh5WiYpE
         3WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727975254; x=1728580054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkfu7OpedYFMW4blTd8tKYx1+2gfV7GpFrrUeC40tik=;
        b=ntwRemNjpuIRWmlEClry1lRsJsXuqH4AYPGzuI+GlA0vKy2ROWxBemmCctpMhS60FL
         U7yLE0DfBRhcJNQ+t1fJ7lchBWXB//vUfWl+eif2uRbm7p5oxuZoCsiSPRQDZdjeERCT
         ZUWkWKPunx2fg3zw5JLzP2BrCuksKcmTCWB1pAa5e1dPznv2D5BYSoGubhTVI+qjJR1b
         TzedgXc7Vy+z6bEG1GQcE9RaAIzgvD3CW33mfmW1TlP1Duao2YwkhsSUtGpScZqcBQCB
         rlaGF564ltFcuYKFwMrGCDyxM842JkNpxf7dhJuWH0cb0ICy7A4nqhz1EiDxj9r91/kR
         NCkw==
X-Forwarded-Encrypted: i=1; AJvYcCUX7gklky82i4CVccyMy/t7p9xk2X6G22SbJKSEPBdm/kbs7CK7LSBgGy8AsT56guk0H4ktVoGoZ381B2M=@vger.kernel.org, AJvYcCUb98QqSce+uhpe/YrFU4fedhfXLCK76hT5az9ldeBtWvchlQaDg7YwOjCzlk2kwflUOeUM4rb44QLGSmpt@vger.kernel.org, AJvYcCWiKm2OldPQ3wBpoufdEeRuLYMDZCJ0wnWExrO7VTLUpFuiz+E4JmZHVWh9naPiWzOPwg5TNTtviK62Axnx2UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzovEbPDeCZCdgKzopA6m1K4Xp+Vrh6WBl/HVKOBlsjN4SeD//U
	8rvCfgGSd1lo5ZSlLxNhVa+VNU/QA89kAfwhUXn6HVGbZZHSjYgz
X-Google-Smtp-Source: AGHT+IH+lcuitFr2y68/zPm6sfKZoMgOMMWy0G+pLPaWzpY6VYabxGZJbcedKcdXA6Lu5Ya866DR4w==
X-Received: by 2002:a17:903:1c6:b0:206:9519:1821 with SMTP id d9443c01a7336-20bc5a0a184mr110302725ad.14.1727975253702;
        Thu, 03 Oct 2024 10:07:33 -0700 (PDT)
Received: from Hridesh-ArchLinux ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beead252esm11348835ad.43.2024.10.03.10.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 10:07:33 -0700 (PDT)
Date: Thu, 3 Oct 2024 22:37:26 +0530
From: Hridesh MG <hridesh699@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: media: fix spelling mistakes
Message-ID: <hd3n62efwrurrjrp7annnwufgiggmmszjmrqaryibf67dt53sr@mazbztoqrkdi>
References: <20241002152231.8828-1-hridesh699@gmail.com>
 <2163bf83-dd55-4f79-b0ea-834fa7b1f561@xs4all.nl>
 <Zv5XsJd965xdNI3j@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Zv5XsJd965xdNI3j@kekkonen.localdomain>

On 24/10/03 08:37AM, Sakari Ailus wrote:
>I can fix that while applying, no need for v3...
>
>Hridesh: it's a good idea to check which subject prefix is used for a
>driver in the commit log, too.

Will do, thanks!

