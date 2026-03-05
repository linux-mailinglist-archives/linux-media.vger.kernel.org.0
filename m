Return-Path: <linux-media+bounces-54561-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKm1Gg0IqWlW0QAAu9opvQ
	(envelope-from <linux-media+bounces-54561-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 05:35:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B77DC20AD70
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 05:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E37AD305511B
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 04:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D3025785D;
	Thu,  5 Mar 2026 04:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="fbxTzwkW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1160286A4;
	Thu,  5 Mar 2026 04:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772685314; cv=fail; b=Pi09vmAbnXmk14IP3BaesvMLYWQsEdeXE3AeKTSHmDnB0H5v/t9pU0WSGTRka5UrEorXlboOzygwkBet5j10XEGyGkb+wgQHYyRF7XnPiMGF70W7oYwh41/4QY1AM+ZGb+ZMwCuqJGbGKfoRSma/czobM7XrgDck0tNDroCsVg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772685314; c=relaxed/simple;
	bh=E/gpd8buGKooo4XrQ3iesURJLI5sK+nMOE4PSpCfUzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dyJZjy5nsgztV3rfAyouEyulVQXfx1rv7PwaxbBuf6MDOCUVPU+LGcwNTWPJvpIimjC/Tvbe7+5qOmt+hlIfw7FzE6TX9Ttc4q5ZfrKP0Zek1biap2dlgUvy31uywe58OaP62BO0bM1VKwEHWrHaQBY3MuiPwaYTh0/bSTnHra4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=fbxTzwkW; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6252U1Qq2001864;
	Thu, 5 Mar 2026 04:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=5GhiMyD/9HmU5VY7553WLZn7bkMmIjfSD5wqs9xXKM8=; b=
	fbxTzwkW0rs2JW5vyKYsSe1vtcroRtcSXrq47E86KtI8SceJdFMBojgBMGOEF2/M
	zCXXuu6rjVRz8cszH2ZkkFz9lkz9RkEpS8xBUK7OVLU0k0mvq3V/gRzCQagJwJu3
	oMabTRsK+kqLZKw3+BZfdFS3paYtSg7+/gCJwudEMPwo7kKYIiEVIwegniOEyDdN
	myHYmxKPIKRoEo3GGskQvSi61hHJJu2RMUPmQeergu4baJ73cDEkIsXtgPXNt5Ff
	zYcqhmNSewiqaK4s/kCXXooWrjo92m/as8FJm3sYsNryGxoJiaMwYZhu9xhUIpKh
	rzsGtt/V3jACtulTYG7Y5Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010056.outbound.protection.outlook.com [40.93.198.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4nxsh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 04:34:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RriKIaRuIZTThkQx543dGbwWV0mAeQYrEIw0W0BgycLsBmpOT3NyGX8lV133pAhPp071Xh3fvzIMUQvBuZA4C8OWfIQlBq9nIUD7VygBgDlgvBgz+c2PZU4Q3VHMEXV08mxRShfAbH1+Ctq6Km1u7LUTqQAW2v/fqHoZeveque66/roTg37RqRZ6IccZs5psml+SVSxu6A85HPTQYNkIbc4IlUhDFQyY21bMRhYQLzYCxmj/ANkFuXGAYn9DHTJ50reB7JNwj5MB/oxjmmxI2La5Z62ZZEAiq45XTsF8e2nD9CCZrkHurv+jspnfIKZu1ChJvB9CcsTgLZABQ2k+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GhiMyD/9HmU5VY7553WLZn7bkMmIjfSD5wqs9xXKM8=;
 b=dGV7cJ8XnZO1lgN/vz4XLuw7ukPVth9LJhhOxutV1WrNQOS3BAng/6/QxPfgWY1GeXMd0aBYJjojV5VnlnxPdWDa8WQF2mRybfPVYYwT+VMe1XuLlitiwMF1Wlvt28BORarziHjqRLTMLi7+hH5i9AmTYxDySUPxDUyggK3nV0qUo9cbfHAT3sz54AXfhE53Dj9L7zYiy7F6aIcKiUYtAmCMcZ/jdrgmBuomdvQcO6y8/0wMAHUoI+p4NKnRzEfaoHOjNoX/cVrgTlzwVMN7MJeW43w3iy7ciLTPhuN7XN9ZQf2nAjCsInl00h7UkglEliOfQNlUXI0bdvnkFUQ1Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by SJ2PR11MB8347.namprd11.prod.outlook.com
 (2603:10b6:a03:544::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 04:34:27 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 04:34:27 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, dave.stevenson@raspberrypi.com,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] media: i2c: ov9282: switch to {enable,disable}_streams
Date: Thu,  5 Mar 2026 12:33:50 +0800
Message-ID: <20260305043350.2151936-4-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305043350.2151936-1-xiaolei.wang@windriver.com>
References: <20260305043350.2151936-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|SJ2PR11MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 028e721a-889d-4647-246f-08de7a707c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	FBAjoES3UfT++zdhEdYz9Fhyn63apLY4N4K9PGtTMjOoZlIweOCn4oC9WKFfeX0a0lJDGHiW8Vs+uuryvXz1odmK3VjfGXZjHjUA9fz6t+65QxqRYZ+Cmu+ARypgvGZy+SGFUD8Pw5gx01le44Wk8GjPUtaiNyRX68EdAsOYFxUasEmPh8JiYsJVKx3+UVhSreLtvHXWhRSO+51Qokb/uBTB0vJO/OAHiEHO+QR39ZTlUf1Hhp2cKHjiA12wUc5Zr3oLz/6M3kMQBj3UYaTdm+T7gPLDBp6HNf2Lkw49iexSKaBg2vFvldn3QNx/U2lJPGqrE+lTOL07P1COFXWK+ARATN174MhGsy5/t0U/C1bq1RxjWcDke49hQQYc6TBK5HRM5m+9WBvWPaUh8PgPvX2/z+ec42ge6mPlUEh2VcozdjPF8VzFV5j6V6so6hi3kOFncY/g2aEanXmszCi1etQriHwfKdMJRmHD5wVUw9gjKAHgr6KdEZh5jFQKYgZKJrObxSukjv7ExVAeOdlMdEWicJz5voo3XSrOiMr1Hf1brvKLKCDy+56JOc0dfvw+8OydLTnphyZbj8CHsOTJ5N+12t5e3RQtwe4PXDvxshCezQNdwFNxCUBO16NG43nL8BjTwNVOVr0A/8459PJmutuiwIIVAkZelaLhLXSH/iqpkLMG5NnaQqM3Fzx+dcqHvwEghZuoyZkhdPUIGNUNQ7kPWNZCZ8VRUl+zpjHoVfSD8s1+BMCCAmyCOdNdMv6zn5PUGWeV7shSjDb7LCFudZKtoEh21DdIwKzKWtf4WxklQsJfSkcTUF18N8bWa0MX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QobkDWp0VGMamOacFblxvyUTBLtdPCuJCW1pfSfPLtijgEWV9PmJH1JAPR/G?=
 =?us-ascii?Q?cHh3/hr0cOqth4VKUiHiJVoKp+oOTKpPx+PXqN2RvLxkmJ8cLwATpiTuw1dc?=
 =?us-ascii?Q?l7FVQ1PGdbqB/k634E4/YB5s6MBRg3ry8/lQ4Xd67WVDusAw3xvahwhhys1r?=
 =?us-ascii?Q?CNlmEda+h6U3A2XtCRlXHWNBlAQUzaMGTHzrP1MEXPqA9Uei0y+dWfHy1d0B?=
 =?us-ascii?Q?Db6h3fm/8Do06sFxj+iplM9sFpKhunTMCZQIr5b64QJguny1KMAd2UujkFE2?=
 =?us-ascii?Q?N6EbqLGZZnfxQq7Zdtl5Xv1ibn7NmMHJK3Ffwdz40fREy4O8eKBvT0AZKvHf?=
 =?us-ascii?Q?v8irsHp8wnw7jpT+fVzZeieM7kL8Uy8sJu/GMR1PNIFHhawk5fgxZ12P7NQX?=
 =?us-ascii?Q?wrcJtz+yydSd6TfMH6IGv1OaCm/+exHMvjlq8ehbujDdkfHDnLtzBDGhkQqw?=
 =?us-ascii?Q?PP6aul2MEm7v4O8stlQOr2JkoGN4I8E1A24ZT9fk4ZhuzOWbpE1d0pLPUAYg?=
 =?us-ascii?Q?/PtBk48LRZzkKgfGe/v1/S8AF5kBSdDIwcRBGi4RBxvW9UPk8R0Bc2lQkHQZ?=
 =?us-ascii?Q?T4Fset1g02fE27a1m/D9ilnLwDz+LIFiGRzUffJGss5vEs36Mlns5Kg4x7TS?=
 =?us-ascii?Q?Hy+SGv/spz7pMX9sZIEr/UXIT3W1rNvFB+xHUow7RpBe8dCTKGzA/RTfNL59?=
 =?us-ascii?Q?mn0L717pQfCh8OHlKkxu0dy+vycn/KgYGqObi+/+1mhYfNYhkYqJa6G6XYMO?=
 =?us-ascii?Q?iZ1cvJOUCvtW1G+q197mYer9Vn57cbfhGOzWbEr+V62OusGwd4sOABn6Jd8w?=
 =?us-ascii?Q?/OyMnm/rmy8GLf0K78So5JJBr2wY8qAW+X7PmEMgxlGxJMvIK5AjNA6Gfjy/?=
 =?us-ascii?Q?5g2/u0dHHB9MQPXDtcvJX/ksrFtitl431OdBcT6y7XQcl8Wd1IXVphQwj1EC?=
 =?us-ascii?Q?Aqm732D3y53vgcMW3RWyevMU+8XbhKc2Z/Sa8KbRm+uDVlKUGf3tG1RkDE4V?=
 =?us-ascii?Q?yEbeoaqKQA3V79U31IIbIYGsmUjXepClwupzK9nnlfc66BvjM1TDsf3iCygc?=
 =?us-ascii?Q?hCINb4B8/kVbOhGSehIAPRJ3i7ZJy8eapLieKxHrOchEzlZAeS1qTGaTkmP0?=
 =?us-ascii?Q?q/9LQf33gjY07PpE74Kjxcm2tirhCP80tAdTLQDJ3g6GdY+25qoCS3vtV/TP?=
 =?us-ascii?Q?X4iF5FN49nushDcfycJNzIcvOs3mY65AEi8Jhwns5G0q0jOAJhErlBB0imBy?=
 =?us-ascii?Q?SNvgSzp3iNdni63YTF1DQehTsJUgksPSj61+W0kRXaDJf9JWnpcoSA+N2AWZ?=
 =?us-ascii?Q?CAvFTLeLIXwH8ldjzhtYNfoCYV5utVKGJRCaHPhzIe3dgysC0jYhBYJtxhZL?=
 =?us-ascii?Q?wdi/TPHmJjpOxFeGcMJygQ7X2dxRCYCfY8z6L7FpZANONKxFEG/0/kur6KAA?=
 =?us-ascii?Q?SGyOc3P1LqKFzohf3Ubd/1HJKZSMWMSs9jMjYCwH579rpFmjrWELAEQvE+eT?=
 =?us-ascii?Q?8DVhrN94CUXsQPxi45L9u8+q3ubKKGmt2ZINCQCkjjqsxrEHv3XL5BcyPMes?=
 =?us-ascii?Q?qzM5iNiIV9zLgQoHTyKFuTaoDXf/SV1lvk1fUXCFKGkmnZS2SYm3G9y6C52/?=
 =?us-ascii?Q?N082fwVzz9IIiLtrNPpfw0p0PNOjAg3m9DnwnrfsFY0IGBv8X6/1PoDimQBH?=
 =?us-ascii?Q?/CDzeMB73bLbbRBc0c04QX7YEgT1It1wiQPJgyHlGzK5d37KqL3/Gyc9b645?=
 =?us-ascii?Q?a93eFy/Z3NFMc45yZX6iCN0gPKrBzHY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 028e721a-889d-4647-246f-08de7a707c07
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 04:34:27.3812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GG0TT+TElR4qcDfz5nE1ieBLqTf1QMmS69JPUUjA/VrBSEV9sZIm17KbND88zMm9IPXGYOeDxBXEVa6YfD0fnjMLC8KA6rSGgR88b7t/PW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8347
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a907d5 cx=c_pps
 a=8eopZEidgIdRxOfdJNpAuQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=-DGD1vg1X50fszjQOB8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yf20hhmjoy9HOcCJG2KoWqw9AKHxLEMJ
X-Proofpoint-ORIG-GUID: yf20hhmjoy9HOcCJG2KoWqw9AKHxLEMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMiBTYWx0ZWRfXxssUSqt+P83t
 5uWj0OdpcGAiJONEZVEH7RjxLGNo3j4MIPRtYONZSfMMJEHbX9r/iKaQW95EfCXxkkl5s20c1kF
 t+kfBeEigjiVcHyAYLVMX3iIWAvrxi5y3xe/TOebAX+zU0rD6naxNo7zKvClcrCzygDCSNFIObp
 +IKJEqkX/xDrY61mIkrZT3O+6ES71Mt5HHlJuJGlkEYpnFiTxnzzixajpY781muMLI5XA+uqs7p
 kC01AQRUiPxvQctZLK9GS/71PsEjDzz2eg/lH5V8tr13TzKGiA+oDDdVFhQbLoF3NsvNndEkHZC
 B/FemMX1US1rPkReTAVVWMBxQqrVmCu4Y9O2iMVpLIg5mFZY3yG3bfcqzqhdtBFB/i6zJPPZ3kH
 GZbUK481v1huBFx61m/cWbgJDhqUD7yDbh+2IaIwYDrivwwhrDtAJUVNu6iHz8VmFVEYh9CEVBC
 AeBZCdJya/hfzm57A/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050032
X-Rspamd-Queue-Id: B77DC20AD70
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,raspberrypi.com,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54561-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov9282.c | 79 ++++++++++++--------------------------
 1 file changed, 25 insertions(+), 54 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 98e0a0732ef7..22bea5cd6d14 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -922,13 +922,9 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
-/**
- * ov9282_start_streaming() - Start sensor stream
- * @ov9282: pointer to ov9282 device
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_start_streaming(struct ov9282 *ov9282)
+static int ov9282_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
 	const struct cci_reg_sequence bitdepth_regs[2][2] = {
 		{
@@ -939,16 +935,21 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW8},
 		}
 	};
+	struct ov9282 *ov9282 = to_ov9282(sd);
 	const struct ov9282_reg_list *reg_list;
 	int bitdepth_index;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(ov9282->dev);
+	if (ret)
+		return ret;
+
 	/* Write common registers */
 	ret = cci_multi_reg_write(ov9282->regmap, common_regs,
 				  ARRAY_SIZE(common_regs), NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write common registers");
-		return ret;
+		goto err_pm_put;
 	}
 
 	bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
@@ -956,7 +957,7 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 				  bitdepth_regs[bitdepth_index], 2, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write bitdepth regs");
-		return ret;
+		goto err_pm_put;
 	}
 
 	/* Write sensor mode registers */
@@ -965,14 +966,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write initial registers");
-		return ret;
+		goto err_pm_put;
 	}
 
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(ov9282->sd.ctrl_handler);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to setup handler");
-		return ret;
+		goto err_pm_put;
 	}
 
 	/* Start streaming */
