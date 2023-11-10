Return-Path: <linux-media+bounces-69-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF0C7E84C5
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B49D1C20A16
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 20:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F643C09A;
	Fri, 10 Nov 2023 20:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ABE3B783;
	Fri, 10 Nov 2023 20:53:29 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35E09F;
	Fri, 10 Nov 2023 12:53:27 -0800 (PST)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-58a0154b4baso710394eaf.1;
        Fri, 10 Nov 2023 12:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699649607; x=1700254407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEvV6up6i1bmVXQGPQ7nI6E0uipZ7czAkBoWnloW338=;
        b=qTSstPZ+TR8r/07BPOZ7XWKQhPtmSyLcO11n77mZ7kYQ/NTNccOBJVMpIGajykot/+
         I2viS0ebZ/7qI2eqmINUdEbNNKNqni1i4dPYoEyGIi9suxuKN631ciK1XqnuYCo37pao
         lLEuNl8eHQmUgyXHoa1vUXa4rhe7ChsgfTxOrQTnwtwN7qNRWKzZ1X6G7BxzFc9yzUt+
         F+aqTQUivqxksyFwWwvqiEsSe+6VybF7F8GG14p1Bo4KdY2LcuRCu0/T3Pdg0leObDaI
         JeYiWztPJGcgt8OPby1ubWtpeY+QC41MaWCXCjoPV1tn6ApKE7z9PNC/oSpQ5VAp1dfc
         ElSw==
X-Gm-Message-State: AOJu0YyUD0AAUjysQk65l1/Ld4SlfspZalsKgJQVz3J9OrWoGtuPmOYi
	oKs264ZStNuvInKq183yRQ==
X-Google-Smtp-Source: AGHT+IG/EZf6Lcw+9SaA3RqAxpvyogtQj45WDc3IQH3lwKA4HPVfubz5Fy6kv0RFIf82fFD5MurXxg==
X-Received: by 2002:a05:6870:514f:b0:1dd:2a3f:cef3 with SMTP id z15-20020a056870514f00b001dd2a3fcef3mr1980692oak.26.1699649607267;
        Fri, 10 Nov 2023 12:53:27 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p14-20020a056830338e00b006bee5535b44sm50533ott.75.2023.11.10.12.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:53:26 -0800 (PST)
Received: (nullmailer pid 412851 invoked by uid 1000);
	Fri, 10 Nov 2023 20:53:25 -0000
Date: Fri, 10 Nov 2023 14:53:25 -0600
From: Rob Herring <robh@kernel.org>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Jackson Lee <jackson.lee@chipsnmedia.com>, linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Robert Beckett <bob.beckett@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, devicetree@vger.kernel.org, kernel@collabora.com, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ivan Bornyakov <brnkv.i1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Deborah Brouwer <deborah.brouwer@collabora.com>, Nas Chung <nas.chung@chipsnmedia.com>
Subject: Re: [PATCH v14 6/8] dt-bindings: media: wave5: add yaml devicetree
 bindings
Message-ID: <169964960493.412801.18307395523292801214.robh@kernel.org>
References: <20231108-wave5-v14-rebased-v14-0-0b4af1258656@collabora.com>
 <20231108-wave5-v14-rebased-v14-6-0b4af1258656@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108-wave5-v14-rebased-v14-6-0b4af1258656@collabora.com>


On Wed, 08 Nov 2023 20:29:25 +0100, Sebastian Fricke wrote:
> From: Robert Beckett <bob.beckett@collabora.com>
> 
> Add bindings for the wave5 chips&media codec driver
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  .../devicetree/bindings/media/cnm,wave521c.yaml    | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


