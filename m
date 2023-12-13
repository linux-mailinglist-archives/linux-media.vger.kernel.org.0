Return-Path: <linux-media+bounces-2373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4651B8120AC
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 22:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBF161F2194D
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 21:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A170E7F54B;
	Wed, 13 Dec 2023 21:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Kop+H157"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCCFE0
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 13:23:54 -0800 (PST)
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Sr7lC0p2Nz49Q1g;
	Wed, 13 Dec 2023 23:23:50 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1702502632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=LLawdjV8CGThPi/B2Z5Q0PLfSGbrnYf3cGiqZcuKW64=;
	b=Kop+H157N71pA92WmjiGK2wzyes9jwhkIyqB+2mnQkK9Lg1Qg05e/DOMV5BrEjKJirkeZG
	W6tty3EElVYnm1/2Mi97Tco7qRxl6tpS0FmL3lU4O0vL4XL5ALStjRk/CL1pdFZsxKYDiW
	zUW2qexmsCKoeie0nygHDQGmu4gMzzg4SsP77gedTFpwjuoPgeAclo2ucAjt3ouRzv1lwX
	dTAlY2YHmcjW1dvdAmVq4BplX55HCoZhCJN8OegXAZQ8Vy4woEMQh0fj9sK7By/chihYxL
	gDpQ1CxOH0oHQDEB3RQLiWvFexhdw6ljAesm0OjtFNj2HAq2wCm3DP6ZUj6OdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1702502632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=LLawdjV8CGThPi/B2Z5Q0PLfSGbrnYf3cGiqZcuKW64=;
	b=MhUhQz+i0vv8f0v1V3YGulsvHxzcn/kxl8+GzdjKFFH8PgkdOeTs3z0NClc0qTTjcvQfpT
	Vh7PgLkc5bzHe6UC/Nhk8XjZm01+M2cIXFpIi07ui0QsxhtIG9XIfFKap9Rb+TQHjNcjpn
	Fzpsz12YAuSJujj6GCqBizaXPGW/GOv6KYT3ipYN4moRmf7YFsje5rve+nwzoEK/CAH7bp
	06Hw0f/VDfwdqNAj5UsTHWmfN5sKuhOEaHLPjK9Yc2VtRuYaAsSPDcBOqZQyso1lzfkRyL
	5zRMSVkP7qE5CUXHff0kAQSl11JIqsWkiPk9gyisqCgGWfNGxwXwZuGBX+A4uw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1702502632; a=rsa-sha256;
	cv=none;
	b=iE8BSgYhs+d7493kpjLNn7QgPZtYD8UgbvAIbZgEwr33wZ9wucKL7vG4QJf0cFAO++Ph44
	jj8TiwvQY6difGxoYFjey7b8dc2IW4PZyTHIZEB3583KJ4Pnc4UHa9QZKETBg7uWjXGGQU
	Fhrlebf8BcOZPrQw7sIMLNdu2RuxNU71Hx1+yhW3wxNWGa00U1rgGy3bVWMCmOhc3SQEWV
	FBtYEH1UqxIUChkBhia9yFe6lX+U4XcRx5zAhhFjeTcaXReASdXgs8BkdZHvqQ1WIfaOUD
	ISS8dGvtBqiGZftzLuW7Sh1fYZhAsjHTB3t6Ms+CFQm2vwoxQYZSkgQXzBnOvg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BF04F634C93;
	Wed, 13 Dec 2023 23:23:49 +0200 (EET)
Date: Wed, 13 Dec 2023 21:23:49 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl
Subject: [GIT PULL FOR 6.8] mt9m114 fix
Message-ID: <ZXog5dtCzWeQ4Jbb@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here's a compile fix from Arnd for the mt9m114 driver.

Please pull.


The following changes since commit c2a8653c197d67f8ad563f5417f2e9bcaad913f3:

  media: venus: core: Set up secure memory ranges for SC7280 (2023-12-12 08:54:54 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.8-8-signed

for you to fetch changes up to 4db96cc909c35791d04b5c7d6ca5d580087081a7:

  media: i2c: mt9m114: use fsleep() in place of udelay() (2023-12-13 13:49:40 +0200)

----------------------------------------------------------------
mt9m114 fix for 6.8

----------------------------------------------------------------
Arnd Bergmann (1):
      media: i2c: mt9m114: use fsleep() in place of udelay()

 drivers/media/i2c/mt9m114.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Sakari Ailus

