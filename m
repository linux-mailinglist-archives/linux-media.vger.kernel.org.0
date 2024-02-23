Return-Path: <linux-media+bounces-5837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F238D861B6B
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 19:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A936E28B799
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 18:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75DA142627;
	Fri, 23 Feb 2024 18:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="GfbgSmv5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1E0141999
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708712382; cv=none; b=G73yjWg84TLBX7qDhBus/+pzxPdjtlc7FjdtrOIgz35DHCfEck8AFCjLgzRG9LJq70JCfhcJYWO45xSdAW/NlH6/+iF75jaeia97eML9TkOeWcQ/YG5WO7uccZKdf3DIZwX7RBLHG9mnZG0uArO0TFIHszr48GaoejfzuzFBDT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708712382; c=relaxed/simple;
	bh=NueZbKi+3XNb9lVy0QDU1pZD/eW6p7KRXiE3t6bPNIk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ivx9fFey/6YTf1LJzxaYmkdwTmu3kpdzXP3z3ILtUjCkC637NQTf7EE9Cf8gSK38FLgNhQY9gVfJOnuAa1lylyXEpQCBX51GhVKFtgZT8GxSCl3MbZujalAKEaIhNjm3XLf7KQYMk6coRUN86nL70yw46ZivwXEGj46kR+LwZDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=GfbgSmv5; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-68f63f8d807so4226206d6.0
        for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 10:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708712380; x=1709317180; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uWYfujPC46FItwm5cSHWM3du9cBBUBnAWtWci2tVpk8=;
        b=GfbgSmv5Z9dEDlKitZaVRow254RkNdy57SkHoeHGMFP5o4t6+MMhKsSYhzxdRdNiWJ
         68v5Vqs1i+GAgMVnN0tIBrNpE68kaArkKng9zDIZGulezee9J69vKuMGgbh0lHogrGwW
         e4tOAhgfHZous/Lup4wzXYQv+iCtUpnL9AafuC+2YenVG1AmG51EwLN05xvPlF2dox5D
         9EZLUiNBTTsVTOAiid5CaWUWXqCS3F9gTMQSZFEmJV852y2HgkNcjT1i0wJK0nyikT8L
         H0MnBMyAQIAsGcZfyaWX4qiyl8SB5z46KSyxlWo1iucT/3q6FmVuZmMxNspwtLk3y6pj
         2X7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708712380; x=1709317180;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWYfujPC46FItwm5cSHWM3du9cBBUBnAWtWci2tVpk8=;
        b=pkKOSQN+P4fN8C9TMGDBkXCz87AGjZe9raAVi9blHiEEbw/mDD+Tk0Sykdkf9c/h5e
         juHkc28VZdCkfeb16tPNRC2Nquz3JZD4vhXDbSVUzZznbokQ/9+Obs5pfglOALOksfUy
         ocpn3PH+1A+Pka8Id2kmlXHmsGHusgqk4L8JRTkklgg54b1tHgFgqE4N6hoeVM6M5XAT
         yj7MFNUIxKT0iUM68StFbjxtgcWfFiORlKiIcMCjJ47NBO/scDY6MgSTlIYqnDw6fNa4
         Lf4qvvJdqwlADyWjq/gsU0zJfvee5eRsQ4AZX1+tFM+dTO92h0El/2/irob7L1m3kkBi
         vxQA==
X-Forwarded-Encrypted: i=1; AJvYcCVkLY1oS6snvFeJaoVojqVoaYzDhiRwLfFD8IprM1fRC2mKqmUWmRPOxHC8ZsTtlS834iACKYZqOGEhscZT57RWwxA5bxCKX8BxxW0=
X-Gm-Message-State: AOJu0Yzq5UUdJ7UZLkmEiKY+LMlm+g5UatFfbhHXD7Md9HAgJErq9gue
	8Ej19S5BbT4oHiteqI1gahN77dPMiq6buCVOZYCzVKrnI6i1OuMxG/zKit2DuaU=
X-Google-Smtp-Source: AGHT+IHI3tXKotFLxywdOx7xwLm9TNbvcNN/Mw8gARQZh1bWiK1A+QN0veP3arEmrlOU7tnkEpCbbA==
X-Received: by 2002:a0c:f011:0:b0:68f:2ebf:851d with SMTP id z17-20020a0cf011000000b0068f2ebf851dmr590566qvk.1.1708712379784;
        Fri, 23 Feb 2024 10:19:39 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id nf10-20020a0562143b8a00b0068fb6fb217csm2829241qvb.122.2024.02.23.10.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 10:19:39 -0800 (PST)
Message-ID: <f88a238f96215aef5a05d9d532c199eaea82883e.camel@ndufresne.ca>
Subject: Re: [PATCH 1/5] media: chips-media: wave5: Convert to platform
 remove callback returning void
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee
	 <jackson.lee@chipsnmedia.com>, linux-media@vger.kernel.org, 
	kernel@pengutronix.de
