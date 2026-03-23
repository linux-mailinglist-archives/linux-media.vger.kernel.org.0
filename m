Return-Path: <linux-media+bounces-56654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N+oKNzZwGn6NQQAu9opvQ
	(envelope-from <linux-media+bounces-56654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 07:12:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BA82ECE42
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 07:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95DCB300F149
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 06:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BE92D5C8E;
	Mon, 23 Mar 2026 06:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ci22Nl5D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FE52C21D8;
	Mon, 23 Mar 2026 06:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246356; cv=fail; b=NIrf1GTL5I0EggtS10mgR1GwVUyiukYbWCfpLQMqv1XUaUQNywySX2PspQ/2Gt7w8QWPjcBVGhp9sbfAVcr6Ig6PMynX7Gfd2xYyoSB8Yo0DV/f9+JvcQeDxc828gmVH5I4BI1gy8uBciuEBzmJnOqF70bpX++AIigp5k4buRrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246356; c=relaxed/simple;
	bh=A40QCg7ahcsTpOXvUp63bh8ktP5bvsBgr17ta/yvT98=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k4ieA40SDuNpbUawCTETXXEN4oTOz3k3NM+jYl7tjIb8lTTet4vX3y/IQ9gHclKBEY5U3oJjw5fNDfU+QVHBmDuWl6DjssaDa962iPRm3VIpeOq1DT+N7zHZ1K9zCkYjmC32duNwXr5sSdyt0cLf5HNq6GrvTbBraBkx1DWsxv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ci22Nl5D; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774246354; x=1805782354;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A40QCg7ahcsTpOXvUp63bh8ktP5bvsBgr17ta/yvT98=;
  b=Ci22Nl5DJA4wdVPRRzLwdItkcFnVCW+yNwnco5Sf80+tXYWCh61KUhfm
   +4tS33P0vM3qZTCWTejLtZNT6wlSv4NGe9oZ2zsypW+4ltqxgOjzV9u4b
   aJEItIQ9hQfDVLVbiLOIDP+68FFRaHdoC2ihg5iKOd1ymxK+i1NTv6Bh3
   MPXqQI5fuIoMvYI5Vfcf8VNgb9l3j6k+DHX4rcP1XrzgP1nscI+0WwGQo
   exCMWBRXUxeLEkYyJVXP12o+8CNXzEZm1xXCPT0Z1ZNdhDzOAF9bKDpjI
   bXaJ8m1td0YnELLYHkglHACiTeO4RwMJ4SK4JUtu9YIuKLZMVitw28S4o
   Q==;
X-CSE-ConnectionGUID: hvkaNQt2RlWJXAQKIi9saw==
X-CSE-MsgGUID: WUpvU7NXS2u9gveLnBwUvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75207734"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75207734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 23:12:33 -0700
X-CSE-ConnectionGUID: XN+0Qo5TSamdRn0Q8OVfKg==
X-CSE-MsgGUID: 9LO+F9LOQvm9tOATYVNciQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="224144808"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 23:12:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 23:12:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 23:12:32 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 23:12:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyKeOEYpqLUqu8rDM0wg2R6pDK2rJQ2bRfW3Ei1dEMSpL3P5m3jOc+jQmsosL09m7YtSlJ13Zd1k/Uph2lbP2RvQC8vUQg1iyteiiFhe50iW5d559yp+24Yz2jKrE89YHHJHIjH5uQGCGotu2/GNVEemrqFkP9/+089gUw09H76+m0A/yhS50DxoVq+F7jWHZKYXRVx+OrCaBOg2/asIYO9v1EsipU2yR0bgw9V7K5bPKly/HnZvDtoSFc/qPynXmTCrVkuU45O1CFpSxoTqQygnTevGsBNynByU+CH4T+kASAzZXRGTNC1lAd/IHxVktYtIPO/aifN1JgKIlP0Sfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbmw4K1YCCB+7r1aNUyHttHBFc+uljvODx3G0fQMx9g=;
 b=Cgcpj40QgEiCL757z8FreJPnrMyOfLuGPzEkb8KmN7IgUuh6uBfwjck5JLIFkCB8/TA46yBMB7nmVBix02bXT9WO8fNDyhzCKiB5JGvQMRNgZVORhIb/8agKjtNDUpmRfG0oFsZO74b4z4+L8CTXAsoVgb1zgElLzkELbFaPgboQoxqGqsDiGCtaAfOiQDjWvpxTpqWW33nBz7DWiP+CzNCpCsS/f6lksy5tnaOLg2Xf7tbsZBQYvSvsexdRG6Vint3DmeuwxseRb1pooUkFWziYWUvCV6ZOVPHXV9eLQvmJFz6W09eMmKtu4mxWyoBHaHkaQFGTxtmGsN9LLDGNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 06:12:29 +0000
Received: from SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce]) by SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 06:12:29 +0000
From: "T, Arun" <arun.t@intel.com>
To: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "Kao, Arec"
	<arec.kao@intel.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "dan.scally@ideasonboard.com"
	<dan.scally@ideasonboard.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Djait, Mehdi" <mehdi.djait@intel.com>
