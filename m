Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D0E4D41EA
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 08:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240112AbiCJHgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 02:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240101AbiCJHgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 02:36:00 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0397DA90
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 23:35:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+tbn5Ne9vDSm5bC4jYi5loVVCG9rRW++Afz3tdSQikgcw9af1EEmFY10zZ0MODHBkRl+Wab5wRI6Qgov7tQMfcf3nZILKWDGQgdEMFFDweqfjPWqKB8UTgmxFoLil4SECKSoCC0hA8fmpa0PXnIOyFEr7ulgklSuiRp9FnRI7CbXHHWT38A30uYCsCB7VOD0C88tPOPzbrsBg0k1l26AeaZccuVGk1n+ykv1/26oFOdYXrPBWKLG43wMDFKZdt/2YiSONMG7kfOsn2hOhwF6JjTwal9aGAmpqT0KDQZ71U6TakgFg4odnH+Bdg3R7R2lT4Y8iTFqD8L0/PokW3p2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRqkEzvB6XECudw6L4Cb8caY9XBmqF0hzl3IR12XB/A=;
 b=ns4xKFkEC/VvI/8OaPaIvpTgFgMRmdg5grU+wdY5XmtpoBez5ZJ17aSXTzzMIf5YSwar5nhDMmtPqW+2seYsIY6Lxe5kOOHgVRArkd2frequ6AUnGT8rKWkbKuJ2Eg+fof315VZ4TU+Nool3X/WYguR8WAcRjSu5UhCrrgFZ1gFShWyPAh23i3HuBvbcnJhiCRPYCgmbOg+fypU0WTTnBUyaTAO84je+7sO17cqrTp7Q05PaFkpRpDlYvCtLtIkp4kxKUbgdaA4vHNmJTc3LcAgi8ygR7gaV7TOg+hRyXHsmIwmEm2m9tShIWxaQOUksn9pvnp7+/y97JeN0n6S3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRqkEzvB6XECudw6L4Cb8caY9XBmqF0hzl3IR12XB/A=;
 b=IpGjq8VgrlejlQnkEkhCx9v5CaW376wVuzRvz32aQ/GrmHF5CkDcltfPmp5jsBg7rXjZOzM5lKy3nxK1JJBOXaB9V1hX4Rvou/+hOg+w7O1OJoGnmt6c68xjS+1EIOfEWNvU3pikXzaZesqTTVUrTXaPEGtAGzUXaH3XLhX45nA=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by DB7PR04MB5354.eurprd04.prod.outlook.com (2603:10a6:10:8d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 07:34:57 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c39:69cf:c4ea:967]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c39:69cf:c4ea:967%5]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 07:34:56 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [EXT] [bug report] media: amphion: implement windsor encoder rpc
 interface
Thread-Topic: [EXT] [bug report] media: amphion: implement windsor encoder rpc
 interface
