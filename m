Return-Path: <linux-media+bounces-39586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E0DB2278D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 14:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC5E6425776
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 12:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856FD2727F3;
	Tue, 12 Aug 2025 12:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="cKKw9t76"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B16A26980F
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 12:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003251; cv=none; b=FSCRKqqqkymYSKlChDvpSCjr0Du7QLFvTeVJEL2vipFFBZSHqRl5yEGav/fpVMDSJ/lOGitO+CX5go+45jL9us5yaD588do4+arihUHx2dv58LUVgLDly1/LQNSTPn7xqbiok66k/j04Q2onQ1NdV3TxdIyGyRxPLw4BzIBLjuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003251; c=relaxed/simple;
	bh=kuFMJmU+9JWcojUuJvsQuwkddP22POkgDm8BHLJTRh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRbb/lWHp/FcaqeM+UZG3oSw5pAcZxiMSycLOjc+XF5zecvG8wrTYD/VDfB7BQDeQapjfQV6jvtk+Dw/mQ/29/JFHIsqxDQnIxA4MhHOjDqwHoDyoQVbC22BgahlZz209PbZK7i/D9eiTNxyDLZSgo2ov3adm8vtvrvzd0ue19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=cKKw9t76; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e806613af8so630173285a.2
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1755003248; x=1755608048; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2WtksxPDLT/0y+3eZjc8hEFOkmY30/S+XOZ4ZbmRdMw=;
        b=cKKw9t76vyDgJtFR+gCN5oEIOubX0QbmYB0n5PpLKNfKSp/bQznq4vRXQLLxZmTKTI
         YpfBqKnO2OnQMTTQuMA7+fspjwam8MHCz1DMcoq9g0Zcew3KfXGtPSx9OKdi77E0aHqR
         c3oPD6rQuf61C6etXR3yt9i2olVmC1gF7ZuFUmOQP3U76xKplICA0JdIj+35RavNwBCf
         QVLusNQiijzlX5xVqKoHt2kSKKgIOqPajRwCJlWWoG+naxhljbZihUktkeZIMn/P/s4v
         AyD2d7S8iLCjuf26NWyKxjHtZmFkWbBUk2Biw5cVWJYOZfhbZo9LcybzUmjidNiZZ/sd
         4TZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755003248; x=1755608048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WtksxPDLT/0y+3eZjc8hEFOkmY30/S+XOZ4ZbmRdMw=;
        b=G0/6KwA666mbcPJ9FIvuv9U69hD2SBVtGdWk7GH0CYrOJmGOpPXfqkgK4sGQFSGkqe
         hthDMGIKy6eASa+NknpYXQ9ewQVaQCjvUMDUMZPYiAnmH8CQs0cZMbJU+YxcmB5GX1Y5
         TRmpCH/v78khOWiH6uWt+pPpwp22hRDQ6Q9kuui4vYTeKU0c51rJYuc5SEkUf9DDqEaq
         TW6lOqlpvx+ovd2MjZXxMBlhLod7yNYdccRKMT3Mrnkl0v/VtQllmxS4K3e2HA73t2h1
         I9GNDHLwwkSMBK0nTjhNN7ohgf6/+2V9RAaxFxUruPvv9ofB8ygf/iKtYsczwxuuaXQr
         Zoyw==
X-Forwarded-Encrypted: i=1; AJvYcCWxkzerjI6+wfT5LVpSMGJy8xxipZ1ROC5w1eSKzN385bBJ7fHcLK0kXpzywvwGrAQAPKMGIUsz0K2RKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKmRysx94IRgmMjhL9AJ1dDlwICXNQkhv/SVqVpKBxk40onKnT
	DBVdMMEYlyyRUTrVHdfwrQzOR5e4Dw4IYXLhWblSM3ltEFyLvBOWW+txGIDzKMLvhrpktIasCUP
	1yelx1aMLi1a6Bjl7HrjDH9YKfAHqQrQCa0Oc2OF9bf6YfuOkGQF0QYs=
X-Gm-Gg: ASbGncselCotE4H32MEAgj8E0b/fMC0AQUZYwCrRQJDNGnbA6xbqcu0CRAYDVYMSEGb
	QrFiRrzwMxMjImp9sbeCZpK+Jvgz6y5oZvasjgdXPgioajET6uKrQ7FWdLFgaeE6xBR5JBhCU9W
	3njyL4s/RPZsajY5GsfbV+O1GC1DuDtjVXNIt24r2g/BzKB6soXk1jhV1tmuJmTZgBenR6OV1Gw
	hkzTxw/ZCZ+YY9ELDj10roTx2XCBkcBH4V/vPIUwQ==
X-Google-Smtp-Source: AGHT+IEigi3eT3slvsaqaQxfpzA5/X/BpBps7n3zcMZvnFhGp0J3xR5YD/W1WjO/6HkGh5ZjKB8p2S+Mbi6DGKsspO8=
X-Received: by 2002:a05:620a:a117:b0:7e6:50f2:d62d with SMTP id
 af79cd13be357-7e82c616e28mr2406978785a.5.1755003248102; Tue, 12 Aug 2025
 05:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org> <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
In-Reply-To: <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 12 Aug 2025 13:53:56 +0100
X-Gm-Features: Ac12FXy89rNxCKeR5zfeZeSe2T50SLXSk1IHDgjCBDBFp3HnioWFlDD6e2e-kGA
Message-ID: <CAPj87rNG8gT-Wk+rQnFMsbCBqX6pL=qZY--_5=Z4XchLNsM5Ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] accel: Add Arm Ethos-U NPU driver
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Mon, 11 Aug 2025 at 22:05, Rob Herring (Arm) <robh@kernel.org> wrote:
> +static int ethos_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
> +                                  struct drm_ethos_job *job)
> +{
> +       [...]
> +       ejob->cmd_bo = drm_gem_object_lookup(file, job->cmd_bo);
> +       cmd_info = to_ethos_bo(ejob->cmd_bo)->info;
> +       if (!ejob->cmd_bo)
> +               goto out_cleanup_job;

NULL deref here if this points to a non-command BO. Which is better
than wild DMA, but hey.

> +       for (int i = 0; i < NPU_BASEP_REGION_MAX; i++) {
> +               struct drm_gem_object *gem;
> +
> +               if (job->region_bo_handles[i] == 0)
> +                       continue;
> +
> +               /* Don't allow a region to point to the cmd BO */
> +               if (job->region_bo_handles[i] == job->cmd_bo) {
> +                       ret = -EINVAL;
> +                       goto out_cleanup_job;
> +               }

And here I suppose you want to check if the BO's info pointer is
non-NULL, i.e. disallow use of _any_ command BO instead of only
disallowing this job's own command BO.

(There's also a NULL deref if an invalid GEM handle is specified.)

Cheers,
Daniel