Subject: RE: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data for
 Intel nvl
Thread-Topic: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data
 for Intel nvl
Thread-Index: AQHcrYdZgLR4y1PdOkqwcAH2m3V2krW7vJpg
Date: Mon, 23 Mar 2026 06:12:29 +0000
Message-ID: <SA3PR11MB80229E0FF7B1E8B32EB35E689D4BA@SA3PR11MB8022.namprd11.prod.outlook.com>
References: <20260306163019.1619490-1-arun.t@intel.com>
 <20260306163019.1619490-2-arun.t@intel.com>
In-Reply-To: <20260306163019.1619490-2-arun.t@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8022:EE_|SJ2PR11MB7425:EE_
x-ms-office365-filtering-correlation-id: 2e20ff23-ea6e-40b2-6d4a-08de88a329b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003|7053199007|38070700021;
x-microsoft-antispam-message-info: Zfpyucv23yKYO/NMHMOlrzRSLhnfX8RJtjWofQPBL+3SwPvZnNr3GnP5hjPtBK12VMMsjFGWfRiUeTnYo2u8n7hM2QvjPCDaY/sdrpmVHSf7FzY5hky5dK/fyKQdrVDmUOtxAVnOD/p1fs6Sm+VVNZcPoVcGoovEx2a3Zps7MrGyzsHdfQz5yxOwCShTumuZsqI0HSeaq6ZWlGgc130fg9JyYmuey8j2cEdEdTA+DqBeX6q4cXRotkqE3dbSfySg8M2MvmkU1ITfYVNxfFckWspWJjq4Am6zVk0Qsg7yuvrbC/3iDJjMWSXtgaAjs5bP1kLSXlaVSbGZAbM18SD1XQig1XsVizwJcVqWDHyV7M7dvhTa6v22CJYGxyZkzCVxdlQb3mP+1MRRwI0n3LxW4GrDkBzCeLMSnqSMF604DYzOeAGLIVct6382j488l59yPlALWEZU5u7m4kHsUKpEBaT/zvcTT4SywU1/E7ovnVTKoTF8H5TYg3ia6L82Hn3ly/UXVy6w8By+mgJb/gkAbufoxRka8QNvELhHJG21umKEZL60nyExsWOPDcYceEw8moI5w/KTUHQP3izW9ZqPrPB4yikvEMClAP4Kbow12u79CNfCGRcymvPL66e0zmT6Hqes/Cx7orD+WGx+JnTpaqQPmg8PU+qUGEkJtgo4f/RMzpa8H5vbO4DK3creU/N6faUWeQlGQZGsh+E2F5vs0fj3ZhfFmBE47GO8surGVpAU0vtUZdWqeOtzJyj2Daq6nja9CpC2WADjVfYTBi2C3Zsjb0MjsTiLj7ANj2jqeomHB/OJo/2dtZHF3wxQjWBk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WeyB1/B/MsXkSdREGi9r+KM2DiIhmMEsFkzntSjLaZkzD7+t1wgmEOv/fh/j?=
 =?us-ascii?Q?4BNaxQUQtset+V6o7O2HXOKspoPjK555zailqZEnP6QnT6/BoNIFB1AW01cM?=
 =?us-ascii?Q?d3FLKI0SMUh66IoTdfzSuo4KbOAG9lERLxPoJjVm2PTTC13uIsHGjMli8iPE?=
 =?us-ascii?Q?V4cUGYnqXhsez0ZB4GyNXjlQUrU3+R3jYDoLd1lfYEe3ar0YOidUZIqzEqhp?=
 =?us-ascii?Q?z/pUIAJDfXm+LBk7UpdU81m6SF3qmGpw4KLLRJRAPkHw7wi5MM7XSM6CgzDh?=
 =?us-ascii?Q?F7NLCu9tR3ieC2Qc4ANA3xb0JlQrH0JJizMoMP9rT9h/98sgoW/9GNa6PD0C?=
 =?us-ascii?Q?gMyi2Guu+/kxqcELtZSHy9A32tw0coSIQiweDx7LcOzTBtEwb7DGyY810mkr?=
 =?us-ascii?Q?tUA8yDcelYN9TWO2wzYcd4QZpbxb4R+CGobr68uFrvV6jAGUWCSgDkPiWiOc?=
 =?us-ascii?Q?xz57BiGd/a60+fFqxMXApCdO+pl3n6LawxlxYWWfP3r8A5kRgbH6UQadUCEu?=
 =?us-ascii?Q?JGqr9JMi3ZIWb289wcv2IZ2r0BzjqTyOvpvRr9WtLrmXC1mT+qXgVMFVSdJP?=
 =?us-ascii?Q?ll6pZhmFdyj0xe6ajHt0LIgNuwbECXp4mY1EZ0a+OdByevGqXYeZsqadG0Jf?=
 =?us-ascii?Q?SSeABPCZpZCeHX8er0X+KmvQsvVO9XNwzaRUVMYv7qgZ/+Jc2DFsNlThV5ar?=
 =?us-ascii?Q?g4H64OGlCGDM/kcpi+uOUZRh9nLqSnLxMmIuaeUUbyJrhVkBO+6EpPftujXZ?=
 =?us-ascii?Q?xCIP8qVLOuTOAhsA3HXJUsAY5Laq5o9E6EHIcG0MqWjE9zp3aAvpkJZiVIJb?=
 =?us-ascii?Q?Osr0U9SsA8Zkg9q0+niavAiC+G+MwdlzuHEl2fCrud23gGCpSGakvSdG/Iiv?=
 =?us-ascii?Q?YpICSxxJInhlNQvTftlq1iZqe3RDbK/VaTpGwajXn6gX12xGAMGmLUOFk0aZ?=
 =?us-ascii?Q?komgzpJAqyzCva7jCfaZIbnqdm+JMSW7dSH+tyH6N6gYtqU8BCvcZvHNXuuS?=
 =?us-ascii?Q?fZ7Z2+38vPS7UW4TeA/KObs7e70XFwca+SWIXqc+y5LrWsC62NMvSSDInTcn?=
 =?us-ascii?Q?FC0hubadALhZVNuHeTDTM2ZIB0rwXF6Ke9WkdOD3O6OrvH0hM0H1QjKFD3O6?=
 =?us-ascii?Q?BCG6iSL1GrgWtX4UqBbSt9XLWgdaFQuGfaDRSmq11gWZAbunqKcBHscmp8E8?=
 =?us-ascii?Q?wi3ufLP57oqI1w9WUk/Fg9PuxJbfxW2WiAx/rC1VnLNoKlJrvYVMYxGBgJ5q?=
 =?us-ascii?Q?e+E5g92sSM62ppPOP4euaiHEcNaJont64R1jFa9SUQyQpPRm6ErRN1G9UO8a?=
 =?us-ascii?Q?m+DRxqx7htG2HI2wKImYEqQAVz7MVyXKAcP7tPDf7gQhbINeTBFaokXfqolS?=
 =?us-ascii?Q?Ae9GXDrtRSusnH33qnaukcDXnFA/rT5EAw/cIPlhSZtEkd51Z2UM+0MlAF57?=
 =?us-ascii?Q?HBWipoz8ci44X5+jAG/eCCoQmYkY/rO9be71MeCM7dhxabrTD/Gk2ITCKLWn?=
 =?us-ascii?Q?a5RCENXMxfQVKN8nOiRo4OgfklIFjQ6hDpRF1BqVmC2L1eU7YVUZEuUE4wNT?=
 =?us-ascii?Q?IbHFd/eIepK+zOTl7z/Dbsw9WugBw3Bf5Tk+qOTt7fpVUFo2635aHJSReTnb?=
 =?us-ascii?Q?Si54u2xdJSmck0Nks1jGKeYZT0hwpsxCRKGwMRH73x/KLHBNpAbQnZpJPkhr?=
 =?us-ascii?Q?jh1PV2KdPJp5c+xqCm3qNuuN9tvfLH8KkvhaeYVt+W3BYDj0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gR8Y8Jc0WA1x9b3Dt+eF9jh3uvU1Zty0Ts1wBQIn6++D6DPg081Z++OeksMN/h3gTLZE6zbaw1FseYU2D20uDt4pxd/Htu03USz8KkxDlwuYPuCO3IQhIT0zOB+lg+cIi8SfRdJZf4B0wr7Wg9AaB9tOCfAoxGTlSeI4dMPcwmknAPyF/hjXi1wND8Cib4+IrWx2735CzbLX07w4sq72Q4OkMt1Ku4S/y5PKu7SdrwCAoHnLel2DNT7ncuxpAyod/muGpHnsi1cicjXDjzvinvos2gVdWWw0O7pvTsk9j1pso6XCyLpvdPFK1kKFZ01AKDCrmrMRKBKmSVkwgHRR/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e20ff23-ea6e-40b2-6d4a-08de88a329b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 06:12:29.3505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FKpZVBO9D2oMSpep3iXsTvxRVri7ZcJ0EnsQ1RF/q/laKr14HOZP0BPdrZTSIP8o6Yg0dY+Afr+fdcfxzIe2aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56654-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,SA3PR11MB8022.namprd11.prod.outlook.com:mid,qualcomm.com:email,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 47BA82ECE42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,=20

