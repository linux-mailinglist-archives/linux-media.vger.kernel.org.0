Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 418457D671
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 09:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbfHAHhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 03:37:12 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:60190 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725946AbfHAHhL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Aug 2019 03:37:11 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x717Xgmt014102;
        Thu, 1 Aug 2019 00:37:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=proofpoint;
 bh=0lSlGxXcw5Refo0UoY/MM3UhAOKdIi0F2tN7vx1BzTI=;
 b=Wlpqf0jgh1oeYU+jJs71MS9uzy4O3YVWY4VEhAQDM9CHf/sdJFeCSCD0YyOZ8aCxemBW
 N7Y9F+K+NedYxAs01EYlYW5wHhsGzTWwh89LBMc6VbUq7RBZDiyEJANcuqVOPl01T1NX
 21zNHRz2lCfWG9zdQcERs5sbFZNGe6l1H4i71yuzDqBMxhq15NWdJs7viv1WuNvx23E5
 AYSDyzRvQ12mSY1fng/Sr9301Rm+qbDAb3FjMMIRlGPzY7EVvbgLfrym7s5pf1N4AOLk
 5PCj2xnQ9I/+VPUD1muQ+oO/vf8zHzofQELdQV7ZPtyq+WPX7h892Cs1kH+Xle9GWfjY hQ== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2055.outbound.protection.outlook.com [104.47.40.55])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2u0j716vxf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Aug 2019 00:37:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMdCTO0h9xATEcrHLd07TDTTBFYMYrywwAXWFdZpjn/Y9FdPwAtZmeAK7bHbW07SiIT6rfIg/siY6bFaZgRBE6i8eVj9KfoA8230gex0fKKxy5Z4a9zSOENrv4DFCcM/Vclp8JmpzPFLlMFIm3u0HoEAVvui48qD1nD8wqCE5GzTXSdcRWpbaqCwKDVkyEXRtsCASeuhpJSJJ0hRRh6ZQFlV5kJqKlh/1FkoJnglu1t9OO8dJeTXu7BfQnYh6OKTZvHzfcUHqWsZcNTzqNvnt0EemdJeS+/QdBwo/I9VnO2LZXpGhXgGwWCnYbj1YQo11ahrH3pvi3Gtu+k6dJujDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lSlGxXcw5Refo0UoY/MM3UhAOKdIi0F2tN7vx1BzTI=;
 b=EdY2THsxQn8h9uAK33rRifijOFQtrMUNXeewtELFKiK2o5AUyPXrToga7pT/5Jdr53qGll7bZiGxsgDkaLaGRBlEOHWdv5iMZm4ZDe/QQ8cfS0hR0hZa0Mej2MrlAwbELe4TWPuMbPzrJvDs7wAOsSV5CvhHCmj8bHNJBuohRchEiOnhWXv1LC13Z9WChQx4cr5/Qz4R+uw7jTgoo4ZxpNM2b+A/VMOBfgOgXr0untRqRN+zWJFFY6QFVd2z3Ky9drEAAxojVxEGKQRWnCvpv+SlEUhFqJh+i+UJYzvms9OAI1SNHLz55ni/ZTsr/Dy/9UTgyerGIeuPJpMpVQ4ZnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=cadence.com;dmarc=pass action=none
 header.from=cadence.com;dkim=pass header.d=cadence.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lSlGxXcw5Refo0UoY/MM3UhAOKdIi0F2tN7vx1BzTI=;
 b=TDakQ7yX//gQUl5d2gI555U21fMJfjUCbikw3S+HS53T8g4fr7zuH22iTXo5eSb9ib8yhsco/5HWfVf3ByGtcMRGnQuqzTOvWnvNqR+KHO5YZm9PyXP1Qi+TCWXeJfubFjI8hp0IhUY6vmiF57xCxQge9ttjHWe7QrtngD18e8g=
