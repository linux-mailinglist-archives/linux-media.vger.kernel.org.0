Return-Path: <linux-media+bounces-37892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E3B07CB8
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 20:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5160F1AA6ED2
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 18:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533B529C344;
	Wed, 16 Jul 2025 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HocqEg8a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B8729AAFE
	for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690109; cv=none; b=jHPjB3oz+p83ZUoqCsJ8SGBHCLt+lQIJkb3CgkEmB66cB/ee5ELQyhSMLVDt1F/7RYcWB/n3JU8EbwLFhPYE2kvPNJtEKMO3EpKGFSfeLJwZ24iFFCC9C5KJKlFiJicur9HpCvmH1Wc/Qb3SQj2yLZpHjZFNcvK5Chy0ODrSwO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690109; c=relaxed/simple;
	bh=bSE6/htDCjhVwR/NENeM4sfjDZISV5OmZWcaU5WSJWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOVyDrjarVvg2jPvWQcSJcgPJvXJSzRrdyCUvusuf82MF8+wgqAq+FaT9J8C5vrmV6XxOcRNo8UnB9Hfxi5FHFF6Ff/oLKFt1shCBYwm8ytVhu3oqadhZsPD2vq8sHb1JJYPq6zyn7yyFZOiVsxU9evl43P3Y/37drDFvyWqJR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HocqEg8a; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73e586fcc28so705557a34.0
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 11:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752690107; x=1753294907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+I5gJUMV6DaD5nZCZUo7tbib3WO9WKglwCazUnA13Q8=;
        b=HocqEg8asHDMeIAhNNuQnZr3gxbyGvrP7Pud7kQoH0JB8XENTqcNaWtnEZzgakY7Q8
         0xlcN8isvjCzyrLfj5in9y8Y7VZsU0hElTI6IDv5rtXxAQl6mi0wKE6/7u7v+3zpYWiG
         Vl9Zja7foRutSVweUDCz90yP/2Z7vxLEopburnAmMYhQNDKJDlFngxiE4KXg2kP8lHF+
         tc971gducyun7kLCNgWiXXNEUtNMD5orevWCVsh9e5KdhaoXSYLD+KiSAjXstE8YtISa
         Kxr4jRfF+JLLB0FtpAbrTZ6VqfOKBXW0MtmjCNj5uiGC5CSFwSty8FXyRfBteoqVNIkt
         YV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752690107; x=1753294907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+I5gJUMV6DaD5nZCZUo7tbib3WO9WKglwCazUnA13Q8=;
        b=Fox9UHrNHVHE3H3x6hr74xU9PQzklhSs1ysFVv5Ph6NBKe6z69ayxNYV4yi/lfOznK
         NM1W8ci1T6oUFZlutWd3E+SO0QVxaZhfCaAwHopN+R4G+tmlCoO7g1UY400lAD1QJEbb
         9N4+Q7DdJqINOuOA9IdL2KmnRfDqNfi9jkkmnWfnLbw4rgVIEy/VFEx4EV+jN6+78a2+
         g3cJoMBPXXVE6+NZaKDXMKSodKBbsPlGsqXBiCg0TfTEKa19BsAFu8qKlvVD6jSO6Y3u
         Hpma7/QYPkVjrQS348FHj0Kr9t4Ilv1I1gaJ7x2TrNStHU21relpMqT+ZM+qYyAnFZZj
         p0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCU1onY0X+LV02WTtqLiB1ZwUnKAH4jwuFSF7RfkbY/M90zXkiin9N8koZy2Mgg/fueokEAfns0e6HW0DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAu+1V55xGmBD/lmkv9ySStO0Cpl9HsxwFFsstGUOB5sXuPQRE
	fKknOyObcF59NJ+Stcu0oqSjmzpOWpOQUN3osAoihP8sBdNYE5BAo8qDZiLxisIy8e0=
X-Gm-Gg: ASbGncuy0osvV5asPwnC5qG6QejTwv4mPJrSamNcbFzM1uWglI5pMRaeOfp373l2fop
	VedD2dWCyX+f6FkeCzn/QD/ezcPVe2V0JrQw9eTX2M2Ui2QXbXbvjZZF/8F8nf5I4gxLZM6YqmF
	h7ZZM1y1zUrz0tHWGFO6SqzTkw6qQO7PznwNPqNywXrgXyuDFX1rUJV2DGaudIl2FDFDS/p0RSj
	Y4zTet7rSSkesUdj3DH9/OObfZDP60M3tj3oLWXQi6usOhkSbEA0ZlkorQvVkuJz2nt075RJ5C2
	cBk/bDWVaOCd5MpypHUoPMfGJ9i5VbKlakDZJfaah/QMYreNrpCGzr5FTkuzWSnu8lPyCknNBev
	evBKyzalL7aHkGmJy4vHkHx5h79e+
X-Google-Smtp-Source: AGHT+IEhlTR1gjdZzQg8e3cObaKUeHfTFTkWMXpRkjEp1uVPcyn+zwVpRrjFN9tYQgLGPfOIHTNFDA==
X-Received: by 2002:a05:6830:4511:b0:73a:d3f6:8b22 with SMTP id 46e09a7af769-73e73219eecmr304837a34.11.1752690107122;
        Wed, 16 Jul 2025 11:21:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2564:68a3:7d6:cb7d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf1064f39sm3187859a34.6.2025.07.16.11.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:21:46 -0700 (PDT)
Date: Wed, 16 Jul 2025 21:21:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver
 AtomIsp
Message-ID: <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain>
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>

On Sat, Jul 12, 2025 at 10:13:22PM +0300, Abdelrahman Fekry wrote:
> Continuing the cleanup work that is being done on the AtomIsp driver,
> This series:
> 
> - Process the error inside hmm_init().
> - Unifies the HMM init tracking method.
> - move hmm related function to hmm.c.
> 
> Previously, These patches were sent individualy but they build on
> each other so i resent them as one patch series
> 
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>

These seem reasonable enough to me.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

But it would be better if someone could test them as well.

regards,
dan carpenter


