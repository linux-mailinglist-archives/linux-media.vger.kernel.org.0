Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C55F50E929
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 21:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244849AbiDYTJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 15:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238763AbiDYTJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 15:09:05 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4250521E06
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 12:06:01 -0700 (PDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PHPCIX017013
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 12:06:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=LDVUzzPF2P6x809cD1f9N/b1/wXLEjYbhAgeOQc0I2k=;
 b=ixnZYugUJpnp8RLAip+RoMixKpiSN4L967ddB9KIiRuL/55SlPPg1mq6zWtge23x18uf
 9ZTk9ygk/I/537EMK3kFQw9N0aO7nXpoJ/kNv82PeKyZWRCimTXwN5gDDG2UBfDJBdjL
 DX+mcWwI4pVMoPAztXRPc3W3OhrGjzQQIMM= 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fmcsgvuu6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 12:06:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgSc8kUGIcr/GOYIuER1L+/mccN4gjLoPbacbcN9KVHswnh94vADX/Sm9CEdlsw1H1MPdvyFjod4l0paBqIjOhGRFu6tXmAVF8ZbwREXK5jw2xwp3m0a4nsIvixqMCuJyewOgFxSoWs3FyTjr35mxQYvL2JB7zyew1NkuW9xjaSS8ngpo51NwdHjL9M13tdZQITFe/jhob45alRBQaY3RJkV+ocnFBAxX7Ecohz/naIEwlF+H27yYNsZOI2BAb76WymZm/4ikhhV3txkjl0NwEMf/yFbwcF/fxQ33hZwqqQUlEO9OPzk+kEVDHir8VfQQ8TYjkLsToqSxqMtePuVOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDVUzzPF2P6x809cD1f9N/b1/wXLEjYbhAgeOQc0I2k=;
 b=MOqPn+VmC2V1bPJh8DJ/A2mX1pdLLIzDNKKHXqHntm/jDClTQfi26jMx9YNtuIuD4uRn4GaZCCKQl98vfdSsQdJH5RVYhZK00DWhqwiw06+X1MMWbST2cngavZcs3eEGI94HLN9UsIEy1zgJj9bGDaAXVRcAPU27uOSwGlrLdQ3kuAmsWUz77LnrC3EjaISCSbZ/DtkICdVzoY966BgKRbaP8ito9Wq6qeZydJ6m0kGsrCE9Y+7+/2n1s502CHkm3DP73tBF/aVUoB8RsT4lsSZVIjw26+oXi82YIRdiqSGZXni5mxB5V2lEsfNwElF26TSl/KPjDnkJoIRerey64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from MN2PR15MB4254.namprd15.prod.outlook.com (2603:10b6:208:3a::27)
 by DM5PR15MB1212.namprd15.prod.outlook.com (2603:10b6:3:b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 19:05:59 +0000
Received: from MN2PR15MB4254.namprd15.prod.outlook.com
 ([fe80::45cd:ded1:2bdf:79ae]) by MN2PR15MB4254.namprd15.prod.outlook.com
 ([fe80::45cd:ded1:2bdf:79ae%6]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 19:05:59 +0000
From:   Nick Meyer <nmeyer@fb.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Releasing v4l device associated with a UVC gadget causes kernel panic
Thread-Topic: Releasing v4l device associated with a UVC gadget causes kernel
 panic
Thread-Index: AQHYWNdSC6x6R55ZKU+/ls3zGdNT2Q==
Date:   Mon, 25 Apr 2022 19:05:59 +0000
Message-ID: <MN2PR15MB42547BC4095655BE67CAE6C4B9F89@MN2PR15MB4254.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: fa63bdae-ed6f-bd4c-0f45-d20e6368acae
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45dc0997-d7ad-4fda-7b6a-08da26eea22d
x-ms-traffictypediagnostic: DM5PR15MB1212:EE_
x-microsoft-antispam-prvs: <DM5PR15MB1212A74352C26D7B1D3057C8B9F89@DM5PR15MB1212.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: snfQq8sBSTjhM2ghiO15JSO4oiBJHsDF76BdnqxBoKYEl3BXPynd7M9B/hVyfkeI1BJC+KiDUHb6rB3qFrYKS1n/7sajwtpn4O+EFcq3BBYJ5EvLFJ/LaMIjaVoAkFUzVgaMyrAHN3Z7DFT7urGnmHUcYgKXR3zlHMRGloLNZu4A4KOKAlzF9BdV53AIZTIyvaNBipc+8j1HKGhymUAlLqDrnuk445FW6KkQsDOZeFQ8hBp9bThiw/Rn1f4WUxqIioluU4Dk10nkoWXmLE8pXobpf0Z8oEiGH7g0v/CyqsQ0LCa1X/5+PtWWKadLHdE2RMiaUH7mDeaSTUuFzcuzWzJooEOrqImzxKjG2rXKt7bPHQBt4vNX4Cojm9XKEhBqYRgyalRJRMhwNXVu2n2CYUm3u1T7lPA9AXDYX0b8YpQb/Dzeo5kPZAyJ5n3bwaz+7qBAVx2/1NSkiK67pl+KlOueu7rdAwTGKFMUtt2oxjYjwlg86m7u+9ol6w/Oi2oLiKLI9wGHA3PWcQ6LiUIz6EfgFe5LTWAMC2b1OjPsZHbD2gEIV0zbtoYp6Cu+pwI+oYd0FrAZKZ3p5/JHDXLGJ7mf4XVIZoD3E8nNdOSYkPBTn1GmMJgYxgwLlEt32EdKGoKwgcMYhu5D4lsRmv3DTuq2LRL7eGHEVrp0dXtsk2NVci/EO/hgTdZf2D4d23jx9kQrr4KTWCMj1gvoWFP2h0AfUIccko5aX2P8xaoYrYQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR15MB4254.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7696005)(66556008)(66946007)(8676002)(66476007)(76116006)(6916009)(71200400001)(9686003)(6506007)(508600001)(8936002)(186003)(64756008)(86362001)(52536014)(83380400001)(66446008)(38070700005)(38100700002)(2906002)(122000001)(5660300002)(316002)(33656002)(55016003)(42413004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?NlZrDSgY9dtg6utVJ7t+m9uAErHOr3rfglNmmWsy+3gErt3bB9exI4pe?=
 =?Windows-1252?Q?pmiAHh2NosxeBsm+9ACievxDPc3hcXZG+TPy/oiu9X/C9EmY55w/+Ha1?=
 =?Windows-1252?Q?p8AZiFQkP97KUY3/doJxWau+PsyeFzeW4J7GwF26OOTY9a9Aaxy+pNNr?=
 =?Windows-1252?Q?VP9W3hy3ftfTjfTlNAJpoZEoqboGQMQGWuMF/NNd/phRP5M8aS2c2ZiK?=
 =?Windows-1252?Q?r/EniswrxXMi5UvKUoJZ+E3IfpL3LUXUYU485WR68eaM09bYk/mRtYnN?=
 =?Windows-1252?Q?bkcnyCzyg/p7p9yci66cDOyOPWmHO1f9F4M7xHqsRJDCbIh0YjLpurnl?=
 =?Windows-1252?Q?L1jE+3Lr2mjcG/q61X7RwgQMtC/+ehXn8xHYIdyXgpjqaMLmZkWaCZMB?=
 =?Windows-1252?Q?VmGGQ6vie8YUd+F6fYOOk4SZ5dgAyNkELuZVUhvcnFEKZdgXmmX266br?=
 =?Windows-1252?Q?HTfQXYTjvwF9gfw6wfbbs0Jmclccmy88r43xDpOI02Fd9np/v40K2HrG?=
 =?Windows-1252?Q?GzNzQ6WlSbUb9YDS96KONiWOTvGBuISJGy8VAybSf7KSzX6UncRJ50x+?=
 =?Windows-1252?Q?Z7TIKybnugjS40T9a6DCyD9t7stDpiNgLRdhmdNUOMBFJaThPS4fOK5u?=
 =?Windows-1252?Q?uBxsKdbYGDTajybuEZU/wviz5j/asL3zb3laZPzriyyEMDTVSKN/xVpH?=
 =?Windows-1252?Q?kq3FzDsO9TXk1kKNteAXJeZW9Zkk7E0pZLyOX/6QJ/HPHelcJHuIrOPe?=
 =?Windows-1252?Q?IfEdl5v/Xu3bhrG4NP1EVKrOalPrmwMI3B4WBiFlrb0+Qp+ZF2pf2Rvc?=
 =?Windows-1252?Q?hGgk5GTy93MGcbpqOz2MkqXd8sgNsrx7HGKlB8PZFEhBnD7cU6+nC2O6?=
 =?Windows-1252?Q?lKODaekLEn6w6Hleu9csmYA+KGAaeBQmTI1n3Q9PziKFrxJb04S0ki2v?=
 =?Windows-1252?Q?ROQz3d88MPtW6JC1B3/ihE/zeKH3B20vQk33oqdJaWrBV+YT+zuR3IfD?=
 =?Windows-1252?Q?AT3ZGk0RQ3fFy+md8VEYM8cJ1+G6vHCxCeNn482T2JQLMMkDhYDZlMuu?=
 =?Windows-1252?Q?ztFVmOe5Fi/Pccyj+wMMYeXz/mD+1YO8XQNa47JqCW5dz41gCRqWOsza?=
 =?Windows-1252?Q?RNGngHysllvE2zXE+UnFSSZtvByD3v3qw+VhgKP9eBSMYeZiC9dXbNFv?=
 =?Windows-1252?Q?kCIxS/jJUPmHR4z758x8mnbkyIs0kqgy/kY6+5s59QvQZ41NdZq6se1S?=
 =?Windows-1252?Q?mZBOyQciNUeCP6f6IgjeBd8fkKHF4r2wVPjqixe5iFjNd+ZlqphTe8Sr?=
 =?Windows-1252?Q?VYAENIB3qqhAEEYFnlAL/LKIcc05UOtC9aQlv9YzO0vqqCP1gUblBnf/?=
 =?Windows-1252?Q?EA+RbMIZD2C1RLGDFBqVYnojrTH3VEY0sA/ue4NEehBQ7P87paqQpB03?=
 =?Windows-1252?Q?jQOikAA/xYx6i+iRBy+i0YLQHenRf4Q7hfRAboUlbMMm/PF78+nCZIr6?=
 =?Windows-1252?Q?arOeB8TTmgoLgd7JMU7abJ7Re6pqzUxQzAosnTjXkBxrqRk+a2zrQd33?=
 =?Windows-1252?Q?YZfMn5QViR2GNtpoVajUc0HnhrcvSFqxnp4gtdMk/8tm5qOrAPR2Mb56?=
 =?Windows-1252?Q?3J9/tq5EcV/dpVxID7GV1hPZBqYb6AKvnRIJX2fzeoA2zJpi9Njg/POG?=
 =?Windows-1252?Q?HMALMyBE6952voW7/n59JWFMvbpArIEkIKO42UbFFaT6dcqU++9rLGPc?=
 =?Windows-1252?Q?qO5A1eY9qomPeXijOheSOvi/XntrPwNwill5yGfAzKUFTuVzciTy7o2U?=
 =?Windows-1252?Q?bbb8Ax8XW5GDnA6OFrRu1svCMqFGqtLvudiGtQ9RmQGduEnScwl38Amw?=
 =?Windows-1252?Q?IQjF1MROymd7dA=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB4254.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45dc0997-d7ad-4fda-7b6a-08da26eea22d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 19:05:59.0839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WfAwBLgu6D+8dnAz3DuZ2RCE4ULiWCNCIPFVCbBZc93LVDO7EUdXTikUCNe4BNQO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR15MB1212
X-Proofpoint-GUID: 7fqTuHUVq3eH7kYzmvJBTgyRIAQgD1o0
X-Proofpoint-ORIG-GUID: 7fqTuHUVq3eH7kYzmvJBTgyRIAQgD1o0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_10,2022-04-25_03,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Releasing v4l device associated with a UVC gadget causes kernel panic=0A=
=0A=
I=92ve set up a user-space process on an Android device to stream video fra=
mes to a host using the UVC gadget.  During testing, I=92ve encountered a k=
ernel panic when trying to close the handle to the v4l device.  To reproduc=
e, disconnect the USB cable while the gadget is streaming, then when the UV=
C_EVENT_DISCONNECT event is received, close the v4l handle.  Based on the s=
tack trace it seems the kernel pulls the USB gadget down before the user-sp=
ace code has a chance to close the v4l handle.  I believe it=92s a race con=
dition as it will sometimes close without error (but that=92s infrequent). =
 Here is the trace from the pstore log:=0A=
=0A=
<6>[   48.314715] Call trace:=0A=
<6>[   48.317240]  usb_gadget_deactivate+0x10/0xfc=0A=
<6>[   48.321631]  usb_function_deactivate+0x50/0x88=0A=
<6>[   48.326200]  uvc_function_disconnect+0x1c/0x44=0A=
<6>[   48.330770]  uvc_v4l2_release+0x28/0x80=0A=
<6>[   48.345157]  v4l2_release+0x38/0x88=0A=
<6>[   48.348747]  __fput+0xb8/0x1a0=0A=
<6>[   48.351892]  ____fput+0xc/0x14=0A=
<6>[   48.355037]  task_work_run+0x80/0xa0=0A=
<6>[   48.358718]  do_notify_resume+0xce0/0x1114=0A=
<6>[   48.362931]  work_pending+0x8/0x10=0A=
=0A=
In that function, there is a conditional at the top checking gadget->deacti=
vated and gadget happens to be NULL.=0A=
=0A=
I was also able to reproduce the same crash by disconnecting the cable whil=
e not streaming if I switch the order of shutting down the gadget and the v=
4l device.  So explicitly pull down the gadget on disconnect, then close th=
e v4l handle after.  This results in the same panic and trace.  Otherwise, =
if it closes the v4l handle before pulling the gadget down, everything clea=
ns up without any errors.=0A=
=0A=
If anyone has any ideas, I=92d appreciate any help.  I=92m happy to test an=
y patches or provide any additional information that might be useful.=0A=
=0A=
Thanks,=0A=
Nick=0A=
