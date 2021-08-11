Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948C53E8E76
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 12:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236877AbhHKKWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 06:22:45 -0400
Received: from mail-dm6nam10on2080.outbound.protection.outlook.com ([40.107.93.80]:30735
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236861AbhHKKWo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 06:22:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNKmbSTVaJmQLXmxZ6TU+iIlwngjYDlh2BgcfeEx/K48yOUKp5EQF1XGC6ytZ1QBpLXGERiLMckiTOIZrSAlgEsvIJ+HomVAs3YHCvrd7qPNl7wtLd7e+rRBOpOEbyXdadDu0ZD86WlXu5XnS7tqicPecarm0XjpoSKZDm5hToAVT/MRsK9BnKtBFVs60T/VdsEBmeeV6FgYlAFluxTfO7saNZtcIgvQ57FCqyFCfiZ3V3Ed3Wf/oE4EG+ghXc+UOhyhIWjclxo38KxAJzB1kc3Bb2KJNk6cHh0hYblEtcJE83LC/RXQyby/qsAE+kgICdZtIcREx6MQHeb6RdRRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG2btuaxWFKAZOAPSqUn01HczRIrEqyhFPNEKzb7vwQ=;
 b=QXkVQ4So1vXwIQUUF/M8MCWzHTJmQevtoK4+aBnLDV4ig30MP2EhO73kUmW4NtgW7VJ1WzWydC3UDVBGibccltzvMGH4OTEO95MKMcOQjQe+46v4R6bwFNbqcmdFf7DTyxUmoH2998Er8c5dMyvfueyWHUAb/Sr7lcY1KSme39BqlHgQNrNqlejd97WzJe4+xqxPphjH66l5PrhHIy3VogQVyjfOzBUpwLWHHB1IncYnLdhhdTVF0yM4Qydar2dX+JBvUfQPjlVkmHEonXacLil8sOpKJaAumhmSJl80it1sR5pJX2P//aH8rKTIv4ny2zbQmrZyW4l/6wbl5w9c2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG2btuaxWFKAZOAPSqUn01HczRIrEqyhFPNEKzb7vwQ=;
 b=e6jlDdryFlkFbtCN/FsVCRgTmFT0BrUh1qFdg3tqCNuMw+7ioJHvra7BEQmRCteFzK+hi978K+EHb7XjEt09YEcY/7vbEIVX1WFMxeg/w0pWtGPLbHjC77tn27aVVkRJ1FrmXh2idSNq4Q3BZ5iBYEXakIlLAkgVAkFv5zVwgaQ=
Received: from SJ0PR02MB8514.namprd02.prod.outlook.com (2603:10b6:a03:3f5::9)
 by BYAPR02MB4422.namprd02.prod.outlook.com (2603:10b6:a03:5c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Wed, 11 Aug
 2021 10:22:17 +0000
Received: from SJ0PR02MB8514.namprd02.prod.outlook.com
 ([fe80::47f:231c:548f:446]) by SJ0PR02MB8514.namprd02.prod.outlook.com
 ([fe80::47f:231c:548f:446%3]) with mapi id 15.20.4415.016; Wed, 11 Aug 2021
 10:22:17 +0000
From:   Anil Kumar Mamidala <amamidal@xilinx.com>
To:     "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Naveen Kumar Gaddipati <naveenku@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: RE: [PATCH v2 1/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Thread-Topic: [PATCH v2 1/2] media: i2c: Add ON Semiconductor AP1302 ISP
 driver
Thread-Index: AQHXhHOywFZVtONePUePbBV06zFQwKti3d5AgAoRTICAASu7UA==
Date:   Wed, 11 Aug 2021 10:22:17 +0000
Message-ID: <SJ0PR02MB851440739434B1C101FC8BE2B7F89@SJ0PR02MB8514.namprd02.prod.outlook.com>
References: <1627560692-21675-1-git-send-email-anil.mamidala@xilinx.com>
 <SJ0PR02MB851449DED958C023D662E14CB7F19@SJ0PR02MB8514.namprd02.prod.outlook.com>
 <20210810152605.GM3@valkosipuli.retiisi.eu>
In-Reply-To: <20210810152605.GM3@valkosipuli.retiisi.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: iki.fi; dkim=none (message not signed)
 header.d=none;iki.fi; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9249c4b9-24b2-4b1f-d064-08d95cb1e55a
x-ms-traffictypediagnostic: BYAPR02MB4422:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB442271DDA184582C66C79D66B7F89@BYAPR02MB4422.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uOxLegSgvQiroO5nOUiOHWh1RC9NwpkQoLMVeII0ZsqF4XHEMP0dDbtY01yMDq3To+pXtSUdoXdjXk3lOfHa9kazdbbMnrb14+/PpZM1LnLAG5Z1nXlMrAiEIihYI6IeXNYU3dBWd+7wzwtaO676ZMwyMKHxVj27yyu16Y0aFVtaKSzzqCmL9afHpdQ0omW3T4PvYOC9bODbDSmL6znF9nwwGyiIHYXyPtHEVMwln2CIStYgZta/rOtDiT3rvELBVsqjP+HMHRB4RmzCHhXRDWs6h0C+1ARg0Rq+HpN1iblSv2D1+sUGhq7M7n36DRDqAG6CRnoptss4HSAhIO5t9WP32QsRv7u/hJ2qWzuhYW1ZxhNxo3GhbxOgO4GC30GcEcN5cq9wgzGEAd8pQUd0yFNN/hs7UpSoyLNDtopA34QNZibbtDYU2G0+ISYr/tlHQQf/xhkLbd7qemENVok6cHMi6FMOZvOMUNDF+0YJOF2Xwg7M0AMz776o1kQogv+6i7da6IlkqGXrnCJTha5DyWVpmGFFUQ2/OjO+Bj9HgGobA/06yOui1Y3G59xYOinCnVESNPD1gxk+xDAhc/l0dStf9AIDd3yMZB6ut5ZK0Y5we40zasxGFZrLjrKzY6pd7FhXS/fMyIfV5tHYJx2m9i87vxMNlDhmgq6rNX9YcXhxhCtSvdGK7lthqLL18+6UPR2A9AnbqGqfG+BvE4bIRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR02MB8514.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(26005)(8676002)(7696005)(76116006)(186003)(66476007)(66556008)(64756008)(66446008)(66946007)(33656002)(38070700005)(6506007)(55016002)(122000001)(9686003)(54906003)(71200400001)(316002)(53546011)(8936002)(478600001)(38100700002)(86362001)(2906002)(4326008)(5660300002)(6916009)(83380400001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i1Rz7+EdmaadSFdvg6C5JW+nFsVu0bCbior8CmIKBqU8NqHYoI3jUy0Pr1Bq?=
 =?us-ascii?Q?+kmh1IEUyBo6aaAyX8e3K/XrMJEYymiKxlMn2Dym7khm5YD30VYhifGqxZZS?=
 =?us-ascii?Q?ctu18XZLJ65DKilOTInc5TGIjC9xx3GEh1zVlzQXM5D3FKQqF/5PihF0QFcT?=
 =?us-ascii?Q?xeXKprTSbRdkk4oRhmgwyguL7L/Sjl6K80KAzv8qe6oeDuc1D58SuVCZhB2r?=
 =?us-ascii?Q?qhXIyS58fWbzTxFHyVDbLKT2yV770nC7+uIjsF+DZhvRhggllQE5KfACxUoo?=
 =?us-ascii?Q?SatdsOIOoH2ziY4zdWh6K5NOeIXe0Bp/2SOVMpPC8qH8D5mkZ9EoJXdAahPf?=
 =?us-ascii?Q?GEQ0/nIttZ/zHDNHVMOgs43hoswwvk8Vs1wnIk8RPiMXKN5Mmbd1CEa7O/GU?=
 =?us-ascii?Q?9y/gsJ8hH/vhZtqZeV4P2LwdFwzwiqmJiZWES9y2aupYPp96hLx7bz5a6kFI?=
 =?us-ascii?Q?gcvMyVTadh9JnflIJExQbmxmL8nsB2eVcNoORzoeNkMhv8WBsst5QryupuMB?=
 =?us-ascii?Q?SMRYi6LTeiPBldS7HAGaTk7dyej8rua1csZ+QPq7yRgBzq8fBtd1KgFv+G0+?=
 =?us-ascii?Q?wspBUiQ9qYL1z8Ohrdh9rMyjZvnZvi32BOvNrb82WBTqVdP+L0r/4uiE4nnV?=
 =?us-ascii?Q?2cbkQJ3Smf5gTlLJoRlj2npm9RFOlTdDg+vLn4bNkyS9xir7aMHGIrHD5dle?=
 =?us-ascii?Q?kgDC5kOtRL1gj1tKgxwO6VL4q26YA0Pw/Wx7SA5fVj8yAdjfkPBo6R0XA+bU?=
 =?us-ascii?Q?QI+ARkwtsw0iw7qZd3TMELGAxk7B9MHVtlo0ez4hzUwNXSivRHPQL23IXeE4?=
 =?us-ascii?Q?S8RCVA5RcYTy1NgcIb36XWA5CYQTCcKJWyM2H8CHnMYdmo6jMyh9WOd9cooC?=
 =?us-ascii?Q?iguihTdaStCpLgEy7VdWd0QaQpRLqD2qN3qk8S2HNTaEBQnKmFwQYi4BY5CY?=
 =?us-ascii?Q?JAsyWhbHe1cfS3PdFe3HpQ4HPDK0WeUXw2bzD1OyxGfivMAT836AQcHD3P59?=
 =?us-ascii?Q?+W1o4wlx9AMqz1qlhddRWRYQIZnRhtwe76er2NCMl9yKt4n1zATgf9m2dE0P?=
 =?us-ascii?Q?NLSlfMO/JVB8pt/OYmI5scuqgxZp0tcje3vRNcF4uS0K4DPCQNcyuxjhuQ3J?=
 =?us-ascii?Q?wFOA7omWpUhvGq7wrudOll/uSVbiDWvTkAJeQVquL/RPvrpfTVFkx5xUVvGj?=
 =?us-ascii?Q?d2MJGoBCxC+hZ+VzbW9P1UUKuWTNjKEpo2fZm1anAFJ1kgcYrxEmud7zoazp?=
 =?us-ascii?Q?6Mqi9A80l4Q3ruH7yvwKG9iETFUOM8lAq5u43RKVfJIrUXZT4P8+yO3BcH9+?=
 =?us-ascii?Q?ecMlcACsTowt1YDd8wjFwrOL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8514.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9249c4b9-24b2-4b1f-d064-08d95cb1e55a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 10:22:17.5053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fp7wkIxbt8DvCIQpEFf3lbRk3RcULd3UoXW5MuMCQ0n4KapJVY3cAxFlnGy+i/K+HyzSUpna8XSIo7MPhqZg1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4422
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Please find my reply inline.

Thanks and regards,
Anil
-----Original Message-----
From: sakari.ailus@iki.fi <sakari.ailus@iki.fi>=20
Sent: Tuesday, August 10, 2021 8:56 PM
To: Anil Kumar Mamidala <amamidal@xilinx.com>
Cc: linux-media@vger.kernel.org; Naveen Kumar Gaddipati <naveenku@xilinx.co=
m>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Stefan Hladnik <s=
tefan.hladnik@gmail.com>; Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v2 1/2] media: i2c: Add ON Semiconductor AP1302 ISP dri=
ver

Hi Anil,

On Wed, Aug 04, 2021 at 06:05:54AM +0000, Anil Kumar Mamidala wrote:
> Hi Sakari,
>=20
> Can you please review ap1302 ISP driver patch. Sorry for the delay in pus=
hing the changes.

No worries.

Could you elaborate what has changed here since v1?
<Anil> Please find the changes list below.
1.  Updated code with the review comments from you for patch v1.
	- Add check for firmware size
	- Remove hardcoding of MIPI lanes
	- Use fwnode_graph_get_endpoint_by_id() API instead of fwnode_graph_get_ne=
xt_endpoint

2.  Add streaming flag to avoid multiple times calling of stream on/off fun=
ctionality if already in that state.=20
3.  Add v4l2_ctrls for setting brightness, saturation, AE metering mode, co=
ntrast, gain ctrls.

--=20
Sakari Ailus
