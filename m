Return-Path: <linux-media+bounces-36208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96930AED115
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05F3E16EDAD
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C9423D28E;
	Sun, 29 Jun 2025 20:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/A9bV5g"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5436123B609
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230595; cv=none; b=ketOYck/309TI8Xd4yNiKTwIswfEeri2+4QbC3ZHFNWCueUPzhPzZTBncdF1MyUUu1+Xz1S08nVawfzaLuX1mZYWPhtb52cxVrfbps2osZbCYAwYb4bZeNcnMgZNgkPdwVOmX+uNxK5ZjBiigc0H6zDwln60gtUplVUj9J6jOx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230595; c=relaxed/simple;
	bh=OujL5JwJcuYfRm/LLamvAFkZCEL/WA5QLKDWwpAqHeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fkFh+vPJuPKWJkGQQibUGRdE2nTmYrxWMi6bDj+1Waoj3m8daTU/OrhWAHNOnQW29OMdSfgz5Fp8OTlDTsQdtsxfWKVBhJEFW+ets3Vp6GDCypuADwnzx6S9P3GHnbdje+NsX7elA1ymIeg4r9GFJKBosag2KpmlS0jP80CBR8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/A9bV5g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA35C4CEEB;
	Sun, 29 Jun 2025 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230594;
	bh=OujL5JwJcuYfRm/LLamvAFkZCEL/WA5QLKDWwpAqHeA=;
	h=From:To:Cc:Subject:Date:From;
	b=T/A9bV5gV5uVAEiTvczlOQAOMZ+BQzhjkGKcjAjXuL5Js0d58xriq16IqxBRZUefk
	 DNs2EZozQsinJyKGvykMfQbwoXQSEiab9BDX2Rqh6AoFcrY8dthNoTIqQDacXkYipP
	 8R2blGL+Dlq6H1P0yaq0/bEq4S+438ZP3DBQcP5z5h84y5uQU0xwsMmcMR01ZBvmdq
	 apndgxcaXPdGhL8Jp8C9bJtjUbewUVJQmiaCqtsfHlJR7V2X6w5c96CIT0dMQ+kzdv
	 i5esXAYYneNYxIXNUKNbNgDLRNDHC8XxT6bpvbBX5ejck3WLCHNvU/a/NRITRnVt0X
	 suhqFlzUF8O0A==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 00/15] media: mt9m114: Changes to make it work with atomisp devices
Date: Sun, 29 Jun 2025 22:56:10 +0200
Message-ID: <20250629205626.68341-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

Here is v3 of my series to make the "mainline" mt9m114 driver work
on devices with an atomisp CSI2 receiver / ISP. This has been tested on
an Asus T100TA.

Changes in v3:
- Document that using 768Mhz for out_clock_max does not work
- Improve "media: mt9m114: Put sensor in reset on power down" commit message
- Drop setting of the MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE bit
- Split "media: mt9m114: Fix scaler bypass mode" into multiple patches,
  addressing various review comments as part of this

Changes in v2:
- Rebase on top of sailus/media_tree.git/fixes which now has 4 of
  the patches from Mathis': "MT9M114 driver bugfix and improvements"
  series, this avoids most of the conlicts between the 2 series
- Add Laurent's Reviewed-by to some of the patches
- Add select VIDEO_APTINA_PLL to Kconfig
- Use correct aptina_pll_limits
- After setting reset high wait 20 clk cycles before disabling
  the clk and regulators
- When bypassing the scalar make ifp_get_selection() / ifp_set_selection()
  fill sel->r with a rectangle of (0,0)/wxh and return 0 instead of
  returning -EINVAL

Regards,

Hans


Hans de Goede (15):
  media: aptina-pll: Debug log p1 min and max values
  media: mt9m114: Add support for clock-frequency property
  media: mt9m114: Use aptina-PLL helper to get PLL values
  media: mt9m114: Lower minimum vblank value
  media: mt9m114: Fix default hblank and vblank values
  media: mt9m114: Tweak default hblank and vblank for more accurate fps
  media: mt9m114: Avoid a reset low spike during probe()
  media: mt9m114: Put sensor in reset on power down
  media: mt9m114: Add and use mt9m114_ifp_get_border() helper function
  media: mt9m114: Adjust IFP selections and src format when src pixelfmt
    changes to/from RAW10
  media: mt9m114: Update src pad sel and format when sink pad format
    changes
  media: mt9m114: Don't allow changing the IFP crop/compose selections
    when bypassing the scaler
  media: mt9m114: Drop start-, stop-streaming sequence from initialize
  media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
  media: mt9m114: Add ACPI enumeration support

 drivers/media/i2c/Kconfig      |   1 +
 drivers/media/i2c/aptina-pll.c |   2 +
 drivers/media/i2c/mt9m114.c    | 255 +++++++++++++++++++++++++--------
 3 files changed, 196 insertions(+), 62 deletions(-)

-- 
2.49.0


