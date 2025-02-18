Return-Path: <linux-media+bounces-26274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBCDA39B85
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 12:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C912C175536
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 11:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEC1241135;
	Tue, 18 Feb 2025 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nyz2UN1t"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0589A241102;
	Tue, 18 Feb 2025 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879746; cv=fail; b=Ax172DDMjsuenqD8FeEWWKUSeLmC3wjTIvLnRx15cxooCH2yKaPVoM78gXMly8LVrDZpHxn+pHGBt/0DcvIFNSAh7ZA9rn8wKxWCJOqQn1t7RxpSva8ksdq4xDxtrbgKjJ+XWxLToEgRxfR8L1dy3OIW8IMFSj7h1nDqoB/HNiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879746; c=relaxed/simple;
	bh=POmn0MCkFQY7o1Uj9loSbfcJPN677a/48muS7p3zOm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iZ06CT0iesJJczYlUW3mBn1uMp5d7okoiZnDgJdDS/aDOR0daQUE+GCwE8WETpkg/dyGpk3MIsBaUcLYDtN+AKw+hSmlKu/pGnFiG9VrzYaaCSdsQDqP6kwktQd7mX5XsduvntRIjqmCd7OzXyINHj4/cJNfympm3vlPBF1vSD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nyz2UN1t; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7J0NDatA3YOB8OHcXPcruaZg5/qeLzB4t6A6aw07U9SpCAAVRxJQVs0D7I9LxHRSNQ0+V6sd3xYrS5OtZyCbRF+8ZWRCjIGEPsAsI7iaVj+XStJfCDLYwkd1R0aZ0IOGnNdtswAARjxMLZ2rwY2mstcVfPpuIYjqAUChNZ8kwJAquZy9Ag2m5GbWJrkkJaIRAtsudM6+Elw0H5Qza0++934ZQYFbW40kUblWXo0erVUoVvC83e84bZbhnjuH1DctU5vbPQppET+/QuO5cuKKSRr01Wj2GOa5F/auHa5bSEYszRSelDQK/C0kb3vUbK3oZxbtET9I68/Ee9MbGpGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEwddO7+x+IKUY3GVW4NA/w2wsdw0FS/2IpISMWQSgo=;
 b=MwiJzFb1NrkFYMC0B82OmzNBbyr3F1bGbTh9PDF8IK7mKGsiXvR+1dQydHkmL9+rfRBUVD5v/kV+xnvpcbRtOyU3wzz/khQKDrZrOn7G/HhNST04BQ3FXTBlJe7KFMIZx2vShTVFt4DIoFqsxCIieloO25hJEzysqFEGBAhauOEcpgpPaSrF253csMEJYO01XLFi/yn9nZsyNRBbmorWl4Ftl+3mrzDJnb8tJpXEitxtNQgz3yDc3gzhUNIvySNTuBIna9/VaoWOCaTR7RBM2Zv3cHBe7v5L0ygUwlCh1tiUK3TEJVou2hfNig7sfBT9lxtXZrEAGoklijO50uWTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEwddO7+x+IKUY3GVW4NA/w2wsdw0FS/2IpISMWQSgo=;
 b=nyz2UN1tGoohg0NR+05GvxyMTt7gOxXeiRH2lM1/ORogD9KY65OoxZ20oKNu8sXW/xq7dG1afwulWEVRjiPmhQ3u8x5nJMq8hEZOwCexploCnj5EqRhReInuvORtvlPowKnymG2HTSc46Z1bPnlifqnMS7zRBID/NZAm1by1RYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSCPR01MB14630.jpnprd01.prod.outlook.com (2603:1096:604:3a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 11:55:40 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 11:55:40 +0000
Date: Tue, 18 Feb 2025 12:55:22 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/V2H(P) SoC
Message-ID: <Z7R1KiIBqPcR06hP@tom-desktop>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-3-tommaso.merciai.xr@bp.renesas.com>
 <20250214002951.GB8393@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214002951.GB8393@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::11) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSCPR01MB14630:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f36def6-0ff0-4fc3-8fb7-08dd50132a64
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?gGXy4+OGtsr/AFj1ucmNCVlxS0PEZrKg8QTsGKGiZs5YOGf4f+zSF21nyu4D?=
 =?us-ascii?Q?5bD1+F5UM5qO02JgcU3s7BX+LP9fB/xBTviyBrYkjmT7/IFLvqanYudCYbb/?=
 =?us-ascii?Q?tM2iqwCS6N/EDd2Jl4nuLDv04+d68E+DZaGkcSKEoNHj42kTJjM0yW1cDtso?=
 =?us-ascii?Q?a2eTH+k36V1wr6Ks2JF2uGQJBgTkhit6spIaChLlpzJ8bg43OhfnbTE/PbCH?=
 =?us-ascii?Q?mizv1jCrT0Y7Dw5bqn5AHE2XQG3IDH7IIVEm85EYrzqcIXlCnHIrjWgdO0wx?=
 =?us-ascii?Q?yqKmh/iK4QkpCE0y/QZSq+QoXntZVDCyvRqZviGcJynYSg5GwcNAbwOPFKM9?=
 =?us-ascii?Q?wAf6RgmBMdRx04dtBjKFm5RGlwDSFneks797cAgx9PiL4Wg5cmOqZuoO5BZC?=
 =?us-ascii?Q?ThltHflxQa+3uE/wgzRsSrKpNaiocJ+tCmsLKishG3bmaXVG6ErpWQ0SoF/t?=
 =?us-ascii?Q?VyYfuolsa9P5bbSMMRubkgue1qA5BEiaEfFknmf3VbjZELKKFxGTwOw0YwEt?=
 =?us-ascii?Q?fyurd+sAgb4Ziu2fKFj4lwERXcZ4qQI4O+aOpCPxm0vRQLscZTPP9JxgXAqL?=
 =?us-ascii?Q?xBZxXoiaAWx1OJExyqfjCENnMDAh5/pAn5XdKF5o9vBF2kOsHcVdHZoBaslf?=
 =?us-ascii?Q?mLtoHpuXAjCb2xh+pdGZfjvabq+hLKrFKeAv5U9sCe1e+CkLOiwJzcL0b+Om?=
 =?us-ascii?Q?HRWtYCVkLHbv3I24sv6usdBNCYsoiUcjpApqGKOW0bB2eLONI3XIy+8f2FQ1?=
 =?us-ascii?Q?qEIT3KkykhZNfcRAtEgoW93ywkbWKt5aLoOCHyvaXR3r8ToZ26s1PT/uK7zJ?=
 =?us-ascii?Q?DO5jBsYa+SUejcLXlWvHulL5QqZ2zcPKIiot5dV9pU2BMBAxwPT2t8j5vvCf?=
 =?us-ascii?Q?E+QSIpKdATTcWD8dc+8cHIDvgvNZIrTrAbPM4DZiZdQtbQrbb5h2e7BjesfR?=
 =?us-ascii?Q?27Eyde0UH7/HLJs6ah3Kw5cmQmfpLEpXykJxaEadN3z3zXOppmcrFjboWfq4?=
 =?us-ascii?Q?YwcImYnl2CqYfKYdSmOE2xzubrZrc6vNAw6vU3Wgd8yC/HCWwWnykv5lSEMQ?=
 =?us-ascii?Q?xPmJUnAJF2RMqJehsVlWxaZNlp45j34zX3x8gUDerfVnj9PHPLG1NbGptVNf?=
 =?us-ascii?Q?RMygRkM/TO0Q1OMdPe5CTrN5neIJD0nmqbYbi8lnPOmnqcMmjB0tqtgdKPot?=
 =?us-ascii?Q?y7ktf2cWLKNvkAP3MCM9rnCrIbLOtxsld8Q6y7Eny4jmH6SCyzzmsoWQl/gc?=
 =?us-ascii?Q?A7VOl6BW3sokGyuzSTyjEgn/fLCYZgk7on4G88fAW30pnZeKXAWOCrBl9dFU?=
 =?us-ascii?Q?oWEI9yH1bOadlqQ1c3Nnr8/9NXC8zzDqxaKjaGhvwrXoTxCrdPZaQHYgKRQx?=
 =?us-ascii?Q?7at4L+kPMVtjA73vRuK3yykPTBpAT26EBqWLoXCOjNM7LPiU0VwvERf18S4C?=
 =?us-ascii?Q?7X8j17RDximEjSa8C2NladfEB8a3DutG?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?0diNp+XZE6uQWr4jyODj33ZNjifDAj2/RgCkx1eAR+SsKz6l/HOLimWAo8An?=
 =?us-ascii?Q?OwUHFv17ODn08Lp6TS2qG7X3rhUf5/b922MgNTjscQCRal7Zv/VIV5uJngKE?=
 =?us-ascii?Q?NlqmY97nlfABLXCHxSZyCVt3cR80uE9zTXk7OYFIrpnYD/1f3g08cPMy/n/l?=
 =?us-ascii?Q?EzG20V/cP2gcDALui0XEWdXhBD4LMIFThCy6Fh3MYkLy3nr0sH3hjxDygt2L?=
 =?us-ascii?Q?llu/TObbxjWNdzUS3V73zaQ7Ay6XP+n9YPzME39NxGzxQ9IwfveNipEie1MZ?=
 =?us-ascii?Q?NdPHNdI++holBE1FwqeYKAXOL1O6g82HwZwUM111hLYGj6lSYosJbyC/ff1k?=
 =?us-ascii?Q?LscuGPBpG+YvprrmxaAXgrnl0R2qqonq1GSj9cAk/Ed7YsnWxJnR8BJuS2QU?=
 =?us-ascii?Q?3K24vVWIchBKXGaJloFL35AMSp8IqMH4M0jE14H46auufvPN7x2FMRiodN+s?=
 =?us-ascii?Q?dknTyAn2bFFHNs7AWpadRL9o6J+XzOIpBWc7HCbQu5u3+YWshpsa0rLGsAVU?=
 =?us-ascii?Q?QNVh8EquTAKSpDWwFHwh0Y6cMIbR0zGN8qikuYwYkYrrErvd+YyVG8ow9taA?=
 =?us-ascii?Q?OgEpU223KIZEJ+z/Uvc0z8UGdxlYxmk7S7hid60Lx2LgocTSRpM3GeTmY0ef?=
 =?us-ascii?Q?TkYxHd9aSjkLAwkXwWODcr2c5x1GQgiFzslyNedTQJlenN+HR43TCR/KqHQ9?=
 =?us-ascii?Q?uRXgqpDwsrYxVQ8riMVHSx8nac/A+YLLdCpC/ND2AVAZf4IUi9p0T54oSgek?=
 =?us-ascii?Q?+UlXGoVqnGOnnNWBIrapR6wtVpjSE4eynI0EU/qD6FmDUJQYkqxJJ4f/0zJe?=
 =?us-ascii?Q?dCQANDO6OFe8qZVc7VSouRoVngwvib3zrFM93JtvqcwPRUr7wh2wp3ZIwecR?=
 =?us-ascii?Q?A8nior97rq/E7wEmhwysafnVB/pRgeB6gsJqgCkl36zb8Mt0/Ef+g2hgtfTo?=
 =?us-ascii?Q?QwM2fxDtMSHwjDjUyQllZ0ozu8iJGSTd/FT271ds3G12wuyIiIHBZs4NnXwo?=
 =?us-ascii?Q?p+Pkr+jdJn05sljw8bRD7NjXk3Fm3twDQq/44lDtq0xCfYOv3mHzuaQ0CJ48?=
 =?us-ascii?Q?WElZyPnEXEzxkT0hIEawYJusQruOXtzfxUkt3C+7inOeLBFEhsTPqRoRY9vm?=
 =?us-ascii?Q?J641HcA4eNFJM2mskh7QIz4RBTprQvu2S4CVfh0S7o4zsu1ybSdiJcBPzkEc?=
 =?us-ascii?Q?MLcqKxighxuKuXGaeDLKs8Y8bn/3j8CZj0J1b1xVNWwYZVwYC2YHx+Pd/AUy?=
 =?us-ascii?Q?iYCVyQSAyglTjtIgoP4Ckif+5jMt1CK6zWySxuGGTdsS970VUda2QoLQ1yJd?=
 =?us-ascii?Q?H72NVuDOm95NjzswTIa/S3TXTMGR72tXAj7WHWFjcUWe2Mkmzjrc/mbFqTxj?=
 =?us-ascii?Q?UnMGEogs6p6bHtkUPW2aqtc8ciDPsFzjy0/JOby65DC8pebaZuu7v9Qr479b?=
 =?us-ascii?Q?gEAvdJ3Yy7obiU/v6KpaiQ+3t4hfXpqGfqHz06Breh58ADCE8Zw6JWQ3NasU?=
 =?us-ascii?Q?RhfXZb9s0BpWolbxXBxzQ+0O2M+nrPXPiQoWReewy6LNONglshZOe5/GaVvb?=
 =?us-ascii?Q?FQs+UZx5FZ1M3oEavCLcDQsOjat3cw6+LMQ+li3fgbO11N8Shx1i/oYNg+FV?=
 =?us-ascii?Q?e8gPhJspX/ZaY9VPVzugz1c=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f36def6-0ff0-4fc3-8fb7-08dd50132a64
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 11:55:40.6410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9b5wDuRbJuCUp4GCEz9bbdC1V5TIFCcm2H4rMg1q2b1+Q0R1hmQCQDXIvaOEX3FUJ9ACOscmYdehqfQX6OQ40xK7k+/u7DY9x1dkg3CHxti3O6BlX9HQJEzbXq+bzzoE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14630

