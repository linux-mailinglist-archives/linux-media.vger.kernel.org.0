Return-Path: <linux-media+bounces-18399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B600397C8BF
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 13:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC9371C228DA
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 11:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A5019D06B;
	Thu, 19 Sep 2024 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="J6mk4sU2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com [46.235.227.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FBE1991A3
	for <linux-media@vger.kernel.org>; Thu, 19 Sep 2024 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726746512; cv=none; b=APvG7a4ZgcKnbIMyzSmt2sYDNViPWyqQFp/jtLVr3utxvq+z1b4UND7nvt+xzj35NA44niMNPbeMisnENfbJNtIqiDI0EYWIJlPfbKefd/Wfilw7jisGvQDtVFiiG3JHnLW3RpSYz3T0Gvrn1t/3pqg3I9nZI6gYsJQ93JmFv48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726746512; c=relaxed/simple;
	bh=PCVfvPz0Lxm0wEPhEDLViyrD66GxBbMJ4kDjron4nxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5n0q1v/SoNu4N006Tca/2VYXkA/V7cHMs8cFxKnHM2fEmr2XhLj/aRU8AAQZ7b+HkxqjP/Gws0L5oLi+1teocNm+qqcJ6HcLJ4bFvr/PgQzqUtUQoV4TzsDC7e78eJD3sCXyT+2vMK4iMdtdsiL/Bp/dfdK3yE1sKAm3+77380=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=J6mk4sU2; arc=none smtp.client-ip=46.235.227.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=PCVfvPz0Lxm0wEPhEDLViyrD66GxBbMJ4kDjron4nxM=; b=J6mk4sU2CYEOG76v8GsiYauuoF
	MLHmvFP16oLuyBDkc5VKolP5x7xRhOvAgAdYtZ+za2O/QqAXiwEMVLwb9WwaMW9+uL1DP+qaHewXt
	TEwlDGn840+J/WumGx0YAJ/dZ7WaQHMKm6yA3WOyYrd0382G84uq1Dov9qjQ/UZTyyRB2SRTLIvEX
	1H8cKQZ9d7iaorY7ueinBA7dUy0lFvQMB2W/FMUEOjYtvsm1JMQYakoYewT00Rhd3EEx+yN+nhON0
	7ZIB6CmdBfb2tr8eiF8Q94gnWZltWK0B/ngUVyLOsZYLKrL4v/MIl6JV/E1aByQBBFXQpJtrqOY77
	pcdE+ZFw==;
Received: by mailhub-hex-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1srFdz-00DFt0-Ka
	for linux-media@vger.kernel.org; Thu, 19 Sep 2024 12:48:19 +0100
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2db89fb53f9so535317a91.3
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2024 04:48:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YwDnMNPdD3+hHf7Kua6ARU0Sq+W2mW27HS3YNSeTgIQoAaioRHn
	r3KgBwH4d46uLGXFcvDxi0FVPQY77V/ZoZ0MltfJME7bdu3ki3PCsXhICp+jJqsgnkfC8TQ9E1E
	dJndTEfwTl0j8cuVJZ4UF+C+jSpU=
X-Google-Smtp-Source: AGHT+IESlo3c5uSzFQa4BNW/+pVadurMJnER3nG8YnBps75w1mzKqlXrScCyoIyCPT+Yp/hJxxPUxcn4POVCkoRJNos=
X-Received: by 2002:a17:90a:ac09:b0:2d8:898c:3e9b with SMTP id
 98e67ed59e1d1-2dba0067f9amr26767073a91.25.1726746496761; Thu, 19 Sep 2024
 04:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918180540.10830-1-dg@cowlark.com> <CANiDSCt9JhutZJzc7sERTWSk4220QXm464yx1J0vr-LSm6ciUQ@mail.gmail.com>
In-Reply-To: <CANiDSCt9JhutZJzc7sERTWSk4220QXm464yx1J0vr-LSm6ciUQ@mail.gmail.com>
From: David Given <dg@cowlark.com>
Date: Thu, 19 Sep 2024 13:48:03 +0200
X-Gmail-Original-Message-ID: <CALgV52jttpeCVGQixjei2Sh-xW=YhFAO+cVSNnp36b4W57rGHg@mail.gmail.com>
Message-ID: <CALgV52jttpeCVGQixjei2Sh-xW=YhFAO+cVSNnp36b4W57rGHg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: add support for the D3DFMT_R5G6B5 pixmap type
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 0

On Wed, 18 Sept 2024 at 22:41, Ricardo Ribalda <ribalda@chromium.org> wrote:
[...]
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks very much!

No further action is required by me, right? The patch will get
automatically applied?

