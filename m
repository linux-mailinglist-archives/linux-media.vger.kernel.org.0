Return-Path: <linux-media+bounces-40408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8366DB2DD2D
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7578A626BCA
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A6331AF1F;
	Wed, 20 Aug 2025 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mVmJgllu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43B321ABB0;
	Wed, 20 Aug 2025 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755694705; cv=none; b=SERV65+28F7ciiJ9gFHLG8moT1uooJyu5Cb+TrkFeTXrjS+cDuTSih6IikzUCe8u6PCJ3reKjNfoVrwfsBGi0lIAM9m5vvByCHYCFsECSnWXJsxEC6QqUEjJ3Ln153GWVys1F1Ppp6mym7XVIoR/A8K5Vc2pY8009ZHTAbw9eS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755694705; c=relaxed/simple;
	bh=VlqmzQIwlpXikjkPlKR2I94E0UF92cGjx+1RjdvBpNE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=etoovXvbbpZ3FaTihRe4SNzXe36yMYWXvz471uDgAVZrOjCG055dlvOvWsZbKll2lK5XAK3VqpQqPtugbSSmMTlp84DnIxMwPDBJGhRdpPHZ8VhuA0DCDWMr8nYWOqfGDPH+jp8WKjK5VWDE/yfhfQ0jW1nfoJwEFddTHm2uP1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mVmJgllu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-62-213.net.vodafone.it [5.90.62.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0872D606;
	Wed, 20 Aug 2025 14:57:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755694642;
	bh=VlqmzQIwlpXikjkPlKR2I94E0UF92cGjx+1RjdvBpNE=;
	h=From:Subject:Date:To:Cc:From;
	b=mVmJgllukzJ3Ydpfpwxg/TvXR/NvDxrNVKFfjL2tNpxwTD+hzus12wR8OxtKf44Ku
	 VpSTqkHstjnzY2vkY0bMAZ3b+mz8UnKXZWdBPRbM/yanK8o5MjTF1o51asQCw9ip8q
	 capxP6aMKBTiZgx7I0crcEFWpulIbyxY5BWP50wo=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 0/8] media: Introduce V4L2 extensible parameters
Date: Wed, 20 Aug 2025 14:58:08 +0200
Message-Id: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGDGpWgC/43OQWrDMBAF0KsEraswkmwkd5V7lC7k0TgZSCwjG
 ZESfPfKhtIsEpLl/zDvz01kSkxZfO5uIlHhzHGsofnYCTz58UiSQ81Cg27BgpJ0nWnM3J9JTj7
 5C82Usiz+zMHP9ViiM2qwQ4sIvajMlGjg6zbx9V3zifMc08+2WNTa/uHuNV6UBNkNqC12aLXDA
 wfyOY599CnsMV7EulH0navgDVdX1xK6TjnCpjFPXPPvOtW94Zr134AAzjSuN/DAXZblF5k+wLi
 HAQAA
X-Change-ID: 20250701-extensible-parameters-validation-c831f7f5cc0b
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4506;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=VlqmzQIwlpXikjkPlKR2I94E0UF92cGjx+1RjdvBpNE=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBopcZqUP+v3qfQ5FclgFKcqD43UIEUAG31vkvJN
 rGPW1wA/wWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKXGagAKCRByNAaPFqFW
 PH02EAC1yWqE4Nlz0JR90TvILx72evh+0j7AALA8vxr+1ExEf59SPPC2FYd5DtNPalD//lzl/bx
 75GcgK4U+Xi66oM/0TGx4Ms2++KYks2wgtGia9wimmSQNnuFVlPHI/xYcPDTzeBk+ipN6xIjnxK
 vLmxv2PCGDvj2orNy/MMMhZDkqv3hNmy+0RC+BE8be9uFzUm/hRA4YmdSOfH0a7kmbfgCEh4UBz
 rSzl0tFZQveJYFHsgmC6evbxckKV2TR0QmYlZOozwVvvvHlsh0U/0NQSVfo2jolqAEWWBzzkOKH
 AZuI1OZv5Jym8YCErk7MP6YCJqtFfhiUDI00LBHfOheLt5fmCDjFzyn5O+2Eij36o2VWgmn60f5
 KbZnmdlCH9h25fFH76Fqa2lYGaFZJHPzygIDCO8M8J3HZipN57wBTY9saU8BXI7ojNoEDTxf0n7
 vFpF6BiTBzA6qL4Dc4MX+DZ0gK2VuNuyvyR3v1LrHgAA83f3yp/K/vcLoKOz4X94ePuOn92e2UU
 fOF+EQOl+rt2OuEX2V00Lphc6llPIs06P/+Omq5f+wVAXrzT1hdrluEaYsZGpxhKavkI0u2ycUv
 q1x4AWL4/G4fcoHBvPER5P03MdAogt3MJOVrqQxgasi81DoQ3KHk1t0U2f/LOJKeoMCHGXz419e
 tH2Jo5Hc8TIr0AQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Extensible parameters meta formats have been introduced in the Linux
