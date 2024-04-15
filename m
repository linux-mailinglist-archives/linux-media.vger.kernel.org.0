Return-Path: <linux-media+bounces-9463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E52A58A5CCC
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 23:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A5E328497E
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 21:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2DA156992;
	Mon, 15 Apr 2024 21:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KTHEzNp3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F9515698A
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 21:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713215854; cv=none; b=Q1QOo5vrqIDxtGvKNz+i4+wMsxi+g4LrTFnDtqbJiocA4R+/ILqHKuWjKEQRKLHI00y/qpoMZ0xqCI+JodWwhlwLhMoGol0AblmbUjMjsimGkFh4AEKAaZ4HH8vVrhO5PwfP7rW0ItfWjtaftAsPJndQ1UfFrQM6ZgOVRTnhlOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713215854; c=relaxed/simple;
	bh=Sy823FEfRHnC8HzR/D1+W7APBmqncD1Wzfp2tmH5PQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RolIOMW4fDyUfPgmYmfOu6tmV1RqrNO5kG/sjcWVIYZYp+NaJX7j5Yt0o8rvk0rpoQxz3o7xLeXF1CD37BtP3PtIUIVSTSCWrF6xQjYnRO9xLXyWn+4dIrZuX2mNg86/EDpX7cehHcyGvTPAiX0BijTCTVyaPOLOQ3FFYjzP3F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KTHEzNp3; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-61ae6c615aaso7338837b3.0
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 14:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713215852; x=1713820652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DW6PQj3SaOTjmagCaKYOskmDQLmKW6e2Yir85LeE108=;
        b=KTHEzNp3BeQcaveu99B8IPwjTV3kGNNC0Vveg1qzmXA34MKm88/E4JlzmKOh/D3UfL
         +qHvsi0cEORrmQKPn/+iYT2iViWcku6+eaBoKN8NuCzboDL95G5k78N5Pgg12GIpWpjg
         j9GuZ/hI4aD3dBe96TzEJFwaTasBjMqf1IVNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713215852; x=1713820652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DW6PQj3SaOTjmagCaKYOskmDQLmKW6e2Yir85LeE108=;
        b=U5o/3x0s6S9nGWsKCMbgyJNGlcsOCWvTGovwuTgkNmGBEm3V+V7YAHzy7mpksAC6Xk
         ggvtduXxLokIdCDqo1zuzclGohU/G8FX6CwBhGXeoHz2vyf9tv5EqjgLgHEvdmeVnMYP
         mfFwPxBDGDA71D44nneKvmlZN8W4X29xReC0vPF5wpXtPV0nvkrWamtOPW8ELCNDnCtD
         sM+2RPaGo6HUt6sLGHUO88VrZ3N78wCQqO5Kqikgq8f3sqZj133B9YGD10fy0PO3+VsP
         TNWtGhl8XF3e1GjvCmvuOoeRPn4gM8eqA1SX2ma1CWuNCwjHh+VTBnj8o+OuD3GQd5Bt
         6AVg==
X-Forwarded-Encrypted: i=1; AJvYcCW6JNMnvUgr19sekxGQfAv8N6nmaWCXuMw0Pb7Jdl3FwWY4djShvv/JzHxlCtrea0ML4LEaavz+GpU5whK7HTz/M0x6RV+aYPmsNcc=
X-Gm-Message-State: AOJu0YwznG9ocH4SKl7lHeLZOf+Zy6x22BeOiji0bDwRx/ZnYBsH3WwJ
	GdE09oFWiNRwydudBuK2vNojhlQ8Se+u0j2FUTMvLtDKMhKQmg2HXffnqStHOWfwaOfYig5Hexd
	/4g==
X-Google-Smtp-Source: AGHT+IEDv88+WqBCznvc/bPNIKx8HCHETf3K2rvi58582PimAeR7nH9aXjgV6Rx+FLvnZBPpp6dxpQ==
X-Received: by 2002:a0d:dd8a:0:b0:618:24ca:381c with SMTP id g132-20020a0ddd8a000000b0061824ca381cmr11170562ywe.19.1713215851682;
        Mon, 15 Apr 2024 14:17:31 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id c8-20020a81b548000000b0061855e3332dsm2238203ywk.120.2024.04.15.14.17.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 14:17:30 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc73148611so4064033276.3
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 14:17:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrmgNAM3DwuX1ZT6Bs3VGNdjLHqVQ5nG675GSU3SB7TXWqMSCxXtGGiQ+Gsa6pvNeZEDg/kKZZyeIwRtFENYQYvH8k8gV/LBIFRJA=
X-Received: by 2002:a05:6122:882:b0:4c8:90e5:6792 with SMTP id
 2-20020a056122088200b004c890e56792mr10380741vkf.7.1713215829531; Mon, 15 Apr
 2024 14:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415195348.GD22954@pendragon.ideasonboard.com> <CANiDSCteGngbSS6CCuUxM-PQiBz0W0WfoFr2E2oH2d8qt746_A@mail.gmail.com>
 <20240415203304.GA3460978@ragnatech.se>
