Return-Path: <linux-media+bounces-18953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C1A98C67E
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 22:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED896B22595
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 20:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901AC1CDFD2;
	Tue,  1 Oct 2024 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eZrgiJ2R"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9EC1CEE82
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 20:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727813264; cv=fail; b=TgyQegmUdkSU+FmEeyUiWGqWLcPMcM1EKURIY63LZWW2riup42AGOkHCHiyF7R+3emW7ZMu+B3PgKlvy/t7Hnt8qSkBA3Ej2eeGq9P9NJOzC3V1jPAYxGAUwvPdE2lhcKDRKzeXWpIo6u9VVXLTptrcZ+SBuJSZJK0ydxcDOgUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727813264; c=relaxed/simple;
	bh=H7iDAiwjY51GxmUrDHUgldqkIM5rBKX6TpoWh7U1GaI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p/UcAfqlFubA1A5Z3KTxcMESX8LKiNb92k9Oz11+unuVRP3CjUSOfJD2ON7AhwmAA/9jwCwJMS40kWqVrCC17VSxd+nGk63vKdGVZpF9AyLSAGjqnmBNamzN6GyOlFVTOvDVGkwHT1R7VoWwbBr1nhvUXhHKplxa9sWIQi95NgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eZrgiJ2R; arc=fail smtp.client-ip=40.107.74.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXaRS9Vad/1ThBxGNMAtjvBk7p6qPWgXGI3sYXEor+ZdPwbOEJBrlw0TWPhtxlarIk3hppqu9/xfRUB4myn4v6IxRv7uJm27KTSgWQqPUeGwpwSnbsJMOqY1Dr/L2XgfU53TTpEtQVoJAPab/wXJWwoUPbjMwbJQad7LHu3RBp+H2eBEoZGaJhCx4FRzfd+SAyD9X4slv0I9kDfY1vA2l6xRS8vWuQKhl8w/Y6W599N+Omk7D0YwZ5udtYNAQ/O0DBSW0SctCjBxfv01RQoNILDmaijnUA6Mzl2z8wqOpTGzoIhtqabRwS96Qa4a6DjnqeyB4T58sbU+URwA42R8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQOhT5XNUOIaSMrCZd0yz7A1+o9Sf6wSMARfA6SRUq4=;
 b=p6UnBzJmXa3TwNsqDHpsKmIC332jJuqiT+nO1WYAF1WNJLOaSrVpazD0qRzSt1yqwPUHjuazO9XN4/G8Jfzl51XqT+Q3fxioGNyODLxYPh8XFrOnmjzc6PvO6kSjkZVIKuSKXsDsjU4gm2VbSPyCi1oMs35RYaaeENTJlCSPJTg2azEwZqA49uoTzGY8VO8KeUAleFNEtZqUmYtvCFrDBCF6QyX2OqKo9COd1+E5TZH82EfHoyJjSVfpusFCCE05YgkS3ASOHlNbQ02d/4dwJLsOmXjBOuiYedv218e8On4OpcwtbZYCj3FTBRmuVfpq/TlgK7M4ADDDjVkDb6HHrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQOhT5XNUOIaSMrCZd0yz7A1+o9Sf6wSMARfA6SRUq4=;
 b=eZrgiJ2Rgus3TdgPADtiP8SiiD3TSx0ZViYTQkuIbhUjEUQ+SX4vWgSs52xKkh5mn2vEjd4SO27qYLtYJk0ohEc9IunrdEOwsnvWjSBrYy3c5QbvlXaYB5xnPmKr92Iq93V2roaTsVMsRDtUDyKxF0sjXMoAwbL9HSM3TaWukVg=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSZPR01MB9329.jpnprd01.prod.outlook.com (2603:1096:604:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 20:07:36 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10%5]) with mapi id 15.20.8026.016; Tue, 1 Oct 2024
 20:07:36 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
Subject: RE: [PATCH 1/4] media: v4l2: Add Renesas Camera Receiver Unit pixel
 formats
Thread-Topic: [PATCH 1/4] media: v4l2: Add Renesas Camera Receiver Unit pixel
 formats
Thread-Index: AQHbC1pw3yTJ3fpyRU+5tzgnHD6U6bJyY9Pw
Date: Tue, 1 Oct 2024 20:07:35 +0000
Message-ID:
 <OSZPR01MB701948643B700433EB24EDBFAA772@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-2-dan.scally@ideasonboard.com>