kernel v6.12 initially to support different revision of the RkISP1 ISP
implemented in different SoC. In order to avoid breaking userspace
everytime an ISP configuration block is added or modified in the uAPI
these new formats, which are versionated and extensible by their
definition have been introduced.

See for reference:
e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
6c53a7b68c5d ("media: rkisp1: Implement extensible params support")

The Amlogic C3 ISP driver followed shortly, introducing an extensible
format for the ISP configuration:

6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")

with a very similar, if not identical, implementation of the routines to
validate and handle the ISP configuration in the ISP driver in the
c3-isp-params.c file.

fb2e135208f3 ("media: platform: Add C3 ISP driver")

With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
a third user of extensible parameters is going to be itroduced in the
kernel, duplicating again in the driver the procedure for validating and
handling the ISP configuration blocks

https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/

To avoid duplicating again the validation routines and common types
definition, this series introduces v4l2-params.c/.h for the kAPI
and v4l2-extensible-params.h for the uAPI and re-organize the RkISP1
and Amlogic C3 drivers to use the common types and the helper validation
routines.

If the here proposed approach is accepted, I propose to rebase the Mali
C55 driver on top of this series, to use the new common types and
helpers.

I have been able to test this on RkISP1 but not on C3.

Thanks
  j

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v4:
- Fix the definition of V4L2_PARAMS_FL_PLATFORM_FLAGS
- Add __counted_by() attribute to the data[] flexible-array member of
  v4l2_params_buffer
- Minor style change
- Link to v3: https://lore.kernel.org/r/20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com

Changes in v3:
- Rebased on latest media-committers/next
- Take in Dan's suggestion in block size validation
- Documentation minor spelling fixes
- Link to v2: https://lore.kernel.org/r/20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com

Changes in v2:
- Make v4l2_params_buffer directly usable
- Centralize ENABLE/DISABLE flags definition and validation
- Take in Dan's v4l2_params_buffer_size()
- Allow blocks to only contain the header if they're going to be
  disabled
- Documentation fixes as reported by Nicolas
- Link to v1: https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com

---
Jacopo Mondi (8):
      media: uapi: Introduce V4L2 extensible params
      media: uapi: Convert RkISP1 to V4L2 extensible params
      media: uapi: Convert Amlogic C3 to V4L2 extensible params
      media: Documentation: uapi: Add V4L2 extensible parameters
      media: v4l2-core: Introduce v4l2-params.c
      media: rkisp1: Use v4l2-params for validation
      media: amlogic-c3: Use v4l2-params for validation
      media: Documentation: kapi: Add v4l2 extensible parameters

 Documentation/driver-api/media/v4l2-core.rst       |   1 +
 Documentation/driver-api/media/v4l2-params.rst     |   5 +
 .../media/v4l/extensible-parameters.rst            |  89 ++++++
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 MAINTAINERS                                        |  10 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 263 ++++++----------
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 349 +++++++++------------
 drivers/media/v4l2-core/Makefile                   |   3 +-
 drivers/media/v4l2-core/v4l2-params.c              | 126 ++++++++
 include/media/v4l2-params.h                        | 164 ++++++++++
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  48 +--
 include/uapi/linux/media/v4l2-extensible-params.h  | 146 +++++++++
 include/uapi/linux/rkisp1-config.h                 |  67 ++--
 13 files changed, 817 insertions(+), 455 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