In-Reply-To: <20240415203304.GA3460978@ragnatech.se>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 23:16:55 +0200
X-Gmail-Original-Message-ID: <CANiDSCuR6EeR2MoSH6xtJ0G07QfJsxCb116uL8ocJnwZJSh4Dg@mail.gmail.com>
Message-ID: <CANiDSCuR6EeR2MoSH6xtJ0G07QfJsxCb116uL8ocJnwZJSh4Dg@mail.gmail.com>
Subject: Re: [PATCH 00/35] media: Fix coccinelle warning/errors
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julia Lawall <Julia.Lawall@inria.fr>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Pavel Machek <pavel@ucw.cz>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas

On Mon, 15 Apr 2024 at 22:33, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
>
> Hi Ricardo,
>
> Thanks for cleaning up.
>
> On 2024-04-15 21:58:58 +0200, Ricardo Ribalda wrote:
> > Hi Laurent
> >
> > On Mon, 15 Apr 2024 at 21:54, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > I'm afraid I won't have time to review any of this for the time being=
.
> > > Unless you would like me to put uvcvideo reviews on hold ;-)
> > >
> > > Jokes aside, my first reaction was that this feels like a bit of a wa=
ste
> > > of maintainer's time :-S
> >
> > This is part of the media-ci effort.
> >
> > It is definitely not the most fun patches to do or review, but someone
> > has to do it :)
> >
> > The whole idea is that we want to get as little warnings as possible
> > from the static analysers, after this patchset we almost achieve that.
>
> I understand and I think it's a good goal to aim for zero warnings. But
> some of the fixes here are IMHO not helpful, for example I find this
> type of change counter productive.
>
> -       return ret < 0 ? ret : 0;
> +
> +       if (ret < 0)
> +               return ret;
> +       return 0;

I was on the edge on those ones as well...

Maybe we can try to fix the .cocci file to ignore that pattern?
https://lore.kernel.org/lkml/20240415-minimax-v1-1-5feb20d66a79@chromium.or=
g/T/#u

Regards!





