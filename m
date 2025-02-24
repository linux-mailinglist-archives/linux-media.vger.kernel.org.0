Return-Path: <linux-media+bounces-26763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4E6A41661
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 08:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13E2E18933DD
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 07:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DE118DF64;
	Mon, 24 Feb 2025 07:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Z4srBhAw"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552D1BC3C;
	Mon, 24 Feb 2025 07:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740382652; cv=fail; b=MYpf+7YaJn9y6kqGzvOSWsmeDDXP6FweMMky4mSd7FR3+fEyWg+VjiwmBWUFAF9ZUK0uJSOEq1JFNBKCyIoxHyQS+J7mg5HBWldSWYYkvckJRdb4CX8dvXgzBVl9EgiapD4eoHQD/QiWoQjuyaIS4PpAIpXx46ooFPYSK/5tLC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740382652; c=relaxed/simple;
	bh=SMC2aB4IDLP1ZTJbvLnhdWDQVwyU4BLaPS11X7VaB/0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XCbSeM+pmm/w+eWebNzX1z2/dzHlHn7cPAuLWhYtVqMTp4mwptXcNJWES+Kfmk0B527zKrm7ftpUzk/bbdDZCyg6JgU4ioXXDV1jAtbf+Z5IcbVjWJcft25xW401vg5jzHzFy4OatoY8Ws+SrgqHbWr6xbUrIBWfQcyqyWjKl5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Z4srBhAw; arc=fail smtp.client-ip=40.107.244.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYAPCMuGrbu8nlxG01NZCn2Z7kx3+X6CM7GLAq1PdqBpHncz1l6R1v4TQwES/4Oxiyb05RoOv/kUw0b7iJkmnd4IGbyoJn698v+9ZT7JxAJaSu+nt+py+DdmO++VM73DXDU0K7bqzF5qHLJPJZC+OIDuw7xKbIuRblmdaJDUcEcVeEGYXLZNyCjtCGD4mQF5ge2oc7YDa6KOwaT4D3gPSqq2Jl7EUJkBkC+Lkr0sFxlN6KcIFIFQMVsxhRw8K3eo2Crm2WvqugIb/JJsQAlyoYLeP5oKyd02bubjvfvi2pGbj7ZBqEOIu0QwwouamK6EG+eczeUKOon0KSvgbK36qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v37tyn4zL27rGh/rax9/zYhhLx4QHLuKKdGDe+9i+ow=;
 b=Dc5ihXUkZ7YpmZDxQ+uLhkaGr18N/WEPvKxOFn5b1bMQa579bwvrlRG1qDwXywQ94x8lgXmcRu2OK2wbTS7wa2GLUVx55+ytnSKKozuaPR2WdDX60RJ8yFNya0wReesps34ApGr1uz+TvNNazm2PqUgg+Uk3A8Va4HzyX7mdzSTOwuJbGbUjj6lnWxVp300987SQq4LQju7VywYNsg7CDEVecAOtcp4lk1N6Owstt87N6sZ3eK1qfkbf6+V6z5HkVqk6ufQGlldjmXBUHhlqwDL8uNkFGE1iWywSA0yw6bgLYNgie8I8paZc3WvDXDn39RfM8WtjQKFjn6d6rsXMAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v37tyn4zL27rGh/rax9/zYhhLx4QHLuKKdGDe+9i+ow=;
 b=Z4srBhAwR+3gfe094B5nIfRC15Xp/TSh86m+ucBDBt9MjbxPbCo34l0T3ZKMwXoIxxFt0qOIIWTQh53pzl8fjNI+rCBMk9H1yJOPg60lCiVBkxPrnENbYfhPE5rPHiC7fWfKPo7uAwoayjQ8XQ/PmeQmABMyin59nREZ8p+V1Chw55+/M5RNVOfrPddf9mQSgxhVKpINdySu8B7h9/+9fYLNOYCIlF8/uUQzqoHHUW74JNT0goeATYWJf002OE7TjUCRw6kZJPGtPLlFDX1YIy2qdb0JX2QpDmVKBZkVGl84QwCcPcNiN/JLys1vPpYFlDWF7kM+iQpeiFBcTAUHnA==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 07:37:24 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 07:37:23 +0000
