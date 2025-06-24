Return-Path: <linux-media+bounces-35772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F39FAE6528
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECA39188A5DD
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF995291C08;
	Tue, 24 Jun 2025 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PfOa3l91"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DE227A913;
	Tue, 24 Jun 2025 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768572; cv=none; b=QL7TrN63MJVMZ2YAJUVnlRC1rt5tqVtdx9zvQFRXZ3D74wII2lEPpX2XDJ/+sIyTz+Yt+5j3MFCEe8grTRxWIvZiSmVvSXUntcdcZL9FYnmojSJDmE4vfv05ecA2rdlSqdWiyPPQ31mmo2CaHTlJiUVMMA382fHgXY8sV/onydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768572; c=relaxed/simple;
	bh=ud89OFlq8Us9+ydGvsZ6QhMLLYbGqlgQJvRBMujxdN0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FjcbI/xz+b/8I9rG3wOJd9O8zoOad8Z7pS0/UlxtRTRhZWfeasQXP64P2BO5//XYtDbNxh5nzbWefrDkonfQEuKO9zzzUBhK9ECoSDsQiMuhWgpGLS/i3hfAauXAQCw/FG3Hlo44Y/hiQCYtJRQzQcZMxjgw3VyYxvQZJUbchUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PfOa3l91; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3686C72;
	Tue, 24 Jun 2025 14:35:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750768551;
	bh=ud89OFlq8Us9+ydGvsZ6QhMLLYbGqlgQJvRBMujxdN0=;
	h=From:Subject:Date:To:Cc:From;
	b=PfOa3l91G99JDuYOqphh2WfBESVWM+brr90PWPPeo86fuO9CL+hdV8qpySdp0dTW9
	 fJHBELsJIBd9/QX0ZjBE3CSO3WPvCvnzmiSDuHAl+CLxy/Kh+7zh0a+yqZ+pnDItYQ
	 QtjFq/339Ug5+JMtcT3uD7f+QlAGNBeb0Ijx0cKc=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 0/3] Add Input Video Control Block driver for RZ/V2H
Date: Tue, 24 Jun 2025 13:35:57 +0100
Message-Id: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK2bWmgC/3WPy07DMBBFf6Xymon8GjvOiv9AXfjZGiUx2GkEV
 P13LIoEC1hezT1Xc66kxZpjI9PhSmrcc8tl7YE/HIg/2/UUIYeeCaccqeIS8u5hFCJwKbRiSpP
 efKkx5bevladjz6mWBbZzjfaHRWaYRI1ykCgpRWAQ7Do0b+f5/TGHaFtZXbE1DL4s36s1vl76S
 9t9mjjbIvTrkrfpwAzX3AltrUyj8Ba5C8l4pgKGkbkQmEApjSS/VbrZXURA/TjxGXy9gPbdRTP
 rqOfTjv8BSwzZwnNxDVQSyRglqBJ+2vnfhASPCE54oRyPLIy9yig53m6fX0b3qHYBAAA=
X-Change-ID: 20250624-ivc-833d24376167
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4821;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ud89OFlq8Us9+ydGvsZ6QhMLLYbGqlgQJvRBMujxdN0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWpu2s770ghA4fUqhGMCx6Ye+PQZ84gM0zW25H
 VVKboR1Jw6JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFqbtgAKCRDISVd6bEV1
 MmVND/9yONclVrUfmbjD/eZ8RwlPHiaCCtMTS58IFSfi22hlWCFBeCDHyENuYSrcKcOeRB8011h
 GmM0w27Yb9FokS34aoYFMByKjBoXbvtS7BTUbvcb6hyU0HowZlyUaNe+Fk3wmcLtTekZHnB+Yfy
 AX1leVCHeaIykbtObqmTXqOc3+3PVuGOUrKovB+PARVuAgBN+X8u1scbY2hDWU9IC2zG2O2rdgo
 zZu+aW6MxtZPhfXX58ysY5cuAo28/O8XqGI+2nEaRcMehLfp8Qg6e9rUbvg9bs1oeyZ1GAWD+N7
 UyD84IwdpP9GkMyOoGkDeySgn+cBNgfwAjeG5E053eugO+Jyckmvh8vP2uG90VwMCzx0jptCcNK
 SpimA6SSSO0Mvhz1DI0j+pufp5XhEH1P6o0bC24bfFtBDG376SU/7ZAPOjckPkeTEWaTxMr2qWu
 HjhYoz/ikWMu/fsZZiDbOyInKwo31Aj3HvZTxof3Ff1C/p0obPPfJQzhl35w3yMYM+hi6OPI76n
 myDiwg3mFfxSXmt04+VXVOJnaEmWh0mZx1dSm87eIdKxgoKNbTttkZDUV2KdMek/lrCExIn/fgE
 pL0JpJJCdMvhvOQJnm7Cotj4vSe1weqGE04saRMFFa2sv1+tbAohDsasvf59Wc56tLUxmZr7A/p
 xjCCeoQXfWJY9pA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hello all

