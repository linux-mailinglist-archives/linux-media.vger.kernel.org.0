Return-Path: <linux-media+bounces-30067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF17A86818
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 23:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A5161BA2675
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 21:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C1C298CB7;
	Fri, 11 Apr 2025 21:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="zrdDUvV6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77B42900B5
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 21:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744406428; cv=none; b=EBXPUct9+zXocQkkYuJDLVWVQhS5+vx/c8KyJNwDItyYGzqhrw2I9EK7aqBzbaEdPMuNXqFNlnsQJymP+dvpEYT4VeoaEQIF9pUMoGh5pleNcSVrzaGBGwdudrW2u/x3Faol1s8KYxUCVvXLuiZQNDhuQwYdw8VIhWGHORacUVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744406428; c=relaxed/simple;
	bh=xY+wD6CO4eg5fwLky4y4pK2q67D5hmJszuWK00qHcU4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eP2Svc7FBG7DPWvaYQAUANs4r2Wl9B6MI4U5qAdi9l8kweF6/gvxP3tQinA8NC5OrUMwVIah1WDHbSBhH0HX2O7kdg96d6j6LSNuJ0SLztlCKPSVW3W5YnhPR66xwrM3zFrZ68s0Uhil9vA2/jV4RZafIhf/xJ+27mzigxKu53g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=zrdDUvV6; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-476805acddaso22693301cf.1
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744406425; x=1745011225; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ge+rtuaS1cQA+648boIc+VUK9JNEhk10mNpI44BbfJU=;
        b=zrdDUvV6uES9aL6dFz76fdnIGB8omqvqXv1eL8QNxbq4BLYihsY209GYsfjjmHmFOF
         DJClEd9X5H3tIcn3EeyAAWkMdZ52gVKX8oa8nc6peRI61bu5Ln5HkY+hn4j8olFFXqLN
         DgvmDsGKDsZUOX1s9TczZmHcz72EJIQmdrCZPV+hQeibp4ZY4auD273jYZIg6Zyd+ZB7
         Meit7I8nM8jKBBFh1XUdU3GS6ylJaiD6ZCpVlhlwxTjRaRr70Yt+DB8pwgOF9QdvzrpS
         1mkvanyd9TLpvFZ5jqe21Aw+PVvwqB2WW9KvmXHoajSpWI44YvYK8yXZJXCYwSThsxm7
         KJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744406425; x=1745011225;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ge+rtuaS1cQA+648boIc+VUK9JNEhk10mNpI44BbfJU=;
        b=aSYKQcJW7AaEpTIeFmJKuI7/66z4Wd012x6+vGIZigA7eFFlHHc4laWr/ppuMwtJix
         9/FlaQ07wnfaxakxtFK/SuTKa376xnTGH+dqTWp5Oybax12ZZWqm95ELgr30TqThuYmq
         A70KHKBtSweMq2vlA15Cc791rUUPpN9fRIb1svA293qFYmSNnPL+viWHtJes5xuz0zxI
         Wp7lumMFACFjkeP4iu3EtSDSbXpY4Y2dcmHcQapkQ1d24tt2XAEVVx7DkCisFjoAIHc3
         BRvqIY6iD3tMcXJdSJUZ5Z3LGeOC1Vi1IaQPRaV6cZKF3jbPN8InhlblCZCLGFPXRznT
         A7Lw==
X-Gm-Message-State: AOJu0YwMfqkwtw+9rFGAw01M/vkhrpw1kMKyTSX74VHLBVllk+0Qo6FP
	eYO5RBEnzDsvkZS62gGs5/yQQiiMnnDd3t3HSnYEYhGorpSO1oTyucYQFMTrNjM=
X-Gm-Gg: ASbGncve4VkgYHQSw+9o1l7YK44MtlbK5+gKK9NUqODJksEGPM3hk2GhKnJnK8Zj5Ee
	1JL6ryrgdoPfjGsP8kYSXLlDz3jKWEkngieH9JaBT3ibrDZy4Sm+BZlBhCjYfy//hvz0wJ53rXS
	OjEtPEVOSJjGyI0fDMbPZeiqnEUxxdkKooFlbTPdAwQ5Qp+su4PWXPa85A2DpPceOnaHtd5xUVQ
	EqPGDzhmog5I1QDzaRgQ3XV8Sayu7zGy94kZEq9pMw6/8VruUFO5UQ+NNXm5YTET96AqDkeiQiL
	gdX+Sv2p7xEocLS4Tk5o/2zx/4q4EsVo4xCzumvk72o8KNCp6TEoJjV6
