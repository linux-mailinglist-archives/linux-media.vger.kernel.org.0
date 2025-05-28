Return-Path: <linux-media+bounces-33558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755AAC721D
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 22:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58C551890E53
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 20:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36B3221550;
	Wed, 28 May 2025 20:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZSVBS4Ks"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523C0221271
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 20:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463739; cv=none; b=RN0Kl0CZ7vAFDp+yWZZu5zu1IryToXs7kfimsW+VuhpstWuKSNUqMKc6gCqu6wr2HfCqR3clJHvxHYi4BysVvARMuUZq0gPN3kZoBH3awQQVVNxlHmczEOyzjyTqP8Bv80WFdAYjILFPewcLRtkKNGtDTucYP4ddN/hoJpnZbxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463739; c=relaxed/simple;
	bh=U5is5MEGe0X0Mjfo2ZU5wxoOjTJwYdWcA8HyweQzW18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IT3jAtaafPp3MW4Lh8RmNs8wq4ZufdepaBOvLi0/Bv5q77giqaPFtxdV+ixVw5GeHv9W3Jrk9pEStZCC8hW6UKDp8Z8vRhhPB7Soh73XdhFG/0ObyckfaQtPZIyWxLeWQNG0y49bnDJNjdTbPIBLv5hP7ITb+9GGAVFVJvk1S1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZSVBS4Ks; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ce671a08so1793625e9.3
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 13:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748463735; x=1749068535; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6n2HYaqYB+4+SpTa+7TCxA7tS9wMhIgWlUlVyt1cSE8=;
        b=ZSVBS4KsA62UBzmryV7reh+DNtINeskrHvuzPT2u9wT6oZ82HaEx7z04UVumetLUs7
         RtO+x0mUGhSkRNPmhEt7PL0PdAS8PD5r0daQ4hgFUCKRFfugnSk/LR9t2lB6tjIoRfed
         tn/64kCV2itG63ToTGAKzhAErRvpmNm2euZ3sP90mCD901X7IfTaTPSdSgDtOo+gUh7g
         H3ZgonSCjX2xlFOSTOh9SK6tUA3gvgxN/2kBmiMkLIFVmzaRO00BV1muavnESHLiKzkI
         iqivjwwhu3kQiVhzyjXRsas7LLinbmfMU6rfzGWKvX3+sbrDlpPf3nf03J65XJblb/gl
         7muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748463735; x=1749068535;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6n2HYaqYB+4+SpTa+7TCxA7tS9wMhIgWlUlVyt1cSE8=;
        b=nwKJxbmXaTtbzbW/+Zx8XmqNcwGTAPPJVTw4KS6OOELvpV6qupWkcuf+XwXcgD4gsm
         8xPPRCnCcaAqltoPhKj9sYIxIjfNu1vwcskrSzckSkteeergHjvGuCkJLq0cidL34WqU
         ynBLakSGnQBFG7cUaeGJvay8JAvGmXY4KwpVNdlJgi4cf98B4FIplOrS1XnYFOspwHFF
         SQQ0Vn+ByaOr6UYWEqO3hSxOODnjh72hjpkf7bomei4jhLvyNC92iJ+1cSREd9gBftqn
         RGEtJ5bAa6R2g48oCraNdsDDRw9ky5iYOzhB2bjjCqKeiHWBxg6gJ48UlF24tVH609Xf
         tNmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcK7AGYJqgmKraEs/gSI/yIPnA5iCvaonG2zEzR4Dr4JkZ7FwAvY1PTEgfO8cC+bCwMjpz4zCJNm8K6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIha5r9bMpaMCa1KxUJYuJ9Yl/OSJCrNNpqNvTZ4uq5Xb0+DYc
	rIvxjTLSQrL2YESNMATr/nR+xkO7mVJp0Mk7LDnmwdKoca/w5JTfLlAhMtcZDhAR7Ak=
X-Gm-Gg: ASbGnctZnwREgNWJGMDcBjWAkD1Dh/Qsfw2WPKYjmuq0WITFjKAAYfN7nbgLH0WP87T
	VE0+Qbi5yl4aP3uyD+seYY3bMFa0qghaS50OdNHwPJaeeBBvbyTgh3n47lHwXp3psMtEXNf1jTq
	v/oxf+wc0bjcMHnCZJHvhLRzJjCZ3asoXz4TW1Hs1MGIeNTGYiZSZMY2f9LvidEQ53sme2WEryJ
	yuom7It/vgy+2x9DUHTwbmnTdU16xcNS3O8MbPKDEa14LL5WMDXuqgWdOeGISWqPkszS9euGFkg
	2pDhFsy88sU9i9b2BQQCJuuMCSNcAFB+RWk4goLxnZglu9eRxmREWOF4A9/K/yrGmQ==
X-Google-Smtp-Source: AGHT+IFhEjwKosmh6o7JSDsWNqf3r0DNviU4lQBAzz0dD0Lq1a43Nmr4tCObHush6tfO3W5ltflU2Q==
X-Received: by 2002:a05:600c:511f:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-44c919e1212mr153260135e9.8.1748463735586;
        Wed, 28 May 2025 13:22:15 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eac7dafdsm2343292f8f.25.2025.05.28.13.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:22:14 -0700 (PDT)
Date: Wed, 28 May 2025 23:22:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	David Lechner <dlechner@baylibre.com>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Erick Archer <erick.archer@outlook.com>,
	Guenter Roeck <linux@roeck-us.net>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Kees Cook <kees@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH 0/3] ihex: add some bounds checking to firmware parsing
Message-ID: <cover.1748463049.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These three patches go to different subsystems so hopefully the
individual maintainers can apply them.  I can resend them as
individual patches if that's easier.

The ihex firmware code is a list of records of various lengths.  The
ihex code ensures that total length of the records doesn't read
beyond the end of the fw->data[], however the parsers need to check
that individual records are not too large.

Dan Carpenter (3):
  media: gspca: Add bounds checking to firmware parser
  watchdog: ziirave_wdt: check record length in ziirave_firm_verify()
  Input: ims-pcu - Check record size in ims_pcu_flash_firmware()

 drivers/input/misc/ims-pcu.c    |  6 ++++++
 drivers/media/usb/gspca/vicam.c | 10 ++++++++--
 drivers/watchdog/ziirave_wdt.c  |  3 +++
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.47.2