>
> Maybe it's better to disable this type of checks in the linter?
>
> >
> > It is only 2 trivial uvc patches, I can ask someone from my team to
> > review it if you want and trust them ;)
> >
> > Regards!
> >
> > >
> > > On Mon, Apr 15, 2024 at 07:34:17PM +0000, Ricardo Ribalda wrote:
> > > > After this set is applied, these are the only warnings left:
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:223:4-10: preceding lock on l=
ine 267
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:230:3-9: preceding lock on li=
ne 267
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:236:4-10: preceding lock on l=
ine 267
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:245:3-9: preceding lock on li=
ne 267
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:251:3-9: preceding lock on li=
ne 267
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:257:3-9: preceding lock on li=
ne 267
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:272:3-9: preceding lock on li=
ne 267
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on l=
ine 627
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on l=
ine 689
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on li=
ne 627
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on li=
ne 689
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on li=
ne 627
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on li=
ne 689
> > > > drivers/media/pci/ivtv/ivtv-fileops.c:692:4-10: preceding lock on l=
ine 689
> > > > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on l=
ine 2776
> > > > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on l=
ine 2786
> > > > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on l=
ine 2809
> > > > drivers/media/dvb-frontends/stv090x.c:799:1-7: preceding lock on li=
ne 768
> > > > drivers/media/usb/go7007/go7007-i2c.c:125:1-7: preceding lock on li=
ne 61
> > > > drivers/media/rc/imon.c:1167:1-7: preceding lock on line 1153
> > > > drivers/media/pci/cx18/cx18-scb.h:261:22-29: WARNING use flexible-a=
rray member instead (https://www.kernel.org/doc/html/latest/process/depreca=
ted.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_cmds.h:77:5-9: WARNING use fl=
exible-array member instead (https://www.kernel.org/doc/html/latest/process=
/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_cmds.h:85:5-16: WARNING use f=
lexible-array member instead (https://www.kernel.org/doc/html/latest/proces=
s/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_cmds.h:154:5-9: WARNING use f=
lexible-array member instead (https://www.kernel.org/doc/html/latest/proces=
s/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_cmds.h:171:5-9: WARNING use f=
lexible-array member instead (https://www.kernel.org/doc/html/latest/proces=
s/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_cmds.h:180:5-9: WARNING use f=
lexible-array member instead (https://www.kernel.org/doc/html/latest/proces=
s/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_cmds.h:189:5-9: WARNING use f=
lexible-array member instead (https://www.kernel.org/doc/html/latest/proces=
s/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_cmds.h:201:5-9: WARNING use f=
lexible-array member instead (https://www.kernel.org/doc/html/latest/proces=
s/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_cmds.h:220:5-9: WARNING use f=
lexible-array member instead (https://www.kernel.org/doc/html/latest/proces=
s/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_cmds.h:230:5-16: WARNING use =
flexible-array member instead (https://www.kernel.org/doc/html/latest/proce=
ss/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_helper.h:764:5-15: WARNING us=
e flexible-array member instead (https://www.kernel.org/doc/html/latest/pro=
cess/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_helper.h:1008:43-60: WARNING =
use flexible-array member instead (https://www.kernel.org/doc/html/latest/p=
rocess/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_helper.h:1014:36-46: WARNING =
use flexible-array member instead (https://www.kernel.org/doc/html/latest/p=
rocess/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_helper.h:1041:5-15: WARNING u=
se flexible-array member instead (https://www.kernel.org/doc/html/latest/pr=
ocess/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_helper.h:1088:39-51: WARNING =
use flexible-array member instead (https://www.kernel.org/doc/html/latest/p=
rocess/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_helper.h:1093:5-22: WARNING u=
se flexible-array member instead (https://www.kernel.org/doc/html/latest/pr=
ocess/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_helper.h:1144:4-8: WARNING us=
e flexible-array member instead (https://www.kernel.org/doc/html/latest/pro=
cess/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_helper.h:1239:4-8: WARNING us=
e flexible-array member instead (https://www.kernel.org/doc/html/latest/pro=
cess/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_helper.h:1267:5-9: WARNING us=
e flexible-array member instead (https://www.kernel.org/doc/html/latest/pro=
cess/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/qcom/venus/hfi_helper.h:1272:4-13: WARNING u=
se flexible-array member instead (https://www.kernel.org/doc/html/latest/pr=
ocess/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/common/siano/smscoreapi.h:619:5-13: WARNING use flexi=
ble-array member instead (https://www.kernel.org/doc/html/latest/process/de=
precated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/common/siano/smscoreapi.h:669:6-13: WARNING use flexi=
ble-array member instead (https://www.kernel.org/doc/html/latest/process/de=
precated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/common/siano/smscoreapi.h:1049:4-8: WARNING use flexi=
ble-array member instead (https://www.kernel.org/doc/html/latest/process/de=
precated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/common/siano/smscoreapi.h:1055:4-8: WARNING use flexi=
ble-array member instead (https://www.kernel.org/doc/html/latest/process/de=
precated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flex=
ible-array member instead (https://www.kernel.org/doc/html/latest/process/d=
eprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flex=
ible-array member instead (https://www.kernel.org/doc/html/latest/process/d=
eprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/allegro-dvt/nal-hevc.h:102:14-22: WARNING us=
e flexible-array member instead (https://www.kernel.org/doc/html/latest/pro=
cess/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/media/platform/xilinx/xilinx-dma.h:100:19-22: WARNING use f=
lexible-array member instead (https://www.kernel.org/doc/html/latest/proces=
s/deprecated.html#zero-length-and-one-element-arrays)
> > > > drivers/staging/media/atomisp/pci/atomisp_tpg.h:30:18-22: WARNING u=
se flexible-array member instead (https://www.kernel.org/doc/html/latest/pr=
ocess/deprecated.html#zero-length-and-one-element-arrays)
> > > >
> > > > CI tested:
> > > > https://gitlab.freedesktop.org/linux-media/media-staging/-/commit/0=
55b5211c68e721c3a7090be5373cf44859da1a7/pipelines?ref=3Dribalda%2Ftest-cocc=
i
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > > Ricardo Ribalda (35):
> > > >       media: pci: mgb4: Refactor struct resources
> > > >       media: stb0899: Remove unreacheable code
> > > >       media: uvcvideo: Refactor iterators
> > > >       media: uvcvideo: Use max() macro
> > > >       media: go7007: Use min and max macros
> > > >       media: stm32-dcmipp: Remove redundant printk
> > > >       media: staging: sun6i-isp: Remove redundant printk
> > > >       media: dvb-frontends: tda18271c2dd: Remove casting during div
> > > >       media: v4l: async: refactor v4l2_async_create_ancillary_links
> > > >       staging: media: tegra-video: Use swap macro
> > > >       media: s2255: Use refcount_t instead of atomic_t for num_chan=
nels
> > > >       media: platform: mtk-mdp3: Use refcount_t for job_count
> > > >       media: common: saa7146: Use min macro
> > > >       media: dvb-frontends: drx39xyj: Use min macro
> > > >       media: netup_unidvb: Use min macro
> > > >       media: au0828: Use min macro
> > > >       media: flexcop-usb: Use min macro
> > > >       media: gspca: cpia1: Use min macro
> > > >       media: stk1160: Use min macro
> > > >       media: tegra-vde: Refactor timeout handling
> > > >       media: venus: Use div64_u64
> > > >       media: i2c: st-mipid02: Use the correct div function
> > > >       media: dvb-frontends: tda10048: Use the right div
> > > >       media: tc358746: Use the correct div_ function
> > > >       media: venus: Use the correct div_ function
> > > >       media: venus: Refator return path
> > > >       media: dib0700: Refator return path
> > > >       media: usb: cx231xx: Refator return path
> > > >       media: i2c: rdacm20: Refator return path
> > > >       media: i2c: et8ek8: Refator return path
> > > >       media: cx231xx: Refator return path
> > > >       media: si4713: Refator return path
> > > >       media: ttpci: Refator return path
> > > >       media: hdpvr: Refator return path
> > > >       media: venus: Refator return path
> > > >
> > > >  drivers/media/common/saa7146/saa7146_hlp.c         |  8 +++----
> > > >  drivers/media/dvb-frontends/drx39xyj/drxj.c        |  9 +++-----
> > > >  drivers/media/dvb-frontends/stb0899_drv.c          |  5 -----
> > > >  drivers/media/dvb-frontends/tda10048.c             |  3 +--
> > > >  drivers/media/dvb-frontends/tda18271c2dd.c         |  4 ++--
> > > >  drivers/media/i2c/et8ek8/et8ek8_driver.c           |  4 +++-
> > > >  drivers/media/i2c/rdacm20.c                        |  5 ++++-
> > > >  drivers/media/i2c/st-mipid02.c                     |  2 +-
> > > >  drivers/media/i2c/tc358746.c                       |  3 +--
> > > >  drivers/media/pci/mgb4/mgb4_core.c                 |  4 ++--
> > > >  drivers/media/pci/mgb4/mgb4_regs.c                 |  2 +-
> > > >  drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c  |  2 +-
> > > >  drivers/media/pci/ttpci/budget-core.c              |  5 ++++-
> > > >  .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   | 10 ++++-----
> > > >  .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |  6 ++---
> > > >  .../media/platform/mediatek/mdp3/mtk-mdp3-core.h   |  2 +-
> > > >  .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  6 ++---
> > > >  drivers/media/platform/nvidia/tegra-vde/h264.c     |  6 ++---
> > > >  drivers/media/platform/qcom/venus/vdec.c           | 15 +++++++---=
---
> > > >  drivers/media/platform/qcom/venus/venc.c           | 19 +++++++++-=
------
> > > >  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  5 +----
> > > >  drivers/media/radio/si4713/radio-usb-si4713.c      |  8 +++++--
> > > >  drivers/media/usb/au0828/au0828-video.c            |  5 +----
> > > >  drivers/media/usb/b2c2/flexcop-usb.c               |  5 +----
> > > >  drivers/media/usb/cx231xx/cx231xx-i2c.c            | 16 +++++++++-=
---
> > > >  drivers/media/usb/cx231xx/cx231xx-video.c          | 10 +++++++--
> > > >  drivers/media/usb/dvb-usb/dib0700_core.c           |  4 +++-
> > > >  drivers/media/usb/go7007/go7007-fw.c               |  4 ++--
> > > >  drivers/media/usb/gspca/cpia1.c                    |  6 ++---
> > > >  drivers/media/usb/hdpvr/hdpvr-control.c            |  4 +++-
> > > >  drivers/media/usb/s2255/s2255drv.c                 | 20 ++++++++--=
-------
> > > >  drivers/media/usb/stk1160/stk1160-video.c          | 10 ++-------
> > > >  drivers/media/usb/uvc/uvc_ctrl.c                   | 26 ++++++++++=
++----------
> > > >  drivers/media/v4l2-core/v4l2-async.c               |  8 +++----
> > > >  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c  |  1 -
> > > >  drivers/staging/media/tegra-video/tegra20.c        |  9 ++------
> > > >  36 files changed, 132 insertions(+), 129 deletions(-)
> > > > ---
> > > > base-commit: 71b3ed53b08d87212fbbe51bdc3bf44eb8c462f8
> > > > change-id: 20240415-fix-cocci-2df3ef22a6f7
> > > >
> > > > Best regards,
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
> >
> >
> > --
> > Ricardo Ribalda
>
> --
> Kind Regards,
> Niklas S=C3=B6derlund



--
Ricardo Ribalda