X-Google-Smtp-Source: AGHT+IHvEH6g/qKPaYgXBQz5kFODetJuSxc3G6R2N7Mk7f8qqORX7DJ6Hc3IMRNzP+iZh+U5f4IesQ==
X-Received: by 2002:a05:622a:13cf:b0:476:6b20:2cea with SMTP id d75a77b69052e-479775ccd29mr67429391cf.39.1744406425522;
        Fri, 11 Apr 2025 14:20:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895181csm312986285a.32.2025.04.11.14.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 14:20:24 -0700 (PDT)
Message-ID: <77ed36f63ec02156d480efebafb80f3af3ea50f0.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: fix potential NULL deref in
 vpu_core_parse_dt()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Chenyuan Yang <chenyuan0y@gmail.com>, ming.qian@nxp.com,
 eagle.zhou@nxp.com, 	mchehab@kernel.org, shijie.qin@nxp.com,
 hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Apr 2025 17:20:23 -0400
In-Reply-To: <20250411184356.2910366-1-chenyuan0y@gmail.com>
References: <20250411184356.2910366-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 11 avril 2025 =C3=A0 13:43 -0500, Chenyuan Yang a =C3=A9crit=C2=
=A0:
> The result of memremap() may be NULL on failure, leading to a null
> dereference in the subsequent memset(). Add explicit checks after
> each memremap() call: if the firmware region fails to map, return
> immediately; if the RPC region fails, unmap the firmware window before
> returning.

Its hard to believe that its a coincidence that someone else sent a
patch for this. A colleague, the same person ?

I do prefer this version though, the commits message is better, the
code is nicer. If its you, adding a [PATCH v2], or just adding a
comment that its a better version would be nice.

>=20
> This is similar to the commit 966d47e1f27c
> ("efi: fix potential NULL deref in efi_mem_reserve_persistent").
>=20
> This is found by our static analysis tool KNighter.
>=20
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
> ---
> =C2=A0drivers/media/platform/amphion/vpu_core.c | 11 +++++++++++
> =C2=A01 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/pl=
atform/amphion/vpu_core.c
> index 8df85c14ab3f..26568987586d 100644
> --- a/drivers/media/platform/amphion/vpu_core.c
> +++ b/drivers/media/platform/amphion/vpu_core.c
> @@ -586,7 +586,18 @@ static int vpu_core_parse_dt(struct vpu_core *core, =
struct device_node *np)
> =C2=A0	}
> =C2=A0
> =C2=A0	core->fw.virt =3D memremap(core->fw.phys, core->fw.length, MEMREMA=
P_WC);
> +	if (!core->fw.virt) {
> +		dev_err(core->dev, "failed to remap fw region\n");
> +		of_node_put(node);

nit: node and res are no longer used passed line 579. Meaning you could
unref the node earlier, and remove the repeated of_node_put(node) call
in the error conditions.

> +		return -ENOMEM;
> +	}
> =C2=A0	core->rpc.virt =3D memremap(core->rpc.phys, core->rpc.length, MEMR=
EMAP_WC);

I really enjoy blank lines after closing scope, even though its not a
strict coding standard.

> +	if (!core->rpc.virt) {
> +		dev_err(core->dev, "failed to remap rpc region\n");
> +		memunmap(core->fw.virt);

Its interesting that you thought of cleaning that up here, since its
not being cleanup in the error case of "if (ret !=3D
VPU_CORE_MEMORY_UNCACHED)".  And its also not being cleanup if the
probe fails later for other reasons. Perhaps your chance to add more
fixes to this driver.

> +		of_node_put(node);
> +		return -ENOMEM;
> +	}
> =C2=A0	memset(core->rpc.virt, 0, core->rpc.length);

Same, I like blank lines (but you are free to ignore me if Ming does
not care).

> =C2=A0
> =C2=A0	ret =3D vpu_iface_check_memory_region(core, core->rpc.phys, core->=
rpc.length);

regards,
Nicolas

