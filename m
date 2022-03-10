Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 210874D3F05
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 02:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbiCJBzU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 20:55:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbiCJBzS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 20:55:18 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70058.outbound.protection.outlook.com [40.107.7.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7CA128658
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 17:54:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmZ6IinbQAbA86fcu9M5IBmZywjQf9IDNv9YpZkq7HZxP4AlPkC3ksfbv7FlSP6umxAiseQZ/Rm8I+VCa/yoRemF6wQMi3KENmkrPrXOdQsI8pk+zB76r7mj1ACbm4uWOYniDn6pSXB/kIURitzzCaNAvH7l6GdqrgJhtTJ1ZJX/rv/dR8xmGTK9XQXrQYsjwRKtQY9C2Nz+i+5oWH/7PLt3hzcqkUsoC/DH8jZ3ichCfgowt+NQQHpgwOTGc7iZDKDgzPlyonZKDpBoHViEdMUM9lQ/ftDOGoruaRWlDUFLWNuxdIcbwyS34CcF113q3B+ZoN7jmgGtdwblNXaTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2SyORjA/dj7odKlnQKrRXzwrJZyyDnsjYzCHdxABVA=;
 b=TZcVgoNqTfY/j77rbViAFfJ2TVjh1+SHALkTzUJw5qCwPFgz19/jEahbjt/quvcmlhy0lGmhnM3yO4kZjl09E8T9DLKVV+s0nLD3IcTMLvu3Bnr35L8JLjYeskGNFS+WriCuVgx9nIR3jmOgcT9nJhbh7YpV6FMzGN4299t8Vhpn6iXlWSXRcLEpsOTpg71iBMvhYKe+VADQTV/x4U5mRz31hQriwEZBxLm3bTbwae8S0gyW+U9hVWBV83ikhW57FzhtYEIDWtB4h0CJn9ViTbXaNhJJifucIMKapaJH9qQcVf0bz4iGgWg3myfTsQJ8Jrg01OZ7k6dxDjkYJZCEkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2SyORjA/dj7odKlnQKrRXzwrJZyyDnsjYzCHdxABVA=;
 b=ahyZoVEbxvecNdFL3WToPgHidu/AFQ0+u5O+AtJf/NvImXM8AH0k5Gz5DmkZNui7/Lb7kOUdqtg6Uz43dywm1QTDZOmUlr7R6Nb/zteH2/eRpzRA5syqARu6gsFVFiZCZ+XvnqbX071j+7G95oW5N8BwzpmSeHk4QoBtW06qUrI=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by DB3PR0402MB3754.eurprd04.prod.outlook.com (2603:10a6:8:6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 01:54:15 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c39:69cf:c4ea:967]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c39:69cf:c4ea:967%5]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 01:54:15 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [EXT] [bug report] media: amphion: add vpu core driver
