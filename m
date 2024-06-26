Return-Path: <linux-media+bounces-14166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A55917C86
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 11:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48BC11C22EA7
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 09:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A32416CD11;
	Wed, 26 Jun 2024 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtaAOCf7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7CF16A92B;
	Wed, 26 Jun 2024 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719394207; cv=none; b=mUFBMiucS4OhOfBBdN8RPYa/4XMEVZkuDSpAgIYamlYjzawwOHEDzQqr9fnhqXUf8oOKlWFI6BlsF3avtiWmM4k1+UYwaoQmnPIPMSAWuguDcY4HoJB0zHJ3UPsKDNSMuoPxiUBmQVneAubHf+m6PgLuR0AjkkREMDbdw+VGfp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719394207; c=relaxed/simple;
	bh=cZWxBSiO/iJGBZwpSi/BIu0JIjVhS5+evAWr+FNRzAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VEAPo6jwSv8UDZibUgvTKTThJ3Ct2xJh+De5SHeRr2hedi3tErA8PcGE6PLus0zWCJnILsyNk1sejmmOrG+TQRGP5Jum8MYnboOBkmH8yq7BigMIQzy3OQ3ykvkYG5R0qTEt8X1YAuEaEiWXL6n31NH0jrPVI6UcOsv4reFwEKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtaAOCf7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7065a2f4573so3602420b3a.2;
        Wed, 26 Jun 2024 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719394205; x=1719999005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZWxBSiO/iJGBZwpSi/BIu0JIjVhS5+evAWr+FNRzAc=;
        b=RtaAOCf7sC5ghNqVGbMwmiL10Mzj/wV32XVrjireguf9QwyoXRNipbky92szYRwxtP
         kg5hYfosY95WJMm5p5kHrmDfWkK3JNcowzD6jHZzWLGEYnUdW7a1L1AgfghogRVxEPBB
         z4vjvRuSUHQBGXrCUdI+Mwq7qGA6qE+o9ndksEb9800c2W5OPuHhfMuxJnLo+LZYmdXN
         16Am1qcyDrpY4NMYWiMIdK+BNrtgLMfuh0Tz6nZWYoLMsO7BPcrHfhM6itKkk0oy/LXC
         Ke/35esOTUoo2cAPTuetOitHzck2AXkMKgK8nS33cfFA1OyjHfq/P7U1WEeYh6GdbJnV
         7vIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719394205; x=1719999005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZWxBSiO/iJGBZwpSi/BIu0JIjVhS5+evAWr+FNRzAc=;
        b=LFPjYgXRHb9tv+yPFUNInYsmYfmLcOGVpOyXJoXNCKoMOoBfo1agChzs3q7Hn/N8J1
         6kwWJnvQYd5d7xOSz6x+lw5JHCYDRL7VFvZEN3e0EZIDLeyEoXAzUkj/p/RcLvjdrCdm
         FP6M/20Vbj2/AU9CM9+cqhsH+H/lnTiUbyBC9HCrCHer7mPP8PzY1p6xGDAa/vwt0wCA
         IQJNI+bOlXdNRVwFFY/S8QZqyhgF3vXIac0rV3yFORDoB3VzMw0rmxRK4If54SzTuWc3
         Qlo/ahuiinEgpR4Wa9umrPhUq4+DF6HxCCpVKspuNZJjdx4ET38Dw+cNSfykKtLBtUGF
         Q2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqB+74t+uJ4MluXOZynXkmLW+blnqEnWpWW3oORpTOgvOK58nDiO6J5O7OA12NndwC/8euc1lTUF2DYliJU/Di5ra+iHbgSsOBy1cgCrQQo4rdWGj5oBdjIQlfDktDrj0sJ2oF70FMZlMI3z7P82SmUnyqf917cb8Xrq9h8o2x0p+OhRnF
X-Gm-Message-State: AOJu0Yyqo4b8g1gdlRb8TEQJB4ceyrCDMUCR0C0Kk0BQLy4NBOeknFTP
	Y8ff1QxZOENk0aDx7vsbaXXrBpT6joScxJN0eK2wzv4rOzRXjKUrduX8jXkJcpQ=
X-Google-Smtp-Source: AGHT+IHZLTWWWiK7JVATb724zAbQNSxCuFklY5BX1h7VZKH4cXhxSYQMi7uVau7fHMxpC0LqHr2cAg==
X-Received: by 2002:a05:6a00:2d5:b0:706:5aee:b987 with SMTP id d2e1a72fcca58-706746b601bmr7122207b3a.22.1719394205361;
        Wed, 26 Jun 2024 02:30:05 -0700 (PDT)
Received: from localhost.localdomain ([221.220.128.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7068998497esm4994220b3a.15.2024.06.26.02.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 02:30:04 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: andy.yan@rock-chips.com,
	benjamin.gaignard@collabora.com,
	boris.brezillon@collabora.com,
	conor+dt@kernel.org,
	daniel.almeida@collabora.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	ezequiel@vanguardiasur.com.ar,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	hverkuil-cisco@xs4all.nl,
	jonas@kwiboo.se,
	knaerzche@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	paul.kocialkowski@bootlin.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)
Date: Wed, 26 Jun 2024 17:29:55 +0800
Message-Id: <20240626092955.530229-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620142532.406564-5-detlev.casanova@collabora.com>
References: <20240620142532.406564-5-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I just confirmed that this driver also works for rk356x. I tested it on
orangepi3b with kernel 6.9, and chromium can decode 4K H264 video with
hardware acceleration.

Here is the devicetree patch for rk356x:
https://github.com/amazingfate/build/blob/4c3564bc82b8963246450d3ebe1ad93965e7c22f/patch/kernel/archive/rockchip64-6.9/rk356x-add-rkvdec2-support.patch

Please ignore the change of vpu's compatiable string change. I did that to
disable its 1080p h264 hantro g1 decoder.

Best regards,
Jianfeng

