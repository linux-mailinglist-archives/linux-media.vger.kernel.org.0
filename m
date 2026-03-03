Return-Path: <linux-media+bounces-54279-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CJwMwqppmmuSgAAu9opvQ
	(envelope-from <linux-media+bounces-54279-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:25:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3734A1EBCB3
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01B74309A61C
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 09:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F209338C408;
	Tue,  3 Mar 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dPCYUwwN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88EA301460;
	Tue,  3 Mar 2026 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529868; cv=none; b=aWo0+hhJMEEfQvTpNRzuTMRCO+hYzV2yrVHvVwwXTuNVHIPb48w1vqF9AryZMEMkrBlqFFe2r7HLOG/1D4gmEvlM7k0MAYvBv6jIw52Y44kdCb/7ZLoSiv8iVKi01AFzeNLJ4i3/YMe9ntbEl6LZOiETaScRo6pcLaIK2JtDr68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529868; c=relaxed/simple;
	bh=mtE9LhwDjzWOo08Tq12qxAXlSYCa5cds3sUvd0O+YfY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H6Q3MZgWSsyrxOu2Nk0F5Q1iGnas/60JHBO/KYv8FzbS53Kx2vf2LTCWEIRK1VorQ7fbaXL/pcur3S12pkTZ9GwN7wBDuDGtJAQP3VK8ScZZqYnOnGmB8it96JQltYZqfkIhr3YNkYOv0JSs9Gu0zOq1tCd47xfB8d2khuuLbJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dPCYUwwN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:320d:fec:f64:f37:a9c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA907460;
	Tue,  3 Mar 2026 10:23:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772529802;
	bh=mtE9LhwDjzWOo08Tq12qxAXlSYCa5cds3sUvd0O+YfY=;
	h=From:Subject:Date:To:Cc:From;
	b=dPCYUwwNS5cw3awgH13zYRs5dhJ/l70Qp+sRBhoWDheDLfMby0gPSolcPW7YVoTPe
	 8kZ0tcf5DkhU4lpgQmQ+R6svQni/aKHeUhz5QtTbRGrpBncfx9Dw25qWFcyxJgGLHd
	 2gtCVaZAi9aRUxoVgczb0CNbLnqyAhV15JLNC8AY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 0/2] media: staging: Drop StarFive JH7110 Camera
 Subsystem
Date: Tue, 03 Mar 2026 14:54:05 +0530
Message-Id: <20260303-drop-starfive-camss-v3-0-8f44c07fb137@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWopmkC/33NTQ6CMBCG4auQrq1ppxbElfcwLkp/ZBZQ0iGNh
 nB3CysXxOX7JfPMwsgn9MRu1cKSz0gYxxLqVDHbm/HlObrSDATUQkrNXYoTp9mkgNlzawYiDl0
 bQmODUiBZuZySD/je1cezdI80x/TZn2S5rf+9LLng0GgtfGPaq9R3dN5QHLtokjvbOLCNzfBL1
 ccUFEpdXNCNAN2CPKDWdf0Cp4eRDAgBAAA=
