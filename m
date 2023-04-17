Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC386E4588
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 12:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjDQKsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 06:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjDQKs0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 06:48:26 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D34C1FC3
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 03:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681728452; x=1713264452;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Ogz1n9kt9Y9Hj75GWTqyznh6Q2KSsHtMjctxLDLW6wo=;
  b=LsIMkM/ryPcqLC5Ie967FXVop1jonOEV5RL6lFkJP8iEjRAhTU/wrGQP
   1ChvZQW467Wq2jvGXLDNZivMW+OPz9A+Da0rIvWjHxA9nMzqiApcZsHzB
   zrwzO2E6gaNGRldlwKrbHikwE6/rfamEYZdiGo+ASqId8KVI/Lf0vnAu8
   wEpoupWrXPESFZVeIPSXbL3sNr4HtfBKIGN/tYMn3xmJCcU7N/zESGLq9
   ltDF7qxWyw0hBHdal3LN9qKOYIP7NhWS1VekTNaQNoo+xdfe9hWjONSxH
   v+4hBtiM29oS4Cd5bvSs28/Xqq7cLvAIW5N9viAQhjkZAic134FAGAFS/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="410071323"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="410071323"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 03:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="834360629"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="834360629"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2023 03:45:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 03:45:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 03:45:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 03:45:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpRSB84kuGZLhCoG2PLL3OJF/v4M1p4V+653ctUIKKyOSKuMpw0pl1UYYuMW1H9G7NDQEwcSHO2+QQDNuU7CFnEb89kk7Ul6Mm4Owf88dPUqg9qoGX0Q/snzM/w3nq/a8knYnZULj1aVQPOysVFAjWTcXQ+WoTsbIxsBuIym7LcaLyDob3ZpuL+GBrBzCw1knlPntMOwtMKJTzZj9wkyu8wPr0UvhaaTlNg9ya0497zfI6hgbSn+Yvgs+s2VY16CDBrc7tQNXNMC1PPsAux8nKiL8aD8DbHkrbjqCMpTO/v4mUGi6Ttw3fiC/scyr3C7ad1NvVr306RLOCafWqwTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qw46SsmzLbtqFVVzX1777J9GktM9wfNWfCTdc0720q4=;
 b=VYuo9Wj0wP7Wpvq7FMuTCegdwEyJKAtczVVLZb3x69a9ajKsQiOUVlKAsTGYbqDeG1Dv2C102o7Pmysc1mx/hCKXw1mgKu4ZYNDRPZvADjm5551IRYNLIE3/S/CTCcopf7Bm88RB8cU0x02FlpGrdc67vYpQuhP9AfPUbHh6W+xyZPFyDyaaFpu3sGCT5WaSRqKoCmqLcXO9EpnyplcXS+bv4tqGG5wiaFBgQAlfu//F/vPyvlptGnbX5lrCNB7ISIir3Gi4eYkACrPYqFAGia24QZ2zkOMsQ2H5dFulVMnz/yHCwY9BIeKVZNEvP32O00QrNk6C10pPH8bwDFMZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CY5PR11MB6260.namprd11.prod.outlook.com (2603:10b6:930:23::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Mon, 17 Apr 2023 10:45:51 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::77c4:ae30:8119:4427]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::77c4:ae30:8119:4427%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:45:51 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH 1/1] media: ipu3-cio2: Fix container_of() macro wrapper
 arguments
Thread-Topic: [PATCH 1/1] media: ipu3-cio2: Fix container_of() macro wrapper
 arguments
