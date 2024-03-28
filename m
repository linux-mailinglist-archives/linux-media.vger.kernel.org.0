Return-Path: <linux-media+bounces-8056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E237488F596
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C1151F3228F
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 02:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73CB1E49E;
	Thu, 28 Mar 2024 02:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+qYwAko"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CD0A92E
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711594455; cv=none; b=XP/45mdS2FsHWlc8M3VSHI2wpHt4xQROHeUmjo2KIKGfQe72vp1xiH+piDGbSw3iQLkZWqb3tBrRHBmCiOaqMNNm8KxKubfWI16FGf5ybWc1WyaAxaoUD8CXtZfSSHv0/FL4tEVgqha9zLn4u9qUWbLoNlyYZaV96KEPFkPHfn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711594455; c=relaxed/simple;
	bh=fcsWoAlG9AUcYkfoX6l7dV9D19l1Ugcs/HrDGlSOCtE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=E6LxBHNMhy+HiPSRAyxsQqvcxpv4HNGbc43vKIZlIdhFXPxaRx8Omdz+baFo+AVSHnDJoYnIxfdmFSPbZ7LKPjklny/NQK6USeSKDemdyHiMeCvhHGa+VgiyyUfDECr7Z6wrrNHSM/skihWoT8AAEF0qs/1U/3ia/jSBEwFmGRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+qYwAko; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5cfcf509fbdso80201a12.1
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 19:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711594453; x=1712199253; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fcsWoAlG9AUcYkfoX6l7dV9D19l1Ugcs/HrDGlSOCtE=;
        b=H+qYwAko9zjTlZeezM2xAd7/9GGXZS7HwW9YT4+pBA0qOA//uUzhvMCZTLeHjfCDr9
         ramvikmbPRXG+16ItU5YtoZdhTSOiYO+8LWrw1TVD0JiDIgx5PNGKEPO0q219Tr240gL
         LyvLHPEfR0sCxZGTcobvk0vjSvirVpvCj3dXwx7GVdhfEgnSZ3zAC0gbFiO0uIUUjp0X
         vbORSL4sqdfmLydlkNTLTyB+b6W8mB/AwhKpJ2zMdSUWlucJiYjK4INjn8qFTFxCoKuJ
         TLikcz76WC8QzQ8uf/qgkvqozHo3a+PEE/S0EYs+I9WWRUvNuelorABeczqSz82Hr7wK
         i8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711594453; x=1712199253;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcsWoAlG9AUcYkfoX6l7dV9D19l1Ugcs/HrDGlSOCtE=;
        b=S38uwfjDbu9Bq1UIElU5Jnv6ddhJ67nb/MMdxxB0kv0J/4hm6zI4bc4/SLCF8z2fxg
         qdXIQdE368aFzHt6Z/ZsaVaq6qZyC473PPEogfCX4ch3qz5wjdlXryz60TV8dcr8xJ62
         b/BdQGijrlsvpwXk66SBIfE1Z18jIdrIvf1Ino+zYYpKDms2siTYJKWhSSJvnBpNo0WD
         ToB58+ZK4P2ZISKlf2+KuqaCjuJ8nm365NjSimfoYTp35eaNsXZuom2JFC2aCA8C5tpM
         6eLygaOB2fROVMYh+/lTXtdk2Qhgz/JBCZ1RUSPZ55AAwjFDJ3Z98G0AKzZHBh7ow0Ew
         Beew==
X-Forwarded-Encrypted: i=1; AJvYcCWcGXFd5HNA9WV/WDo7jYzDRtxHyqEAcTaxtUfBEZwm0Pc0Un28bmLAWetWluJBr1YqlsocAqzNL0dXqsZWWB8iX/p/rraVVhueiEM=
X-Gm-Message-State: AOJu0YxaVNTw87gg1JVoMcO/+iMauBF8bBt+JrHV9kkJvZgz8lCgb6Kv
	TsuYdZ+VZtGskyyJCRFzehxEqKCSdugCfF5UwgJah2oDi4RBAoQ6Qtd2h6yegl+MTkEoRyprnHd
	PvhdatuV9xxFrhqpcN0NUYhT/GVs=
X-Google-Smtp-Source: AGHT+IH9BxxROAof0FHHstmQFihGp98nUiuEBUEj77/nNBS1+Sh+LmpF1+yXDS4HHhMCMigIWGL/NF8NpeRRK4b7J6E=
X-Received: by 2002:a05:6a21:a593:b0:1a5:69bb:116d with SMTP id
 gd19-20020a056a21a59300b001a569bb116dmr1838093pzc.3.1711594453449; Wed, 27
 Mar 2024 19:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Mar 2024 23:54:01 -0300
Message-ID: <CAOMZO5CGzjQPbYznKuLqVi3izMyqF9x7rV7Prmt=s2Z+A66P5g@mail.gmail.com>
Subject: ov2680: Fail to probe on imx7s-warp
To: Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Currently, the ov2680 fails to probe on a imx7s-warp board:

ov2680 1-0036: error -EINVAL: supported link freq 330000000 not found
ov2680 1-0036: probe with driver ov2680 failed with error -2

Reverting 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
property verification")
makes it probe again:

ov2680 1-0036: sensor_revision id = 0x2680, rev= 0

Any ideas on how to fix this regression?

Thanks,

Fabio Estevam