Thread-Index: AQHYNEwUqlIrQniockijQZsabe8Zuay4OJTA
Date:   Thu, 10 Mar 2022 07:34:56 +0000
Message-ID: <AM6PR04MB6341ACEC2D4188333B4A88F5E70B9@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <20220310065654.GA3476@kili>
In-Reply-To: <20220310065654.GA3476@kili>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b879b53-6b92-4dd2-2198-08da026879ce
x-ms-traffictypediagnostic: DB7PR04MB5354:EE_
x-microsoft-antispam-prvs: <DB7PR04MB5354977D9C4ABC5FD9FA3031E70B9@DB7PR04MB5354.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rkexn9IAQkR81xv+yfnp6EIKZGJ8u5RAyPIvLrnISS3vibooK5utittpuNu9kdAhvd0tovKobe+ij21IkYqqT/q4Bu94WnGUfFaq6mmGN9HQVuF+cEddnndxoXdfbFxPYeqhYi87P53ZdF0FGKnMoCxxkTAQJHoSNZPl9BWfFDypjKMPDt0k6UVgG/4AAvG4kPYJrBuMxeRAKP29W91KqV1x0EmGPQGW06JHu9GdIUio2xEC9ZC+LtGqUm8+e1+i1srswOqH31btSXqL3NIa+Nr2TM7dt3C5Aq249WHdw2BqgI0SssfA3BSUJcKYKOQJ/Rh5CLJDD01KID2qtOdfv5yNW/2GEjny5IFpc3ZWZxlXOQc/AH/qwUCyTf5CuG5RsmRqIdF4AVYSqb/Kp56HjG2U+6fGCk5lHKOUW8sdFoqY0tg293jNuXchFgEb5GmxktGsz9kH10O5eSris5CfGSWY9gJKokX4kyux5k96BSqQYB+76s3X5aET/co9sTE8BNhZUssJn+R+TPBvven9Y6wrnzmCrYIP41SV15BK6FyMC1hcI6sOmduFAgpljSR/jBckLEe4FhJntDIqRjAvPuwgaty+sc9VC5fWRyAV9W2vekKVVOFRsVBieCwgmzd7+JqrtSM6CD2R0ppxDla123dE/6pTI2oKRYaFfwz7Rkl27Lu8Xu0WEzOZDtyjBray
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(52536014)(4326008)(8676002)(44832011)(38070700005)(33656002)(122000001)(186003)(9686003)(5660300002)(6916009)(2906002)(26005)(71200400001)(38100700002)(66946007)(76116006)(55016003)(86362001)(64756008)(53546011)(498600001)(66476007)(8936002)(7696005)(6506007)(66446008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ckNQaMlE4h0yEpBiPnJRQFSssqhZViWJI9tcZIxvz04Oecmzv3OZ+IVOr4Yi?=
 =?us-ascii?Q?O+1cjSyKZZy3G5u2IH5uIXA79N5cLT947XJSKx6J3oP/wjut/YMWqZffhfAm?=
 =?us-ascii?Q?ZaU3eGX72Pfr4ka+xSf3VctSSlCL1h3aW0IQT9qM+Va6h/US1meKLnpnEx2b?=
 =?us-ascii?Q?GFOwBUxxQnGqn8Lc1xbm3mHZYvKoNhbDcV+Y7WCuroyP4RP3K0GlBk4KuJVg?=
 =?us-ascii?Q?wpHR76SKLsPfLtsVSIDDVFDyxmoOFormnKzS85QFOhH3AEFpNBWL5c9pGyK/?=
 =?us-ascii?Q?qPb4BQBiG+MuS/k5IOARja/U8/P7rAh9Ce+JpQfYVhh506/vsDgb0mqgrt/p?=
 =?us-ascii?Q?LSJFPandzSii/b3aw60JHNxxl4Oync05YwKCu5D0pjHznx12fOpwZwT5lXQw?=
 =?us-ascii?Q?IGeUB1QJSCQGaVUZ0CwAC6GkUS9C1/KDGToPU5C0zq0fE38OWFb2CpC6PHsV?=
 =?us-ascii?Q?o8DCXPe8xrWw44s85rGxDwgrlvZzYjXdwE/Mi6wMchgWkU3rchqBln79n2Z8?=
 =?us-ascii?Q?8QYI9bvjBFOZgdTzF1HJdv5o7K0D5vjOpa9zHk1/z+k5cAr63Q3Vh67fJkAy?=
 =?us-ascii?Q?SU03c7PoeaFMiuvB99ZnSPuBJs4YPt5coccVzu7R9swMsuKoK+yzA3lNp+qM?=
 =?us-ascii?Q?AmhDdyei+7rkHVqVAGu/EzQ7lK83RDfaZIyuBtcqS7QwZyw2xeGDpuRU1dv0?=
 =?us-ascii?Q?QNCMYy7W8xajyRADQUOXokdVHzQY4zPaA9FYeMAAZo6eMAWEQQzYeK68Lxnk?=
 =?us-ascii?Q?aj/tknwJYizdSyyjoUTKT6IpHPprJcPtgjlMsHiEC6IWywMvFnF8j4q8ezI8?=
 =?us-ascii?Q?WcwBXknGSM81ONNrAk2j0qFpMLKRoMmZSFL7i4c1GUfzZOA6UkRXeRL5UilS?=
 =?us-ascii?Q?mH6GXjLbqylH8wvXKaVAdyE6x3n1An3PM/AAh5kORhHgTcoUsq/S7OYxwwvW?=
 =?us-ascii?Q?MM6DdR8WeahkDFRbKHfS6q3PzV00dNYUC/Df+qzV89BxNtaZ81U2hpKDllnY?=
 =?us-ascii?Q?qXrMItP2Kc42s2Oc3zpu5t3CJjcKysCnLq/L1qw9ykpuqmg5bF4MqNFeBXGJ?=
 =?us-ascii?Q?wxQ6ilA0QibAbfpV1ac9vFpq86n9vxrhx2hNXivBK7g6+4R/iqIqTpknK4lp?=
 =?us-ascii?Q?c9kWY+mXercVbPbunAQnmRXD2mbDFCc+t37S4RCLdEA1O7FVcFufr1+NOB8c?=
 =?us-ascii?Q?/0rXsMsggcddBvCvGC4CgfjCjckDUHdUPJcdpxi7zVvS4LkMeakFZ5L21MRD?=
 =?us-ascii?Q?2hECl74FTY14q1GSFrpjFal8Lbc+s2GdKrcrJ0wlhZbhxWFbHaDLXOZoryby?=
 =?us-ascii?Q?Yw9sMq+yAeiEnRd4T0EhbpaQONyqHUxcEf/CHaJd0ikwGJfq5disPifVjiby?=
 =?us-ascii?Q?sIR2yCDW2FSvDlTtcWohCw7Ooq3V29wBlAYGWLKfSnCpxaST5KEeQLnad1mc?=
 =?us-ascii?Q?biypbsy3TDA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b879b53-6b92-4dd2-2198-08da026879ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 07:34:56.9128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1VmQFE72qInggoMm62V578LOui+zBl4R4Pe+PudFVAFlrkZryn5JOGjGMI0IjdDWzAeH+MrOPld5M5cLanoGUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5354
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Thursday, March 10, 2022 2:57 PM
> To: Ming Qian <ming.qian@nxp.com>
> Cc: linux-media@vger.kernel.org
> Subject: [EXT] [bug report] media: amphion: implement windsor encoder rpc
> interface
>=20
> Caution: EXT Email
>=20
> Hello Ming Qian,
>=20
> The patch d82977796c48: "media: amphion: implement windsor encoder rpc
> interface" from Feb 24, 2022, leads to the following Smatch static checke=
r
> warning:
>=20
>         drivers/media/platform/amphion/vpu_windsor.c:823
> vpu_windsor_config_memory_resource()
>         error: buffer overflow 'pool->enc_frames' 6 <=3D 7
>=20
> drivers/media/platform/amphion/vpu_windsor.c
>     807 int vpu_windsor_config_memory_resource(struct vpu_shared_addr
> *shared,
>     808                                        u32 instance,
>     809                                        u32 type,
>     810                                        u32 index,
>     811                                        struct vpu_buffer *buf)
>     812 {
>     813         struct vpu_enc_mem_pool *pool;
>     814         struct vpu_enc_memory_resource *res;
>     815
>     816         if (instance >=3D VID_API_NUM_STREAMS)
>                                 ^^^^^^^^^^^^^^^^^^^ This is 8.
>=20
>     817                 return -EINVAL;
>     818
>     819         pool =3D get_mem_pool(shared, instance);
>     820
>     821         switch (type) {
>     822         case MEM_RES_ENC:
> --> 823                 res =3D &pool->enc_frames[index];
>=20
> This only has WINDSOR_MAX_SRC_FRAMES elements.

Hi Dan,
    I don't get the point, the instance and index is different, and one vpu=
 core can support 8 instances (VID_API_NUM_STREAMS),
The enc_frame count of one instance won't exceed 6 (WINDSOR_MAX_SRC_FRAMES)=
.
    Maybe I should add a check for the index like:

	If (index >=3D ARRAY_SIZE(pool->enc_frames))
		return -EINVAL;

>=20
>     824                 break;
>     825         case MEM_RES_REF:
>     826                 res =3D &pool->ref_frames[index];
>     827                 break;
>     828         case MEM_RES_ACT:
>     829                 res =3D &pool->act_frame;
>     830                 break;
>     831         default:
>     832                 return -EINVAL;
>     833         }
>     834
>     835         res->phys =3D buf->phys;
>     836         res->virt =3D buf->phys - shared->boot_addr;
>     837         res->size =3D buf->length;
>     838
>     839         return 0;
>     840 }
>=20
> regards,
> dan carpenter
