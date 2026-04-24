Return-Path: <linux-media+bounces-59511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGPZNHI362nRJwAAu9opvQ
	(envelope-from <linux-media+bounces-59511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:27:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBD245C29F
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 603CD3007977
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C52D17D6;
	Fri, 24 Apr 2026 09:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="bktPUrzT"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021102.outbound.protection.outlook.com [40.107.57.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB9937F8A1;
	Fri, 24 Apr 2026 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022822; cv=fail; b=rQyyyOR3c/tuHA7vRnNUco/P/4rrEDvuUFwDcYKMZMlpNJ4kFNhlEXUZTUAfX2q9HxrNwOBMmV3I50TwCpmroapi+knfKMIyEdDXAVUeBpKUB2loh0wzDkwjaDN7eR2e37UF1NUdepJDEOyN6hpwb9FBrpoTr4H9enGrYr+uMLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022822; c=relaxed/simple;
	bh=vH7uLCJuHQGCr5fpyfxt4GnB3K4jFMcK0xKl2cGKpxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qNiUH9KUk3ibwLa+UnWljYUzILV3f1DeJIGEJbYProHJx4e5CqLuI2hI3qfRe+fFlD7Xhqe0ltqceaBFJ4P4q+7ydeyjccQFDBu5BJEPEamrGpuQK9/7vj8I8owCBzCvSdYN+jLl1lGsN0b3GnAz6TOp2/w9AbTR4dnstTptcXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=bktPUrzT; arc=fail smtp.client-ip=40.107.57.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qfegl43Ncch7wqsd/7yjCWn8Vf0nnuRi6B3LLo1bY1YYUg+GC4AdrgCIhqsgCPyUYkn6GKcJSnQJaJ5RoNp1bTe2kylzalU+v45GwErIettCdaLdewdkdaTmDipJSA/lGhTdT1M3fSQWXkUq6k+qTX1nf9AOQqIPhbxZic2PHyN5hKTY7KvJzNEaS1taflPUw9cu939l0cNAh0fbpBiEAYe84sXTDVWI1xbhvbLDrBxkNIq9EeZB+ZbuPsLvLbC7ynW83ktGQRdtg+Ka9Yem9NqCY/R6OOmlEL3bnsJU+7dBHelZOKW8dOY1sna5ML8vxZJPwMRCLd6BNdX6ZBLk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1Qu/wUrVKW3FAqXWxiWByaI3VROVzUpSxXXeVqkmVg=;
 b=KVkrDpaF9mM8GBBu8icr+kETRGWYzq3K5aNZnX9MHtZacVO1vDxGBcXiPwToMcPuLCw9wantl7iNGfSPP2zjWzv7GkBb+7oj1OX4Hw3QuiAq0b1n7ewn3FqVDlT3MlZYrSDfIIBITfErrC7/2Xc2baHSqVydAzN1QrEUQ17g/Z9HWnjD7izTCXY8nn1RuVlEj/ATY/z1Gao5VOBMdFvnQvsvyD2JHVSFcXHAxdcbExXFEpkDXIaXuJGR2ihaKDt7j0euVAHGDgL/4sE5DbpmJnhGXJSgUFxMRDdfPqhYjDSCzo2cNedVzZXMqQOWfwt+o631l4BhO2JKmZbb6U6tQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1Qu/wUrVKW3FAqXWxiWByaI3VROVzUpSxXXeVqkmVg=;
 b=bktPUrzTYSlW41gUU4zC8Bqsgy+pON9LLv7q8r3xjB2Zto7bNPcaFqfoh0kH3WcfzncI3DevyJEFsDi2x30AkQsmYH3Ozt0VD8q2WWniAdqLeBJFwvn363+IPGrlLnkfNoWxugcYMUJVs1+HLyXduqaBiBQDaDS/EyeEraZkbdFfZ5YY/voWWppJ+TRaFXgySz/VVyhgPgx8KlOqDXQpWlmI0GSw0JCEOkY8jRiSqmN9V8z97KU6XmmiAZ0quIT1pzYLcFigvf35+1Taem0yMAulY5vPQGpdC/axgejBO5R/VJMNrLstY2nKJqKW2NPPfvJACHHIR7SytCNdV/vSZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MA5P287MB5221.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 09:26:58 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%3]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 09:26:58 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with set_selection
Date: Fri, 24 Apr 2026 14:55:47 +0530
Message-Id: <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::24) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|MA5P287MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6cdb5b-7d6a-4e71-ac5f-08dea1e3a1e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|22082099003|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	uybzRO6x5disxonNzFEaeREaebHAtVN2lA4TC7HwqoMVdVAx9L+Zhzk220lm4ORVoFsFwR5Gm219bs5XGT7BrY0vQnV2kNnJphX1aWKjXHmlkRl7IkWSvqJVsRUJZdFA49B+NsCWhB2oWs7Jb53XEjd8fkTUNHPQHYfn1diwJIoGapFQ/2hGqqdo/ZlTD0AbEb7zEYX7Ebazg4PJ+OrEw773WA675eC9Wi8Tj1KVqcEVv0gcw2E59oJSYw5TSVeTet1xZyMM54/S/AHpmPqVqOWHuYf1T4MmF77yCYZAo0kTgkrjSd/qD2O/Jp0e8a3qXfKoVJvd7DsxmayIkGmB+9iRi7of7yXCOTBbP9bdlIiptg02AbYmPFTReeeoeAmSCOyLBOFAHRFQn5PfJaxYo0n7E3cOV1pnPGo7BjQcpiOGNcmGpvMqX/X5Mo/o5yyMPPQFtWo0FXWJSqYuHWD6/ZeytkCW+nirQX4Gnmy1f3vIBRe/Ve8wfN4jKinQQvsSRQB/YWCD3tTTT6WMLG/QzEnKw2EFqKcKAWNFkm7RkCNHMOjsjK+CJt+awryTFkHy+tDCRhfbvAjWnK39IyQcSjgO+QfMJAzxZh2mX9fPLqaRl70/FMYTm4dDfmSHmBsrPXkH/GqJG3Q4iBdz1o6LcyOb9TV8w/27EFEvoyhpXKVHkJTKis5Wsrg2WMQhfp5Z7lE7f4UIWcgoLgVLvit5uNJEMhrm2YGaym3d3uOJgMoadZLf1GdfqXoi/4srVqSgtVnJ+dWsG3sGOJFamgP7im3WcjpcdTApxkihdkN0ulc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ym/dIhTBgGtUXgoyKwr3CHsw6sGE++cYgh1R5FFvSFlsG+MBn1EEtII95gmn?=
 =?us-ascii?Q?r4UQlsmR0MdlVEFMQIGgjFCh6+TYgmhERpla9PojsQWNnq+RcHn2oyK0sREI?=
 =?us-ascii?Q?W54jmj2v/LXv8vK5En5t+7xrw5NZngCTaSUgslPcb4pnSk/5G4VxnnOcitrB?=
 =?us-ascii?Q?70BTHAU45ueAF+7uT4kugjPGaTq+N4tHtN/Sm/ku4fbGtcDdhLA32b607k1S?=
 =?us-ascii?Q?m6LGRan9MxXRrSqvTFL1NUh61DMovn8crch5rdgEU0JUf9jNXyaHFfd0WJwN?=
 =?us-ascii?Q?ZRCDB5sJH4UUnkL5TWOf4UnUU5bj0rWBTB58CSnlQuXS78GpYNmDGdYMAAFW?=
 =?us-ascii?Q?3dMlG6dxgC6R51wCl7Ns0waAiwwbBJZjvkfl7ePbau8upLNLPqqPvONd9PiE?=
 =?us-ascii?Q?z/2Jg33sUSUv38cpBeiP3q+VRqHcYHLi7OWXb5+YL9d8Z4gEfxZiodUMTIM/?=
 =?us-ascii?Q?SpFNu9nQADhN1mH4rpK6uAVu7iaaoR2CHTVFjZGpyBd+omgX+YBz8PpAZSsY?=
 =?us-ascii?Q?uJgo+y4u98UDwNIJS6FGWIHHM4Vhe3QMQy0cxrJ4Ymb4xCGbkmk0wanzp9l7?=
 =?us-ascii?Q?lj12zvCvE7LKDz8Pf1k4dq4NIfcJBlQnfhBoF9CR6r2SqoWniYUTrIJRnEWE?=
 =?us-ascii?Q?UISXt2T0NExawRa/stXrMXY+D1b6KNWMYj9lQN3h06tan99Vldbq3S9MKkIj?=
 =?us-ascii?Q?NGbXQkSPsdEZSm4dxoL67ofM1Bp+ZL15FVUrPEPJvvxhsHFvkIRv3XrYPLZI?=
 =?us-ascii?Q?w6dFFVHMIW57osyp0KPblkmzX1iRr3oV09dU3Xdl4M0AR/cr8pjaCs57GofH?=
 =?us-ascii?Q?o9oa719lH4seHuSB7dFr7GPiWQR6Y62WjzgzU+SEUN7XhVF0NX4uLgFBxOa6?=
 =?us-ascii?Q?n5Ww6SlfPGIewErbUqhmHYMs/IR8fonHgIKxWJJYmGipezpJ0x5rvG4i1q4R?=
 =?us-ascii?Q?WHlnJ8yQ4ttFkoUPcSPpQIpnY6RUtWenF+87wVw4unwfwhG+bFEpgYo2ck8j?=
 =?us-ascii?Q?w4UiJcye1ji1a4ZKt8U6xIzgAP0Gw7uneS2TCYtjsCbRWhNHjzFPYb0d40ha?=
 =?us-ascii?Q?z7vaYQYUET5KZaVLxm+qk+LnLEf0r+72En63imUuPU2I32VrPMRLxOlUjPti?=
 =?us-ascii?Q?68Rhw+AVzHidUomYUm5VHrg+mdo/k59NqYHMe6pADhA6JdD/hsFvpqE1TRh7?=
 =?us-ascii?Q?2ykKtqjjF5bmr6S+AKkSGMZ677sD8tMyf+rCATimfuOYmCrZ5dE6yJfT06Wh?=
 =?us-ascii?Q?vF0zg10zOxThxOMFXYhhzZznroJNv+Q1OiIOgD9O7pQHMJmyXiMXzg1sVKWk?=
 =?us-ascii?Q?MUayOJHNQLKtd7jx6OJ7xKKa9uS4+zv2Q2Qh8HT0nAuO9CdxO7uk2m6A6OiX?=
 =?us-ascii?Q?DqDuS3fETechXVEATt6QVmjLpwc9kjN+v+DI5gFQdTVFC0aU5AAZjugnc7Nw?=
 =?us-ascii?Q?DsbXu6tjEr8GlYWMlyv1uppg83FOuW8lf03ypMEyt+It5t66meVibNw2Hhf6?=
 =?us-ascii?Q?QVjw0wdyFAI2xLxbbO87Ayp3ImDX2+Gxn/zehorluG4YMzw+7/6x43cYTCcd?=
 =?us-ascii?Q?s/er9TJc1PpJXlVLZ2UMznu91HnJu0NoERF0e/2gRlfdwRjHZv3xIdZvBHXe?=
 =?us-ascii?Q?dQ0rPkRFcPsKUH5ymSUuEwyGj+LHEEnPX7/Xr9SYHNgxIKRoBrotnsUsW4kQ?=
 =?us-ascii?Q?TyhkUOfRmp/WDutmhqgBhuLXRyULrMTJDmcGOHj25rVALztP0dTDCXQLuRxJ?=
 =?us-ascii?Q?dcyjonS1ApPtIacYhrBieabZQTOFqSjky3xxGP3eNaASCCsRGf1l?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6cdb5b-7d6a-4e71-ac5f-08dea1e3a1e6
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 09:26:57.9894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+lYBaadYLEEeu1WH4Wh/VcdVZ0LlijPORj1oeZzWHClSKqAk4OXuNU6bzxYf8k8TAV77Gt3xRitOvhKZa5bLGRdT08laQx/CNMBP6fQrZOeMsqjG4z8yG7T4k6zY3BD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5221
X-Rspamd-Queue-Id: 3DBD245C29F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59511-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,siliconsignals.io:email,siliconsignals.io:dkim,siliconsignals.io:mid,os02g10_active_area.top:url]