X-Change-ID: 20260115-drop-starfive-camss-2b9ff7cf3321
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2792;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=mtE9LhwDjzWOo08Tq12qxAXlSYCa5cds3sUvd0O+YfY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBppqi2Jtf0C0laLYiI7b170F9zRZn/GbysS/eV6
 YPFBQOE6JyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaaaotgAKCRBD3pH5JJpx
 RbMGEACbHdPhV3M2cmslG8JMR84m9Yg8q1owpG6mK53gjGnJU8luLieZP0UWHAeysFco+w4m/Z5
 RNmOLzRCdASoPN+5D2iauZBC+DNnq3D+QhJn3Z4M5HnzW7bBu3Cs9dYEWNOfbnfxNV3bGlXA1Mj
 TzYLKGzVKQqVNaubvn86yOrXIb7y8g36CXZCb7f7cQe8mIIS/pV+o/9lB97EryURmj/YIjqwbkn
 zXtYed9saLBFNNqA/fGCKwE99JbjqWQt+EI3/b+gG3r+uuXclgaDDUs3kJKTN48kX0zI7UdnS1h
 MiFZmbToIUk4RxeqisnR5E22Wispkq3NqEMGp6xrpl3WcfOJww+1NDIBTTa1O8mL6mSCjTg2HaR
 dKmgP3mfEgWlJhalxdkukD5ojLVByYJ8um7lInl28JvPB7HoW7h4WJ5K4neAkUtCcm/18J+SQUj
 ti0Phy02vW1Nfq9OGzV/Vp4oE2N0Rmt1f5DuJo8zR7enYWdi0MCZ8Lue7hIec4CTG0OyfQFfR/p
 M+YAI6Jd6/KHHr9JLhOoHw8RLoILKTyS2NmmwgJ4m95x4pL3zM9v7r1jQ9vTO+NxpgQ6Co0gA/V
 NfwehsXK/bI6rwILoNYYALmkzlG3U6MjylKzNutSnrfgklkK1DHyt80WiKHy2QFZ4f+gkU5OQz/
 yBuwiSzH263fmWQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Queue-Id: 3734A1EBCB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54279-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

StarFive no longer plans to maintain or develop the JH7110 camera
subsystem for destaging, as discussed in below thread:

https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/

So drop the driver and bindings from staging. This came up while adding
support for streams APIs in Cadence CSI2RX driver, which is used both by
StarFive and TI in their capture pipelines:

https://lore.kernel.org/all/20260114130522.GE25101@pendragon.ideasonboard.com/

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Rebase on v7.0-rc1
- Reorder patches as Krzysztof suggested
- Add Review/Acks
- Link to v2: https://lore.kernel.org/r/20260116-drop-starfive-camss-v2-0-34df57025921@ideasonboard.com

Changes in v2:
- Add Changhuang's Ack on PATCH 1
- Fix PATCH 2 to also drop reference to the starfive camss documentation
  in v4l-drivers.rst
- Link to v1: https://lore.kernel.org/r/20260115-drop-starfive-camss-v1-0-27550e7a9815@ideasonboard.com

---
Jai Luthra (2):
      media: staging: Drop starfive-camss from staging
      media: dt-bindings: Drop starfive,jh7110-camss from staging

 Documentation/admin-guide/media/starfive_camss.rst |  72 ---
 .../admin-guide/media/starfive_camss_graph.dot     |  12 -
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 -
 .../bindings/media/starfive,jh7110-camss.yaml      | 180 ------
 MAINTAINERS                                        |   9 -
 drivers/staging/media/Kconfig                      |   2 -
 drivers/staging/media/Makefile                     |   1 -
 drivers/staging/media/starfive/Kconfig             |   5 -
 drivers/staging/media/starfive/Makefile            |   2 -
 drivers/staging/media/starfive/camss/Kconfig       |  18 -
 drivers/staging/media/starfive/camss/Makefile      |  13 -
 drivers/staging/media/starfive/camss/TODO.txt      |   4 -
 drivers/staging/media/starfive/camss/stf-camss.c   | 438 ---------------
 drivers/staging/media/starfive/camss/stf-camss.h   | 134 -----
 drivers/staging/media/starfive/camss/stf-capture.c | 605 ---------------------
 drivers/staging/media/starfive/camss/stf-capture.h |  86 ---
 .../staging/media/starfive/camss/stf-isp-hw-ops.c  | 445 ---------------
 drivers/staging/media/starfive/camss/stf-isp.c     | 379 -------------
 drivers/staging/media/starfive/camss/stf-isp.h     | 428 ---------------
 drivers/staging/media/starfive/camss/stf-video.c   | 570 -------------------
 drivers/staging/media/starfive/camss/stf-video.h   | 100 ----
 21 files changed, 3504 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260115-drop-starfive-camss-2b9ff7cf3321

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


