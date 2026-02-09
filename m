Return-Path: <linux-media+bounces-52427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM8WCvoAimluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:44:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E811211B
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6286C30680B0
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974323803E4;
	Mon,  9 Feb 2026 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iViBW58p"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010010.outbound.protection.outlook.com [52.101.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A7E3803C7;
	Mon,  9 Feb 2026 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651498; cv=fail; b=dtAGRZQrOrOpDd6RXegVT4pEf65UMcI5BzWpkJE0Q0W0phznkrk10Hpq48OUAI4N8gK77hA3YtdsKOxqTy5ZH2NpLiNZKAphMuJwZQM1B45061un5iB7b9fHzWgILtot1etb/HDMIlog3BHvXTg8flfy2x3FaF5CJYZStqVC8+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651498; c=relaxed/simple;
	bh=dXL7NAvfe/O3ktcZq5sxdD2ROauBlDTcEtvptTYULJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b5+3NcaLCS9qCXDa235n37NjYjLgqRyueU1Ybg0S3q5xWBJN0VIgb1dr0OJWaLIahjlCeRBR7LZz0uo3nKMjBhBwbU0rZRBx3YMEw8oq+JjKraJRO0vkHsV2g75bXgTFLFeXjs2hBpl1VwzXKfGtMt0CLCia3mkAyL8YnKehxE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=iViBW58p; arc=fail smtp.client-ip=52.101.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTHeuxowInSNPVZzbVHM0X9NdYIGbLXotOLgBUOT9WnojvQSd2NIWASeR2SrPAZEHMhcThYCqGlrphfvLvBsI3QM57f2rGzJyjkfmEr/hZSLe7BDcAjHsoBCHdEiBoz59tBMg4pOJ1tQ2brs9HWy87RD/RwDe1KOanu3ehoIoEnL3/m8/3ljyFQ3J54uJGDUE6xzQxNJCzydZLZmlZleTxAC0/4IvXw2XUeuT1WMljCL0/31ZdvXANuTp3hO+pA7Y5T3RtXNJ69zjjUr4SA7C9mnV3tMtRmpO59vnh2ZvhLTeb2Az6+pyRa6HsaKKasiKNTCe0Psz18j0l+Egi4Xpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVhYhKAuUbSQe9vBPJAxmsxW8zO0r/2yRXsqvXnwEYY=;
 b=klAJ7CUvFOE0J5fa4ZTAwNFjFNJosT3oxbRxiOFNSlCjhUffOlYqeWZxJAdcyCSVQGa6zbM7k05DV7fe9STFTIog51cYc77Zj3kW89vHNwK9+SS8gmWNzv0rRGsJJboWoIivLwpQzP+8EkWKiM4teV9i+czh4u919uhx61lebkBv6iVw3Ni62y+08vPeYSf6Kg9HDhXQlPj0czoGQlhr/uvXakx4uLwagS5Vws9aD0/bZpGOYk2y0sdWcKb0Tl8OlkjvJuTAPzsxbXqTbX+VNVhAOnDtfNTPenAHwCfxDXkrytfvTcYc9z7852A871SXQgRDshPIJedLDf0kEWMyTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVhYhKAuUbSQe9vBPJAxmsxW8zO0r/2yRXsqvXnwEYY=;
 b=iViBW58pwWyCixUgG1VycpZ0Xx1jUM+sYnh8V2VZzvXQXmzwrwbU1/Gf6owGfdUr1er3IZgNyjOpcFeD81njxC1GX+kE2gLTDyvTEYfTBa8kgQkh3e+E9EWc0rMkV4O62tu3Qu+tE6yyBaCgsWnywdc2u7RJ1anydzscZutDjfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB15890.jpnprd01.prod.outlook.com (2603:1096:405:2af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 15:38:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 15:38:13 +0000
Date: Mon, 9 Feb 2026 16:37:57 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rzg2l-cru: Skip ICnMC configuration when
 ICnSVC is used
Message-ID: <aYn_Vf1H1m1z44p2@tom-desktop>
References: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
 <b9aeabb34829b8e97559610a3d00ef67399a300c.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
 <aYnnRWR-5xOPSHOh@zed>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYnnRWR-5xOPSHOh@zed>
X-ClientProxiedBy: FR4P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB15890:EE_
X-MS-Office365-Filtering-Correlation-Id: c6fc9856-8343-4b41-13b3-08de67f13c25
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rDSVr58yzg3Q+hMTHASoFePgAiEVTWyJsuSFdBCVjd9Cg/KcrLOaMB/xNC2Y?=
 =?us-ascii?Q?0347wawC87VXAs31fTvjChOKc2Pt0ZEXbl3HKbjbF36iMRvTb6bXQvk/Vi/H?=
 =?us-ascii?Q?95eSteB+OLmXh4Pd0KQithtHr1RPj7YiaM1IBYtrQCI8HDk2FVXXw5OFBoMl?=
 =?us-ascii?Q?KAGsTbAWsOPd9SgeeSfhGfksV9gV7rnwMj5AAYQeRlxlklZSdDohVTrNC6ZI?=
 =?us-ascii?Q?qBy6yO8YJYzFEgzD/F03y16YjVecV9s4d7+3cSxmdcb0bZhprAOlFZdlrHuj?=
 =?us-ascii?Q?U2MEbzGN9TvW4p5dpDl2uTTjdbmvt57pGxpZ/vcguHn516maLWeYdyPugjdL?=
 =?us-ascii?Q?gBrKgx38UedwH3mdS/dDHqlX1uxbuAcIm0ZWcoM0d8/LtOUEGdR2WfQjLsD4?=
 =?us-ascii?Q?3Fdkb3C9GU+oXC9BxUplLO6SH5aAhVX57DbbsHVOvFbbHACInVGIxowvJNO0?=
 =?us-ascii?Q?xnxcKdLja7p7Bn2YGwNQ2b39ztyA22S6l27pHX834uhj2d8BMOJ32ZNoA+r8?=
 =?us-ascii?Q?FnBk7iOfZoB/7vuOpMU5UmhhNcsqdFl+TtbgTz2WEIqN9iuB68xAH/+zU9bO?=
 =?us-ascii?Q?5jbzkEQBFxlcc/JFdOZt+RWX++bFdrA0gNQUCygRg+rqpXPMZSsfXqPzQ8y+?=
 =?us-ascii?Q?sbgMKrsDD49VuyTCRMZMAli4RknPh5Q0YJ3Ndtwt0mRSzxb3upa7s47wVyMv?=
 =?us-ascii?Q?jZdwYvB80SvOkGrWvSGZWd9yCEsO76OexUm26Emf0yhqmlQcvBdZGoCzbJ3g?=
 =?us-ascii?Q?veEDailjP2P3k4VCPgeKjBsEeMMfGGByfVzBB7hCBakdKJU3vkYwUhQPFt/1?=
 =?us-ascii?Q?uKmSZ4Uwklu3x4mtlqNGlnaJFr1Qk5w+21b7uPr1no17nDatnwgZatdIHWFV?=
 =?us-ascii?Q?VVUT73NfBeVr6XMS5DA1fuvkEh/vC2nMcMZINpQNEa4nnLktlufNU3rDXXVn?=
 =?us-ascii?Q?bEJY9is4mSGn86LVNp7F5nkvnHlns91Mk6PeUZM+i14VZpcMp37fT7SNJro+?=
 =?us-ascii?Q?S91s3eVDQ26iMoP/lTJPNB9LwCfyF0x3aSW5eygIj8BcuYFLuyQKBa4fLxzp?=
 =?us-ascii?Q?R/yvypMTPhFUcxFzQxVWzK4A5/yDMnFhGKvccnt2bUy9p1SAAAppwNXarfa6?=
 =?us-ascii?Q?pXIzFP4QFe5rMqdjws3UIHBHYAzy6TIPq2Jev/H0l3CUB5nXdvha9Legfv5W?=
 =?us-ascii?Q?xL71k0A5a71U6585jvW7nqGWae2qaQ5asxw2MtnHnuyDl1gdoTGXOJO+KyCc?=
 =?us-ascii?Q?Sk51dIF6jJa4bZpNs1oELwgu1ptUfax4YMj8S21S6snhbP5WwmYixZVSiSsH?=
 =?us-ascii?Q?0Ezox3i4YfN5weVvLsjOr24+3NXszJwagm2MZJj+9O2XI3iiKhAJ9DLGW0wP?=
 =?us-ascii?Q?NY//E8EPR2knb/OHQVLZVIF3iIWWYvPBoaodm6Xvebp8WENHgePkos8z/u0n?=
 =?us-ascii?Q?rRPVuXDra7ZyWDlDP2NzRZeahxKbOKTJUm8XRgmtXq/BGlM4ldXlLWAg7AIi?=
 =?us-ascii?Q?wR6kGfMqu2yCDWF1kOdVAo2nd3N4n4Qofq/81NzNa7/vi8RrMQyLDjMlFtDP?=
 =?us-ascii?Q?cbFH1y1fM0x6lHtf518lNslKRnSpf3FZ8F46+DEC/n3zRHBdSfmEwVgGETfu?=
 =?us-ascii?Q?/haiPmTCEArDddOlwgUD3H4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?04VJnSusgwDmVI3VTYTIpwwMuF7Sd/84Bnq7bUqEXTnpJoxQk91D+RqLwAva?=
 =?us-ascii?Q?4QqN+Jvv1WcKApreOSPX0ElP2671Cxark35ukwXqKpAABET53a+77NvBPsAe?=
 =?us-ascii?Q?1owf+mIve7M+Kq+1G3cYmEuaZjZOlc14agtdOZuiHUX6aJjrvfh86ltZITgT?=
 =?us-ascii?Q?v31pxol6oEaH7u7CbtHXBnxkuDLK3w9JdvG+w1oQc+pI7PEkvgsjDz3KJukP?=
 =?us-ascii?Q?xGggIYed8bTrPUIZln9tP6qSDPvc+C80ZEaqMN/Be4F9Yj039kubgUMwkfH/?=
 =?us-ascii?Q?i325Npf0D59pyJK4Ln0XNsfAtdGrdZc9M/kATSyzfDO0FVbwY9u00kZJmDlb?=
 =?us-ascii?Q?VKIx6mKxF5tW20GC9xGUSH0rL+QLS6Pk7+PIa3pp7w2ErX7MJa81SQENSZo5?=
 =?us-ascii?Q?a8UZZuZCO2huaroL8cY6RzBFpOHVh7u7S74UrGBhLnrReDimHfAItSmKgnBs?=
 =?us-ascii?Q?fEJKV19wO5a4Q82/rqi3aUMan/hNPqBwe56p4mnCK6a6pJJJGlhhnYlR8VZ1?=
 =?us-ascii?Q?WvTd+Ln/CXjsBeYPE5TUtA96NurpVqI3dAtqwJuEa8uL/QUvowwN8zPOgJhy?=
 =?us-ascii?Q?BD1JTZOaCJCxfO9UwzuAbxqwKSbRSa73WSLwej3Bp1QY1K4mOYavvtrK2Jk+?=
 =?us-ascii?Q?x317NVy41Omk4faWG4/moh1JHSvy4rIlVlg9Fm5dI9kTMLtT1UOLXXyJJKSh?=
 =?us-ascii?Q?5yik4DukitVbbRphR70VTtKwSdP0mwhLyZb9ItnSw50e2YZLIdyK7gpWT/Tx?=
 =?us-ascii?Q?gGiIuZNgAF72Epi4oMi2Sn+2FBiLzN6rSTsNIPNQmQkBxdID/V5yk3jvW+Jt?=
 =?us-ascii?Q?Pi6+nG9V8f4YBnX+phwM9YxwGGSZI1mh/ZsSEoTuO50oETxV0caf/s4cUxev?=
 =?us-ascii?Q?6vTbCxtuC0fptXt/ZLn4vuoqS4542yX10BYA/lklTuny0brxZhb9saY4z7X4?=
 =?us-ascii?Q?4SjbU8m9rrTEKBxEPH3fggxNyV6ivCVrY/Lk1Fe8P0vWzQOdV3QgqepLjSNW?=
 =?us-ascii?Q?Vm6CmJEHLinKf4QD2sCQq1a0TiB5tIcmebWvgQLz426w0UExWs2MXp8V/KBn?=
 =?us-ascii?Q?bPg3xKKIhzJo2abnP+Y6vtzeHQREnpicxlk5398PZ3Ms6VytDoPbupnXRis9?=
 =?us-ascii?Q?QvsK6HBjsxRceE1P+W9lZDuwAf6GzLFNv+5mxn2F7Up/oPSkARlCLHicpDCo?=
 =?us-ascii?Q?FwobWLJMTbb8TwrwHIxpe5GWNPw2Ufp/7tbKUDo9y3vqjbB9nGxnd6oqCvzM?=
 =?us-ascii?Q?fFSbfIxhYfI8Hukpm6cxUIONd7/udL3FemoZ/co+ySFGtMRmp/0qMDr0Qvri?=
 =?us-ascii?Q?11EgcZcy8fq3LDWVROAkYw81pqBNyR+OzvZA92CXgq7FqeZv9cCi0PZfZ2Rf?=
 =?us-ascii?Q?LTwDbyyURjBJBjL9XDaRS2ZeGe/yYXerl9hBx96HRrLIJY/qyn4ThidUnwUD?=
 =?us-ascii?Q?FML/yDv/oaJXqKagzQ8dx4uFGV1rNkyLxNzp3u2/HYjVidymoqpFIWzvLq2q?=
 =?us-ascii?Q?qVOv+4B+2Mgum+v86DBbqvirRdAX2GCFvc4+qA3tTomNTkJ7wueq4aEVI4Dr?=
 =?us-ascii?Q?pP2/6AcjII+b9kVYLbd/D7X3F+Tdo7WhdupzBauYhZiYzAicV/LXXmFLHGqY?=
 =?us-ascii?Q?XWcLczLZ2zh5JYjX+3025lQEUpAP9M8Mn6Fk2Hg/XyrTbkt+2gNztmQsrUub?=
 =?us-ascii?Q?XmI6apV3Ns6nl4dTQyjTK7CXDe07O4HQvV70Hpxqhm5MBgsO6xMy6OJ+svEn?=
 =?us-ascii?Q?uytIa20Jf6dW6ywFfsKRGs8D9yntPG41ym3/mi7sR50KimW2fpCv?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6fc9856-8343-4b41-13b3-08de67f13c25
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:38:13.0949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/4tRmdZ1BYAOVcsqZ/95mLzCTpqrC//rZwlGqmsFSzPsZXeuHMJ/VVPNiqE2QNFV1NPArHjHDAVOTyEJyHF7xaAR0+x4v5ms9D6kwXvdzg6E1RGr0tdKMbKb+YREIkB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15890
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52427-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,kernel.org,ideasonboard.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 781E811211B
X-Rspamd-Action: no action

Hi Jacopo,
Thanks for your review!

On Mon, Feb 09, 2026 at 03:21:59PM +0100, Jacopo Mondi wrote:
> Hi Tommaso
> 
> On Tue, Dec 30, 2025 at 06:09:15PM +0100, Tommaso Merciai wrote:
> > When the CRU is configured to use ICnSVC for virtual channel mapping,
> > as on the RZ/{G3E, V2H/P} SoC, the ICnMC register must not be
> > programmed.
> 
> I see a difference indeed between the [G3E, V2H/P] and the G2L version
> of the IP in the presence of the VCSEL[1:0] field in register ICnMC.
> 
> On [G3E, V2H/P] the selection of which virtual channel to accept
> doesn't go through VCSEL[1:0] in ICnMC but a dedicated register ICnSVC
> is provided for that purpose. So far so good.
> 
> >
> > Return early after setting up ICnSVC to avoid overriding the ICnMC
> > register, which is not applicable in this mode.
> >
> > This prevents unintended register programming when ICnSVC is enabled.
> >
> > Fixes: 3c5ca0a48bb0 ("media: rzg2l-cru: Drop function pointer to configure CSI")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 162e2ace6931..480e9b5dbcfe 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -268,6 +268,8 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> >  		rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
> >  		rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
> >  				ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> > +
> > +		return;
> >  	}
> >
> >  	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
> 
> However, the rest of the rzg2l_cru_csi2_setup() doesn't only program
> the virtual channel filtering through ICnMC (which should be skept for
> G3E, V2H/P) but also programs DT filtering in INF[5:0] of register
> ICnIPMC_C0 which seems to be available on G3E and V2H/P as well.
> 
> Section "9.2.4.3.6 VC/Data Type Selector (for Image Processing)" of
> the chip manual (V2H/P) prescribes:
> 
> Only one data type can be handled by each SVC and the data types are
> selected in the ICnIPMC_C0 to 3.INF[5:0] registers.

You are correct, thanks.
I miss that part.

Maybe we can go for:

static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
				 const struct rzg2l_cru_ip_format *ip_fmt,
				 u8 csi_vc)
{
	const struct rzg2l_cru_info *info = cru->info;
	u32 icnmc = ICnMC_INF(ip_fmt->datatype);

	if (cru->info->regs[ICnSVC]) {
		rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
		rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
				ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
	} else {
		/* Set virtual channel CSI2 */
		icnmc |= ICnMC_VCSEL(csi_vc);
	}

	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
	rzg2l_cru_write(cru, info->image_conv, icnmc);
}

?

> 
> And this patch makes the driver skips that part.
> Has this patch been tested ? It breaks my V2H/P setup:
> 
>  rzg2l-cru 16010000.cru1: Invalid MB address 0x0 (out of range)

I've not seeing that on RZ/G3E.
Thanks for sharing.


Kind Regards,
Tommaso

> 
> 
> > --
> > 2.43.0
> >
> >