From: Tarang Raval <tarang.raval@siliconsignals.io>

Add crop support to os02g10 by implementing .set_selection() and
storing the crop rectangle in subdev state.

Initialize the default crop to the active area, make set_fmt() use the
current crop, and update the output format when the crop size changes.
Also program the sensor window from the active crop/format state instead
of using the fixed supported_modes entry.

This allows userspace to configure the sensor crop window explicitly.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
---
 drivers/media/i2c/os02g10.c | 166 ++++++++++++++++++++++--------------
 1 file changed, 103 insertions(+), 63 deletions(-)

diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
index fad2dd0ad7aa..9bf8f5d1caea 100644
--- a/drivers/media/i2c/os02g10.c
+++ b/drivers/media/i2c/os02g10.c
@@ -112,6 +112,11 @@
 #define OS02G10_ORIENTATION_BAYER_FIX		0x32
 
 #define OS02G10_LINK_FREQ_720MHZ		(720 * HZ_PER_MHZ)
+#define OS02G10_WINDOW_WIDTH_MIN		2
+#define OS02G10_WINDOW_HEIGHT_MIN		2
+#define OS02G10_VBLANK_DEF			166
+#define OS02G10_VBLANK_MIN			25
+#define OS02G10_EXPOSURE_DEF			1100
 
 /* OS02G10 native and active pixel array size */
 static const struct v4l2_rect os02g10_native_area = {
@@ -152,15 +157,6 @@ struct os02g10 {
 	struct v4l2_ctrl *hflip;
 };
 
-struct os02g10_mode {
-	u32 width;
-	u32 height;
-	u32 vts_def;
-	u32 exp_def;
-	u32 x_start;
-	u32 y_start;
-};
-
 static const struct cci_reg_sequence os02g10_common_regs[] = {
 	{ OS02G10_REG_PLL_DIV_CTRL,		0x0a},
 	{ OS02G10_REG_PLL_DCTL_BIAS_CTRL,	0x04},
@@ -245,17 +241,6 @@ static const struct cci_reg_sequence os02g10_common_regs[] = {
 	{ OS02G10_REG_MIPI_TX_SPEED_CTRL,	0x05},
 };
 
-static const struct os02g10_mode supported_modes[] = {
-	{
-		.width = 1920,
-		.height = 1080,
-		.vts_def = 1246,
-		.exp_def = 1100,
-		.x_start = 2,
-		.y_start = 6,
-	},
-};
-
 static const s64 link_freq_menu_items[] = {
 	OS02G10_LINK_FREQ_720MHZ,
 };
@@ -295,11 +280,12 @@ static int os02g10_set_ctrl(struct v4l2_ctrl *ctrl)
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		/* Honour the VBLANK limits when setting exposure */
 		s64 max = fmt->height + ctrl->val - OS02G10_EXPOSURE_MARGIN;
+		s64 def = (max < OS02G10_EXPOSURE_DEF) ? max
+			  : OS02G10_EXPOSURE_DEF;
 
 		ret = __v4l2_ctrl_modify_range(os02g10->exposure,
 					       os02g10->exposure->minimum, max,
-					       os02g10->exposure->step,
-					       os02g10->exposure->default_value);
+					       os02g10->exposure->step, def);
 		if (ret)
 			return ret;
 	}
