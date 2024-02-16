Return-Path: <linux-media+bounces-5306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7CE8585CA
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 19:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 456D62890FC
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 18:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8405C135A44;
	Fri, 16 Feb 2024 18:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="nBZoFDGN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450611353F0
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 18:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708109496; cv=none; b=B7OkdeIisiVZyW8hlW0PBipN1DD39ZAGYoYi9f5dZGTTjtCoboPmg/y/aqfc8YUmRSL+nWzKTf8ksDnSqVW8bPN7tbSi0C3qHQ6NnTQpUj38PGl8zc6+NCJdYwFsJ40E+QZK/+6ttnnRk4t3lEx8mWQK7dOZ75nNtGA5Y2plN3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708109496; c=relaxed/simple;
	bh=W/b5bbABKz79xZXU+epksZPjBorx/kdtQ4bqersfPQU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fd7PwkRnaD4miF1oEBPH8R32GHMzyOLVL/LgUoIcCR627lzcjgUUKTzdkZBHrpV8ZVd4G5O9pfn6JJGZ8xE4DIxKpLmClhsdCHRewpsDZXYOtJ7f2ShyWWRepCFS+NtVOLOvAt0ncGekq5PQr1BvoI6R2K8V9w7FRzI/wz71F4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=nBZoFDGN; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-68009cb4669so11006286d6.1
        for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 10:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708109494; x=1708714294; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yJXAWTaFF9uXvOf/kvT65ZY3tmlJVTyrCsu5Mk/WAvU=;
        b=nBZoFDGNZz4PwvsLUlhZUgE8Jt3u3lCeQrKDQmRIbJkRpd82huXjwT7PYI33ZA78Pe
         ZrKIN/835Y7wQDU7WZrxuM0BR2vznGU7c9eAy0icwPheEF1xEzp/LygXFloaVNLHxzhG
         CidKQkCxNSUAWb/erzdwbrvug1COnFwCvk3vwQvK2qYkg1cagUnO6AdcxYS3s4E1mwIE
         sg70u722zzLe7FCKXz340a0hoV/7rTlQfZR+nLU6UzqA2xj3CF/6FnGm3iz4LCDxsBZ8
         077+eItDF7J1AhXsFoYZek3bdjjrlRHM4DQGdSbSYziVfYMKJltmL8rx61/kUjNLYJ9m
         KKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708109494; x=1708714294;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJXAWTaFF9uXvOf/kvT65ZY3tmlJVTyrCsu5Mk/WAvU=;
        b=YAs8JcH1nI/GtgeZsRwQn0wsqpQ+JLkl0a0RYGa4005smXABF0zGnAkR+I7kLYmcU3
         1O4GJBczpQOArDQ5p1EMbdiocz1INccVQtiq9ko/Myg8Uj3z39yctMufNC1472rgHD64
         J51KsTrqF6fNpzbP7dBHeBTXDW1tjkNU5rUX75qhUJAwIjS4xlzFKCGf8Sc49KQ7gAnS
         2o1Q2hVJch2wdqGZdpluiovOMdn76QluV0lSqrBCZnMKJK+rW61WXPO/dujmHp8wBTM8
         QI746JmVItpGClKJJIDHJxhwDnBX7tw7NHuJjcJjaOlb3V0Aq9dfGjbEUehWmyMF+TEg
         w/cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz9zG3lC/4vzWCBfk7c05oT0JChB6VC0p/Cypw3QIEboF3KCd30O8VED5oE2GGY5GhoPTB+MzLKJdcOMcchiHbCQ9ZLOqa0bBvsw0=
X-Gm-Message-State: AOJu0YzQGUGr3XpTgRyfR3p6kxT/RlUeGlmtBjdlzKv/W+p/XRNHHKYv
	qjOSVRfDZIB9dDWKvOXKnsAsgIztqyyn/lZ/akjj3XPz8CFS0QT+4ASCUxtGLdU=
X-Google-Smtp-Source: AGHT+IF2l2KObMJDyh64wfZZvs6qbBnTPVlf8mdhwZ8NToSMz7Jt1XOTlHhrPjU2Am3rXxkevztHMw==
X-Received: by 2002:a05:6214:4884:b0:68c:5a42:41a3 with SMTP id pc4-20020a056214488400b0068c5a4241a3mr8259751qvb.34.1708109494126;
        Fri, 16 Feb 2024 10:51:34 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id nf7-20020a0562143b8700b0068cdc0a0d42sm178010qvb.25.2024.02.16.10.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 10:51:33 -0800 (PST)
Message-ID: <f1c4efc4d8d2b01a50f3ab23e2c5767de111f4a8.camel@ndufresne.ca>
Subject: Re: [PATCH] drivers: wave5: Remove unnecessary semicolons
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Thorsten Blum <thorsten.blum@toblux.com>, Nas Chung
	 <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
  linux-kernel@vger.kernel.org
Date: Fri, 16 Feb 2024 13:51:33 -0500
In-Reply-To: <20240213140441.8640-1-thorsten.blum@toblux.com>
References: <20240213140441.8640-1-thorsten.blum@toblux.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
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

Le mardi 13 f=C3=A9vrier 2024 =C3=A0 15:04 +0100, Thorsten Blum a =C3=A9cri=
t=C2=A0:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
>=20
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

Thanks for the fix.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/chips-media/wave5/wave5-hw.c      | 2 +-
>  drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/driver=
s/media/platform/chips-media/wave5/wave5-hw.c
> index f1e022fb148e..2d82791f575e 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> @@ -2315,7 +2315,7 @@ static bool wave5_vpu_enc_check_common_param_valid(=
struct vpu_instance *inst,
>  				param->intra_refresh_mode);
>  			return false;
>  		}
> -	};
> +	}
>  	return true;
> =20
>  invalid_refresh_argument:
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index f29cfa3af94a..8bbf9d10b467 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -92,7 +92,7 @@ static int switch_state(struct vpu_instance *inst, enum=
 vpu_instance_state state
>  		break;
>  	case VPU_INST_STATE_STOP:
>  		break;
> -	};
> +	}
> =20
>  	dev_dbg(inst->dev->dev, "Switch state from %s to %s.\n",
>  		state_to_str(inst->state), state_to_str(state));


