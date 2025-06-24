Return-Path: <linux-media+bounces-35821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E47AE6EE0
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86FCC3AA2C6
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5C22E6D17;
	Tue, 24 Jun 2025 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Mp1C1ayX"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58732222B2;
	Tue, 24 Jun 2025 18:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750790841; cv=fail; b=GkW8evAUFD2VElxTLjF1HFTVxpUMRiEi9pCfKaeAaNEXvK9jaTaMk+m2v71wIlwDFGP/sCNn0AbmrOr5zBOn7+mX6vDZ1ZzPF0zaFb80uI6tjLxGA41E9+TAPUPAju+v3OKbwKBQ/UEwUcgF7rCLFCPzCGf3vaAqMrl/VQjXw6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750790841; c=relaxed/simple;
	bh=tzmowrpMIidcPEQUXTr+trasFMcBIQNXlynRIzcZQF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ArK2A3CLv90u/6BlTEzylaKvHfsiCWoRy8Fx0NK5Q4EA4iG+CerBp4DLOcz2WB2IplKGs6rvBuBdEqdlrwXpZI71IhzGISUReI900nVSiv47dS9PvJlwU7Ayg8Kgx9uJsOf8L+95BZLHqJM3zuRVYDoSn7/sJ5ro5zi+PU0yhVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Mp1C1ayX; arc=fail smtp.client-ip=52.101.70.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gr951esXfGQSP69UtacBUA6QGmBGf8sJu3ucPXsw0elXnUmKbxkR1YJgS6uiV8134qp9HguSqRUHfhwp/m10wnpr7U4soDhs0zjLVv85etK9Ki+XcAGvtleDIaP+GKtWPAtmLTYyN2B125voSMOgJVZlxcPNJgjGvmNNLq8NaGDL3Ik01M6AiAkC3H4YHZ5rj0jO1ZRVGYEYCWqTLBzSgUCPCndT859zjY0+BdCxhVFSRKwSLuRu78NDICFTrnHgVfHYcWtousdwZTfHfmQ6T/a8k16OBmm3y5XmOdrYDrsh8hOjgoUOv3mztIugTQUDjaqLzNfz7y0P3mrIt6DM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zk5zF3eV9EXMmXqz559ofjPpUXDQpJZ6vRmWz95Fbkc=;
 b=i28iGr8kFYmPmJ1NKoKhyAsNamLpxC0wR/W2bqOc3Kg4a2MN+P1Z+Q1mEcsZM4T1WXqknNYEhxLMi3eYwOkVJ1G3o2no0DpMz0QWEtYRpIv80PQuzcF2h1wdjkACpXCR2bN4TseFL5xZrRsmeqzU9AN2rxtCXyN8ecaWBCjXkfUEsNzgcUFffnOPaAfShyb+O3Qx7WWAJPoJN+mvyO5YUB96nKp3Cb59+ejspdA0KoP7byiElvPld3BT/ZFaskvdK8B4xXYL6GUcrIxi2D5WmocdwU8MSPhfgzqxeG4PVYkJHEUEVAFp3RUIBc6XwCIjjlHEB00B/sNi65Ru0NcwoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zk5zF3eV9EXMmXqz559ofjPpUXDQpJZ6vRmWz95Fbkc=;
 b=Mp1C1ayXC3n7u0Tuhr5LPGb1I7uHJr9lShnjzE7yLl1ADRSaJH0nTlfKKnH0Wt/2Fja/7smzjFQ9KJGkDl7C8hGzOdhSlpc1JheDY9DSwfiVKz9yqlSzVobBWJHLOvlmSzQ7iiUayy/lihakia/oTdnoUXdcaU4KCW6/GNcqy2oXzY3LX1vPpOOw9zaZJWs4uEAv8nNWmSJNIxFcC5y2ZXoKYtbAmq1Q5UM8TgsKUeRGHhLNmVkjjye89CS4ebBJy+M82s1nweMxyAaOnsEum7jN/CPNxnddwNAoXuZhWOXJaUOtYjZ+Y5BYh7BbFtcDwlS9IU8KKhmkOJ0+gefGfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8250.eurprd04.prod.outlook.com (2603:10a6:10:245::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 18:47:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 18:47:16 +0000
Date: Tue, 24 Jun 2025 14:47:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v3 2/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Message-ID: <aFryrpyDByI6wu5b@lizhi-Precision-Tower-5810>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-2-c9ca5b791494@nxp.com>
 <20250623224701.GE15951@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623224701.GE15951@pendragon.ideasonboard.com>
X-ClientProxiedBy: AS4P190CA0047.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d004182-7c41-42c1-0eb9-08ddb34f8a18
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?6e/BPylbkAU7zYoai+6efaWRr3ckvGrQ49uUbtS2W0D1hTOhFwWmMLoRZpf4?=
 =?us-ascii?Q?VNTaie8vnP5L/cpVYivFQ9jiWRaiNWu8MyPZk+MX3/NItvBZeEI0LjZ3+OuC?=
 =?us-ascii?Q?oRUVYaTZejWw7NdhV5YcrHCs4HK7/rIJNJY82XNTZdFFNZHhbvq9KzMsNYlG?=
 =?us-ascii?Q?7nKGfPZyjTg4bdHOLGLoKGhUy84moGLejrS+iVfYE7xxdyA6r093PnfMNk9C?=
 =?us-ascii?Q?Fvdc74k5JtjubyLgCybjMIPPxGlfDt97guf/QZbSicmhnOWKpB6OadVmh2Wh?=
 =?us-ascii?Q?UjBGURStz0pHD9xgxk+LitzaNImR8FKFpPsFWD/4nUNam24NH6iREod061iC?=
 =?us-ascii?Q?dVCbfn+FchEhXdX/aZFgBVnLv8uckjZ7rrg9rnuHyeoW0zm9/Y0YSvavcsfv?=
 =?us-ascii?Q?Vl9QtdbSYkOPyWHJxWALxz7NFgAKdf4A5N3nvEz45a1hbT0UFp2ghYujJqAj?=
 =?us-ascii?Q?mYL4I9Bm03Zw/1rJlBVPEze9f3y+mKuTDd/bMGbGJfz/6ikc60XjH54lQotY?=
 =?us-ascii?Q?oCNZa8hF199eu8gonyiaUWTJnC8vyhQSKXg+bniLaN0MHizeqNXx47Ah/pk9?=
 =?us-ascii?Q?djRrju1KPG+EnJL1AT8MpYAlvfnORitSpl67d1PmORUzR0wxWqaQxXO8cBRz?=
 =?us-ascii?Q?kWqKvFdvtMEpQ5ljUQVYIAtQmZTDB/7+NmTfEAza84NhWPkBvXgTnXkUEK5M?=
 =?us-ascii?Q?fb95AAu+doNGDQhn9MrPMNfkHUPaQOoB0JDT+bUAz9sB9RDKQD8xeWWfUzXi?=
 =?us-ascii?Q?6NDttqD6RGRs3RllLjWUmTos0SRM+gQmrFNy3BwF0b1UlvnlP1Tb6gRZZOZb?=
 =?us-ascii?Q?rj9QjDmK9FyDxh3tb05v99vUU6a024hwre+ENiAUyhw694XXss/uEzq+LcbV?=
 =?us-ascii?Q?c/Xw41NaiOveO5k8IvyePEM+NHCw6GUMmtW+By2xQ+nxLbHwvlItAYLuV9tS?=
 =?us-ascii?Q?2oaCHs2zskwZ1ipe3J5rgc0+pPGfrLN0mabrf5J0B/5pBvu5fEdzwg7rpwQI?=
 =?us-ascii?Q?zlm9Y5R3wfP/AQ0eZFeO1FZbiOxnMBwqWkl/2+MWrLXLq5cy0xzl5BCyF54c?=
 =?us-ascii?Q?RC6Zr0hP79/obYohuG5tTBe+vAlUFpSyhN7SYp92Kdg3+ULMZh0e3t4+nrIq?=
 =?us-ascii?Q?uRnViYAshoWRDKJU4MdBEbz1npc5ntauFin78hQwzFY/aqWrjHfQZxtxHF1P?=
 =?us-ascii?Q?2URl6VFcOeW5tqKiqPSBVjrk/1Na4KtTXJaU9UomDbEIaCoYBI8wOBYD8RVv?=
 =?us-ascii?Q?YN+ZmJpvfOW+f9yoD/KPIW73jxYxy2e8SsInhTnc1aimyUzL1qs750mUUTnF?=
 =?us-ascii?Q?UWHWc8n0ue1fckIqKTHCl7MyVvQUacix4677UNs6P8BEjNy+ebfrHme8E913?=
 =?us-ascii?Q?x8W/RFa2SK67CrXbNmNqSIvJnf+KvajbYod0YFWw1iYw9bWGEvXr9X3nk+w1?=
 =?us-ascii?Q?HerzNH9UmGFyoQR+foAhMfSmmzr/EvZLZ+b+SJV4moBp+sObmhObVg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VJn4OPAj1fmChvBtmjTQ5JguRah1+fBsKM15R4nNzMigxGDZo2G/kOtNy7Yh?=
 =?us-ascii?Q?9eGMVdULi/5Q2274xMp9uT41vZjSqmJvl7UES4Jm2vHvQ4XF1FV77J8cfjqJ?=
 =?us-ascii?Q?sZYvjSGFLmK/PnZw8wGMDcwLx052xkRPMDW9F8Dk6wzOx1rvGIiWqzVShWQi?=
 =?us-ascii?Q?AhGN+fBX6ZW7yCRPovdKl1kehniQImPikP9izitdOqpVO+DsK28R5J53lVWF?=
 =?us-ascii?Q?p1cRMuyDGinuU75gX7r2qxfCsaGVQPW3/Qi1batHJ4TXMap0UPLuoNVeoKqf?=
 =?us-ascii?Q?0w+O3nqjZwMp182WhBcRZ2Az5BnhUDd5fKkFEPF4saHWxYxSlEnRInnCGQ67?=
 =?us-ascii?Q?fe0aK0V6G1oYTQTgbRbRz1GhI4hpeFPrwMrjs/RCOVkDDfoY8YeT9shrKLBi?=
 =?us-ascii?Q?ilsX4yZaRFYjIgjvoFuRchjVxmtfXwl82tLpdZI+Z6VY7IXYguU2HwCH825f?=
 =?us-ascii?Q?1Awj/7tBSPmTHCXVKbHmf5w0uPsasosdakn/dCmo3D4InUW6j61Y1c38pdoX?=
 =?us-ascii?Q?nCvtkiq0UDDGot1LCr12LwKaY5NM7MxDKT10R9lmrWULrwKANL97wHnv9m3Z?=
 =?us-ascii?Q?qemcI2Q/CLIWFy6TkXzCAha53wcJ11BCtB0/oUnwoqwHGoNP+IOZBbRxiFRb?=
 =?us-ascii?Q?uC0NNMSQZ7RHFbBC0vuDOP9D4U+iqA2IT5Z8ntrrOV1sph5bVtPVhsYFHb1E?=
 =?us-ascii?Q?1lmapHTglYh5pXlNbvYVhYB6xVB99+61ikxx2+51IBxrL4JZoYOElwFbadjW?=
 =?us-ascii?Q?c5N4fZyuyBszmO1U2zkEe4hJ/ePb9sxt74Tph3B6izpILAVdrYK1oWxYkspr?=
 =?us-ascii?Q?3UoHGg1/m6rfOd4q4LLdjfupZdbVSMcD+Yos2S+psa91EWPMAt4JStiKKomq?=
 =?us-ascii?Q?AvY1iBAD3wDtLIR4bOUB2Fto0E6QkvNw1bw/tlw6EUAeGBdumwoJvQIrBZjK?=
 =?us-ascii?Q?Qp39xAZaXYG2IjLEeKQVAJODmZwuFu2ZHSwzmVmIRUKCFsDbOB00mQQo5P1e?=
 =?us-ascii?Q?BC1nGX7rU2k25hruws+9ZtZkQVInOvcalCl5MbRX9tQy7Tuup5EPEzOFcO+R?=
 =?us-ascii?Q?nnnwf96fHAW7r5uy4gtYkaGPrIG9PndtIH7ay8T0voEKvudeL1hiMr/VPYEy?=
 =?us-ascii?Q?uFx2Jriwqu8ZyJOeb4sfmZ+cYXseSwdEHB83qiTLr0GsBHOO0VM5i5sMH6VH?=
 =?us-ascii?Q?WuinSXyECaf0dQH16FrYX/Jyo1oAhhruQY0FlgWkG0ITDU3AjEuCpP1EtV8z?=
 =?us-ascii?Q?JTY7Y/Sua6Z4r2T24DtUSzzvnY9uttsUPssGUvHkkBChMr5XXzo5DSJtgAeO?=
 =?us-ascii?Q?Ag7U2agLQwFksRM8YwsB2IDjcfxjGiTOGKNIerkE1fs3KBNyQqAIwj2zQpr5?=
 =?us-ascii?Q?sgZFOVln/0UaqZCsO8o+bn1Yis9reYpuN6BpuV18MFECK53NKU5iWo8GPyOY?=
 =?us-ascii?Q?Fd0FtmkeoiiiRafN23eqjtuJOD5CO5V5yYt+O3+I0KiS7I/sw+yZVV8lTvQT?=
 =?us-ascii?Q?Rpf9/fIt/VASzcjN/be2A1iCDWB0gmcsVysYvoYroxvYrmGQwwtqgyN7BoDP?=
 =?us-ascii?Q?7zJXYTh7CDhkkYvdbsLZa/tlUYyPBgl3tezeqHnM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d004182-7c41-42c1-0eb9-08ddb34f8a18
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:47:16.0194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzjCB7vzEGa3AgDl1p8KRdPxgVBBRjxevzMyurKvohOitdFBuvp4BibjMIBRbxW30VbHnd/rY1DbgcRT/JKQKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8250

On Tue, Jun 24, 2025 at 01:47:01AM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Mon, Jun 23, 2025 at 03:17:38PM -0400, Frank Li wrote:
> > From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> >
> > The AP1302 is a standalone ISP for ON Semiconductor sensors.
> > AP1302 ISP supports single and dual sensor inputs. The driver
> > code supports AR1335, AR0144 and AR0330 sensors with single and
> > dual mode by loading the corresponding firmware.
> >
> > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change in v3:
> > - add extra empty line between difference register define
> > - add bits.h
> > - use GEN_MASK and align regiser bit define from 31 to 0.
> > - add ap1302_sensor_supply
> > - add enable gpio
> > - update firmware header format
>
> One of the main issues with this driver is that we need to standardize
> the header format. The standardized format will need to be approved by
> onsemi as we will need to provide not just a driver, but also a
> toolchain that will produce firmwares in the right format. Furthermore,
> some time ago the AP1302 firmware was extended with the ability to
> dynamically compute PLL parameters IIRC. This needs to be taken into
> account.

It is quite common when work with firmwares. Generally, it need version
information at header.

The driver need check firmware's API version, if miss match or incompatible,
just return and report error.

we can't assume firmware always align driver code because many user just
update kernel without update rootfs or firmware package.

>
> I want to resuscitate this driver and get it merged. There's more work
> to do, in collaboration with onsemi, and I haven't had time to tackle
> it. If you want to propose a proper design for firmware handling I would
> be happy to participate in the discussion.

who is onsemi contact windows.

Frank
>
> > - update raw sensor supply delay time
> > - use gpiod_set_value_cansleep() insteand gpiod_set_value()
> > - update use latest v4l2 api
> > - use ctrl_to_sd() helper function
> > - add ap1302_g_volatile_ctrl()
> > - remove ap1302_get_fmt()
> > - use guard for mutex.
> > - use dev_err_probe
> > - use devm_add_action_or_reset to simple error handle at probe.
> > - use read_poll_timeout() simple dma idle polling.
> >
> > previous upstream:
> > https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> > ---
> >  MAINTAINERS                |    1 +
> >  drivers/media/i2c/Kconfig  |    9 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/ap1302.c | 2838 ++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 2849 insertions(+)
>
> [snip]
>
> --
> Regards,
>
> Laurent Pinchart

