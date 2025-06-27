Return-Path: <linux-media+bounces-36126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81401AEBCF1
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 18:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 874F77B1B35
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 16:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996461CD1E1;
	Fri, 27 Jun 2025 16:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nKhXmo+7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797081A2396
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040999; cv=none; b=ByuxdigY0BIkaCk/I8jKX72e2BOJxgoRZEr4mVgeYc0QyLJLBv2mxNm+2lJDl09z7GWFh3saa7et7VjVGtO2+ad4yuKSgvUmkxrQ8flLfKJZlIAxRJ2e+4EIAs8CboohwXBMgvs77H57nUQBBVNCU0vApHxpq7Fy0laQOtZdaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040999; c=relaxed/simple;
	bh=5BCZIdNRkhUIBdY64OeUY7sVGNbJ/g40WgIHT6thUNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfiAbblE7EyWYOwA2MwFSPNwclzVmAi+WMgkELdisXwNf0FIAWHU5In99It75u5lLGHe+RaUlrYb8cXEkLRbyfcWd78x/h7ojpSnmQ9TFW77XI/oaDgnpQ5ThucH9ox9UqpLn3/yNjcB6yj11qlBtdDWyuFuyuKLkO3yP+mG4Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nKhXmo+7; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73a9c5ccfcdso38579a34.0
        for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751040996; x=1751645796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPbqcYbTYh3za1zv46G3MUpPRWr3UKkA5XAz/GSvqf4=;
        b=nKhXmo+7XNP5eVmOzGmJBRICZIMSAX8pp7fND7kEIUI0MM2kJ56TBWxAtL8xziH5kA
         iQHWoNkDFkGN1bmF2Uy1wE/JMSzx53dKAWYbYvotSvSCDQWfWDKiM+Q+KmN4zJIkLwV/
         7PDkJFzDyJ6zhkBRwc16M3pY/yXyczQ/KlG18MbfWQzfLS/pG+SFzpfphC56Crtyz3Ks
         jVxyDScSNWMxpfKlPXYT+Z8a2h+l6FkS/lwFsQwlpt9CWiBnwuI6Ej24wfd4etdUoZi8
         EmlcZnHfSoJ772Ij5OwQco4HoedFVq2e7TstB57pUIcPU99j2DB3qVT8IdS3NP1Rmmzb
         CBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040996; x=1751645796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPbqcYbTYh3za1zv46G3MUpPRWr3UKkA5XAz/GSvqf4=;
        b=tT/PIBupqWc2tBFZ7iCiWpRZOg7gR/ZEtwwchXFiTEMZaNnQh8W6QMGIBevPfmO7sq
         pM/7TVdx2fY1vkXIIfKyE5cbace/kXZHN7zMsX59SOY5FGL6SSntI/SEC78L6hyv5rM5
         ObjOgTMRA/Gy8Ey0VLXUNpN0P6gM+ChG8HI4dIBcqbLiwkQ8r84/mg4rdpqXDeJNYaq2
         FBOPWNUt+1eMYAVi7wUltK/+ihg9KZMtzAUyyQfuFTPKmRGlePUBfFvotfnW5hf7Khy6
         AhEzDZjs31qw4AGF2RwD1YSreeL204Gg5hS0yF6GBGs5ibfhJKdFoWb8okzfZNZx3VMr
         jT1w==
X-Forwarded-Encrypted: i=1; AJvYcCU/DZe1gepGYDwLteyvS+3EddjozqyAa27UQT/6JNgIFQQLPorJ1p5tzK2O1B/Uf4aQOe7fPjfL+6FHiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNge4utx+JL7ZApDnUm0Ew8EgAmh7xlMntkyF8mwGEitEmZAkQ
	4ie00HsESnarxjgajA01J7kyhv3OXIXeTxWyFWYeAa9sBUfI8OD8C1SPhn6jkSGibsA=
X-Gm-Gg: ASbGnctfr1/wSNhZ8Af1gCRHtIWAY1GO2THLRToy5cMFS0c6QMtcmTtrnVjKwRoVhWf
	7aDxcjb6YOj/71QAsNaJfd4eC7qPSv/YVYG2XundtRtz4zhahZf2PWQ5fbk3mIosBDaxGObIAB/
	h+boo+OWDyx6jmTjnZAqfJiXSQkymOuV+u1myQarvX76hjwt6sNPPrKBQC0XU3XQ2Hi07XAg99X
	j5rH7Gp86d0Rr45exGMX8DwbD16AbFKxSxkGuXpZz7bX1tnVOWLKr8D6jJviENU3VmAhnHhWP5h
	a3BR8plGbmpgNJZ/CzCmQRJ6+iFXo5Qw+nDTLTjfgy/QCIfBVfPjKyvb/gdx1OWpWI1Npg==
X-Google-Smtp-Source: AGHT+IHSu+h2Kzxlf1fk0VB81UI24jyMyrVK0+P5Y1H7EQ3VQt8CFFGwqHkfpVATJdlBq2OYHofbSQ==
X-Received: by 2002:a05:6830:4d87:b0:727:3f3e:53bb with SMTP id 46e09a7af769-73afc600f17mr2265204a34.24.1751040996481;
        Fri, 27 Jun 2025 09:16:36 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0e2ed7sm406749a34.35.2025.06.27.09.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:16:36 -0700 (PDT)
Date: Fri, 27 Jun 2025 19:16:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6] staging: media: atomisp: apply clang-format and fix
 checkpatch.pl errors
Message-ID: <0256dbd4-a08d-4549-a520-63ee88eb3c1f@suswa.mountain>
References: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>

Heh.  No.  This patch is way way way to giant.  It's 80 thousand lines
long.  Anything longer than a few hundred lines is probably suspect.

regards,
dan carpenter


