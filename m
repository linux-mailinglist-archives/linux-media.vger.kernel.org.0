Return-Path: <linux-media+bounces-19989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D12939A65E2
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 13:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C7E41C220A6
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 11:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A4B1E47CD;
	Mon, 21 Oct 2024 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vN9Q7jqJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08041E47A8
	for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729508808; cv=none; b=K68hiIp6MIhHeSZuKCxznifOgCyTXaUyitTV52o6OZAdvKyHkIfColExBTz6V5DKbfgmS55XY4mmz3QlF/WksQ9oQ7S7TienBbhRRUX7ktQDNmkcYGWILuuwygTl2y/qONFw8VIPZHZFJ6EuyhXV50euxGFSgLSlkpHzeFqXAFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729508808; c=relaxed/simple;
	bh=j/cqU4YQ9xO8Fy6AsqoJKZ8kYO9WpzGiOTJL1LCyPps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHe8sI4JMNKxWdWkeefI/YF2EMTsLlNv74JFc6g211N0H+552Ze9zI7MOfjK1kWXIMJJdpSdsvtqFB2Nae6ETQOYE+SjKd51sJmerJmezfCwVKzukCz4J0WsbnMGfmpNamOCGfFSDu0KfITykvW33Oxpp/nOQx31o/4Bs/rOYp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vN9Q7jqJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539fe02c386so5294985e87.0
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 04:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729508804; x=1730113604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RnolULg5KM7EXLrBuCEsj9PWWGa59GTkIO/LQyKKSQ4=;
        b=vN9Q7jqJUEvbWsuqArKxZEF1tOBj25cuPoSFA2o+HjMU6RpPoU7de3fjMLHE2PdgGk
         VFyHPu0jTLqnhNqRZEOf94v5oGTaUUTCMoGPwPhs5QtE1gFDd9D4hSsyNNGKDDkpr9lA
         ptSFB0A5Sne14ZXUQx/qD9HWQ6e5Wu6fU82LSc9imubKdV2mTir2lFG3W28BxxdtZVi0
         jsVKeMfRML5st0p6iR1sILR1bbe6SVLf1kPCwoJi6TqCBrTdiX69Fdc8hpL/977aUIg0
         btyyc4UC0Bo4ZLYxC2s3AbrcNPg2fuBJvMvO/Nf43/yib5Rb9CdY61YofIPl4y59jhV2
         twZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729508804; x=1730113604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnolULg5KM7EXLrBuCEsj9PWWGa59GTkIO/LQyKKSQ4=;
        b=q+vSjC/aPEkNb9xroWn7msw6lBUDfij3JLMq0Na8bvT2NUoHOYZN8v/uyHUo6AZvys
         +YJQR38IgBGVSKP7Ym3jmTzMNWeyuuacKiyWY9a1cBnkTzxnfaJpTEd4lC6lH8apjAb5
         TW4w6ewvvDmX2hkdJzbjEoz6xnLeLwU6FwOueGOgTukG1fxKZFubW7hQ6uK1IlGvw5eQ
         mSeaylgjYpEvJqWbY09aEbdfYh4T6GMBQM+FfkJ1b4evpeQ+fDBwy7gQLQi1L0KHMWgA
         5ySFbtLlcGQCK/zc6Qr9xPQsp0el7JVPwW5c4MMyRA4wpza8Ifmt8nK90bn3vBWAU+DE
         2V+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFcFxyIpyvreojr2khQZJpHavNnHiJ4/2ayJ3MAptLIQxRXLoGHreaR2DCurGJEPCImvP0lKlH/zkmSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxCi69N+8ndc6VTQjQwUg10wiI020Fxk059o630JMgKVYiLQur
	/HMJ5r7L42y1sB0IEjhMPO1O3HBmgWP/bNCu+LJgyI1rm8/eBudhFwPUSeHK/6o=
X-Google-Smtp-Source: AGHT+IGm7aR5j3IDD6zj2Is7qEysFSvXPXkRuXdOrYhmnokCl1jooJeLNZfITl/g4HX8vOeeK4W3tw==
X-Received: by 2002:a05:6512:3d8b:b0:539:e263:331c with SMTP id 2adb3069b0e04-53a1586059emr4022787e87.17.1729508803900;
        Mon, 21 Oct 2024 04:06:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2242017csm456428e87.130.2024.10.21.04.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 04:06:42 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:06:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 09/15] dt-bindings: display:
 panel-simple-lvds-dual-ports: Reference lvds-dual-ports.yaml
Message-ID: <xzvjrvp6raqeyx555x3msbdm3ugyjefv4b5qv3dwt3thnblsvf@r37cjtcicuuv>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-10-victor.liu@nxp.com>
 <3qrtknxsgxzyhwivd7d4eqqg7v6twgtczxotg7rhkdumjkl3p7@u2fso5hexiu4>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3qrtknxsgxzyhwivd7d4eqqg7v6twgtczxotg7rhkdumjkl3p7@u2fso5hexiu4>

On Mon, Oct 21, 2024 at 09:43:30AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Oct 21, 2024 at 02:44:40PM +0800, Liu Ying wrote:
> > This schema documents LVDS panels with dual links.  lvds-dual-ports.yaml
> > documents dual-link LVDS display common properties.  Reference the ports
> > property defined in lvds-dual-ports.yaml to save lines.
> > 
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v3:
> > * New patch.  (Dmitry)
> > 
> >  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +------------------
> >  1 file changed, 1 insertion(+), 19 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > index 10ed4b57232b..e80fc7006984 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > @@ -22,6 +22,7 @@ description: |
> >    If the panel is more advanced a dedicated binding file is required.
> >  
> >  allOf:
> > +  - $ref: /schemas/display/lvds-dual-ports.yaml#
> >    - $ref: panel-common.yaml#
> 
> So dual link panels common binding does not fit here? sorry, this is
> just introducing mess and confusion.

Why? It's allOf, so it is panel-common.yaml AND lvds-dual-ports.yaml.
Where does the confusion come from?

-- 
With best wishes
Dmitry

