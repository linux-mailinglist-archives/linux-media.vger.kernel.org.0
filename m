Return-Path: <linux-media+bounces-33704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5DAC94EF
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 19:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2029A46DB8
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 17:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5224D263F49;
	Fri, 30 May 2025 17:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="w80jX+rx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A18D262FD3
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627160; cv=none; b=uq78RJbL20+0xnEAx0wbkJ4TfqRJYHr/G7nhdCPZ7kVbportbRdE0nbP1MZMcFOTymjA03TiNlyNM40a/Lz89kMunEpxoxqHRV17I0nVdl9d+iyk56nzUQvBD4lwXuCGaSxEM+9WMm/Zk57roCZSSPXpTSzJEc+1uoVOhUoIg8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627160; c=relaxed/simple;
	bh=gAMcET+cuuKL0RWwCyWMytv8F9RmoUjag07rOTeO4/A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PR4oR5YQ47VNQJNRso6qzS/RYcvVUdJ2XHjcBA/+1zKoO5smF3ejcSReD6Na+ciA3N9thKTMww2+anRc6qXpZgjRNTqLhpHYfNELvfCTagZCs+DtK9z/scJ0S8FZvIlxDR39c1Z425ena0tL8R/Ii6IDCieS3ww8CcpPkD9eU5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=w80jX+rx; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72bc3987a05so1462546a34.1
        for <linux-media@vger.kernel.org>; Fri, 30 May 2025 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748627158; x=1749231958; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gAMcET+cuuKL0RWwCyWMytv8F9RmoUjag07rOTeO4/A=;
        b=w80jX+rxmo1ljwTTY7so/w0xWQwJRLILwKK/1bogFysKkZSoi2ZBg1gWJOMC+YRjmi
         djNtbAlHOuXlWm53069HeRFVHU7H4RbNOMNkxaqOUsQ6mYNEvgv/X4fvjUR6+2FYRUTS
         uRT78/lnLxIaEkTqsAPInhwfkWsc12ohQPvUhWpgJNhSwDXFZlXEwI3LPG1kVSJhUXQh
         EN/D3TNvycjgol6G/rNCwf/AO3pqR++iSXiDKTPuqWMCGQMm9nRvRmfhZ1tvIeceh4PA
         8hIXEDXfZtjm6oMYOOwwPz1F+BmIWsmhvJTT+bhgGc5j3acQAVRGe1Y+vJ31GZGrMXB0
         Re4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627158; x=1749231958;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAMcET+cuuKL0RWwCyWMytv8F9RmoUjag07rOTeO4/A=;
        b=jg3iZb4XndffhRNQlEm+Og3wCe4uUX15hIWkikgprh7Oc80fDY9qT9SKH4DbmHP4dJ
         m9V1DfOLFfXRx7NpoaEbptNsA2dUJ5dKPcXDiTnb9Bu4zoSx68h8Rd+biBMehkpWr3ol
         /uBGCH96H33+27RJ/vS6TxrWo3J0SKx6eAVucgsk0ivQVTSyYAggJgrd6rnmMY9URX92
         M7YnFv3+6xkvClm0AEfHMP65nuVN38D/NG2zax+9Vonzrl1foff7nqCBLhBcPWTt9/Ps
         dKPyObuZDbQGUvUEJJxwFGkgkpxkrrMBxc/E6+pwrD5gIXhcxsryF35LhL5jsxJtbAB8
         mNfA==
X-Forwarded-Encrypted: i=1; AJvYcCWexbWIftEXI3pbEMR8e7KUA0oEtKKKqXIb6lZ3WxLzTwiTyXPXpKxwqc38SVEbE0V10LJlu8FIp+EB0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNqwgTSUZpSgHKSRBaM/pPcOdXiLH8H6OlugtRFVeHaOxi4XuL
	pyDZ79yqIfGPl5k/6zBTok4jmNfhEDBKHOrwLq/xzKJaf7q/j17sgFVw3WLRUZ1TTlT4dLoJXED
	m5vF0BTo=
X-Gm-Gg: ASbGnculDth0yQJGwLtddZkixdkLwUGkrOw1SSIMwrWipnAKriF+TdvqPTjR9BSy6Ud
	+1a1KIlMkQvr3HXYuRQfcRAFGeQXHmjYfk0FWw8pjoWzH/PY1LQOz4xIusZPoZnBpCZceV/XGTP
	9XJAMoopLd+ON/Je83RN77cbs18e2aS5ysdvISYms56VZHBD2ZiRYq2iLy+AZ+8XEfU0YLv5oZA
	pw8pki/frk9iwRVfajE3lLRRYI9O4aSIRhSW1lBPkT/QrE91/u/rajijuQuIrMJ2FjeTZqk+WTD
	/uRaFInjffsgiQ+aVo4AFYN84cUUhRScDligE0oSdF4Wk5b+azr3Ys/d
