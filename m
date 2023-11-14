Return-Path: <linux-media+bounces-336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 078DC7EB211
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 15:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0D881F24EEB
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 14:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09B34122F;
	Tue, 14 Nov 2023 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08D3405DB;
	Tue, 14 Nov 2023 14:26:33 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BABBB;
	Tue, 14 Nov 2023 06:26:32 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-589d6647c6cso2539838eaf.2;
        Tue, 14 Nov 2023 06:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971992; x=1700576792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wbhg0BPBXIMXV/utzPc3dgXX4yVOfDOcoxaMEBqYSQU=;
        b=jqCTJnEz1KuebasQ5CXnMFkKj94nIJ95AVdMlf/B0Q9GmeLKbaEFdypY75gBdjzJSh
         diK/698eWDEMG80z82zkMUoOvQm4LMn/xo8h2izT0aZQCng2ApMdXfvyOdWUnCAvd5x8
         KUzn8rvz9VVVb0plnscWHp4wmoW/lY6HMqku5IA0Awcmq1J+h2kdQwsypTRiH3kuFwpv
         A7xVHIyMOlDc4Cs1VxxaqW4IwXDiIJH8Z1XEKakG7BZI14n2ETrC+/JtskpRQPYJ1RDl
         17LCMHZ91pFMg+v3Md8Rscr1DjD6rmk5YFpyu7oX/vV8iHaYOBkQZ3LsnLc71Bak9usU
         1fwA==
X-Gm-Message-State: AOJu0YwNKBhvXdaIuEyDZcLjvfWFukMUGAHRmgau5gKI8AOO97Q86eHE
	bTJstzXUltcKRUk5LwvhTp8kCG/9Dw==
X-Google-Smtp-Source: AGHT+IE517eoCvtFdUcomMYLUYPuuU933NHOiNNabpUdzmxOfzf9ICKde+iqWcic42bRdEYddt76Eg==
X-Received: by 2002:a4a:621c:0:b0:57b:de27:28ed with SMTP id x28-20020a4a621c000000b0057bde2728edmr8486285ooc.6.1699971991821;
        Tue, 14 Nov 2023 06:26:31 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p68-20020a4a4847000000b0058a42b24dfdsm265176ooa.23.2023.11.14.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:26:31 -0800 (PST)
Received: (nullmailer pid 1700938 invoked by uid 1000);
	Tue, 14 Nov 2023 14:26:30 -0000
Date: Tue, 14 Nov 2023 08:26:30 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Julien Stephan <jstephan@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <169997198956.1700885.10242516873039673598.robh@kernel.org>
References: <20231112004544.24877-1-laurent.pinchart@ideasonboard.com>
 <20231112004544.24877-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112004544.24877-2-laurent.pinchart@ideasonboard.com>


On Sun, 12 Nov 2023 02:45:42 +0200, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
> 
> The THP7312 is an external ISP from THine. Add DT bindings for it.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes since v5:
> 
> - Make relative schema path absolute
> - Add missing $ in pattern properties
> - Set maximum value for sensor node's reg property
> - Drop support for sensor regulators
> - Add Laurent Pinchart as co-maintainer
> 
> Changes since v4:
> 
> - Add bus-type property
> 
> Changes since v2:
> 
> - Drop description of reg property
> - Improve thine,boot-mode property documentation
> - Making thine,boot-mode property optional
> - Don't use underscores in supplies names
> ---
>  .../bindings/media/i2c/thine,thp7312.yaml     | 224 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  2 files changed, 232 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


