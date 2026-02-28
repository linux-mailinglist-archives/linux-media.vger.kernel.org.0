Return-Path: <linux-media+bounces-53828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEGXGSipomkn4wQAu9opvQ
	(envelope-from <linux-media+bounces-53828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:36:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CE41C1735
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C71013041B49
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EAC3ED114;
	Sat, 28 Feb 2026 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="rNz5Sekv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F312868B5;
	Sat, 28 Feb 2026 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267753; cv=fail; b=jEkDUIGexbqKIbwS66k5Jo50Hhq1pIbIZz+H2yPSt/MTIPfYBH+5VtG6+aGaj2DvZxqcQnobjU9tgUu0HYG3ZheWaFPtkopynBKabV/YrJGzvBuK4XGh4yu5oLc5aNwj2gsZYYOaIEz6r4nG2Eg57nk2w0DeXwzUydpreZsX4HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267753; c=relaxed/simple;
	bh=AOvUhaUav6mhbm+3slRJQnwhQ63CPvaVm7dg7jKZdjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YEjvlgEDRjz3UrCdyXu51q1eDWC0EKCKaatjFVhB1/igMBti2wKksjoCbQQkFSmmtsLrbZ4lIfA1GSB6a/vX+fmfQ3uB74kmnjX24Vk0Vww2sLX6rhAZI+WM+eMpdndV+ZWmVvaCJz+PGsXgWZMAjy2emKcdU41EyPstLD0AkjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=rNz5Sekv; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6SE3J2798058;
	Sat, 28 Feb 2026 08:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DwCSz7D/piN4rZP3QgTqxIuNVktVSUqSKSPHkdDWSnQ=; b=
	rNz5SekvwR4jgoP8wxYROG72gbxZPFlj1aXROjMJTcksKRGSSoPsVNelzNa/DbWS
	P5M8Ox/swRXln43nRQbRMpfJd9lPGk4/FmyUxau4R8L4TGeGYyts2S/VikaKAOKY
	YxOCSq47IqoClIqcao5QDSvsB0uyZ28cXMjNhIbTRB1yUXlsvJW29gB5n/oPKCn7
	CjtKCK+tYZ0mXyqvrkvsp9CHs9t+HDsTPyvlaSoFM3tdgccSSINDzO9RFyDELnpO
	cfadtkw5enwTgdeNeph/xaVc0h5z7QQp4NNyM8AFH2UsOYV/kySw6ZX9ueK4JEQ2
	JJtGNgVhmGOKLqFJpL4Gtw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4g81y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 08:34:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGI4VtkiFKe6iuhMvFXCxogCgI3t4gelqlVD/W9ygRZXiC0CRidHxpMQhpgGtzilzUIa0R8A8PoKgNaSYUGqk97RutBuxG9FQIHSri7xBEVzV2FLvpG4WMo3J8CxqGVSfFz+DJcitxDHdRgmFIjvX5zeVEpJva8OO66RC3fuPqBTkx1hvsnfNvRMQaTQrGeUQhHlUi528Bco90IJWyqpDeN0x+CjD2nrfgFk4C0B/SoTFASXqmvb5wU/jDxXk5VzlBcaa3Pw6TBmzeBEQ53eFamz4Mf/b1S+fxhQsRAYaD6MnZf4lqfs0g2lwFO15xuYWy3Igez0ryBqqGWW+54mkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwCSz7D/piN4rZP3QgTqxIuNVktVSUqSKSPHkdDWSnQ=;
 b=Sn/ux/y9VfbqSZLrLKIbGHqSI6Wt+OTqdVlwXyaxeDpEvMvqXzoq3jDwvYHQwd2948oLO+6uOBNLH692wSkZKI+tG1pJMJsZdBE1DKiFIP/SmxuYQkIQl/qSe48D6mPuKONTWsGuMaCeM0XDgVFci5A2q7KS+FsXqDrLJFFR8qsfZKugEQYTZ31nnlygS41O0w/rupfPQ+6YjTKldX4JyySDTUfW4bR4GLUhKaNzdZ5xjNsYrESoX9jggqlHfgKu1+c5rJzTLWCBFnNhYjaqaGBqdmYqu3/rsu2PHWOEDH4pbhjjx+Ii1IlkUKFoc88LNGVVTV5XIq/nJiv9KyLgVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Sat, 28 Feb
 2026 08:34:47 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 08:34:46 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, richard.leitner@linux.dev,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: i2c: ov9282: Switch to using the sub-device state lock
Date: Sat, 28 Feb 2026 16:34:00 +0800
Message-ID: <20260228083401.1007434-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228083401.1007434-1-xiaolei.wang@windriver.com>
References: <20260228083401.1007434-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0015.jpnprd01.prod.outlook.com (2603:1096:405::27)
 To DS4PPFD667CEBB6.namprd11.prod.outlook.com (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH3PPF67C992ECC:EE_
X-MS-Office365-Filtering-Correlation-Id: b1223634-a07b-467c-b41c-08de76a43ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	iE+v5fGBDzyuMl0+w3qySKMdbq16PB/XNYC2r3DCj+2aYBbXt9uqoqjxTY2WPTyKJSdjqsbtt+bhj2Y18Z/Omf/3/AzVm5gGmIq/WxxJMHK/BYEu/gvl6/3sH6bqgJ8mUEh+o7zR8V4V8eE900MGfdOuXAtKK6XKBfqihPwG7pmzFG1O0lL5WHYkWNtC0mUebt5t39rCbFlbFj4CuiAKPiX6Lh79T6V8s0jkKPlYvrZ/GLiddWbYJZazwW3S6LHf76P/Ket/8fMjjvQBUeu0j34Es/DDhcV56iRDL73+TnoLnU8HMwKZOcpkFzngAJa7MogC+0wrp3NytyMalUUdSTidDKcm61VnGakQLy3oMbjIyy2wX2axEeB8VS+L88BaKm6PMjDYlJX7GUVM25SRrDNG/n/VSi8cLpLnd515xiUCxdHFbXXVtkLOUhhDcsduceHbbhH3QVa3WPnnSqyKUZvOReHiacZXrMxFtiSBea6p9FwVUqLRCYxigmwprFjvMlz06wTiUAtImY7HQ6q99wsE24/yNo4jUKCKvhWGUr4Fya9oBLBif/iR6dUj2RkwYsGNGWXIdP3IQvxuYb8EZbWp3Otiz86nL1MY1z1WRlfKLW783rky7O1I774xrY5byU77t16xkSi2IaZvNvy0YuZGXz5ZCsu0rJ3bSAisQabRY72y4LSq/DLicOGOiEau9v5wizW3GVct0K6gcZ2SAmNcIBbp+X/gY9GZvrRHy76z//CzYsdFMTLcFaTJ4zCfuSwZAX7r4wbiU+crWxB6L5Y6Ak6DdBJWIfyAeawRbr0Ipx4rx0co04UrmIEKFbXN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4WB5hu+tOeLVQaId5pR1KKc+r3PiL5PXeFIx9NsHrVgtTRncGsJ/4iJmyv6e?=
 =?us-ascii?Q?qFuZ7bDmcmPn4gZuHNpDyC9r/0HfpXNxMt45Ptufhl3a6MTzBg3r67TEhmsg?=
 =?us-ascii?Q?VGX2ESIWl3wSaIvkiTdHhkl7ewFixhnsCrXCqv6z7GwJbrrw9JKVWqYNd/WN?=
 =?us-ascii?Q?TuhZuvaUR73Mb92f1XoAgpyQm9c5C5xQa1NI7iAJDRwy9iHor7ABnu3LNzag?=
 =?us-ascii?Q?1ZOyO48cCI3rnbfz9NGjPLNjN+REWLxV77G3eYHF0ssrxBSPaXHvnYOERet4?=
 =?us-ascii?Q?D4WBk61J4MNWJEs2U8ovEXzYfP23dASWGGiikeHC3MtlfWEngBltFArXp/gd?=
 =?us-ascii?Q?rKPoiUBhNLb7ZZ4IsOGjcozWynBy/EGGgGBBWRTQrkXjJ0gPEcsyG+dIec8U?=
 =?us-ascii?Q?tKzsux29bT50N4aqMp0kmBbXoTLNMlqx5rnwlJ8jfYANeB8ot3JYsG+p3H1a?=
 =?us-ascii?Q?hj94/1I1hey6ExPjvfyMbFsJPjFNckNu6Jr+pdiqrU0C3QoHn+3UxXgh/ket?=
 =?us-ascii?Q?tI/fEi2FxjrLWy4cIXkUU+m9R5m86H6y3tJZfqQfFzIxWAOn5WqzSx7EwGhx?=
 =?us-ascii?Q?3bXabb/VwzMFjNLw0l8Bqr+ffVp186Ai7GlO17VT4DIVQgP2Zw8L+MqEZRbH?=
 =?us-ascii?Q?jKQFb1audRSfJljJQKzTs07L4PkNwMRBU0mA98xn1FcP86CnE7mVP14nX6Hv?=
 =?us-ascii?Q?pii+WNsX9dvgs859O/jydTx9iXcRbU7KI9CMSgayyhlv5J1CZBOckHICn0tm?=
 =?us-ascii?Q?dq2IW3ereNmydMtdwbLFPEQKAcoWgK/O4L5S8okdItxvNJE2BjKbq8bZ2EuS?=
 =?us-ascii?Q?l4xwC0TBQyAdwOHrfjSP7masClcXfNFxtiToohlrHHk7G12N2WzRTs1w6+qX?=
 =?us-ascii?Q?o9/+aVgeuMWTJnj8UTo7bh0UxvylJbFFp5+RFxZ/aqKsXoftEEAZJRj9wVb9?=
 =?us-ascii?Q?wRdBfHEFyLIJ8rj8GMmVJ7c2QHFFwUH9B/rzAY6Jb/Mc+tA4+POsRbpKNg5J?=
 =?us-ascii?Q?5/TfAdJ8sESCFX0Ejr/o4ladbN8GfkYZ4PSXUyKOtfcsKZIjpZmHuEFL0DEE?=
 =?us-ascii?Q?IpNW9ck47Enw7xNXMgxSOzislV2+gLYk12Uu1ZnlAonDb3dLmLbULfsNLdym?=
 =?us-ascii?Q?ajnA1LHA47N3VDtwZjJP/F4k37CKCJqRMcYRuGW7TBPmhoGHNZwP5aUAZV9O?=
 =?us-ascii?Q?hJwodd/whUsKwqT8N1kLZMHNz9zTYei+9ZUPaFTl8PDDuzbTr7S5ZJ3CdqpZ?=
 =?us-ascii?Q?GJ/EmGX9OXHW6X2B9ZtO3dYCV15hx+YzZrdtS2lows2ab3N1gVwo4NQOG2GR?=
 =?us-ascii?Q?CNf6JXRraEIIu9PG9AP5rZUU+jwUmGenAFCXbUgFwkLL4wbX3JYxFMxLrTAC?=
 =?us-ascii?Q?k85WRw42cAZ8RABflTdI0YXLC0qEq1Ln+W8ecTomp143/uzin8S9ILwPyK7B?=
 =?us-ascii?Q?w3BBOL/NqpIlXhH7QEZ9S5eYBX9R8nGCsNuCayxEgoc0AiLMeq0jwagnjOn4?=
 =?us-ascii?Q?jP7S1AIXkdxNwvhQ+jn3y06kQ10HjohsTx9FLfl+fWeT14ZtOQzYOpbpO9BH?=
 =?us-ascii?Q?zquPoOr4xV5KGKHiVtFsgavjsUM5CGtWBY5pxHg38iz1ltuF5YMQJVp2j5Hn?=
 =?us-ascii?Q?GgLan+Wl+5GyvVqy4DeL00kW5YDt6GkHjtY50BMRSF8QK9gI8e7jprJL5v68?=
 =?us-ascii?Q?Wbyfe41Ztr+11ocMWPV8z4P3YBzekRGFtX3SmLmjEUsv2mwdjIwkzFJHX/ww?=
 =?us-ascii?Q?2OhzGgw/B8TZkzSYgCmyq+cuIZE6DRE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1223634-a07b-467c-b41c-08de76a43ac9
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 08:34:46.8919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1NrL4qdiPPPTC7E/UlYbfj3K51V77Ae27GrdvL5ZHppRxcSWqHIF4SC9X97BpQq/U9HPtgEYv94MLuI6P8m3nIdLod5TsK8a1dgu3WwJdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF67C992ECC
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a2a8a8 cx=c_pps
 a=0XF06BAwF4INxAelKEegqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=b-pzV9cxAM0HHkGdTPcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6ku5iSXo-Ad_3SAZRJQNPfjtZNIbAndP
X-Proofpoint-ORIG-GUID: 6ku5iSXo-Ad_3SAZRJQNPfjtZNIbAndP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3OCBTYWx0ZWRfX2HUnmLTUcrs8
 nIMoCTsp0JHNmTk3J19DcJvWBcCQZW1jRyGpOeqc2mDH6ModPjaVOPcQoDiE9WAxGDJ0/9AMGiA
 Jm0ciUXCTQxucI4DCr/ZSt5nTXwyeibjFSe2l8afDlHUeODXMMNZ5MDtyTGzs+9WRGCF1kqIHbH
 gSoWjLO+Nr7ggt8JKBFFxJWV0WgE+tNPIm9Atc6ZzmtNXVB5VBhASSg1BJhkRlG5vpP3FOSfhhu
 9fS6h/Xudd7Lf5NpkP3jVT/La7HPjnSykjxF5yvYOF4FvUefvajMrZ0uubzC2+jK01pi1gV6DQa
 0zhijQH93LRLljxSkXYikL/XBUddTpH6Hi8F8p85oYD/iDW/uXaFaSgPEZ9Vj1emChonxRxnwoa
 i0n0f90OckquEqm2Wr5t0RmAx9bJhk5KUMp++q6uF8vOrtnThz7TSM3DXM3keFWw33aKcS8JN6h
 E7GwRfM7PetVlUeVJnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,siliconsignals.io,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,linux.dev,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53828-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:mid,windriver.com:dkim,windriver.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95CE41C1735
X-Rspamd-Action: no action

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/ov9282.c | 48 ++++++++++++++------------------------
 1 file changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 75e41a0f588e..aa5a105136bf 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -220,7 +220,6 @@ struct ov9282 {
 	bool noncontinuous_clock;
 	const struct ov9282_mode *cur_mode;
 	u32 code;
-	struct mutex mutex;
 };
 
 static const s64 link_freq[] = {
@@ -794,8 +793,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
 
-	mutex_lock(&ov9282->mutex);
-
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
@@ -806,8 +803,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 				       fmt);
 	}
 
-	mutex_unlock(&ov9282->mutex);
-
 	return 0;
 }
 
