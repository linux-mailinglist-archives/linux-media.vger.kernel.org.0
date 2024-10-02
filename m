Return-Path: <linux-media+bounces-18992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC0D98D29C
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 13:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F939284C1C
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A2F200133;
	Wed,  2 Oct 2024 11:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SeR8bslo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9536C20010C
	for <linux-media@vger.kernel.org>; Wed,  2 Oct 2024 11:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727870299; cv=none; b=KCWcA/kQ8RLe6iAwMX8Vi5x38Jl4XJC7SLqB9Olf3zzUShiQRKg76HAVxHZ1Fnqs0rGinKNvirOxwGRNtYWyANEpCY2RpEUjaxUqb+xcgb8jSrfLVIz0oND2nGIcyU1hAEy/P9fAkaigoNqLfpSFzceXqDXJmF469v3Ck5RgxqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727870299; c=relaxed/simple;
	bh=fL9v4AHZ/INp8TeWxKwvfGoMuAaVHhqmCcCgRa9MWnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m40UanerR8LWhuK5CfKwNT24r4AWfN4rC3k6NTGZZyH+WWNpnGpWcbAzf4tbcdXA+fCNzt6yODzsC03SBPSc6lXVkx/eMigFcf2HbvNnsKK7zGT4k6pzxxFrksUef3jZ9pFLWECamB01iuXm4rCT9iiZUgytSdodgdqwQTK6saE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SeR8bslo; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-50a5a72b935so892943e0c.3
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2024 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727870296; x=1728475096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL9v4AHZ/INp8TeWxKwvfGoMuAaVHhqmCcCgRa9MWnA=;
        b=SeR8bslorzhlOQcj36J0UpXUutwPCP48MUqHN2SNsrEjUfe36OTm+wiPzWzbTDZSe+
         QkwSBGaZlvE48FN11x5jT96jBpvGKrH+nwVB47UAu0wUCE5VJsQZtIB8GfkT2sIv/xRa
         apDnZioJ0bGpYt6TD97bUNu5J8auLeEpvaN7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727870296; x=1728475096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fL9v4AHZ/INp8TeWxKwvfGoMuAaVHhqmCcCgRa9MWnA=;
        b=SZQxNRHTzexd0FM6xuN9k3kWhoCWcUvnuPqxZv2GBs5KB7tKwprIqtQhTJsMOyxV3D
         sfJMDF6jkFxGYw4GyojJTV55Y5c7JZfpP6s+GUZiFF4TXT4lp2DwqNyAhKmSEUYaFBNe
         24CLtUVKzNlQ01kDFcmoF1nuGbb1bhtan3dmeF8SHhVqkuUFe2KqMDDh9hqPb8Nf0lRy
         iW0pS7SzhCO04H/HzEwEaMEu+KVZdi68nolHe0nwWuKs0X8H/F2Rr6qDtpTv+FaR03HK
         LaFM7GtjHvkrlSYHp2mokU2fTFHKhFRKnWKaUJpituANw2BgUPAKBescj2xEOVDyNk3y
         6zpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOU/fvePOcyp0TgzmS2OIHMbm/vhaLTaHtuksXrTv9XcHX2fCdHTmGOQEDEKlSZ4ism9PGy2NYkpRSkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6kFpnXK3GcTjLGMeCYmExDS9YERqRW4n91anL9ULUR03d8004
	yb6QYh5WD/KkLShRFlTKht/a0ungha4v77hc2vW1Unt77Dse1wTd17XdChOZC/oVoCpLZhs2uhZ
	vKQ==
X-Google-Smtp-Source: AGHT+IGIodWjeNBGoV/WaRRd+bAxPU6CNd9XwJZec+phLuAGdv092flfL4OAyUJ4TukNbOYXohD4Gg==
X-Received: by 2002:a05:6122:7ce:b0:50c:4707:df0 with SMTP id 71dfb90a1353d-50c5816477cmr2301301e0c.5.1727870296190;
        Wed, 02 Oct 2024 04:58:16 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-50ad3b2eed4sm464467e0c.50.2024.10.02.04.58.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 04:58:15 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4a3b97cfbf8so1440052137.1
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2024 04:58:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLx79sYbLzJgkBSncLh3X5QpjfQEDaPGJDoJg0deNUMcrk1uUEMtrR3RvjhgOqLnhDExjysqFf76S9ww==@vger.kernel.org
X-Received: by 2002:a05:6102:3912:b0:492:9e3a:9f48 with SMTP id
 ada2fe7eead31-4a3e68078a7mr1610494137.2.1727870293454; Wed, 02 Oct 2024
 04:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001113052.3124869-1-fshao@chromium.org> <20241001113052.3124869-4-fshao@chromium.org>
 <r22z7eehmuprvq67gxekqwsah2mcobfsyhn7xzyyh2gdtjegve@zl32uljxrilx>
In-Reply-To: <r22z7eehmuprvq67gxekqwsah2mcobfsyhn7xzyyh2gdtjegve@zl32uljxrilx>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 2 Oct 2024 19:57:35 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhF7CiiGaNASiqYw4Av7MQfLJsUa1HrYsx9n4D2sAP7Gg@mail.gmail.com>
Message-ID: <CAC=S1nhF7CiiGaNASiqYw4Av7MQfLJsUa1HrYsx9n4D2sAP7Gg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: media: mediatek,jpeg: Relax IOMMU max
 item count
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Xia Jiang <xia.jiang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 2:16=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Oct 01, 2024 at 07:27:21PM +0800, Fei Shao wrote:
> > On MediaTek platforms with Multimedia MMU (M4U), a multimedia hardware
> > can be assigned with a local arbiter (LARB) which has a maximum of 32
> > ports for MediaTek's IOMMU infrastructure. That means there can be at
> > most 32 items in the iommus property in theory.
> >
> > Instead of relaxing the max item count every time a newly introduced
> > device tree hits the limit, bump the number to 32 as an one-time effort=
.
> >
> > On the other hand, all existing and foreseeable JPEG decoder nodes at
> > this point have at least 2 IOMMUs, so set minItems to 2 accordingly.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> > It's not in the upstream tree yet, but the upcoming MT8188 DT will have
> > 6 IOMMUs in its JPEG decoder. This patch is to pave the way for that.
> >
> > Changes in v2:
> > New patch.
> >
>
> I do not see any user of this in this patchset.
>

Sorry, I was doing more checks before sending out that series.
The particular patch depending on this is now available as
https://lore.kernel.org/all/20241002114614.847553-6-fshao@chromium.org/

Regards,
Fei

