Return-Path: <linux-media+bounces-34372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B59AD2666
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 21:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 372AB3A952F
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 19:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEC921CC4A;
	Mon,  9 Jun 2025 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oJ1Zk/JA"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013042.outbound.protection.outlook.com [40.107.162.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D911FCF41;
	Mon,  9 Jun 2025 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749496134; cv=fail; b=vCQLiNK4d0wsm+34v5aAwLEAFMz6CGi3ureDbxqDKCG2cQN6gq/CqF9rDNHev91nU4knyS4CNXQ17iwThLj0X9phZVF5aehxDR34sKHjIa/7mUQbpJ4x/DB1vODCKLvs/hJ6dT0H2B+iE/iIoNdWkmyiOrn8n90RUgAah8AJuHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749496134; c=relaxed/simple;
	bh=8d88BSIPZ5bUkoROXSZCvoOK6A0q35aLzL7EdRK0mB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iU+WRhkbiuxG3HsKapcHDmCq2v4ll+f6VVGK+xlW/uuJPjokOakuSSISE2MCVrQAxpKW2hGUXwd7s9KXb+pekfpK8O8Ig2om3YTEXowoLcJQAg1j/hVc80wo1Nebk23y6ExTCNrAVTjUQqcSxDyrCkDELNMooK2yvo6tfliue3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oJ1Zk/JA; arc=fail smtp.client-ip=40.107.162.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iz1tX1fj18NpE5OTkdfy4Xi309sW147Sf4UgopVJfaFvgPd8Kam7cuXa43kDz3CTDwOUkSKVvye1IBjlizi9UVnJ3XkidER1yu2MXtgCCaQswlJq1SZphIm/Jx8vNrMaYWitfcjgA54mLhujw9zAz76kn8DR9A0qjY3dJX0mCUKJonq3ZrkJwYyQLVnjXaj0hqopE/yh9Dy71d6IcomujexX83Hhm3oJ45HNtG2wZ5JeYuEXD7WhgsON4zRzWCMIHAKUxvwHLc2QVGj52hSfmhj39WReT+8bA8vJttXo9xLLuLDDJfCxs/gjSiBizNB/R7tJT0hGLIpWtwdSPsTaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwuBqZ3ScOTc7P/B1EA7rH8yujtM1nFFniCosvlmKkc=;
 b=BkOQpqB+65rXCEbSi7RXgk8sS558aK87DTj0/n/y3c4lvoYmEylQfc38roPpS2RUeonjZs486kiMBsayY4fHoZE07bJZLHeEPyRQFUPJUrRJJTvVthYObUTrsFuTB2ApIjQMWR27Tb+PrfUAMkCY4DIkE8JRiKKCliQtsM9jmN0fjsIaxNUTF6hNrhpsEQFN/J3bVpQY5Zn1AKfe704Ad+ZDlD/oAAZ3xSNk0mavOaUBTjI7EtsXqt3nI3OTTcERDIJ6BP7+GxPKuZ1gB8tLA8oO/RcUw7+AWptpXxmGEfl1a2/qYA36fKmlGE7ins5i2By4ByL2g2/ohSy65gnxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwuBqZ3ScOTc7P/B1EA7rH8yujtM1nFFniCosvlmKkc=;
 b=oJ1Zk/JAtEthy+U2/GU2MwQILjIFEMkcfaf9IZNEoVY0OqVm0B5zZEsUfIAyXm9Hb/EwiVIgdEZ7QXXuinxJEnO1h9rUXG/eveG5dXvF0TAFqycadXRojVv4JBBlPLXeZdaMRMQHXx9SEzVmrF2c36K127ly8gNqWZizxmi59JRo/1dIVyUmA9FN0Ul7VfZpCXgrq+M/v1O87U+lCi5pya5XfqNxikUDCdhSR0vuBAfeWvHE0MdM9ztipnYAGhCpMOB9QAB5a7K+tiTPe1W5dRWuvCsazv+fpUyW8wrufMgh47oEIdcRKXEkg9LU/rP/uEKN4q2sFDMNZpfTogTggA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7714.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 19:08:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 19:08:48 +0000
Date: Mon, 9 Jun 2025 15:08:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
Message-ID: <aEcxN7xClLfp0STx@lizhi-Precision-Tower-5810>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
 <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
 <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
 <20250609182033.GA11428@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609182033.GA11428@pendragon.ideasonboard.com>