Date: Fri, 23 Feb 2024 13:19:38 -0500
In-Reply-To: <dfcaf3d23ea35655d8b3a9254ee00f40c20c95c4.1708692946.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
	 <dfcaf3d23ea35655d8b3a9254ee00f40c20c95c4.1708692946.git.u.kleine-koenig@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvkoOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+gozpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhmtHYWTDxBOP5peztyc2PqeKsLsLWzAr7RDTmljb2xhcyBEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCgzYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udWs+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWA
 gMBAh4BAheAAAoJEHFTAi2sBqgcQX8An2By6LDEeMxi4B9hUbpvRnzaaeNqA J9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypwCfWKc9DorA9f5pyYlD5pQo6SgSoiC0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPohiBBMRAgAiBQJVwNwgAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHCZ4AJ0QwU6/G4c7h9CkMBT9ZxGLX4KSnQCgq0P7CX7hv/M7HeyfMFZe8t3vAEW0RE5pY29sYXMgRHVmcmVzbmUgKEIuIFNjLiBJbmZvcm1hdGlxdWUpIDxuaWNvbGFzZEBibHVlc3RyZWFrdGVjaC5jb20+iGAEExECACAFAkZjGzoCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHBl7AJ0d2lrzshMmJaik/EaDEakzEwqgxQCg0JVZMZm9gRfEou1FvinuZxwf/mu0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr+E7ItOqZEHAs+xabBgknYZIFPW5Ag0ERRA3UhAIAJ0rxl2HsVg/nSOAUt7U/T/W+RKzVAlD9orCB0pRVvyWNxSr8MHcH
 mWCxykLuB34ouM4GuDVRKfGnqLzJRBfjs7Ax9K2FI3Odund9xpviLCt1jFC0K XL04RebrFT7xjDfocDaSLFvgxMVs/Jr2/ckKPId1oKvgYgt/o+MzUabKyFB8wIvq4GMtj3LoBKLCie2nCaSt7uVUt6q2t5bNWrd3lO6/mWn7YMc5Hsn33H9pS0+9szw6m3dG08eMKNueDlt72QxiYl2rhjzkT4ltKEkFgYBdyrtIj1UO6eX+YXb4E1rCMJrdjBSgqDPK1sWHC7gliy+izr+XTHuFwlfy8gBpsAAwUIAJJNus64gri4HAL632eqVpza83EphX1IuHzLi1LlMnQ9Tm7XKag46NhmJbOByMG33LwBsBdLjjHQSVkYZFWUifq+NWSFC/kqlb72vW8rBAv64+i3QdfxK9FWbweiRsPpvuHjJQuecbPDJpubLaxKbu2aqLCN5LuHXvdQr6KiXwabT+OJ9AJAqHG7q4IEzg4RNUVn9AS6L8bxqMSocjqpWNBCY2efCVd/c6k4Acv6jXu+wDAZEbWXK+71uaUHExhigBYBpiHGrobe32YlTVE/XEIzKKywhm/Hkn5YKWzumLte6xiD9JhKabmD7uqIvLt2twUpz4BdPzj0dvGlSmvFcaaISQQYEQIACQUCRRA3UgIbDAAKCRBxUwItrAaoHJLyAKDeS3AFowM3f1Y3OFU6XRCTKK2ZhwCfT/7P9WDjkkmiq5AfeOiwVlpuHtM=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

maybe its already been discussed but ...

Le vendredi 23 f=C3=A9vrier 2024 =C3=A0 13:59 +0100, Uwe Kleine-K=C3=B6nig =
a =C3=A9crit=C2=A0:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/media/platform/chips-media/wave5/wave5-vpu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drive=
rs/media/platform/chips-media/wave5/wave5-vpu.c
> index 0d90b5820bef..1b3df5b04249 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -250,7 +250,7 @@ static int wave5_vpu_probe(struct platform_device *pd=
ev)
>  	return ret;
>  }
> =20
> -static int wave5_vpu_remove(struct platform_device *pdev)
> +static void wave5_vpu_remove(struct platform_device *pdev)
>  {
>  	struct vpu_device *dev =3D dev_get_drvdata(&pdev->dev);
> =20
> @@ -262,8 +262,6 @@ static int wave5_vpu_remove(struct platform_device *p=
dev)
>  	v4l2_device_unregister(&dev->v4l2_dev);
>  	wave5_vdi_release(&pdev->dev);
>  	ida_destroy(&dev->inst_ida);
> -
> -	return 0;
>  }
> =20
>  static const struct wave5_match_data ti_wave521c_data =3D {
> @@ -283,7 +281,7 @@ static struct platform_driver wave5_vpu_driver =3D {
>  		.of_match_table =3D of_match_ptr(wave5_dt_ids),
>  		},
>  	.probe =3D wave5_vpu_probe,
> -	.remove =3D wave5_vpu_remove,
> +	.remove_new =3D wave5_vpu_remove,

What if we have another screw up ? remove_new_new ? Why not just remove the=
 int
across the tree instead ? Or perhaps its a two step plane ?

Nicolas

>  };
> =20
>  module_platform_driver(wave5_vpu_driver);