Received: from CY1PR07MB2521.namprd07.prod.outlook.com (10.167.16.12) by
 CY1SPR00MB264.namprd07.prod.outlook.com (10.167.9.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Thu, 1 Aug 2019 07:36:59 +0000
Received: from CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::e1bb:ffdd:3a02:ef97]) by CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::e1bb:ffdd:3a02:ef97%7]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 07:36:59 +0000
From:   Jan Kotas <jank@cadence.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Rafal Ciepiela <rafalc@cadence.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, Jan Kotas <jank@cadence.com>
Subject: Re: [PATCH 0/3] media: Add support for Cadence CSI2RX version 2.1
Thread-Topic: [PATCH 0/3] media: Add support for Cadence CSI2RX version 2.1
Thread-Index: AQHVQtOJMYrjqofX1Uumz6TflV0q3abl8iaA
Date:   Thu, 1 Aug 2019 07:36:59 +0000
Message-ID: <A00C1136-41F2-4EB9-8694-E33608EF82E9@global.cadence.com>
References: <20190725102648.13445-1-jank@cadence.com>
In-Reply-To: <20190725102648.13445-1-jank@cadence.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f25a75e9-22fb-486f-47c6-08d716530995
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY1SPR00MB264;
x-ms-traffictypediagnostic: CY1SPR00MB264:
x-microsoft-antispam-prvs: <CY1SPR00MB264E6C81CA084A95E04B1FBD0DE0@CY1SPR00MB264.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(24433001)(199004)(189003)(36092001)(66446008)(86362001)(6436002)(107886003)(66066001)(91956017)(6246003)(14444005)(256004)(76116006)(6486002)(66946007)(66476007)(229853002)(66556008)(64756008)(478600001)(446003)(11346002)(186003)(476003)(305945005)(7736002)(53546011)(6506007)(486006)(2906002)(81166006)(81156014)(6116002)(3846002)(4326008)(25786009)(8676002)(8936002)(68736007)(316002)(6512007)(26005)(5660300002)(102836004)(53936002)(4744005)(71190400001)(33656002)(2501003)(99286004)(76176011)(14454004)(110136005)(71200400001)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:CY1SPR00MB264;H:CY1PR07MB2521.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AU35ROmypNmkfPOZ6A3uJwwhmc1/2CaIOz5iL5B9vr7eMm3Y1WPhXh07HWkDloprSfmYiWBc8pNToTm6nUfqAKjFwnh7Opi370AuhAIz1Qz5TgP6KO5o8J7NKK81A3K2bXn4jYcRYratsBieJSQK5piGtaOd7+NHtuXSmzyBGtdgpHEANM7qy3NoRrSY3gVVTtcn0gXi91svPu2uK/MY8PBSfdG84r9NyXlLPXUcTZDMXnWXCJMs08ZfZQ5HGThoaBz6q5LoBWD2dnFPBfotQgY+WT39YicUWYS2qFuizuhKTb7Ee7YRHMNy7toct678uP+hJVWZtWmL74KrDQm7QjDJvtf5zrM3tFgnyVfR7DTae2l+ScMz0RQF1e3onuMxizSCOhRJrfNVI2rQDPCgBfsjwAjLBXvd6/XOe/n7jBg=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6DDE71B775928144BE683B781BA897E5@namprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25a75e9-22fb-486f-47c6-08d716530995
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 07:36:59.4578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jank@global.cadence.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1SPR00MB264
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-01_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908010076
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On 25 Jul 2019, at 12:26, Jan Kotas <jank@cadence.com> wrote:
>=20
> This patchset adds support for Cadence CSI2RX controller version 2.1.
> It currently limits maximum amount of data lanes to 4.
> Existing compatibility with v1.3 is maintained.
>=20
> Jan Kotas (3):
>  media: dt-bindings: Update bindings for Cadence CSI2RX version 2.1
>  media: Add lane checks for Cadence CSI2RX
>  media: Add support for Cadence CSI2RX 2.1
>=20
> .../devicetree/bindings/media/cdns,csi2rx.txt      |   4 +-
> drivers/media/platform/cadence/cdns-csi2rx.c       | 150 ++++++++++++++++=
+----
> 2 files changed, 129 insertions(+), 25 deletions(-)
>=20
> --=20
> 2.15.0
>=20


Gentle ping.

Regards,
Jan=