X-Google-Smtp-Source: AGHT+IHyl1e3Yym/gxdy5g4CfoGGquz0lE1x+UxDToQUNLQVwUIPOg1TJW9EOWFrIUF4GMcwRcWJcA==
X-Received: by 2002:a05:622a:514e:b0:4a4:3f16:c2e4 with SMTP id d75a77b69052e-4a4409b955dmr70951691cf.15.1748627147504;
        Fri, 30 May 2025 10:45:47 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435767a5csm23220391cf.10.2025.05.30.10.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:45:47 -0700 (PDT)
Message-ID: <23ace820d130e5d18c599d29e960652be49e1457.camel@ndufresne.ca>
Subject: Re: [PATCH v5 00/12] Enable jpeg enc & dec multi-hardwares for
 MT8196
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: srv_heupstream@mediatek.com
Date: Fri, 30 May 2025 13:45:46 -0400
In-Reply-To: <20250530074537.26338-1-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 30 mai 2025 =C3=A0 15:45 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> This series adds support for mt8196 multi-hardwares jpeg enc & dec,
> by first adding mt8196 jpegdec and jpegenc compatible to install
> kernel driver. Add smmu setting to support smmu and iommu at the
> same time.
> Secondly refactor buffer and clock setting to support multi-hw jpeg
> working.
> Lastly, fix some bugs, including resolution change handleing, stop
> streaming sw flow and others.
>=20
> This series has been tested with MT8196 tast test.
> Encoding and decoding worked for this chip.
>=20
> Patches 1-3 Adds jpeg encoder and decoder compatible.
> Patches 4 add jpeg smmu sid setting.
> Patches 5 fix jpeg hw count setting to support different chips.
> Patches 6 refactor jpeg buffer payload setting to handle buffer
> size bug while resolution changed.
> Patches 7 reconstruct jpeg dst buffer layout.
> Patches 8 fix multi-core stop streaming flow
> Patches 9 refactor multi-core clk suspend/resume setting
> Patches 10 fix decoding buffer number setting timing issue
> Patches 11 refactor decoding resolution change operation
> Patches 12 fix remove buffer operation

Just general comment, you built your patchset up-side-down. Start
with the fixes of things that was already broken, then do your multi-core
support refactoring, and only then add MT8196. Looking for a v6 with
a re-organization of the set.

Nicolas

>=20
> ---
> This series patches dependent on:
> [1]
> https://patchwork.linuxtv.org/project/linux-media/patch/20250424090824.53=
09-1-jianhua.lin@mediatek.com/
>=20
> Changes compared with v4:
> --fix kernel robot build errors for patch 4.
> --add reviewer for patch 1 and patch 2.
>=20
> Changes compared with v3:
> --change patch subject of jpeg encoder and decoder compatible.
>=20
> Changes compared with v2:
> --refactor smmu sid setting function interface
> --Some modifications for patch v2's review comments.
>=20
> Changes compared with v1:
> --refine jpeg dt-bindings for MT8196
> --optimize software code to manage jpeg HW count
> --refactor smmu sid setting function interface
> --Some modifications for patch v1's review comments.
>=20
> Kyrie Wu (12):
> =C2=A0 media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec
> =C2=A0=C2=A0=C2=A0 compatible
> =C2=A0 media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc
> =C2=A0=C2=A0=C2=A0 compatible
> =C2=A0 media: mediatek: jpeg: add jpeg compatible
> =C2=A0 media: mediatek: jpeg: add jpeg smmu sid setting
> =C2=A0 media: mediatek: jpeg: fix jpeg hw count setting
> =C2=A0 media: mediatek: jpeg: refactor jpeg buffer payload setting
> =C2=A0 media: mediatek: jpeg: refactor jpeg dst buffer layout
> =C2=A0 media: mediatek: jpeg: fix stop streaming flow for multi-core
> =C2=A0 media: mediatek: jpeg: refactor multi-core clk suspend and resume
> =C2=A0=C2=A0=C2=A0 setting
> =C2=A0 media: mediatek: jpeg: fix decoding buffer number setting timing i=
ssue
> =C2=A0 media: mediatek: jpeg: refactor decoding resolution change operati=
on
> =C2=A0 media: mediatek: jpeg: fix remove buffer operation for multi-core
>=20
> =C2=A0.../media/mediatek,mt8195-jpegdec.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../media/mediatek,mt8195-jpegenc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 169 =
+++++++++++++-----
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 21 ++-
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 | 112 ++++++++++=
+-
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 | 112 ++++++++++=
+-
> =C2=A06 files changed, 377 insertions(+), 53 deletions(-)