@@ -362,10 +348,9 @@ static const struct v4l2_ctrl_ops os02g10_ctrl_ops = {
 
 static int os02g10_init_controls(struct os02g10 *os02g10)
 {
-	const struct os02g10_mode *mode = &supported_modes[0];
 	struct v4l2_fwnode_device_properties props;
-	u64 vblank_def, exp_max, pixel_rate;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
+	u64 exp_max, pixel_rate;
 	int ret;
 
 	ctrl_hdlr = &os02g10->handler;
@@ -384,18 +369,19 @@ static int os02g10_init_controls(struct os02g10 *os02g10)
 	if (os02g10->link_freq)
 		os02g10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	vblank_def = mode->vts_def - mode->height;
 	os02g10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
-					    V4L2_CID_VBLANK, vblank_def,
-					    OS02G10_FRAME_LENGTH_MAX - mode->height,
-					    1, vblank_def);
+					    V4L2_CID_VBLANK, OS02G10_VBLANK_MIN,
+					    OS02G10_FRAME_LENGTH_MAX -
+					    os02g10_active_area.height,
+					    1, OS02G10_VBLANK_DEF);
 
-	exp_max = mode->vts_def - OS02G10_EXPOSURE_MARGIN;
+	exp_max = OS02G10_VBLANK_DEF + os02g10_active_area.height
+		  - OS02G10_EXPOSURE_MARGIN;
 	os02g10->exposure =
 		v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
 				  V4L2_CID_EXPOSURE,
 				  OS02G10_EXPOSURE_MIN, exp_max,
