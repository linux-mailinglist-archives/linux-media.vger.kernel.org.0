Return-Path: <linux-media+bounces-4885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC7684F908
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 17:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFD8A1C222F8
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 16:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0248676042;
	Fri,  9 Feb 2024 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="K50IkJ9Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1CC692FC
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707494405; cv=none; b=miIy9wVHDE+jxgvfKbuW/HzJbCotRkyxd//97my3VEsDnow6JxyRXTetHSlzLTUuD9k/uj6cCMHXU2eN8h4g0pg0GOkUv+m5wZA483gfMZeCo1FCiyh7EUpzDqkRyupzk+sSJykjR2463QSSsMnj53NLTu0rIZ/B4G6GqO8mSiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707494405; c=relaxed/simple;
	bh=2SBJPiTLnbEHUI5m65Y/6BDu7rOP0rBKxDSCO7KzNr8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BaY4LrdiS9Cg1IA/Z61oc6tKNCYTBfmQHGOXGDncI/7vXTPAdsj83+vbmc1L3GkQT88opCnQNqzwKtDkU3MODcAs7YJq0uc+jvpEadlJR8/iqarHXVi/VU9ynOBh2d7qHv4qB+Jja9haMuOHi3cngwFf4fxAWUjERd/wdxF7iqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=K50IkJ9Z; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bb9b28acb4so706815b6e.2
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 08:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1707494403; x=1708099203; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zr4ep/ShpQOSYr1PD+V76XxorkZxFtNCCUQAZSlxDsg=;
        b=K50IkJ9Z2HYkKkoiTS7XDq9Lo64Lycf8q9WOCpD6UBmpMezD6qK95UswL12PRnWLXg
         ZWImzU+uiC8Ahb3TapyU3QjDasJSr4f6S7rr6F6LozCaMDtK7r/GX3PakbgITNtozwjH
         ZW/nTBmVWRxlbUcRtHQ18HIcHll2jhCVQ58C58l0mgUrTClGnBpAlqI5c4Q5z5EaE6LJ
         9kmRqlg/eXzyf2YmokAuOt1I6cyJ7KN6X7s6kI9yAIvMbzXm42RPSo5YT5CqL+YurMmM
         F9Hsb0xQ7cQiV7n9qiKooKvbCwtwyNSWJTE51YW71Xi+M0VqDbtx9vc6/XBLq1rxZd3P
         bYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707494403; x=1708099203;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zr4ep/ShpQOSYr1PD+V76XxorkZxFtNCCUQAZSlxDsg=;
        b=r/SV19KjLcYRjHM9PeLwflp1h33wiQNFHOsufvJxbJ8A8fH5iXSybPV2FgC3UB+GBJ
         wmlSQmqkuybGiAADyvAq/uH27mVZe1m2nXapdaRELLzXWq692L3rfYNHn00//ANU+a35
         xd8SsxepJQnnknB7poj0Ywat5f34Ka9lVg4a+d6zMWyWgSaSCIRm/ThiPEzQCQgFTfyX
         brW2p41YGioN3tvbWxRtGyyh70tPurczNIaOZtvy1vBq6jfkSro1BmppTGhHGADVcY2e
         vSYQr2h7r5R9vyYdQppdIbIduAaDJkDv2kPG/Y3Hsp4fsM+Q6WwH1bbsLfLa3HUKnd7B
         q8Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWeQauj1X/MBdeN8lf0alwiCPL1YXVMZeg/n1FCG8UnXJVNis3VrEDvsn/F+paTm8+aYYNIRJ6CcJvQ3M3XoZkzZflWaCBvQhX2gNk=
X-Gm-Message-State: AOJu0YznN0GgtWCZlL7exW7QX4+kUcSAPp3YChet6IRH/f2bACULNiWJ
	0c+O8PiJBf+zvbSGAZybSVABxcq0pCkwSKBFGr4Bv0Tvp8+gCGkyQung8UAAInw=
