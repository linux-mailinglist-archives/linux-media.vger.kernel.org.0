Return-Path: <linux-media+bounces-43535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85020BB2BE9
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 09:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16E8419C3AD4
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 07:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5ABE2D1F7B;
	Thu,  2 Oct 2025 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SmUTP5N6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976C41DD9AD
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759391686; cv=none; b=TAfLVc2Ng38hnZ3Ixn2IQTanX1eJgi/pee3V7H18nqHzs+66hzCY7t8mNEKuWmW7nuS7dcS6K1U7JZe9ku8Aho0Q8W699vh8Jutz14JmDWQAcKuE0W7MPNiDoZe1S5GeD4DWfbHCiKkBp94rK+Oc2TpEsRMtihXCFCkjRelYJ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759391686; c=relaxed/simple;
	bh=WSAv+LklGTDBmAJg9JWePc59MIDbYN30xXPqFRoxrGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhVnbe626bJsb92sWrBH+wWcN0JxYUsy8vMZ701iBH27SGW5hyrUCVMh8Efw8GzaYJnjcSxQOmSMudB7e26Xv54vGZQxLdsKU1sepiMhpgjaPS/cMDg/rgScKqPGtyA7ALTokaekYT0xAVZNz6yssdQsFe4qfGM720/Q+Op2JKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SmUTP5N6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759391683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f5NgAjs0FgUvOjNKCgOViw/s6WyhuboPXgN8L2oduk0=;
	b=SmUTP5N6n2tC2XO2a5xgoxLAO/X78ISI4HrcL0iGg3wVcJ3KGtpk3A3cjR/IJfgSZgj+m5
	u0ROPESKRQ/Mfee6vYODGlojPB+PVJy7bhmQE/HVwxf+xM3uGpZK0FaWC5LJ3z71NyQxAk
	vYlGWk3e7cNRH2RAOMUbQW1kLJzCuGw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-F1IZFMlQPFGVBL1opvMZ8g-1; Thu, 02 Oct 2025 03:54:42 -0400
X-MC-Unique: F1IZFMlQPFGVBL1opvMZ8g-1
X-Mimecast-MFC-AGG-ID: F1IZFMlQPFGVBL1opvMZ8g_1759391681
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ee12ab7f33so569419f8f.2
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 00:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759391681; x=1759996481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5NgAjs0FgUvOjNKCgOViw/s6WyhuboPXgN8L2oduk0=;
        b=emr/4CpY9LaZ5LalTT1gtvqxA3ra7/hDsTbKrfgMYvJODzXW+OAlADEtD3l4RULl9W
         V86KgWttLJKGYrVHWgCx2RixYVjBggqCQ3g1h/2Waq8vF+GuqSoFeE/efOCBlGOGnEw6
         +1UNtSGPLCoU4a7XzXWOgsgFFID7Xo4YODT2xF7SA9/pPnFO7tbr79DQStTN7N8KLHy0
         Ih5trTqbBfb8SnYWTLDDi4zvCdUkhczYf3YM1AFRBnGHAXdJLoY5/XtQSae0R07wJg5k
         lcILTc1tFs17WRaGppo7LcxVjPjLBFGJBW3V8li1Jal45FyLW5OfI60ZnvtdWwkAjPPe
         HXMA==
X-Forwarded-Encrypted: i=1; AJvYcCW7mFq4QhNDqy7tFApP3xWx3XXzdNbwxGBTcf/eDE4F9qtNXGFy3IbU1aWgK5uZveKbMKypJiMD7PYlJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8bbQNtKcAFRnHx3M4QP1c5y3CubtH/95KptXueY1tCMbKQvbi
	LqEXV3ncMoum2/nFoKtLaQ36IDewCY47gQU/1o944A1JV6jVzJbgAs49yJZMixTHkFNrzdkUZ+q
	lmtgO3t/xnofHTrvDTXfQU5qFsisAPCVfauA6saj41X1JKHJ5PdWUJyhfzeF3hZGA
X-Gm-Gg: ASbGncvISaTBwIPf/XL4UBIWCl84qMQokCf5laOuJs8d6TE2/2m2jiCUH8nHN9eWstG
	tGp57qwFU6HmtW/S07mpIhSP5isUCA8RWTZNmuAf4AZ7h7hViECCc90f7styZa/AtvApUAAQEay
	WgDicFqAUo0sQShtLTA/GZE/V4pFni5sQc4koTGxZX+DxWKAsU7hJSl3w1j66aSIqtlmN+/wP+V
	KOXjkQR2EU/cLqNSCiduAOPs1WSFNpRk0lXWYuadF1FnKsHX0y/3Rkjqd8pl+5K3dmWijkIREYA
	pIlUhbhte6SfdiUrTUA6eg==
X-Received: by 2002:a05:6000:4282:b0:40e:31a2:7efe with SMTP id ffacd0b85a97d-425577f4cb8mr4951712f8f.14.1759391680657;
        Thu, 02 Oct 2025 00:54:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKgb2wuYS24zodpwDlxRHEFq5J/MXUUrEeNEVo0zphJwnjV4MGibFNyYvpxnYvHco/UT9a7w==
X-Received: by 2002:a05:6000:4282:b0:40e:31a2:7efe with SMTP id ffacd0b85a97d-425577f4cb8mr4951692f8f.14.1759391680190;
        Thu, 02 Oct 2025 00:54:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8b0068sm2484557f8f.26.2025.10.02.00.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 00:54:39 -0700 (PDT)
Date: Thu, 2 Oct 2025 09:54:39 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
Message-ID: <20251002-sceptical-goose-of-fame-7b33d6@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-4-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ucqtnbt2ioahlqrj"
Content-Disposition: inline
In-Reply-To: <20250911135007.1275833-4-jens.wiklander@linaro.org>


--ucqtnbt2ioahlqrj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
MIME-Version: 1.0

On Thu, Sep 11, 2025 at 03:49:44PM +0200, Jens Wiklander wrote:
> +static const char *heap_id_2_name(enum tee_dma_heap_id id)
> +{
> +	switch (id) {
> +	case TEE_DMA_HEAP_SECURE_VIDEO_PLAY:
> +		return "protected,secure-video";
> +	case TEE_DMA_HEAP_TRUSTED_UI:
> +		return "protected,trusted-ui";
> +	case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
> +		return "protected,secure-video-record";
> +	default:
> +		return NULL;
> +	}
> +}

We've recently agreed on a naming guideline (even though it's not merged yet)

https://lore.kernel.org/r/20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0dfd@kernel.org

Secure and trusted should be defined I guess, because secure and
protected at least seem redundant to me.

Maxime

--ucqtnbt2ioahlqrj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN4vvgAKCRAnX84Zoj2+
dh5DAYCtjelmpXHr50Khpzx9gOlMaEclQyCYsx0ccN3NkEfrV19Dn1EcsuWOsMM8
FnSLI0wBf20rXmWeBPjWcAcR1B39X7YSjO3A7FgWI4aIrvvEGff3VbIQIgq5c/ST
75QC6+0wWg==
=iJBu
-----END PGP SIGNATURE-----

--ucqtnbt2ioahlqrj--