From: <Shravan.Chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>
CC: <mchehab@kernel.org>, <kieran.bingham@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
	<Praveen.Kumar@microchip.com>
Subject: RE: [PATCH V4] media: i2c: imx334: Add support for 1280x720 & 640x480
 resolutions
Thread-Topic: [PATCH V4] media: i2c: imx334: Add support for 1280x720 &
 640x480 resolutions
Thread-Index: AQHbgehP847oCIgDtkGktaaKhaZBEbNQMGmAgAXoN2A=
Date: Mon, 24 Feb 2025 07:37:23 +0000
Message-ID:
 <PH0PR11MB5611074F959638A90A7160E381C02@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250218093356.3608409-1-shravan.chippa@microchip.com>
 <Z7cr8x6i8NZbdjIQ@kekkonen.localdomain>
In-Reply-To: <Z7cr8x6i8NZbdjIQ@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|BL3PR11MB6434:EE_
x-ms-office365-filtering-correlation-id: aeb94b78-f94c-4942-350c-08dd54a61444
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tGtob7m23KrnVQPF2evrgtwZ4flrt2bqI49DRP7Yp+6Rle9dD60Y9TnRp2DK?=
 =?us-ascii?Q?XRpbzgdqmzOf1Jwq9YiEPJpt6Ku4WREACcUghRuh8PiZEK5dltSynshUUTZX?=
 =?us-ascii?Q?IY3GTnXPdMlI+f4DxD5al3rhVN+ySaDKOgguq5lJ40id0cbTLmM1E5MoGOYl?=
 =?us-ascii?Q?DRioipp4TloPt4AApWVHEMxkxEe5XpgM4kIuMBms7DNKc5ynHClyy0O6/Fnw?=
 =?us-ascii?Q?RZoQcEBVhLyKvNZnM/u50sH5Alyu75EHi5rV9vW95smAHzuQN7p4eiPw9Sa1?=
 =?us-ascii?Q?8j1MITwkYLooqg2VjWLNm06amaEUZzjBdKqC0UsyH4HTc3/3zV+hmVxjcsxo?=
 =?us-ascii?Q?Hwa7ar3v94dhvlyDqUErjRyJr6ZFlrQdFjSE2agsCijcIR+3GcJ95wBVuYnD?=
 =?us-ascii?Q?QxBq7z1/mG1W/Fwg5p+zrLtGLWbEh2R4Gzzv7R17oDh/3VUDkx2yRuXSw8Cp?=
 =?us-ascii?Q?zXeneit6RT/0XTsP/hswHWoL1rbWJ+MQNVHMxgvCYOi9kYeLr1nf++apb0uG?=
 =?us-ascii?Q?L96knB/M/1yElTeg4zYMKiq04QMfNgPyR2KEyNOW015UoSlskBG6holBScOc?=
 =?us-ascii?Q?7xidYf/Ip4he0EKUOp5fX41ekF6fG6tw3oGgRX6rmwnvUJf9vk8y8frdOflE?=
 =?us-ascii?Q?37Vhik5VZclSab4+j2P9vEatJynpontSinMisHOJ8t4hr2ebKEKl6/+iINyK?=
 =?us-ascii?Q?OSQS0Jut8rYm2nE1U93z9m+hYy0jkDEZnmj/Sjou31/+KsW0bCuKnV5pIzXG?=
 =?us-ascii?Q?vsgajaNDwOiP8FuFp9VeSYbdZn6U3J/gXp4fSG5Dwt735mTykMfsawtZ2S6G?=
 =?us-ascii?Q?bcOv448l8NCfPwDnBe6SY0JFpyAVDZTLVqv6CA5eO0l7fdyWPQ0Op/yDPNbc?=
 =?us-ascii?Q?2sLIue0hcB8YjRX4+ZpSq/DInmoiBnQfQ4q/KxV/HFxqgLx4Ux/+1oofHzQ0?=
 =?us-ascii?Q?GF1W8pvAdQSmQ17cP1GxZG6OMhZQjyxabdff4KMeDzaFvdNLSV3jmtkNJZ1z?=
 =?us-ascii?Q?Ial5uMQpKWD7eddvraHnM+PoiP7gQbFqn5elr/LkEXjuzGYX52LRyhpRs4ox?=
 =?us-ascii?Q?ktCIaGzwRQ3losXXLAucPaNmd92GYhdzq+Vch3hpN80QMUwY05s/jBCJCBjx?=
 =?us-ascii?Q?rY9iTlBPRLrQoRIC4eUS+uVZOIRXZVpoprHBPpJRLAwMj11+wJpK6eqlx3jH?=
 =?us-ascii?Q?MtvVx5g7rivfOUH9r1fQx0IQh4Y5VyUjWzRri3Mv3DTEaUpb9Mp1wVC3YO1S?=
 =?us-ascii?Q?IzGXuRwEVCV2RFZQI5jWxt40iQTA8IYc08cj0O6W+rAILWUc9Zt1tien6n+G?=
 =?us-ascii?Q?3U8HF8innmKFc+qLgxCZ2mj67RS4l8Fhq2isLjMhGPlni9N8oFxf5u7yDcj0?=
 =?us-ascii?Q?/rQbiM/bneUWfvjPyYGfNcfJJKL6bsUuJdc4d3t8PvLan19odOGxzX74egK9?=
 =?us-ascii?Q?i1pvR0s5stha4m5Y1xnOdm81m+oeQU39?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Qw9a4rmRBwjppQJETazhC6keffI5EsGgsahrdWPG2ekYhdcXLFFoW6McDr89?=
 =?us-ascii?Q?KHtk6QjdbkDX2tE4WMcw3CPyiKdmhVnFdvd7UAhgTcv58lfda5ctsA/GXrUd?=
 =?us-ascii?Q?Cz0Z9A+loKA0TSuTqby+a0G0rfbXTejIMWcfA0hCV06xhVLE4sOshBZyIKmJ?=
 =?us-ascii?Q?zQnpoTstcJPYQlYw3UY25vKUBME8Vk1GID8YnhMDquuzu6KVH9Y1hwlwrzDU?=
 =?us-ascii?Q?ewBBZ0FZ4jFhUTD8De2eI30hntrF7DRSME1+RYSWBQnLrdlij5TDsiuc2GpL?=
 =?us-ascii?Q?eCJuqI7Lr8s3EK6zc2KPZbTiLwJ2H+j4oO2YCYcm7LtR/n1vAkeW8XeCFvJJ?=
 =?us-ascii?Q?ocZGDq8aCzaTZV3AAfUf1r5ss/WZe2yayX/Zo3nR3SvNEBnsfCb+ydxY7jcl?=
 =?us-ascii?Q?Z6IrRXJpwh5/k74k/Wu5YcxaWJQpVCPmIkga+5W7zBhzpwjagz10GKpLsf5D?=
 =?us-ascii?Q?hmKnNmMcfBzTDfzKBVUXbKUpSZD5yuMZQWtIWBES5MCo3Y27SjYsL8FWwDO4?=
 =?us-ascii?Q?t6bArtYFoXMdKJKwfFiQXYApa9JDQUEOp34QBPV8WqQdaGNsHR7Sr0rBpdG/?=
 =?us-ascii?Q?y4JK344bqgg+VStDG3THtd5NZI5C5GpbW1feE1JdZ7++nOsxK9E4XgzpnGiC?=
 =?us-ascii?Q?BT7T0mehCu6/BNyk/pE1q9btC938Ioze4lGIwqa2wCg1K7bjvcqP5sxqCCOL?=
 =?us-ascii?Q?pREy+9Mcds31WEzHevmFyuwxMmL+QEwZQJclvM0s09QbCXwEPRSVj7BO7mF9?=
 =?us-ascii?Q?nl2Vs/maqCBtLrbcgA0fGTpwkCIW76uFv4VL9u2fZpLa2qXNAvbYanXLwJsS?=
 =?us-ascii?Q?+992pZJMGtN59VJbE0H3+whGTWmI9pIHTPVscSo1BYhVxUpxOpvOtuXbJ9tC?=
 =?us-ascii?Q?nCCmof734uCiu7aPG9AOYogW/9a6gPYpKxw2X0wkRLkjnCr67h0cXj/R6dmK?=
 =?us-ascii?Q?1hnW8wkKCE4hA7w/o4QHj49X1sAcEmbx3lnLar9B7iEqEPPMeWXvSAIwRVTo?=
 =?us-ascii?Q?Mshz9V88YukUDZcpgDjV0MGJBsP2yvYxVf9TAOy5AlsXmSaNSLrOIi8emdsi?=
 =?us-ascii?Q?8rJJPOygoMncnSW8D5FpNXVTC9lIxY9mH0zBdEpYlcL9N+RzD3joZtOS1qcs?=
 =?us-ascii?Q?HLSXQQeVPd4eKi7HEZGAPKmv790kn3hWTkyikiCxDMynrbEnOTCQrDoU57jq?=
 =?us-ascii?Q?F18Q1yG3LwSOZ9mnpPFuoVtrMEkiqWPzGFpOl+wOeIq6PJl4jEGWNIyJ+lEz?=
 =?us-ascii?Q?Qz5u3DcyUizscDOVmfiPSSkenJMSEGGDO/Jr+ob8P12HdTQ/k396ahZ9D+1u?=
 =?us-ascii?Q?WvBrPbTrv6CsuTsvj+2gAGd/Pu2U2O0C90WGYHDM8p3e5h3BPtOf25ELjaRP?=
 =?us-ascii?Q?0lFo/nPdQvLFrf+9GyyYLp5kK9YQGbaPOUi1mvNUIKh37dQDb6fKkRNio/g7?=
 =?us-ascii?Q?CUWybAVwgdi3ndv8RHo7ikSb9AHL46Bu0Xe86C2aoj7Rx5ZAuL+6Nze30bgf?=
 =?us-ascii?Q?SwM0GtPpfoTw/ZvuqVomIFtSiK9lmgy2iGpqEmRlx+pUpd2Jq9DRzOPDGLR3?=
 =?us-ascii?Q?mpwUrnur/1XNZpgU5b7QpsxzwIxudMOCG94WTvxQ80hx7BMcStAOIK/ERvx2?=
 =?us-ascii?Q?1A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb94b78-f94c-4942-350c-08dd54a61444
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 07:37:23.7620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7U2goueR6RMAriApvZkqR6nU8AX5PD+l6dJ1oNhuXAgiHuCedvY6++yDJanYm5hyfO1psiyoH98HZctPxRrZpedIAv1/7gQ6Ns+oCDJ+fWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434



> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Thursday, February 20, 2025 6:50 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> I30718 <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH V4] media: i2c: imx334: Add support for 1280x720 &
> 640x480 resolutions
>=20
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> Hi Shravan,
>=20
> On Tue, Feb 18, 2025 at 03:03:56PM +0530, shravan kumar wrote:
> > From: Shravan Chippa <shravan.chippa@microchip.com>
> >
> > Added support for 1280x720@30 and 640x480@30 resolutions and
> optimized
> > the resolution arrays by incorporating a common register array.
> >
> > Updated the register array values for 1920x1080@30 and 3840x2160@30
> > resolutions in accordance with the common register array values.
> >
> > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> >
> > ---
> > changelog:
> > v3 -> v4
> > In response to the review request, the dependency of the common
> > register value array on the 445M link frequency has been eliminated.
> >
> > Although I do not have a test setup for 4k resolution at an 819M link
> > frequency, I have made adjustments based on the IMX334 data sheet, the
> > latest 4k resolution, and the common register value array.
> >
> > Additionally, the 4k resolution has been switched to master mode to
> > ensure consistency with other resolutions that also use master mode.
> >
> > changelog:
> > v2 -> v3
> > removied blank lines reported by media CI robot
> >
> > v1 -> v2
> > Optimized the resolution arrays by added common register array
> > ---
> >
> >  drivers/media/i2c/imx334.c | 214
> > +++++++++++++++++++------------------
> >  1 file changed, 109 insertions(+), 105 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > index a544fc3df39c..0172406780df 100644
> > --- a/drivers/media/i2c/imx334.c
> > +++ b/drivers/media/i2c/imx334.c
> > @@ -167,8 +167,8 @@ static const s64 link_freq[] =3D {
> >       IMX334_LINK_FREQ_445M,
> >  };
> >
> > -/* Sensor mode registers for 1920x1080@30fps */ -static const struct
> > imx334_reg mode_1920x1080_regs[] =3D {
> > +/* Sensor common mode registers values */ static const struct
> > +imx334_reg common_mode_regs[] =3D {
> >       {0x3000, 0x01},
> >       {0x3018, 0x04},
> >       {0x3030, 0xca},
> > @@ -176,26 +176,10 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x3032, 0x00},
> >       {0x3034, 0x4c},
> >       {0x3035, 0x04},
> > -     {0x302c, 0xf0},
> > -     {0x302d, 0x03},
> > -     {0x302e, 0x80},
> > -     {0x302f, 0x07},
> > -     {0x3074, 0xcc},
> > -     {0x3075, 0x02},
> > -     {0x308e, 0xcd},
> > -     {0x308f, 0x02},
> > -     {0x3076, 0x38},
> > -     {0x3077, 0x04},
> > -     {0x3090, 0x38},
> > -     {0x3091, 0x04},
> > -     {0x3308, 0x38},
> > -     {0x3309, 0x04},
> > -     {0x30C6, 0x00},
> > +     {0x30c6, 0x00},
> >       {0x30c7, 0x00},
> >       {0x30ce, 0x00},
> >       {0x30cf, 0x00},
> > -     {0x30d8, 0x18},
> > -     {0x30d9, 0x0a},
> >       {0x304c, 0x00},
> >       {0x304e, 0x00},
> >       {0x304f, 0x00},
> > @@ -210,7 +194,7 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x300d, 0x29},
> >       {0x314c, 0x29},
> >       {0x314d, 0x01},
> > -     {0x315a, 0x06},
> > +     {0x315a, 0x0a},
>=20
> What's the effect of this change and why is it done?

