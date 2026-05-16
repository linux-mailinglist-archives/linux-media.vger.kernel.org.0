Return-Path: <linux-media+bounces-61807-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIEvOwp9CGqBsAMAu9opvQ
	(envelope-from <linux-media+bounces-61807-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 16:19:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB5255C067
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 16:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1638C300CE6E
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 14:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB4A275B03;
	Sat, 16 May 2026 14:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uu6zZfQu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBCA1C01;
	Sat, 16 May 2026 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941180; cv=none; b=uPj/Qhxk5D6cCM356oEnOvnIRM1g8HuZIgRWuqEeUuS3MRsAbdWQdRsDTPSbpQEXHgiiGs0j1UPI9K8+VoBUMasrkJ6d3QaSwHFhm2svSL+E4lwzavXqotJktqNACI6Iv07ipw2avWsYGnkIzYj85ziWhivgD7m3KrMWCsYWqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941180; c=relaxed/simple;
	bh=YcjbfMgwLmDpUsvxRQlHaIw5xJN5VNoViq8wu8VbZRU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J+AGiPbsr2mK/XlzE102v7EDoS4UJwmKBkmesQFZCF2+qWT7BS+lD+068iIykRfzFC6kfnni/R6jDQshaMH4F0Qf0gdVUfhiqEf2DXw0DZ7XDY8dgI2Xz/w0c+XaEe0R1cOCc0/fvhCsONdrpklEjZAnqLNgPGeQULw1buQs6ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uu6zZfQu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6144D229;
	Sat, 16 May 2026 16:19:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778941166;
	bh=YcjbfMgwLmDpUsvxRQlHaIw5xJN5VNoViq8wu8VbZRU=;
	h=From:Subject:Date:To:Cc:From;
	b=uu6zZfQuBkwH4JcFQEWhEGzFF5alIV8aLIaiylkWYN5sR89VKJpMh3Ypzp5DYbd2K
	 5Q4VSE+G46/B8t0z+HDKeBER9jmNQ4QiLodnc9kqloh3AMpVU5LbQmJoMC4brykbV0
	 VOkGsR04iMGZeLS32f+bm9fBbO9fnpQnY79eDIUE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/2] media: Add bindings and driver for Sony IMX678
Date: Sat, 16 May 2026 19:49:09 +0530
Message-Id: <20260516-imx678-v2-0-4854ac61d6fb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOQQ6CMBAF0KuQrq1paQviynsYFqWdyiyg2iLBE
 O7uCEuX/8/k5a8sQ0LI7FqsLMGMGeNIoTwVzPV2fABHT5mVoqyEkYrjsFT1hRsnLUDjpHeB0fM
 zQcBlh+4t5R7zFNNnd2f5a/+IWXLBlQjONAr8JdgberA5jl20yZ9dHFi7HXSC15umTYfPOpuB0
 33AiaYaHXRTKQ0gK1srKWvtSwtKd86IzpugDVBN2PYFtFnt2+8AAAA=
X-Change-ID: 20260513-imx678-5c1aee9c1dcf
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2510;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=YcjbfMgwLmDpUsvxRQlHaIw5xJN5VNoViq8wu8VbZRU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqCHzqSRjMOYEILAp5RkIbEOst4W3DidUQ/bqt9
 nJKJzMZvKCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagh86gAKCRBD3pH5JJpx
 Rab7D/9QlzGS7UUokWvyZ+8l45Qp+WtkvDrwHerjx81Ba3LzhfrpkPvzPOkqfe168TwvAHPPN+H
 qR6wDf5Lq1tNereEZKTX6bvCYd34gAEU90rQnLbMBIvIp+utwWbxuCtIQEMPLYyfIRqOXVZwRzm
 8OmD6YFdTFNHXgDJHk66VmQ8t47tcQUjqNozxVUhS1vR++sxcW1mlB995J4vhiiGjD/9fzvaAhy
 rKVvqGsGv/GZtRaqqNBJ/lLqDDJ7C1IdLNbEnShHmLoDC9/ZvclJxrffYMHyOc6Nb240j+AcPU4
 B41L337VvvYbDJQVtoLgSoECytf11VIsG3vn4IDTbE6Y22a/WBTaxv0sGMxoe1hntcC/ytHSllR
 PZ8nzvkeUYONJ0pFdppFDDU7xCWG/6SZTEKWHsONpzVkfGJhCDdPvKd0fL9SqqDqrIe9XqmFKkg
 FfgMQxyHs57AT1Yx2tl6439E7ndu5tLN7uoxQVfwo11NacIOhAQZoc8noNGbxkKmAQRy66TKJBC
 8USiOpAqNXw7tojvcIs0YL6MUlfgRp52XlWFoUhzMw8kA+Izj5aZhh9wiT3DEYwLPkjJdVMxsp7
 e7KCyVkIyDQuPNH0TSy0WczJItmcwMQoMFH4N3CVi8QqjD5CA8PT8UTfwEdwU2NtFaiPcP1PyeL
 XHAe+wGYrawvHdg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Queue-Id: 4BB5255C067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61807-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hi,

This series adds dt-bindings and a V4L2 driver for Sony IMX678 camera
sensor.

More details about the sensor and features supported in the driver are
in the relevant patches.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
PATCH 1:
    - Add per-variant compatibles for mono and colour, alongside the
      generic fallback, so the variant can be declared without powering
      the sensor at probe.
    - Rename reset GPIO to xclr as that's what it's called in the
      datasheet, and how it behaves.
    - Reference the generic video interface devices schema and switch to
      unevaluatedProperties.
    - Drop "link-frequencies: true"
    - Drop the T: entry for media.git from MAINTAINERS.
PATCH 2:
    - Treat the pixel rate as a fixed sensor property rather than deriving
      it from link frequency and bit depth. Removes the iclk<->pixel
      conversion helpers, instead using a fixed 8x ratio.
    - Express HBLANK in pixels with a step of 8.
    - Make VBLANK step = 2 and rewrite the exposure register when VBLANK
      changes, so the effective exposure does not silently shift.
    - Fix power sequencing: hold the sensor in reset until power_on, add the
      missing post-reset delay, and disable the clock before the regulators
      on power_off.
    - Drop the "common regs written" flag, program them in power_on.
    - Add variant match data and cross-check the register-reported type
      against DT; rename detect() to identify_model().
    - Use v4l2_link_freq_to_bitmap() and expose the full link frequency menu
      with the configured one as the selected RO option.
    - Drop unused includes and defines, misc cleanups
    - Kconfig: depend on OF_GPIO
- Link to v1: https://lore.kernel.org/r/20260513-imx678-v1-0-30fc593ed8fa@ideasonboard.com

---
Jai Luthra (2):
      dt-bindings: media: i2c: Add Sony IMX678
      media: i2c: imx678: Add driver for Sony IMX678

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |  129 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx678.c                         | 1649 ++++++++++++++++++++
 5 files changed, 1797 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260513-imx678-5c1aee9c1dcf

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


