Return-Path: <linux-media+bounces-13369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D616190A2A2
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 04:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F23282D30
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 02:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D640176ABF;
	Mon, 17 Jun 2024 02:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqBw2z0x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBE910A2A;
	Mon, 17 Jun 2024 02:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718592632; cv=none; b=K6roFqcYiKnkJhm1jLkf9bZAtb3h66Xv58ipjFYMWP3yUSoRkfEu5VcWMjG2IcSCrM/wSVfayPL4JHIOxRh0HL/HXzsyBRjwBFnFtGTDn1hc2ZQnoZnjyf/iREgoC4/zoUlPtHGX55PX3wwH0bjWENDHrrCOMm1N7Xw7xy984DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718592632; c=relaxed/simple;
	bh=M+atImZyZTooY5329+iocy41aviFh1g/5uzGanPlW4M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jJgJQjc2q4fmbgu1SHln3r/Y+VCa6Eb8gKgZlzoQMIF3/m4e+vQtSfCPyt0YCZK5fe2eEidrGZheMmsUymfplGJaEJE+8N0KJmNpylV3Y0/JYMnq70ljIP4VsqMobU8shiqE8dPZpBlEawcBGNhsLQ095CKYMNv46h8qbhsjTRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqBw2z0x; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-705bf368037so3494114b3a.0;
        Sun, 16 Jun 2024 19:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718592630; x=1719197430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEfmh+UhYErjeX4G/Jd3OXS7keiXjtHnmVo/kB1jbTk=;
        b=ZqBw2z0xq1B8xDh9cryMN8nCT2KRX3Z80WgulSmeo/gaC6o3WS3Et0deIGOkNbPtfa
         TV12Kx5+4vHe7sn7sFeRL1GL2gCz2YiqTzrMU2B56pt+xzypKLZ+7WqNeiWCpb05Yqxv
         4v5POP8URlGKSccIKfZloEG3SgzT/jMPaNW8p5Nh3LcjMneYqCjFKgDcN3wXdK9S+7w0
         vfhnXRsNEftuHRSHv5O+Jbw04LjxDMqZteHpddZHN6m3G3jdtGFl15o/N9VvsSnNrzeR
         wqeKdZK8EJuJl132FS/ZkRvkmHU/blXxOUbHCz19CVX7Uzb8Py68DpYzmsJutBI8mxLW
         U6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718592630; x=1719197430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEfmh+UhYErjeX4G/Jd3OXS7keiXjtHnmVo/kB1jbTk=;
        b=hT95jWNrZcPWqE2huyp1XG3AVqsWzcj5Px4lXf88dnMByLSLPVzqHSPBMR8OLMnHDE
         SdUjVZxsxAcprqp6MtZHWJwq3KcuP8efNxwGW3gVtpvxDMBrVq3IYXfyewWG2w6BoRXq
         EoJLGC8WE9bwcKK4ald/bJkJ5QyaORODpfknhU/xSuHun5C3QBaj145G6ch4gBGBpMu5
         KwtPtc/tHI4N6UCRcYGdNl5KJ0x5XPxJ3ZoIlT/P3hxV9ChCGG3kaQ+RxZ1NL3fXJciq
         Q5oH7sp5l2MTmRE6nBP0MKcyeF4l4QxW5eBncrmd94RPBJrXcq3+I+J5PXbLxyI+pd8s
         jiZA==
X-Forwarded-Encrypted: i=1; AJvYcCW6s0HZ8/y9rDT8vuWTTwJAznZgVbRGQZ/Nur4KRuQc8ZR+auJ/mE5uw/6jMt/VBfRg1hRx0sd6t+xuKyil3gvbE3TumtQmvQoj8tDna9JfUkp5IPE+JcK0cdHFXnfJIDHV43xNYiokJNii/DD78t87vEFcNUAMC1fWFUvpdz0ng4JNCqZg
X-Gm-Message-State: AOJu0Yy1Azoa5+gMxBzcV4ZTmFp2BVnSJhXcZq+pswlLjQnrJ2NKYY+G
	yBQgOUy3PPaRarvG/FLH4V4uphf2pE8jdhNzsRVoAJUvzRSsOq1HCXMBxhs6l6M=
X-Google-Smtp-Source: AGHT+IEGfRwVa5MSLr1eYFoByCcIg5X0Bst0NaiZt7jnT5Mp2Yjkzz4qXhYn2DIEX1E5DorkdQIOAg==
X-Received: by 2002:a05:6a21:9994:b0:1b4:b4af:6045 with SMTP id adf61e73a8af0-1bae7eadf3dmr10737143637.18.1718592629778;
        Sun, 16 Jun 2024 19:50:29 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855efea73sm70067895ad.182.2024.06.16.19.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 19:50:29 -0700 (PDT)
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
	robh@kernel.org
Subject: Re: [PATCH v6 4/6] media: hantro: Add RK3588 VEPU121
Date: Mon, 17 Jun 2024 10:50:22 +0800
Message-Id: <20240617025022.25122-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613135034.31684-5-sebastian.reichel@collabora.com>
References: <20240613135034.31684-5-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

Thu, 13 Jun 2024 15:48:45 +0200, Sebastian Reichel wrote:
>+	{ .compatible = "rockchip,rk3588-vepu121", .data = &rk3568_vpu_variant, },

rk3568_vpu_variant is decoder's data, typo?

Regards,
Jianfeng