In-Reply-To: <20240920124115.375748-2-dan.scally@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7019:EE_|OSZPR01MB9329:EE_
x-ms-office365-filtering-correlation-id: ae88b429-3688-4f06-1651-08dce254b158
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HqibRpbVIfl7kDAyc6pWB7QbNuYBn2tfo1wwCksCGxXugIaSXOeg+wIqOUPn?=
 =?us-ascii?Q?ZUSMCu4QId2a8SAq64FQnfAIYYkGASkgSHsPrV6aPbLpw8ZNaKx8xCGlfikA?=
 =?us-ascii?Q?MJUKxq0Ny8QtsA76ZEOMDrm8kJLuGQ7NRT+yDOi2rKbJGHjgoMl0jalnJcC/?=
 =?us-ascii?Q?m5eF/F7fbrYh3vOo0B2JIkqUPb3nC581aSPg8mSeoJ9c+IBbFXIsYGmMuGs0?=
 =?us-ascii?Q?X7X3f6mx60aIENbyVnO1SZiqt+AF89sdAxmuIUIcvHthAW1EA23SyUCx8lOw?=
 =?us-ascii?Q?sJndlOeNXUnr7hfW6PSi92N/fPYMWHSGsnBSCoFp9qBB4zBHZa2dbF4JNBEL?=
 =?us-ascii?Q?DmBIXV0m2oA7uORoQ1/eD/fkIG52JRemNRi28v89pTYioIc62NBufRc9Lj6R?=
 =?us-ascii?Q?xf329K1h8T0/bhEx5nEoTY81Y1iYF0QVqF1Gtimsjq/1LY9z/pCW2qA9u+gR?=
 =?us-ascii?Q?p9tYk0bgewWhTPwaIIndqE4LE8yrQJuN4bCxTqGbDM6SvkxqQ/HSTSO3zsEF?=
 =?us-ascii?Q?t4pvXJjrxLw/64dw8cNLgyHhj9FWqN1qIRO2RDaA6yculEgbCGvji+rWUi63?=
 =?us-ascii?Q?fLCggCAfJANRKBgCeao/u2Fe2HzHLvoTK5be/KstWvpznCNocmTdzl1SDyRv?=
 =?us-ascii?Q?Ke70E37RWKMl6VQqIBh8vUtDSlfy3+liFrKe/idURWpEm+LdvuwPC17WC+Mb?=
 =?us-ascii?Q?BsC69HRVDMUhJ4UU2moOMGWD+rX9chi73/rkBPC9hu5l4lH9j2Gs7UJ7ysP7?=
 =?us-ascii?Q?vXgK9fPEPV581U+cr30ErKkiq5Vf9NhJ5vA2mG0vVcrN+i26au6B3jVfY4ak?=
 =?us-ascii?Q?4u64S39kKvnBTjS5NgvlI3OsU3nqq5ZhUQ/53bDz3gyKygvKRwiF7zP2daVp?=
 =?us-ascii?Q?Q0MhRVSbUFATVROKyYP/jDWv594PryAhMbhMqwfOHnM9kkAxLG1Aq86EiC8S?=
 =?us-ascii?Q?PkIyW5zXd27AedUw+8PEhOXEDu5T+m1AsDlYi7G/3tZfl3Pvd81WIJV7OTyY?=
 =?us-ascii?Q?pMMPidZQXx+lYEet9Tm8Ax20/qBmCAjsQhClxmWGhIZ51Z6Vev0Pix5LcSHg?=
 =?us-ascii?Q?y1E+znYj+6cXsxZMjnnTF5a1eL7XE1raCQeLRgw2GP+powYHGDC/HmlfdEK8?=
 =?us-ascii?Q?vRgDjYC3XKDjwK/9iiZo5G1nug8qSqx/2XRmHV2eXn49qdY942x9XS9qW5Cw?=
 =?us-ascii?Q?cf05oy/DTn++fCOV0KCrs5872LEsr9u/wFHjY93p8SQWSauooOhpOcch5KdR?=
 =?us-ascii?Q?GscKXi3Kz/HTPQMJIp1007P08jT9bNPzahj7CwLvxAXZHJo/gN+c2bov3wyL?=
 =?us-ascii?Q?//e2UyZBnTXaJZkmuZd18mFttJXnAeHsw9m/gTwLUyZy6A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bsTz1joS4Z7UC7ttmrFJlBXPFJKKG3IE9+Mf0An7QgiIgruL2O83VmZ+LSZN?=
 =?us-ascii?Q?A4wf77SDs4OoeiicvdYE5tVZtNofmwW+CQKJyw8em/sq1AgC8JtGMWZ+YlpF?=
 =?us-ascii?Q?UA2ftTJSrh0K9xufIZn8Wu62lT3VzuFVAFQk7LDCLkE6o7iSJErOcXPGp/BZ?=
 =?us-ascii?Q?d3rVhPETKV/m9vR8RvZj8MWCbL1zED++wYcDW91ET7rykkCfzXR+E45hYwfj?=
 =?us-ascii?Q?46VI3AiwLVQJWdsD5HVJJPxLgQfXAphW9Rda3dmeJinUQQF6lrsv5f/qEwk4?=
 =?us-ascii?Q?hnuuUqRkTkRSoy25yoZ+3jhKj1CaNcUkCuYt4O41DyqL+TpAoQEEk6T0M/MB?=
 =?us-ascii?Q?hbMtOeoGjrXS7j2tGb7pTO/SPBYXv7fedjHZE6U9usYZ6h8kqj7oasj+d0qu?=
 =?us-ascii?Q?873TUDZE+53Ur4pXRfgDR3dDj8/1gX+wK4ndSlUG46uln1kYnO+qN7Q0ONQ7?=
 =?us-ascii?Q?A3w75Dk1b+T+B5LvmeKNIU0cThRcpcECH+Z7MNSD7xN1vcEbsEFDMp1CNLZ7?=
 =?us-ascii?Q?24O9BJqSOWMLWKKJhx8kCnHIZtv8822oUaj7QoG+s543bxyfsbVucdjL0kvR?=
 =?us-ascii?Q?01rjXcrdyLt6LNQqDjRnavWUFe1Cxaabv/ANf9lIkNs6JAfgNGz85EoqFWtE?=
 =?us-ascii?Q?1poYXcttr+JxkSI/M76VF7hJUEt1nwXVnnn/f9eHXJw0VZDH39696N7kbT95?=
 =?us-ascii?Q?LHwuJmZv9lGy8r4Hja+W1csUcdBfqe2Kjf7RuIqWvFgG79FvFiITVz8bxqOI?=
 =?us-ascii?Q?ix2ofraW2xYXn0jkiLxeZ/wnmbWMhpLuF7g/Puq5dAQqUFjWq+yid+YkAB31?=
 =?us-ascii?Q?JZBp/LLaZ1r2+yD2RIPd1pd14xLVrvbxIskbBsPN84HaJCeKVi9+kSHy46M/?=
 =?us-ascii?Q?c45FAlw34EMYkDl1EfqTfk8nMACpci5i/Zw7myzwPCnIDtF7zTyPCQBOFnOR?=
 =?us-ascii?Q?5cHMCmZ6u0gVOG6wxsXWYPAd9bewZLo0Q31sR/kq9z7KfFxe7S9vYctEO81g?=
 =?us-ascii?Q?/UgRxWUwa5es2GsWCGJkd7JCj/zRJkunU/IZbhfnF3X5/Cuae7PW1N5JMA5D?=
 =?us-ascii?Q?qJjU3g+zH1o72aWirmAGH7uYaYThPx441ohd6SyTdpBT+3ZvC/xXw4YG5uFH?=
 =?us-ascii?Q?GE6Qlr/dgR3fQejiyMTaUEvRzRWQ+U2G4Hgm7+C9ITwfHbJ9g826MWwCSdUs?=
 =?us-ascii?Q?py4fxJm7rji+E4JMm++Cny8Tzoc12OaXqO+Q7pOSv/icIpKcisaPUvdJNzwW?=
 =?us-ascii?Q?mwOjnnUkoDZsKDfJQ+45/Rk5JaVkE1aKNeRfxGNhhrRZrpt8JVxk+SgNkWM5?=
 =?us-ascii?Q?TEt5TKCF/Nc5QYvHTfLAJwp+iBxMW1myuGLhwSJfmzj0p4UdhowtYp6tBD4M?=
 =?us-ascii?Q?i3EftYOmrCY91KTxGZp2ZYvgbhIfsVHUrhZvEVUJx81+GlnssxkI0VAfmLYy?=
 =?us-ascii?Q?VpRvjW4w43qXZFTdW6cteL84fNCTbFOkGfo2L3nJkL314hHQngeQa3qo+3Qa?=
 =?us-ascii?Q?7cs1HgmA/735esyIX9ewqHGLfgPUcg0HKReTKvm+BpmpJcYxmFRrcHWVU5mM?=
 =?us-ascii?Q?G47UAqfViP1QNkRqP/+j/nUSLxTZnNyzFrz/KwhySACQhHmq8RJovAvbUctp?=
 =?us-ascii?Q?Dw0mKEylfykZRzbgnNHMl6g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae88b429-3688-4f06-1651-08dce254b158
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 20:07:36.0143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bg2GbZH13toe3Gudxrys4qH74BLAf3Jf338q7xEb65WWnElcLRAravFQKBG81hjzQyEe15wHDlVfnCajKPtg0tgj1deJh374AcB3GVZQc94NH7aBk/aYZ1+l/tpY+Ns5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9329

Hi Dan,

> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>=20
> The Renesas Camera Receiver Unit in the RZ/G2L and RZ/V2H SoCs can output
> RAW data captured from an image sensor without conversion to an RGB/YUV
> format. In that case the data are packed into 64-bit blocks, with a
> variable amount of padding in the most significant bits depending on the
> bitdepth of the data. Add new V4L2 pixel format codes for the new formats=
,
> along with documentation to describe them.
>=20
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
>  .../media/v4l/pixfmt-srggbnn-cru.rst          | 143 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |  12 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  12 ++
>  include/uapi/linux/videodev2.h                |  16 ++
>  5 files changed, 184 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggbnn-
> cru.rst
>=20

When trying to build the htmldocs I get the below warnings, is this expecte=
d?

linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-sbggr10
linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-sgbrg10
linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-sgrbg10
linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-srggb10
linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-sbggr12
linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-sgbrg12
linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-sgrbg12
linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-srggb12
linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-sbggr14
linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-sgbrg14
linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-sgrbg14
linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l=
2-pix-fmt-cru-srggb14

Cheers,
Prabhakar

