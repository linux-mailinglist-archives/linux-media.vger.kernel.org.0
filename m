Return-Path: <linux-media+bounces-8836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCAC89BE69
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 13:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 154501C2153E
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 11:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC566A329;
	Mon,  8 Apr 2024 11:50:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D476A010
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 11:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712577055; cv=none; b=YMeIE69GYwlw4jxifWXQSnOBMViJvwbcwlmcDhMp6qMKbY0ZCxTyIzn3PdI+IqYCWMptm782ubKqG0AYBFIERo/Oie9PAXFPRTwcW6XPFP5bNFakxDrLmPdOwMts58PglqdVgyoPArBGbjTkkt/rb1T/ELU/VyY6k9PuLs7s/KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712577055; c=relaxed/simple;
	bh=ZzcXEmqR4XM1cg8SR2k6g0M4M79LYxLPYUTW6G0IQu4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=fTIKcVZsXbek7z0R6Sd8DJPdwO1ZJwsRMiob+JLu7ozjiEe0PfRXXQ0ZdIB+HL6LVZlkzKWTRffK+bFBiYQeFHfYdDdGjAImCvYP9nHQcBhY6TTPTfcBbZbNQUpCC7yLkRAy8MwLDs3r5HdpEyE8VTUcSi4QsDLRaT+uf3tQZyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A587C433C7
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 11:50:54 +0000 (UTC)
Message-ID: <b370f61a-6301-41cd-8d02-3d532c5ff2ea@xs4all.nl>
Date: Mon, 8 Apr 2024 13:50:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.10] Various fixes and enhacements
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwECACgFAlQ84W0CGwMFCRLMAwAGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAACEJEL0tYUhmFDtMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wT
 7w//frEmPBAwu3OdvAk9VDkH7X+7RcFpiuUcJxs3Xl6jpaA+SdwtZra6W1uMrs2RW8eXXiq/
 80HXJtYnal1Y8MKUBoUVhT/+5+KcMyfVQK3VFRHnNxCmC9HZV+qdyxAGwIscUd4hSlweuU6L
 6tI7Dls6NzKRSTFbbGNZCRgl8OrF01TBH+CZrcFIoDgpcJA5Pw84mxo+wd2BZjPA4TNyq1od
 +slSRbDqFug1EqQaMVtUOdgaUgdlmjV0+GfBHoyCGedDE0knv+tRb8v5gNgv7M3hJO3Nrl+O
 OJVoiW0G6OWVyq92NNCKJeDy8XCB1yHCKpBd4evO2bkJNV9xcgHtLrVqozqxZAiCRKN1elWF
 1fyG8KNquqItYedUr+wZZacqW+uzpVr9pZmUqpVCk9s92fzTzDZcGAxnyqkaO2QTgdhPJT2m
 wpG2UwIKzzi13tmwakY7OAbXm76bGWVZCO3QTHVnNV8ku9wgeMc/ZGSLUT8hMDZlwEsW7u/D
 qt+NlTKiOIQsSW7u7h3SFm7sMQo03X/taK9PJhS2BhhgnXg8mOa6U+yNaJy+eU0Lf5hEUiDC
 vDOI5x++LD3pdrJVr/6ZB0Qg3/YzZ0dk+phQ+KlP6HyeO4LG662toMbFbeLcBjcC/ceEclII
 90QNEFSZKM6NVloM+NaZRYVO3ApxWkFu+1mrVTXOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAECAA8FAlQ84W0CGwwFCRLMAwAAIQkQvS1hSGYUO0wW
 IQQFLN57whUFO2ifG8q9LWFIZhQ7TA1WD/9yxJvQrpf6LcNrr8uMlQWCg2iz2q1LGt1Itkuu
 KaavEF9nqHmoqhSfZeAIKAPn6xuYbGxXDrpN7dXCOH92fscLodZqZtK5FtbLvO572EPfxneY
 UT7JzDc/5LT9cFFugTMOhq1BG62vUm/F6V91+unyp4dRlyryAeqEuISykhvjZCVHk/woaMZv
 c1Dm4Uvkv0Ilelt3Pb9J7zhcx6sm5T7v16VceF96jG61bnJ2GFS+QZerZp3PY27XgtPxRxYj
 AmFUeF486PHx/2Yi4u1rQpIpC5inPxIgR1+ZFvQrAV36SvLFfuMhyCAxV6WBlQc85ArOiQZB
 Wm7L0repwr7zEJFEkdy8C81WRhMdPvHkAIh3RoY1SGcdB7rB3wCzfYkAuCBqaF7Zgfw8xkad
 KEiQTexRbM1sc/I8ACpla3N26SfQwrfg6V7TIoweP0RwDrcf5PVvwSWsRQp2LxFCkwnCXOra
 gYmkrmv0duG1FStpY+IIQn1TOkuXrciTVfZY1cZD0aVxwlxXBnUNZZNslldvXFtndxR0SFat
 sflovhDxKyhFwXOP0Rv8H378/+14TaykknRBIKEc0+lcr+EMOSUR5eg4aURb8Gc3Uc7fgQ6q
 UssTXzHPyj1hAyDpfu8DzAwlh4kKFTodxSsKAjI45SLjadSc94/5Gy8645Y1KgBzBPTH7Q==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I'll merge this by the end of the day if there are no objections.