Hi Laurent,

Thanks for your review.

On Fri, Feb 14, 2025 at 02:29:51AM +0200, Laurent Pinchart wrote:
> Hi Tommaso, Prabhakar,
> 
> Thank you for the patch.
> 
> On Mon, Feb 10, 2025 at 12:45:34PM +0100, Tommaso Merciai wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> > found on the Renesas RZ/G2L SoC, with the following differences:
> > - A different D-PHY
> > - Additional registers for the MIPI CSI-2 link
> > - Only two clocks
> > 
> > Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> > SoC.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../bindings/media/renesas,rzg2l-csi2.yaml    | 63 ++++++++++++++-----
> >  1 file changed, 48 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > index 7faa12fecd5b..0d07c55a3f35 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > @@ -17,12 +17,15 @@ description:
> >  
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - renesas,r9a07g043-csi2       # RZ/G2UL
> > -          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
> > -          - renesas,r9a07g054-csi2       # RZ/V2L
> > -      - const: renesas,rzg2l-csi2
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a07g043-csi2 # RZ/G2UL
> > +              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
> > +              - renesas,r9a07g054-csi2 # RZ/V2L
> > +          - const: renesas,rzg2l-csi2
> > +
> 
> I'd drop the empty line.

I'll drop this line in v2, thanks.