@@ -828,8 +823,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 	u32 code;
 	int ret = 0;
 
-	mutex_lock(&ov9282->mutex);
-
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
 				      width, height,
@@ -855,8 +848,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 		}
 	}
 
-	mutex_unlock(&ov9282->mutex);
-
 	return ret;
 }
 
@@ -903,10 +894,8 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP: {
 		struct ov9282 *ov9282 = to_ov9282(sd);
 
-		mutex_lock(&ov9282->mutex);
 		sel->r = *__ov9282_get_pad_crop(ov9282, sd_state, sel->pad,
 						sel->which);
-		mutex_unlock(&ov9282->mutex);
 
 		return 0;
 	}
@@ -1018,9 +1007,10 @@ static int ov9282_stop_streaming(struct ov9282 *ov9282)
 static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
+	struct v4l2_subdev_state *state;
 	int ret;
 
-	mutex_lock(&ov9282->mutex);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(ov9282->dev);
@@ -1035,14 +1025,14 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(ov9282->dev);
 	}
 
-	mutex_unlock(&ov9282->mutex);
+	v4l2_subdev_unlock_state(state);
 
 	return 0;
 
 error_power_off:
 	pm_runtime_put(ov9282->dev);
 error_unlock:
-	mutex_unlock(&ov9282->mutex);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1284,9 +1274,6 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	if (ret)
 		return ret;
 
