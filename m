Return-Path: <linux-media+bounces-7949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3111E88E84E
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 16:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C83D91F2E782
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 15:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECA513DDC8;
	Wed, 27 Mar 2024 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coELbMe2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4BC12DDAA;
	Wed, 27 Mar 2024 14:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711551039; cv=none; b=FTx96fE7MAGw3PEdSedS5uL4HljA9z0b7NYSAX8LRw/l36TmuuA+geCkQ7tjGiJDDkw+2sQzVHpW4B+Ho+ZjhZVQ/AUU+mmEvqfOXvM+/ANaNb+cC5pqNOWj8NEENgMJOFO11I79JuMcnOipentXavTL5L2/iSsG5BEIuQEtVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711551039; c=relaxed/simple;
	bh=9qX0mAu8p0xLLDTkVjZDR6d85JBmssHRthZYFdFwtKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QpPNXRE7ArovDhJgVEXgsN7WgMo4HcXLcRtbGcmx8XyZQUJQ/Dwcsli3NJ33BMpdRaPoqnwLCN1xmwkmqIJVu4uVFKwNBo9Ai8QQfzi89anrXRFCIOFxPSc0CGBHMPkkUPEvao4wMRWF5Q39oGGGtYyDMw9JGO+jV7jqiNwAiiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coELbMe2; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-29f8b407610so419174a91.1;
        Wed, 27 Mar 2024 07:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711551037; x=1712155837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qX0mAu8p0xLLDTkVjZDR6d85JBmssHRthZYFdFwtKg=;
        b=coELbMe2SXDcGSW2gxJnlB+AEVJ3b4iqFEPVOngoikwmhl1ptKb58lO+5FWQozUn8o
         3hP8jabVktquKCauGE0T7jvxHHqtVBH43hz1bkhLNLdC50ilPz12kZEIiorM7TQ2VIxu
         KL+kjmOilI9OZkXjWCB/KNsw37NhNKnWIJyILf4JdGYpYIBkDBEpLs5rldJ772eyky/b
         Eq78N7iw4B9Wz6qkemCtyJ6ZKVyIshnWAbc8+UPadyMDWcUFGg+eIIUI2f8cRz2VEgD1
         benEkw9BvSNGk9WFEryvOXMsIHHSZp7BO0NytAwCTNoJ7caEc5UMjsHiu6uVLnoNCOW3
         QeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711551037; x=1712155837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qX0mAu8p0xLLDTkVjZDR6d85JBmssHRthZYFdFwtKg=;
        b=T4kts/tLiaWKTZWXeMiesjKq/gc7XVglIX4iT55SvwACOHz9w0vtEtdG6T6kHHkEhJ
         kyFZWydljwhA+qvgNzGMgZqC3OwqcEfZ9RkeLxD8mP4f3CPPN7o41VF+98R5WyeG7yjU
         TNvMK4IvfztgSguHRzCC2VlD8u2crnY+1wG5bw8wWS4SoxZK1Ehfva8pUeGoe/oUvP06
         /khu4ZLEXCpvP9aoL3dzNQB51S494rOc8/bVFsp4EKSMmO10OLhXXMM17aXzO++gusbb
         1EmvllhZ1whVvQuUdAlCbMVfWN3P4nB1nITcF7qOW5Hr3ISV5bIwBAxEdbGXyy49vEE1
         es+g==
X-Forwarded-Encrypted: i=1; AJvYcCV1WY2I07ZbuWrDdvRGcfpXbhs3lRDAKWoNC2Ls/DojIpW+QnHn7okin/p9IKybQZJNxqZGHrFLPB3TTfC4hObLd8WOQuYO1qoedTHOIQOZz0PEY+j9MvEUyx9yLOTgLxQFAtftgmmk
X-Gm-Message-State: AOJu0YxRwn1DKQd/8uisHGV5dSV1/cq/cayhut81z9fpWqEvNDJSxaat
	PTjh1+QSlx1L0DT0+K2Xwtc6X8lIstX8TbhPNRkL37lNfEz2QDLl2eurwW4cFK3RTAXpKfgSctn
	d2GYTEJ2pupHjlimGmdtZ/99/WIc=
X-Google-Smtp-Source: AGHT+IGh9qzp6ikzanfOv1DCAVwhyw3qPKEghifFyI4QnWRKScb4xT6AlOr6ILBriP68myluG9fW2kzff7PT+lCNVsg=
X-Received: by 2002:a17:90a:7108:b0:29b:f9be:6b51 with SMTP id
 h8-20020a17090a710800b0029bf9be6b51mr11665173pjk.4.1711551037165; Wed, 27 Mar
 2024 07:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326231033.2048193-1-festevam@gmail.com> <ZgPtolH796HER4cP@kekkonen.localdomain>
In-Reply-To: <ZgPtolH796HER4cP@kekkonen.localdomain>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Mar 2024 11:50:26 -0300
Message-ID: <CAOMZO5AYjNPWZfy_dN12K9JNwWaWThpMs0W-FzETF5k8fobgeg@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: ovti,ov2680: Document clock/data-lanes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: rmfrfs@gmail.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed, Mar 27, 2024 at 6:58=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> If there's a single possible configuration only, is this needed? There's =
no
> information here which the driver would need.

Good point.

In this case, the correct fix would be to remove 'clock-lanes' and
'data-lanes' from imx7s-warp.dts.