-				  OS02G10_EXPOSURE_STEP, mode->exp_def);
+				  OS02G10_EXPOSURE_STEP, OS02G10_EXPOSURE_DEF);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
 			  V4L2_CID_ANALOGUE_GAIN, OS02G10_ANALOG_GAIN_MIN,
@@ -445,20 +431,18 @@ static int os02g10_set_framefmt(struct os02g10 *os02g10,
 				struct v4l2_subdev_state *state)
 {
 	const struct v4l2_mbus_framefmt *format;
-	const struct os02g10_mode *mode;
+	const struct v4l2_rect *crop;
 	int ret = 0;
 
+	crop = v4l2_subdev_state_get_crop(state, 0);
 	format = v4l2_subdev_state_get_format(state, 0);
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes), width,
-				      height, format->width, format->height);
 
-	cci_write(os02g10->cci, OS02G10_REG_V_START, mode->y_start, &ret);
-	cci_write(os02g10->cci, OS02G10_REG_V_SIZE, mode->height, &ret);
-	cci_write(os02g10->cci, OS02G10_REG_V_SIZE_MIPI, mode->height, &ret);
-	cci_write(os02g10->cci, OS02G10_REG_H_START, mode->x_start, &ret);
-	cci_write(os02g10->cci, OS02G10_REG_H_SIZE, mode->width, &ret);
-	cci_write(os02g10->cci, OS02G10_REG_H_SIZE_MIPI, mode->width, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_V_START, crop->top, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_V_SIZE, crop->height, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_V_SIZE_MIPI, format->height, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_H_START, crop->left, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_H_SIZE, crop->width, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_H_SIZE_MIPI, format->width, &ret);
 
 	return ret;
 }
