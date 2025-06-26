Return-Path: <linux-media+bounces-36042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90790AEA8E2
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 23:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82DD318911F8
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 21:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A47E260576;
	Thu, 26 Jun 2025 21:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p54jb+Sa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69EE25B305
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750973537; cv=none; b=VzIBTnPybfaDJreBjQRUvVVmBri+aRfBd0ACRA81PUW/de2W7GALmQIRQK0CqD+9s9JbpS+hg1jRX/nLbgIAz13q98T+GmeuCStpk26NhkcTBWUktrXfZvH8YyUP8PHf3cYiSmpbXPxXa1vXN0y6fXezyA3AJuGfF+gqhzQBurI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750973537; c=relaxed/simple;
	bh=Vg+bsnBCAYgGaA8Ef8XIx7/sg+GRsIjqsHyzMhcM+Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMM3TycK/lAxLJCopZzLi+/QMbmujd7h2tWN1A0UvAy4khOstbm45K0r9ytFLxQSNlvW68ZvElgUmvyzX+KJ2hSD60AkOwiZzeg0bLpGemH5Z/UbZCory2q2OyEaPlwjigcUJbv5pdLq7o301r4HzJrk3NraOKL6qCrJhK+MhHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p54jb+Sa; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2e95f0b6cb7so580079fac.3
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750973535; x=1751578335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xw6mnndRYOAvK0RCLzt9VBUYGf36cfO8dHKbt/kftME=;
        b=p54jb+Sa7NiFZa/s1HGZnff7XTyBQKiDmjMHCzO3gh8H/Rd5bNZEh3f9CicALQlY0B
         lbyD/tdJEUAluZy4kGozLVMPrj8LnjMw0Vqa+/nr33JAsiYjZTWpCnTLd+TFIpcSo3pZ
         w4z0YHGpH++6nJPVH98Tdwo7mTQWz4KgPNTi01FcpSNFSWA81Ifblr/PNUn6RHttOpIK
         rCNyVfrXzYZpZKsgFHF6NWT5nJivX9zysULfcA2JNPhl4hHJwOGsiZuhb90XTw2SPN2i
         9LtwMveyecb0+/HBmB5ilMdgCfuR52jI8iguNLxlwdQOtnaRZZOYnQRLYIBOl4t9Zzs6
         Kc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973535; x=1751578335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xw6mnndRYOAvK0RCLzt9VBUYGf36cfO8dHKbt/kftME=;
        b=I29smnpwDitwj2g6zXpts8oKd+cYSlDWk/hFrXYdUxLalDyWaY/WLeYaat6GxRCQC/
         uv5TgnW4XFCwipjNxd+ZDtF6LJChgB5pJVC5XGrkwRhahuFIP7suBZkqWUochdPtSGvb
         MhxKJHtSsGjINRpKPQpGNUds/ETwzc0Bmnl3W8OaEjxpm5qSDayPWuUxOCyqCjfNPWbs
         u+zVFcgPKNbuAjD+DQ76fy6lFV6IPlmGLiHtJflBHMrD4kn6B4GyF1d/PiFN+fZTk+sm
         ++S+QtY1bB46ou/OEiE0MzZDtuCU+knWBiU2hUTC/tNOEX26awXgSEhCxcgrLx5ME7xz
         qmmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzLfYr/l9WYj53+KSzctsa8jbcUsCIVlZKG34Wt6xRAa2mlpfgGWZiQ92pLYDWz3wLuAKfAZDSpPXy+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPjmNpJBdIDW9CA9VCUAZE8otmnDnINfOD6P/W+3aupXr7+hpl
	aQeRDcB9Qlk3zNj7xmtE+huHIm4moaM8AmYmz6X+zbCg7JRwGJkDhX7NimwYCIqW0pXFGfOr8YT
	43iLk
X-Gm-Gg: ASbGncvQ7/xFVj+lczZHEd4oK8e9LVMetvwF030m8ARTC3+v91VP5TNwhD0t3yMAsxP
	RRAC+hzuShTjQgq6Af8EzHs2fv2f3jNKLRsU9vioaYrNw9jItGQy2iLhLGUlgXlpuCBFoVE9azL
	Xdqqlb/0YZ+lI5TpFPo+HPMcHGBlJXLtqIoZl4kW4qAUKlDz2fIN3pWvc34f9MqeLTlg8Th9lma
	RFL025TTSaIM9bQPHQxT0kL2MIBmLK9oGNOPGU0pAJSAahcEVUUxQmafBpmRnyev/3YpnoZ5WhB
	2ydipcXBdCU8JHISWT/gHcTI4kuTu5LkJObl9bqijBBSyWSiDwH+1EhDNOGzbk0FDIV6
X-Google-Smtp-Source: AGHT+IH2nzUMv//M5Dg3a808pERB9UcVAPf9zLq+udw6Z4J+VVriEvR2PRmVpGe3ReP9rQZlc72UBg==
X-Received: by 2002:a05:6870:b488:b0:2ea:1e5d:8ad3 with SMTP id 586e51a60fabf-2efed6782cbmr417990fac.22.1750973534993;
        Thu, 26 Jun 2025 14:32:14 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd512f0cdsm547789fac.46.2025.06.26.14.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:32:14 -0700 (PDT)
Date: Fri, 27 Jun 2025 00:32:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <fdaedc62-2beb-4f18-9e4f-f60ef35e1b38@suswa.mountain>
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>

Resend this patch with the changes Andy asked for and I'll Ack it.

The other things we discussed can be done separately.  It's also fine
to never do them.  I'm not your boss.  ;)

regards,
dan carpenter


