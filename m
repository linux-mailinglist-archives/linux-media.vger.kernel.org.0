Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5324B44ACCB
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 12:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343562AbhKILp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 06:45:59 -0500
Received: from mail-eopbgr80059.outbound.protection.outlook.com ([40.107.8.59]:65478
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343558AbhKILp5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 06:45:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J41v3Ckr3jdACV2XkjkthQOimCqV8ICwonuXejkmLFrtbjq5/LuirU9nZS/wmRkaycUwazC4MM64GWtmVQ2q1TByRsgCMY3Haij7MQyqLBSaamstYNxZ+0hHqOzzusVqWh+INIK3rlbUJKKBMCbezRKb7w8752SWPLiWryzINIyOLH+Y7G/SgkIIfcCcbedC3iRZBeJTI2miMS9OXfFg9kmUDkEfxmy0+ZF45FVAEWyN9cW0gQiQdzRSOnZVwXFvp4ywTtZCNcjpYdwxCf7JZuhaygGhwDTWYYVVwCl2hzZzIPvZp0WkY/TqlWV3wuC6tGrSSDu/Bu+PuG+ZxfWPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YjwA3NWZnGUw2Q6LZ7fdJs9SRfr3dzPNWhu25qyJTw=;
 b=Z60SYAgIAR67JF4tyXVpoGv7iW+oTXg4bmYbqd2+X8rna1s0UgYJFzGoZ7dIJFRZCB6hWkhICI1uDtwOXfV7j2t2xZRFsXa4MA1cLoUdcG1cMKJcN2lz3IIdRC0LosJ5yNuTGnrZ0bmEbQsGgzfOPTY5e8vcejxNKHP1HF3i1NSCvN15xBIlIUzmwrIW3iUARK8EKnSONdklImpwV6tEM1MCnWZXmrXSrZH8jJv9Xr9yn3mp48oB7hcI5NEZsLjHLkfO5tJww8sOsKh3JO5ugMtFcJs2QABMMPDSGuWoSCv9/kgCR66yzZMI2lBYjUhKX5kHiXXYN4p/0qIm44I9ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=br-automation.com; dmarc=pass action=none
 header.from=br-automation.com; dkim=pass header.d=br-automation.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=br-automation.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YjwA3NWZnGUw2Q6LZ7fdJs9SRfr3dzPNWhu25qyJTw=;
 b=TtmQMsJwGt7zqGPayblaWECiPjqUnWVGSYGDzsYBgzWj4bOPzV9iPwvmF0aTOuAGUAdAFLT1VQTUvTyqT12CGaf0TicP4bzMiPWPKqtXyLvyeC45A5ssMMgR0x3PKEHvaI3aTMSshynSySQtVsk+m62vDqTEJC8ilrPmzOCyBPg3RNcPfwCdGIKWN4wuiFFIxBDTSqjv/NBqdAoJ+25ZjUfG+DVj/AVXaagTsG2bvfG+S+cl1V45E2yyVsiGSwMiFdEUL7Dpf9+is5SxQi2Z/bX4eI6FBqMm2rE+SsVmUMHH4FErgQhIq6CjSRf1/A1N0fA/LyuCM3mSg7rUlWbjjQ==
Received: from VI1PR0602MB3549.eurprd06.prod.outlook.com
 (2603:10a6:803:10::24) by VI1PR06MB4014.eurprd06.prod.outlook.com
 (2603:10a6:802:62::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19; Tue, 9 Nov
 2021 11:43:09 +0000
Received: from VI1PR0602MB3549.eurprd06.prod.outlook.com
 ([fe80::e1d5:b95d:49b5:b873]) by VI1PR0602MB3549.eurprd06.prod.outlook.com
 ([fe80::e1d5:b95d:49b5:b873%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 11:43:09 +0000
From:   Martin Weber <martin.weber@br-automation.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Subject: [PATCH] V4L2_PIX_FMT_GREYSCALE for coda960 JPEG Encoder
Thread-Topic: [PATCH] V4L2_PIX_FMT_GREYSCALE for coda960 JPEG Encoder
Thread-Index: AdfVXr9WsI+RiXqKS66LkEC81oVXYQ==
Date:   Tue, 9 Nov 2021 11:43:09 +0000
Message-ID: <VI1PR0602MB35495D33CD3DD897F0A41D5ED3929@VI1PR0602MB3549.eurprd06.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=br-automation.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b389fba-f82c-4984-7d33-08d9a3761a9e
x-ms-traffictypediagnostic: VI1PR06MB4014:
x-microsoft-antispam-prvs: <VI1PR06MB4014A1B7CC661DECF920CFC3D3929@VI1PR06MB4014.eurprd06.prod.outlook.com>
x-abb-o365-outbound: ABBOUTBOUND1
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zGFf6szRkjOAqGwN0DECe4S8sM570IRLjHGA856/pzp/kzSg1plEhtmxpAtv9A8h+RWw07Fof/nJpTI8+Vi5zOYnBh9phE0BqShYx3UbMaOiNDEzYV/6f+B60rW2S3RvOXPYFHLB8sTpi0aJFjJspGvxs6x5VwjynNcY9rFFpWphSfpbtoAws1HFQgJ8FmYChQite7jE99mVK5W1Vs82g9PiGUrz7lwnuW8nXJPrAlfzaq6i6c8aaua8YyPwSWIwpSp42JirdZdNcNSByw4fGAwdxNdQj3U4sf+EQCN5dWthujbwMw508WRePLdeG0e5ZnKctuEhehOXGbbBmwoCA9AN8puVSfKU+yX15RuIod6V4gcOjGvPCpF3doJifcMECTrKSaw9+g/540wG0FSnY+igXvwoW5oflGiIjWVmVzhzsaxnzZ9xzwfyiR460F/VokGvSIuWwqAqDDb5m/Dlqz+bvb5u/1y5i2EVLzUYQWi9Z0j/izJc3dEroTwzlLUMdLuCKrlKFdYunajQclG/EolQu3PhjYK9bS4QtUZ7aZoTsRG7pkFB+ZWHbdontS0zR3/cFWLVHSsqMRkwaA9gu3LHdBecPoCSX3vC7VOTXm7Au1i06casCoxc/ew4jg5wbLS94AAD6OWPMUxTQqTIxkQlVi7tTGbHKqtCcn9n8hbTuRLfzq6MyVssW2fXmPqfqd28nGREUx1+dY0NuUmDhQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0602MB3549.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(64756008)(9686003)(76116006)(83380400001)(66556008)(66446008)(66476007)(5660300002)(7696005)(26005)(38100700002)(82960400001)(6916009)(38070700005)(8936002)(122000001)(52536014)(66946007)(316002)(4326008)(55016002)(33656002)(86362001)(508600001)(186003)(2906002)(44832011)(71200400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ErNbzrrv71H8cRuaw979PyVdBNYVIlFg1ANKs4RXUX1TOiRI6lU1WIFlT38X?=
 =?us-ascii?Q?UzF7tGqKofVzy+6VmE7roRyWYvRjYgOLGQoWcb/cUuERSiIjraldJg/LdqOA?=
 =?us-ascii?Q?UgT8MxvRFnKujRJy2iIsQ+CwnDQUFzCP2Mrds9F3Pby3RdmRoR/LjTdKAoWW?=
 =?us-ascii?Q?dILrASmG1eKRI2DYy82wZrGL65/9YQ4coGpJJQrsf6MobLjAi2ga5wMtfBJC?=
 =?us-ascii?Q?w3k++B0bkv0SkFj9VtTC3V4shOf/POV17I0Xt5N47wQRL4oYSOVYty2QUrdw?=
 =?us-ascii?Q?t4oU8/nVGv4lMRNEKvqg6jYuZavzQUlL3wB0UcpwiE+cTnf+ztH6qy7dMYt2?=
 =?us-ascii?Q?NYk7OgVokxaGHQCe7MzTMSr7VkK7FPs7DyUZ/GAQ/i3DmlU/K8lv6pl3uPCQ?=
 =?us-ascii?Q?u+TNC2GslWahCCPVAZ0bHea4I7iuwFzOFOEe2L5m/0DHFZvAsMfh0G7fs25+?=
 =?us-ascii?Q?Xmw/as3wdHB5mi032rgxt8FjWLKnvsqUQi15E1NqP8+sxEK11TsPIyKzKtOb?=
 =?us-ascii?Q?/gBGynTvUZCGCgDxKDqP7GUUupwem0lN03/DuaZHL2AQkzKJAT2hwVI52eGp?=
 =?us-ascii?Q?uo3+QCl0CENbVjb5L6kX+cnpYb+kmjVD4L3gqlNdjGBfYmGr+/FNNpqS/Rdp?=
 =?us-ascii?Q?xp3KcljRJ9w5yT8aN6750GR5orM2Pr/xtdDMYgTNVh7MTUDFakaHO0zcmxID?=
 =?us-ascii?Q?9G4RbEoWlolx41ub2BzCHpoOeaZsFKG1JrEtl2qbj7j+y76AEcwoFIYa3lE7?=
 =?us-ascii?Q?FsVmaOTo6EeDNRQTBop0ju7qj9Xb6aPrdveyGvbntPZcaL6aSDTlgd6mRHRc?=
 =?us-ascii?Q?Ax/Q0XwaI8+ufEX2QcyBkZGsd127irdJhxXnjY5yuwC+fm8PNg8rK4XLz3tw?=
 =?us-ascii?Q?yov+h2FOrTU7z76qsHfVVAy6wqrYy39i8fck0D71Aiq1uhMYCigf6HqCODZX?=
 =?us-ascii?Q?h90co3lpg+Svih20B8J2aWxLz+q1KnceC9EEXTRAtHbQBxfuq8ux6wPImZCW?=
 =?us-ascii?Q?G9kMFbrw5bN/xAu0TDiy3JL2OxFw7CzgSzDHWVdaOpbND7bBlwXBxldWmM9w?=
 =?us-ascii?Q?fYiFDjC8+R0iUpb6Aeg3gYz97FFAHV8Cd/aV/kx2mIJfGmSB6Wr0wdu4z7ca?=
 =?us-ascii?Q?8musHox2sYhDsH3B806gjdLK9f6imgf9flTjZmWtz1KUSNK6+J+C4+kJCPCR?=
 =?us-ascii?Q?yYOfwyX1U/XV5++SfSrm5UWomUUqyrfm1MORO5p6HHtNDUPfmkwc3mTNj65r?=
 =?us-ascii?Q?RSS+qsX3YXnCBqIm2qBK9ZNLc7bakMuFcLlFiUG7rBkWW23hSydDDbvYU/Cv?=
 =?us-ascii?Q?trK3JFxk8JW0RrU8ipedXUV0mF4daL8ZenSA2RldKQ2cIgOB0jRmNv7DvGYp?=
 =?us-ascii?Q?mJxoa8uFVrw11NAdg35B9s8m0XjaXIKSht3WZx6xFm6QbmJ4EuC0F25tjcRi?=
 =?us-ascii?Q?zQgqyLE/EkDE/FSkm9HS5S7v9gAZCbQq3FfqTFH+M+gCO9f1u8SSzq+JN51r?=
 =?us-ascii?Q?H8XY4KnugNz3J8IVftCD5gl2lJW1rUobTbL5LJiSDvGPBpMoXWsMP7ywEGsj?=
 =?us-ascii?Q?QbLvzCNgEMJiOekXLX88otsBMiVL1vMR7e+2rJzeHU1aTIu7vL55Vlo0DFqj?=
 =?us-ascii?Q?CYlKTJovhLAWOzkkf/pGl9NVKb+ss6HSxEIcBaXyxrfSHWCIzUqRyS1o2nD5?=
 =?us-ascii?Q?3w8iqA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: br-automation.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0602MB3549.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b389fba-f82c-4984-7d33-08d9a3761a9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 11:43:09.6759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 372ee9e0-9ce0-4033-a64a-c07073a91ecd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgm4gVC6mfYo3KzS8/1W/VxMDlXU99V/YSgKdGZj//wlL1GCMv4/BB8pI+oxKcDaj5pNNthhG/e8IVmb/w1sNXpp67ngX86Ktt2Z9ilZ9EA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4014
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

support greyscale pix fmt input for coda9_jpeg_encoder. The hardware
supports it, so allow V4L2 Mem2Mem JPEG Encoder use it as well. Tested
on an i.MX6QP.

Signed-off-by: Martin S. Weber <martin.weber@br-automation.com>
---
 drivers/media/platform/coda/coda-common.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/plat=
form/coda/coda-common.c
index 87a2c706f747..51b833a55690 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -43,7 +43,7 @@
 #define CODA_NAME		"coda"
=20
 #define CODADX6_MAX_INSTANCES	4
-#define CODA_MAX_FORMATS	4
+#define CODA_MAX_FORMATS	5
=20
 #define CODA_ISRAM_SIZE	(2048 * 2)
=20
@@ -247,6 +247,7 @@ static const struct coda_video_device coda9_jpeg_encode=
r =3D {
 		V4L2_PIX_FMT_YUV420,
 		V4L2_PIX_FMT_YVU420,
 		V4L2_PIX_FMT_YUV422P,
+		V4L2_PIX_FMT_GREY,
 	},
 	.dst_formats =3D {
 		V4L2_PIX_FMT_JPEG,
@@ -626,6 +627,11 @@ static int coda_try_fmt(struct coda_ctx *ctx, const st=
ruct coda_codec *codec,
 		f->fmt.pix.sizeimage =3D f->fmt.pix.bytesperline *
 					f->fmt.pix.height * 2;
 		break;
+	case V4L2_PIX_FMT_GREY:
+		/* keep 16 pixel alignment of 8-bit pixel data */
+		f->fmt.pix.bytesperline =3D round_up(f->fmt.pix.width, 16);
+		f->fmt.pix.sizeimage =3D f->fmt.pix.bytesperline * f->fmt.pix.height;
+		break;
 	case V4L2_PIX_FMT_JPEG:
 	case V4L2_PIX_FMT_H264:
 	case V4L2_PIX_FMT_MPEG4:
--=20
2.30.2