There has been no reply to these below patches for quite some time. Could y=
ou please provide any feedback, comments, or suggestions on these below pat=
ches

https://lore.kernel.org/linux-media/20260306163019.1619490-2-arun.t@intel.c=
om/
https://lore.kernel.org/all/20260306163019.1619490-3-arun.t@intel.com/

-
Regards,
Arun T

-----Original Message-----
From: T, Arun <arun.t@intel.com>=20
Sent: 06 March 2026 10:00 PM
To: T, Arun <arun.t@intel.com>; johannes.goede@oss.qualcomm.com
Cc: sakari.ailus@linux.intel.com; Kao, Arec <arec.kao@intel.com>; ilpo.jarv=
inen@linux.intel.com; dan.scally@ideasonboard.com; platform-driver-x86@vger=
.kernel.org; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Dja=
it, Mehdi <mehdi.djait@intel.com>
Subject: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data for =
Intel nvl

The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring bo=
ard data to configure the GPIOs and regulators for proper camera sensor ope=
ration.

Signed-off-by: Arun T <arun.t@intel.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/dri=
vers/platform/x86/intel/int3472/tps68470_board_data.c
index 71357a036292..8ae5e01f6660 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2_c=
onsumer_supplies[] =3D {
 	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),  };
=20
+/* Settings for Intel NVL platform */
+
+static struct regulator_consumer_supply int3472_core_consumer_supplies[] =
=3D {
+	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"), };
+
+static struct regulator_consumer_supply int3472_ana_consumer_supplies[] =
=3D {
+	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"), };
+
+static struct regulator_consumer_supply int3472_vcm_consumer_supplies[] =
=3D {
+	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:01"), };
+
+static struct regulator_consumer_supply int3472_vsio_consumer_supplies[] =
=3D {
+	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"),
+	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:01"),
+	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:01"), };
+
+static struct regulator_consumer_supply int3472_aux1_consumer_supplies[] =
=3D {
+	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:01"), };
+
+static struct regulator_consumer_supply int3472_aux2_consumer_supplies[] =
=3D {
+	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:01"), };
+
 static const struct regulator_init_data dell_7212_tps68470_core_reg_init_d=
ata =3D {
 	.constraints =3D {
 		.min_uV =3D 1200000,
@@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_tps6=
8470_aux2_reg_init_data =3D
 	.consumer_supplies =3D int3479_aux2_consumer_supplies,  };
=20
+static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_d=
ata =3D {
+	.constraints =3D {
+		.min_uV =3D 1200000,
+		.max_uV =3D 1200000,
+		.apply_uV =3D true,
+		.always_on =3D true,
+	},
+	.num_consumer_supplies =3D ARRAY_SIZE(int3472_core_consumer_supplies),
+	.consumer_supplies =3D int3472_core_consumer_supplies, };
+
+static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_da=
ta =3D {
+	.constraints =3D {
+		.min_uV =3D 2815200,
+		.max_uV =3D 2815200,
+		.apply_uV =3D true,
+		.always_on =3D true,
+	},
+	.num_consumer_supplies =3D ARRAY_SIZE(int3472_ana_consumer_supplies),
+	.consumer_supplies =3D int3472_ana_consumer_supplies, };
+
+static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_da=
ta =3D {
+	.constraints =3D {
+		.min_uV =3D 2815200,
+		.max_uV =3D 2815200,
+		.apply_uV =3D true,
+		.always_on =3D true,
+	},
+	.num_consumer_supplies =3D ARRAY_SIZE(int3472_vcm_consumer_supplies),
+	.consumer_supplies =3D int3472_vcm_consumer_supplies, };
+
+/* Ensure the always-on VIO regulator has the same voltage as VSIO */=20
+static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_da=
ta =3D {
+	.constraints =3D {
+		.min_uV =3D 1800600,
+		.max_uV =3D 1800600,
+		.apply_uV =3D true,
+		.always_on =3D true,
+	},
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init_d=
ata =3D {
+	.constraints =3D {
+		.min_uV =3D 1800600,
+		.max_uV =3D 1800600,
+		.apply_uV =3D true,
+		.always_on =3D true,
+	},
+	.num_consumer_supplies =3D ARRAY_SIZE(int3472_vsio_consumer_supplies),
+	.consumer_supplies =3D int3472_vsio_consumer_supplies, };
+
+static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init_d=
ata =3D {
+	.constraints =3D {
+		.min_uV =3D 2815200,
+		.max_uV =3D 2815200,
+		.apply_uV =3D 1,
+		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies =3D ARRAY_SIZE(int3472_aux1_consumer_supplies),
+	.consumer_supplies =3D int3472_aux1_consumer_supplies, };
+
+static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init_d=
ata =3D {
+	.constraints =3D {
+		.min_uV =3D 1800600,
+		.max_uV =3D 1800600,
+		.apply_uV =3D 1,
+		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies =3D ARRAY_SIZE(int3472_aux2_consumer_supplies),
+	.consumer_supplies =3D int3472_aux2_consumer_supplies, };
+
 static const struct tps68470_regulator_platform_data dell_7212_tps68470_pd=
ata =3D {
 	.reg_init_data =3D {
 		[TPS68470_CORE] =3D &dell_7212_tps68470_core_reg_init_data,
@@ -232,6 +336,18 @@ static const struct tps68470_regulator_platform_data d=
ell_7212_tps68470_pdata =3D
 	},
 };
=20
+static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pd=
ata =3D {
+	.reg_init_data =3D {
+		[TPS68470_CORE] =3D &intel_nvl_tps68470_core_reg_init_data,
+		[TPS68470_ANA]  =3D &intel_nvl_tps68470_ana_reg_init_data,
+		[TPS68470_VCM]  =3D &intel_nvl_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO] =3D &intel_nvl_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] =3D &intel_nvl_tps68470_vsio_reg_init_data,
+		[TPS68470_AUX1] =3D &intel_nvl_tps68470_aux1_reg_init_data,
+		[TPS68470_AUX2] =3D &intel_nvl_tps68470_aux2_reg_init_data,
+	},
+};
+
 static struct gpiod_lookup_table surface_go_int347a_gpios =3D {
 	.dev_id =3D "i2c-INT347A:00",
 	.table =3D {
@@ -258,6 +374,23 @@ static struct gpiod_lookup_table dell_7212_int3479_gpi=
os =3D {
 	}
 };
=20
+static struct gpiod_lookup_table intel_nvl_int347a_gpios =3D {
+	.dev_id =3D "i2c-OVTI13B1:01",
+	.table =3D {
+		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 8, "s_idle", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
+static struct gpiod_lookup_table intel_nvl_int347e_gpios =3D {
+	.dev_id =3D "i2c-OVTI13B1:01",
+	.table =3D {
+	GPIO_LOOKUP("tps68470-gpio", 7, "s_enable", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_=
data =3D {
 	.dev_name =3D "i2c-INT3472:05",
 	.tps68470_regulator_pdata =3D &surface_go_tps68470_pdata, @@ -287,6 +420,=
16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_bo=
ard_data =3D
 	},
 };
=20
+static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_d=
ata =3D {
+	.dev_name =3D "i2c-INT3472:04",
+	.tps68470_regulator_pdata =3D &intel_nvl_tps68470_pdata,
+	.n_gpiod_lookups =3D 2,
+	.tps68470_gpio_lookup_tables =3D {
+		&intel_nvl_int347a_gpios,
+		&intel_nvl_int347e_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] =3D =
{
 	{
 		.matches =3D {
@@ -316,6 +459,13 @@ static const struct dmi_system_id int3472_tps68470_boa=
rd_data_table[] =3D {
 		},
 		.driver_data =3D (void *)&dell_7212_tps68470_board_data,
 	},
+	{
+		.matches =3D {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
+		},
+	       .driver_data =3D (void *)&intel_nvl_tps68470_board_data,
+	},
 	{ }
 };
=20
--
2.43.0