X-Google-Smtp-Source: AGHT+IEBQbO3ENPggpjU1OyP0OxQLSq+2qklUyEEaS0Y5ILOimVipgFByiyG6hH2Gm9+Kh+VRyo6BQ==
X-Received: by 2002:a05:6808:140e:b0:3bf:e3b9:b10a with SMTP id w14-20020a056808140e00b003bfe3b9b10amr2208965oiv.47.1707494402764;
        Fri, 09 Feb 2024 08:00:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWB/s8wqYk/KT8aTh7aIdfJSSKUp7Q1eJMItAVagEvdNNsie1sOht/ygXJv7lV716XaXKg/tl7kr9+0fybeToJCT4U7nAT0nqJELRw=
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id a29-20020a05620a439d00b00785bdb8500dsm271147qkp.62.2024.02.09.08.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 08:00:01 -0800 (PST)
Message-ID: <eb14eb2b5ad267e8cc7c1a440712eb8e69fd1384.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: atomisp: don't use sizeof(NULL)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Date: Fri, 09 Feb 2024 10:59:58 -0500
In-Reply-To: <d33c9271ed30997eb1774d1a6af997f538ecd888.1706865681.git.hverkuil-cisco@xs4all.nl>
References: <cover.1706865681.git.hverkuil-cisco@xs4all.nl>
	 <d33c9271ed30997eb1774d1a6af997f538ecd888.1706865681.git.hverkuil-cisco@xs4all.nl>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvkoOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+gozpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhmtHYWTDxBOP5peztyc2PqeKsLsLWzAr7RDTmljb2xhcyBEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCgzYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udWs+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWA
 gMBAh4BAheAAAoJEHFTAi2sBqgcQX8An2By6LDEeMxi4B9hUbpvRnzaaeNqA J9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypwCfWKc9DorA9f5pyYlD5pQo6SgSoiC0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPohiBBMRAgAiBQJVwNwgAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHCZ4AJ0QwU6/G4c7h9CkMBT9ZxGLX4KSnQCgq0P7CX7hv/M7HeyfMFZe8t3vAEW0RE5pY29sYXMgRHVmcmVzbmUgKEIuIFNjLiBJbmZvcm1hdGlxdWUpIDxuaWNvbGFzZEBibHVlc3RyZWFrdGVjaC5jb20+iGAEExECACAFAkZjGzoCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHBl7AJ0d2lrzshMmJaik/EaDEakzEwqgxQCg0JVZMZm9gRfEou1FvinuZxwf/mu0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr+E7ItOqZEHAs+xabBgknYZIFPW5Ag0ERRA3UhAIAJ0rxl2HsVg/nSOAUt7U/T/W+RKzVAlD9orCB0pRVvyWNxSr8MHcH
 mWCxykLuB34ouM4GuDVRKfGnqLzJRBfjs7Ax9K2FI3Odund9xpviLCt1jFC0K XL04RebrFT7xjDfocDaSLFvgxMVs/Jr2/ckKPId1oKvgYgt/o+MzUabKyFB8wIvq4GMtj3LoBKLCie2nCaSt7uVUt6q2t5bNWrd3lO6/mWn7YMc5Hsn33H9pS0+9szw6m3dG08eMKNueDlt72QxiYl2rhjzkT4ltKEkFgYBdyrtIj1UO6eX+YXb4E1rCMJrdjBSgqDPK1sWHC7gliy+izr+XTHuFwlfy8gBpsAAwUIAJJNus64gri4HAL632eqVpza83EphX1IuHzLi1LlMnQ9Tm7XKag46NhmJbOByMG33LwBsBdLjjHQSVkYZFWUifq+NWSFC/kqlb72vW8rBAv64+i3QdfxK9FWbweiRsPpvuHjJQuecbPDJpubLaxKbu2aqLCN5LuHXvdQr6KiXwabT+OJ9AJAqHG7q4IEzg4RNUVn9AS6L8bxqMSocjqpWNBCY2efCVd/c6k4Acv6jXu+wDAZEbWXK+71uaUHExhigBYBpiHGrobe32YlTVE/XEIzKKywhm/Hkn5YKWzumLte6xiD9JhKabmD7uqIvLt2twUpz4BdPzj0dvGlSmvFcaaISQQYEQIACQUCRRA3UgIbDAAKCRBxUwItrAaoHJLyAKDeS3AFowM3f1Y3OFU6XRCTKK2ZhwCfT/7P9WDjkkmiq5AfeOiwVlpuHtM=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 02 f=C3=A9vrier 2024 =C3=A0 10:21 +0100, Hans Verkuil a =C3=A9c=
rit=C2=A0:
> Check the size of another pointer instead of NULL. This fixes this
> smatch warning:
>=20
> drivers/staging/media/atomisp/pci/sh_css.c:3609 ia_css_pipe_enqueue_buffe=
r() warn: sizeof(NUMBER)?
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging=
/media/atomisp/pci/sh_css.c
> index 1d1fbda75da1..0d2ef96fabce 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -3606,7 +3606,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe=
,
> =20
>  	assert(pipeline || pipe_id =3D=3D IA_CSS_PIPE_ID_COPY);
> =20
> -	assert(sizeof(NULL) <=3D sizeof(ddr_buffer.kernel_ptr));
> +	assert(sizeof(pipe) <=3D sizeof(ddr_buffer.kernel_ptr));

have you considered using a static_assert() instead ? There is no run-time =
value
involved. Also, I personally think this case would be more readable if you =
used
"sizeof(void*)", even though un-commonly used in Linux.

With or without any changes:
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

>  	ddr_buffer.kernel_ptr =3D HOST_ADDRESS(NULL);
>  	ddr_buffer.cookie_ptr =3D buffer->driver_cookie;
>  	ddr_buffer.timing_data =3D buffer->timing_data;