Thread-Index: AQHZcQ96aADf5l1U9U2iLvv6IN/bKq8vThJA
Date:   Mon, 17 Apr 2023 10:45:51 +0000
Message-ID: <DM8PR11MB5653D180951803BD071CB1C9999C9@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20230417092959.3571307-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20230417092959.3571307-1-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|CY5PR11MB6260:EE_
x-ms-office365-filtering-correlation-id: 85374395-0ff1-434d-0f56-08db3f30e990
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n5PXYJjfLv8KaW6DwgBYKZQabhgVaqVWEhrzb9gdno25T2qtgCNBvH7ElhHE7ddd4Ii7GqYoyvPr2pvLnFlehwdVBHDhWZjg7djIBdxNg+35Z9XxpbP0a9LnuaSMXM4Wok4k2M6lfYBts47dR/qVU6ynCyXCulubIp04n2CeKgVK7vJFaRfeSjCYtUSpsOHr0DihH16J/HMQqEAHC4/hC3iPVvtF+X+p/BPNJKwYG7lYfm1kraK9ybfC2kdQR9uywaCvFI5wusujBBtpevT4i/sEB01PsBUMd6DU8S2qZFl3XyI8t5W201ETQO84SPIAPG0C6fbgXrVA06lFktPMdZTh+4dac6hBFKbokejZRZ/ukQpeD7enyTR4ZERvu3xVE7yYb/WpZ9HGdVEiy3VVw/5WnylKBz2hLsLeFeei7dqL5y0NeOukzqhQM2T2aA/vk6gcOisneXCnkX619djaBs7/bR7vsDwjM3noMKhySRqRaQdfTOHfXZPVK0UeCxUnQUBrCJh9p8NftutDLAMQJ3E56r9/BB3rd4QGIrW5uaSgSmVymCbe/lQRTjavLbm8Fzcar0PDewHfXvmoee+YJDPWPuGAcLtAVhLiZNxw6d+RbDW84CH7l2WVYOpIx8Y9KpugTwz7aExOOxDwP97gvw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199021)(71200400001)(33656002)(2906002)(5660300002)(122000001)(316002)(52536014)(38100700002)(38070700005)(8676002)(86362001)(8936002)(55016003)(66946007)(66446008)(66556008)(64756008)(82960400001)(66476007)(41300700001)(83380400001)(6506007)(7696005)(26005)(478600001)(110136005)(76116006)(9686003)(186003)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s012COPdoG/SSvUB9GIv+vjovc7J9egyeOB4BRLYLnrh4E8F1Ulo4TSKLzBW?=
 =?us-ascii?Q?vDp9dtdryDjm3h72RQEbzG/nxDHeriMH/2cVQS+hdJFrHrV/QXAYT7QkpFS4?=
 =?us-ascii?Q?8FxypC3WgXtX+7iMzwrEZkLuYv3Y9WYJHZWVK3WwCNK1UwfnpTbf7nHX4f31?=
 =?us-ascii?Q?WqIel5lwSAxFJ3r7MK27NM8OKL0dLDnSD/mkHAiKzjaLU0yl6scMvcLMk3wd?=
 =?us-ascii?Q?0sQwdohkTDYMY1M0g38MQDH5LFERWXCPGsSijBOFWQlCs15d60OAr7XytAcP?=
 =?us-ascii?Q?szSdEp3M6xTwasmrZR4DEdlOZer8nEmCCuFhRUg6JcGGBTBBEWtgtM4Jcj+T?=
 =?us-ascii?Q?QR9YPd3/YZuvboKUWBxu8hDVHGMnx/3knxwWK1z59A0m8KAbOFu2hV6DqUa4?=
 =?us-ascii?Q?TfwqxjSFI+8imhPDhFFA41xquP4mt4C1PdHPBQiPR1gfT3X1MQK76wmweufo?=
 =?us-ascii?Q?t+oXfHDeXZimaFo0w2a7AUcsjXX0vVLuwXj9hXl0FrvPUVuc22NQFQiMwYEB?=
 =?us-ascii?Q?E17QS5Y/QCzVvoxW5W+lV1D1ondyfqUNvUrdPosiYI3VWqL2MMK/97lsX2fa?=
 =?us-ascii?Q?l+A7C6GWE1okA3h6fe6P3CJdd+QnE2r6QCPlVzW9XuUDZPK51kOD4W64mp0I?=
 =?us-ascii?Q?lGhULhKDojbWjpOTR8n6bGYW0VOAIlCrC0N2U77TPRq+OSPyufSBtp9b464I?=
 =?us-ascii?Q?HYJiDdNQfTDIMdD+aaun0aD9X1CFyzvvMv171UcKuRLo0u8gfahgWBkgbf0X?=
 =?us-ascii?Q?xMfISrrqf/i+3BUacWzazXhAcHUZDIZeqX0nZetVuNrFzVUPSE2URci2slfz?=
 =?us-ascii?Q?w3cOVoymrZVq7L+JRs/KLVVOTjmgbPwXkojCkDGSfzNx7FD7v+JKMyblw0pu?=
 =?us-ascii?Q?hrU7Ttfl2kIvPnfo2rRdll0RfX00Y7tYXoAWZ8HSrOzWSM791YGVk3ZvPa7W?=
 =?us-ascii?Q?ipCzNK1NYmG2BLIn2/9Ctnt5hGV/kSqGov0xFiCbPgayS9Zlw3188/TKivyH?=
 =?us-ascii?Q?Czjacp7mSNn4BEAKMhqtmFCezoObp7LIF45uPO8O+aw+aNSJ31fvvcp//s19?=
 =?us-ascii?Q?Ax1qwyfb3Dq5af/CQDtB1e2V3pBMPS4fDbL/Za7mZ7zglZZYHBB+JV9tN93U?=
 =?us-ascii?Q?9KglteQdsNXeg2HhpYE2LioL7dML1ljENsyEk7f+fb3ORyFpt+lXR3V1uWEX?=
 =?us-ascii?Q?TtGSmVpzx77V3sD6KQpcUIomTk/qmvriX/fZ67kMXrkzpAvZaax503v7dw7Y?=
 =?us-ascii?Q?Innrh1y0MXKl3Rns0zDiWdyBuzlN3TV4cWF7wrObSXKdHn5e5f3DT2qTNZT4?=
 =?us-ascii?Q?vrFICOaitZWX3DJP4BtKwNliOL+wQYj2HEQE/7ujWoWDBnssaxNKUrbKZncf?=
 =?us-ascii?Q?jqGdPzByFkQ2gRPZN1/stD3Hj+J3S87V4rIK5BArpFxz6uBXH2ub8d5d1c4I?=
 =?us-ascii?Q?HQsxe1DuwgIYvTkWEmiEsxEjsdcVhP9O1J3Z7miB+sNqtNEvjy17w8bDSD/N?=
 =?us-ascii?Q?UUcMtVH9ESsLRdemUA/7XAIRIy9ewX7Qvt8uvdtHRvUIlyccgq5xIYV3wBAQ?=
 =?us-ascii?Q?PsUkXL3/RqmBm5IdjMMXq8rn8nDWyNQo+sJWjp0/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85374395-0ff1-434d-0f56-08db3f30e990
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 10:45:51.2334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IoXYJNrNObor5Z5dT7fq4/bU86yBUVSNwoDLlRvs+ZB5ZaFJcoLNtSPh5jRRC5o4v44kz1GxG6WyL7+JsH1v4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6260
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>


------------------------------------------------------------------------
BRs, =20
Bingbu Cao=20

>-----Original Message-----
>From: Sakari Ailus <sakari.ailus@linux.intel.com>
>Sent: Monday, April 17, 2023 17:30
>To: linux-media@vger.kernel.org
>Cc: Cao, Bingbu <bingbu.cao@intel.com>
>Subject: [PATCH 1/1] media: ipu3-cio2: Fix container_of() macro wrapper
>arguments
>
>The argument of the to_sensor_asd() is called the same as the field name
>for the container_of() macro, so it only works if the argument name is
>"asd". Fix it.
>
>Also switch to container_of_const().
>
>Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>---
> drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>index fa53d0835c89c..39ad1309a61b5 100644
>--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>@@ -1374,7 +1374,8 @@ struct sensor_async_subdev {
> 	struct csi2_bus_info csi2;
> };
>
>-#define to_sensor_asd(asd)	container_of(asd, struct sensor_async_subdev,
>asd)
>+#define to_sensor_asd(__asd)	\
>+	container_of_const(__asd, struct sensor_async_subdev, asd)
>
> /* The .bound() notifier callback when a match is found */  static int
>cio2_notifier_bound(struct v4l2_async_notifier *notifier,
>--
>2.30.2

