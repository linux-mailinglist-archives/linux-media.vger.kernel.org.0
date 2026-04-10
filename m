Return-Path: <linux-media+bounces-58505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDKfIJa92GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:06:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F19A63D47C0
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFBEF30120FC
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1333B3BEB;
	Fri, 10 Apr 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="coAxue5Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB84C3A5E7E;
	Fri, 10 Apr 2026 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811987; cv=none; b=S/PaqxWIFm24FA/i68x/XDqKUyCCIAqbflQ0L6Vh9y4BSjHaCNtjeIarPnK8nNR5/aDXcbWzEdInuj9N4npWJnB29LEAIS2cSmlL5icxiyPVpWIOuP62An4hsjvmfLN4Ys94FLxLNMOjB+0OgieMLXX9cQGvahmYzFEVO/TUyzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811987; c=relaxed/simple;
	bh=xXIeQ5K5+JBXyCZxz1kHIqBW1W0xFYyroHZrGSokS3U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ITx+XFmzU4oOFbUp9awGCypMqqrWKODOXnTcTcqjATVPz6bOm29dZ2y5Nq5aVWLw2EcjFMXRxzXjFSU/2YANRfNIVWRuxZmERtzp9Dz7WjOaWFWOvPMkW+ST9aR8m5A0CU4OrAXztaIx3qjbJWoKKtjWDBkfhgLbW9Eb8FLhHFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=coAxue5Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07AD31C6;
	Fri, 10 Apr 2026 11:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811894;
	bh=xXIeQ5K5+JBXyCZxz1kHIqBW1W0xFYyroHZrGSokS3U=;
	h=From:Subject:Date:To:Cc:From;
	b=coAxue5Z9lfz6EkhFQ3DUXqqIx1a7JrHjWJ2pRIq5kT6phqGV7RAUe1BezUJmRyMm
	 0k/SBctO2oXy3sFNWaIvI2bP2WjNxLgDWsCij5u2G8jyprnkc3FipgskRF+JggQtcf
	 S9TTrZoJ7CuiwqdTkABEZR3UV41fN+HdfW5IjX7Y=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Subject: [PATCH v7 00/18] media: Add support for R-Car ISP using Dreamchip
 RPPX1 ISP
Date: Fri, 10 Apr 2026 14:35:35 +0530
Message-Id: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF+92GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0MD3aKCggpDXUtDo0SDtGRDI1NLSyWg2oKi1LTMCrA50bG1tQCzsvC
 hVwAAAA==
X-Change-ID: 20260410-rppx1-912a0fc12599
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7776;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=xXIeQ5K5+JBXyCZxz1kHIqBW1W0xFYyroHZrGSokS3U=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L13V/xgjRdbWwyxJiD+n082unz7SEk7cqoFD
 Zldd/GXtlaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9dwAKCRBD3pH5JJpx
 RXCgD/0YDVf4lx9YFUHh7PqNvECcrY2JiUlgbfvfHOnWT4AuKZ0fa+Jf7NXQ+K7UsDVnkNWkUXY
 xS7xxTMb+eunY0StvQFUTE8VdZsNtqB523ydA2B6ETthoKhTFq9waBgD8aiB3DTAcfO3afhKjzz
 yWazKapONUOTf8320jzGiAyi0i/l3fI1f31m2Q5K7k0TLN2XEhXrGzQC5IUtPoQObPg4xdmCSrH
 inYYglC7LKIgQmzw7vspw9iAU/pBPnsjHMwxWg7bmyBZ1BTGCbPU57miqdp2f2UWRZkEoj2jIlX
 rmP6P8ZCSOCYYq1l6OpycRU/UXtF1sm5TGbo3BIZYJ+ine5u2JxJCIuKK6g8rtrp1P/fJzcfye4
 7rEIzN5YvIXI2uK/FfgYXstzU3rFWbyaCri9bd41zVrLcfXDlS11Zdk99ExNsXm5CScRlOSs1pB
 t/BzRfzGW4ZJ4IdTRtpBOkiKmyDyfGbO1wXeuV27fXLwjyQB12wIeOz0agVTVOmyBsICCYRvmzb
 7K2NTZm4Qj3WvYsouICuHaZBtNmb6SJTeenzb9emv9SoGjuRiOzpHYuqCExcB0rcIQPdEMoQ6FY
 nX00AhyP+bmNM8iQo1m3DMPLEaFllIszUNxXxVnJI58VRHlN4jLAzq035CvGg27gh+mnMe2PEXU
 Q3SmDvD2L3mWi8g==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58505-lists,linux-media=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,ragnatech.se,glider.be,gmail.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:mid,ideasonboard.com:email,ideasonboard.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F19A63D47C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

