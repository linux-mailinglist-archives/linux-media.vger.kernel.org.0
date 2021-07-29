Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F663DA33A
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 14:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbhG2MgX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 08:36:23 -0400
Received: from mail-eopbgr60071.outbound.protection.outlook.com ([40.107.6.71]:8199
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234325AbhG2MgT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 08:36:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrxHU9wdVxux4+iVWGDkwX89hcq3zSpntgtxC03rdwKn4Id8jN1nWis+W53fH1tgg2zeEyRPQf82fE33Rn+6SmWOnNmAWL6CAMQPsT2CdwKYl1h0iLP8As33WpL1HBEVZEWH0CQ72AM7QbOfuAHSk+2ORcH+w3bq9psghZJtESyCbsNIyJuRGoo2BGqc9NfkMSQ5mDZibH/WjeamzsWue7c52Auj9V5K/tb4p33okLE1jEKwBSJuENky0gW0gam0RdobeFnOQ4zhwR1DTRSTZKkKrzuNxrktAUqKfxJcuaU0paxqLz4dwj4L2l3ZDzhRlSH+ckeHeJN2yS8CI0TTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFFQk8TJH97sG7U03kuYnvDvy4kI/+wktvApdyU2KRg=;
 b=myN2dI+Y02rR/qxxsucunJlJdZsO6PCcYjJmX+2GvSCJlQV9UZY4L/CI39H2EiYGs7f6vUUUBp7/u4WrQIYFnMXYqi/LGllBTlbcAJlfkxSWuJNEghs7nNFUKyTrc3Vu2Kv05jT6JR11WV2aeDWWeDV6CkGuF1aPN5Yh/nHji2lJTeQK3r3BftmWJI56fic6rziWDy6Jb75KsRs6bII5f7LKkMZkk21qd0MhOgQKL199iddrcAzHRxLjLQ1ys67fQlAWXUSdC7hJmw//Tppe6ZXrphUl7aIBwQaZlpa11EOXDgNQvweim1QfF79zha423e2/uHNfl6nmc29PwQ75fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=trinamix.de; dmarc=pass action=none header.from=trinamix.de;
 dkim=pass header.d=trinamix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trinamix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFFQk8TJH97sG7U03kuYnvDvy4kI/+wktvApdyU2KRg=;
 b=eqenl1+Mf2akz3yAp0rxge1D/LVVOGjWo9BkvTm0PmNpT8NjBSnyteY+tMnnPbVJnN7So/iKs37lFJGDhsoa4QbaDHR5x9f+tMypttgX+RWMteFJhMiUTC0dt6stjeDdHVKQAtVUQNKGZIn4vdHa+RdFZWJoPuPiVh3tEN5wKiU=
Received: from AM0PR04MB5825.eurprd04.prod.outlook.com (2603:10a6:208:127::19)
 by AM0PR0402MB3555.eurprd04.prod.outlook.com (2603:10a6:208:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Thu, 29 Jul
 2021 12:36:15 +0000
Received: from AM0PR04MB5825.eurprd04.prod.outlook.com
 ([fe80::fd86:de23:57cd:70b2]) by AM0PR04MB5825.eurprd04.prod.outlook.com
 ([fe80::fd86:de23:57cd:70b2%4]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 12:36:15 +0000
From:   Jens Korinth <jens.korinth@trinamix.de>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: media: platform/rockchip/rkisp1 - v4l-compliance reports errors
Thread-Topic: media: platform/rockchip/rkisp1 - v4l-compliance reports errors
Thread-Index: AdeEc30cRBeDjNy2Rjakth/la7V3DA==
Date:   Thu, 29 Jul 2021 12:36:15 +0000
Message-ID: <AM0PR04MB5825DA3C650C569F69B99EF898EB9@AM0PR04MB5825.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=trinamix.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 413e1e9d-7f67-4a74-1689-08d9528d74cf
x-ms-traffictypediagnostic: AM0PR0402MB3555:
x-microsoft-antispam-prvs: <AM0PR0402MB355533A7625E67444F1FEC4298EB9@AM0PR0402MB3555.eurprd04.prod.outlook.com>
x-mg:   BASF_O365_RELAYED
x-mg-sentby-basf: True
x-mg-attachment: YES
x-report-basf-outbound: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LvMqujpZ5nYJCfGq/ueiZLMu69pz6DW/bHMiS/7gM8lDGqmShTZ6ysyXblK90YTa5n+iTqOGNTjPS/4tz0CaYXWdSocdCETndVkhO8UAt2GrJQoCfjp38kXxB6JqJyTw78Bo7tJfMs8whnWSptP4PnKBLB0zyZ7vj86MgRT7ydIiBAaRQMoVZuOiq09dLdraPC4jJblYDdcRK212UqJOEv0BFH+jGBgjzF+dNhdR9nA7HS+zTtdx8enA53YFd+82rv5rIbnuv5lkI9YfvKX0TTwqRzGrFWfqFclsNeA6662/WmsC+e8aSxRyaSt0lKrTX2N2nHzlzC+zWpcWZVL0JG97O2wpK1eGARcjQEAvgbOXMGzLCoMmhF/Pf/X6qYE5x9FireIrWMWwOl9QwRchtTbT/jMmVxhESQAPcxOg2Npetc2MuCE0K0gutEAuKtsg/e23yWf6tSCAbJBm69tvLNpmD6HlazBz8TPHM8pZiz7pJrYFSdANCkFjjT11JrB2BdQ2ghtTHJzMhuBqjnjC3VBgBmsYixCSajXsMU2eW7c20T74BzTOeyHiU2ILuu0yj3cMT/6sG/idNRY33C5F6Hm4uuNNr74ZgLKvFARnDtS8HvZJenVRdZdwTu1sAdVa6nyeM9jQaS8AlA5JaD8vd6r+u817g36FjY9TLMWzMA/vFJMIWMW772aNE3N9bvzcr+1rAeQELKxBq7zyFD2AAg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(55016002)(4744005)(6506007)(86362001)(8676002)(26005)(9686003)(8936002)(478600001)(52536014)(44832011)(83380400001)(66946007)(66616009)(76116006)(66446008)(64756008)(66556008)(5660300002)(6916009)(316002)(66476007)(71200400001)(7696005)(99936003)(38070700005)(186003)(122000001)(2906002)(38100700002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GgX/Oz8hWyFq/QjdyLmjXSm2EuvIY1AEcUXmUjbcXXQA9NzRn+1f8n7rCUMB?=
 =?us-ascii?Q?AJYnR+TaiKfo0Jy1QkB13p45JlXqQk3rHMUarhsze2AoKe6PA5ofOYq/qIVp?=
 =?us-ascii?Q?/dWLa8vexPjchCGUmvNeRcvtLuIGqunXbNXXDpm39U5EE1qrKmgJPUklzAQt?=
 =?us-ascii?Q?6Rdicv2j+bmqGyAy/w6rCb39Ns0QMw+lJmruCV2PmNIL6fxmpMzf3/x2mE6w?=
 =?us-ascii?Q?XEXBjNCcIlHPcf3RdHC+WAEuDbNK5D2jM26WUZGLb97KGD1Bf+qXzSS73e3H?=
 =?us-ascii?Q?V540SAZyGhqNLek2ppBwLrrFP0lMgrKRtKyXl2mhJD90nszNvUi+U+JJx0CR?=
 =?us-ascii?Q?IRo2BhPaZwRkqOIGPZjVXFxlJlRx5hHBJO5teB5eeH+TBdnXHwCI3i48YQPv?=
 =?us-ascii?Q?oBD8gvNYgedLI6ekdFXAejLXYrZ4i7lobpGNyjf6bgKez2qIN7CRXJV+l3rI?=
 =?us-ascii?Q?mPRHWlcjXtCmJPLKLJDs9LXC7Ptl3k+r/xKwIpfcYOfe4spuhQiewnCwpuzS?=
 =?us-ascii?Q?O3aaj+Anru+EKp6+BketB+JwNhwDXHeX/NAVPNwUfLaJgu1Ck1sb7ynPfR4p?=
 =?us-ascii?Q?ZzdrX0yGWwq8oTSxZ9yDziOu5KMwbxCWAIyE3BQh+nuy7pAtJe54yTdnQTtO?=
 =?us-ascii?Q?B6m+b03Kypv5dRHRFW2mSHsTIumFaK3GrszHWwh3pM7uZYkbX8aFWj+jLM/0?=
 =?us-ascii?Q?5kA/1mgx7YeE0dYgaeQRJ4jIhUemrVRNdpJFJMBRbJEs5HbZdOmZMBzJpwuo?=
 =?us-ascii?Q?+/AIcBzNYWpaAJWqTDFAliNZTd758+Hl/OXsSIWh52J/mjOapQoLavFpMY2e?=
 =?us-ascii?Q?u+4TVc7cbSv5nThbJGFLeUYGAtOYbL0aZCjUVHhaQ4sY8Nw50X0Kl9zf2DBa?=
 =?us-ascii?Q?m76GePAFg5Q5KC167G01RvKz7kLPxUs725CW/JHjrBzlIGiJVXEZypSTj/LU?=
 =?us-ascii?Q?HlUuVSSUVuTwd8wv62rFrfJ8jPj9zpNWK2R0//FWscsb5EpyXghMyTW9HxTl?=
 =?us-ascii?Q?alDvYOEuyE2n0elMLKIW93WbAuLhnDELpzoj3ShvVDVaSidkz7nf4RT0ZEAD?=
 =?us-ascii?Q?2dlYxuJfwXLqoFuXRAEfCufy4e12DScLUmc9OJ2legMU2vacG9gsQ7xdsqW1?=
 =?us-ascii?Q?xpWZqT9wlrELiI8yzW1x4hctZNq+ZwpskqUN82QdgXrjFxFoly1sCBqNoGQm?=
 =?us-ascii?Q?FlOccaPCpKJEzjqW9IXKO9kLJV6tpTg0PKvNmftA8gTMjO3uimrmhhCCVCQ8?=
 =?us-ascii?Q?7epLzdnFQ+zCqfGFX+0aN5t5hRTi/7ka/kY34dSoGicibcPf9XnM1HMXVNwk?=
 =?us-ascii?Q?aFc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
        boundary="_002_AM0PR04MB5825DA3C650C569F69B99EF898EB9AM0PR04MB5825eurp_"
MIME-Version: 1.0
X-OriginatorOrg: trinamix.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413e1e9d-7f67-4a74-1689-08d9528d74cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 12:36:15.1861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ecaa386b-c8df-4ce0-ad01-740cbdb5ba55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 869JM7+iqmWGjJ3ZEsNFFaMWSo4UPWGYfhhrDWOA1Qhrph46K6y99+iwJAZSFAtoFqyBl/qW3f6oBET5cWI5Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3555
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--_002_AM0PR04MB5825DA3C650C569F69B99EF898EB9AM0PR04MB5825eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi *,

I am working on a camera system on Rockchip RK3399 board (Firefly ROC-RK339=
9-PC-Plus). Tried to use the rkisp1 driver, but was unable to connect to th=
e rkisp1_mainpath output node, because format negotiation failed; so I ran =
v4l-compliance next and found that it reports several errors (see attached =
report).

Upon closer inspection I noticed in the VIDIOC_ENUM_FMT handler in drivers/=
media/platform/rockchip/rkisp1/rkisp1-dev.c:1169+ that

1) the "reserved" member is not zeroed,
2) the userspace pointer to the v4l2_fmtdesc f is not checked via access_ok=
, and
3) it isn't copied from/to userspace using copy_from_user/copy_to_user.

I'm not sure if this is necessary in general, but at least on my platform t=
he zeroing of the reserved member only worked correctly when I added the us=
erspace copies. But even after these fixes, v4l-compliance reports further =
issues in format enumeration and negotiation. Is this a known issue?

Thanks!
-Jens

--_002_AM0PR04MB5825DA3C650C569F69B99EF898EB9AM0PR04MB5825eurp_
Content-Type: text/plain; name="v4l2-compliance-report.txt"
Content-Description: v4l2-compliance-report.txt
Content-Disposition: attachment; filename="v4l2-compliance-report.txt";
	size=3858; creation-date="Thu, 29 Jul 2021 12:34:06 GMT";
	modification-date="Thu, 29 Jul 2021 12:33:05 GMT"
Content-Transfer-Encoding: base64

djRsMi1jb21wbGlhbmNlIFNIQTogbm90IGF2YWlsYWJsZSwgNjQgYml0cw0KDQpDb21wbGlhbmNl
IHRlc3QgZm9yIHJraXNwMSBkZXZpY2UgL2Rldi92aWRlbzA6DQoNCkRyaXZlciBJbmZvOg0KCURy
aXZlciBuYW1lICAgICAgOiBya2lzcDENCglDYXJkIHR5cGUgICAgICAgIDogcmtpc3AxDQoJQnVz
IGluZm8gICAgICAgICA6IHBsYXRmb3JtOnJraXNwMQ0KCURyaXZlciB2ZXJzaW9uICAgOiA1LjEy
LjEyDQoJQ2FwYWJpbGl0aWVzICAgICA6IDB4YTQyMDEwMDANCgkJVmlkZW8gQ2FwdHVyZSBNdWx0
aXBsYW5hcg0KCQlTdHJlYW1pbmcNCgkJRXh0ZW5kZWQgUGl4IEZvcm1hdA0KCQlEZXZpY2UgQ2Fw
YWJpbGl0aWVzDQoJRGV2aWNlIENhcHMgICAgICA6IDB4MjQyMDEwMDANCgkJVmlkZW8gQ2FwdHVy
ZSBNdWx0aXBsYW5hcg0KCQlTdHJlYW1pbmcNCgkJRXh0ZW5kZWQgUGl4IEZvcm1hdA0KTWVkaWEg
RHJpdmVyIEluZm86DQoJRHJpdmVyIG5hbWUgICAgICA6IHJraXNwMQ0KCU1vZGVsICAgICAgICAg
ICAgOiBya2lzcDENCglTZXJpYWwgICAgICAgICAgIDogDQoJQnVzIGluZm8gICAgICAgICA6IHBs
YXRmb3JtOnJraXNwMQ0KCU1lZGlhIHZlcnNpb24gICAgOiA1LjEyLjEyDQoJSGFyZHdhcmUgcmV2
aXNpb246IDB4MDAwMDAwMGEgKDEwKQ0KCURyaXZlciB2ZXJzaW9uICAgOiA1LjEyLjEyDQpJbnRl
cmZhY2UgSW5mbzoNCglJRCAgICAgICAgICAgICAgIDogMHgwMzAwMDAwZA0KCVR5cGUgICAgICAg
ICAgICAgOiBWNEwgVmlkZW8NCkVudGl0eSBJbmZvOg0KCUlEICAgICAgICAgICAgICAgOiAweDAw
MDAwMDBjICgxMikNCglOYW1lICAgICAgICAgICAgIDogcmtpc3AxX21haW5wYXRoDQoJRnVuY3Rp
b24gICAgICAgICA6IFY0TDIgSS9PDQoJUGFkIDB4MDEwMDAwMGYgICA6IDA6IFNpbmsNCgkgIExp
bmsgMHgwMjAwMDAyMjogZnJvbSByZW1vdGUgcGFkIDB4MTAwMDAwOCBvZiBlbnRpdHkgJ3JraXNw
MV9yZXNpemVyX21haW5wYXRoJzogRGF0YSwgRW5hYmxlZCwgSW1tdXRhYmxlDQoNClJlcXVpcmVk
IGlvY3RsczoNCgl0ZXN0IE1DIGluZm9ybWF0aW9uIChzZWUgJ01lZGlhIERyaXZlciBJbmZvJyBh
Ym92ZSk6IE9LDQoJdGVzdCBWSURJT0NfUVVFUllDQVA6IE9LDQoNCkFsbG93IGZvciBtdWx0aXBs
ZSBvcGVuczoNCgl0ZXN0IHNlY29uZCAvZGV2L3ZpZGVvMCBvcGVuOiBPSw0KCXRlc3QgVklESU9D
X1FVRVJZQ0FQOiBPSw0KCXRlc3QgVklESU9DX0cvU19QUklPUklUWTogT0sNCgl0ZXN0IGZvciB1
bmxpbWl0ZWQgb3BlbnM6IE9LDQoNCkRlYnVnIGlvY3RsczoNCgl0ZXN0IFZJRElPQ19EQkdfRy9T
X1JFR0lTVEVSOiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFZJRElPQ19MT0dfU1RBVFVTOiBP
SyAoTm90IFN1cHBvcnRlZCkNCg0KSW5wdXQgaW9jdGxzOg0KCXRlc3QgVklESU9DX0cvU19UVU5F
Ui9FTlVNX0ZSRVFfQkFORFM6IE9LIChOb3QgU3VwcG9ydGVkKQ0KCXRlc3QgVklESU9DX0cvU19G
UkVRVUVOQ1k6IE9LIChOb3QgU3VwcG9ydGVkKQ0KCXRlc3QgVklESU9DX1NfSFdfRlJFUV9TRUVL
OiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFZJRElPQ19FTlVNQVVESU86IE9LIChOb3QgU3Vw
cG9ydGVkKQ0KCXRlc3QgVklESU9DX0cvUy9FTlVNSU5QVVQ6IE9LDQoJdGVzdCBWSURJT0NfRy9T
X0FVRElPOiBPSyAoTm90IFN1cHBvcnRlZCkNCglJbnB1dHM6IDEgQXVkaW8gSW5wdXRzOiAwIFR1
bmVyczogMA0KDQpPdXRwdXQgaW9jdGxzOg0KCXRlc3QgVklESU9DX0cvU19NT0RVTEFUT1I6IE9L
IChOb3QgU3VwcG9ydGVkKQ0KCXRlc3QgVklESU9DX0cvU19GUkVRVUVOQ1k6IE9LIChOb3QgU3Vw
cG9ydGVkKQ0KCXRlc3QgVklESU9DX0VOVU1BVURPVVQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KCXRl
c3QgVklESU9DX0cvUy9FTlVNT1VUUFVUOiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFZJRElP
Q19HL1NfQVVET1VUOiBPSyAoTm90IFN1cHBvcnRlZCkNCglPdXRwdXRzOiAwIEF1ZGlvIE91dHB1
dHM6IDAgTW9kdWxhdG9yczogMA0KDQpJbnB1dC9PdXRwdXQgY29uZmlndXJhdGlvbiBpb2N0bHM6
DQoJdGVzdCBWSURJT0NfRU5VTS9HL1MvUVVFUllfU1REOiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0
ZXN0IFZJRElPQ19FTlVNL0cvUy9RVUVSWV9EVl9USU1JTkdTOiBPSyAoTm90IFN1cHBvcnRlZCkN
Cgl0ZXN0IFZJRElPQ19EVl9USU1JTkdTX0NBUDogT0sgKE5vdCBTdXBwb3J0ZWQpDQoJdGVzdCBW
SURJT0NfRy9TX0VESUQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KDQpDb250cm9sIGlvY3RscyAoSW5w
dXQgMCk6DQoJdGVzdCBWSURJT0NfUVVFUllfRVhUX0NUUkwvUVVFUllNRU5VOiBPSyAoTm90IFN1
cHBvcnRlZCkNCgl0ZXN0IFZJRElPQ19RVUVSWUNUUkw6IE9LIChOb3QgU3VwcG9ydGVkKQ0KCXRl
c3QgVklESU9DX0cvU19DVFJMOiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFZJRElPQ19HL1Mv
VFJZX0VYVF9DVFJMUzogT0sgKE5vdCBTdXBwb3J0ZWQpDQoJdGVzdCBWSURJT0NfKFVOKVNVQlND
UklCRV9FVkVOVC9EUUVWRU5UOiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFZJRElPQ19HL1Nf
SlBFR0NPTVA6IE9LIChOb3QgU3VwcG9ydGVkKQ0KCVN0YW5kYXJkIENvbnRyb2xzOiAwIFByaXZh
dGUgQ29udHJvbHM6IDANCg0KRm9ybWF0IGlvY3RscyAoSW5wdXQgMCk6DQoJCWZhaWw6IHY0bDIt
dGVzdC1mb3JtYXRzLmNwcCgzMTEpOiBWaWRlbyBDYXB0dXJlIE11bHRpcGxhbmFyIGNhcCBzZXQs
IGJ1dCBubyBWaWRlbyBDYXB0dXJlIE11bHRpcGxhbmFyIGZvcm1hdHMgZGVmaW5lZA0KCXRlc3Qg
VklESU9DX0VOVU1fRk1UL0ZSQU1FU0laRVMvRlJBTUVJTlRFUlZBTFM6IEZBSUwNCgl0ZXN0IFZJ
RElPQ19HL1NfUEFSTTogT0sgKE5vdCBTdXBwb3J0ZWQpDQoJdGVzdCBWSURJT0NfR19GQlVGOiBP
SyAoTm90IFN1cHBvcnRlZCkNCgkJZmFpbDogdjRsMi10ZXN0LWZvcm1hdHMuY3BwKDQ2MSk6IHBp
eGVsZm9ybWF0IDU2NTk1NTU5IChZVVlWKSBmb3IgYnVmdHlwZSA5IG5vdCByZXBvcnRlZCBieSBF
TlVNX0ZNVA0KCXRlc3QgVklESU9DX0dfRk1UOiBGQUlMDQoJCWZhaWw6IHY0bDItdGVzdC1mb3Jt
YXRzLmNwcCg0NjEpOiBwaXhlbGZvcm1hdCA1NjU5NTU1OSAoWVVZVikgZm9yIGJ1ZnR5cGUgOSBu
b3QgcmVwb3J0ZWQgYnkgRU5VTV9GTVQNCgl0ZXN0IFZJRElPQ19UUllfRk1UOiBGQUlMDQoJCWZh
aWw6IHY0bDItdGVzdC1mb3JtYXRzLmNwcCg0NjEpOiBwaXhlbGZvcm1hdCA1NjU5NTU1OSAoWVVZ
VikgZm9yIGJ1ZnR5cGUgOSBub3QgcmVwb3J0ZWQgYnkgRU5VTV9GTVQNCgl0ZXN0IFZJRElPQ19T
X0ZNVDogRkFJTA0KCXRlc3QgVklESU9DX0dfU0xJQ0VEX1ZCSV9DQVA6IE9LIChOb3QgU3VwcG9y
dGVkKQ0KCXRlc3QgQ3JvcHBpbmc6IE9LIChOb3QgU3VwcG9ydGVkKQ0KCXRlc3QgQ29tcG9zaW5n
OiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFNjYWxpbmc6IE9LDQoNCkNvZGVjIGlvY3RscyAo
SW5wdXQgMCk6DQoJdGVzdCBWSURJT0NfKFRSWV8pRU5DT0RFUl9DTUQ6IE9LIChOb3QgU3VwcG9y
dGVkKQ0KCXRlc3QgVklESU9DX0dfRU5DX0lOREVYOiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0
IFZJRElPQ18oVFJZXylERUNPREVSX0NNRDogT0sgKE5vdCBTdXBwb3J0ZWQpDQoNCkJ1ZmZlciBp
b2N0bHMgKElucHV0IDApOg0KCXRlc3QgVklESU9DX1JFUUJVRlMvQ1JFQVRFX0JVRlMvUVVFUllC
VUY6IE9LDQoJdGVzdCBWSURJT0NfRVhQQlVGOiBPSw0KCXRlc3QgUmVxdWVzdHM6IE9LIChOb3Qg
U3VwcG9ydGVkKQ0KDQpUb3RhbCBmb3Igcmtpc3AxIGRldmljZSAvZGV2L3ZpZGVvMDogNDUsIFN1
Y2NlZWRlZDogNDEsIEZhaWxlZDogNCwgV2FybmluZ3M6IDANCg0K

--_002_AM0PR04MB5825DA3C650C569F69B99EF898EB9AM0PR04MB5825eurp_--