This change is to increase the horizontal blanking to get more time to proc=
ess the image line by line.


>=20
> >       {0x3168, 0xa0},
> >       {0x316a, 0x7e},
> >       {0x319e, 0x02},
> > @@ -330,116 +314,103 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x3002, 0x00},
> >  };
> >
> > +/* Sensor mode registers for 640x480@30fps */ static const struct
> > +imx334_reg mode_640x480_regs[] =3D {
> > +     {0x302c, 0x70},
> > +     {0x302d, 0x06},
> > +     {0x302e, 0x80},
> > +     {0x302f, 0x02},
> > +     {0x3074, 0x48},
> > +     {0x3075, 0x07},
> > +     {0x308e, 0x49},
> > +     {0x308f, 0x07},
> > +     {0x3076, 0xe0},
> > +     {0x3077, 0x01},
> > +     {0x3090, 0xe0},
> > +     {0x3091, 0x01},
> > +     {0x3308, 0xe0},
> > +     {0x3309, 0x01},
> > +     {0x30d8, 0x30},
> > +     {0x30d9, 0x0b},
> > +};
> > +
> > +/* Sensor mode registers for 1280x720@30fps */ static const struct
> > +imx334_reg mode_1280x720_regs[] =3D {
> > +     {0x302c, 0x30},
> > +     {0x302d, 0x05},
> > +     {0x302e, 0x00},
> > +     {0x302f, 0x05},
> > +     {0x3074, 0x84},
> > +     {0x3075, 0x03},
> > +     {0x308e, 0x85},
> > +     {0x308f, 0x03},
> > +     {0x3076, 0xd0},
> > +     {0x3077, 0x02},
> > +     {0x3090, 0xd0},
> > +     {0x3091, 0x02},
> > +     {0x3308, 0xd0},
> > +     {0x3309, 0x02},
> > +     {0x30d8, 0x30},
> > +     {0x30d9, 0x0b},
> > +};
> > +
> > +/* Sensor mode registers for 1920x1080@30fps */ static const struct
> > +imx334_reg mode_1920x1080_regs[] =3D {
> > +     {0x302c, 0xf0},
> > +     {0x302d, 0x03},
> > +     {0x302e, 0x80},
> > +     {0x302f, 0x07},
> > +     {0x3074, 0xcc},
> > +     {0x3075, 0x02},
> > +     {0x308e, 0xcd},
> > +     {0x308f, 0x02},
> > +     {0x3076, 0x38},
> > +     {0x3077, 0x04},
> > +     {0x3090, 0x38},
> > +     {0x3091, 0x04},
> > +     {0x3308, 0x38},
> > +     {0x3309, 0x04},
> > +     {0x30d8, 0x18},
> > +     {0x30d9, 0x0a},
> > +};
> > +
> >  /* Sensor mode registers for 3840x2160@30fps */  static const struct
> > imx334_reg mode_3840x2160_regs[] =3D {
> > -     {0x3000, 0x01},
> > -     {0x3002, 0x00},
> > -     {0x3018, 0x04},
> > -     {0x37b0, 0x36},
> > -     {0x304c, 0x00},
> > -     {0x300c, 0x3b},
>=20
> This was the only location this register was written to.

This register value is same for all link frequencies (default value 0x3b fo=
r 24Mhz crystal clock),=20

>=20
> Please split this into two to make it more reviewable: splitting register=
 lists
> into two and then to adding new modes.

I will try to make one patch for common register values
One more patch for new modes of 640x480 and 1280x720

Thanks,
Shravan

>=20
> > -     {0x300d, 0x2a},
> > -     {0x3034, 0x26},
> > -     {0x3035, 0x02},
> > -     {0x314c, 0x29},
> > -     {0x314d, 0x01},
> > -     {0x315a, 0x02},
> > -     {0x3168, 0xa0},
> > -     {0x316a, 0x7e},
> > -     {0x3288, 0x21},
> > -     {0x328a, 0x02},
> >       {0x302c, 0x3c},
> >       {0x302d, 0x00},
> >       {0x302e, 0x00},
> >       {0x302f, 0x0f},
> > +     {0x3074, 0xb0},
> > +     {0x3075, 0x00},
> > +     {0x308e, 0xb1},
> > +     {0x308f, 0x00},
> >       {0x3076, 0x70},
> >       {0x3077, 0x08},
> >       {0x3090, 0x70},
> >       {0x3091, 0x08},
> > -     {0x30d8, 0x20},
> > -     {0x30d9, 0x12},
> >       {0x3308, 0x70},
> >       {0x3309, 0x08},
> > -     {0x3414, 0x05},
> > -     {0x3416, 0x18},
> > -     {0x35ac, 0x0e},
> > -     {0x3648, 0x01},
> > -     {0x364a, 0x04},
> > -     {0x364c, 0x04},
> > -     {0x3678, 0x01},
> > -     {0x367c, 0x31},
> > -     {0x367e, 0x31},
> > -     {0x3708, 0x02},
> > -     {0x3714, 0x01},
> > -     {0x3715, 0x02},
> > -     {0x3716, 0x02},
> > -     {0x3717, 0x02},
> > -     {0x371c, 0x3d},
> > -     {0x371d, 0x3f},
> > -     {0x372c, 0x00},
> > -     {0x372d, 0x00},
> > -     {0x372e, 0x46},
> > -     {0x372f, 0x00},
> > -     {0x3730, 0x89},
> > -     {0x3731, 0x00},
> > -     {0x3732, 0x08},
> > -     {0x3733, 0x01},
> > -     {0x3734, 0xfe},
> > -     {0x3735, 0x05},
> > -     {0x375d, 0x00},
> > -     {0x375e, 0x00},
> > -     {0x375f, 0x61},
> > -     {0x3760, 0x06},
> > -     {0x3768, 0x1b},
> > -     {0x3769, 0x1b},
> > -     {0x376a, 0x1a},
> > -     {0x376b, 0x19},
> > -     {0x376c, 0x18},
> > -     {0x376d, 0x14},
> > -     {0x376e, 0x0f},
> > -     {0x3776, 0x00},
> > -     {0x3777, 0x00},
> > -     {0x3778, 0x46},
> > -     {0x3779, 0x00},
> > -     {0x377a, 0x08},
> > -     {0x377b, 0x01},
> > -     {0x377c, 0x45},
> > -     {0x377d, 0x01},
> > -     {0x377e, 0x23},
> > -     {0x377f, 0x02},
> > -     {0x3780, 0xd9},
> > -     {0x3781, 0x03},
> > -     {0x3782, 0xf5},
> > -     {0x3783, 0x06},
> > -     {0x3784, 0xa5},
> > -     {0x3788, 0x0f},
> > -     {0x378a, 0xd9},
> > -     {0x378b, 0x03},
> > -     {0x378c, 0xeb},
> > -     {0x378d, 0x05},
> > -     {0x378e, 0x87},
> > -     {0x378f, 0x06},
> > -     {0x3790, 0xf5},
> > -     {0x3792, 0x43},
> > -     {0x3794, 0x7a},
> > -     {0x3796, 0xa1},
> > -     {0x3e04, 0x0e},
> > +     {0x30d8, 0x20},
> > +     {0x30d9, 0x12},
> >       {0x319e, 0x00},
> >       {0x3a00, 0x01},
> >       {0x3a18, 0xbf},
> > -     {0x3a19, 0x00},
> >       {0x3a1a, 0x67},
> > -     {0x3a1b, 0x00},
> >       {0x3a1c, 0x6f},
> > -     {0x3a1d, 0x00},
> >       {0x3a1e, 0xd7},
> >       {0x3a1f, 0x01},
> > +     {0x300d, 0x2a},
> > +     {0x3034, 0x26},
> > +     {0x3035, 0x02},
> > +     {0x315a, 0x02},
> >       {0x3a20, 0x6f},
> >       {0x3a21, 0x00},
> >       {0x3a22, 0xcf},
> >       {0x3a23, 0x00},
> >       {0x3a24, 0x6f},
> >       {0x3a25, 0x00},
> > +     {0x3a24, 0x6f},
> > +     {0x3a25, 0x00},
> >       {0x3a26, 0xb7},
> >       {0x3a27, 0x00},
> >       {0x3a28, 0x5f},
> > @@ -505,6 +476,32 @@ static const struct imx334_mode
> supported_modes[] =3D {
> >                       .num_of_regs =3D ARRAY_SIZE(mode_1920x1080_regs),
> >                       .regs =3D mode_1920x1080_regs,
> >               },
> > +     }, {
> > +             .width =3D 1280,
> > +             .height =3D 720,
> > +             .hblank =3D 2480,
> > +             .vblank =3D 1170,
> > +             .vblank_min =3D 45,
> > +             .vblank_max =3D 132840,
> > +             .pclk =3D 297000000,
> > +             .link_freq_idx =3D 1,
> > +             .reg_list =3D {
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_1280x720_regs),
> > +                     .regs =3D mode_1280x720_regs,
> > +             },
> > +     }, {
> > +             .width =3D 640,
> > +             .height =3D 480,
> > +             .hblank =3D 2480,
> > +             .vblank =3D 1170,
> > +             .vblank_min =3D 45,
> > +             .vblank_max =3D 132840,
> > +             .pclk =3D 297000000,
> > +             .link_freq_idx =3D 1,
> > +             .reg_list =3D {
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_640x480_regs),
> > +                     .regs =3D mode_640x480_regs,
> > +             },
> >       },
> >  };
> >
> > @@ -989,6 +986,13 @@ static int imx334_start_streaming(struct imx334
> *imx334)
> >       const struct imx334_reg_list *reg_list;
> >       int ret;
> >
> > +     ret =3D imx334_write_regs(imx334, common_mode_regs,
> > +                             ARRAY_SIZE(common_mode_regs));
> > +     if (ret) {
> > +             dev_err(imx334->dev, "fail to write common registers");
> > +             return ret;
> > +     }
> > +
> >       /* Write sensor mode registers */
> >       reg_list =3D &imx334->cur_mode->reg_list;
> >       ret =3D imx334_write_regs(imx334, reg_list->regs,
>=20
> --
> Kind regards,
>=20
> Sakari Ailus