X-ClientProxiedBy: BY5PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc66c45-64dc-4bfa-0c6a-08dda789108f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NVdhYXR3ZjZjTGhqZEVWWkRVRHJHdWlQbHlRaEh5d2VseDF3TzNHcHdaaGd3?=
 =?utf-8?B?dW8wcExiajlIYVB0bTFxeHF1MC8ydjJ2SlRSQmlXcmd5M0YreGxkQ29YMDZH?=
 =?utf-8?B?TXlGN0N5N1NkK0ZhOXYyWFNLc2dGMHJVNmFEb3N2dk54K2tqZWhjbHdMTm5i?=
 =?utf-8?B?S3krcUdFc0tVWSsyak1QVmRQcUVlMHVvYktaSWJES0c0Y0Z6Q3pheXlVTjNK?=
 =?utf-8?B?d2R1T0VKSVAyZUlZajMyenVXZENSa2xCZnNQL3N0ZHNheDRUaDZDdGVaejhH?=
 =?utf-8?B?YWVSMkVzVG1SM0ViVGxsU0c5STkrMGg5QXpnREc3UXFPeEc0cm9SR0pUVDQ4?=
 =?utf-8?B?UU8wak8yUXNCcVJXSVlBZFlmNnNyNFUrN2kvUUp4Z2tReFZlTitFWk43dGpT?=
 =?utf-8?B?OGNqbTV1Zys0V2dpLzRnSWdaQzBXRS9Oc0Nkby8zdGtvdGtWcmpmc05ueS96?=
 =?utf-8?B?RFRCWERUWWtKbzRBTnljSVU1ZXhaMVN1TGxKZGZoNmtWZ0J3a3V0WFJtVFdD?=
 =?utf-8?B?UDFUWi9lQnk2NUxUaVZVNTlNbXhlT1RITDFYa1lwUlhuLzNDM0dDK1QvZ0p6?=
 =?utf-8?B?NCsrOGlTdWlTc0U4bHRXN1F2T2J3d2dLRW9sa001NWgzVlhET05COEdveEFu?=
 =?utf-8?B?R1plZW1uam95bWp2KzBFZHFOMEFvVGh3RVd4cWtpRjhpLzlkbGdXbkRqTUpl?=
 =?utf-8?B?N3l4N0NrQmV0SVZtV2tGQUdxWDl6NHFOcXc3STZZTjRNc3B1dFRVVzdiTHNv?=
 =?utf-8?B?d3phV1hxaUl2YkFuZDRDczB6YmR3SEZjRjhvdnFHcHRFZi9NNk8zR2U3THlh?=
 =?utf-8?B?YklBYnY4c3pIK3F0bWt6bFVUVENaQXdjaGpmcVB3dFR4SW1NUnp5RVorai9N?=
 =?utf-8?B?WWFpVWRLZmVEVFpTeUJLYytYNEF4WU0vMWZxNWg4MmppbmJGTC9IZ2VOaEFE?=
 =?utf-8?B?VnZjS052V0pId1hVQ212VDA5OWhxTlQ1Zkx6SzFvL3BhZlBTSmk3R0NObXNp?=
 =?utf-8?B?aTlFc1JUL1dLNkdNWVBnS2VxVmtaamYzVnZLaFNwZ2tjYjNHNDR1K28wMVox?=
 =?utf-8?B?NVQrYTNSOTlUY0ZBVDZLdm5VaExnRG9rUitKSTRoZ2hJQmMvRzFSZk52bVhn?=
 =?utf-8?B?MlR5WHZQMlNKbk9WVFRHV1E1cVlPc3pCUmVaQU9MNmtYOEFJRmpabDE0MVc5?=
 =?utf-8?B?OWVCZERQV0VacTJJZit2VkFWM0QyUGtQb3RVeE5WNFpSU1hiQTV3bVZwNDNz?=
 =?utf-8?B?cnhaUG45bE1kUjdCZVMwUGNZc2o4TWVtZXgrUmNiWDBka1VpVUxWVVBFeXNk?=
 =?utf-8?B?U0t1ZnZxaWlCQ0hlNlQxL0JwZmhuOERrVVdRNklTSVlWMWU4UXI5YThIWnNV?=
 =?utf-8?B?VmFNelhJUGVtM0diYzY2UmZra0U5ZTlhTFltdjdleGEzZmlNSFc0d2ZzVUdr?=
 =?utf-8?B?aDcxYzlZQ0FYS3lOaHIxSGZZSU9nRU1IbGpOWHRNazJaT3RNREJ0WXBFSlNZ?=
 =?utf-8?B?MFVqKyszREQxNlBKRU1ma3N1cTRvZHBVTy9YbUY4VS9lT1o0RkpMeVcrd3BW?=
 =?utf-8?B?TlZHUjhYMGYyNTQ2RVg0aDZPZ3lFalE3MllWVkFaWjlTZi9vRmZQc25QbjRw?=
 =?utf-8?B?OTJGQTNXZk9OYUZUVHg1ODBIQ1MxV0ptSHBYcDdvcllLdW9NQXBEMEdLUE12?=
 =?utf-8?B?WG00dmdOaFlTc3FkZXVFSUJrdHF6L242ZHQ3T3lvMUNIbkJPdHNmQk1ZNU00?=
 =?utf-8?B?aGhMM2FpY01LclNkQ1IwaFVNQkQ3ZU0xNHo0OVRQZ1RzR0RyWjl0RVhnSUkx?=
 =?utf-8?B?NUtPVzRIV0JUblAybzhIZmpUYkZnaWwzS0lubjZkQnVmWE9LZURSOGNhSnpE?=
 =?utf-8?B?V2ZuQ1Y5ajZzL2dtWmwwRkNGZENRdG1XYlVEYkxtaG1NTkVWRVlkMlVCeFFw?=
 =?utf-8?B?d2JUMkY2UmduMjhHV2xMNnRsZUovRG81YU1RQkdrZ0oveGVpSmR5OG53ajZp?=
 =?utf-8?B?UG0xRCs1RllRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eEZ1NmRlNUlYeENFaUtMZnJZck5vQTJlZ29wVDZrZkk2VTlmNlpCN1dBQTh1?=
 =?utf-8?B?OWRQNzlZSHZrZ2UxUUttWEZCM0d4Mkd6d0taaFJQVlFmWGYwQVNXQmlFVUxC?=
 =?utf-8?B?cm1BWEwwTnVxcytaT0ZjOThzWFk1Q3BUUUxBdW1MTFRVaDVicWpQMVNSMjEx?=
 =?utf-8?B?SkhxdWY3MSs5clBzT3FpSW55R0ZzdS9kTFRDeTV2dk4xN01XWVVYM2NGRlEr?=
 =?utf-8?B?d29TYlV0VFpLd3ZhZE9lMzVWMjJ6U0U3UE8wNTlyYk5WV0h6eDlWay9QcUNX?=
 =?utf-8?B?d2FSLyttdmk3elljUVRiM0I4bVEzMTdVM2ZqK0VlczZDK1JrelRyemZSdW9W?=
 =?utf-8?B?c25rS0s3Qkt2OGhwTTlKY3pIQ2FhNGplOThCRDhKWU90cTVtT2E4NFZlckxz?=
 =?utf-8?B?R2xNUDk3a3dvaWwweHVUVEVQVENDMWtKNUJvM2JZYW4vOHhub1dJZDNFWFdJ?=
 =?utf-8?B?U1lOdnBxMlc2cjM2dHR4OXFTWTBMaFhHUnl2OUxYb1d1Z0w4UnJGUGJlQXdv?=
 =?utf-8?B?Wk5vanRYRitYNEtYSDB6UnZkR1pWYjVQZzBvRDVKb3JqaG8wMFlrWG92ci9P?=
 =?utf-8?B?YzFFcGdONmdnSVR3NCtSUVUrbE9icUFPRVlEUFpKQWlQMVhZQnQrRk9ZRDFD?=
 =?utf-8?B?ZVFzdkZuelZ4dzBLTnJnTVJyVldHSmZwZXdvbVVHMlRQZy9Fdy9HRDNpZ0RM?=
 =?utf-8?B?MUVsT2NWOHRvMzYrdnVyUWQwbW9sSExURndtNXEyOWVVSkhZb0lsaWw0Vzll?=
 =?utf-8?B?SkNQQUdwbDBqdU50VHhmSGFBL1g1dzUwczN3TmRNUUNGSU4wR3pzYUs3VnBI?=
 =?utf-8?B?ZVJXUjBOUlNtc2ZkMGtXVmlLS2wwVUE4ZEVhZFdhbDQzK283VkpqVWRFUDhG?=
 =?utf-8?B?Zzl6Sk16M1hoMXpmaGtLdGNrZ29TUDdQSHpWOHZWdmFvaWJpREpmemxtSExz?=
 =?utf-8?B?MFRqTXd4UnFQakxoazRPbWswMDBER091d2toeStpTzN5REY2WDJEbEgwVFVX?=
 =?utf-8?B?QzVsSmxLZ1hoZnVjUEpBMWxQcUw2eW9TWHV0RjlXNURpSlIzbHhqblNZUFRq?=
 =?utf-8?B?V1QxcEduR1Rkd2NyV3VocjByc2VXUm5UL3lJbmYxdW1nRWEwbTVrSnc0TjlO?=
 =?utf-8?B?Zk00aEZVQmN1L2NoQ2FCY0UyNC9uLzZqS2ZZUXJKdnhBTDVUa1RYWnBpS0R0?=
 =?utf-8?B?WGV6M1dWWTlDdElJaHJsQnhZNHlzZnBTdGNuSTZlNkJBTUc0Z1hwUE5kYnZj?=
 =?utf-8?B?bWNXdllmQTdsOU5rWXVqazlQdHNZSWxlRUVsU09LQnd0QUUxSVFNVk5YUFdX?=
 =?utf-8?B?TGpVQ09NZTYza0pnNE9kbmtUTVpZMFduWU9NanhlVEo2d0ZYMkQzM3VUekR1?=
 =?utf-8?B?SWpaUFQ4RHN3eUJ3Vmp0OUZYanQwY3pJaHN2eVZxUXU4QVYyV2NBdFJJU1JH?=
 =?utf-8?B?VGpwU2hhVUN0eGRkY1I1cWE5UEZ4djRlOGt3cGtLajBVUjhEdkExZzRUMENN?=
 =?utf-8?B?WkNUZ0hYdlZCTXk0a015TXUwMVJXZnZZODNQS29janhyZjhpMnlIQ2ZxcE8x?=
 =?utf-8?B?NExUZVRXUzJqUlNsVEJyOWpkY3F1RlIwVzFzNTNKWHdmZjRqWW5PU3FqZ0p2?=
 =?utf-8?B?RDRFTUZoN0tNMDU1ZkJySnB1aWNCSkl6VmJmNmRQZDR0eTRvRDRWTitsenhW?=
 =?utf-8?B?Slk2ZzBiSitSWFJqUXNLSyt5SkpOYUd4RndUME12QXFta1pGaVhLTTEvNWtO?=
 =?utf-8?B?U2kra3VrNzJwT05HbnJJWkpHZ2VadXZRaXcrWDlQc29Wd1pRUjhxeDhDVFNZ?=
 =?utf-8?B?T3BzYmkyRkJYZS95cCs2Uzh3MGJDSk1YK25KVm5KNTdJdDZ2K05NUTcvcDE2?=
 =?utf-8?B?cG9uc2xsN1ArdUZ5MDRxMDVYdUUrRmIwdi9UUElDeTdKdHpzWHF5ZWtubjVj?=
 =?utf-8?B?TWNxb1lUQnRCbERzWngyaVBsc0hqY053RG0xOEtJN3FVajJJSWRQcFJpOWdo?=
 =?utf-8?B?a3Q2amxQcVVUeXRYTWpocGlpL2IrTVBOSlR6K29RRGh2WjhJNUpYQTVJMDRt?=
 =?utf-8?B?Qk4zejFjMk9peWRNRWlobzhsT1pQZmFVazRYWk92RkVIOUw3WkJCbVN6akdx?=
 =?utf-8?Q?eny0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc66c45-64dc-4bfa-0c6a-08dda789108f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 19:08:48.7973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2UuY3mSQ4bhOuNuV2bkvJUbnX/NBWzXKz4xTQUAfUPheQtluNSuY9Ie66F/N0+/06fKu7KV24J4E3BxISb/Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7714

