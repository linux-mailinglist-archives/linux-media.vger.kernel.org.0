Return-Path: <linux-media+bounces-37107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C16EAFCA9A
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 14:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61B7E175DC1
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37DA2DCBF7;
	Tue,  8 Jul 2025 12:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7XaCEIv"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F82C08AF
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978460; cv=none; b=nvQYS4lrAA5tcvW/7uzQXAgjcBKaqHfsrSAHjdA0JmjS570ozHE0GuwqCRJU5Kx0YbW9L986z1p8WOnOFmpUFCFgUqxzrn6F8AwCGZx7zsHiG+FdHROtHDuV+J7lz+W2/xPAltBiG+KHTLbmZVnIcl5KH86T9WTfZ3+wCf39IBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978460; c=relaxed/simple;
	bh=sZgy+2j2K3WzsQyJuAZKTI3O3KoIlloG7CaYncgcPSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxHVtBWZj2e0rvMR3neSKMYhSCLRjQOeYEmcql7yw8NL9kJvOpRYU6pqN/rmVXqfXEAbVaqGmrFX8frWv9iyajeD3+QcrG4WDsLDERIq+ZVs2LdtKNHeG8pxrEXEsMI8jSty48IeG9j8MXYdiGGhZrATKIgOfbrQG9WMc7npsq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T7XaCEIv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751978457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZgy+2j2K3WzsQyJuAZKTI3O3KoIlloG7CaYncgcPSQ=;
	b=T7XaCEIveW5XrV3RD5vmCY2CTyW7Kt1a/+aswlH/eVZ8eIb1bVhL3XIFbTmgk5UlVujWP1
	2LC5aLtyx4AGXSH7BaTi8M8LfytTKMviVwonWFSGgNUXSR+N1VJbbA7zR6I9uJbFh+G2ik
	9daR+4uvSWRGgFVuYcvQO/NLkAC/MZ4=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-plZQMx5UNMO-cqkj350ckA-1; Tue, 08 Jul 2025 08:40:50 -0400
X-MC-Unique: plZQMx5UNMO-cqkj350ckA-1
X-Mimecast-MFC-AGG-ID: plZQMx5UNMO-cqkj350ckA_1751978449
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3e05997f731so102095175ab.3
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 05:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751978449; x=1752583249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZgy+2j2K3WzsQyJuAZKTI3O3KoIlloG7CaYncgcPSQ=;
        b=Kr/pew5ivd0gL6i1OnDzToNp5TWIN8E1exYMuWKS1rRPR3lgsu69BKm9qYvdah6wAP
         zPnjMsjNVVx3FgUXjLrxhcoPwwI4HdDEay4onrAsUWbNVtai/Egl2neqQSD5jZXPz+hI
         Ome3K++8rPRnCbfccmxAWtD0P2zyOCHWGIsza46E5uSFLyw+WEiLNnhD5m8+t4WVNgcX
         5I5r3Zy4kaR+8/7ED/TPjYY/M1Nv6Dr7LyicPsyK/CXguM1BW9pY0jwoDosYWPDPlFFv
         oD6PueKNJb6W45vbNJM4qpOoPAuVZlrXDwn2CJrrGkK07ROvdOj+JwPGaJXA5GKhX94v
         1knw==
X-Forwarded-Encrypted: i=1; AJvYcCX1HaNgRR+WVdzHx8WMBPcqhjymXk8D67HjOL41DzbsOL1I5cKdb+g8dRxjtINEu/XqNJTmD57fdTlquA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzne4vcN7QxB61wad/pFcsl2mI4+Pyfhw0/9FcawkUuFEsEKivy
	GiPJyWaHi22sMSO1RP1zpAGxh/fCtzajhFJYmsR7GuUca9wvOJcGfyZ2UjNBXVzgdiEhOCa+0HU
	VXKMqA9NPSn/bMKWJGU1FZQgMw02xaLY+lFhuuYAq7Fuo+ABwb0+7qzVIHz3pluWHo0bvtlZV+A
	0rSetJwy4PFSmWt4SPxVw1JLjUT9VN8UbwW5CBp+6YhpjIBIz5/Q==
X-Gm-Gg: ASbGnct9S9mcvmJBxo/FsjQjH0G11dabJVKvh8PWMuhWJfcf3xkWEmxpAPq1Oaj/ghJ
	iJjggmMfwXXOKfF/24CH5glreHOsOdThYKNRvMJvakEmAR7phtLxRh0Fr4JUxz4Ud/D6NcfviD6
	sVwg1iNXOPLesv7LJ7bpZiZAdL268k+QZHUKTj
X-Received: by 2002:a05:6e02:378b:b0:3df:399d:39c9 with SMTP id e9e14a558f8ab-3e136ee4883mr168223455ab.2.1751978448962;
        Tue, 08 Jul 2025 05:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbYQNxogXNb0gyjlqPtcxhl5oMTYJhToH8zjakQAU6t9/EvkvuHsM0HVhMBlaDZoS8YMJX5m2laPyTVKhbMaI=
X-Received: by 2002:a05:6e02:378b:b0:3df:399d:39c9 with SMTP id
 e9e14a558f8ab-3e136ee4883mr168223185ab.2.1751978448642; Tue, 08 Jul 2025
 05:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701172556.117872-1-desnesn@redhat.com> <45b69c6c-e8d5-4b71-9759-cd76eb1a7258@kernel.org>
 <20250707125028.GB12247@pendragon.ideasonboard.com> <5fb10c0d-eb85-40d1-97f2-9e36d4d1f62c@kernel.org>
In-Reply-To: <5fb10c0d-eb85-40d1-97f2-9e36d4d1f62c@kernel.org>
From: Desnes Nunes <desnesn@redhat.com>
Date: Tue, 8 Jul 2025 09:40:37 -0300
X-Gm-Features: Ac12FXxVXj_P9emHoRCBl0bPdB7pJ-2pym-GcvgypQJga1tlAgn2bTryvQbEYR4
Message-ID: <CACaw+ezKVQQcRBgmL+UD937aXqRXUfu8v5ycbOi0o-9p+Ky0RA@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Hans,

On Mon, Jul 7, 2025 at 10:01=E2=80=AFAM Hans de Goede <hansg@kernel.org> wr=
ote:
...
> > As mentioned during the review (see
> > 20250701192928.GB16835@pendragon.ideasonboard.com), I still prefer loca=
l
> > loop variables. Can we use that please ?
>
> Ok, I'll drop this from for-next.
>
> Desnes, can you prepare a v3 moving the toplevel declation
> inside the other loop please ?

Sure, I will send a v3 with the requested changes today.

Best Regards,

--=20
Desnes Nunes


