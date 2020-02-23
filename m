Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF63169766
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2020 12:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgBWL4T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Feb 2020 06:56:19 -0500
Received: from mail-dm6nam11on2046.outbound.protection.outlook.com ([40.107.223.46]:35502
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725980AbgBWL4T (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Feb 2020 06:56:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdTBoHc5BpSlzkdJtICXy3kSqjlPWNqKHW3UshT8Tr4EVP4BPoP480iM08o04cwfi3v1poeK+h/MatccJyzt77pshi0F8DGRELEhx99HQH2ejkN/z8doXuOstuvBDvPepBNGIudC5YFN9rUHF+3W7Aj3zqDcM4YgIlsuqDfTBvKPIauWWFw/VMvQY2wNNE7K04PAwSJWNcUDirb3i4KjhiGOstwkSEWpM1p/DOnNEZONyR6za9UDYBXHIBgGdh5ez3sv3HVdBO2YAcndbX/rDeHywKPGynhsq0HnOpee/LDLEs0RBBSI7hH2pUMHq4XpdOfNtPdui0OrEeIIlKd8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8GHXFzEsa3qLyrNQV+MbsMsbDND+2yLW1H5RTJzVvE=;
 b=AgzCn6MJ27syW/bo3vOeU+vsSsQRYbGAEDqsvEi2mwZDfA1e0C7S392zwnAe+72xnrAZH8NJHX9zGmumVBIRqAq7/X+0D63oD9ODIi/GvsbB3r/DjPfqr7yLjDAHdjzSXU+5jg1mVbuNN4B0W3cYLb3F0laebJd7ClsX1En6rtt0AM7yToPYxw5Z3EO6HKgIMifYnpfCIJT0hK8GE1Ia/HPkOrF2JqNfliv7KvmS5WHbMVwytE2CGkqwhmj0NsOU2puOHpbsHvAClS//zW8yt4N15RhhI7GpMIcrwKeAdNfBWUkO+eJ7KBy5gPzjRg23FV0X3y+Tup0YEY2XOdH3AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8GHXFzEsa3qLyrNQV+MbsMsbDND+2yLW1H5RTJzVvE=;
 b=Jw+XAsHDWZozD1jAqp/kTm6Q1YBEQgwxvbgsFCU941pbC5e5v8K4+0YfqR1WPj9If4wC1mYI3aH2Nxld5/MIzCZEn4HtrYs0TMVHoXYyzLTSeQIP/Y7/LiKZw2Fov9zONKGUl9zThV31qHWh9zjDK5QpdAAIir9TnfVjqszGYso=
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (2603:10b6:805:6c::10)
 by SN6PR12MB2701.namprd12.prod.outlook.com (2603:10b6:805:6f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24; Sun, 23 Feb
 2020 11:56:15 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10%5]) with mapi id 15.20.2729.033; Sun, 23 Feb 2020
 11:56:15 +0000
From:   "Pan, Xinhui" <Xinhui.Pan@amd.com>
To:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: [PATCH] dma-buf: Fix missing excl fence waiting
Thread-Topic: [PATCH] dma-buf: Fix missing excl fence waiting
Thread-Index: AQHV6kBADZ+jdaLUr0CyJYyj5pb2Hg==
Date:   Sun, 23 Feb 2020 11:56:15 +0000
Message-ID: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
x-originating-ip: [101.88.215.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 891c2a85-e7f8-47e6-4fa0-08d7b85762c2
x-ms-traffictypediagnostic: SN6PR12MB2701:|SN6PR12MB2701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB27010B4283E16F5A877BE5D687EF0@SN6PR12MB2701.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0322B4EDE1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(136003)(346002)(376002)(39850400004)(189003)(199004)(2906002)(4326008)(6512007)(81166006)(54906003)(86362001)(26005)(6506007)(6486002)(91956017)(71200400001)(66946007)(316002)(76116006)(8936002)(33656002)(186003)(110136005)(5660300002)(66476007)(81156014)(66556008)(8676002)(2616005)(66446008)(478600001)(36756003)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR12MB2701;H:SN6PR12MB2800.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XGCyTEwFzn8MMty6NUKgV87kAg6L2KfnGs4XUmzu/SGsr/z1LmLYTIVAUH7qLZkAHCqPACnHke47QO91EPuYqy61QOps6ztHZsy3il7xzoidfyz4eUENzI7eip73nHD+3YUlJFMkfPP/w3W5Mdjs91QOCPHZRRZ0jyJ3xvbjcEq+AhvpeahwneC/WDX3OcUkDALDkPAflVL+GXQt3DZccTf8ev14TvHUyFStvJsUuEO5mGUrZ+hNP3+BCnUdg/ugss4PV7iESolQonq5+P5AnsQ5z6l7HKRXb/qMvHXOUiefdxWUj/1cm5UKXMg31g8NSSt+nKUL8L3eS2dpTtakOWmBYHBFYYFjztpkYrnhIlKjQ/j7kFfEB/aDvJ+Lgkp0dGMF4Ah9UDF/c8/Vrsoctz3UfJuveGen5FVbO56If+V0NNzxXxSMtyYvHJL20LiV
x-ms-exchange-antispam-messagedata: VPZ8/5zawckNMnkqmXwfl/Ypz86d9s8jV9jgWJjeAPcCL9+x2NizbaOQASMHw6P6h//QaXMAEi/APpy6qCFCnyv/Cl8mZgdJDhIsSA9VKs7q1aea2KYluUyqOqzABxFdCRe9APH28/SJEzQmHJBkQg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2673CC912478F547BA3CE5D28290070F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891c2a85-e7f8-47e6-4fa0-08d7b85762c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2020 11:56:15.2293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HzaejKnVZPiMXNYp+OkcZz5QxdBfhzf1kKf89KQr8ANZUm7DQzAcoZRwTWoC455c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2701
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If shared fence list is not empty, even we want to test all fences, excl fe=
nce is ignored.
That is abviously wrong, so fix it.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/dma-buf/dma-resv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 4264e64788c4..44dc64c547c6 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -632,14 +632,14 @@ static inline int dma_resv_test_signaled_single(struc=
t dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 {
-	unsigned seq, shared_count;
+	unsigned int seq, shared_count, left;
 	int ret;
=20
 	rcu_read_lock();
 retry:
 	ret =3D true;
 	shared_count =3D 0;
-	seq =3D read_seqcount_begin(&obj->seq);
+	left =3D seq =3D read_seqcount_begin(&obj->seq);
=20
 	if (test_all) {
 		unsigned i;
@@ -647,7 +647,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, b=
ool test_all)
 		struct dma_resv_list *fobj =3D rcu_dereference(obj->fence);
=20
 		if (fobj)
-			shared_count =3D fobj->shared_count;
+			left =3D shared_count =3D fobj->shared_count;
=20
 		for (i =3D 0; i < shared_count; ++i) {
 			struct dma_fence *fence =3D rcu_dereference(fobj->shared[i]);
@@ -657,13 +657,14 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj,=
 bool test_all)
 				goto retry;
 			else if (!ret)
 				break;
+			left--;
 		}
=20
 		if (read_seqcount_retry(&obj->seq, seq))
 			goto retry;
 	}
=20
-	if (!shared_count) {
+	if (!left) {
 		struct dma_fence *fence_excl =3D rcu_dereference(obj->fence_excl);
=20
 		if (fence_excl) {
--=20
2.21.0 (Apple Git-122)


