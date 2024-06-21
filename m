Return-Path: <linux-media+bounces-13904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D3912066
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 11:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8F821F24218
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 09:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1DD16E876;
	Fri, 21 Jun 2024 09:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtoADSXS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EEF52F71;
	Fri, 21 Jun 2024 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718961763; cv=none; b=CeLYRnRMOvLGy9mpUJuddHPhzdFLGWyteIuO78ayMjcUDRR1ZWACog4tmSague/zrhXIvPZZ3kw/w7ciRV/KvVf4GArvO2C4kNzdjc9v/dGgtoQ4//E5By8Rt4RJMs6Z9Fl/DAXbhNG5xc4zUFrtEwsRpvI1YAttFQDvDkaGaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718961763; c=relaxed/simple;
	bh=0DChm4oZFs0LJKI90R8W/14zMUVHY5Ac9kAsA7OIYR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nk7T8dVhjllybIdfwKXAuSrf4hwEStUJCrnVajl0a0lYHAjVkU6o2OatrGz5XXYXQ9X+MT6aWYQjPu6z5wTbzVhI6P8fBEnMY3+XthM2d9sT1hBZFy0Y3vUU6j3Ew6WA6iLkd1DAt6WTPsE3leLnS3bSqppfihGVbKXebWH8yAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtoADSXS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f44b5b9de6so14794535ad.3;
        Fri, 21 Jun 2024 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718961762; x=1719566562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DChm4oZFs0LJKI90R8W/14zMUVHY5Ac9kAsA7OIYR4=;
        b=GtoADSXSXrvesm5fRdcPc0Z9z/x2EE28KE/P4qzIhWXT+FRC6blVjTQbXNDzGqbcwb
         T/kOBXh8/ysm1aGhTx8q6KBdmIGjYNI3oUGyAz0QKNpKEqY/ZAsIcxvPCtYf3e6vt1+j
         RyDf7YksOvXjmztYJgL3PvO2Wg+nQwKBHavIWPIZwkV/gEpIbVHL5DJ5UDH3ABdU26mM
         3jJAdxHr69Pz6mesqtdPa5f2u/Nzd0wCBK32FYUtHThc69LhFPGoSuhR/kuYCnLJUCNO
         jdG3jN/K6uKSU/85187ZhIMmGunyqXxo3QuzPKMM4HkEQ15+JQ/TQIXK05D3j3eVttiC
         0f+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718961762; x=1719566562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DChm4oZFs0LJKI90R8W/14zMUVHY5Ac9kAsA7OIYR4=;
        b=V091Qczd1vNe3ZBxskTiaWDvksRvGRlNAsj1dIzVy+8cAPohzMgt/mtmbWCXqZdoMA
         HSnpOrJdHMuJevTcJluakpp3eiDwshbJyJcVexdrO2Z1sNzaudCA/iZQ8MT1H9mQVluz
         0xm6no4t8bzPOFcsXh6WBsQY/IQ1+ll5+mj0EE20VE/6o3zxtxR/lgvJJx2PkQHBfaTD
         B9qD/yB88LxdEdZewvwdXctt9uAJDL2HYP/Aer9qxtD6wWgePSr9dOzYMUwich94FdEK
         bFru+bIWrEl33NUFaPMoN7ipPD9JxpwGKDaTKwikba8+3quUE4PCb3UQTvoXdRI9J14l
         D5/A==
X-Forwarded-Encrypted: i=1; AJvYcCXs7itZRnJ84I/YpP7fdEVvQK++mlS8qBHtc1tZJoB50P5g8FvI4O5ta+1iHAYDLPoG8jeMfliqfx0RIK4QWq581z2EJp3E4BDiC2CUczB5w/+EjtePXETkH17VHmJUTcq7ExeRF6cGJn8sFsUbd1uTNCNCYMr/cdo56iPwWVXeycBbjZh7
X-Gm-Message-State: AOJu0Yw9SxCm64hCxnxtZVbNj/PgMXCwgwBlc9eIcQF6yLSYdH3wXkZX
	GWjQSUB3Qw08ypFRUjVSrkV7TXzmZwCRppqq8pTKHshG+Mz8umpE
X-Google-Smtp-Source: AGHT+IEapwoXM3TE/uZjttS5wEj6FJq1+Ictg80vAM9P5mq/tKCuoOcx6e+5kChf/aTCKpsl/dBlgg==
X-Received: by 2002:a17:902:e808:b0:1f7:1a9:bf09 with SMTP id d9443c01a7336-1f9aa458609mr89974475ad.51.1718961761807;
        Fri, 21 Jun 2024 02:22:41 -0700 (PDT)
Received: from localhost.localdomain ([221.220.128.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c5bf9sm9761485ad.122.2024.06.21.02.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:22:41 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: sebastian.reichel@collabora.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	ezequiel@vanguardiasur.com.ar,
	frattaroli.nicolas@gmail.com,
	heiko@sntech.de,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linkmauve@linkmauve.fr,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	sigmaris@gmail.com,
	detlev.casanova@collabora.com
Subject: Re: [PATCH v7 6/6] arm64: dts: rockchip: Add VPU121 support for RK3588
Date: Fri, 21 Jun 2024 17:22:34 +0800
Message-Id: <20240621092234.280171-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618183816.77597-7-sebastian.reichel@collabora.com>
References: <20240618183816.77597-7-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

Detlev is working on rkvdec2 and gstreamer can't deal with two h264
stateless decoders. So it's better to disable h264 decoding feature of
this vpu121, just like what we have done for rk3399. If your multicore
patch can handle the jpeg enc node at fdb50000 with other VEPU121 nodes
properly, we can just use compatible string "rockchip,rk3399-vpu" instead
of "rockchip,rk3568-vpu".

Best regards,
Jianfeng

