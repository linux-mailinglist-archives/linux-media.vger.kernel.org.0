Return-Path: <linux-media+bounces-20498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B49B451A
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 09:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D45241C21FC5
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 08:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5AB204018;
	Tue, 29 Oct 2024 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y9OY8AFL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1929C204008;
	Tue, 29 Oct 2024 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730192312; cv=none; b=Rsv7vvLMlxTSF2ZIGX5Drm0Y9GIqEy05XG7UuU/kkd2mMDgatbwB7E9j/UbDLgfIIhEV8aaKEtsuOSbLoUhqO0NYHZaKoxYoWwTZ0a+0JNv5tQc1sVxiFCwwcBaUbZHreqaPvQnjmETC0kfIpKmeeeHDsIbUyas+qDu6mmh7m2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730192312; c=relaxed/simple;
	bh=Mtv6xcHR3vrKEBzplF/KSCB8awc7C2NPPkFWCNXXGJg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VDbcfArs55xWCbOujbL1DY4/QBVPKBuCuqlLQtGuYHdBNNDW/qSwSazlBOjT++I4DOZjHaxNxpid/BZg23s4Qa8VHpFv3Sz1v4ezmq42srms9X/66SIuNUapdHwpK31C9gsaK9Zh3vOHBrzH53PXxEj+RuqIGIy7KViX0HpKRXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y9OY8AFL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:9301:2bb5:b494:2d46:ba69])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 304504D4;
	Tue, 29 Oct 2024 09:58:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730192306;
	bh=Mtv6xcHR3vrKEBzplF/KSCB8awc7C2NPPkFWCNXXGJg=;
	h=From:Subject:Date:To:Cc:From;
	b=Y9OY8AFLhethQJ/MDgLlrIGlZr7xy9FCivGRwSgJW7Kjm4Bo6ZlpMJVJ5xOwQoxK0
	 sxA+u1AXCX1cx4JWZJYljNBusqNQ8AFHujrcKUi7JGzK6d5sCJQXVTiO2Dey9GLl4Q
	 HLS2rVWwOR7BQRgLTfwNqUTn/OpY5Dz0UmFqbRac=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/3] media: i2c: imx219: Fixes for blanking and pixel rate
Date: Tue, 29 Oct 2024 14:27:34 +0530
Message-Id: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH6jIGcC/x3LQQqAIBBA0avErBN0sMCuEhFmY80iC4UQxLsnL
 R+fXyBRZEowdQUivZz4Dg2q78CdNhwkeG8GlKiVRCP4yqjM6jlTEpu31mk7jCgltOWJ9Id2zEu
 tH9chiU9eAAAA
X-Change-ID: 20241029-imx219_fixes-bfaac4a56200
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Mtv6xcHR3vrKEBzplF/KSCB8awc7C2NPPkFWCNXXGJg=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnIKOuf5f5e1CZhfw5ZWMzS5OrsADmVPq6WGhcM
 fAt92darJGJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZyCjrgAKCRBD3pH5JJpx
 RcgTEADL1GjKq3WxJzx8aHxH8/UnOTJUP37uvSNxjFKMc4TZw0ucH19Isr8WQOzNhLWp+l2MC0p
 fuMcnOraZ+k6vbeuzaFms8GoZmi3eS4qSjNh4iYUbLYGHKs/eIQuC0ICTXZ0BbxbmkZvxkF4KCn
 1u7K7XFbNva031BSOb56f7BF6f+gPxXBAvPRpy0iNjJUQ+PTUzt50/yEIG1H0B/akDDmCNPFEsV
 Nl5rFqRHEtZYiTMQBE/XShvIqmLYZvF6z2nIJY43bIA2LlPCLt4vXW3LK9Dfq6oyhS+zU0tZfB2
 Iv/xd4ytNaUCMlRnkDnQAPnc61HTnZa3mhg3iSMqLzdpn3cTXV1Vt5aUhSy4Vk0kgvoayeyMMRS
 Df/ZKoc+v67SnGH2mZlUvF9KMbUIX3I9JS+eWqqbgM/NPEbt/uz4fbNmyn8C0q/2rooiKbAMWch
 PCdDuobssNYswB5AwIijM++JoK2R5Nqu3zbxa6vlj8obNA7ufjdxVX5crZRRonsSw5inVfMzRME
 c71RNgpI6eGlKT0QBJISXpq4Vpvgx9Vjn58SimkuUoU8cPpRhiQ2VSPpRBJxtv92zaFEHvWgt2V
 i2saUF1Okybb2RUySAvEw4QB9yHlicNMje1FT27PcG7BtkOnhRwbehLyAexN8nRK+w0SPHaHHb5
 eBN4ZsHAjeyOCew==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series has a few fixes for improving h/v blanking and pixel rate
reporting for the IMX219 sensor.

These patches are picked and modified (and squashed where applicable)
from the rpi-6.6.y vendor tree.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Dave Stevenson (1):
      media: i2c: imx219: make HBLANK r/w to allow longer exposures

David Plowman (1):
      media: i2c: imx219: Correct the minimum vblanking value

Jai Luthra (1):
      media: i2c: imx219: Scale the pixel rate for analog binning

 drivers/media/i2c/imx219.c | 186 +++++++++++++++++++++++++++++++--------------
 1 file changed, 130 insertions(+), 56 deletions(-)
---
base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
change-id: 20241029-imx219_fixes-bfaac4a56200

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


