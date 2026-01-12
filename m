Return-Path: <linux-media+bounces-50403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E504BD119A2
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE671303F98C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB392749CF;
	Mon, 12 Jan 2026 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eqEpttXH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB0D23EAB8
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211163; cv=none; b=KVsM/NYkvQPmdiGs47RbU2vWktq5Q68sn5YL78XxLPveP5xXOU+DfVMObjukF3lkIhWZjQdvHQTWXV3LXZf2VHcnW80oHNW+kSnACcfXbt2JpMbsLSdZ3fjs+g5OSn0mxIIBfcEeNDSRJTKUQ1og9++e5ZB7fGTWIiKVhqJY0Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211163; c=relaxed/simple;
	bh=9V+VVaj+bGLnbM2RulnGJrKDbVELuwC2svUsc4uWByA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnuUZBgbu5Qd9lGszzfXmNs78m+Y+QWAmTrlQdYnDKiPV+GZXvJpV4vuA1vGttVckzoLe+JPh8f9Z9PoT/7CHUaB2OBHxS5qvIo5LHyouN1Y4p2PJa8Hfkw9HzvyWORlrDh8NG2YwVm4zd6yA6yJLRno+E1C36w9WmvBGkspO6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eqEpttXH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b7c2614f7so3112985e87.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 01:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768211158; x=1768815958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li7aaEiSucGy1WFJ2i4TsKygWXcubANv24+uQbLqsKs=;
        b=eqEpttXHILNBnZy0YJiIMwi7mNWHKXDxYP8z/IDmJtvWLcg+7jPcmDLniOgs0v5fjA
         CVFnFJ7p/4OP/HtrvenmL9cN2vVxFi5DcViv2TuL0kFUKpVJlYCHYxoZv1noCGeahmXi
         UPo+BsMnPRyY/ZhYE64LRquqstJsdVr6b540QvIGh/4OEhcZhD7LlQoJQymPGVCd9Nvz
         gt8UNu+FdQNK8d90WYseeKX24ZooKkQAv3bbP6qP2y2VfE+5/jnnAN8dFR4SJ67eYe/F
         eReDgtwEp0luRXd0vW8o+jSmXMkLpUluAxPy+hDVavdVgbQ7FvTVXSjnlRoxlZV3mHmM
         ZRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768211158; x=1768815958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=li7aaEiSucGy1WFJ2i4TsKygWXcubANv24+uQbLqsKs=;
        b=BTjILn1oV0OohVbiSCqdyj5GOsKM8JPFdCdg8TAKInsJ7ISR5+0enHzFGS8vNP3zoH
         07/pQt3dr6NgIb1YzEMVdEGgBFeIxzUlOxyXrMpd3P2+QM9asQCKI7GxsG/zFQOa3sgl
         dwOPb3SLi80Karj5r0RiqilpHQO65zFoaJ+oIxbBgbYDK6AjY6iCgv/5t52Dv2xmIAd7
         0ARo/+YJBuNeHBt6Y7+WLL5usvYDCL7uFQ+BYvQR8LzZf1zCWZlOfg3cIBj9KQX6uXIN
         95sOXAqsGLsGrpp1y5OK5gOLP048L/VbS3PCujDsgyHQQUwEC6p6rlEopK4zfQ7xWqVy
         FHcg==
X-Gm-Message-State: AOJu0YyNiP4P4YRS8/llmfeg6U6GARORd4XRsPPWkewL9nHYfQsMDhz/
	l9OOePmE6C0C0SzgTeKsltuVMxJX7+cmu9WG+FfFB4o6Lmh3NGBluE9Yd6fIs1jnplox3uEbWGk
	dXc/mFjT7oqGFlGVP5VgI6Qf0pVE9Y18cy84twk9AhGpuuiAiKx3q
X-Gm-Gg: AY/fxX4B4M1Bte7vX6CiZJYfkx45elHbpqLE8qgel5s883jM+ehqHnZeoY11T7hmyfR
	61rg8O3b06ir9oDmeAvRlvM1N2vqj8sEoIoZVKG+mmulbeioSq/FMswdAqUoKfxFpGPuiYxt8Bt
	w5Ld2tf6N+Y6afltkr3U0HiFgt5mmGhMCIxKXr7FSu4ys1cNoqKkSd8B8z0Lwwg8+EuqJjocP3F
	wla7txY1jYnjRvkupRbRUe25SDS8FewDty3VBEcL8zZ2TMgdpeotGNcUBD5Zkzsr0J4RljO5MdJ
	qYrZjFt897HrHBbyQna9n+R2EgFR
X-Google-Smtp-Source: AGHT+IEvShNYx6EnUPxFsbYpiaqSEr6I7OJ8/Vq+rDs5p5nLYxxJmOxmLlTLuSv2QaFk0zSLBVTZnmNg0bJUxw5meOI=
X-Received: by 2002:a05:6512:33c3:b0:59b:6dbc:e507 with SMTP id
 2adb3069b0e04-59b6f03e6ebmr6584272e87.47.1768211157660; Mon, 12 Jan 2026
 01:45:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <E1veKS3-000051-2C@linuxtv.org>
In-Reply-To: <E1veKS3-000051-2C@linuxtv.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 12 Jan 2026 10:45:46 +0100
X-Gm-Features: AZwV_QhZ3akLV9lcY5cfbi-4xrv2bzOTYCi_fN3iqoD75rl2BptNvHemyG8h0-c
Message-ID: <CAAofZF6xP0gY9TcbsSMa3_Yxm4feL6Ho=cDX5jdq4B91Z=9qtw@mail.gmail.com>
Subject: Re: [media.git/next] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
To: linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linuxtv-commits@linuxtv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 10:55=E2=80=AFPM <media-ci@linuxtv.org> wrote:
> [...]
> Patch committed.
>
> Thanks,
> Hans Verkuil
>
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Thank you!


--=20

Marco Crivellari

L3 Support Engineer