This series adds support for two different devices that together enable
ISP support on Renesas R-Car Gen4 ISP processing. The first driver added
is for Dreamchip RPPX1 ISP, this device purely deals with image
processing algorithms, statistics and image conversion; but have no DMA
engines. The second driver is for the R-Car ISP CORE, this device
deals with DMA to/from the RPPX1 ISP and provides a V4L2 user-space
interface for the ISP.

The R-Car ISP driver uses the RPPX1 framework to drive the ISP and
together the two devices provide a functional ISP. For detailed
description of the RPPX1 see patch 3/18, and for details about the
R-Car ISP see commit message in patch 4/18.

All functional blocks present on the RPPX1 are not yet added to the
driver, but most are.

The RPPX1 ISP is similar in design to the RkISP1 already supported
upstream. The primary difference is around pipeline logic, and higher
precision configuration and statistic values supported by various
blocks. Along with that, there are some new features or minor
differences here and there.

Thus, this revision defines a completely new uAPI and buffer formats
from RkISP1 for RPPX1. See patches 1/18 and 2/18 for more details.

Patch 1/18 adds metadata formats for RPPX1 params and stats

Patch 2/18 adds the uAPI for configuring RPPX1 using V4L2 extensible
parameters

Patch 3/18 adds the foundation for the RPPX1 framework. It deals with
probing all function blocks making sure every blocks version register is
supported and setup a "passthru" pipeline that just debayer RAW images.

Patch 4/18 adds the R-Car ISP CORE DMA parts and integrates with the
RPPX1 framework.

Patches 5/18 to 18/18 extend the RPPX1 framework with the logic to
drive the different ISP modules.

For testing this series with the new uAPI, you can use this WIP
libcamera branch, which has mostly copied over the RkISP IPA and thus
still tuned with lower precision values but shifted to match the new
uAPI:
https://git.ideasonboard.com/renesas-v4h-isp/libcamera/commits/branch/jluthra/rppx1

Future revisions will add support for extensible statistics once the
design is finalized, currently WIP here:
https://lore.kernel.org/all/20260123080938.3367348-2-antoine.bouyer@nxp.com/

Changes in v7:
- Add new uAPI, parameter and statistics formats for RPPX1, no longer
  reusing RkISP1
- For each module:
    - Switch to RPPX1 uAPI
    - Support native precision for params and stats
    - Where module can support different precision for params depending
      upon the instantiation in hardware, use the biggest value for uAPI
      and scale it down in driver after reading the relevant hardware
      register
- EXM: Add [SQUASH] patch that supports changing the measurement point
  for AE stats, allows configuring the coefficients, and RGB input mode
- HIST: Add [SQUASH] patch that supports changing the measurement point
  for Histogram statistics
- LSC: Add [SQUASH] patch for describing full lens grid instead of only
  one quadrant
- Add support for Sensor (Gamma) Linearization module
- Link to v6: https://lore.kernel.org/all/20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se/

Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
Jai Luthra (6):
      media: Add RPP_X1_PARAMS and RPP_X1_STATS meta formats
      media: uapi: Add extensible param and stats blocks for RPPX1
      [SQUASH] media: rppx1: exm: Expose coefficients, RGB mode and channel selection
      [SQUASH] media: rppx1: hist: Expose channel selection
      [SQUASH] media: rppx1: lsc: Make full lens grid programmable
      media: rppx1: Add support for Sensor (Gamma) Linearization