Thread-Topic: [EXT] [bug report] media: amphion: add vpu core driver
Thread-Index: AQHYM6KUL9YHEisbNkSp/VoyJkHA+Ky33BEw
Date:   Thu, 10 Mar 2022 01:54:15 +0000
Message-ID: <AM6PR04MB634110C2096D162B1F0EC952E70B9@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <20220309104337.GA29869@kili>
In-Reply-To: <20220309104337.GA29869@kili>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2ecc2b9-10e8-4e33-1414-08da0238e1c3
x-ms-traffictypediagnostic: DB3PR0402MB3754:EE_
x-microsoft-antispam-prvs: <DB3PR0402MB37548FD8ED362F151CC838BCE70B9@DB3PR0402MB3754.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cxpa6gpSyWNlTvWjN+hbV7A3WdVO+VOUzjAZmHI3bdsS/Z+Bxf7lQbz4jHoy2G3ZAAyg/e4tMYhAa7gfZZ+2OxAg+JFiIUibO4LCBjzllzxm184kRrXLQyVtD6WdrXluKO1nranVL3n5eI3VbxbrYY38+x5bebsy943VPWgO2Mmixt71l/nOZGdehj2c6N5t4HAmPnrB6RQNgfhJuOzxIFZnrP4ELw0QITq70NCBrCoxXo9IY9zyZHGz32ZocTJ8j8fsfW1JZluJ3n78Ip9oxvFoQB5o7mpzsiSFEC8dCh9u6meFpxGqheDzg7kpmdmJ+UdtCHaI1keAAc3pm2LmVPyfvlTrXTAfzP2+KbfRsQt8T/iW/g/mOpBS5JfjWIqNw1lJt3cLtiALvg3TPWnqB5z9cBWA6uOeaoIpHmvt45IqXb7fpmEFETUTWSWvnEkmnnSgB/1J6Bh3a7IItSNFp/rfRQYQVCw6uZkTfta5Pg/dVgF1rsryPj/KDZY1HDnjzmTaZ19kDF6H4fnMRdOsGkOj6VIZGaF/G02lfJ8s3cZ+4uhGpTQZDCQWagBmd5WWfgyFOAQDVh9rWyMwQjRzowgofbhcRxjcJnHYiJn9UOuxsj13Ye9kuK8onZLqYqI9+52O20puhXsFYYrKsYpAByVBhXQYGweJTPYLuC21125PbVUhtJd/pGXmYBzLuX3135BzLegP8P+fA/b34Kkm5b5879+8QTKoUa8bbYOgpX6i9IG91YCGSaA8anxXXx5l
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(26005)(186003)(4326008)(8676002)(76116006)(122000001)(64756008)(66946007)(66446008)(38100700002)(53546011)(316002)(6916009)(6506007)(55016003)(33656002)(9686003)(7696005)(8936002)(5660300002)(52536014)(44832011)(71200400001)(508600001)(83380400001)(2906002)(38070700005)(66476007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U3euizOTDSI2nN4/zZQwYUhf9ZWCQ10KLDSFiQAzb6GqApiMeGQUyaDIApBn?=
 =?us-ascii?Q?vLQRrRx05QozC4qt9I1/VaAvq3BqRgOFAPRmRbxNwPKLpo0DXqIkgdvv/hBs?=
 =?us-ascii?Q?TY9Y0arIAvCXRLS8bJPBupCqjyt12H0nZPB2jZWVs7O0AE87XyNuJIF3jAc0?=
 =?us-ascii?Q?ZJOJB/tQK7rMfXrclK3RWrAbf3Ic486JrStRJsO03X7ODv7AeITpWWBpXQIV?=
 =?us-ascii?Q?qZuClpzecFF77HH6OmyMk9+XexDpW295t3dgdruNQVgSgzNnbFPiDBSAWjOf?=
 =?us-ascii?Q?4eWcDZPlUTTTZermXCZSCEw9JDIaaAD6Q00e/Gw761RFrlyrOujucrSJOD1n?=
 =?us-ascii?Q?2SV5Yv+cxD3lH3eSoYJyPauLeJHNCh0b6jPMoko0XL7BlVyHX8AP8L9MKw/X?=
 =?us-ascii?Q?+/uxYcs5vYGZQPBAVTfFiQpuZmzNeBdXkJ7JjW2X+kuh8DU99sIBN8GXrQJk?=
 =?us-ascii?Q?B+TIRbu6C2vNHZMCnXqPdazdpj3XZ8fpBD2iF23F9zwUw5C1UJO6wMPpJyZq?=
 =?us-ascii?Q?dgNVKS4q81RMsxAQC4FMofYSIIei02jYlqaNJpXQRQqJbn+2ewnrTUZsgxRN?=
 =?us-ascii?Q?ptE35+hdCVb04o339aeGjzZq+QEdKuTbBdqwFg7FsmwgirdyV3xZfKfqpdxD?=
 =?us-ascii?Q?U5Y3Uj88lvpNqR3n39i8t58sWJuy2uFLuzEh2rEUuD78FJjZrnrbVG0q2e8A?=
 =?us-ascii?Q?nuhcn+rIxl56Fo1qBRCt9tQLVXTVX1Mttaw9OURMg/Gc8C4LRdnLZO71EaRR?=
 =?us-ascii?Q?Mx+nfZFjSrcmI3ZSJF+2O/QzvlC35654UXAzSDgp3a2JLLCBuaqB8XN0YIFJ?=
 =?us-ascii?Q?0naWCrYx1bEEDzrmTblc4f16kRRonLV0pjrgheAOGS1awz5EK+k1riYr9KAx?=
 =?us-ascii?Q?yDJduGaFHIhokaVQDTovAS2Bq4zO8lRJB+mKy828Wud+554hRCwKHOjkmqoX?=
 =?us-ascii?Q?If7oJRN5XSfJCIjFpQPB98XTFEhIvTDOf1duXZvhiF90F5E2pqIwiqkAcOnC?=
 =?us-ascii?Q?AOa1PuWL9p1mweA+OWKeBQgIHyDLOepxL3yDpC0Q5CwnQqR4XcfBBO1QasEC?=
 =?us-ascii?Q?yEmhu9wDdJd4UDVbOLJR48CvFyirVgoVBHC7yap8b6V6INCBeCSuAmEis+uR?=
 =?us-ascii?Q?PoSQyp9nfmaEBG8a2qJWa/42RuK8y6Dmoh6d/LcAlBlsrF29GG6wdeqod99j?=
 =?us-ascii?Q?+hl2025ahzBEgwcKbBajfFy2p8Mg2VbQDnxwfX0H40igMg2DmUBqnm/hdtQI?=
 =?us-ascii?Q?TjXYc41bFMIk9rRU8Ct+iVxJalr3tsXI9ki9pPKzhKe8y+oCvIppnJ+1Kf1u?=
 =?us-ascii?Q?k2+oJcaKMzqzsVVwNfuxSGVLsGx6saTQCw5RLVrK3q5zu9r0ZI9TuoUgke5w?=
 =?us-ascii?Q?2UR5VBnaDlDvemvcJzqTUzeRsJZSdFpUs1QYofe9RaIx34jP3wGBUct80Uwi?=
 =?us-ascii?Q?gDT0WjEXPN5OWBTguVtIDjEbYKiMaNFxKizE7ygyNo7gC/KIdmtpunBT1xTC?=
 =?us-ascii?Q?IAOAskFhnxUvXm7NbB5H+zpOU6Vfkt0UmbCc92VAlZrX7pZj9Tuv4kJt//MI?=
 =?us-ascii?Q?Z0xFJwztKWgwOPIUqehFMo9AWmD6gQY2ujmH/xUh23a5MN0Q7FNf8f447il/?=
 =?us-ascii?Q?ug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ecc2b9-10e8-4e33-1414-08da0238e1c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 01:54:15.4647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U4Pftxt96XJGLGNo7wNIkFQ2qkBQVK2/uPLM+guMDe/jmlGk82DPw7fQeTXLBqPwb+0NB58pncPMWHb4H6k/rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3754
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
> Sent: Wednesday, March 9, 2022 6:44 PM
> To: Ming Qian <ming.qian@nxp.com>
> Cc: linux-media@vger.kernel.org
> Subject: [EXT] [bug report] media: amphion: add vpu core driver
>=20
> Caution: EXT Email
>=20
> Hello Ming Qian,
>=20
> The patch 9f599f351e86: "media: amphion: add vpu core driver" from Feb 24=
,
> 2022, leads to the following Smatch static checker warning:
>=20
>         drivers/media/platform/amphion/vpu_core.c:654 vpu_core_probe()
>         warn: pm_runtime_get_sync() also returns 1 on success
>=20
> drivers/media/platform/amphion/vpu_core.c
>     577 static int vpu_core_probe(struct platform_device *pdev)
>     578 {
>     579         struct device *dev =3D &pdev->dev;
>     580         struct vpu_core *core;
>     581         struct vpu_dev *vpu =3D dev_get_drvdata(dev->parent);
>     582         struct vpu_shared_addr *iface;
>     583         u32 iface_data_size;
>     584         int ret;
>     585
>     586         dev_dbg(dev, "probe\n");
>     587         if (!vpu)
>     588                 return -EINVAL;
>     589         core =3D devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
>     590         if (!core)
>     591                 return -ENOMEM;
>     592
>     593         core->pdev =3D pdev;
>     594         core->dev =3D dev;
>     595         platform_set_drvdata(pdev, core);
>     596         core->vpu =3D vpu;
>     597         INIT_LIST_HEAD(&core->instances);
>     598         mutex_init(&core->lock);
>     599         mutex_init(&core->cmd_lock);
>     600         init_completion(&core->cmp);
>     601         init_waitqueue_head(&core->ack_wq);
>     602         core->state =3D VPU_CORE_DEINIT;
>     603
>     604         core->res =3D of_device_get_match_data(dev);
>     605         if (!core->res)
>     606                 return -ENODEV;
>     607
>     608         core->type =3D core->res->type;
>     609         core->id =3D of_alias_get_id(dev->of_node, "vpu_core");
>     610         if (core->id < 0) {
>     611                 dev_err(dev, "can't get vpu core id\n");
>     612                 return core->id;
>     613         }
>     614         dev_info(core->dev, "[%d] =3D %s\n", core->id,
> vpu_core_type_desc(core->type));
>     615         ret =3D vpu_core_parse_dt(core, dev->of_node);
>     616         if (ret)
>     617                 return ret;
>     618
>     619         core->base =3D devm_platform_ioremap_resource(pdev, 0);
>     620         if (IS_ERR(core->base))
>     621                 return PTR_ERR(core->base);
>     622
>     623         if (!vpu_iface_check_codec(core)) {
>     624                 dev_err(core->dev, "is not supported\n");
>     625                 return -EINVAL;
>     626         }
>     627
>     628         ret =3D vpu_mbox_init(core);
>     629         if (ret)
>     630                 return ret;
>     631
>     632         iface =3D devm_kzalloc(dev, sizeof(*iface), GFP_KERNEL);
>     633         if (!iface)
>     634                 return -ENOMEM;
>     635
>     636         iface_data_size =3D vpu_iface_get_data_size(core);
>     637         if (iface_data_size) {
>     638                 iface->priv =3D devm_kzalloc(dev, iface_data_size=
,
> GFP_KERNEL);
>     639                 if (!iface->priv)
>     640                         return -ENOMEM;
>     641         }
>     642
>     643         ret =3D vpu_iface_init(core, iface, &core->rpc, core->fw.=
phys);
>     644         if (ret) {
>     645                 dev_err(core->dev, "init iface fail, ret =3D %d\n=
", ret);
>     646                 return ret;
>     647         }
>     648
>     649         vpu_iface_config_system(core, vpu->res->mreg_base,
> vpu->base);
>     650         vpu_iface_set_log_buf(core, &core->log);
>     651
>     652         pm_runtime_enable(dev);
>     653         ret =3D pm_runtime_get_sync(dev);
> --> 654         if (ret) {
>                     ^^^
> This isn't right.
>=20
>     655                 pm_runtime_put_noidle(dev);
>     656                 pm_runtime_set_suspended(dev);
>     657                 goto err_runtime_disable;
>     658         }
>=20
> The documentation for pm_runtime_get_sync() suggests using
> pm_runtime_resume_and_get() instead.  I think you can just do
>=20
>         ret =3D pm_runtime_resume_and_get(dev);
>         if (ret)
>                 goto err_runtime_disable;
>=20

Got it, I'll fix it

>     659
>     660         ret =3D vpu_core_register(dev->parent, core);
>     661         if (ret)
>     662                 goto err_core_register;
>     663         core->parent =3D dev->parent;
>     664
>     665         pm_runtime_put_sync(dev);
>     666         vpu_core_create_dbgfs_file(core);
>     667
>     668         return 0;
>     669
>     670 err_core_register:
>     671         pm_runtime_put_sync(dev);
>     672 err_runtime_disable:
>     673         pm_runtime_disable(dev);
>     674
>     675         return ret;
>     676 }
>=20
> regards,
> dan carpenter
