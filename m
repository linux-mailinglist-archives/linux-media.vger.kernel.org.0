Return-Path: <linux-media+bounces-36116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4714EAEBC2F
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B82ED1C48068
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A967B2E92CC;
	Fri, 27 Jun 2025 15:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qji/ETkQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E35A2E92C8
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039052; cv=none; b=fDyiVPezZ4mNxAwhg6DmN4g7m88+Dd/wcJZccfnOW8G4vsfsSi56FwwdcRtAr8c1QkuLtI7uVf+TjFFVPAorWwdnSv+U/l/H5411ANiqhYUTXA1mIfXLhDBULyLoVKdhsNXzLf3VsveYIYUSvYz54z95HbQg5L2ArTg6fzomYSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039052; c=relaxed/simple;
	bh=LcnRDVEnZy6QHKQQxsP/nvCacp9OQV2gpAzUNBJMFr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbcCLee23veNilCHvUVAMJ7eI0P3tG06VyZLPJuGCv+mn0Yf7kXxSV2lBPJdSgkMrHTUTEEyIJct8glUdhgd+HSC+I/655ER4lEmaJY5o80NMeNlrzoNQDplKiLnjIMMSuJdQ6xJ5eFx6D1YqRciM19RSen9R/FIIpOSjKR3dQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qji/ETkQ; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2ea35edc691so591437fac.2
        for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751039049; x=1751643849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNskI9ihVQwbRR9S2z7pyG2KNmQ2CECCpU1on9KtPmA=;
        b=Qji/ETkQ2YdAM0G4AO3zcmLVlrtaIO7YQgnMz85O8GpXE5FNI0dI1a293Anac4TVoM
         czOYuk6aPm+Yb5sL7vu6ZrtthUfh3Wufwd1HXUmc4QDDLSQURSwTX6DAZUDpPa6x9MZI
         a6JIsi1ATzCAZnJVgf5B9/76M1QKzHGSvjI7u5c06SKvgHayToXyINg+f9jTVIicVtfG
         llOBBxDwoQSiQtVyBe4rwPx1o13WofG7o5XAvxI0SoCjw9JDcmon4xz/GnvgyAhyrN9g
         XWva984D/xI6blHHHg4S02CyYmiHVo2ozoC809CBUFlyTPV4dOeyajA6WIJxDBPRce4v
         SOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039049; x=1751643849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNskI9ihVQwbRR9S2z7pyG2KNmQ2CECCpU1on9KtPmA=;
        b=Ak5M6/RUSHKYCh0wWUpIwcHy/OQqLZ4S1A0YQh2yCoCQIT7Nnz/6XYilcS+BwR+GOj
         L5GExTw/Qyx20PWe3fOnLnzO7s2avEUlAt8oXpBbSKfd+FCR4w+QoPa+Lef91ESorO5/
         z18DYFODw8Sjt6oItb8nrq48VuqAzFlSEp7/ZQKbxvlCRWugfNF1uZ2l2nD4DRRzc19W
         HhmuE2S+kKkqZQuH19IYJ/ZateAZAfQ91Go26WtBnIOJaHZRfgCl4/YVtWSho5Tv6C4k
         qyYxYHsIMTLL0FgO/0LUeZAZjA7pxDBmBWFc/j1pdP+Uo6Y8K73lVlNwC0WLc5Dp2J8A
         7q4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuJ/snEyCNeEqJRmv6J68oWLblH2s6rdjuKeL841XwXjDra93J74eyoo5Std1KqjT/wj7rw0/39c4OGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR5Co0NMxqD7LQ9AyrMTiA9jAX0gPaX8nJhoZ1RLRlQai5qupR
	f9+HnLCTtMRQqR0KD1waBD/tNTEBjB6dKs72arm9QPOScM5oKM8ALS/6pSOMaUqfUjQ=
X-Gm-Gg: ASbGncu0ZYFha/Xbq5vZxjtkSTHQD8pWppifyo0cn6yaGJ28eR1LZDetzPu8e0Yv/K5
	BmQs5OP1uosNU1oU+uE4k7gGr7PLhfIC4peCFL0YQ3RJa4B4AmGNKDivnuZQ4dIfM49OnHY1Jp+
	+chfuZaGqZgiUFsQUPGEumMmJq/OXHnqwiMp/d5aa2ecZUCXmeKTWK9Gwn+HT6yL003Hef98RWL
	0w9PsVV0/gBcUo7JrT2jP75C8NRkotwbh8GPdTvHsM2KQ2iXVg5HQs7pH6akDpGxVJoMUTPJ/k+
	3uQlgchDIE/crGlei6i6skus4qSBTT5WCwsHlHYFsKp9I980pKcaeRyrS07j/c+jh/uf+w==
X-Google-Smtp-Source: AGHT+IHhU09H+nMf0lfOpqCHxF+Y0NTLulCnQbm0DdYiPRfdIF593CXffYxkSUXy1F9j48/+OHfs/A==
X-Received: by 2002:a05:6870:a10b:b0:29e:5897:e9d1 with SMTP id 586e51a60fabf-2efed7a51d7mr2326653fac.39.1751039049549;
        Fri, 27 Jun 2025 08:44:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4f0f7d4sm911929fac.18.2025.06.27.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:44:09 -0700 (PDT)
Date: Fri, 27 Jun 2025 18:44:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.com, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v5] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <e7dfe490-abfc-49da-8beb-50ce02678c86@suswa.mountain>
References: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>

On Fri, Jun 27, 2025 at 01:06:04PM +0300, Abdelrahman Fekry wrote:
> The sysfs attributes active_bo and free_bo expose internal buffer
> state used only for debugging purposes. These are not part of
> any standard kernel ABI, and need to be removed before this
> driver may be moved out of drivers/staging.
> 
> - Remove active_bo and free_bo attributes
> - Remove group registration calls form hmm_init() and hmm_cleanup()
> 
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter



