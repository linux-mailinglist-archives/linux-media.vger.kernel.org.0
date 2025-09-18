Return-Path: <linux-media+bounces-42736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E8FB87610
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 01:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98CDB5812CE
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 23:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5556F322757;
	Thu, 18 Sep 2025 23:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luLgGnIx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C8B321292
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758237795; cv=none; b=WD9ZPSAR9zzJrOLyfIwQzft3wTrtkq6GBcslhcpmOB0h3/iLAHT3qZJj1dmyrdPXQJwN1JIWEQgBSeOSTjTIBIgILZGSUrI/57rhYGMM9w3BMTA5JlVhiOgcLo8lZLwyu6m+dZSCC57G+/bGCswd03HikAZHgOF8ENxXAJcaOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758237795; c=relaxed/simple;
	bh=Ef6Rx/N5TdXrlfO8lXio1fR8SoaPImH0mD+Ap5KLFW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHDbcvZgLzNkhUrvxiBYD147/rBrvqJehlBwpySxsQWBmPTYNdAO3YG7Qd+1C0qrOqk/Y2kVw/Ot7ApHGon0m0G21V5bHoQCNAAK5LPYBB1mOowMq3ewXpPjvY4EhgzDHbqGZmiJMsfJJnHQW35pK+5txOQiJWIKHyER7KjPVQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luLgGnIx; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b54abd46747so1568772a12.0
        for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 16:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758237792; x=1758842592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cywbwc8EdUxJw4qdKc7+s9IRWS7iBCfFJYQJGElQO3Y=;
        b=luLgGnIxBnTH88GFo1W5xRfvjAKInbTT3pyBUnJIazeftoQ+vDUmf1/L1SWp6n+SMC
         bLgC/RsR6L93kaeQEtdHnc+ih5oOGJtVut7TkVlm0yzw2WcIAPJQYJamSfGGXqbAfLB1
         KmcM9XFuj9dL2C/WxiD0mkUFMdMVWk3zH8v2sO0wcVK9Bpbrqx/vBJCFUitI0XjVqYrN
         ZrFbM6PxJ+G5rF/IxbidbCEZDFLvEE+OgH/LThX2tmb6FLZ8LTIni49U/P8C2fxauMQP
         QIWHkK/PVtGEJeI331xdvwUhiBkqhb82KnchApAR/Q9SKefYbmUX0L/d+ZDXZLXs/Lvt
         bH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758237792; x=1758842592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cywbwc8EdUxJw4qdKc7+s9IRWS7iBCfFJYQJGElQO3Y=;
        b=qg/92OVALWvux9smS+eGNXfHJGcRAPZoBh5g7Zm2SSYnz860GTbusARTWXPM876LhP
         dvoDGz/KTOfaN5hI1JsqJ1h6wYzgNEvtgCDu3s5UZpwAnVrkDVLfPm18KYL4hiS9p6te
         gHvwVhYOHI6NQPB4nRwbPWqUDrma0qfY9EDzqA3iKpMdc7NOYj10b5DJim1EwCSv8fbd
         1x2nzq/R2bIGaSnj3Goi2RWA6IaHM0cyQlMa9MyvAayj2A1fC3e65XKS0lgtKmgy0dPS
         0jgjiDvl63TuX5pI8lD3U4ifQ+SU6Tc78wL13YtAOMYN5CZrRaPEsL/+1nvxfAxVde0Q
         8CUg==
X-Forwarded-Encrypted: i=1; AJvYcCVKpO7AlDsRDFdQFICjp56HYqeu8wmWUiCXiPo0yxtwJSqXni8wz/Qhe6y46NZVUJuqaxprottTib73fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJMDAB2GMqiZBFQ6VnB+VXpFlGwhmT8RN0hGSuCL4VZJirp74j
	7/hnZxrjc/X+l/mohUHzQ8cSdl+8fuPF5Crvb/HnhMipBDQqTTfz+zV9
X-Gm-Gg: ASbGncuHE5G8biA+BfewHH+X1POqt0WZtYxG4U4cUYFGiqidK663Z8oeWxrHHwwEkAj
	iUCPIOev8UmAOgB0xwgrm0yEBQ/6AEgOEgJ4ge2IenoBsMxgw6V3b5lxvX6OUiiHhUY/Ixtdqn2
	TO0JlaNLWtNBueCABBS5x65CBuct3uPHnb50cBqS8xyFFjZQnaQT6XN/P/MM2XM8HDYnyFDnnsv
	kPo8SmcHBHi0ssHWq6tLeq95O17XXmuk+5rIlXHhHX7bXVNXW06uB8Zn3XFIjR1SJ++RSMFJLhm
	4V83CF4pn7c+kNzUBX/VMynwdOmdSb26sa/sHzrAhJaif/LACjuibernSOQ8XTfQKl7WyEwwDWM
	11cBftjd488nMv9ajDvB/lHm7bj2/OEOl7zlq7UWy
X-Google-Smtp-Source: AGHT+IGpNOwUTJg5vEerN1zVzVrhhiTJaIsAfQYpkwPbjiwSkLY7kk7Blhp0t2/ryk7iJPRhMy3cEQ==
X-Received: by 2002:a17:902:d511:b0:24c:ce43:e60b with SMTP id d9443c01a7336-269ba45c0a8mr19654615ad.18.1758237792166;
        Thu, 18 Sep 2025 16:23:12 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77e20bf07c4sm992769b3a.70.2025.09.18.16.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:23:11 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 0313E420B4E0; Fri, 19 Sep 2025 06:23:08 +0700 (WIB)
Date: Fri, 19 Sep 2025 06:23:08 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Philipp Stanner <phasta@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Philipp Stanner <pstanner@redhat.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] drm/sched: Extend and update documentation
Message-ID: <aMyUXCF-Jlu3wAjt@archie.me>
References: <20250902111209.64082-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qhp/VLK82Ka+Yy/u"
Content-Disposition: inline
In-Reply-To: <20250902111209.64082-2-phasta@kernel.org>


--Qhp/VLK82Ka+Yy/u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 01:12:10PM +0200, Philipp Stanner wrote:
> + * The GPU scheduler is shared infrastructure intended to help drivers m=
anaging
                          a shared infrastructure

> + * command submission to their hardware.
> <snipped>...
> + * Job initialization is split into two stages:
> + *   1. drm_sched_job_init() which serves for basic preparation of a job.
> + *      Drivers don't have to be mindful of this function's consequences=
 and
> + *      its effects can be reverted through drm_sched_job_cleanup().

           ".. this function's side effects and these can be .."

> + *   2. drm_sched_job_arm() which irrevokably arms a job for execution. =
This

                                     irrevocably

> + *      initializes the job's fences and the job has to be submitted with
> + *      drm_sched_entity_push_job(). Once drm_sched_job_arm() has been c=
alled,
> + *      the job structure has to be valid until the scheduler invoked
> + *      drm_sched_backend_ops.free_job().
> + *

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Qhp/VLK82Ka+Yy/u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMyUWAAKCRD2uYlJVVFO
ozP1AQC87UKQORC06R0t9sItFjRkRGzZuHrMM2C41aAjbI9oCwD9GhjvSUEkZs++
clAP/8722HiSPJona2f7L3BBaH4cGQ0=
=kNNY
-----END PGP SIGNATURE-----

--Qhp/VLK82Ka+Yy/u--

