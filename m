Return-Path: <linux-media+bounces-14873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C8592D630
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 18:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCBCFB2186F
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 16:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7484B194AF0;
	Wed, 10 Jul 2024 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4e6wWkx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547E720312;
	Wed, 10 Jul 2024 16:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628547; cv=none; b=qI+njVGOqRHaUF2U+Vq6lwRb8e5qKcYI551aAdGt7G09d13DtO7LEehNAeiLKhW6XSZAlLJUzmijJsDhn/iQPV+/I1Eoxn0mn63+/NFEQAGOt5ritFqcgynTJs3ICE+ug/Cz2s1gBGcjfb4E+0KokhSmzYB4OkoPMhmxBsXz9RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628547; c=relaxed/simple;
	bh=s9iOTRxw5Qytoe+VupdvA/reAQiawx9dExWT989PAS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggeCB9mWX8bV9YPU9anCfpVB7sxeIV6N87sgy6hTdZjnWprocIkx0jL2hrKEWACEAGmJFNe8vahTEiKVjZ4tPPPZ/xrn0cKvfEjax8FmnFCczuHjYQax0ePkq4d8vHMbfi1bZylAit/ga9SfVvII8Gv5pKUPDxWtLEUK9ldsD28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4e6wWkx; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6fd513f18bso700950166b.3;
        Wed, 10 Jul 2024 09:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720628545; x=1721233345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9iOTRxw5Qytoe+VupdvA/reAQiawx9dExWT989PAS0=;
        b=K4e6wWkxZOHXGx1zHCFxR14/d3eUGz4z/x2Hr1UhuaSoZHn97ncReYKgeaaMRYL2hJ
         m4r1B7/raALpNluGNTKiBAnLW/1Tdgo6l/Q9noy5sXzAjtlmaAMVoG8CRJjz58ehKDGN
         fWL4PHTiwpVU/6B5BEDl3QfSUVYhi9gbMc2mktF8UE2+ZlXD5ENOagAbLY+MOK4qR/Zo
         Q/CKnycRw9t8Q9NEF+zwzEOiJO0jvb2oJ6x4WMswVQS5kSxdoeaKLYkg4Z5VAOLhB6WU
         OMu0psNm2VnVnDgUg8NBbROE85U6hWbouVG/ccgONfr8W1+TgXx21DulY9YvaRpnQR3u
         qWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628545; x=1721233345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9iOTRxw5Qytoe+VupdvA/reAQiawx9dExWT989PAS0=;
        b=CSlY3cQs/h3ES127YOR5fp00njrgtMQX1bAHqLplK9H4LJyutYGcqFj++UU9Jdtga0
         hmt8t2t7P96S3hGi8YpObn3KCpQmOC4Am/Np0DzJBvlxIRm2cOJhjldWRA5BeTxXjxZj
         9vECIbOOj4yd4X22+aaVDc+unfkm3mGsN1fgd49Ssp0TH3XcgqsyiOaDDZi6goPLDrV/
         H9yg+2EawiCHyiy0ILQGYgOGEI0sb/sOG6bh+BnO7yVurVSkJZq2w8nKaM6GJZ96W1kb
         vamGle8N4Mdui5pS9d/SbTR0iWRL2Bxv+knnmJpBFbbcWHDeO59qfyQ37IYT7abtNut6
         yoYg==
X-Forwarded-Encrypted: i=1; AJvYcCUP9UKL1S0qT6IYyKUfZnBor5b7GGSIchOQPhahAS5oLK19WBYrs8VNZviTToK9mhKkr7RCXpXykPX1xMmBAVnlLkjRePQcmIKg4qlm8e9PoRrram2UJ2u8YPzRIDvslrNiXgVZWwg0JSWcUxmLwu8AAUZpHNsO58z3iylyEzfozd3lyU7r
X-Gm-Message-State: AOJu0YzZ6CU/30jB3I+lgU1Tso3p4xzcxqXZ+LDhT2ycQ89n2oTKhmwI
	RDdCEPBItzS2HuR5mV6fK3mvRf0Dvjh0agWgSoiU3/b/0+WmAsTb6apgiackbHRaxFCvu2WEHuZ
	N6iI+/byhlw6T9nubIINa81yWvn4=
X-Google-Smtp-Source: AGHT+IFNvET9t815HfmplLSrRTvXphreJ0MNbUuIvztk3gg9+0wgDIzf2fKBnSwvpmHDF9a0kWQlSc1e+i3iMabrSK0=
X-Received: by 2002:a17:907:2d87:b0:a77:f5ca:f847 with SMTP id
 a640c23a62f3a-a780b68a20emr471719666b.3.1720628544538; Wed, 10 Jul 2024
 09:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-2-jason-jh.lin@mediatek.com> <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
 <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com> <CABb+yY2_oJ_AC2w5AgHMBvqFDeyaUq9BLczqY8JhLFPDnfzY_Q@mail.gmail.com>
In-Reply-To: <CABb+yY2_oJ_AC2w5AgHMBvqFDeyaUq9BLczqY8JhLFPDnfzY_Q@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 Jul 2024 11:22:13 -0500
Message-ID: <CABb+yY3ddp6Ex50yh3hZn2aQcEULvmFfd99xb7ZNVnTPn7=mUg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	=?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	=?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>, 
	=?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, 
	=?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"fshao@chromium.org" <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 9:28=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Sun, May 26, 2024 at 10:04=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5)
> <Jason-JH.Lin@mediatek.com> wrote:
> >
> > Hi Angelo, Jassi,
> >
> > Could you help me apply this series?
> > Thanks!
> >
> Please get it reviewed by DT maintainers .... Rob or Krzysztof.
>
I see Conor Dooley listed as another maintainer, so I am picking it up.
BTW, I was not CC'ed on the original patch.

-Jassi

