Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E0520C737
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2020 11:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgF1JZL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jun 2020 05:25:11 -0400
Received: from mail-vi1eur06olkn2096.outbound.protection.outlook.com ([40.92.17.96]:37313
        "EHLO EUR06-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725904AbgF1JZK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jun 2020 05:25:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAOnv3Z+EBzK4ENzw4d4y+J+aeCYQU6T+3sNs3tmrsHERL4yqNQlGPT/KgblSaor2vg3GiOXPICsMYUBqpldNcdTU3mOhLsUIyKCekYFflkmAioQ+7FKIbySPTx4+qWadf2TBcfoKyxMtcuv9u/WDgiYBK5fRwD4GbzH86TCVzKzH/3UnoJR5SRq+nZZrrNosoc8spSSZgEvdbJswQUeMT//B5/MB/xw24xCqtj5+nFvJFgSkAk4MH8g0C52PWcs7lecYmU2525a/wu2QAEqjxa+gWrFTQ5OZpRlURDsKyl3ATQAbJHMMDFzNbPamdhkEJteL+j4MJARqF9dwR/GWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PkubXMo7FzAK9GsBL2JlSa/1DePcKzUVBVuH/59Q+g=;
 b=bSJxdz9WXW3PYwGffTjomuIVuR7FJctZ08wEaNP5BEevGh90tXxSsoppV03nNLIVjkS3c19p6wyL94iSf9TjEb76lkCeoPV4qAnhjgL4smARMEHqxrJO9BusHkChnof55pOSE0wIZiUm6BhyxfIyNlp4ZyFK2oLUNHwZy/9KBSZtyYnxuoj3A92G65kKhKgpwSa9E+WQRvdWMQ/PPD5b82tFYYE+qFVfVmflNrJnwZUFIfiGKTWAFrARwdN3V7wLonpTIqSWSccxnkMPO9rWrqMfl35x6i/Si2Q408dkjybGBz/Nx+2jqXEhdUDJuHG/Egk/m8gwDcV7DoXOMugneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PkubXMo7FzAK9GsBL2JlSa/1DePcKzUVBVuH/59Q+g=;
 b=kkZNlnj0DghWqoWPN+lm8kqfhhwNxNU3JG3uaw8wJJzWsbNSw6q789HjMt8t3Y1Ff9IUAUnB8C5D/VoB0i1iu1xbD3cbTVkF+EqqiYGjYcBrWpNIKPIgYY5fVEtMr7azWmw14GFNSHCRVRMnuflK4JtgbsQx42YQuTZFp0CJL9/kynirsBfnb3F9CsVsO0s67ZED73+Ev0WbgEXtnISwAafwwvfIobJVST2+9F6c8CpV2R6KkrBipANLDWVnChVMn0QfUV8G15obI/WJO4qDD8kJ9Wv1hLPS2UK8xWs32sYQmFa43KRJL0gav5VaqGbCiZYbO8G0IvbRWQbqotAAkw==
Received: from VI1EUR06FT003.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc37::47) by
 VI1EUR06HT019.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc37::337)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Sun, 28 Jun
 2020 09:25:07 +0000
Received: from VI1PR03MB6462.eurprd03.prod.outlook.com
 (2a01:111:e400:fc37::40) by VI1EUR06FT003.mail.protection.outlook.com
 (2a01:111:e400:fc37::75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Sun, 28 Jun 2020 09:25:07 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A26B8B88389C5199001EFD59869EDE704FE795CB2844BCF2DE75F6702CA54DB9;UpperCasedChecksum:D0536DB29B09AB52AB1038E1733FBD617CC98D99021AA8ECB43B93B10B6A1E7C;SizeAsReceived:8497;Count:45
Received: from VI1PR03MB6462.eurprd03.prod.outlook.com
 ([fe80::9190:b9e6:78f5:631]) by VI1PR03MB6462.eurprd03.prod.outlook.com
 ([fe80::9190:b9e6:78f5:631%7]) with mapi id 15.20.3131.026; Sun, 28 Jun 2020
 09:25:07 +0000
Message-ID: <VI1PR03MB6462531970F4C30703A87A589B910@VI1PR03MB6462.eurprd03.prod.outlook.com>
Subject: [PATCH] [media] gspca: First camera mode is skipped
From:   Florin Tudorache <florin_tudorache@live.com>
To:     linux-media@vger.kernel.org
Date:   Sun, 28 Jun 2020 12:24:47 +0300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0202.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::32) To VI1PR03MB6462.eurprd03.prod.outlook.com
 (2603:10a6:800:198::18)
X-Microsoft-Original-Message-ID: <83412159a8446232441c1b783a91e3e7f0a04210.camel@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Florin-WS (92.83.54.20) by VI1PR08CA0202.eurprd08.prod.outlook.com (2603:10a6:800:d2::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Sun, 28 Jun 2020 09:25:06 +0000
X-Microsoft-Original-Message-ID: <83412159a8446232441c1b783a91e3e7f0a04210.camel@live.com>
X-TMN:  [DyP53l2z0LqDABJe4JSfasQF/ujVogch]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 63fe5d2e-a4de-4730-61a2-08d81b452593
X-MS-TrafficTypeDiagnostic: VI1EUR06HT019:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +vgqTfWOMWzLVjAJHbAt2mIgQ8umPFpfqftTvltweFAcQLYo37yna0LPTMtKpe7zmpPYDre5BbRZe8TcMw90m+y9pVVm76Ew2k9/IXtZqT7qy/V4pmNQ+zgDxbbuK67LoBjNpluFIAuIV/W0Q3V6Sw3Q1jdx9/0Ysfxl0TT5fzzuEew3RGAUJGiE6ZLX3ptoZPy5dDqa/YTaBPNtdbqC0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6462.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: mM+yEUgRnoCI80PtPQegs3o/3dL0KzsRFDBaj/TmDV2RdEP7bL+wgsD/vGvMJTuYVscuWyV9vghUcgXGSwx24wmZd2LISxfOXUzj3wFbOm/O87+zmnRRuZqpDz5x8vUAf9HC2bbKGFbu169JMD5EqQ==
X-OriginatorOrg: live.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fe5d2e-a4de-4730-61a2-08d81b452593
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2020 09:25:07.2941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR06FT003.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR06HT019
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Subject: [PATCH] [media] gspca: First camera mode is skipped

If a device supports a resolution in 2 different formats, mode[0] is
skipped on first iteration and a different format is selected.

Example: 320x240/YUYV isn't reachable for OV534/ov772x

Signed-off-by: Florin Tudorache <florin_tudorache@live.com>
---
 drivers/media/usb/gspca/gspca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index c1b307bbe540..334c2e8fa0d5 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -925,7 +925,7 @@ static int wxh_to_nearest_mode(struct gspca_dev *gspca_dev,
 {
 	int i;
 
-	for (i = gspca_dev->cam.nmodes; --i > 0; ) {
+	for (i = gspca_dev->cam.nmodes; --i >= 0; ) {
 		if (width >= gspca_dev->cam.cam_mode[i].width
 		    && height >= gspca_dev->cam.cam_mode[i].height
 		    && pixelformat == gspca_dev->cam.cam_mode[i].pixelformat)
-- 
2.25.1