@@ -528,16 +512,67 @@ static int os02g10_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int os02g10_set_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+	struct v4l2_rect rect;
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	rect.left = clamp_t(unsigned int, ALIGN(sel->r.left, 2),
+			    os02g10_active_area.left,
+			    os02g10_active_area.left +
+			    os02g10_active_area.width -
+			    OS02G10_WINDOW_WIDTH_MIN);
+	rect.top = clamp_t(unsigned int, ALIGN(sel->r.top, 2),
+			   os02g10_active_area.top,
+			   os02g10_active_area.top +
+			   os02g10_active_area.height -
+			   OS02G10_WINDOW_HEIGHT_MIN);
+	rect.width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
+			     OS02G10_WINDOW_WIDTH_MIN,
+			     os02g10_active_area.width);
+	rect.height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
+			      OS02G10_WINDOW_HEIGHT_MIN,
+			      os02g10_active_area.height);
+
+	rect.width = min_t(unsigned int, rect.width,
+			   os02g10_active_area.left +
+			   os02g10_active_area.width - rect.left);
+	rect.height = min_t(unsigned int, rect.height,
+			    os02g10_active_area.top +
+			    os02g10_active_area.height - rect.top);
+
+	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad);
+
+	if (rect.width != crop->width || rect.height != crop->height) {
+		format = v4l2_subdev_state_get_format(sd_state, sel->pad);
+		format->width = rect.width;
+		format->height = rect.height;
+	}
+
+	*crop = rect;
+	sel->r = rect;
+
+	return 0;
+}
+
 static int os02g10_get_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