-	/* Serialize controls with sensor device */
-	ctrl_hdlr->lock = &ov9282->mutex;
-
 	/* Initialize exposure and gain */
 	lpfr = mode->vblank + mode->height;
 	ov9282->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
@@ -1408,13 +1395,10 @@ static int ov9282_probe(struct i2c_client *client)
 		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
 				     "Failed to init CCI\n");
 
-	mutex_init(&ov9282->mutex);
-
 	ret = ov9282_power_on(ov9282->dev);
-	if (ret) {
-		dev_err(ov9282->dev, "failed to power-on the sensor");
-		goto error_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(ov9282->dev, ret,
+				     "failed to power-on the sensor");
 
 	/* Check module identity */
 	ret = ov9282_detect(ov9282);
@@ -1447,10 +1431,10 @@ static int ov9282_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
+	ov9282->sd.state_lock = ov9282->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&ov9282->sd);
 	if (ret < 0) {
-		dev_err(ov9282->dev,
-			"failed to register async subdev: %d", ret);
+		ret = dev_err_probe(ov9282->dev, ret, "failed to init subdev\n");
 		goto error_media_entity;
 	}
 
@@ -1458,16 +1442,20 @@ static int ov9282_probe(struct i2c_client *client)
 	pm_runtime_enable(ov9282->dev);
 	pm_runtime_idle(ov9282->dev);
 
+	ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
+	if (ret < 0)
+		goto v4l2_subdev_cleanup;
+
 	return 0;
 
+v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(&ov9282->sd);
 error_media_entity:
 	media_entity_cleanup(&ov9282->sd.entity);
 error_handler_free:
 	v4l2_ctrl_handler_free(ov9282->sd.ctrl_handler);
 error_power_off:
 	ov9282_power_off(ov9282->dev);
-error_mutex_destroy:
-	mutex_destroy(&ov9282->mutex);
 
 	return ret;
 }
@@ -1481,9 +1469,9 @@ static int ov9282_probe(struct i2c_client *client)
 static void ov9282_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov9282 *ov9282 = to_ov9282(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -1491,8 +1479,6 @@ static void ov9282_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		ov9282_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-
-	mutex_destroy(&ov9282->mutex);
 }
 
 static const struct dev_pm_ops ov9282_pm_ops = {
-- 
2.43.0