Niklas Söderlund (12):
      media: rppx1: Add framework to support Dreamchip RPPX1 ISP
      media: rcar-isp: Add support for ISPCORE
      media: rppx1: Add support for AWB measurement parameters and statistics
      media: rppx1: Add support for AWB gain settings
      media: rppx1: Add support for Auto Exposure Measurement
      media: rppx1: Add support for Histogram Measurement
      media: rppx1: Add support for Black Level Subtraction
      media: rppx1: Add support for Color Correction Matrix
      media: rppx1: Add support for Lens Shade Correction
      media: rppx1: Add support for Gamma Correction
      media: rppx1: Add support for Bayer Demosaicing
      media: rppx1: Add support for Bilateral Denoising

 MAINTAINERS                                        |    7 +
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/dreamchip/Kconfig           |    3 +
 drivers/media/platform/dreamchip/Makefile          |    6 +
 drivers/media/platform/dreamchip/rppx1/Kconfig     |   12 +
 drivers/media/platform/dreamchip/rppx1/Makefile    |   33 +
 .../media/platform/dreamchip/rppx1/rpp_module.c    |   40 +
 .../media/platform/dreamchip/rppx1/rpp_module.h    |  155 +++
 .../media/platform/dreamchip/rppx1/rpp_params.c    |  122 +++
 drivers/media/platform/dreamchip/rppx1/rpp_stats.c |   30 +
 drivers/media/platform/dreamchip/rppx1/rppx1.c     |  338 +++++++
 drivers/media/platform/dreamchip/rppx1/rppx1.h     |   99 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_acq.c |  147 +++
 .../media/platform/dreamchip/rppx1/rppx1_awbg.c    |   62 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_bd.c  |  202 ++++
 .../media/platform/dreamchip/rppx1/rppx1_bdrgb.c   |   80 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c |  169 ++++
 drivers/media/platform/dreamchip/rppx1/rppx1_cac.c |   29 +
 .../media/platform/dreamchip/rppx1/rppx1_ccor.c    |  173 ++++
 drivers/media/platform/dreamchip/rppx1/rppx1_db.c  |  126 +++
 .../media/platform/dreamchip/rppx1/rppx1_dpcc.c    |   76 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_exm.c |  126 +++
 drivers/media/platform/dreamchip/rppx1/rppx1_ga.c  |   83 ++
 .../media/platform/dreamchip/rppx1/rppx1_hist.c    |  249 +++++
 .../media/platform/dreamchip/rppx1/rppx1_hist256.c |   46 +
 drivers/media/platform/dreamchip/rppx1/rppx1_is.c  |   42 +
 drivers/media/platform/dreamchip/rppx1/rppx1_lin.c |   91 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c |  187 ++++
 drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c |   48 +
 .../media/platform/dreamchip/rppx1/rppx1_ltmmeas.c |   41 +
 .../media/platform/dreamchip/rppx1/rppx1_outif.c   |   45 +
 .../media/platform/dreamchip/rppx1/rppx1_outregs.c |   75 ++
 .../media/platform/dreamchip/rppx1/rppx1_rmap.c    |   64 ++
 .../platform/dreamchip/rppx1/rppx1_rmapmeas.c      |   47 +
 .../media/platform/dreamchip/rppx1/rppx1_shrp.c    |   64 ++
 .../media/platform/dreamchip/rppx1/rppx1_wbmeas.c  |  179 ++++
 .../media/platform/dreamchip/rppx1/rppx1_xyz2luv.c |   26 +
 drivers/media/platform/renesas/rcar-isp/Kconfig    |    2 +
 drivers/media/platform/renesas/rcar-isp/Makefile   |    2 +-
 drivers/media/platform/renesas/rcar-isp/core-io.c  | 1017 ++++++++++++++++++++
 drivers/media/platform/renesas/rcar-isp/core.c     |  826 ++++++++++++++++
 drivers/media/platform/renesas/rcar-isp/csisp.c    |   46 +-
 .../media/platform/renesas/rcar-isp/risp-core.h    |  170 ++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/media/rppx1.h                              |   33 +
 include/uapi/linux/media/dreamchip/rppx1-config.h  |  779 +++++++++++++++
 include/uapi/linux/videodev2.h                     |    4 +
 48 files changed, 6198 insertions(+), 7 deletions(-)
---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20260410-rppx1-912a0fc12599

Best regards,
-- 
Jai Luthra <jai.luthra+renesas@ideasonboard.com>