Regards,

	Hans

The following changes since commit b82779648dfd3814df4e381f086326ec70fd791f:

  Merge tag 'v6.9-rc2' into media_stage (2024-04-01 10:08:18 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.10b

for you to fetch changes up to a9e421db3c71fc7d3d3bc08beb2f89d911502373:

  media: platform: cros-ec: provide ID table for avoiding fallback match (2024-04-08 13:27:55 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Aleksandr Burakov (1):
      media: ngene: Add dvb_ca_en50221_init return value check

Arnd Bergmann (1):
      media: rcar-vin: work around -Wenum-compare-conditional warning

Changhuang Liang (1):
      staging: media: starfive: Remove links when unregistering devices

Hans Verkuil (1):
      media: v4l2-ctrls: add support for area type logging

István Váradi (1):
      media: anysee: accept read buffers of length 1 in anysee_master_xfer

Jacopo Mondi (1):
      media: v4l2-common: Add Y210 and Y216 format info

Krzysztof Kozlowski (1):
      media: mmc: siano: simplify module initialization

Martin Tůma (1):
      media: admin-guide: Fix mgb4 driver documentation structure

Matthijs Kooijman (1):
      media: docs: Fix mem_offset name in multiplane example

Prasad Pandit (1):
      media: cxd2880: Add terminating new line to Kconfig

Ricardo Ribalda (3):
      staging: media: tegra-video: Fix -Wmaybe-unitialized warn in gcc
      media: radio-shark2: Avoid led_names truncations
      media: dvbdev: Initialize sbuf

Tzung-Bi Shih (1):
      media: platform: cros-ec: provide ID table for avoiding fallback match

Uwe Kleine-König (1):
      media: staging: media: starfive: camss: Convert to platform remove callback returning void

hanchunchao (1):
      media: docs: Remove the repeated word "the" in docs.

 Documentation/admin-guide/media/mgb4.rst                  | 35 +++++++++++++++--------------------
 Documentation/userspace-api/media/dvb/frontend_f_open.rst |  2 +-
 Documentation/userspace-api/media/v4l/mmap.rst            |  2 +-
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c          |  9 ++++++++-
 drivers/media/dvb-core/dvbdev.c                           |  2 +-
 drivers/media/dvb-frontends/cxd2880/Kconfig               |  2 +-
 drivers/media/mmc/siano/smssdio.c                         | 25 +------------------------
 drivers/media/pci/ngene/ngene-core.c                      |  4 +++-
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h        |  2 +-
 drivers/media/radio/radio-shark2.c                        |  2 +-
 drivers/media/usb/dvb-usb-v2/anysee.c                     |  4 ++--
 drivers/media/v4l2-core/v4l2-common.c                     |  2 ++
 drivers/media/v4l2-core/v4l2-ctrls-core.c                 |  3 +++
 drivers/staging/media/starfive/camss/stf-camss.c          | 12 ++++++++----
 drivers/staging/media/tegra-video/tegra20.c               |  1 +
 15 files changed, 49 insertions(+), 58 deletions(-)