@@ -980,60 +981,28 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 			OV9282_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to start streaming");
-		return ret;
+		goto err_pm_put;
 	}
 
 	return 0;
-}
 
-/**
- * ov9282_stop_streaming() - Stop sensor stream
- * @ov9282: pointer to ov9282 device
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_stop_streaming(struct ov9282 *ov9282)
-{
-	return cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
-			 OV9282_MODE_STANDBY, NULL);
+err_pm_put:
+	pm_runtime_put(ov9282->dev);
+
+	return ret;
 }
 
-/**
- * ov9282_set_stream() - Enable sensor streaming
- * @sd: pointer to ov9282 subdevice
- * @enable: set to enable sensor streaming
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
+static int ov9282_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
-	struct v4l2_subdev_state *state;
 	int ret;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable) {
-		ret = pm_runtime_resume_and_get(ov9282->dev);
-		if (ret)
-			goto error_unlock;
-
-		ret = ov9282_start_streaming(ov9282);
-		if (ret)
-			goto error_power_off;
-	} else {
-		ov9282_stop_streaming(ov9282);
-		pm_runtime_put(ov9282->dev);
-	}
-
-	v4l2_subdev_unlock_state(state);
-
-	return 0;
+	ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
+			OV9282_MODE_STANDBY, NULL);
 
-error_power_off:
 	pm_runtime_put(ov9282->dev);
-error_unlock:
-	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1165,7 +1134,7 @@ static const struct v4l2_subdev_core_ops ov9282_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops ov9282_video_ops = {
-	.s_stream = ov9282_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
@@ -1174,6 +1143,8 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
 	.get_fmt = ov9282_get_pad_format,
 	.set_fmt = ov9282_set_pad_format,
 	.get_selection = ov9282_get_selection,
+	.enable_streams = ov9282_enable_streams,
+	.disable_streams = ov9282_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ov9282_subdev_ops = {
-- 
2.43.0


