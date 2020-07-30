Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35702233BA8
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbgG3XBo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:01:44 -0400
Received: from mail-co1nam11olkn2083.outbound.protection.outlook.com ([40.92.18.83]:35942
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730610AbgG3XBm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:01:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD+0iIbgh1eYQpHJX3mzdzvZAx7DwArgubVwZFRJHLSoFZ4cKJR0lVaya+47VuaonsEsbonq8E22EFozDnifDbQMW/dlg58/Zk15zGRE/zgJYOkzbQlzdv26d+Padk4iHbqysGsmecw7VBG4RJGwi2rQ8ck6aEHEkWcHiZp57S/mk8BOle1vc/FpyHZDAVw5vGaJKoaER9etuhEBqLMu3IigdsdW9BnTg+yZekfrxvQ6vfx25UVRw9iblFaqIA3zFgfmTkNGr6TOPRs27jP4PEJw3ml1FOOv36Ord8U6aVaayKXhsaXYp5ekWemrpTiajNt5UEKnxt5LxWMs0uoIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYmyJfbB4VF03PXNJyvPQAahA08y1lJrt+63k1cFpHs=;
 b=k26D0l/32cPepE5AZJGY09b+yBbZucseylGeLBfCAJlRWSqCJ6iahkLT4uKiAw2wK1AkpkMk/8e8gUW4/eT9z98xmCOZTNZxoBfwHRyHJf9hHrFcEj+BjrBPXZcZfb+re2gQiKQzUtCGAOLCKirC5s4EUG/RPTqM54gwocF4jVdfch3bgkHnxe3G2iL5JKgKLF9i4Si0OP1O+X0AUcUjdF9WraojWmqB1ZT7O+qCqoVnecNQDQiDXwP/BnhhF95MwFxCfVWgYgfES6A+/tRV4tSzLIt9WibesfpZvmX/Zq7IREbNRe0w5okhyRQ0puraVrSoBSF2pgveW2eIYqf5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::45) by
 CO1NAM11HT062.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::166)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Thu, 30 Jul
 2020 23:01:40 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:01:40 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:171F1716801CAD2D10A28976D4A85B9EC71DD0B5F9A54245637D9526E1032E47;UpperCasedChecksum:3D125C7109105836F605C852441C33ED7782E6CAB6AAABA84BDB5F66E3B7072D;SizeAsReceived:7773;Count:47
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:01:40 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH v2 00/11] media: exynos4-is: Improve support for s5pv210 and parallel ports
Date:   Thu, 30 Jul 2020 16:01:03 -0700
Message-ID: <BN6PR04MB06603B2CD7F2C56B322AF882A3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-1-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:01:37 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-1-xc-racer2@live.ca>
X-TMN:  [pailsOlHjt+Hg0FBEYXdHMlKY58wxOVDSA0IDVEN5Pz5r4PiRio0uMr/hS/GLZuR]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 025a4cd9-072d-4f5a-92bf-08d834dc8486
X-MS-TrafficTypeDiagnostic: CO1NAM11HT062:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UBs2JE/DEStf6gE5/lPYdIZI4S15Y/9tnvtdotskIN8ijbsgEV2na5cNeIOap08qnmfo+UiO+TOsaQL+cT5/0sMs1wHih1jpP9DcIm3s0laEyyXudF8DAYKwHCc6zZiU9C655d0YC2nfQkGYG5jBoE0sn3OkD+qhS+NKqjaIhSwRaWdHrsT70BV5QI58+4DQkSKjGBwhAJ+euOjRHigyAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: N/Kmrb0PLdShRTv8w9JoluVgMeCP67+41T/Ys1aTiIzjWBQ5o6Ca10SJpCpjMsfMKBLob5wVwRrCBaE122vhpAxNYpg1k6uMKHjpYA2pVCLf2neqm+EcE0k7I69WGuVfqTxirc8Uzo/koTvUFl2NKzhfeusmldyCyb0eJ9fD+WMuU61lsKru8tLuVbN2qb0OuFQkCVgNOy2wm/hV35EZBw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025a4cd9-072d-4f5a-92bf-08d834dc8486
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:01:39.9654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT062
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset improves support in the exynos4-is driver for s5pv210
platforms as well as for sensors connected to the parallel ports
and not using the CSIS device.

Fixes range from nullptr exceptions to probe fixes to JPEG fixes.  The
binding doc is changed to match what is implemented in the driver and
in the Goni DTS (the only in-tree user).

Some patches cleaning up non-DT support are also included.

The patches have been tested on a first-gen Galaxy S GT-i900M device based
on S5PV210.  Two sensors (CE147 and S5KA3DFX, both with non-mainline
drivers), both attached to port A, were succesfully used.

Changes from v1:
- Added R-b tags
- Changed entity function initialization to not remove any
- Cleaned up some commit messages
- Added patch cleaning up the counting of sensors
- Separated parsing of multiple sensors into a separate func
- Match DT documentation to driver rather than modifying driver

Jonathan Bakker (10):
  media: exynos4-is: Remove static driver data for S5PV210 FIMC variants
  media: exynos4-is: Fix nullptr when no CSIS device present
  media: exynos4-is: Correct missing entity function initialization
  media: exynos4-is: Properly set JPEG options for parallel ports
  media: exynos4-is: Use global num_sensors rather than local index
  media: exynos4-is: Add support for multiple sensors on one port
  media: exynos4-is: Remove inh_sensor_ctrls
  media: exynos4-is: Remove unused struct member input_index
  media: exynos4-is: Handle duplicate calls to vidioc_streamoff
  dt-bindings: media: Correct samsung-fimc parallel port numbering

Tomasz Figa (1):
  media: exynos4-is: Request syscon only if ISP writeback is present

 .../bindings/media/samsung-fimc.txt           |  6 +-
 .../media/platform/exynos4-is/fimc-capture.c  | 21 ++----
 drivers/media/platform/exynos4-is/fimc-core.c | 67 ++-----------------
 drivers/media/platform/exynos4-is/fimc-core.h |  5 --
 drivers/media/platform/exynos4-is/fimc-reg.c  |  7 ++
 drivers/media/platform/exynos4-is/media-dev.c | 54 ++++++++++-----
 6 files changed, 60 insertions(+), 100 deletions(-)

-- 
2.20.1