> 
> > +      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
> >  
> >    reg:
> >      maxItems: 1
> > @@ -31,16 +34,24 @@ properties:
> >      maxItems: 1
> >  
> >    clocks:
> > -    items:
> > -      - description: Internal clock for connecting CRU and MIPI
> > -      - description: CRU Main clock
> > -      - description: CRU Register access clock
> > +    oneOf:
> > +      - items:
> > +          - description: Internal clock for connecting CRU and MIPI
> > +          - description: CRU Main clock
> > +          - description: CRU Register access clock
> > +      - items:
> > +          - description: CRU Main clock
> > +          - description: CRU Register access clock
> >  
> >    clock-names:
> > -    items:
> > -      - const: system
> > -      - const: video
> > -      - const: apb
> > +    oneOf:
> > +      - items:
> > +          - const: system
> > +          - const: video
> > +          - const: apb
> > +      - items:
> > +          - const: video
> > +          - const: apb
> 
> I would move the clocks and clock-names definitions to the conditional
> below. Otherwise I think a device tree that has two clocks only but
> incorrectly uses "system" and "video" instead of "video" and "apb" will
> validate.

Agreed. Taking as reference your work done on renesas,fcp.yaml.
What about the following?

  clocks: true
  clock-names: true

Then move the clocks and clock-names below as you suggested
into the conditional block:

allOf:
  - if:
      properties:
        compatible:
          contains:
            const: renesas,r9a09g057-csi2
    then:
      properties:
        clocks:
          items:
            - description: CRU Main clock
            - description: CRU Register access clock
        clock-names:
          items:
            - const: video
            - const: apb

    else:
      properties:
        clocks:
          items:
            - description: Internal clock for connecting CRU and MIPI
            - description: CRU Main clock
            - description: CRU Register access clock
        clock-names:
          items:
            - const: system
            - const: video
            - const: apb

Thanks in advance.

> 
> >  
> >    power-domains:
> >      maxItems: 1
> > @@ -48,7 +59,7 @@ properties:
> >    resets:
> >      items:
> >        - description: CRU_PRESETN reset terminal
> > -      - description: CRU_CMN_RSTB reset terminal
> > +      - description: CRU_CMN_RSTB reset terminal or D-PHY reset
> >  
> >    reset-names:
> >      items:
> > @@ -101,6 +112,28 @@ required:
> >    - reset-names
> >    - ports
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g057-csi2
> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 2
> > +
> > +        clock-names:
> > +          maxItems: 2
> > +
> > +    else:
> > +      properties:
> > +        clocks:
> > +          maxItems: 3
> > +
> > +        clock-names:
> > +          maxItems: 3
> > +
> >  additionalProperties: false
> >  
> >  examples:
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Thanks & Regards,
Tommaso