This series adds a driver for the Input Video Control Block in the
RZ/V2H SoC. The IVC block transmits input image data from memory to
the ISP core (on this SoC, a Mali-C55 ISP). The driver registers an
output video device for userspace to queue image buffers to. One
noteworthy feature is that - because it is not a part of the main ISP
drive - the IVC driver also registers a subdevice, which connects to
the media device created by the ISP driver through the usual v4l2
async framework. This requires delaying the registration of the video
device until the .registered() callback of the subdevice, so that the
struct v4l2_dev pointer the subdevice connected to can be set to the
video device.

To facilitate communication between the ISP driver and the IVC driver
we use the new media jobs framework that was posted recently [1]. The
series is also based on top of the latest version of the Mali-C55
driver [2] and some updates to rzg2l-cru [3].

Note that this is not quite ready to merge, as there's an outstanding
bug that sometimes causes the driver to hang. The device should fire
two interrupts per frame; once on completion of data transmission and
once on expiration of the blanking period. The second interrupt seems
sometimes not to arrive, and at the moment the problem is worked
around with a timeout in rzv2h_ivc_send_next_buffer(). We're working
on that issue, but because the driver lends helpful context to the
media jobs and mali-c55 series (and is probably otherwise ready for
comment too) I wanted to post it.

Thanks
Dan

[1] https://lore.kernel.org/linux-media/20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com/T/#t
[2] https://lore.kernel.org/linux-media/20250624-c55-v10-0-54f3d4196990@ideasonboard.com/T/#t
[3] https://lore.kernel.org/linux-media/20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com/T/#t

---
Daniel Scally (3):
      dt-bindings: media: Add bindings for the RZ/V2H IVC block
      media: platform: Add Renesas Input Video Control block driver
      MAINTAINERS: Add entry for rzv2h-ivc driver

 .../bindings/media/renesas,rzv2h-ivc.yaml          | 103 ++++
 MAINTAINERS                                        |   7 +
 drivers/media/platform/renesas/Kconfig             |   2 +
 drivers/media/platform/renesas/Makefile            |   1 +
 drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  15 +
 drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 237 +++++++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 379 ++++++++++++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 678 +++++++++++++++++++++
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 133 ++++
 10 files changed, 1560 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250624-ivc-833d24376167
prerequisite-change-id: 20250623-rzg2l-cru-7c43771ab0c2:v5
prerequisite-patch-id: 13afcc3f1921d6357cb2d1107945b2d463ee7c88
prerequisite-patch-id: ff9cfd027783e4943f1281d793dcaf447964c724
prerequisite-patch-id: a8de5362397c6a4b1d8f43acb123ebbdc4102192
prerequisite-patch-id: df748b118c52fd426b2701079da8fc0001a71807
prerequisite-patch-id: a90c6c67405fc348afee8e5b706a868f34838ff8
prerequisite-patch-id: 0432fd246e55b5cee5c9466c86929ff2fc4388e4
prerequisite-change-id: 20250623-media-jobs-6f3f9963063c:v2
prerequisite-patch-id: 0852507344c44fcf4fa3d2a831c01ab23b9dcffb
prerequisite-patch-id: 039d718b90b570bc4c2766b9da20db9e6bdb5c9b
prerequisite-patch-id: 78e666f180a0650b8ddcdaad933c886d095c8a4c
prerequisite-change-id: 20250624-c55-b3c36b2e1d8c:v10
prerequisite-patch-id: ecc5483454fc52289c093e711d5423e1cdd8bc3b
prerequisite-patch-id: 1aea6316a2a4a7b56316dbef3ca6034de6ec1672
prerequisite-patch-id: d4b1a5d9a111ebabc6d7c6a14975c361347ae237
prerequisite-patch-id: e9aa66a8455fc64be546098dcb0573567ca0a389
prerequisite-patch-id: e3d958df2440718af06d00ba377126fd9179db1b
prerequisite-patch-id: f5b45201442182e653991c1d83d70408cfa8e15c
prerequisite-patch-id: 7ce6b20a0536b6082c0a7ae087202be1bfa140cc
prerequisite-patch-id: dff49267a0db686172ae90cee86ad82af985b292
prerequisite-patch-id: 8b5b0ff8043abbe1eb15c005697a91171365e272
prerequisite-patch-id: 67c6aaf1985cc437c3a82ab88e1b5fbd14bb0737
prerequisite-patch-id: 09c97e68cbd196d71d289ba2ee71ad6752f7f03d
prerequisite-patch-id: f450563b57238d7a3984615265ef716de8a58379
prerequisite-patch-id: 21c8172febed94fe2c42598c927d474574f36b78
prerequisite-patch-id: 8f4c5c8f7aca170aa951b0ce02a6720a47a231da
prerequisite-patch-id: 84e105b37245734f9c424d9a0dc4df1401a6315b
prerequisite-patch-id: b4aee35d1fa86fd955dde9aab38d1537aa0beb67
prerequisite-patch-id: 179d60e0accb732eda19e9c36687fb42b5488207

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