On Mon, Jun 09, 2025 at 09:20:33PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 09, 2025 at 12:53:48PM -0500, Adam Ford wrote:
> > On Mon, Jun 9, 2025 at 10:32 AM Frank Li wrote:
> > > On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> > > > The CSI-2 receiver can be instantiated with up to four output channels.
> > > > This is an integration-specific property, specify the number of
> > > > instantiated channels through a new fsl,num-channels property. The
> > > > property is optional, and defaults to 1 as only one channel is currently
> > > > supported by drivers.
> > > >
> > > > The only known SoC to have more than one channel is the i.MX8MP. As the
> > > > binding examples do not cover that SoC, don't update them.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > index db4889bf881e..41ad5b84eaeb 100644
> > > > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > @@ -68,6 +68,13 @@ properties:
> > > >      default: 166000000
> > > >      deprecated: true
> > > >
> > > > +  fsl,num-channels:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: Number of output channels
> > > > +    minimum: 1
> > > > +    maximum: 4
> > > > +    default: 1
> > > > +
> > >
> > > Look like it is fixed value for each compabiable string, So it is not
> > > suitable for adding new property. It should be in driver data of each
> > > compatible strings.
> > >
> > > I met similar case before. DT team generally don't agree on add such
> > > property, unless there are two instances in the same chip, which have
> > > difference channel number.
> >
> > If the DT changes are rejected, can the number of channels be added to
> > the data structure inside mipi_csis_of_match?  We have compatibles for
> > 8mm and imx7.  If we add an imx8mp compatible we could add a reference
> > to the number of channels.
>
> I thought about it, and decided to add a new property because the number
> of channels is really a synthesis time configuration parameter, and
> could differ between different CSIS instances in the same SoC.

Need add such information at binding doc's commit message, ideally provide
an example for it.

Frank
>
> > > >    ports:
> > > >      $ref: /schemas/graph.yaml#/properties/ports
> > > >
>
> --
> Regards,
>
> Laurent Pinchart