+		return 0;
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_NATIVE_SIZE:
 		sel->r = os02g10_native_area;
 		return 0;
-	case V4L2_SEL_TGT_CROP:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 		sel->r = os02g10_active_area;
 		return 0;
@@ -566,16 +601,16 @@ static int os02g10_enum_frame_size(struct v4l2_subdev *sd,
 {
 	struct os02g10 *os02g10 = to_os02g10(sd);
 
-	if (fse->index >= ARRAY_SIZE(supported_modes))
+	if (fse->index)
 		return -EINVAL;
 
 	if (fse->code != os02g10_get_format_code(os02g10))
 		return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = fse->min_height;
+	fse->min_width = OS02G10_WINDOW_WIDTH_MIN;
+	fse->max_width = os02g10_active_area.width;
+	fse->min_height = OS02G10_WINDOW_HEIGHT_MIN;
+	fse->max_height = os02g10_active_area.height;
 
 	return 0;
 }
@@ -586,18 +621,14 @@ static int os02g10_set_pad_format(struct v4l2_subdev *sd,
 {
 	struct os02g10 *os02g10 = to_os02g10(sd);
 	struct v4l2_mbus_framefmt *format;
-	const struct os02g10_mode *mode;
+	struct v4l2_rect *crop;
 
+	crop = v4l2_subdev_state_get_crop(sd_state, 0);
 	format = v4l2_subdev_state_get_format(sd_state, 0);
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes),
-				      width, height,
-				      fmt->format.width, fmt->format.height);
-
 	fmt->format.code = os02g10_get_format_code(os02g10);
-	fmt->format.width = mode->width;
-	fmt->format.height = mode->height;
+	fmt->format.width = crop->width;
+	fmt->format.height = crop->height;
 	fmt->format.field = V4L2_FIELD_NONE;
 	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
 	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
@@ -606,11 +637,19 @@ static int os02g10_set_pad_format(struct v4l2_subdev *sd,
 	*format = fmt->format;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		u32 vblank_def = mode->vts_def - mode->height;
+		int ret, vblank;
 
-		int ret = __v4l2_ctrl_modify_range(os02g10->vblank, vblank_def,
-						   OS02G10_FRAME_LENGTH_MAX -
-						   mode->height, 1, vblank_def);
+		ret = __v4l2_ctrl_modify_range(os02g10->vblank, OS02G10_VBLANK_MIN,
+					       OS02G10_FRAME_LENGTH_MAX -
+					       fmt->format.height, 1,
+					       OS02G10_VBLANK_DEF);
+		if (ret)
+			return ret;
+
+		/* Set VBLANK to maintain 30 fps for the selected format. */
+		vblank = os02g10_active_area.height - fmt->format.height
+			 + OS02G10_VBLANK_DEF;
+		ret = __v4l2_ctrl_s_ctrl(os02g10->vblank, vblank);
 		if (ret)
 			return ret;
 	}
@@ -626,14 +665,14 @@ static int os02g10_init_state(struct v4l2_subdev *sd,
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.format = {
 			.code = os02g10_get_format_code(os02g10),
-			.width = supported_modes[0].width,
-			.height = supported_modes[0].height,
+			.width = os02g10_active_area.width,
+			.height = os02g10_active_area.height,
 		},
 	};
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+	*crop = os02g10_active_area;
 
-	os02g10_set_pad_format(sd, state, &fmt);
-
-	return 0;
+	return os02g10_set_pad_format(sd, state, &fmt);
 }
 
 static const struct v4l2_subdev_video_ops os02g10_video_ops = {
@@ -645,6 +684,7 @@ static const struct v4l2_subdev_pad_ops os02g10_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = os02g10_set_pad_format,
 	.get_selection = os02g10_get_selection,
+	.set_selection = os02g10_set_selection,
 	.enum_frame_size = os02g10_enum_frame_size,
 	.enable_streams = os02g10_enable_streams,
 	.disable_streams = os02g10_disable_streams,
-- 
2.34.1


