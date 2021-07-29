Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B15E3DA37F
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 14:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237062AbhG2M4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 08:56:17 -0400
Received: from mail-eopbgr80045.outbound.protection.outlook.com ([40.107.8.45]:56126
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234245AbhG2M4P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 08:56:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLoEt/MUlAfqDWSI+pBel3EH3COlfovGzipcSyEXR5EjinNjqWl24pFWGKn3j6uaeCE0M/fb1YDShF/lOUpyeAe1GBRi7YHf7wV9A4PEC2cNtXInQgYvoq8Q4gdVZ4VsiOaHUJYt8bNC8zjsBMkv5TU35YY12XDk7G3so3ZdgDwaQdArqM+FRj/Zot66YCDH1OjltvD0P4yexyYZNj1dbBnKPaCdkUeux8875r8cYuoRdeWS6IR3aBTdqGsHGhQYpLf7XXPqRXVJ+Zq9ffGDPemL6Fc6boCeQsfCFOy+qUIgYzjxtcRcbGuQgLCdc7pKyeeS4qxMMPdjqHYpg0qVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdXE+Aq7cRotd/1lyCW6KX1y1uKgsxU7my+sBkCEAKk=;
 b=GKFYxaTYtLpUBMc2td2xcmymv7YtB7zJzgcK75yw/PM6cO6jSlPZIbQY7yuZ+Ok0vNslOunDfLEaQmTvHbe1S6SPIab6pFY5F9ZVdJhc9BWFNfojk5wSwUxtCHDdGDQo5kGaV/y7xogg9QuZvLdentqtXuX2V1RhLQ2NiVXhpvhqo7qyJlNcwj+4dApjSJB+BKYAifNeT4ToOGey2qo7pPWNLbpvtCxUYRVyS/jEUAJdF1SvbDDOdYgpYmnH+o8OrnR15OmbHLORxlJ76Tr/HWNGrE24UN6RQRRK1nsosiim68UiLh6IApVQDxuAIw/HqUFuf2gx2xtBx2tDB3cW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=trinamix.de; dmarc=pass action=none header.from=trinamix.de;
 dkim=pass header.d=trinamix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trinamix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdXE+Aq7cRotd/1lyCW6KX1y1uKgsxU7my+sBkCEAKk=;
 b=DEk3vEFsey7PE5TVjvTzxiFz2ublv2Nog0HTGcayoFfofoSMw6JxYN4T//7eXZ5N+L2c/q2nLdK/cxbXrSyNEQlL8yL9s3WY8oVElgZRytIbwy7PnxNI3rVEX8X8y993laJ0Pb1U58G1YcZCDRUUK98XCD0Fa8Or4AkRUc3hw7A=
Received: from AM0PR04MB5825.eurprd04.prod.outlook.com (2603:10a6:208:127::19)
 by AM0PR04MB5540.eurprd04.prod.outlook.com (2603:10a6:208:11e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 29 Jul
 2021 12:56:10 +0000
Received: from AM0PR04MB5825.eurprd04.prod.outlook.com
 ([fe80::fd86:de23:57cd:70b2]) by AM0PR04MB5825.eurprd04.prod.outlook.com
 ([fe80::fd86:de23:57cd:70b2%4]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 12:56:10 +0000
From:   Jens Korinth <jens.korinth@trinamix.de>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: media: Rockchip ISP/CSI-2 PHY - Request for advice
Thread-Topic: media: Rockchip ISP/CSI-2 PHY - Request for advice
Thread-Index: AdeEdpBXqmniMd0aQwKdTsU3yEt9+Q==
Date:   Thu, 29 Jul 2021 12:56:10 +0000
Message-ID: <AM0PR04MB5825C62E431C3DD054C4DB6E98EB9@AM0PR04MB5825.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=trinamix.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60948658-fec8-4854-6a69-08d952903d24
x-ms-traffictypediagnostic: AM0PR04MB5540:
x-microsoft-antispam-prvs: <AM0PR04MB554086B2A092D60A7CEB8B2898EB9@AM0PR04MB5540.eurprd04.prod.outlook.com>
x-mg:   BASF_O365_RELAYED
x-mg-sentby-basf: True
x-report-basf-outbound: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xyE8tJTD7JWIdg7+J8phFzSPjBThgvDgpszw2IY/0QsRV3U67GE8hHw+hjXoukF8CP1CP4RFnKJHEPZcg/5M/dgmmTvQtqtCM2xlcl4kNZBh72RfMHennkTU9KufHt4xvlK5fL3B5VxwOp2VnJI2ePykxp+RDtdopEleq3hjWvwR9XFUd3YStw4bBeUdGxjLVxPFFbMw8TZX/UBeHo00svA7MKe2IBskd0q38oAzkK0dlSBc+6dQpfnoOoRsL8xbJZTy1c64yXFdbvjU9SoBOYJbBH/4Beif/wX0l2qoSXsedsbraWRw4e868n7uouZb4sHvzth77lHFwwDk1ozki3OvN3Cmg26SiDH6eOd0/YlGAJvN7sna2A4CCDFf6TQTqeV8eREoULJU7rRnN+LJNL4ie1bfm3tLfwDeemA9ru0Ak82ScDkyAYVWNHO8cnBZ6Ae3wZPtnyNzcTkIe8rsZ8LjWHNqH5vnuIZnGU4fWCtmmcXjgAl5XeTlhCKxtU6VYHz2PgAj/Vr/8FNWrvsjUZBLoXBHohOHPkJ9xmw2AB+bkSAn+k3qeMJ48AmpcFCVcB1AWI4AIIaBqD9Gs7PP1HorL0tYXZRbNaYU1TUixH3pWOOfHhTmyF1mMJDEFJDmsM1XcDasi7WLt/dIMsgo1KAxN1Tx9u6895JNBFf+8VtQKGcPlb/nliavzj1kvjWHwvdHcy8NG499KikZ0aSa/g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(83380400001)(33656002)(478600001)(7696005)(6916009)(52536014)(8676002)(316002)(64756008)(66556008)(66446008)(2906002)(38070700005)(6506007)(66476007)(9686003)(71200400001)(186003)(66946007)(5660300002)(76116006)(8936002)(38100700002)(26005)(55016002)(86362001)(122000001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YpbBQAgNjFxdcshwfmc/Rf6byVgV9bti9F/q8RIPEuGIhL5F9S4OIG7X3B0G?=
 =?us-ascii?Q?H9dLl25mRT8B3SmSy42UMzKRWvv9K2d7q9Aksb0NVymZ1pj4IDwpIieiK2Vm?=
 =?us-ascii?Q?d5B0ABOsZw81yh94hGdhrgLF5pd9CeZ/WXdaawWjIOpM2cKtKYPZiii/s4vv?=
 =?us-ascii?Q?fUMTJvj14g767VsPBX9tV6CT0wKfa1RfO3rDGxFFqFky6phcjXpgjcHh3vJi?=
 =?us-ascii?Q?UilYMJx6Z9h5r96a0jzXXyklFH9brHwhq/ZkfrvxKLl7LbNiEgscdbfIT/Bs?=
 =?us-ascii?Q?0sAB2Da6dR3EVOlG+6HjTYQi7kLkfOvWA/qRfuXz3dDdNoMFrHGJRkKdlSXd?=
 =?us-ascii?Q?1DqrwE8CDYUv6kWunDz/uYcCxE10983df4UqbCJdkFlHvik9882Sz2p7nbxK?=
 =?us-ascii?Q?LtafhNPd2j2JGh6c7HLR6qXdHCRowvuASfcnIjbyTrW2ViKW2Y6NqKmX9zh9?=
 =?us-ascii?Q?AJYVoBfh5flU9wPul6OvhPduBVl7dgx9rqsoJ3sa7yDXeosOsKYSyT+L7Fk2?=
 =?us-ascii?Q?MokBjmvyJDoC/GRV1PBPaAcpQSbDgcXhiNxX0I95GB4FyBBWWTrxIMpOLXWT?=
 =?us-ascii?Q?/RedlIt5W0UgK/dOFXufTzA46GsSXRDN6NRY60KX8h0at8a3CQON2liAEECW?=
 =?us-ascii?Q?lD/EY07W5tDwUKQ0zI60nDieFQOP86HxiuszyUvL0EjjYY4JhG/RQ134CqQk?=
 =?us-ascii?Q?9HiExjAtINkJ/Dl9vQMjmuh2p3y5l8tj1hFQrm60OS3zfaO1cALl5upsNHkh?=
 =?us-ascii?Q?t0fqiE42XlHvkLxf4zy5KD9RkPA4dX8JBjizD/FdeHFuCXk3bSw4ocyOG+ex?=
 =?us-ascii?Q?5P9+T5jhcQjvr/0AswmPvQ3BvERftPf7bCvY6+z0QDoL33NNWtgFlGXwuVXm?=
 =?us-ascii?Q?lPZHf3K00ULFVwHsQjFaifkJq05polUjtqUhmWA4BY2z3zD+zZ508itw9PlH?=
 =?us-ascii?Q?OgK1I2UwcWUW0gIO5ABJflGwHWW2p5s7QF1jVDGt1DCxtjlSGvnevwCSj5Og?=
 =?us-ascii?Q?nHCzl/GFEU+ddv1J8fgB681Y4IKdT91w4RVi6LjmpNXcPVmT5/MfoS9/JMvl?=
 =?us-ascii?Q?wOicHOpv16reV/kxthgoQyvrQu4/EZrxA3ExtWCnSF2OJgc+RBBVu9tk3a2j?=
 =?us-ascii?Q?fWbKd1waRcX9qN0uc7+//q2wtcUoLL14RgmU5SacZFJK4ldXyTE8BubGcLKd?=
 =?us-ascii?Q?XYLkBLwA9EzKnHFxb+EoE7GEKwz2D6nT5Of/R7jULT7zLZ0f/ljJQVtn9CvS?=
 =?us-ascii?Q?A+FxXOQumoSNWJ/hHCIXSn84MA4m/FkFIk7JR11qBeSQY/ZntG8UvGjdsc8u?=
 =?us-ascii?Q?V7Y=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: trinamix.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60948658-fec8-4854-6a69-08d952903d24
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 12:56:10.3161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ecaa386b-c8df-4ce0-ad01-740cbdb5ba55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nm+hXo2GsOyE7vUuKnS+ttpMmJgTFNOZAAsP2fA2mYvvlgr9LTMycIgJ215xsB9LVS5rqoZAavicZ0ZDstftrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5540
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi *,

I need to implement a driver for a CSI-2 camera system on a board using the=
 Rockchip RK3399 SoC and I'm wondering what the "proper" way of doing thing=
s would be:

We need to capture variable sequences of frames where each frame has specif=
ic settings for gain/exposure and illumination (GPIO-based). Configuration =
of the sequences happens from userspace.

My approach would be:

1) platform_device -> media_device for the whole system (camera sensor, CSI=
-2 PHY/ISP, LED driver, GPIOs)
2) i2c_driver for the camera -> standard v4l2 subdevice supporting V4L2_CID=
_EXPOSURE, etc.
3) i2c_driver for the LED driver -> v4l2 subdevice implementing V4L2_CID_FL=
ASH interface
4) additional v4l2 device node: metadata input (sequence definitions)
5) additional v4l2 device node: metadata output (sync'ed with video output)

Q1) AFAIU, this media controller device could support the Request API, and =
handle the entire sequence with a single call from userspace - is this corr=
ect?

Q2) Am I even on the right track here, or what would be the right way(tm) t=
o represent this kind of system?

Q3) If this approach is sound, is there any way I could make use of the rki=
sp1 driver infrastructure to setup the CSI-2 PHY and the dma engines withou=
t extracting/rewriting parts of the code?

An alternative solution could be to just use the STROBE output of the camer=
a sensor to detect the end-of-frame and advance to the next sequence elemen=
t. That would not even require any v4l2 integration, but it does require an=
 additional interrupt handler. However, the metadata would have to be added=
 to the frames in userspace. If, for any reason, the counter gets out of sy=
nc with the output frames this could go wrong and would be very hard to det=
ect, because they're not synced by the v4l2 frame sequence number.

Any help is appreciated, thanks a lot!
-Jens
