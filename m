Return-Path: <linux-media+bounces-18863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494698A3ED
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 15:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 276E31F238BB
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 13:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23C518E756;
	Mon, 30 Sep 2024 13:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgHbXfTO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA82717A924;
	Mon, 30 Sep 2024 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727701546; cv=none; b=Jc/Dt1Ur4edTyEKC17405tp9bmYxho7NVoom3/4oP9zaoQFaSgE2rmQ3yTmyM56cusXfW8Ez8XgSBDu6ug2oJ/EvXoeLmsTxu0dQzMXkFMwLZwe89PB8HBKRdDXyWFmSV+S5ydUxKD5jX0Wq1jLWKX5YH2TXvYJXU3ff9p5qoLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727701546; c=relaxed/simple;
	bh=LTWWGl1taaHnqOciXPv7pW7UIi5V/SBjuYZFQhbPq/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFLZ+HyEZJoMDmdxBQQC0FH7bg8jURgSvcjMv4EhExO0dM6NCGZi/wZmC3WMOxBabmBCuiiqo3TudaBLRJXMLfnQ1ikX6QWKbC0OrXXDyX743YIpwydOJxTSzfmZpsRomMtrhoDv6Co9+o0lvXwNaBUId0dTJPNtwPUtNKI4VaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgHbXfTO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-208cf673b8dso43876485ad.3;
        Mon, 30 Sep 2024 06:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727701544; x=1728306344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hy4I5SYwIQE50JMmdusd/rWGrGo4PlUgJRUEb8XLGGo=;
        b=RgHbXfTOyweO8UKSR/q3fAF8fvszDXdorXr3tboZi+CdxFWkBohuc7JLlUXnfcaPQd
         S3tJWU4kCtDjZRpP8meRTjoKO24HQ6OKXQZIV96fl/Z0YgCjG7olHtDIplxd+8g6PtL3
         z9fzb27ZxUefVi+5SHoJZ4v2SgDqw3q6a8fTLijPNQiUSMMIZOO8YN/uiZr0rPCY1pF+
         wghD2js58YkzZ1LlgeLtGNu9iMWlhhCKrwyD6sC4zPxitktFNuSJSuXZIS/Hg3bvxVj7
         m9SDQ3wmqSMPh6j2d1pZF7t7XpX3eGPOTixuv2TwFzc9p8/pJpVQXtZnOhf9E2H6eveB
         YPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727701544; x=1728306344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hy4I5SYwIQE50JMmdusd/rWGrGo4PlUgJRUEb8XLGGo=;
        b=Uq+vl26QGOJAaNTrVUQtbQEkUOtIjNjo1lsbIOGyHMJ3H9Cyqd4P47DJiJxj27sKeA
         6V9WQuBQV0d1MrsfixxfNJ7I6Ymwz3tIWmGLEn8F+U56VJfITFZeAlR838IMa7WkXxLV
         /3CRPV59JLbtWG5mnRCEjqX/WUFvuxnd7FAOgYWVf/t/oQp+GLrMoHG5ugR1kD+3/JqB
         vjQM4XdZM4OcB1A+jnaZnWUvHTaMt2FKI68wWa+4gnHnFIRbgzfAz+WbKZ9sUq0YJ8Aj
         jNuY2Z8/dAavmpkRrxVFBNZJMg0M1n9fcP3Xwew2fFf1yCdXAK/zMd2e7cbz4dIIPeG+
         lSFA==
X-Forwarded-Encrypted: i=1; AJvYcCVdmQ8N8BxeG/oAuyWpp0DojwseCHcO/wRJjRHluV3iol7VbinOlPnz1xVKcMzzF+HWJyI5v1U5VKWg2pg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9782ZODB/eYNj46B43fd6ZcZcqXteQrM6QUCkvy07hSkjCVD0
	m6e4+L4ShD1QaroEL5ZIjXwskyRNFMKIdrZxQSooxoMN6pdBvg5g
X-Google-Smtp-Source: AGHT+IHGHVoOP4D8f5LUO2Tj/UhoqYDveRGBAUkCuc5SV2f6L2+QonxrRHVc2jzVpfZLoHsgiCElGA==
X-Received: by 2002:a17:902:da8e:b0:20b:7dda:1fd7 with SMTP id d9443c01a7336-20b7dda21f7mr73214515ad.48.1727701544063;
        Mon, 30 Sep 2024 06:05:44 -0700 (PDT)
Received: from localhost.localdomain (n203-164-232-111.bla21.nsw.optusnet.com.au. [203.164.232.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e357absm53698855ad.190.2024.09.30.06.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:05:43 -0700 (PDT)
From: Rohan Barar <rohan.barar@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	andy@kernel.org,
	olli.salonen@iki.fi
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rohan Barar <rohan.barar@gmail.com>
Subject: Re: [PATCH] Added ID 1d19:6108 Dexatek Technology Ltd. Video Grabber
Date: Mon, 30 Sep 2024 23:05:11 +1000
Message-ID: <20240930130510.1492313-2-rohan.barar@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240926235048.283608-2-rohan.barar@gmail.com>
References: <20240926235048.283608-2-rohan.barar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear all,

I am following up on my patch submission for the `cx231xx` driver, which adds support for the Dexatek Technology Ltd Video Grabber (USB Device ID: 1d19:6108).

The patch is a straightforward two-line addition and has been thoroughly tested.

For evidence of the device functioning correctly after applying the patch, please refer to: https://github.com/KernelGhost/TapeShift

I would greatly appreciate any feedback or review at your earliest convenience. Thank you!

Best regards,  

Rohan Barar

