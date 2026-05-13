Return-Path: <linux-media+bounces-61468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CW0MlWkBGpxMQIAu9opvQ
	(envelope-from <linux-media+bounces-61468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:18:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C3D536ED5
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 477A7317F470
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F4647ECDC;
	Wed, 13 May 2026 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hsV8Tst3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401F4429831;
	Wed, 13 May 2026 15:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686436; cv=none; b=BJOLTI8OgFhRJKIZtcdLEqPvbYMfDoey/5P/IsjAeSr0eL60bx1f9QctYcg5UqQayY6jTRdikxwVDZlpLGY+lA4RMq2TNfUSckHNQO2pmmz+bs3jrCDuHfhcQxc9WO8R/NigVKiT/1//nlKdrISNBy0ujUwSAJeSydYMEJXcHYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686436; c=relaxed/simple;
	bh=Z+WdKSgxkFGcnZz9MD7h659ul8IMqRhmkbBhJm0Ce4c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m8XvIU4bpd5zHQFHeE9tsV/cehQqr29msAXWZ/DJFtbTjeAlAq59KfsAmaMuBYNNGJtkdqlCvYGb1f+IBMkWhZCyGk6pvpNFLEL9j2/WiN9YzcY0knMDwBKVCJSRZVO9kftF6dNrmbWw+hBNPe9ETwdcaS4L27D64bqZQqPo3NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hsV8Tst3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8831A9A0;
	Wed, 13 May 2026 17:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778686424;
	bh=Z+WdKSgxkFGcnZz9MD7h659ul8IMqRhmkbBhJm0Ce4c=;
	h=From:Subject:Date:To:Cc:From;
	b=hsV8Tst3SvRTWvMKMlJNnyuKsqES25J+Czsw5leKKWU9fM6rKUZJ7FdFyRV/1HUj1
	 rnntl38nJYpmYJtCsVtVN/WdxsjNYG7raBshrD1/TP7TTlRpx0MM3SihkDhuA3VuQ6
	 lU5KU/rb/bEa7Yc61lZhfDgXu/QGol1oUTZrYvMc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/2] media: Add bindings and driver for Sony IMX678
Date: Wed, 13 May 2026 21:03:15 +0530
Message-Id: <20260513-imx678-v1-0-30fc593ed8fa@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0Nj3czcCjNzC13TZMPE1FTLZMOU5DQloOKCotS0zAqwQdGxtbUABFM
 HUlgAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Z+WdKSgxkFGcnZz9MD7h659ul8IMqRhmkbBhJm0Ce4c=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBJnII3+bx/qKFCxtYBJLoWWgB6sbxKIyJmk2A
 vMLfEFTLs6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagSZyAAKCRBD3pH5JJpx
 RZjAD/9h9kB94bMFh7ShDKgyOxMuQYFrvo3GpyXIBqlLvaW9+J4xnBpDHZxeYJ3f93RH3vJWNeJ
 asrWtXTv0QGaqQP3Wx8vKH883b6gGSMg+PNgk49BU2B19kvSJgg0+eowZlxP4m54btymHhsuwOD
 7aREkM4cYX7tKATb3E/DRGGd6Ev0Qhk75Rqao8/8UtmXxqEa6ZcR+lmMdQNs3NHIPqaroKQdeD0
 0E2kN2I/AMLhdMRqwlXlXkGQuL1YuWIEd9dOqv+OEYR1lKw93qispsiLC/3+inHA6SYcz6f2rdD
 a96JwZAyZQhFAjvWdHLPLjMm11im4myRcZiT0+xTOD6UEmm/RhM7A+j7uTa6/c2kV7exVTTSrtv
 cSAEd3M7uSok2g66P3D5RcshBdZ6WGHYNXnEfL8iuU9FkL7DtULvQeMClS4INMVVmB+dO14e0bv
 /KuaqOxLmkdXba+jGUyhhJF1AtP3Z7m+2hk+DNdrAgLg/yJ8gVjhWqBTCF3z7lTpo2k1KZgphqo
 sY3dm11kfzAsk4woOnwvz9GIhEVt2J6ADM0Y6bEI6dnpDvkl8x3FjirAStiFZvZ66hGTaVYl1Vt
 Y/vVO/7yMGtEZ8Ah0oS0EQ1wf77KYQrDJ+u8uyIIGaBZ9JtdpZa5ETP73t4kTDrjskXCPYxw3tB
 XBSeiti2nCCQxhg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Queue-Id: 51C3D536ED5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61468-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

This series adds dt-bindings and a V4L2 driver for Sony IMX678 camera
sensor.

More details about the sensor and features supported in the driver are
in the relevant patches.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (2):
      dt-bindings: media: i2c: Add Sony IMX678
      media: i2c: imx678: Add driver for Sony IMX678

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |  121 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   10 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx678.c                         | 1466 ++++++++++++++++++++
 5 files changed, 1606 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260513-imx678-5c1aee9c1dcf

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


